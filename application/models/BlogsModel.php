<?php

    class BlogsModel extends CI_Model {

      public function insertCategoryBlog($data) {
        return $this->db->insert('category_blogs',$data);
      }
      
      public function selectCategoryBlog()
      {
        $query = $this->db->get('category_blogs');
        return $query->result();
      }
      
      public function selectCategoryBlogById($id)
      {
        $query = $this->db->get_where('category_blogs',['id'=>$id]);
        return $query->row();
      }
      
      public function updateCategoryBlog($id,$data){
        return $this->db->update('category_blogs',$data,['id'=>$id]);
      }
      
      public function deleteCategoryBlog($id){
        return $this->db->delete('category_blogs',['id'=>$id]);
      }
      

      //--------------------------------post function
      public function insertPost($data) {
        return $this->db->insert('posts',$data);
      }
      public function selectPosts()
      {
        $query = $this->db->select('category_blogs.title as tendanhmuc,posts.*')
        ->from('category_blogs')
        ->join('posts','category_blogs.id=posts.category_blog_id')
        ->get();
        return $query->result();
      }
      public function selectPostById($id)
      {
        $query = $this->db->get_where('posts',['id'=>$id]);
        return $query->row();
      }
      public function updatePost($id,$data){
        return $this->db->update('posts',$data,['id'=>$id]);
      }
      public function deletePost($id){
        return $this->db->delete('posts',['id'=>$id]);
      }

    }

?>