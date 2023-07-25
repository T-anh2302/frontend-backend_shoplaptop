<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class BlogsController extends CI_Controller {
	public function checkLogin(){
		if(! $this->session->userdata('LoggedIn'))
		redirect(base_url('/login'));	
	}

	public function index()
	{
			$this->checkLogin();
			$this->load->view('admin_template/header');
			$this->load->view('admin_template/navbar');

      $this->load->model('BlogsModel');
      $data['category_blog'] =  $this->BlogsModel->selectCategoryBlog();

			$this->load->view('category_blog/list',$data);
			$this->load->view('admin_template/footer');
	}
	public function create()
	{
			$this->checkLogin();
			$this->load->view('admin_template/header');
			$this->load->view('admin_template/navbar');
			$this->load->view('category_blog/create');
			$this->load->view('admin_template/footer');
	}
  public function store()
  {
    $this->form_validation->set_rules('title', 'Title*', 'trim|required', ['required'=>'Bạn nên điền %s']);
    $this->form_validation->set_rules('slug', 'Slug*', 'trim|required', ['required'=>'Bạn nên điền %s']);
		$this->form_validation->set_rules('description', 'Decription*', 'trim|required', ['required'=>'Bạn nên điền %s']);
		if ($this->form_validation->run() == TRUE)
    {
        //upload image
        $ori_filename = $_FILES['image']['name']; //hinh123.jpg
        $new_name = time()."".str_replace(' ','-',$ori_filename); //hinhanh123 + 125467.jpg
        $config = [
          'upload_path' => './uploads/category_blog',
          'allowed_types' => 'gif|jpg|png|jpeg',
          'file_name' => $new_name,
        ];

        $this->load->library('upload', $config);
        if ( ! $this->upload->do_upload('image'))
        {
          $error = array('error' => $this->upload->display_errors());
          $this->load->view('admin_template/header');
          $this->load->view('admin_template/navbar');
          $this->load->view('category_blog/create',$error);
          $this->load->view('admin_template/footer');
        }else{
          $cate_filename = $this->upload->data('file_name');
          $data = [
            'title' => $this->input->post('title'),
            'description' => $this->input->post('description'),
            'slug' => $this->input->post('slug'),
            'status' => $this->input->post('status'),
            'image' => $cate_filename
          ];
          $this->load->model('BlogsModel');
          $this->BlogsModel->insertCategoryBlog($data);
          $this->session->set_flashdata('success','Add Success Blogs');
          redirect(base_url('category_blog/list'));
        }
        
    }else{
      $this->create();
    }
  }
  public function edit($id)
  {
    $this->checkLogin();
    $this->load->view('admin_template/header');
    $this->load->view('admin_template/navbar');

    $this->load->model('BlogsModel');
    $data['category_blog'] =  $this->BlogsModel->selectCategoryBlogById($id);

    $this->load->view('category_blog/edit',$data);
    $this->load->view('admin_template/footer');
  }
  public function update($id)
  {
    $this->form_validation->set_rules('title', 'Title*', 'trim|required', ['required'=>'Bạn nên điền %s']);
    $this->form_validation->set_rules('slug', 'Slug*', 'trim|required', ['required'=>'Bạn nên điền %s']);
		$this->form_validation->set_rules('description', 'Decription*', 'trim|required', ['required'=>'Bạn nên điền %s']);
		if ($this->form_validation->run() == TRUE)
    {
      if(!empty($_FILES['image']['name'])){
        //upload image
        $ori_filename = $_FILES['image']['name']; //hinh123.jpg
        $new_name = time()."".str_replace(' ','-',$ori_filename); //hinhanh123 + 125467.jpg
        $config = [
          'upload_path' => './uploads/category_blog',
          'allowed_types' => 'gif|jpg|png|jpeg',
          'file_name' => $new_name,
        ];

        $this->load->library('upload', $config);
        if ( ! $this->upload->do_upload('image'))
        {
          $error = array('error' => $this->upload->display_errors());
          $this->load->view('admin_template/header');
          $this->load->view('admin_template/navbar');
          $this->load->view('category_blog/list',$error);
          $this->load->view('admin_template/footer');
        }else{
          $cate_filename = $this->upload->data('file_name');
          $data = [
            'title' => $this->input->post('title'),
            'description' => $this->input->post('description'),
            'slug' => $this->input->post('slug'),
            'status' => $this->input->post('status'),
            
            'image' => $cate_filename
          ];
          
        }
      }else{
        $data = [
        'title' => $this->input->post('title'),
        'description' => $this->input->post('description'),
        'slug' => $this->input->post('slug'),
        'status' => $this->input->post('status'),
        ];
      }
      $this->load->model('BlogsModel');
      $this->BlogsModel->updateCategoryBlog($id,$data);
      $this->session->set_flashdata('success','Update Success Category Blog');
      redirect(base_url('category_blog/list'));
    }else{
      $this->edit($id);
    }
  }
  public function delete($id)
  {
    $this->load->model('BlogsModel');
    $this->BlogsModel->deleteCategoryBlog($id);
    $this->session->set_flashdata('success','Delete Success Category Blog');
    redirect(base_url('category_blog/list'));
  }
}
