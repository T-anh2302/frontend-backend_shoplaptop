<section>
		<style>
			button.btn.btn-fefault.cart_home {
				background: #F5F5ED;
				border: 0 none;
				border-radius: 0;
				color: #696763;
				font-family: 'Roboto', sans-serif;
				font-size: 15px;
				margin-bottom: 25px;
				margin-top: -15px;
		}

		button.btn.btn-fefault.cart_home:hover {
			background: #FE980F;
    	color: #FFFFFF;
		}
		</style>
		<div class="container">
			<div class="row">
				<?php $this->load->view('pages/template/sidebar'); ?>
				
				<div class="col-sm-9 padding-right">
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">Features Items</h2>
						<form action="<?php echo base_url('add-to-cart') ?>" method="POST">
            <?php
              foreach($allproduct as $key => $pro){
            ?>
						<div class="col-sm-4">
							<div class="product-image-wrapper">
							
								<div class="single-products">
										<div class="productinfo text-center">
											<input type="hidden" value="<?php echo $pro->id ?>" name="product_id" >
											<input type="hidden" value="1" name="quantity" >
											<img src="<?php echo base_url('uploads/product/'.$pro->image) ?>" alt="<?php echo $pro->title ?>">
                      <h2><?php echo number_format($pro->price,0,",","."); ?> vnd</h2>
											<p><?php echo $pro->title ?></p>
											<a href="<?php echo base_url('san-pham/'.$pro->id.'/'.$pro->slug) ?>" class="btn btn-default add-to-cart"><i class="fa fa-eye"></i>Chi tiết</a>
											<button type="submit" class="btn btn-fefault cart_home">
                      <i class="fa fa-shopping-cart"></i>
                      Thêm sản phẩm vào giỏ hàng
                    </button>
										</div>
								</div>
								
								<div class="choose">
									<!-- <ul class="nav nav-pills nav-justified">
										<li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
										<li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
									</ul> -->
								</div>
							</div>
						</div>
						<?php
              }
            ?>	
						</form>		
					</div><!--features_items-->

					
				</div>

				<?php 
				foreach($items_categories as $key =>$items){
				?>
				<div class="col-sm-3"></div>
				<div class="col-sm-9 padding-right">
					<div class="features_items"><!--features_items-->
							<h2 class="title text-center"><?php echo $key ?></h2>
							<form action="<?php echo base_url('add-to-cart') ?>" method="POST">
            <?php
              foreach($items as $pro_cate){
            ?>
						<div class="col-sm-4">
							<div class="product-image-wrapper">
							
								<div class="single-products">
										<div class="productinfo text-center">
											<input type="hidden" value="<?php echo $pro_cate['id'] ?>" name="product_id" >
											<input type="hidden" value="1" name="quantity" >
											<img src="<?php echo base_url('uploads/product/'.$pro_cate['image']) ?>" alt="<?php echo $pro_cate['title'] ?>" />
                      <h2><?php echo number_format($pro_cate['price'],0,',','.'); ?>vnd</h2>
											<p><?php echo $pro_cate['title'] ?></p>
											<a href="<?php echo base_url('san-pham/'.$pro_cate['id'].'/'.$pro_cate['slug']) ?>" class="btn btn-default add-to-cart"><i class="fa fa-eye"></i>Chi tiết</a>
											<button type="submit" class="btn btn-fefault cart_home">
                      <i class="fa fa-shopping-cart"></i>
                      Thêm sản phẩm vào giỏ hàng
                    </button>
										</div>
								</div>
								
								<div class="choose">
									<!-- <ul class="nav nav-pills nav-justified">
										<li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
										<li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
									</ul> -->
								</div>
							</div>
						</div>
						<?php
              }
            ?>	
						</form>		
					</div>
				</div>
				<?php
					}
				?>
			</div>
		</div>
	</section>