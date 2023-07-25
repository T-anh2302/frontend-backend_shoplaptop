<div class="container">
  <div class="card">
    <div class="card-header">
        List category blog
    </div>
    <?php
          if($this->session->flashdata('success')){
            ?>
            <div class="alert alert-success"><?php echo $this->session->flashdata('success') ?></div>
            <?php
              }elseif($this->session->flashdata('error')){
            ?>
            <div class="alert alert-danger"><?php echo $this->session->flashdata('error') ?></div>
            <?php
            }
        ?>
      <div class="card-body">
        <a href="<?php echo base_url('category_blog/create') ?>" class="btn btn-primary">Add Category Blog</a>
      <table class="table table-striped">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">Title</th>
            <th scope="col">Slug</th>
            <th scope="col">Description</th>
            <th scope="col">Image</th>
            <th scope="col">Status</th>
            <th scope="col">Manage</th>
          </tr>
        </thead>
        <tbody>
          <?php
          foreach($category_blog as $key => $cate_blog) {
          ?>
          <tr>
            <th scope="row"><?php echo $key ?></th>
            <td><?php echo $cate_blog->title ?></td>
            <td><?php echo $cate_blog->slug ?></td>
            <td><?php echo $cate_blog->description ?></td>
            <td>
              <img src="<?php echo base_url('uploads/category_blog/'.$cate_blog->image) ?>" width="150" height="150">
            </td>
            <td>
              <?php
                if($cate_blog->status==1){
                  echo 'Active';
                }else{
                  echo 'Inactive';
                }
              ?>
            </td>
            <td>
                <a onclick="return confirm('Are u sure?')" href="<?php echo base_url('category_blog/delete/'.$cate_blog->id) ?>" class="btn btn-danger">Delete</a>
                <a href="<?php echo base_url('category_blog/edit/'.$cate_blog->id) ?>" class="btn btn-warning">Edit</a>
            </td>
          </tr>
          <?php
          }
          ?>
        </tbody>
      </table>
      </div>
  </div>
</div>