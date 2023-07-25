<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class IndexController extends CI_Controller {

	public function __construct(){
		parent::__construct();
		$this->load->model('IndexModel');
		$this->load->library('cart');
		$this->load->library('email');
		$this->data['category'] = $this->IndexModel->getCategoryHome();
		$this->data['category_blog'] = $this->IndexModel->getCategoryBlogHome();
		$this->data['sliders'] = $this->IndexModel->getSliderHome();
		$this->data['brand'] = $this->IndexModel->getBrandHome();
		$this->load->library("pagination");
	}

	public function contact()
	{
		$this->load->view('pages/template/header',$this->data);
		$this->load->view('pages/template/slider',$this->data);
		$this->load->view('pages/contact');
		$this->load->view('pages/template/footer');
	}

	public function notfound()
	{
		$this->load->view('pages/template/header',$this->data);
		//$this->load->view('pages/template/slider');
		$this->load->view('pages/404');
		$this->load->view('pages/template/footer');
	}

	public function blog($id)
	{
		$this->load->view('pages/template/header',$this->data);
		//$this->load->view('pages/template/slider');
		$this->data['title'] = $this->IndexModel->getBlogTitle($id);
		$this->data['post'] = $this->IndexModel->getBlogById($id);
		$this->load->view('pages/blog',$this->data);
		$this->load->view('pages/template/footer');
	}

	public function send_mail($to_email,$title,$message)
	{
		$config = array();
		$config['protocol'] = 'smtp';
		$config['smtp_host'] = 'ssl://smtp.gmail.com';
		$config['smtp_user'] = 'vtuananhh@gmail.com';
		$config['smtp_pass'] = 'mbswrebytfufyjrs'; //mbswrebytfufyjrs
		$config['smtp_port'] = 465;
		$config['charset'] = 'utf-8';
		$this->email->initialize($config);
		$this->email->set_newline("\r\n");
		//config mail
		$this->email->from('vtuananhh@gmail.com', 'Gửi mail thành công');
		$this->email->to($to_email);

		//$this->email->cc('another@another-example.com'); //gửi 1 bản copy cho một hoặc nhìu người
		//$this->email->bcc('them@their-example.com'); //gửi 1 bản copy cho một hoặc nhìu người | sẽ không thấy thông tin người gửi người nhận

		$this->email->subject($title);
		$this->email->message($message);

		$this->email->send();
	}

	public function send_contact()
	{
		$data = [
			'name' => $this->input->post('name'),
			'email' => $this->input->post('email'),
			'phone' => $this->input->post('phone'),
			'address' => $this->input->post('address'),
			'note' => $this->input->post('note')
		];
		$result = $this->IndexModel->insertContact($data);
		if($result){
			$to_email = $this->input->post('email');
			$title = "Thông tin liên hệ của khách: ".$this->input->post('name');
			$message = "Thông tin liên hệ tại đây.Ghi chú: ".$this->input->post('note');
			$this->send_mail($to_email,$title,$message);
		}
		$this->session->set_flashdata('success','Thêm thông tin liên hệ thành công.');
		redirect(base_url('contact'));
	}

	public function confirm_checkout()
	{
		$this->form_validation->set_rules('email', 'Email*', 'trim|required', ['required'=>'Bạn nên điền %s']);
		$this->form_validation->set_rules('phone', 'Phone*', 'trim|required', ['required'=>'Bạn nên điền %s']);
		$this->form_validation->set_rules('name', 'Name*', 'trim|required', ['required'=>'Bạn nên điền a %s']);
		$this->form_validation->set_rules('address', 'Address*', 'trim|required', ['required'=>'Bạn nên điền %s']);
		if ($this->form_validation->run() == TRUE)
		{
			$email = $this->input->post('email');
			$shipping_method = $this->input->post('shipping_method');
			$phone = $this->input->post('phone');
			$address = $this->input->post('address');
			$name = $this->input->post('name');
			$data = array(
				'name'=>$name,
				'email'=>$email,
				'method'=>$shipping_method,
				'address'=>$address,
				'phone'=>$phone
			);
			$this->load->model('LoginModel');

			$result = $this->LoginModel->NewShipping($data);

			if($result){
				//order
				$order_code = rand(00,9999);
				$data_order = array(
					'order_code'=>$order_code,
					'ship_id'=>$result,
					'status'=>1
				);
				$insert_order = $this->LoginModel->insert_order($data_order);
				//order details
				foreach ($this->cart->contents() as $items){
					$data_order_details = array(
						'order_code'=>$order_code,
						'product_id'=>$items['id'],
						'quantity'=> $items['qty']
					);
					$insert_order_details = $this->LoginModel->insert_order_details($data_order_details);
				}

				$this->session->set_flashdata('success', 'Đặt hàng thành công,chúng tôi sẽ liên hệ trong thời gian sớm nhất.');
				$this->cart->destroy();
				//gửi mail đơn hàng đã đặt
				$to_email = $email;
				$title = "Đặt hàng tại web abc.com thành công.";
				$message = "Chúng tôi sẽ liên hệ với bạn trong thời gian sớm nhất";
				//send mail
				$this->send_mail($to_email,$title,$message);
				redirect(base_url('/thanks'));
				}else{
					$this->session->set_flashdata('error', 'Xác nhận thanh toán đơn hàng thất bại');
					redirect(base_url('/checkout'));
				}
		}else{
			$this->checkout();
		}
	}
	public function index()
	{
		//echo Carbon\Carbon::now('Asia/Ho_Chi_Minh');// mui gio chuan
		//echo Carbon\Carbon::tomorrow('Asia/Ho_Chi_Minh');
		//custom config link
		// $config = array();
    // $config["base_url"] = base_url() .'/phan-trang'; 
		// $config['total_rows'] = ceil($this->IndexModel->countAllProduct()); //đếm tất cả sản phẩm //8 //hàm ceil làm tròn phân trang 
		// $config["per_page"] = 3; //từng trang 3 sản phẩn
    // $config["uri_segment"] = 2; //lấy số trang hiện tại
		// $config['use_page_numbers'] = TRUE; //trang có số
		// $config['full_tag_open'] = '<ul class="pagination">';
		// $config['full_tag_close'] = '</ul>';
		// $config['first_link'] = 'First';
		// $config['first_tag_open'] = '<li>';
		// $config['first_tag_close'] = '</li>';
		// $config['last_link'] = 'Last';
		// $config['last_tag_open'] = '<li>';
		// $config['last_tag_close'] = '</li>';
		// $config['cur_tag_open'] = '<li class="active"><a>';
		// $config['cur_tag_close'] = '</a></li>';
		// $config['num_tag_open'] = '<li>';
		// $config['num_tag_close'] = '</li>';
		// $config['next_tag_open'] = '<li>';
		// $config['next_tag_close'] = '</li>';
		// $config['prev_tag_open'] = '<li>';
		// $config['prev_tag_close'] = '</li>';
		// //end custom config link
		// $this->pagination->initialize($config); //tự động tạo trang
		// $this->page = ($this->uri->segment(2)) ? $this->uri->segment(2) : 0; //current page active 
		// $this->data["links"] = $this->pagination->create_links(); //tự động tạo links phân trang dựa vào trang hiện tại
		// $this->data['allproduct_pagination'] = $this->IndexModel->getIndexPagination($config["per_page"], $this->page);
		//pagination

		$this->data['allproduct'] = $this->IndexModel->getAllProduct();
		//sidebar
		$this->data['items_categories'] = $this->IndexModel->ItemsCategories();

		$this->load->view('pages/template/header',$this->data);
		$this->load->view('pages/template/slider');
		$this->load->view('pages/home',$this->data);
		$this->load->view('pages/template/footer');
	}
	public function category($id)
	{
		//custom config link
		// $this->data['slug'] = $this->IndexModel->getCategorySlug($id);
		// $config = array();
    // $config["base_url"] = base_url() .'danh-muc'.'/'.$id.'/'.$this->data['slug']; 
		// $config['total_rows'] = ceil($this->IndexModel->countAllProductByCate($id)); //đếm tất cả sản phẩm //8 //hàm ceil làm tròn phân trang 
		// $config["per_page"] = 3; //từng trang 3 sản phẩn
    // $config["uri_segment"] = 2; //lấy số trang hiện tại
		// $config['use_page_numbers'] = TRUE; //trang có số
		// $config['full_tag_open'] = '<ul class="pagination">';
		// $config['full_tag_close'] = '</ul>';
		// $config['first_link'] = 'First';
		// $config['first_tag_open'] = '<li>';
		// $config['first_tag_close'] = '</li>';
		// $config['last_link'] = 'Last';
		// $config['last_tag_open'] = '<li>';
		// $config['last_tag_close'] = '</li>';
		// $config['cur_tag_open'] = '<li class="active"><a>';
		// $config['cur_tag_close'] = '</a></li>';
		// $config['num_tag_open'] = '<li>';
		// $config['num_tag_close'] = '</li>';
		// $config['next_tag_open'] = '<li>';
		// $config['next_tag_close'] = '</li>';
		// $config['prev_tag_open'] = '<li>';
		// $config['prev_tag_close'] = '</li>';
		// //end custom config link
		// $this->pagination->initialize($config); //tự động tạo trang
		// $this->page = ($this->uri->segment(2)) ? $this->uri->segment(2) : 0; //current page active 
		// $this->data["links"] = $this->pagination->create_links(); //tự động tạo links phân trang dựa vào trang hiện tại
		// $this->data['allproductbycate_pagination'] = $this->IndexModel->getCatePagination($id,$config["per_page"], $this->page);
		//pagination
		//get min max price
		$this->data['min_price'] = $this->IndexModel->getMinProductPrice($id);
		$this->data['max_price'] = $this->IndexModel->getMaxProductPrice($id);
		//filter
		if(isset($_GET['kytu'])){
			$kytu = $_GET['kytu'];
			$this->data['category_product'] = $this->IndexModel->getCategoryKytuProduct($id,$kytu);
		}elseif(isset($_GET['gia'])){
			$gia = $_GET['gia'];
			$this->data['category_product'] = $this->IndexModel->getCategoryPriceProduct($id,$gia);
		}elseif(isset($_GET['from']) && $$_GET['to']){
			$from_price = $_GET['from'];
			$to_price = $_GET['to'];

			$this->data['category_product'] = $this->IndexModel->getCategoryPriceRangeProduct($id,$from_price,$to_price);
		}
		else {
			$this->data['category_product'] = $this->IndexModel->getCategoryProduct($id);
		}

		//$this->data['category_product'] = $this->IndexModel->getCategoryProduct($id);
		$this->data['title'] = $this->IndexModel->getCategoryTitle($id);
		$this->config->config["pageTitle"] = $this->data['title'];
		$this->load->view('pages/template/header',$this->data);
		// $this->load->view('pages/template/slider');
		$this->load->view('pages/category',$this->data);
		$this->load->view('pages/template/footer');
	}
	public function category_blog($id)
	{
		//custom config link
		// $this->data['slug'] = $this->IndexModel->getCategoryBlogSlug($id);
		// $config = array();
    // $config["base_url"] = base_url() .'danh-muc-tin'.'/'.$id.'/'.$this->data['slug']; 
		// $config['total_rows'] = ceil($this->IndexModel->countAllProductByCate($id)); //đếm tất cả sản phẩm //8 //hàm ceil làm tròn phân trang 
		// $config["per_page"] = 3; //từng trang 3 sản phẩn
    // $config["uri_segment"] = 2; //lấy số trang hiện tại
		// $config['use_page_numbers'] = TRUE; //trang có số
		// $config['full_tag_open'] = '<ul class="pagination">';
		// $config['full_tag_close'] = '</ul>';
		// $config['first_link'] = 'First';
		// $config['first_tag_open'] = '<li>';
		// $config['first_tag_close'] = '</li>';
		// $config['last_link'] = 'Last';
		// $config['last_tag_open'] = '<li>';
		// $config['last_tag_close'] = '</li>';
		// $config['cur_tag_open'] = '<li class="active"><a>';
		// $config['cur_tag_close'] = '</a></li>';
		// $config['num_tag_open'] = '<li>';
		// $config['num_tag_close'] = '</li>';
		// $config['next_tag_open'] = '<li>';
		// $config['next_tag_close'] = '</li>';
		// $config['prev_tag_open'] = '<li>';
		// $config['prev_tag_close'] = '</li>';
		// //end custom config link
		// $this->pagination->initialize($config); //tự động tạo trang
		// $this->page = ($this->uri->segment(2)) ? $this->uri->segment(2) : 0; //current page active 
		// $this->data["links"] = $this->pagination->create_links(); //tự động tạo links phân trang dựa vào trang hiện tại
		// $this->data['allproductbycate_pagination'] = $this->IndexModel->getCatePagination($id,$config["per_page"], $this->page);
		//end of pagination
		

		//$this->data['category_blog'] = $this->IndexModel->selectCategoryBlogByIdHome($id);
		$this->data['title'] = $this->IndexModel->getCategoryBlogTitle($id);
		$this->data['category_blog_with_id'] = $this->IndexModel->getCategoryBlogById($id);
		$this->config->config["pageTitle"] = $this->data['title'];
		$this->load->view('pages/template/header',$this->data);
		// $this->load->view('pages/template/slider');
		$this->load->view('pages/category_blog',$this->data);
		$this->load->view('pages/template/footer');
	}
	public function brand($id)
	{
		//custom config link
		// $this->data['slug'] = $this->IndexModel->getBrandSlug($id);
		// $config = array();
    // $config["base_url"] = base_url() .'thuong-hieu'.'/'.$id.'/'.$this->data['slug']; 
		// $config['total_rows'] = ceil($this->IndexModel->countAllProductByBrand($id)); //đếm tất cả sản phẩm //8 //hàm ceil làm tròn phân trang 
		// $config["per_page"] = 1; //từng trang 3 sản phẩn
    // $config["uri_segment"] = 3; //lấy số trang hiện tại
		// $config['use_page_numbers'] = TRUE; //trang có số
		// $config['full_tag_open'] = '<ul class="pagination">';
		// $config['full_tag_close'] = '</ul>';
		// $config['first_link'] = 'First';
		// $config['first_tag_open'] = '<li>';
		// $config['first_tag_close'] = '</li>';
		// $config['last_link'] = 'Last';
		// $config['last_tag_open'] = '<li>';
		// $config['last_tag_close'] = '</li>';
		// $config['cur_tag_open'] = '<li class="active"><a>';
		// $config['cur_tag_close'] = '</a></li>';
		// $config['num_tag_open'] = '<li>';
		// $config['num_tag_close'] = '</li>';
		// $config['next_tag_open'] = '<li>';
		// $config['next_tag_close'] = '</li>';
		// $config['prev_tag_open'] = '<li>';
		// $config['prev_tag_close'] = '</li>';
		// //end custom config link
		// $this->pagination->initialize($config); //tự động tạo trang
		// $this->page = ($this->uri->segment(3)) ? $this->uri->segment(3) : 0; //current page active 
		// $this->data["links"] = $this->pagination->create_links(); //tự động tạo links phân trang dựa vào trang hiện tại
		// $this->data['allproductbybrand_pagination'] = $this->IndexModel->getBrandProductPagination($id,$config["per_page"], $this->page);
		//pagination

		$this->data['brand_product'] = $this->IndexModel->getBrandProduct($id);
		$this->data['title'] = $this->IndexModel->getBrandTitle($id);
		$this->config->config["pageTitle"] = $this->data['title'];
		$this->load->view('pages/template/header',$this->data);
		// $this->load->view('pages/template/slider');
		$this->load->view('pages/brand',$this->data);
		$this->load->view('pages/template/footer');
	}
	public function product($id)
	{
		$this->data['product_details'] = $this->IndexModel->getProductDetails($id);
		$this->data['list_comments'] = $this->IndexModel->getListComments($id);

		foreach($this->data['product_details'] as $key =>$val){
			$category_id = $val->category_id;
		}

		$this->data['product_related'] = $this->IndexModel->getProductRelated($id,$category_id);
		$this->data['title'] = $this->IndexModel->getProductTitle($id);
		$this->config->config["pageTitle"] = $this->data['title'];

		$this->load->view('pages/template/header',$this->data);
		// $this->load->view('pages/template/slider');
		$this->load->view('pages/product_details',$this->data);
		$this->load->view('pages/template/footer');
	}
	public function thanks()
	{
		$this->config->config["pageTitle"] = 'Thanks đã đặt hàng';
		if(isset($_GET['partnerCode'])) {
			$data_momo = [
				'partnerCode' => $_GET['partnerCode'],
				'orderId' => $_GET['orderId'],
				'requestId' => $_GET['requestId'],
				'amount' => $_GET['amount'],
				'orderInfo' => $_GET['orderInfo'],
				'orderType' => $_GET['orderType'],
				'transId' => $_GET['transId'],
				'payType' => $_GET['payType'],
				'signature' => $_GET['signature']
			];
			//lưu data momo
			$result = $this->IndexModel->insertMoMo($data_momo);
		}elseif(isset($_GET['vnp_Amount'])){
			$data_vnpay = [
				'vnp_Amount' => $_GET['vnp_Amount'],
				'vnp_BankCode' => $_GET['vnp_BankCode'],
				'vnp_BankTranNo' => $_GET['vnp_BankTranNo'],
				'vnp_CardType' => $_GET['vnp_CardType'],
				'vnp_OrderInfo' => $_GET['vnp_OrderInfo'],
				'vnp_PayDate' => $_GET['vnp_PayDate'],
				'vnp_ResponseCode' => $_GET['vnp_ResponseCode'],
				'vnp_TmnCode' => $_GET['vnp_TmnCode'],
				'vnp_TransactionNo' => $_GET['vnp_TransactionNo'],
				'vnp_TransactionStatus' => $_GET['vnp_TransactionStatus'],
				'vnp_TxnRef' => $_GET['vnp_TxnRef'],
				'vnp_SecureHash' => $_GET['vnp_SecureHash']
			];
			//lưu data vnpay
			$result = $this->IndexModel->insertVNpay($data_vnpay);
		}
		$this->load->view('pages/template/header',$this->data);
		// $this->load->view('pages/template/slider');
		$this->load->view('pages/thanks');
		$this->load->view('pages/template/footer');
	}
	public function cart()
	{
		$this->config->config["pageTitle"] = 'Giỏ hàng của bạn';
		$this->load->view('pages/template/header',$this->data);
		// $this->load->view('pages/template/slider');
		$this->load->view('pages/cart');
		$this->load->view('pages/template/footer');
	}
	public function checkout()
	{
		
		if($this->session->userdata('LoggedInCustomer') && $this->cart->contents()){
			$this->config->config["pageTitle"] = 'Thanh toán đơn hàng';
			$this->load->view('pages/template/header',$this->data);
			// $this->load->view('pages/template/slider');
			$this->load->view('pages/checkout');
			$this->load->view('pages/template/footer');
	}	else{
			redirect(base_url().'gio-hang');
	}
	}
	public function add_to_card()
	{
		$product_id = $this->input->post('product_id');
		$quantity = $this->input->post('quantity');
		$this->data['product_details'] = $this->IndexModel->getProductDetails($product_id);
		//dat hang
		foreach($this->data['product_details'] as $key =>$pro)
		{
			$cart = array(
			'id'      => $pro->id,
			'qty'     => $quantity,
			'price'   => $pro->price,
			'name'    => $pro->title,
			'options' => array('image' => $pro->image,'in_stock'=>$pro->quantity)
			);
		}
		$this->session->set_flashdata('success', 'Thêm giỏ hàng thành công.');
		$this->cart->insert($cart);
		// if($this->cart->contents()>0){
		// 	foreach($this->cart->contents() as $items){
		// 		if($items['id']==$product_id){
		// 			$this->session->set_flashdata('success', 'Sản phẩm đã có trong giỏ hàng,vui lòng cập nhật số lượng.');
		// 			redirect(base_url().'gio-hang','refresh');
		// 		}else{
		// 			foreach($this->data['product_details'] as $key =>$pro) {
		// 				//check số lượng còn của sản phẩm
		// 				//25 còn > 5
		// 				if($pro->quantity > $quantity){
		// 					$cart = array(
		// 						'id'      => $pro->id,
		// 						'qty'     => $quantity,
		// 						'price'   => $pro->price,
		// 						'name'    => $pro->title,
		// 						'options' => array('image' => $pro->image,'in_stock'=>$pro->quantity)
		// 					);
		// 				}else{
		// 					$this->session->set_flashdata('error', 'Số lượng đặt vượt quá số lượng tồn,vui lòng đặt ít hơn.');
		//					redirect($_SERVER['HTTP_REFERER']);
		// 				}
		// 			}
		// 		}
		// 	}
		// 	$this->session->set_flashdata('success', 'Thêm giỏ hàng thành công.');
		// 	$this->cart->insert($cart);
		redirect(base_url().'gio-hang','refresh');
		//  }
			
			
	}
	public function update_cart_item()
	{
		$rowid = $this->input->post('rowid');
		$quantity = $this->input->post('quantity');
		foreach($this->cart->contents() as $items) {
			if($rowid == $items['rowid']){

				if($quantity < $items['options']['in_stock']){
					$cart = array(
					'rowid' => $rowid,
					'qty'     => $quantity,
					);
				}elseif($quantity > $items['options']['in_stock']){
					$cart = array(
					'rowid' => $rowid,
					'qty'     => $items['options']['in_stock']
					);
				}

			}
		}
		$this->cart->update($cart);
		// redirect(base_url().'gio-hang','refresh');
		redirect($_SERVER['HTTP_REFERER']);
	}
	public function delete_all_cart()
	{
		$this->cart->destroy();
		redirect(base_url().'gio-hang','refresh');
	}
	public function delete_item($rowid)
	{
		$this->cart->remove($rowid);
		redirect(base_url().'gio-hang','refresh');
	}
	public function login()
	{
		$this->config->config["pageTitle"] = 'Đăng nhập | Đăng ký';
		$this->load->view('pages/template/header');
		// $this->load->view('pages/template/slider');
		$this->load->view('pages/login');
		$this->load->view('pages/template/footer');
	}
	public function login_customer()
	{
		$this->form_validation->set_rules('email', 'Email*', 'trim|required', ['required'=>'Bạn nên điền %s']);
		$this->form_validation->set_rules('password', 'Password*', 'trim|required', ['required'=>'Bạn nên điền a %s']);
		if ($this->form_validation->run() == TRUE)
		{
			$email = $this->input->post('email');
			$password = md5($this->input->post('password'));
			$this->load->model('LoginModel');
			$result = $this->LoginModel->checkLoginCustomer($email,$password);

			if(count($result)>0){
				$session_array = [
					'id' => $result[0]->id,
					'username' => $result[0]->name,
					'email' => $result[0]->email,	
				];
				$this->session->set_userdata('LoggedInCustomer',$session_array);
				$this->session->set_flashdata('success', 'Login Successfully');
				redirect(base_url('/checkout'));
				}else{
					$this->session->set_flashdata('error', 'Wrong Email or Password or Not Active please login again');
					redirect(base_url('/dang-nhap'));
				}
			}
		else
		{
			$this->login();
		}
	}
	public function dang_ky()
	{
		$this->form_validation->set_rules('email', 'Email*', 'trim|required', ['required'=>'Bạn nên điền %s']);
		$this->form_validation->set_rules('password', 'Password*', 'trim|required', ['required'=>'Bạn nên điền %s']);
		$this->form_validation->set_rules('phone', 'Phone*', 'trim|required', ['required'=>'Bạn nên điền %s']);
		$this->form_validation->set_rules('name', 'Name*', 'trim|required', ['required'=>'Bạn nên điền %s']);
		$this->form_validation->set_rules('address', 'Address*', 'trim|required', ['required'=>'Bạn nên điền %s']);

		if ($this->form_validation->run() == TRUE)
		{
			$email = $this->input->post('email');
			$password = md5($this->input->post('password'));
			$phone = $this->input->post('phone');
			$address = $this->input->post('address');
			$name = $this->input->post('name');
			$token = rand(0000,9999); //5646
			$date_created = Carbon\Carbon::now('Asia/Ho_Chi_Minh');
			$data = array(
				'name'=>$name,
				'email'=>$email,
				'password'=>$password,
				'address'=>$address,
				'phone'=>$phone,
				'token'=>$token,
				'date_created'=>$date_created,
			);
			$this->load->model('LoginModel');
			$result = $this->LoginModel->NewCustomer($data);

			if($result){
				// kích hoạt mới vào được trang login
					$session_array = array(
						'username' => $name,
						'email' => $email	
					);
					$this->session->set_userdata('LoggedInCustomer',$session_array);
					$this->session->set_flashdata('success', 'Login Successfully');
				// kích hoạt mới vào được trang login
				//send mail
				// $fullurl = base_url().'xac-thuc-dang-ky/?token='.$token.'$email='.$email;

				// $title = "Đăng ký website abc.com thành công";
				// $message = "Click vào đường link để kích hoạt tài khoản:".$fullurl;
				// $to_email = $email;
				// $this->send_mail($to_email,$title,$message);
				redirect(base_url('/checkout'));
				}else{
					$this->session->set_flashdata('error', 'Wrong Email or Password please login again');
					redirect(base_url('/dang-nhap'));
				}
			}
		else
		{
			$this->login();
		}
	}

	public function xac_thuc_dang_ky()
	{
		if(isset($_GET['email']) && $_GET['token'])
		{
			$token = $_GET['token'];
			$email = $_GET['email'];
		}
		$data['get_customer'] = $this->IndexModel->getCustomersToken($email);
		// 	update customer
		$now = Carbon\Carbon::now('Asia/Ho_Chi_Minh')->addMinutes(5); //lấy time + 5p hiệu lực
		$token_rand = rand(0000,9999);
		foreach($data['get_customer'] as $key => $val){
			if($token!=$val->token){
				$this->session->set_flashdata('success', 'Đường link kích hoạt thất bại');
				redirect(base_url('/dang-nhap'));
			}
			$data_customer = [
				'status' => 1,
				'token'=>$token
			];
			if($val->date_created < $now){
				$active_customer = $this->IndexModel->activeCustomersToken($email,$data_customer);
				$this->session->set_flashdata('success', 'Kích hoạt user thành công,mời bạn đăng nhập');
				redirect(base_url('/dang-nhap'));
			}else{
				$this->session->set_flashdata('success', 'Kích hoạt user thất bại,vui lòng đăng ký lại');
				redirect(base_url('/dang-nhap'));
			}

		}

	}

	
	public function dang_xuat()
	{
		$this->session->unset_userdata('LoggedInCustomer');
		$this->session->set_flashdata('success', 'Logout Successfully');
		redirect(base_url('/dang-nhap'));
	}
	public function tim_kiem()
	{
		if(isset($_GET['keyword']) && $_GET['keyword']!=''){
			$keyword=$_GET['keyword'];
		}
		//custom config link
		$config = array();
    $config["base_url"] = base_url() .'tim-kiem'; 
		$config['reuse_query_string'] = TRUE;
		$config['total_rows'] = ceil($this->IndexModel->countAllProductByKeyword($keyword)); //đếm tất cả sản phẩm //8 //hàm ceil làm tròn phân trang 
		$config["per_page"] = 3; //từng trang 3 sản phẩn
    $config["uri_segment"] = 2; //lấy số trang hiện tại
		$config['use_page_numbers'] = TRUE; //trang có số
		$config['full_tag_open'] = '<ul class="pagination">';
		$config['full_tag_close'] = '</ul>';
		$config['first_link'] = 'First';
		$config['first_tag_open'] = '<li>';
		$config['first_tag_close'] = '</li>';
		$config['last_link'] = 'Last';
		$config['last_tag_open'] = '<li>';
		$config['last_tag_close'] = '</li>';
		$config['cur_tag_open'] = '<li class="active"><a>';
		$config['cur_tag_close'] = '</a></li>';
		$config['num_tag_open'] = '<li>';
		$config['num_tag_close'] = '</li>';
		$config['next_tag_open'] = '<li>';
		$config['next_tag_close'] = '</li>';
		$config['prev_tag_open'] = '<li>';
		$config['prev_tag_close'] = '</li>';
		//end custom config link
		$this->pagination->initialize($config); //tự động tạo trang
		$this->page = ($this->uri->segment(2)) ? $this->uri->segment(2) : 0; //current page active 
		$this->data["links"] = $this->pagination->create_links(); //tự động tạo links phân trang dựa vào trang hiện tại
		$this->data['allproductbykeyword_pagination'] = $this->IndexModel->getSearchPagination($keyword,$config["per_page"], $this->page);
		//pagination

		//$this->data['product'] = $this->IndexModel->getProductByKeyword($keyword);
		$this->data['title'] = $keyword;
		$this->config->config["pageTitle"] = 'Tìm kiếm từ khóa:'.$keyword;
		$this->load->view('pages/template/header',$this->data);
		// $this->load->view('pages/template/slider');
		$this->load->view('pages/timkiem',$this->data);
		$this->load->view('pages/template/footer');
	}

	public function comment_send()
	{
		$data = [
			'name' => $this->input->post('name_comment'),
			'product_id' => $this->input->post('pro_id'),
			'email' => $this->input->post('email_comment'),
			'comment' => $this->input->post('comment'),
			'stars' => $this->input->post('star_rating'),
			'status' => 0,
			'dated' => Carbon\Carbon::now('Asia/Ho_Chi_Minh')
		];
		$result = $this->IndexModel->insertComment($data);
		if($result){
			echo 'success';
		}else{
			echo 'failed';
		}
	}

}
