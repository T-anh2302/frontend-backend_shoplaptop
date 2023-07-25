<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class PostsController extends CI_Controller {
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
      $data['posts'] =  $this->BlogsModel->selectPosts();

			$this->load->view('posts/list',$data);
			$this->load->view('admin_template/footer');
	}
	public function create()
	{
			$this->checkLogin();
			$this->load->view('admin_template/header');
			$this->load->view('admin_template/navbar');
      $this->load->model('BlogsModel');
      $data['category_blog'] =  $this->BlogsModel->selectCategoryBlog();
			$this->load->view('posts/create',$data);
			$this->load->view('admin_template/footer');
	}
  public function store()
  {
    $this->form_validation->set_rules('title', 'Title*', 'trim|required', ['required'=>'Bạn nên điền %s']);
    $this->form_validation->set_rules('short_content', 'Short Content*', 'trim|required', ['required'=>'Bạn nên điền %s']);
    $this->form_validation->set_rules('slug', 'Slug*', 'trim|required', ['required'=>'Bạn nên điền %s']);
		$this->form_validation->set_rules('content', 'Content*', 'trim|required', ['required'=>'Bạn nên điền %s']);
		if ($this->form_validation->run() == TRUE)
    {
        //upload image
        $ori_filename = $_FILES['image']['name']; //hinh123.jpg
        $new_name = time()."".str_replace(' ','-',$ori_filename); //hinhanh123 + 125467.jpg
        $config = [
          'upload_path' => './uploads/posts',
          'allowed_types' => 'gif|jpg|png|jpeg',
          'file_name' => $new_name,
        ];

        $this->load->library('upload', $config);
        if ( ! $this->upload->do_upload('image'))
        {
          $error = array('error' => $this->upload->display_errors());
          $this->load->view('admin_template/header');
          $this->load->view('admin_template/navbar');
          $this->load->view('post/create',$error);
          $this->load->view('admin_template/footer');
        }else{
          $cate_filename = $this->upload->data('file_name');
          $data = [
            'title' => $this->input->post('title'),
            'short_content' => $this->input->post('short_content'),
            'content' => $this->input->post('content'),
            'slug' => $this->input->post('slug'),
            'status' => $this->input->post('status'),
            'category_blog_id' => $this->input->post('category_blog_id'),
            'image' => $cate_filename,
            'date_created' =>Carbon\Carbon::now('Asia/Ho_Chi_Minh')
          ];
          $this->load->model('BlogsModel');
          $this->BlogsModel->insertPost($data);
          $this->session->set_flashdata('success','Add Success Post');
          redirect(base_url('post/list'));
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
    $data['category_blog'] =  $this->BlogsModel->selectCategoryBlog();
    $data['post'] =  $this->BlogsModel->selectPostById($id);

    $this->load->view('posts/edit',$data);
    $this->load->view('admin_template/footer');
  }
  public function update($id)
  {
    $this->form_validation->set_rules('title', 'Title*', 'trim|required', ['required'=>'Bạn nên điền %s']);
    $this->form_validation->set_rules('short_content', 'Short Content*', 'trim|required', ['required'=>'Bạn nên điền %s']);
    $this->form_validation->set_rules('slug', 'Slug*', 'trim|required', ['required'=>'Bạn nên điền %s']);
		$this->form_validation->set_rules('content', 'Content*', 'trim|required', ['required'=>'Bạn nên điền %s']);
		if ($this->form_validation->run() == TRUE)
    {
      if(!empty($_FILES['image']['name'])){
        //upload image
        $ori_filename = $_FILES['image']['name']; //hinh123.jpg
        $new_name = time()."".str_replace(' ','-',$ori_filename); //hinhanh123 + 125467.jpg
        $config = [
          'upload_path' => './uploads/posts',
          'allowed_types' => 'gif|jpg|png|jpeg',
          'file_name' => $new_name,
        ];

        $this->load->library('upload', $config);
        if ( ! $this->upload->do_upload('image'))
        {
          $error = array('error' => $this->upload->display_errors());
          $this->load->view('admin_template/header');
          $this->load->view('admin_template/navbar');
          $this->load->view('post/list',$error);
          $this->load->view('admin_template/footer');
        }else{
          $cate_filename = $this->upload->data('file_name');
          $data = [
            'title' => $this->input->post('title'),
            'short_content' => $this->input->post('short_content'),
            'content' => $this->input->post('content'),
            'slug' => $this->input->post('slug'),
            'status' => $this->input->post('status'),
            'category_blog_id' => $this->input->post('category_blog_id'),
            'image' => $cate_filename,
            'date_created' =>Carbon\Carbon::now('Asia/Ho_Chi_Minh')
          ];
          
        }
      }else{
        $data = [
          'title' => $this->input->post('title'),
          'short_content' => $this->input->post('short_content'),
          'content' => $this->input->post('content'),
          'slug' => $this->input->post('slug'),
          'status' => $this->input->post('status'),
          'category_blog_id' => $this->input->post('category_blog_id'),
          'date_created' =>Carbon\Carbon::now('Asia/Ho_Chi_Minh')
        ];
      }
      $this->load->model('BlogsModel');
      $this->BlogsModel->updatePost($id,$data);
      $this->session->set_flashdata('success','Update Success Post');
      redirect(base_url('post/list'));
    }else{
      $this->edit($id);
    }
  }
  public function delete($id)
  {
    $this->load->model('BlogsModel');
    $this->BlogsModel->deletePost($id);
    $this->session->set_flashdata('success','Delete Success Post');
    redirect(base_url('post/list'));
  }
}
