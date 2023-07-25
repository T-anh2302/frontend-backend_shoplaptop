<?php
defined('BASEPATH') OR exit('No direct script access allowed');


$route['default_controller'] = 'IndexController';
$route['404_override'] = 'IndexController/notfound';
$route['translate_uri_dashes'] = FALSE;
//home
$route['danh-muc/(:any)/(:any)']['GET'] = 'IndexController/category/$1/$2';
$route['danh-muc-tin/(:any)/(:any)']['GET'] = 'IndexController/category_blog/$1/$2';
$route['blog/(:any)/(:any)']['GET'] = 'IndexController/blog/$1/$2';
$route['thuong-hieu/(:any)/(:any)']['GET'] = 'IndexController/brand/$1/$2';
$route['san-pham/(:any)/(:any)']['GET'] = 'IndexController/product/$1/$2';
$route['gio-hang']['GET'] = 'IndexController/cart';
$route['add-to-cart']['POST'] = 'IndexController/add_to_card';
$route['update-cart-item']['POST'] = 'IndexController/update_cart_item';
$route['delete-all-cart']['GET'] = 'IndexController/delete_all_cart';
$route['delete-item/(:any)']['GET'] = 'IndexController/delete_item/$1';
$route['dang-nhap']['GET'] = 'IndexController/login';
$route['checkout']['GET'] = 'IndexController/checkout';
$route['confirm-checkout']['POST'] = 'IndexController/confirm_checkout';
$route['online-checkout']['POST'] = 'OnlineCheckoutController/online_checkout';


$route['dang-xuat']['GET'] = 'IndexController/dang_xuat';
$route['thanks']['GET'] = 'IndexController/thanks';
$route['tim-kiem']['GET'] = 'IndexController/tim_kiem';
//Contact
$route['contact']['GET'] = 'IndexController/contact';
$route['send-contact']['POST'] = 'IndexController/send_contact';
//Comment
$route['comment/send']['POST'] = 'IndexController/comment_send';
//pagination
// $route['phan-trang/(:num)'] = 'IndexController/index/$1';
// $route['phan-trang'] = 'IndexController/index/';
// $route['danh-muc/(:any)/(:any)/(:any)']['GET'] = 'IndexController/category/$1/$2';
// $route['thuong-hieu/(:any)/(:any)/(:any)']['GET'] = 'IndexController/brand/$1/$2';
$route['tim-kiem/(:num)']['GET'] = 'IndexController/tim_kiem/$1';
//email
$route['test-mail'] = 'IndexController/send_mail';
//login
$route['login']['GET'] = 'LoginController/index';
$route['login-user']['POST'] = 'LoginController/login';
$route['login-customer']['POST'] = 'IndexController/login_customer';
$route['dang-ky']['POST'] = 'IndexController/dang_ky';
$route['xac-thuc-dang-ky']['GET'] = 'IndexController/xac_thuc_dang_ky';
//Dashboard
$route['dashboard']['GET'] = 'DashboardController/index';
$route['logout']['GET'] = 'DashboardController/logout';
//Register Admin
$route['register-admin']['GET'] = 'LoginController/register_admin';
$route['register-insert']['POST'] = 'LoginController/register_insert';
//Brand
$route['brand/create']['GET'] = 'BrandController/create';
$route['brand/list']['GET'] = 'BrandController/index';
$route['brand/delete/(:any)']['GET'] = 'BrandController/delete/$1';
$route['brand/edit/(:any)']['GET'] = 'BrandController/edit/$1';
$route['brand/update/(:any)']['POST'] = 'BrandController/update/$1';
$route['brand/store']['POST'] = 'BrandController/store';
//Category Blog
$route['category_blog/create']['GET'] = 'BlogsController/create';
$route['category_blog/list']['GET'] = 'BlogsController/index';
$route['category_blog/delete/(:any)']['GET'] = 'BlogsController/delete/$1';
$route['category_blog/edit/(:any)']['GET'] = 'BlogsController/edit/$1';
$route['category_blog/update/(:any)']['POST'] = 'BlogsController/update/$1';
$route['category_blog/store']['POST'] = 'BlogsController/store';
//Post
$route['post/create']['GET'] = 'PostsController/create';
$route['post/list']['GET'] = 'PostsController/index';
$route['post/delete/(:any)']['GET'] = 'PostsController/delete/$1';
$route['post/edit/(:any)']['GET'] = 'PostsController/edit/$1';
$route['post/update/(:any)']['POST'] = 'PostsController/update/$1';
$route['post/store']['POST'] = 'PostsController/store';
//Slider
$route['slider/create']['GET'] = 'SliderController/create';
$route['slider/list']['GET'] = 'SliderController/index';
$route['slider/delete/(:any)']['GET'] = 'SliderController/delete/$1';
$route['slider/edit/(:any)']['GET'] = 'SliderController/edit/$1';
$route['slider/update/(:any)']['POST'] = 'SliderController/update/$1';
$route['slider/store']['POST'] = 'SliderController/store';
//Category
$route['category/create']['GET'] = 'CategoryController/create';
$route['category/list']['GET'] = 'CategoryController/index';
$route['category/delete/(:any)']['GET'] = 'CategoryController/delete/$1';
$route['category/edit/(:any)']['GET'] = 'CategoryController/edit/$1';
$route['category/update/(:any)']['POST'] = 'CategoryController/update/$1';
$route['category/store']['POST'] = 'CategoryController/store';
//Product
$route['product/create']['GET'] = 'ProductController/create';
$route['product/list']['GET'] = 'ProductController/index';
$route['product/delete/(:any)']['GET'] = 'ProductController/delete/$1';
$route['product/edit/(:any)']['GET'] = 'ProductController/edit/$1';
$route['product/update/(:any)']['POST'] = 'ProductController/update/$1';
$route['product/store']['POST'] = 'ProductController/store';

//Order
$route['order/list']['GET'] = 'OrderController/index';
$route['order/process']['POST'] = 'OrderController/process';
$route['order/view/(:any)']['GET'] = 'OrderController/view/$1';
$route['order/delete/(:any)']['GET'] = 'OrderController/delete_order/$1';
$route['order/print_order/(:any)']['GET'] = 'OrderController/print_order/$1';
