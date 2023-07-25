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
							<div class="row">
								<div class="col-md-3">
									<div class="form-group">
										<label for="exampleFormControlSelect1">Lọc theo</label>
										<select class="form-control select-filter" id="select-filter">
											<option value="0">---Lọc theo---</option>
											<option value="?kytu=asc">Ký tự A-Z</option>
											<option value="?kytu=desc">Ký tự Z-A</option>
											<option value="?gia=asc">Giá tăng dần</option>
											<option value="?gia=desc">Giá giảm dần</option>
										</select>
									</div>
								</div>

								<div class="col-md-7">
											<form method="GET">
												<p>
													<label for="amount">Khoảng giá lọc:</label>
													<input type="text" id="amount" readonly style="border:0; color:#f6931f; font-weight:bold;">
												</p>
											<div id="slider-range"></div>
											<input type="hidden" class="price_from" name="from">
											<input type="hidden" class="price_to" name="to">
											<input type="submit" value="Lọc giá" class="btn btn-primary filter-price">
										</form>
								</div>
								
							</div>

							<h2 class="title text-center"><?php echo $title ?></h2>
							<?php
								foreach($category_product as $key => $pro){
							?>
							
							<div class="col-sm-4">
								<div class="product-image-wrapper">
								<form action="<?php echo base_url('add-to-cart') ?>" method="POST">
									<div class="single-products">
											<div class="productinfo text-center">
												<input type="hidden" value="<?php echo $pro->id ?>" name="product_id" >
												<input type="hidden" value="1" name="quantity" >
												<img src="<?php echo base_url('uploads/product/'.$pro->image) ?>" alt="">
												<h2><?php echo number_format($pro->price,0,",","."); ?> vnd</h2>
												<p><?php echo $pro->title ?></p>
												<a href="<?php echo base_url('san-pham/'.$pro->id.'/'.$pro->slug) ?>" class="btn btn-default add-to-cart"><i class="fa fa-eye"></i>Chi tiết</a>
												<button type="submit" class="btn btn-fefault cart_home">
												<i class="fa fa-shopping-cart"></i>
												Thêm sản phẩm vào giỏ hàng
											</button>
											</div>
									</div>
								</form>
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
							
					</div><!--features_items-->

					
				</div>
			</div>
		</div>
	</section>