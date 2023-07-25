-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 25, 2023 lúc 05:04 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `codeigniter_ecom_tutorial`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `image` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `slug` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`id`, `title`, `description`, `image`, `status`, `slug`) VALUES
(12, 'Acer', 'Thương hiệu Acer', '1689688854laptop-acer-cua-nuoc-nao-co-tot-khong-co-nhung-do2-800x450.jpg', 1, 'acer'),
(13, 'Dell', 'Thương hiệu Dell', '1689689035Dell_Logo_svg.png', 1, 'dell'),
(14, 'Hp', 'Thương hiệu Hp', '1689689126top-5-laptop-hp-cao-cap-va-ben-bi-bac-nhat-thi-truong-h1.jpg', 1, 'hp'),
(15, 'LG', 'Thương hiệu LG', '1689690341tải-xuống.png', 1, 'lg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `status` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `title`, `description`, `status`, `image`, `slug`) VALUES
(9, 'Laptop', 'Bạn muốn biết nguồn của thông tin này? Tìm hiểu thêm Hình ảnh có thể có bản quyền', 1, '16896885352910_hinhanhmaytinhxachtay4.jpg', 'laptop'),
(10, 'Điện thoại', 'Bạn đang tìm kiếm những hình nền điện thoại gấu dâu, hình nền đẹp cute ngầu thay đổi giao diện cho điện thoại, iphone của mình?', 1, '1689690559tải-xuống.jpg', 'dien-thoai');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category_blogs`
--

CREATE TABLE `category_blogs` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `image` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `category_blogs`
--

INSERT INTO `category_blogs` (`id`, `title`, `description`, `status`, `image`, `slug`) VALUES
(4, 'tin cong nghe', 'Thương hiệu Apple', 1, '1689397558man-one.jpg', 'tin-cong-nghe'),
(5, 'Laptop', 'Thông tin về laptop mới nhất', 1, '16898626882910_hinhanhmaytinhxachtay4.jpg', 'laptop'),
(6, 'Điện thoại', 'Cập nhật tin tức điện thoại', 1, '1689863987tải-xuống.jpg', 'dien-thoai');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `dated` varchar(20) DEFAULT NULL,
  `stars` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`id`, `name`, `email`, `comment`, `status`, `product_id`, `dated`, `stars`) VALUES
(1, 'adwq', 'vtuananhh@gmail.com', 'asddad', 1, 2, '2023-07-14 16:19:04', 0),
(2, 'tuananh', 'vtuananhh@gmail.com', 'san pham dep lam', 1, 2, '2023-07-14 16:19:05', 0),
(3, 'lam haong', 'vtuananhh@gmail.com', 'lam haong da danh gia comment', 1, 2, '2023-07-14 16:19:06', 0),
(4, 'lam haong', 'vtuananhh@gmail.com', 'lam haong da danh gia comment', 1, 2, '2023-07-14 16:19:07', 0),
(5, 'tuananha1', 'vtuananhh@gmail.com', 'Hello, it\'s me\nI was wondering if after all these years you\'d like to meet\nTo go over everything\nThey say that time\'s supposed to heal ya, but I ain\'t done much healing', 1, 2, '2023-07-14 16:32:13', 0),
(6, 'new video tutorial', 'vtuananhh@gmail.com', 'new video ', 0, 2, '2023-07-15 10:08:09', 4),
(7, 'xzcxxz', 'vtuananhh@gmail.com', 'vbnbvnh', 0, 2, '2023-07-15 10:10:22', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `note` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `phone`, `address`, `note`) VALUES
(1, 'Vũ tuấn anh', 'vtuananhh@gmail.com', '0865438002', '54 triều khúc thanh xuân nam hà nội', 'Lien he voi chung toi'),
(2, 'Vũ tuấn anh12', 'vtuananhh@gmail.com', '0865438002', '54 triều khúc thanh xuân nam hà nội', 'Lien he voi chung toi');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `address` varchar(50) NOT NULL,
  `token` varchar(10) NOT NULL,
  `date_created` varchar(20) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `password`, `phone`, `address`, `token`, `date_created`, `status`) VALUES
(1, 'anhtuan', 'anhtuan@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '032954631', '12/3A Thanh Xuan Ha Noi', '', '', 0),
(17, 'Vũ tuấn anh', 'vtuananhh@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '0865438002', '54 triều khúc thanh xuân nam hà nội', '7553', '2023-07-21 12:03:50', 0),
(18, 'Vũ tuấn anh', 'vtuananhh@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '0865438002', '54 triều khúc thanh xuân nam hà nội', '7638', '2023-07-21 12:07:26', 0),
(19, 'Vũ tuấn anh', 'vtuananhh@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '0865438002', '54 triều khúc thanh xuân nam hà nội', '139', '2023-07-21 12:08:28', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `momo`
--

CREATE TABLE `momo` (
  `id` int(11) NOT NULL,
  `partnerCode` varchar(50) NOT NULL,
  `orderId` varchar(50) NOT NULL,
  `requestId` varchar(50) NOT NULL,
  `amount` varchar(50) NOT NULL,
  `orderInfo` varchar(50) NOT NULL,
  `orderType` varchar(50) NOT NULL,
  `transId` varchar(50) NOT NULL,
  `payType` varchar(50) NOT NULL,
  `signature` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `momo`
--

INSERT INTO `momo` (`id`, `partnerCode`, `orderId`, `requestId`, `amount`, `orderInfo`, `orderType`, `transId`, `payType`, `signature`) VALUES
(1, 'MOMOBKUN20180529', '9146', '1689563845', '920000', 'Thanh toán qua MoMo', 'momo_wallet', '3048689704', 'napas', '1429955ebae838f70e6d857b36a9990198dfeb2b3f555f808d'),
(2, 'MOMOBKUN20180529', '9146', '1689563845', '920000', 'Thanh toán qua MoMo', 'momo_wallet', '3048689704', 'napas', '1429955ebae838f70e6d857b36a9990198dfeb2b3f555f808d');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `order_code` varchar(10) NOT NULL,
  `status` int(11) NOT NULL,
  `ship_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `order_code`, `status`, `ship_id`) VALUES
(5, '4538', 2, 9),
(6, '5297', 1, 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_code` varchar(10) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`id`, `order_code`, `product_id`, `quantity`) VALUES
(1, '5047', 3, 2),
(2, '5047', 2, 3),
(5, '4538', 2, 2),
(6, '4538', 3, 3),
(7, '5297', 9, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `image` varchar(200) NOT NULL,
  `content` longtext NOT NULL,
  `short_content` text NOT NULL,
  `category_blog_id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `date_created` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `posts`
--

INSERT INTO `posts` (`id`, `title`, `status`, `image`, `content`, `short_content`, `category_blog_id`, `slug`, `date_created`) VALUES
(3, 'Tạp chí điện tử Tri thức trực tuyến tạm dừng hoạt động 3 tháng', 1, '1689511906socials.png', '<p>Thực hiện Quyết định xử phạt vi phạm h&agrave;nh ch&iacute;nh của Thanh tra Bộ Th&ocirc;ng tin v&agrave; Truyền th&ocirc;ng ng&agrave;y 14/7/2023 v&agrave; quyết định của Hội Xuất bản Việt Nam, Tạp ch&iacute; điện tử Tri thức trực tuyến (Zing News) tạm dừng hoạt động trong 3 th&aacute;ng, kể từ ng&agrave;y 14/7/2023.</p>\r\n\r\n<p>Trong 3 th&aacute;ng tới, Tạp ch&iacute; điện tử Tri thức trực tuyến (Zing News) sẽ tập trung khắc phục, chấn chỉnh triệt để c&aacute;c tồn tại để thực hiện nghi&ecirc;m quyết định số 362/QĐ-TTg ng&agrave;y 3/4/2019 của Thủ tướng Ch&iacute;nh phủ về ph&ecirc; duyệt Quy hoạch ph&aacute;t triển v&agrave; quản l&yacute; b&aacute;o ch&iacute; to&agrave;n quốc đến năm 2025.</p>\r\n\r\n<p><a href=\"https://znews-photo.zingcdn.me/w960/Uploaded/jatmtz/2023_07_13/Anh_ngay_dung_xuat_ban.jpg\"><img alt=\"\" src=\"https://znews-photo.zingcdn.me/w960/Uploaded/jatmtz/2023_07_13/Anh_ngay_dung_xuat_ban.jpg\" style=\"height:422px; width:500px\" /></a></p>\r\n\r\n<p>Đồng thời, Tạp ch&iacute; sẽ tiếp tục đổi mới nội dung, h&igrave;nh thức đảm bảo thực hiện đ&uacute;ng t&ocirc;n chỉ, mục đ&iacute;ch được quy định trong giấy ph&eacute;p v&agrave; chức năng, nhiệm vụ của tạp ch&iacute; trực thuộc Hội Xuất bản Việt Nam cũng như ph&aacute;t huy bản sắc &ldquo;Th&ocirc;ng tin uy t&iacute;n, h&igrave;nh ảnh ấn tượng&rdquo;, để khi trở lại sẽ phụng sự bạn đọc tốt hơn.</p>\r\n\r\n<p>Tri thức trực tuyến gửi lời xin lỗi đến to&agrave;n thể bạn đọc v&igrave; kh&ocirc;ng thể phục vụ bạn đọc trong thời gian n&agrave;y. Xin được tr&acirc;n trọng cảm ơn sự quan t&acirc;m, gi&uacute;p đỡ của c&aacute;c cơ quan chỉ đạo, cơ quan quản l&yacute;, cơ quan chủ quản c&ugrave;ng t&igrave;nh cảm qu&yacute; mến của bạn đọc đ&atilde; v&agrave; đang d&agrave;nh cho Tạp ch&iacute;.</p>\r\n\r\n<p>Tri thức trực tuyến mong tiếp tục nhận được sự ủng hộ của bạn đọc, cơ quan chức năng khi trở lại.</p>\r\n\r\n<p>Tạp ch&iacute; điện tử Tri thức trực tuyến (Zing News)</p>', 'Thực hiện Quyết định xử phạt vi phạm hành chính của Thanh tra Bộ Thông tin và Truyền thông ngày 14/7/2023 và quyết định của Hội Xuất bản Việt Nam, Tạp chí điện tử Tri thức trực tuyến (Zing News) tạm dừng hoạt động trong 3 tháng, kể từ ngày 14/7/2023.', 3, 'tap-chi-dien-tu-tri-thuc-truc-tuyen-tam-dung-hoat-dong-3-thang', '2023-07-16 19:51:47'),
(4, 'Top 10 Laptop Dell Core i3 vừa túi tiền cho công việc văn phòng', 1, '1689862992dell-inspiron-15-3520-i5-n5i5122w1-191222-091429-600x600.jpg', '<p>M&aacute;y t&iacute;nh x&aacute;ch tay Laptop Dell c&oacute; những t&iacute;nh năng vượt trội so với những m&aacute;y t&iacute;nh c&ugrave;ng loại kh&aacute;c tr&ecirc;n thị trường. Ch&uacute;ng c&oacute; những đặc điểm gi&uacute;p đ&aacute;p ứng nhu cầu của kh&aacute;ch h&agrave;ng như: độ bền của m&aacute;y cao, thời lượng pin tốt, tốc độ xử l&iacute; dữ liệu nhanh,hệ thống l&agrave;m m&aacute;t chạy xuy&ecirc;n suốt, dễ d&agrave;ng n&acirc;ng cấp hệ thống, với nhiều t&iacute;nh năng đa dạng.</p>\r\n\r\n<p>Mỗi d&ograve;ng sản phẩm m&agrave; Dell đưa ra đều hướng tới những đối tượng sử dụng kh&aacute;c nhau tr&ecirc;n thị trường, từ sinh viện học sinh đến c&aacute;c nh&acirc;n vi&ecirc;n văn ph&ograve;ng kinh doanh với gi&aacute; cả hợp l&iacute;, nhiều lựa chọn t&ugrave;y v&agrave;o t&uacute;i tiền của m&igrave;nh.</p>\r\n\r\n<p>Với những người d&ugrave;ng kh&ocirc;ng cần một cấu h&igrave;nh m&aacute;y mạnh mẽ cho c&aacute;c ứng dụng đa phương tiện, đồ họa cao cấp, m&agrave; chủ yếu sử dụng để truy cập Internet, giải tr&iacute; v&agrave; c&ocirc;ng việc văn ph&ograve;ng. Những mẫu&nbsp;<strong>Laptop Dell core i3</strong>&nbsp;dưới đ&acirc;y kh&aacute; th&iacute;ch hợp cho Bạn:</p>\r\n\r\n<h2><a href=\"https://shopee.vn/dell_authorized_store?shopCollection=49472423#product_list\" target=\"_blank\">1. LAPTOP DELL INSPIRON 3576-N3576C - 9.965.000đ</a></h2>\r\n\r\n<p>Bộ xử l&yacute; Intel Core thế hệ mới nhất mang đến cho Laptop Dell inspiron 3576-N3576C khả năng phản hồi nhanh v&agrave; đa nhiệm liền mạch. M&agrave;n h&igrave;nh tuyệt đẹp: M&agrave;n h&igrave;nh độ ph&acirc;n giải HD với tấm nền chống phản chiếu mang lại h&igrave;nh ảnh r&otilde; n&eacute;t, tươi s&aacute;ng.</p>\r\n\r\n<p><a href=\"https://laptopfull.com/library/module_new/laptop-dell-inspiron-3576-n3576c_s2045.jpg\"><img alt=\"\" src=\"https://laptopfull.com/library/module_new/laptop-dell-inspiron-3576-n3576c_s2045.jpg\" /></a></p>\r\n\r\n<h3>Th&ocirc;ng số kỹ thuật t&oacute;m tắt:</h3>\r\n\r\n<p>M&aacute;y t&iacute;nh x&aacute;ch tay&nbsp;Laptop Dell Inspiron 3576-N3576C</p>\r\n\r\n<ul>\r\n	<li>CPU: Intel Core i3-8130U ( 2.2 GHz - 3.4 GHz / 4MB / 2 nh&acirc;n, 4 lu&ocirc;̀ng )</li>\r\n	<li>M&agrave;n h&igrave;nh: 15.6&quot; TN ( 1366 x 768 ) , kh&ocirc;ng cảm ứng</li>\r\n	<li>RAM: 1 x 4GB DDR4 2400MHz</li>\r\n	<li>Đồ họa: Intel UHD Graphics 620 / Shared memory</li>\r\n	<li>Lưu trữ: 1TB HDD 5400RPM</li>\r\n	<li>Hệ điều h&agrave;nh: Ubuntu</li>\r\n	<li>Pin: 4 cell Pin rời , khối lượng: 2.3 kg</li>\r\n</ul>\r\n\r\n<p><strong><a href=\"https://shopee.vn/dell_authorized_store?shopCollection=49472423#product_list\">Xem đ&aacute;nh gi&aacute; &gt;&gt;</a></strong></p>\r\n\r\n<h2>2. Laptop Dell Inspiron 15 3567 Core i3-7100U&nbsp;(Đen) - 9.015.000đ</h2>\r\n\r\n<p>Dell Inspiron 15 3567-N3567H nổi bật với vẻ ngo&agrave;i sang trọng, t&ocirc;ng m&agrave;u đen c&aacute; t&iacute;nh, kiểu d&aacute;ng năng động, hiện đại, bề mặt nh&aacute;m, hạn chế t&igrave;nh trạng b&aacute;m bụi v&agrave; v&acirc;n tay. Mặc d&ugrave; sở hữu thiết kế kh&aacute; mạnh mẽ nhưng c&aacute;c g&oacute;c cạnh của m&aacute;y vẫn được nh&agrave; sản...</p>\r\n\r\n<p><a href=\"https://laptopfull.com/library/module_new/laptop-dell-inspiron-3567-n3567h_s1835.jpg\"><img alt=\"\" src=\"https://laptopfull.com/library/module_new/laptop-dell-inspiron-3567-n3567h_s1835.jpg\" /></a></p>\r\n\r\n<h3>Th&ocirc;ng số kỹ thuật t&oacute;m tắt:</h3>\r\n\r\n<p>M&aacute;y t&iacute;nh x&aacute;ch tay Laptop Dell Inspiron 3567-N3567H (Đen)</p>\r\n\r\n<p>- CPU: Intel Core i3-7100U ( 2.4 GHz / 3MB / 2 nh&acirc;n, 4 lu&ocirc;̀ng )</p>\r\n\r\n<p>- M&agrave;n h&igrave;nh: 15.6&quot; ( 1366 x 768 ) , kh&ocirc;ng cảm ứng</p>\r\n\r\n<p>- RAM: 1 x 4GB DDR4 2133MHz</p>\r\n\r\n<p>- Đồ họa: Intel HD Graphics 620</p>\r\n\r\n<p>- Lưu trữ: 1TB HDD 5400RPM</p>\r\n\r\n<p>- Hệ điều h&agrave;nh: Windows 10 Home SL 64-bit</p>\r\n\r\n<p>- Pin: 4 cell 40 Wh Pin rời , khối lượng: 2.2 kg</p>\r\n\r\n<p><a href=\"https://shopee.vn/dell_authorized_store?shopCollection=49472423#product_list\"><strong>Xem đ&aacute;nh gi&aacute; &gt;&gt;</strong></a></p>\r\n\r\n<h2>3. Laptop Dell&nbsp;Vostro&nbsp;3468&nbsp;Core i3-7020U&nbsp;(Đen) - 9.590.000đ</h2>\r\n\r\n<p>Dell Vostro 3468 (F3468-70159379) l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay phi&ecirc;n bản r&uacute;t gọn cấu h&igrave;nh cơ bản nhất nhưng vẫn được trang bị chip xử l&yacute; thế hệ mới nhất, bảo mật v&acirc;n tay c&ugrave;ng ổ cứng HDD l&ecirc;n đến 1TB. L&agrave; laptop d&agrave;nh ri&ecirc;ng cho Văn ph&ograve;ng, Học sinh, Sinh...</p>\r\n\r\n<p><a href=\"https://laptopfull.com/library/module_new/laptop-dell-vostro-3468-core-i3-7100u_s1706.jpg\"><img alt=\"\" src=\"https://laptopfull.com/library/module_new/laptop-dell-vostro-3468-core-i3-7100u_s1706.jpg\" /></a></p>\r\n\r\n<h3>Th&ocirc;ng số kỹ thuật t&oacute;m tắt:</h3>\r\n\r\n<p>M&aacute;y t&iacute;nh x&aacute;ch tay Laptop Dell Vostro 3468 (F3468-70159379) (Đen)</p>\r\n\r\n<p>- CPU: Intel Core i3-7020U ( 2.3 GHz / 3MB / 2 nh&acirc;n, 4 lu&ocirc;̀ng )</p>\r\n\r\n<p>- M&agrave;n h&igrave;nh: 14&quot; ( 1366 x 768 ) , kh&ocirc;ng cảm ứng</p>\r\n\r\n<p>- RAM: 1 x 4GB DDR4 2400MHz</p>\r\n\r\n<p>- Đồ họa: Intel HD Graphics 620</p>\r\n\r\n<p>- Lưu trữ: 1TB HDD 5400RPM</p>\r\n\r\n<p>- Hệ điều h&agrave;nh: Ubuntu</p>\r\n\r\n<p>- Pin: 4 cell 40 Wh Pin rời , khối lượng: 1.9 kg</p>\r\n\r\n<p><a href=\"https://shopee.vn/dell_authorized_store?shopCollection=49472423#product_list\"><strong>Xem đ&aacute;nh gi&aacute; &gt;&gt;</strong></a></p>\r\n\r\n<h2>4. Laptop Dell Vostro 3568&nbsp;Core i3-7020U&nbsp;(Đen) - 9.759.000đ</h2>\r\n\r\n<p>Dell Vostro 3568-VTI321072 sở hữu những n&eacute;t thiết kế đặt trưng của Dell với vẻ ngo&agrave;i đơn giản v&agrave; cứng c&aacute;p khi m&aacute;y được chế tạo chủ yếu từ nhựa, c&aacute;c chi tiết của m&aacute;y được chế tạo tỉ mỉ, t&ocirc;n l&ecirc;n vẻ đẹp ấn tượng với người d&ugrave;ng, kiểu d&aacute;ng thanh tho&aacute;t...</p>\r\n\r\n<p><a href=\"https://laptopfull.com/library/module_new/laptop-dell-vostro-3568-vti32107_s1736.jpg\"><img alt=\"\" src=\"https://laptopfull.com/library/module_new/laptop-dell-vostro-3568-vti32107_s1736.jpg\" /></a></p>\r\n\r\n<h3>Th&ocirc;ng số kỹ thuật t&oacute;m tắt:</h3>\r\n\r\n<p>M&aacute;y t&iacute;nh x&aacute;ch tay Laptop Dell Vostro 3568-VTI321072 (Đen)</p>\r\n\r\n<p>- CPU: Intel Core i3-7020U ( 2.3 GHz / 3MB / 2 nh&acirc;n, 4 lu&ocirc;̀ng )</p>\r\n\r\n<p>- M&agrave;n h&igrave;nh: 15.6&quot; ( 1366 x 768 ) , kh&ocirc;ng cảm ứng</p>\r\n\r\n<p>- RAM: 1 x 4GB DDR4 2400MHz</p>\r\n\r\n<p>- Đồ họa: Intel HD Graphics 620</p>\r\n\r\n<p>- Lưu trữ: 1TB HDD 5400RPM</p>\r\n\r\n<p>- Hệ điều h&agrave;nh: Free DOS</p>\r\n\r\n<p>- Pin: 4 cell 40 Wh Pin rời , khối lượng: 2.2 kg</p>\r\n\r\n<p><a href=\"https://shopee.vn/dell_authorized_store?shopCollection=49472423#product_list\"><strong>Xem đ&aacute;nh gi&aacute; &gt;&gt;</strong></a></p>\r\n\r\n<h2>5. Laptop Dell Inspiron 14 3476&nbsp;Core i3-8130U&nbsp;(Đen) - 9.850.000đ</h2>\r\n\r\n<p>Tuy l&agrave; một chiếc laptop đời cũ, kh&ocirc;ng sở hữu ngoại h&igrave;nh &ldquo;si&ecirc;u mẫu&rdquo; như những&nbsp;<a href=\"https://laptopfull.com/laptop-mong-nhe/\">ultrabook&nbsp;</a>hiện nay của h&atilde;ng nhưng Dell Inspiron 14 3476-8J61P1 vẫn đủ để thu h&uacute;t người d&ugrave;ng với vỏ nhựa đen tuyền nhẹ lịch l&atilde;m, đi k&egrave;m đ&oacute; l&agrave; 1 cấu h&igrave;nh tốt. Mẫu laptop n&agrave;y..</p>\r\n\r\n<p><a href=\"https://laptopfull.com/library/module_new/laptop-dell-inspiron-3476-8j61p1_s1739.jpg\"><img alt=\"\" src=\"https://laptopfull.com/library/module_new/laptop-dell-inspiron-3476-8j61p1_s1739.jpg\" /></a></p>\r\n\r\n<h3>Th&ocirc;ng số kỹ thuật t&oacute;m tắt:</h3>\r\n\r\n<p>M&aacute;y t&iacute;nh x&aacute;ch tay Laptop Dell Inspiron 14 3476-8J61P1 (Đen)</p>\r\n\r\n<p>- CPU: Intel Core i3-8130U ( 2.2 GHz - 3.4 GHz / 4MB / 2 nh&acirc;n, 4 lu&ocirc;̀ng )</p>\r\n\r\n<p>- M&agrave;n h&igrave;nh: 14&quot; ( 1366 x 768 ) , kh&ocirc;ng cảm ứng</p>\r\n\r\n<p>- RAM: 1 x 4GB DDR4 2400MHz</p>\r\n\r\n<p>- Đồ họa: Intel UHD Graphics 620</p>\r\n\r\n<p>- Lưu trữ: 1TB HDD 5400RPM</p>\r\n\r\n<p>- Hệ điều h&agrave;nh: Linux</p>\r\n\r\n<p>- Pin: 4 cell 40 Wh Pin rời , khối lượng: 2 kg</p>\r\n\r\n<p><a href=\"https://shopee.vn/dell_authorized_store?shopCollection=49472423#product_list\"><strong>Xem đ&aacute;nh gi&aacute; &gt;&gt;</strong></a></p>\r\n\r\n<h2>6. Laptop Dell Inspiron 14 3467&nbsp;Core i3-6006U&nbsp;(Đen) - 8.900.000đ</h2>\r\n\r\n<p>Dell Inspiron 14 3467-M20NR1 sử dụng m&agrave;u đen truyền thống l&agrave;m m&agrave;u chủ đạo như c&aacute;c sản phẩm&nbsp;<a href=\"https://laptopfull.com/laptop-dell/\">laptop Dell</a>&nbsp;kh&aacute;c mang đến cho bạn sự sang trọng, thanh lịch, l&agrave;m h&agrave;i l&ograve;ng người d&ugrave;ng., c&aacute;c g&oacute;c cạnh của m&aacute;y được bo tr&ograve;n kỹ lưỡng, nhẹ nh&agrave;ng, bản lề được...</p>\r\n\r\n<p><a href=\"https://laptopfull.com/library/module_new/laptop-dell-inspiron-14-3467-i3-606u_s1836.jpg\"><img alt=\"\" src=\"https://laptopfull.com/library/module_new/laptop-dell-inspiron-14-3467-i3-606u_s1836.jpg\" /></a></p>\r\n\r\n<h3>Th&ocirc;ng số kỹ thuật t&oacute;m tắt:</h3>\r\n\r\n<p>M&aacute;y t&iacute;nh x&aacute;ch tay Laptop Dell Inspiron 14 3467-M20NR1 (Đen)</p>\r\n\r\n<p>- CPU: Intel Core i3-6006U ( 2.0 GHz / 3MB / 2 nh&acirc;n, 4 lu&ocirc;̀ng )</p>\r\n\r\n<p>- M&agrave;n h&igrave;nh: 14&quot; ( 1366 x 768 ) , kh&ocirc;ng cảm ứng</p>\r\n\r\n<p>- RAM: 1 x 4GB DDR4 2133MHz</p>\r\n\r\n<p>- Đồ họa: Intel HD Graphics 520</p>\r\n\r\n<p>- Lưu trữ: 1TB HDD 5400RPM</p>\r\n\r\n<p>- Hệ điều h&agrave;nh: Ubuntu</p>\r\n\r\n<p>- Pin: 4 cell 40 Wh Pin rời , khối lượng: 1.8 kg</p>\r\n\r\n<p><a href=\"https://shopee.vn/dell_authorized_store?shopCollection=49472423#product_list\"><strong>Xem đ&aacute;nh gi&aacute; &gt;&gt;</strong></a></p>\r\n\r\n<h2>7. Laptop Dell Inspiron 14 3467&nbsp;Core i3-7020U&nbsp;Đen) - 9.299.000đ</h2>\r\n\r\n<p>Dell Inspiron 14 3467-M20NR3 với kiểu d&aacute;ng gọn nhẹ, hợp thời trang, ngoại h&igrave;nh cuốn h&uacute;t với thiết kế truyền thống nhưng kh&ocirc;ng k&eacute;m phần hiện đại. T&ocirc;ng m&agrave;u đen vừa gi&uacute;p m&aacute;y l&acirc;u cũ, đồng thời tạo n&ecirc;n sự tinh tế cho người sử dụng. M&aacute;y xử l&iacute; nhanh với...</p>\r\n\r\n<p><a href=\"https://laptopfull.com/library/module_new/laptop-dell-inspiron-14-3467-core-i3_s1707.jpg\"><img alt=\"\" src=\"https://laptopfull.com/library/module_new/laptop-dell-inspiron-14-3467-core-i3_s1707.jpg\" /></a></p>\r\n\r\n<h3>Th&ocirc;ng số kỹ thuật t&oacute;m tắt:</h3>\r\n\r\n<p>M&aacute;y t&iacute;nh x&aacute;ch tay Laptop Dell Inspiron 14 3467-M20NR3 (Đen)</p>\r\n\r\n<p>- CPU: Intel Core i3-7020U ( 2.3 GHz / 3MB / 2 nh&acirc;n, 4 lu&ocirc;̀ng )</p>\r\n\r\n<p>- M&agrave;n h&igrave;nh: 14&quot; ( 1366 x 768 ) , kh&ocirc;ng cảm ứng</p>\r\n\r\n<p>- RAM: 1 x 4GB DDR4 2400MHz</p>\r\n\r\n<p>- Đồ họa: Intel HD Graphics 620</p>\r\n\r\n<p>- Lưu trữ: 1TB HDD 5400RPM</p>\r\n\r\n<p>- Hệ điều h&agrave;nh: Linux</p>\r\n\r\n<p>- Pin: 4 cell 40 Wh Pin rời , khối lượng: 2 kg</p>\r\n\r\n<p><a href=\"https://shopee.vn/dell_authorized_store?shopCollection=49472423#product_list\"><strong>Xem đ&aacute;nh gi&aacute; &gt;&gt;</strong></a></p>\r\n\r\n<p>Hy vọng với top 10&nbsp;<strong><a href=\"https://laptopfull.com/laptop-dell-core-i3/\">Laptop Dell core i3</a></strong>&nbsp;vừa t&uacute;i tiền cho c&ocirc;ng việc văn ph&ograve;ng&nbsp;m&agrave; ch&uacute;ng t&ocirc;i&nbsp;giới thiệu tr&ecirc;n đ&acirc;y, c&aacute;c bạn sẽ c&oacute; những lựa chọn ph&ugrave; hợp nhất, đ&aacute;p ứng tốt c&aacute;c nhu cầu l&agrave;m việc v&agrave; giải tr&iacute;.</p>\r\n\r\n<p><a href=\"https://laptopfull.com/\">Laptopfull.com</a>&nbsp;l&agrave; một trang chuy&ecirc;n tư vấn mua sắm Laptop. Ch&uacute;ng t&ocirc;i săn t&igrave;m những d&ograve;ng Laptop tốt c&oacute; gi&aacute; b&aacute;n tốt nhất v&agrave; uy t&iacute;n nhất, đ&uacute;ng h&agrave;ng ch&iacute;nh h&atilde;ng để giới thiệu tư vấn cho kh&aacute;ch h&agrave;ng. Kh&aacute;ch h&agrave;ng sẽ kh&ocirc;ng phải mất nhiều thời gian để t&igrave;m kiếm Laptop ph&ugrave; hợp với nhu cầu sử dụng v&agrave; mua được gi&aacute; tốt nhất ở nơi uy t&iacute;n nhất.</p>\r\n\r\n<p>C&aacute;c bạn cần th&ecirc;m th&ocirc;ng tin g&igrave; về Laptop m&igrave;nh cần mua, để lại c&acirc;u hỏi ở phần b&igrave;nh luận, m&igrave;nh trả lời nh&eacute;.</p>\r\n\r\n<p>Cảm ơn c&aacute;c bạn đ&atilde; quan t&acirc;m!</p>\r\n\r\n<h3>Tham khảo th&ecirc;m:</h3>\r\n\r\n<p><a href=\"https://laptopfull.com/blog/top-10-laptop-gia-re-duoi-6-trieu-cac-ban-hoc-sinh-khong-the-bo-qua/\">Top 10 Laptop gi&aacute; rẻ dưới 6 triệu c&aacute;c bạn Học sinh kh&ocirc;ng thể bỏ qua</a></p>\r\n\r\n<p><a href=\"https://laptopfull.com/blog/top-10-laptop-asus-core-i3-chat-luong-gia-re-duoi-10-trieu/\">Top 10 Laptop Asus Core i3 chất lượng gi&aacute; rẻ dưới 10 triệu</a></p>\r\n\r\n<p><a href=\"https://laptopfull.com/blog/top-10-laptop-asus-core-i5-thoi-trang-mong-nhe-tu-1-4kg-den-1-7kg/\">Top 10 Laptop Asus Core i5 thời trang mỏng nhẹ từ 1.4kg đến 1.7kg</a></p>', 'Top 10 Laptop Dell Core i3', 5, 'top-10-laptop-dell-core-i3-vua-tui-tien-cho-cong-viec-van-phong', '2023-07-20 21:23:13'),
(5, 'Top 10 Laptop giá rẻ dưới 6 triệu các bạn Học sinh không thể bỏ qua', 1, '1689863262dell-inspiron-16-5620-i5-p1wkn-thumb-600x600.jpg', '<p>Bạn l&agrave; Học sinh, Sinh vi&ecirc;n, nh&acirc;n vi&ecirc;n văn ph&ograve;ng muốn t&igrave;m mua cho m&igrave;nh một c&aacute;i&nbsp;<a href=\"https://laptopfull.com/laptop-gia-re/\"><strong>Laptop gi&aacute; rẻ</strong></a>&nbsp;dưới 6 triệu đồng, nhưng vẫn đ&aacute;p ứng được mọi nhu cầu của m&igrave;nh, từ học tập, l&agrave;m việc cho đến lướt web,nghe nhạc, xem phim, giải tr&iacute;.</p>\r\n\r\n<p>Những d&ograve;ng&nbsp;<a href=\"https://laptopfull.com/laptop-gia-re/\"><strong>Laptop gi&aacute; rẻ</strong></a>&nbsp;kh&aacute; phổ biến hiện nay, với gi&aacute; từ 4,5 triệu đến dưới 6 triệu, c&oacute; cấu h&igrave;nh CPU Celeron, Pentium, ổ cứng HDD 500GB đến 1TB, bộ nhớ RAM 4GB. Dưới đ&acirc;y l&agrave; Top 10 Laptop m&agrave; c&aacute;c bạn c&oacute; thể lựa chọn:</p>\r\n\r\n<h2><strong>HOT! HOT! HOT!</strong></h2>\r\n\r\n<p>SI&Ecirc;U LAPTOP NH&Iacute; TRAVELMATE B3 CHO B&Eacute; HỌC ONLINE C&Oacute; DEAL CỰC HOT Đ&Acirc;Y BA MẸ ƠI!</p>\r\n\r\n<p>Với đ&ocirc;i bền chuẩn qu&acirc;n đội, thời lượng pin chạy cực l&acirc;u, kết nối ổn định v&agrave; thiết kế an to&agrave;n cho con y&ecirc;u, TravelMate B3 ch&iacute;nh l&agrave; &quot;người bạn c&ugrave;ng tiến&quot; hỗ trợ con học tập thật tốt d&ugrave; l&agrave; Online hay tại trường!</p>\r\n\r\n<p><a href=\"http://shopee.vn/Laptop-Acer-TravelMate-B3-TMB311-31-P49D-P-N5030-4GB-256GB-11.6\'-HD-Win-11-i.106066556.14636931567\" target=\"_blank\"><big><strong>Mức gi&aacute; hấp dẫn 9.990.000 chương tr&igrave;nh ưu đ&atilde;i giảm cực sốc&nbsp;chỉ c&ograve;n 4.937.000 (số lượng c&oacute; hạn)</strong></big></a></p>\r\n\r\n<p>Chương tr&igrave;nh đang b&aacute;n online tại&nbsp;<a href=\"https://shopee.vn/Laptop-Acer-TravelMate-B3-TMB311-31-P49D-P-N5030-4GB-256GB-11.6\'-HD-Win-11-i.106066556.14636931567\" target=\"_blank\">Acer Shopee Store</a></p>\r\n\r\n<p><a href=\"https://laptopfull.com/hoanghung/32/images/ACER/laptop-cho%20be-acer-travelmate-B3.jpg\"><img alt=\"\" src=\"https://laptopfull.com/hoanghung/32/images/ACER/laptop-cho%20be-acer-travelmate-B3.jpg\" /></a>1.&nbsp;<a href=\"https://shopee.vn/Lenovo-Ideapad-3-15ITL05-81X800KRVN-i3-1115G4-8GB-256GB-SSD-Intel-UHD-15.6-HD-i.494606600.13864735140\" target=\"_blank\">Laptop gi&aacute; rẻ Lenovo Ideapad 3 15ITL05 81X800KRVN</a></p>\r\n\r\n<p><a href=\"https://laptopfull.com/hoanghung/32/images/Lenovo/Lenovo%20Ideapad%203%2015ITL05%2081X800KRVN.jpg\"><img alt=\"\" src=\"https://laptopfull.com/hoanghung/32/images/Lenovo/Lenovo%20Ideapad%203%2015ITL05%2081X800KRVN.jpg\" /></a></p>\r\n\r\n<h3>Th&ocirc;ng số kỹ thuật t&oacute;m tắt:</h3>\r\n\r\n<ul>\r\n	<li>Bộ xử l&yacute;: Intel Core i3-1115G4 (2C / 4T, 3.0 / 4.1GHz, 6MB)</li>\r\n	<li>Đồ họa: Intel UHD t&iacute;ch hợp</li>\r\n	<li>Chipset: Intel SoC Platform</li>\r\n	<li>Ram: 4GB DDR4-2666 được h&agrave;n + 4GB SO-DIMM DDR4-2666</li>\r\n	<li>Ổ cứng: 256GB SSD M.2 2242 PCIe 3.0x4 NVMe</li>\r\n	<li>Camera: 720p with Privacy Shutter</li>\r\n	<li>Pin: Integrated 35Wh</li>\r\n	<li>C&acirc;n nặng: 1.7 kg</li>\r\n	<li>M&agrave;n h&igrave;nh: 15.6&quot; HD (1366x768) TN 220nits Anti-glare</li>\r\n	<li>K&iacute;ch thước: 362.2 x 253.4 x 19.9 mm (14.26 x 9.98 x 0.78 inches)</li>\r\n	<li>M&agrave;u sắc : X&aacute;m</li>\r\n</ul>\r\n\r\n<p>Chương tr&igrave;nh đang b&aacute;n online tại Lenovo Store</p>\r\n\r\n<p><strong>Gi&aacute; ni&ecirc;m yết:&nbsp;<del>14.000.000</del></strong></p>\r\n\r\n<p><big><a href=\"http://shopee.vn/Lenovo-Ideapad-3-15ITL05-81X800KRVN-i3-1115G4-8GB-256GB-SSD-Intel-UHD-15.6-HD-i.494606600.13864735140\" target=\"_blank\"><strong>Gi&aacute; b&aacute;n: 8.721.000</strong><strong>&nbsp; Giảm 38% (Số lượng c&oacute; hạn)</strong></a></big></p>\r\n\r\n<h2>&nbsp;2.&nbsp;<a href=\"https://shopee.vn/Laptop-ASUS-Vivobook-X515MA-BR481W-Celeron-N4020-4GB-256GB-15.6-HD-UHD-600-WIN-11-i.267145398.17076354119\" target=\"_blank\">Laptop gi&aacute; rẻ&nbsp;ASUS X415MA-BV451W</a></h2>\r\n\r\n<p>Điểm qua về ASUS, h&atilde;ng được biết tới như một trong những thương hiệu sản xuất đồ c&ocirc;ng nghệ h&agrave;ng đầu, nhờ những trải nghiệm tốt m&agrave; gi&aacute; th&agrave;nh sản phẩm lại tiếp cận được với đa số người d&ugrave;ng phổ th&ocirc;ng. T101HA-GR004R sẽ l&agrave; một chiếc&nbsp;<a href=\"https://laptopfull.com/laptop-2-trong-1/\">laptop 2 trong 1</a>&nbsp;đ&aacute;ng để sở hữu</p>\r\n\r\n<p><a href=\"https://laptopfull.com/hoanghung/32/images/Asus/Laptop%20ASUS%20X415MA-BV451W.jpg\"><img alt=\"\" src=\"https://laptopfull.com/hoanghung/32/images/Asus/Laptop%20ASUS%20X415MA-BV451W.jpg\" /></a></p>\r\n\r\n<h3>Th&ocirc;ng số kỹ thuật t&oacute;m tắt:</h3>\r\n\r\n<p>M&aacute;y t&iacute;nh x&aacute;ch tay ASUS X415MA-BV451W</p>\r\n\r\n<ul>\r\n	<li>CPU: Intel Celeron N4020 (1.1GHz up to 2.8GHz, 4MB, 2 nh&acirc;n 2 luồng)</li>\r\n	<li>RAM: 4GB DDR4 2400MHz (1 KHE CẮM , UP TO 20GB)</li>\r\n	<li>Ổ cứng: SSD 256GB M.2 NVMe (1 x 2.5&Prime; SATA , 1 x M.2 NVMe)</li>\r\n	<li>VGA: Intel UHD Graphics 600</li>\r\n	<li>M&agrave;n h&igrave;nh: 14&Prime;HD 1366&times;768, m&agrave;n h&igrave;nh chống ch&oacute;i Anti-glare display, Kh&ocirc;ng cảm ứng</li>\r\n	<li>Pin 2 Cells 37WHrs</li>\r\n	<li>C&acirc;n nặng: 1.6kg</li>\r\n	<li>M&agrave;u sắc: Bạc</li>\r\n	<li>OS: Windows 11 Home</li>\r\n</ul>\r\n\r\n<p><strong>Gi&aacute; ni&ecirc;m yết:&nbsp;<del>8.490.000</del></strong></p>\r\n\r\n<p><big><a href=\"https://shopee.vn/Laptop-ASUS-Vivobook-X515MA-BR481W-Celeron-N4020-4GB-256GB-15.6-HD-UHD-600-WIN-11-i.267145398.17076354119\" target=\"_blank\"><strong>Gi&aacute; b&aacute;n: 7.990.000</strong><strong>&nbsp; Giảm 8% (Số lượng c&oacute; hạn)</strong></a></big></p>\r\n\r\n<h2><a href=\"https://shopee.vn/-M%C3%A3-ELBAU4-gi%E1%BA%A3m-4-%C4%91%C6%A1n-500K-Laptop-Dell-Vostro-3405-AMD-Ryzen-3-3250U-8GB-1TB-HDD-14\'\'FHD-W11-Office_P132G002ABL-i.273634451.14304111761\" target=\"_blank\">3. Laptop gi&aacute; rẻ&nbsp;Dell Vostro 3405 P132G002ABL</a></h2>\r\n\r\n<p>Thuộc ph&acirc;n kh&uacute;c m&aacute;y t&iacute;nh x&aacute;ch tay&nbsp;<a href=\"https://laptopfull.com/laptop-dell-gia-re/\">laptop dell gi&aacute; rẻ</a>,&nbsp;đ&aacute;p ứng được c&aacute;c nhu cầu học tập, l&agrave;m việc của đối tượng học sinh &ndash; sinh vi&ecirc;n v&agrave; nh&acirc;n vi&ecirc;n văn ph&ograve;ng.</p>\r\n\r\n<p><a href=\"https://laptopfull.com/hoanghung/32/images/LAPTOP_DELL/Laptop%20Dell%20Vostro%203405.jpg\"><img alt=\"\" src=\"https://laptopfull.com/hoanghung/32/images/LAPTOP_DELL/Laptop%20Dell%20Vostro%203405.jpg\" style=\"height:625px; width:847px\" /></a></p>\r\n\r\n<h3>Th&ocirc;ng số kỹ thuật t&oacute;m tắt:</h3>\r\n\r\n<p>M&aacute;y t&iacute;nh x&aacute;ch tay Laptop gi&aacute; rẻ&nbsp;Dell Vostro 3405 P132G002ABL</p>\r\n\r\n<ul>\r\n	<li>Bộ vi xử l&yacute;:&nbsp;AMD Ryzen 3 - 3250U (2.6Ghz, 4Mb Cache, up to 3.5 Ghz)</li>\r\n	<li>Ổ cứng lưu trữ:&nbsp;HDD 1Tb 5400rpm</li>\r\n	<li>Bộ nhớ: 8G DDR4 2400Mhz</li>\r\n	<li>Đồ hoạ:&nbsp;Integrated graphics with AMD APU</li>\r\n	<li>M&agrave;n h&igrave;nh:&nbsp;14.0-inch FHD (1920x1080) Anti -glare LED Backlight Non-touch Narrow Border Display</li>\r\n	<li>Hệ điều h&agrave;nh:&nbsp;Windows 11 Home, Office Home &amp; Student 2021</li>\r\n</ul>\r\n\r\n<p><strong>Gi&aacute; ni&ecirc;m yết:&nbsp;<del>13.490.000</del></strong></p>\r\n\r\n<p><a href=\"http://shopee.vn/-M%C3%A3-ELBAU4-gi%E1%BA%A3m-4-%C4%91%C6%A1n-500K-Laptop-Dell-Vostro-3405-AMD-Ryzen-3-3250U-8GB-1TB-HDD-14\'\'FHD-W11-Office_P132G002ABL-i.273634451.14304111761\"><big><strong>Gi&aacute; b&aacute;n: 10.150.000</strong><strong>&nbsp; Giảm 25% (Số lượng c&oacute; hạn)</strong></big></a></p>\r\n\r\n<h2><a href=\"https://shopee.vn/Laptop-HP-15s-fq2663TU-6K796PA-(i3-1115G4-4GB-256GB-SSD-15.6-VGA-ON-Win11-Silver)-H%C3%A0ng-Ch%C3%ADnh-H%C3%A3ng-i.142007769.18228732820\" target=\"_blank\">4. Laptop gi&aacute; rẻ Laptop HP 15s-fq2663TU 6K796PA</a></h2>\r\n\r\n<p>Laptop HP 15s-fq2663TU - 6K796PA với ngoại h&igrave;nh hiện đại, mỏng nhẹ c&ugrave;ng hiệu năng mạnh mẽ sẽ mang đến cho người d&ugrave;ng những trải nghiệm mượt m&agrave; v&agrave; mới mẻ. Sản phẩm sẽ l&agrave; lựa chọn ho&agrave;n hảo cho học sinh, sinh vi&ecirc;n cũng như d&acirc;n văn ph&ograve;ng với những nhu cầu l&agrave;m việc v&agrave; giải tr&iacute; cơ bản.&nbsp;</p>\r\n\r\n<p><a href=\"https://laptopfull.com/hoanghung/32/images/HP/Laptop%20HP%2015s-fq2663TU%206K796PA.jpg\"><img alt=\"\" src=\"https://laptopfull.com/hoanghung/32/images/HP/Laptop%20HP%2015s-fq2663TU%206K796PA.jpg\" style=\"height:579px; width:854px\" /></a></p>\r\n\r\n<h3>Th&ocirc;ng số kỹ thuật t&oacute;m tắt:</h3>\r\n\r\n<p>M&aacute;y t&iacute;nh x&aacute;ch tay Laptop gi&aacute; rẻ&nbsp;HP 15s-fq2663TU 6K796PA</p>\r\n\r\n<ul>\r\n	<li>CPU: Intel Core i3-1115G4</li>\r\n	<li>M&agrave;n h&igrave;nh: 15.6&quot; IPS (1366 x 768)</li>\r\n	<li>RAM: 1 x 4GB DDR4 3200MHz</li>\r\n	<li>Đồ họa: Onboard Intel UHD Graphics</li>\r\n	<li>Lưu trữ: 256GB SSD M.2 NVMe /</li>\r\n	<li>Hệ điều h&agrave;nh: Windows 11 Home</li>\r\n	<li>Pin: 3 cell 41 Wh Pin liền</li>\r\n	<li>Khối lượng: 1.7kg</li>\r\n</ul>\r\n\r\n<p><strong>Gi&aacute; ni&ecirc;m yết:&nbsp;<del>11.790.000</del></strong></p>\r\n\r\n<p><a href=\"https://shopee.vn/Laptop-HP-15s-fq2663TU-6K796PA-(i3-1115G4-4GB-256GB-SSD-15.6-VGA-ON-Win11-Silver)-H%C3%A0ng-Ch%C3%ADnh-H%C3%A3ng-i.142007769.18228732820\" target=\"_blank\"><big><strong>Gi&aacute; b&aacute;n: 10.990.000</strong><strong>&nbsp; Giảm 8% (Số lượng c&oacute; hạn)</strong></big></a></p>\r\n\r\n<h2><a href=\"https://shopee.vn/Laptop-MSI-Modern-14-B11MOU-1030VN-i3-1115G4-8GB-256GB-UHD-Graphics-14\'-FHD-W11-i.59923321.11083071643\" target=\"_blank\">5. Laptop gi&aacute; rẻ&nbsp;MSI Modern 14 B11MOU-1030VN i3-1115G4</a></h2>\r\n\r\n<p>Nếu bạn đang t&igrave;m một chiếc laptop đ&aacute;p ứng cho nhu cầu học tập, l&agrave;m việc văn ph&ograve;ng cơ bản c&ugrave;ng với mức gi&aacute; hợp l&yacute;. Th&igrave;&nbsp;Laptop&nbsp;MSI Modern 14 B11MOU-1030VN sở hữu thiết kế hiện đại, m&agrave;u sắc sang trọng c&ugrave;ng hiệu năng ổn định từ chip Intel thế hệ 11 sẽ l&agrave; lựa chọn tuyệt vời d&agrave;nh cho bạn.</p>\r\n\r\n<p><a href=\"https://laptopfull.com/hoanghung/32/images/MSI/Laptop%20MSI%20Modern%2014%20B11MOU-1030VN%20i3-1115G4.jpg\"><img alt=\"\" src=\"https://laptopfull.com/hoanghung/32/images/MSI/Laptop%20MSI%20Modern%2014%20B11MOU-1030VN%20i3-1115G4.jpg\" style=\"height:725px; width:835px\" /></a></p>\r\n\r\n<p>- CPU: Intel Core i3-1115G4<br />\r\n- M&agrave;n h&igrave;nh: 14&quot; IPS (1920 x 1080)<br />\r\n- RAM: 1 x 8GB DDR4 3200MHz<br />\r\n- Đồ họa: Onboard Intel UHD Graphics<br />\r\n- Lưu trữ: 256GB SSD M.2 NVMe /<br />\r\n- Hệ điều h&agrave;nh: Windows 11 Home<br />\r\n- Pin: 3 cell Pin liền<br />\r\n- Khối lượng: 1.3kg</p>\r\n\r\n<p><strong>Gi&aacute; ni&ecirc;m yết:&nbsp;<del>14.690.000</del></strong></p>\r\n\r\n<p><big><strong>Gi&aacute; b&aacute;n: 10.760.000</strong><strong>&nbsp; Giảm 27% (Số lượng c&oacute; hạn)</strong></big></p>\r\n\r\n<p><strong><a href=\"https://laptopfull.com/blog/gia-laptop-asus/\">►</a><a href=\"https://shopee.vn/Laptop-MSI-Modern-14-B11MOU-1030VN-i3-1115G4-8GB-256GB-UHD-Graphics-14\'-FHD-W11-i.59923321.11083071643\" target=\"_blank\">M&aacute;y&nbsp;đang b&aacute;n tại Shop Online MSI Store Ch&iacute;nh h&atilde;ng</a></strong></p>\r\n\r\n<h2>Xem th&ecirc;m:</h2>\r\n\r\n<p><a href=\"https://laptopfull.com/blog/gia-laptop-asus/\">►Laptop Asus: Cập nhật gi&aacute; v&agrave; khuyến m&atilde;i mới nhất</a>.</p>\r\n\r\n<p><a href=\"https://laptopfull.com/blog/gia-laptop-dell/\">►Laptop Dell: Cập nhật gi&aacute; v&agrave; khuyến m&atilde;i mới nhất</a>.</p>\r\n\r\n<p><a href=\"https://laptopfull.com/blog/gia-laptop-acer/\">►Laptop Acer: Cập nhật gi&aacute; v&agrave; khuyến m&atilde;i mới nhất</a>.</p>\r\n\r\n<p><a href=\"https://laptopfull.com/blog/gia-laptop-hp/\">►Laptop HP: Cập nhật gi&aacute; v&agrave; khuyến m&atilde;i mới nhất</a>.</p>\r\n\r\n<p><a href=\"https://laptopfull.com/blog/gia-laptop-lenovo/\">►Laptop Lenovo: Cập nhật gi&aacute; v&agrave; khuyến m&atilde;i mới nhất</a>.</p>\r\n\r\n<p><a href=\"https://laptopfull.com/blog/gia-laptop-msi/\">►Laptop MSI: Cập nhật gi&aacute; v&agrave; khuyến m&atilde;i mới nhất</a>.</p>\r\n\r\n<p>Hy vọng với top 10&nbsp;<a href=\"https://laptopfull.com/laptop-gia-re/\">Laptop gi&aacute; rẻ&nbsp;</a>m&agrave; ch&uacute;ng t&ocirc;i&nbsp;giới thiệu tr&ecirc;n đ&acirc;y, c&aacute;c bạn sẽ c&oacute; những lựa chọn ph&ugrave; hợp nhất, đ&aacute;p ứng tốt c&aacute;c nhu cầu l&agrave;m việc văn ph&ograve;ng, học tập cũng như nhu cầu giải tr&iacute;.</p>\r\n\r\n<p><a href=\"https://laptopfull.com/\">Laptopfull.com</a>&nbsp;l&agrave; một trang chuy&ecirc;n tư vấn mua sắm Laptop. Ch&uacute;ng t&ocirc;i săn t&igrave;m những d&ograve;ng Laptop tốt c&oacute; gi&aacute; b&aacute;n tốt nhất v&agrave; uy t&iacute;n nhất, đ&uacute;ng h&agrave;ng ch&iacute;nh h&atilde;ng để giới thiệu tư vấn cho kh&aacute;ch h&agrave;ng. Kh&aacute;ch h&agrave;ng sẽ kh&ocirc;ng phải mất nhiều thời gian để t&igrave;m kiếm Laptop ph&ugrave; hợp với nhu cầu sử dụng v&agrave; mua được gi&aacute; tốt nhất ở nơi uy t&iacute;n nhất.</p>\r\n\r\n<p>C&aacute;c bạn cần th&ecirc;m th&ocirc;ng tin g&igrave; về Laptop m&igrave;nh cần mua, để lại c&acirc;u hỏi ở phần b&igrave;nh luận, m&igrave;nh trả lời nh&eacute;.</p>\r\n\r\n<p>Cảm ơn c&aacute;c bạn đ&atilde; quan t&acirc;m!</p>', 'Top 10 Laptop giá rẻ dưới 6 triệu', 5, 'top-10-laptop-gia-re-duoi-6-trieu-cac-ban-hoc-sinh-khong-the-bo-qua', '2023-07-20 21:27:42'),
(6, 'Những chiến lược hoá tối ưu trang web của bạn', 1, '1689864154tải-xuống.jpg', '<p><a href=\"https://didongblog.com/wp-content/uploads/2023/06/toi-uu-trang-web-1.jpg\"><img alt=\"\" src=\"https://didongblog.com/wp-content/uploads/2023/06/toi-uu-trang-web-1.jpg\" style=\"height:346px; width:600px\" /></a></p>\r\n\r\n<p>Trong thế giới trực tuyến ng&agrave;y nay, việc tối ưu h&oacute;a trang web l&agrave; một yếu tố quan trọng để thu h&uacute;t lượng truy cập v&agrave; đạt được th&agrave;nh c&ocirc;ng trong kinh doanh trực tuyến. Dưới đ&acirc;y l&agrave; một số chiến lược tối ưu h&oacute;a trang web gi&uacute;p bạn n&acirc;ng cao hiệu suất v&agrave; hiệu quả của trang web của m&igrave;nh.</p>\r\n\r\n<h2><strong>X&aacute;c định &yacute; định t&igrave;m kiếm của người d&ugrave;ng</strong></h2>\r\n\r\n<p>Một trong những chiến lược quan trọng nhất để tối ưu h&oacute;a trang web l&agrave; hiểu r&otilde; &yacute; định t&igrave;m kiếm của người d&ugrave;ng. Bạn cần nghi&ecirc;n cứu từ kh&oacute;a ph&ugrave; hợp với nội dung của trang web v&agrave; đảm bảo rằng trang web của bạn đ&aacute;p ứng đ&uacute;ng nhu cầu v&agrave; t&igrave;m kiếm của người d&ugrave;ng. Bằng c&aacute;ch cung cấp nội dung chất lượng v&agrave; li&ecirc;n quan, bạn c&oacute; thể tăng cường khả năng xuất hiện của trang web trong kết quả t&igrave;m kiếm v&agrave; thu h&uacute;t người d&ugrave;ng quan t&acirc;m.</p>\r\n\r\n<p><a href=\"https://didongblog.com/wp-content/uploads/2023/06/toi-uu-trang-web.jpg\"><img alt=\"\" src=\"https://didongblog.com/wp-content/uploads/2023/06/toi-uu-trang-web.jpg\" style=\"height:308px; width:600px\" /></a></p>\r\n\r\n<h2><strong>Tối ưu kỹ thuật SEO</strong></h2>\r\n\r\n<p>SEO (Search Engine Optimization) l&agrave; qu&aacute; tr&igrave;nh tối ưu h&oacute;a trang web để c&oacute; thứ hạng cao tr&ecirc;n c&aacute;c c&ocirc;ng cụ t&igrave;m kiếm. Để tối ưu kỹ thuật SEO, bạn cần ch&uacute; trọng v&agrave;o c&aacute;c yếu tố như ti&ecirc;u đề trang, m&ocirc; tả, thẻ ti&ecirc;u đề, URL, v&agrave; sử dụng từ kh&oacute;a ph&ugrave; hợp trong nội dung. Đồng thời, bạn cũng n&ecirc;n tối ưu h&oacute;a tốc độ tải trang, cấu tr&uacute;c li&ecirc;n kết v&agrave; sitemap để cải thiện khả năng xếp hạng của trang web tr&ecirc;n c&ocirc;ng cụ t&igrave;m kiếm.</p>\r\n\r\n<p><em>Xem th&ecirc;m:&nbsp;</em><a href=\"https://bizfly.vn/techblog/search-engine-optimization-seo-la-gi-trong-marketing.html\"><em>SEO l&agrave; g&igrave;</em></a><em>? L&yacute; do doanh nghiệp cần ch&uacute; trọng v&agrave;o SEO Website</em></p>\r\n\r\n<h2><strong>Tối ưu trải nghiệm người d&ugrave;ng</strong></h2>\r\n\r\n<p>Trải nghiệm người d&ugrave;ng l&agrave; yếu tố quan trọng trong việc giữ ch&acirc;n người d&ugrave;ng v&agrave; n&acirc;ng cao tỷ lệ chuyển đổi tr&ecirc;n trang web của bạn. Bạn cần ch&uacute; trọng v&agrave;o thiết kế giao diện th&acirc;n thiện, dễ sử dụng v&agrave; tối ưu h&oacute;a quy tr&igrave;nh tương t&aacute;c của người d&ugrave;ng. Đảm bảo rằng trang web của bạn c&oacute; tốc độ tải trang nhanh, giao diện phản hồi tốt tr&ecirc;n c&aacute;c thiết bị v&agrave; hỗ trợ tương t&aacute;c dễ d&agrave;ng. Bạn cũng n&ecirc;n cung cấp nội dung hấp dẫn, dễ hiểu v&agrave; gi&uacute;p người d&ugrave;ng giải quyết vấn đề của họ. Bằng c&aacute;ch tạo ra trải nghiệm người d&ugrave;ng tốt, bạn c&oacute; thể tăng cường sự tương t&aacute;c v&agrave; đ&aacute;nh gi&aacute; t&iacute;ch cực từ ph&iacute;a người d&ugrave;ng, từ đ&oacute; tăng cơ hội chuyển đổi v&agrave; th&agrave;nh c&ocirc;ng trong kinh doanh trực tuyến.</p>\r\n\r\n<h2><strong>Ưu ti&ecirc;n cho thiết bị di động</strong></h2>\r\n\r\n<p>Với sự ph&aacute;t triển nhanh ch&oacute;ng của thiết bị di động, tối ưu h&oacute;a trang web cho c&aacute;c thiết bị như điện thoại di động v&agrave; m&aacute;y t&iacute;nh bảng l&agrave; cực kỳ quan trọng. Trang web của bạn cần c&oacute; giao diện đ&aacute;p ứng (responsive) để tự động th&iacute;ch nghi v&agrave; hiển thị tốt tr&ecirc;n mọi k&iacute;ch thước m&agrave;n h&igrave;nh. Ngo&agrave;i ra, tốc độ tải trang tr&ecirc;n thiết bị di động cũng cần được tối ưu để đảm bảo trải nghiệm người d&ugrave;ng thuận lợi v&agrave; kh&ocirc;ng g&acirc;y mất m&aacute;t người d&ugrave;ng do thời gian chờ đợi.</p>\r\n\r\n<p><a href=\"https://didongblog.com/wp-content/uploads/2023/06/toi-uu-trang-web-1.jpg\"><img alt=\"Ưu tiên website cho thiết bị di động\" src=\"https://didongblog.com/wp-content/uploads/2023/06/toi-uu-trang-web-1.jpg\" style=\"height:346px; width:600px\" /></a></p>\r\n\r\n<h2><strong>Tối ưu chỉ số quan trọng về web</strong></h2>\r\n\r\n<p>C&oacute; những chỉ số quan trọng về web m&agrave; bạn n&ecirc;n tối ưu để đảm bảo trang web của bạn hoạt động một c&aacute;ch hiệu quả. Điều n&agrave;y bao gồm tối ưu h&oacute;a tốc độ tải trang, tăng cường bảo mật trang web, giảm tỷ lệ tho&aacute;t trang (bounce rate), v&agrave; cải thiện thời gian duyệt trang (time on page). Bạn cần kiểm tra v&agrave; đ&aacute;nh gi&aacute; c&aacute;c chỉ số n&agrave;y thường xuy&ecirc;n để x&aacute;c định những điểm yếu v&agrave; &aacute;p dụng c&aacute;c biện ph&aacute;p cải thiện.</p>\r\n\r\n<h2><strong>X&acirc;y dựng li&ecirc;n kết</strong></h2>\r\n\r\n<p>X&acirc;y dựng li&ecirc;n kết l&agrave; một chiến lược tối ưu h&oacute;a quan trọng để tăng cường sự nhận diện v&agrave; độ tin cậy của trang web. Bạn n&ecirc;n t&igrave;m kiếm c&aacute;c cơ hội li&ecirc;n kết từ c&aacute;c trang web c&oacute; uy t&iacute;n v&agrave; li&ecirc;n quan trong lĩnh vực của bạn. Đồng thời, bạn cũng n&ecirc;n tạo nội dung chất lượng v&agrave; hấp dẫn để thu h&uacute;t người kh&aacute;c chia sẻ v&agrave; li&ecirc;n kết đến trang web của bạn. Li&ecirc;n kết chất lượng kh&ocirc;ng chỉ gi&uacute;p tăng cường sự xuất hiện tr&ecirc;n kết quả t&igrave;m kiếm m&agrave; c&ograve;n tạo điểm đặc biệt cho trang web của bạn.</p>\r\n\r\n<h2><strong>X&acirc;y dựng nội dung chất lượng</strong></h2>\r\n\r\n<p>Nội dung chất lượng l&agrave; trọng t&acirc;m của một trang web th&agrave;nh c&ocirc;ng. Bạn cần tạo ra nội dung gốc, hữu &iacute;ch v&agrave; gắn kết với đối tượng kh&aacute;ch h&agrave;ng của bạn. Đầu ti&ecirc;n, nghi&ecirc;n cứu đ&uacute;ng đối tượng kh&aacute;ch h&agrave;ng v&agrave; hiểu r&otilde; nhu cầu, sở th&iacute;ch v&agrave; vấn đề m&agrave; họ đang quan t&acirc;m. Dựa tr&ecirc;n th&ocirc;ng tin n&agrave;y, bạn c&oacute; thể tạo ra nội dung phong ph&uacute;, th&ocirc;ng tin, v&agrave; giải quyết vấn đề một c&aacute;ch đ&aacute;p ứng nhu cầu của kh&aacute;ch h&agrave;ng.</p>\r\n\r\n<p>Hơn nữa, bạn cần ch&uacute; &yacute; đến việc tối ưu h&oacute;a nội dung cho SEO. Sử dụng từ kh&oacute;a ph&ugrave; hợp trong ti&ecirc;u đề, m&ocirc; tả, v&agrave; nội dung của bạn để gi&uacute;p c&ocirc;ng cụ t&igrave;m kiếm hiểu r&otilde; hơn về nội dung của trang web của bạn v&agrave; cung cấp cho người d&ugrave;ng kết quả t&igrave;m kiếm tốt nhất.</p>\r\n\r\n<p>B&ecirc;n cạnh đ&oacute;, cung cấp c&aacute;c định dạng nội dung đa dạng như văn bản, h&igrave;nh ảnh, video, v&agrave; đồ họa để l&agrave;m cho trang web của bạn th&uacute; vị v&agrave; hấp dẫn hơn. Đảm bảo rằng nội dung của bạn dễ đọc, c&oacute; cấu tr&uacute;c r&otilde; r&agrave;ng v&agrave; c&oacute; gi&aacute; trị cho người d&ugrave;ng. Điều n&agrave;y sẽ gi&uacute;p k&eacute;o d&agrave;i thời gian duyệt trang, tăng khả năng chia sẻ nội dung v&agrave; tạo ra sự tương t&aacute;c t&iacute;ch cực từ người d&ugrave;ng.</p>\r\n\r\n<p>T&oacute;m lại, để tối ưu trang web của bạn, h&atilde;y x&aacute;c định &yacute; định t&igrave;m kiếm của người d&ugrave;ng, tối ưu kỹ thuật SEO, tối ưu trải nghiệm người d&ugrave;ng v&agrave; ưu ti&ecirc;n cho thiết bị di động. H&atilde;y tối ưu c&aacute;c chỉ số quan trọng về web, x&acirc;y dựng li&ecirc;n kết chất lượng v&agrave; x&acirc;y dựng nội dung chất lượng. Bằng c&aacute;ch &aacute;p dụng c&aacute;c chiến lược n&agrave;y, bạn c&oacute; thể n&acirc;ng cao sự hiệu quả v&agrave; th&agrave;nh c&ocirc;ng của trang web của m&igrave;nh.</p>\r\n\r\n<p>Nếu bạn kh&ocirc;ng muốn mất thời gian để tự tối ưu trang web th&igrave; c&oacute; thể lựa chọn sử dụng c&aacute;c dịch vụ thiết kế website nổi bật tr&ecirc;n thị trường. C&aacute;c đơn vị n&agrave;y sẽ c&oacute; thể tối ưu trang web cho bạn để c&oacute; thể đảm bảo website hoạt động đạt kết quả tốt nhất.&nbsp;Ch&uacute;ng t&ocirc;i xin ph&eacute;p giới thiệu đến bạn đọc BizWebsite &ndash; Một trong những dịch vụ thiết kế website theo y&ecirc;u cầu tốt nhất hiện nay c&oacute; thể đ&aacute;p ứng mọi mong muốn của kh&aacute;ch h&agrave;ng. Xem ngay dịch vụ thiết kế web của Bizfly tại đ&acirc;y:&nbsp;<a href=\"https://bizfly.vn/giai-phap/bizfly-website.html\">https://bizfly.vn/giai-phap/bizfly-website.html</a></p>', 'POSTED ON JUNE 7, 2023 BY BLOGDIDONG', 6, 'nhung-chien-luoc-hoa-toi-uu-trang-web-cua-ban', '2023-07-20 21:42:34');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `title`, `description`, `image`, `status`, `category_id`, `brand_id`, `slug`, `quantity`, `price`) VALUES
(26, 'Acer Aspire 7 Gaming A715 76G 5132 i5', 'Một dòng laptop gaming được cải tiến hoàn toàn mới đến từ nhà Acer, Aspire 7 Gaming 2023 mang ngoại hình tối giản, đẹp mắt cùng những thông số cấu hình mạnh mẽ, vừa đáp ứng được việc chiến game, vừa xử lý hiệu quả mọi tác vụ thường ngày. Laptop Acer Aspire 7 Gaming A715 76G 5132 i5 12450H (NH.QMESV.002) chắc chắn sẽ là sự lựa chọn hoàn hảo dành cho bạn.', '1689689257acer-aspire-7-gaming-a715-76g-5132-i5-nhqmesv002-thumb-600x600.jpg', 1, 9, 12, 'acer-aspire-7-gaming-a715-76g-5132-i5', 20, 15990000),
(27, 'Acer Aspire 3 A315 57 379K i3', 'Laptop Acer Aspire 3 A315 57 379K i3 1005G1 (NX.KAGSV.001) là một chiếc laptop học tập - văn phòng lý tưởng dành cho các bạn sinh viên hay nhân viên văn phòng khi sở hữu phong cách thiết kế thanh lịch đi cùng cấu hình đủ mạnh để đáp ứng mọi nhu cầu cơ bản thường ngày.', '1689689336acer-aspire-3-a315-57-379k-i3-nxkagsv001-ab-thumb-600x600.jpg', 1, 9, 12, 'acer-aspire-3-a315-57-379k-i3', 50, 7990000),
(28, 'Acer Aspire 3 A315 58 589K i5', 'Laptop Acer Aspire 3 A315 58 589K i5 1135G7 (NX.AM0SV.008) thuộc dòng laptop học tập - văn phòng tầm trung được Acer giới thiệu tới người dùng với thông số cấu hình ổn định, ngoại hình ưa nhìn và đặc biệt có mức giá phải chăng.', '1689689479acer-aspire-3-a315-58-589k-i5-nxam0sv008-thumb-600x600.jpg', 1, 9, 12, 'acer-aspire-3-a315-58-589k-i5', 100, 11490000),
(29, 'Dell Vostro 5620 i5', 'Laptop Dell Vostro 5620 i5 (V6I5001W1) có lối thiết kế đơn giản nhưng hiện đại, sở hữu cấu hình mạnh mẽ đến từ bộ vi xử lý Intel Gen 12 đi cùng màn hình kích thước lớn hỗ trợ mình giải quyết mọi tác vụ trong cả công việc và học tập.', '1689689683dell-inspiron-15-3520-i5-n5i5122w1-191222-091429-600x600.jpg', 1, 9, 13, 'dell-vostro-5620-i5', 120, 17990000),
(30, 'Dell Inspiron 15 3520 i5', 'Laptop Dell Inspiron 15 3520 i5 (N5I5122W1) hướng đến người dùng cần một chiếc laptop học tập - văn phòng sở hữu những thông số kỹ thuật vừa phải nhưng vẫn đảm bảo hiệu năng ổn định, trải nghiệm mượt mà cũng như giá bán dễ tiếp cận.', '1689689754dell-vostro-5620-i5-v6i5001w1-thumb-1-600x600.jpg', 1, 9, 13, 'dell-inspiron-15-3520-i5', 10, 15990000),
(31, 'Dell Inspiron 16 5620 i5', 'Laptop Dell Inspiron 16 5620 i5 (P1WKN) là tân binh tiếp theo thuộc dòng laptop học tập - văn phòng vừa được mở bán tại Thế Giới Di Động, không chỉ sở hữu ngoại hình bắt mắt mà còn mang trong mình những thông số kỹ thuật tân tiến.', '1689689808dell-inspiron-16-5620-i5-p1wkn-thumb-600x600.jpg', 1, 9, 13, 'dell-inspiron-16-5620-i5', 20, 17190000),
(32, 'HP 15s fq2716TU i3', 'Nếu bạn đang tìm kiếm một chiếc laptop học tập - văn phòng có thể đáp ứng tất tần tật mọi nhu cầu sử dụng hàng ngày từ học tập, làm việc văn phòng đến thiết kế đồ họa cơ bản, còn chần chừ gì nữa mà không tham khảo ngay laptop HP 15s fq2716TU i3 (7C0X3PA).', '1689689948hp-15s-fq2716tu-i3-7c0x3pa-thumb-600x600.jpg', 1, 9, 14, 'hp-15s-fq2716tu-i3', 59, 10490000),
(33, 'HP 240 G8 i3', 'Vẻ ngoài thanh lịch, cấu hình ổn định cùng mức giá lý tưởng là những ưu điểm mà sinh viên hay dân văn phòng nên lựa chọn chiếc laptop HP 240 G8 i3 (6L1A1PA) làm trợ thủ đắc lực hàng đầu cho các công việc thiết yếu hằng ngày.', '1689690005hp-240-g8-i3-6l1a1pa-210423-031503-600x600.jpg', 1, 9, 14, 'hp-240-g8-i3', 34, 9790000),
(34, 'LG gram 2023 i7', 'Laptop LG gram 2023 i7 1360P (17Z90R-G.AH78A5) sở hữu những thông số cấu hình vượt trội như con chip Intel Gen 13, tốc độ Bus RAM cao, ổ cứng 1 TB, sẽ là sự lựa chọn tuyệt vời để giúp bạn giải quyết mọi công việc.', '1689690265lg-gram-2023-i7-17z90rgah78a5-thumb-600x600.jpg', 1, 9, 15, 'lg-gram-2023-i7', 5, 50990000),
(35, 'LG gram 2023 i7', 'Laptop LG gram 2023 i7 1360P (14Z90R-G.AH75A5) mang hiệu năng xử lý vượt trội từ chip Intel Gen 13 mới nhất cùng thiết kế sang trọng, bắt mắt và mỏng nhẹ chắc chắn sẽ là một trợ thủ đắc lực hỗ trợ bạn hoàn thành mọi tác vụ công việc.', '1689690323lg-gram-style-2023-i5-14z90rsgah54a5-thumb-600x600.jpg', 1, 9, 15, 'lg-gram-2023-i7', 10, 38990000),
(36, 'iPhone 14 Pro Max 128GB', 'iPhone 14 Pro Max một siêu phẩm trong giới smartphone được nhà Táo tung ra thị trường vào tháng 09/2022. Máy trang bị con chip Apple A16 Bionic vô cùng mạnh mẽ, đi kèm theo đó là thiết kế hình màn hình mới, hứa hẹn mang lại những trải nghiệm đầy mới mẻ cho người dùng iPhone.', '1689690636iphone-14-pro-max-den-thumb-600x600.jpg', 1, 10, 12, 'iphone-14-pro-max-128gb', 10, 26790000),
(37, 'Xiaomi Redmi 12C 64GB', 'Xiaomi Redmi 12C 64GB một thiết bị di động tầm trung được giới thiệu bởi Xiaomi, với cấu hình vượt trội so với các đối thủ trong cùng phân khúc, điều này nhờ trang bị con chip MediaTek Helio G85 mạnh mẽ giúp máy có thể xử lý tốt nhiều tác vụ. Hơn nữa, với bộ ống kính chất lượng 50 MP cho phép bạn chụp ảnh chất lượng, sắc nét và đẹp mắt.', '1689690725xiaomi-redmi-12c-green-thumb-600x600.jpg', 1, 10, 12, 'xiaomi-redmi-12c-64gb', 47, 2590000),
(38, 'iPhone 11 64GB', 'Apple đã chính thức trình làng bộ 3 siêu phẩm iPhone 11, trong đó phiên bản iPhone 11 64GB có mức giá rẻ nhất nhưng vẫn được nâng cấp mạnh mẽ như iPhone Xr ra mắt trước đó.', '1689690849xiaomi-redmi-note-12-4g-mono-den-256gb-600x600.jpg', 1, 10, 13, 'iphone-11-64gb', 13, 10690000),
(39, 'Vivo Y16 64GB', 'Vivo Y16 64GB tiếp tục sẽ là cái tên được hãng bổ sung cho bộ sưu tập điện thoại Vivo dòng Y trong thời điểm cuối năm 2022, với mục tiêu mang đến nhiều trải nghiệm tốt hơn đối với dòng sản phẩm giá rẻ, Vivo hứa hẹn sẽ mang lại cho người dùng những trải nghiệm vượt xa mong đợi nhờ việc trang bị nhiều công nghệ xịn sò.', '1689690920vivo-y16-vang-thumb-600x600.jpg', 1, 10, 13, 'vivo-y16-64gb', 14, 3490000),
(40, 'Samsung Galaxy Z Fold4 5G 256GB', 'Tại sự kiện Samsung Unpacked thường niên, Samsung Galaxy Z Fold4 256GB chính thức được trình làng thị trường công nghệ, mang trên mình nhiều cải tiến đáng giá giúp Galaxy Z Fold trở thành dòng điện thoại gập đã tốt nay càng tốt hơn.', '1689690999samsung-galaxy-z-fold4-kem-256gb-600x600.jpg', 1, 10, 13, 'samsung-galaxy-z-fold4-5g-256gb', 12, 29990000),
(41, 'OPPO Reno8 Pro 5G', 'OPPO Reno8 Pro 5G là chiếc điện thoại cao cấp được nhà OPPO ra mắt vào thời điểm 09/2022, máy hướng đến sự hoàn thiện cao cấp ở phần thiết kế cùng khả năng quay chụp chuyên nghiệp nhờ trang bị vi xử lý hình ảnh MariSilicon X chuyên dụng.', '1689691119oppo-reno8-pro-thumb-xanh-1-600x600.jpg', 1, 10, 15, 'oppo-reno8-pro-5g', 6, 17990000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shipping`
--

CREATE TABLE `shipping` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `method` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `shipping`
--

INSERT INTO `shipping` (`id`, `name`, `phone`, `address`, `email`, `method`) VALUES
(1, 'Vũ tuấn anh', '0865438002', '54 triều khúc thanh xuân nam hà nội', 'vtuananhh@gmail.com', 'cod'),
(2, 'Vũ tuấn anh123', '0865438002', '54 triều khúc thanh xuân nam hà nội', 'vtuananhh@gmail.com', 'cod'),
(3, 'Vũ tuấn anh231', '0865438002', '54 triều khúc thanh xuân nam hà nội', 'vtuananhh@gmail.com', 'cod'),
(4, 'Vũ tuấn anh1234', '0865438002', '54 triều khúc thanh xuân nam hà nội', 'vtuananhh@gmail.com', 'cod'),
(5, 'Vũ tuấn anh321', '0865438002', '54 triều khúc thanh xuân nam hà nội', 'vtuananhh@gmail.com', 'cod'),
(6, 'Vũ tuấn anh210', '0865438002', '54 triều khúc thanh xuân nam hà nội', 'vtuananhh@gmail.com', 'cod'),
(7, 'Vũ tuấn anh', '0865438002', '54 triều khúc thanh xuân nam hà nội', 'vtuananhh@gmail.com', 'cod'),
(8, 'Vũ tuấn anh567', '0865438002', '54 triều khúc thanh xuân nam hà nội', 'vtuananhh@gmail.com', 'cod'),
(9, 'Vũ tuấn anh213', '0865438002', '54 triều khúc thanh xuân nam hà nội', 'vtuananhh@gmail.com', 'cod'),
(10, 'Vũ tuấn anh12134', '0865438002', '54 triều khúc thanh xuân nam hà nội', 'vtuananhh@gmail.com', 'cod');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sliders`
--

CREATE TABLE `sliders` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `sliders`
--

INSERT INTO `sliders` (`id`, `title`, `description`, `status`, `image`) VALUES
(1, 'banner', 'PC_25802191713072023', 1, '1689575870PC_25802191713072023.jpg'),
(3, 'slider', '17481_Banner-NGÀY-ĐỘC---SĂN-SALE-ĐỘC', 1, '168957589517481_Banner-NGÀY-ĐỘC---SĂN-SALE-ĐỘC-1200x628.jpg'),
(4, 'slider', 'san-sale-don-le-cung-avakids-nhan-ma-giam-them-d', 1, '1689575919san-sale-don-le-cung-avakids-nhan-ma-giam-them-d-845x442.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`, `status`) VALUES
(1, 'tadmin', 'admin@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 1),
(6, 'tabc123', 'tabc123@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vnpay`
--

CREATE TABLE `vnpay` (
  `id` int(11) NOT NULL,
  `vnp_Amount` varchar(50) NOT NULL,
  `vnp_BankCode` varchar(50) NOT NULL,
  `vnp_BankTranNo` varchar(50) NOT NULL,
  `vnp_CardType` varchar(50) NOT NULL,
  `vnp_OrderInfo` varchar(50) NOT NULL,
  `vnp_PayDate` varchar(50) NOT NULL,
  `vnp_ResponseCode` varchar(50) NOT NULL,
  `vnp_TmnCode` varchar(50) NOT NULL,
  `vnp_TransactionNo` varchar(50) NOT NULL,
  `vnp_TransactionStatus` varchar(50) NOT NULL,
  `vnp_TxnRef` varchar(50) NOT NULL,
  `vnp_SecureHash` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `category_blogs`
--
ALTER TABLE `category_blogs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `momo`
--
ALTER TABLE `momo`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `shipping`
--
ALTER TABLE `shipping`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `vnpay`
--
ALTER TABLE `vnpay`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `category_blogs`
--
ALTER TABLE `category_blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `momo`
--
ALTER TABLE `momo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT cho bảng `shipping`
--
ALTER TABLE `shipping`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `vnpay`
--
ALTER TABLE `vnpay`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
