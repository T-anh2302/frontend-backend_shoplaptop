<div class="container">
  
  <div class="row">
    <div class="md-col-12 notfound">
      <!-- <img src="<?php echo base_url('frontend/images/404notfound.jpg') ?>" alt="404notfound"> -->
      <h4><center>Xin liên hệ với chúng tôi qua mail.Chúng tôi sẽ liên hệ với bạn trong thời gian sớm nhất.</center></h4>
      <p>Chào bạn,Đây là trang liên hệ của cửa hàng bán laptop của chúng tôi. Nếu bạn có bất kỳ câu hỏi hoặc yêu cầu nào, vui lòng liên hệ với chúng tôi bằng cách điền vào biểu mẫu liên hệ dưới đây hoặc thông qua thông tin liên lạc của chúng tôi.</p>
      <form action="<?php echo base_url('send-contact') ?> " method="POST">
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
        <div class="form-group">
          <label for="exampleInputEmail1">Email address*</label>
          <input type="email" class="form-control" name="email" required id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="...">
        </div>
        <div class="form-group">
          <label for="exampleInputPassword1">Họ và tên*</label>
          <input type="text" class="form-control" name="name" required id="exampleInputPassword1" placeholder="...">
        </div>
        <div class="form-group">
          <label for="exampleInputPassword1">Số điện thoại*</label>
          <input type="text" class="form-control" name="phone" required id="exampleInputPassword1" placeholder="...">
        </div>
        <div class="form-group">
          <label for="exampleInputPassword1">Địa chỉ</label>
          <input type="text" class="form-control" name="address" id="exampleInputPassword1" placeholder="...">
        </div>
        <div class="form-group">
          <label for="exampleInputPassword1">Ghi chú*</label>
          <textarea rows="5" resize="none" name="note" required placeholder="Điền thông tin ghi chú"></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Gửi liên hệ</button>
      </form>
    </div>
      <p style="margin:20px 0">Chúng tôi sẽ cố gắng trả lời yêu cầu của bạn trong thời gian sớm nhất có thể. Cảm ơn bạn đã quan tâm đến cửa hàng của chúng tôi.</p>
  </div>
</div>