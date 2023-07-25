<div class="container">
  <div class="card">
    <div class="card-header">
        List posts
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
        <a href="<?php echo base_url('post/create') ?>" class="btn btn-primary">Add Post</a>
      <table class="table table-striped">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">Title</th>
            <th scope="col">Category Post</th>
            <th scope="col">Slug</th>
            <th scope="col">Short Content</th>
            
            <th scope="col">Image</th>
            <th scope="col">Status</th>
            <th scope="col">Manage</th>
          </tr>
        </thead>
        <tbody>
          <?php
          foreach($posts as $key => $post) {
          ?>
          <tr>
            <th scope="row"><?php echo $key ?></th>
            <td><?php echo $post->title ?></td>

            <td><?php echo $post->tendanhmuc ?></td>

            <td><?php echo $post->slug ?></td>
            <td><?php echo $post->short_content ?></td>
            
            <td>
              <img src="<?php echo base_url('uploads/posts/'.$post->image) ?>" width="150" height="150">
            </td>
            <td>
              <?php
                if($post->status==1){
                  echo 'Active';
                }else{
                  echo 'Inactive';
                }
              ?>
            </td>
            <td>
                <a onclick="return confirm('Are u sure?')" href="<?php echo base_url('post/delete/'.$post->id) ?>" class="btn btn-danger">Delete</a>
                <a href="<?php echo base_url('post/edit/'.$post->id) ?>" class="btn btn-warning">Edit</a>
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