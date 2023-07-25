<section id="cart_items">
		<div class="container">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="#">Home</a></li>
				  <li class="active">Checkout</li>
				</ol>
			</div>
			<div class="table-responsive cart_info">
        <?php
          if($this->cart->contents()) {
        ?>
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="description">Image</td>
							<td class="image">Item</td>
							<td class="price">Price</td>
							<td class="quantity">Quantity</td>
							<td class="total">Total</td>
							<td></td>
						</tr>
					</thead>
					<tbody>
            <?php
              $subtotal = 0;
              $total = 0;
              foreach ($this->cart->contents() as $items) {
                $subtotal = $items['qty']*$items['price'];
                $total+=$subtotal;
            ?>
						<tr>
							<td class="cart_product">
								<a href=""><img src="<?php echo base_url('uploads/product/'.$items['options']['image']) ?>" width="150" height="150" alt="<?php echo $items['name'] ?>"></a>
							</td>
							<td class="cart_description">
								<h4><a href=""><?php echo $items['name'] ?></a></h4>
								
							</td>
							<td class="cart_price">
								<p><?php echo number_format($items['price'],0,",","."); ?> vnd</p>
							</td>
							<td class="cart_quantity">
              <form action="<?php echo base_url('update-cart-item') ?>" method="POST">
								<div class="cart_quantity_button">
                  <input type="hidden" value="<?php echo $items['rowid'] ?>" name="rowid" >
									<input class="cart_quantity_input" type="number" min="1" name="quantity" value="<?php echo $items['qty'] ?>" autocomplete="off" size="2">
									
                  <input type="submit" name="capnhat" class="btn btn-warning" value="Cập nhật"> </input>
								</div>
              </form>
							</td>
							<td class="cart_total">
								<p class="cart_total_price"><?php echo number_format($subtotal,0,",","."); ?> vnd</p>
							</td>
							
						</tr>
            <?php
              }
            ?>

            <tr>
              <td colspan="5"> 
                Tổng tiền
                <p class="cart_total_price"><?php echo number_format($total,0,",","."); ?> vnd</p>
              </td>
              
              <!-- <td><a href="<?php echo base_url('checkout') ?>" class="btn btn-danger">Đặt hàng</a></td> -->
            </tr>

					</tbody>
				</table>
        <?php
        }else{
          echo '<span class="text text-danger">Làm ơn thêm sản phẩm vào giỏ</span>';
        }
        ?>
			</div>
      <section ><!--form-->
		<div class="container">
			<div class="row">
				<div class="col-sm-10 col-sm-offset-1">
					<div class="login-form"><!--login form-->
						<h2>Điền thông tin thanh toán</h2>
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
						<form onsubmit="return confirm('Xác nhận đặt hàng')" method="POST" action="<?php echo base_url('online-checkout') ?>">
            	<label>Name</label>
              <input type="text" name="name" placeholder="Name" />
							<?php echo '<span class="text text-danger">'.form_error('name').'</span>' ?>
              <label>Address</label>
              <input type="text" name="address" placeholder="Address" />
							<?php echo '<span class="text text-danger">'.form_error('address').'</span>' ?>
              <label>Phone</label>
              <input type="text" name="phone" placeholder="Phone" />
							<?php echo '<span class="text text-danger">'.form_error('phone').'</span>' ?>
              <label>Email</label>
              <input type="text" name="email" placeholder="Email" />
							<?php echo '<span class="text text-danger">'.form_error('email').'</span>' ?>
              <label>Hình thức thanh toán</label>
              <!-- <select name="shipping_method" >
                <option value="cod">COD</option>
                <option value="vnpay">VNPAY</option>
              </select> -->
							<button type="submit" name="cod" class="btn btn-default">Thanh toán COD</button>
							<button type="submit" name="payUrl" class="btn btn-danger">Thanh toán MoMo</button>
							<button type="submit" name="redirect" class="btn btn-success">Thanh toán Vnpay</button>
							<!-- <button type="submit" class="btn btn-default">Xác nhận thanh toán</button> -->
						</form>
					</div><!--/login form-->
				</div>
				
			</div>
		</div>
	</section><!--/form-->
		</div>
	</section> <!--/#cart_items-->