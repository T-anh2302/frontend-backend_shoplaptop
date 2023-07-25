<div class="container">
    <div class="card">
      <div class="card-header">
        Edit post
      </div>
      <div class="card-body">
      <a href="<?php echo base_url('post/create') ?>" class="btn btn-success">Create Post</a>
        <a href="<?php echo base_url('post/list') ?>" class="btn btn-success">List Post</a>
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
        <form action="<?php echo base_url('post/update/'.$post->id) ?>" method="POST" enctype="multipart/form-data">
          <div class="form-group">
            <label for="exampleInputEmail1">Title</label>
            <input type="text" class="form-control" name="title" value="<?php echo $post->title ?>" id="slug" onkeyup="ChangeToSlug();" aria-describedby="emailHelp" >
            <?php echo '<span class="text text-danger">'.form_error('title').'</span>' ?>
          </div>
          
          <div class="form-group">
            <label for="exampleInputEmail1">Slug</label>
            <input type="text" class="form-control" name="slug" id="convert_slug" value="<?php echo $post->slug ?>" aria-describedby="emailHelp" >
            <?php echo '<span class="text text-danger">'.form_error('slug').'</span>' ?>
          </div>

          <div class="form-group">
            <label for="exampleInputPassword1">Short Content</label>
            <input type="text" class="form-control" name="short_content" value="<?php echo $post->short_content ?>" id="exampleInputPassword1" >
            <?php echo '<span class="text text-danger">'.form_error('short_content').'</span>' ?>
          </div>
          <div class="form-group">
            <label for="exampleInputPassword1">Content</label>
            <textarea rows="5" class="form-control" name="content" id="editor_post"><?php echo $post->content ?></textarea>
            <?php echo '<span class="text text-danger">'.form_error('content').'</span>' ?>
          </div>

          <div class="form-group">
            <label for="exampleInputPassword1">Image</label>
            <input type="file" class="form-control-file" name="image" id="exampleInputPassword1" >
            <img src="<?php echo base_url('uploads/posts/'.$post->image) ?>" width="150" height="150">
            <small><?php if(isset($error)){ echo $error;} ?></small>
          </div>

          <div class="form-group">
            <label for="exampleFormControlSelect1">Category Blog</label>
            <select class="form-control" name="category_blog_id" id="exampleFormControlSelect1">

            <?php
              foreach($category_blog as $key => $cate){
            ?>
              <option <?php echo $cate->id==$post->category_blog_id ? 'selected' : '' ?> value="<?php echo $cate->id ?>"><?php echo $cate->title ?></option>
            <?php
            }
            ?>
              
            </select>
          </div>

          

          <div class="form-group">
            <label for="exampleFormControlSelect1">Status</label>
            <select class="form-control" name="status" id="exampleFormControlSelect1">
            <?php
                    if($post->status == 1) {
                  ?>
                    <option selected value="1">Active</option>
                    <option value="0">Inactive</option>
                  <?php
                  }else{
                  ?>
                    <option value="1">Active</option>
                    <option selected value="0">Inactive</option>
                  <?php
                  }
                ?>
            </select>
          </div>
          
          <button type="submit" class="btn btn-primary">Update</button>
        </form>
      </div>
    </div>
</div>