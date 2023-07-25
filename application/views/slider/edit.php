<div class="container">
    <div class="card">
      <div class="card-header">
        Edit slider
      </div>
      <div class="card-body">
        <a href="<?php echo base_url('slider/list') ?>" class="btn btn-success">List Slider</a>
        <a href="<?php echo base_url('slider/create') ?>" class="btn btn-success">Create Slider</a>
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
        <form action="<?php echo base_url('slider/update/'.$slider->id) ?>" method="POST" enctype="multipart/form-data">
          <div class="form-group">
            <label for="exampleInputEmail1">Title</label>
            <input type="text" class="form-control" value="<?php echo $slider->title ?>" name="title" aria-describedby="emailHelp" >
            <?php echo '<span class="text text-danger">'.form_error('title').'</span>' ?>
          </div>
          
          <div class="form-group">
            <label for="exampleInputPassword1">Description</label>
            <input type="text" class="form-control" value="<?php echo $slider->description ?>" name="description" id="exampleInputPassword1" >
            <?php echo '<span class="text text-danger">'.form_error('description').'</span>' ?>
          </div>

          <div class="form-group">
            <label for="exampleInputPassword1">Image</label>
            <input type="file" class="form-control-file" name="image" id="exampleInputPassword1" >
            <img src="<?php echo base_url('uploads/sliders/'.$slider->image) ?>" width="150" height="150">
            <small><?php if(isset($error)){ echo $error;} ?></small>
          </div>

          <div class="form-group">
            <label for="exampleFormControlSelect1">Status</label>
            <select class="form-control" name="status" id="exampleFormControlSelect1">
            <?php
                    if($slider->status == 1) {
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