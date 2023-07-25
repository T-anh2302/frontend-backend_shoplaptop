<div class="container">
			<div class="row">
				<?php $this->load->view('pages/template/sidebar'); ?>
<div class="col-sm-9">
					<div class="blog-post-area">
						<h2 class="title text-center">Danh mục : <?php echo $title ?></h2>
						<?php 
							foreach($category_blog_with_id as $key => $cate_blog){
						?>
						<div class="single-blog-post">
							<h3><?php echo $cate_blog->title ?></h3>
							<div class="post-meta">
								<ul>
									<li><i class="fa fa-user"></i>admin</li>
									<li><i class="fa fa-clock-o"></i> <?php echo $cate_blog->date_created ?></li>
								</ul>
								<!-- <span>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star-half-o"></i>
								</span> -->
							</div>
							<a href="">
							<img src="<?php echo base_url('uploads/posts/'.$cate_blog->image) ?>" alt="<?php echo $cate_blog->title ?>">
							</a>
							<p><?php echo $cate_blog->short_content ?></p>
							<a class="btn btn-primary" style="margin-bottom: 13px;" href="<?php echo base_url('blog/'.$cate_blog->id.'/'.$cate_blog->slug) ?>">Đọc thêm...</a>
						</div>
						<?php
							}
						?>
						
						<!-- <div class="pagination-area">
							<ul class="pagination">
								<li><a href="" class="active">1</a></li>
								<li><a href="">2</a></li>
								<li><a href="">3</a></li>
								<li><a href=""><i class="fa fa-angle-double-right"></i></a></li>
							</ul>
						</div> -->
					</div>
				</div>
      </div>
    </div>