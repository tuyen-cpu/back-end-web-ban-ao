DROP DATABASE IF EXISTS cdweb2022;

CREATE DATABASE cdweb2022;
USE cdweb2022;
SET NAMES utf8 ;


DROP TABLE IF EXISTS `role`;
  
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255)    DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `role` 
VALUES 
(1,'client'),
(2,'admin');

DROP TABLE IF EXISTS `user`;
  
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `birthday` datetime DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `email` varchar(255)    DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `password` varchar(255)    DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `token` varchar(255)    DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `username` varchar(255)    DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `user` VALUES 
(1,NULL,NULL,NULL,NULL,'$2a$10$Wuvn5QeH9/hNzscjyV/DG.Oz1x2bf57KTMVjtrE/VOM8ifZE.2/TG',1,NULL,NULL,'u1'), /*pwd : 123456*/
(2,NULL,NULL,NULL,NULL,'$2a$10$Wuvn5QeH9/hNzscjyV/DG.Oz1x2bf57KTMVjtrE/VOM8ifZE.2/TG',1,NULL,NULL,'u2');

DROP TABLE IF EXISTS `user_role`;
  
CREATE TABLE `user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`),
  CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `user_role` VALUES (1,1),(2,2);

DROP TABLE IF EXISTS `address`;
  
CREATE TABLE `address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `city` varchar(255)    DEFAULT NULL,
  `company` varchar(255)    DEFAULT NULL,
  `country` varchar(255)    DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `district` varchar(255)    DEFAULT NULL,
  `fullname` varchar(255)    DEFAULT NULL,
  `phone` varchar(255)    DEFAULT NULL,
  `street` varchar(255)    DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `ward` varchar(255)    DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKda8tuywtf0gb6sedwk7la1pgi` (`user_id`),
  CONSTRAINT `FKda8tuywtf0gb6sedwk7la1pgi` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `address` 
VALUES 
 (1,'Tỉnh Cao Bằng',NULL,'Việt Nam',NULL,'Huyện Bảo Lạc','AN','0123456789','Cầu Kì','2022-06-22 18:10:55','Xã Thượng Hà',1),
(2,'HCM',NULL,NULL,NULL,NULL,'Hải',NULL,NULL,NULL,NULL,2);

DROP TABLE IF EXISTS `category`;
  
CREATE TABLE `category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255)    DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `category` VALUES (1,'Laptop'),(2,'RAM'),(3,'SSD'),(4,'USB');

DROP TABLE IF EXISTS `attribute`;
  
CREATE TABLE `attribute` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255)    DEFAULT NULL,
  `value` varchar(255)    DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1eji3t1hu871hkq00mx58v7w3` (`category_id`),
  CONSTRAINT `FK1eji3t1hu871hkq00mx58v7w3` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `attribute` VALUES (1,'THƯƠNG HIỆU','Acer',1),(2,'THƯƠNG HIỆU','Asus',1),(3,'THƯƠNG HIỆU','Dell',1),(4,'THƯƠNG HIỆU','Gigabyte',1),(5,'THƯƠNG HIỆU','HP',1),(6,'THƯƠNG HIỆU','HUAWEI',1),(7,'THƯƠNG HIỆU','Intel',1),(8,'THƯƠNG HIỆU','Lenovo',1),(9,'THƯƠNG HIỆU','MSI',1),(10,'NHU CẦU','Mỏng nhẹ',1),(11,'NHU CẦU','Gaming và Đồ họa',1),(12,'KÍCH THƯỚC MÀN HÌNH','13 Inch',1),(13,'KÍCH THƯỚC MÀN HÌNH','14 Inch',1),(14,'KÍCH THƯỚC MÀN HÌNH','15.6 Inch',1),(15,'KÍCH THƯỚC MÀN HÌNH','17.3 Inch',1),(16,'CPU','Intel EVO',1),(17,'CPU','Ryzen 3',1),(18,'CPU','Ryzen 5',1),(19,'CPU','Ryzen 7',1),(20,'CPU','Ryzen 9',1),(21,'CPU','Intel Core i3',1),(22,'CPU',' Intel Core i5',1),(23,'VGA','MX330',1),(24,'VGA','MX350',1),(25,'VGA','MX450',1),(26,'VGA','RX 5500M',1),(27,'VGA','GTX 1650',1),(28,'VGA','GTX 1660',1),(29,'VGA','RTX 2070',1),(30,'VGA','RTX A2000',1),(31,'VGA','Quadro',1),(32,'VGA','RX 6600',1),(33,'VGA','RX 6700',1),(34,'VGA','RTX 3050',1),(35,'VGA','RTX 3050 Ti',1),(36,'VGA','RTX 3060',1),(37,'VGA','RTX 3070',1),(38,'VGA','RTX 3080',1),(39,'CPU',' Intel Core i7',1),(40,'CPU',' Intel Core i9',1);

DROP TABLE IF EXISTS `voucher`;
  
CREATE TABLE `voucher` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255)    DEFAULT NULL,
  `cost` bigint(20) DEFAULT NULL,
  `ended_date` datetime DEFAULT NULL,
  `started_date` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


INSERT INTO `voucher` (`id`, `code`, `cost`, `ended_date`, `started_date`, `status`, `time`) 
VALUES 
('1', 'aaa', '20000', '2022-10-17 12:15:00', '2022-5-17 12:15:00', '1', '14'),
('2', 'bbb', '20000', '2022-6-17 12:15:00', '2022-4-17 12:15:00', '1', '1'),
('3', 'ccc', '40000', '2022-10-17 12:15:00', '2022-5-17 12:15:00', '1', '4'),
('4', 'ddd', '20000', '2022-6-17 12:15:00', '2022-4-17 12:15:00', '1', '1');

DROP TABLE IF EXISTS `bill`;
  
CREATE TABLE `bill` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_date` datetime DEFAULT NULL,
  `shipping_cost` bigint(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `total` bigint(20) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `address_id` bigint(20) DEFAULT NULL,
  `voucher_id` bigint(20) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1f5an6dq4k8u0idf4oxthpf8t` (`address_id`),
  KEY `FKsp8lqd3ijs9y7t59djo0y1g1c` (`voucher_id`),
  CONSTRAINT `FK1f5an6dq4k8u0idf4oxthpf8t` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `FKsp8lqd3ijs9y7t59djo0y1g1c` FOREIGN KEY (`voucher_id`) REFERENCES `voucher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `bill` 
VALUES 
(1,'2022-05-03 12:15:00',40000,1,60000000,'2022-05-03 12:15:00',1,1,''),
(2,'2022-06-22 18:10:55',25000,0,15535300,'2022-06-22 18:10:55',1,NULL,'Gần nhà');


DROP TABLE IF EXISTS `product`;
  
CREATE TABLE `product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `discount` int(11) DEFAULT NULL,
  `long_description` text   ,
  `name` varchar(255)    DEFAULT NULL,
  `price` bigint(20) DEFAULT NULL,
  `quantity` bigint(20) DEFAULT NULL,
  `short_description` text   ,
  `status` int(11) DEFAULT NULL,
  `summary` varchar(255)    DEFAULT NULL,
  `view` bigint(20) DEFAULT NULL,
  `promotion` varchar(255)    DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `product` 
VALUES (1,2,'<div class=\"text-full\"><p><strong>Laptop Gaming Gigabyte AORUS 17 XE5-73VN534GH </strong> đáp ứng đủ các tiêu chuẩn của người chơi chuyên nghiệp. Được trang bị GPU GeForce RTX 30 series mới nhất, công nghệ làm mát Windforce Infinity độc quyền, cùng với bộ xử lý Intel Core H thế hệ thứ 12, đảm bảo sự ổn định trong việc cung cấp 100% hiệu suất đầu ra, mang đến cho bạn hiệu ứng hiển thị tốt nhất và chân thực trong các trò chơi. </p><p><img src=\"//bizweb.sapocdn.net/100/329/122/files/screenshot-1648700593.jpg?v=1648700644129\" style=\"width: 100%;\"></p><table cellpadding=\"1\" width=\"100%\" style=\"border-collapse: collapse; margin-bottom: 15px;\"><tbody><tr><td width=\"70%\" style=\"text-align: left; padding: 15px; border: 1px solid #e1e1e1;\"><p><span style=\"color: #000000;\"><span style=\"font-size: 24px;\"><b>Bộ xử lý Intel Core thế hệ 12</b></span></span></p><p><span style=\"color: #000000;\"><strong>AORUS 17&nbsp;XE5</strong>&nbsp;được trang bị bộ vi xử lý Intel Core thế hệ 12 với 14 nhân và xung nhịp lên đến 4.7GHz giúp tăng đến 32% hiệu suất so với thế hệ trước để bạn dễ dàng trải nghiệm các tác vụ nặng một cách dễ dàng.</span></p></td><td width=\"30%\" style=\"padding: 15px; border: 1px solid #e1e1e1;\"><span style=\"color: #000000;\"><img data-thumb=\"original\" original-height=\"631\" original-width=\"1019\" src=\"//bizweb.sapocdn.net/100/329/122/files/screenshot-1645002575.png?v=1645003425022\" style=\"width: 100%;\"></span></td></tr></tbody></table><table cellpadding=\"1\" width=\"100%\" style=\"border-collapse: collapse; margin-bottom: 15px;\"><tbody><tr><td width=\"30%\" style=\"padding: 15px; border: 1px solid #e1e1e1;\"><span style=\"color: #000000;\"><img data-thumb=\"original\" original-height=\"1080\" original-width=\"1920\" src=\"//bizweb.sapocdn.net/100/329/122/files/367-nvidia-ampere-gpu-general.jpg?v=1627703999772\" style=\"width: 100%;\"></span></td><td width=\"70%\" style=\"text-align: left; padding: 15px; border: 1px solid #e1e1e1;\"><p><span style=\"color: #000000;\"><span style=\"font-size: 18pt;\"><strong>GeForce RTX™ 30 Series</strong></span></span></p><p><span style=\"color: #000000;\">Trang bị GPU&nbsp;GeForce RTX&nbsp;30 Series giúp&nbsp;<em><strong>Gigabyte AORUS 17</strong></em>&nbsp;mang lại hiệu suất tối thượng cho game thủ và nhà&nbsp;sáng tạo video. Card hoạt động trên nền tảng Ampere, Kiến trúc RTX thế hệ thứ 2 của NVIDIA với nhân RT, nhân Tensor và bộ đa xử lý phát trực tuyến mới, cung cấp đồ họa dò tia chân thực nhất và các tính năng AI tiên tiến. </span></p></td></tr></tbody></table><table cellpadding=\"1\" width=\"100%\" style=\"border-collapse: collapse; margin-bottom: 15px;\"><tbody><tr><td width=\"70%\" style=\"text-align: left; padding: 15px; border: 1px solid #e1e1e1;\"><p><span style=\"color: #000000;\"><span style=\"font-size: 24px;\"><b>Bộ xử lý Intel Core thế hệ 12</b></span></span></p><p><span style=\"color: #000000;\"><strong>AORUS 17&nbsp;XE5</strong>&nbsp;được trang bị bộ vi xử lý Intel Core thế hệ 12 với 14 nhân và xung nhịp lên đến 4.7GHz giúp tăng đến 32% hiệu suất so với thế hệ trước để bạn dễ dàng trải nghiệm các tác vụ nặng một cách dễ dàng.</span></p></td><td width=\"30%\" style=\"padding: 15px; border: 1px solid #e1e1e1;\"><span style=\"color: #000000;\"><img data-thumb=\"original\" original-height=\"631\" original-width=\"1019\" src=\"//bizweb.sapocdn.net/100/329/122/files/screenshot-1645002575.png?v=1645003425022\" style=\"width: 100%;\"></span></td></tr></tbody></table><table cellpadding=\"1\" width=\"100%\" style=\"border-collapse: collapse; margin-bottom: 15px;\"><tbody><tr><td width=\"30%\" style=\"padding: 15px; border: 1px solid #e1e1e1;\"><span style=\"color: #000000;\"><img data-thumb=\"original\" original-height=\"1080\" original-width=\"1920\" src=\"//bizweb.sapocdn.net/100/329/122/files/367-nvidia-ampere-gpu-general.jpg?v=1627703999772\" style=\"width: 100%;\"></span></td><td width=\"70%\" style=\"text-align: left; padding: 15px; border: 1px solid #e1e1e1;\"><p><span style=\"color: #000000;\"><span style=\"font-size: 18pt;\"><strong>GeForce RTX™ 30 Series</strong></span></span></p><p><span style=\"color: #000000;\">Trang bị GPU&nbsp;GeForce RTX&nbsp;30 Series giúp&nbsp;<em><strong>Gigabyte AORUS 17</strong></em>&nbsp;mang lại hiệu suất tối thượng cho game thủ và nhà&nbsp;sáng tạo video. Card hoạt động trên nền tảng Ampere, Kiến trúc RTX thế hệ thứ 2 của NVIDIA với nhân RT, nhân Tensor và bộ đa xử lý phát trực tuyến mới, cung cấp đồ họa dò tia chân thực nhất và các tính năng AI tiên tiến. </span></p></td></tr></tbody></table></div>','Laptop Gaming Gigabyte AORUS 17 XE5-73VN534GH (i7-12700H, RTX 3070 Ti 8GB, Ram 16GB DDR5, SSD 1TB, 17.3 Inch IPS 360Hz FHD)',60990000,3,'đáp ứng đủ các tiêu chuẩn của người chơi chuyên nghiệp. Được trang bị GPU GeForce RTX 30 series mới nhất, công nghệ làm mát Windforce Infinity độc quyền, cùng với bộ xử lý Intel Core H thế hệ thứ 12, đảm bảo sự ổn định trong việc cung cấp 100% hiệu suất đầu ra, mang đến cho bạn hiệu ứng hiển thị tốt nhất và chân thực trong các trò chơi.',1,'CPU: i7-12700H (Up to 4.7GHz) 14 Cores 20 Threads; VGA: GeForce RTX 3070 Ti 8GB; Ram: 16GB (2x8GB) DDR5 4800MHz; SSD: 1TB SSD M.2 PCIe Gen4 x4; Màn hình: 17.3\'\' IPS 360Hz FHD; BẢO HÀNH 2 năm toàn cầu',NULL,'Balo Gaming Aorus.;USB Aorus Chibi 64GB.;Gấu bông Aorus Eagle.;Túi chống sốc.'),
		(2,16,'<div class=\"text-full\"><p><strong> Laptop Dell Inspiron 16 5625 70281537 </strong> mang vẻ bề ngoài thanh lịch, sang trọng cùng thiết kế mỏng, nhẹ và hiệu năng vượt trội từ bộ vi xử lý AMD Ryzen 5000 Series, mang đến khả năng di động vượt trội hơn bao giờ hết. </p><p><img src=\"//bizweb.sapocdn.net/100/329/122/files/laptop-inspiron-16-5625-pdp-mod01-fpr.jpg?v=1648199714183\" style=\"width: 100%;\"></p><table cellpadding=\"1\" width=\"100%\" style=\"border-collapse: collapse; margin-bottom: 15px;\"><tbody><tr><td width=\"70%\" style=\"text-align: left;\"><p><span style=\"color: #000000;\"><span style=\"font-size: 18pt;\"><strong>Hiệu suất vượt bật</strong></span></span></p><p><span style=\"color: #000000;\"><strong>Laptop Dell Inspiron 16 5625</strong>&nbsp;được trang bị vi xử lý AMD Ryzen 5000 Series mang đến hiệu năng xử lý vượt trội để máy trở nên cơ động giúp bạn dễ dàng làm việc một cách hiệu quả nhất.</span></p></td><td width=\"30%\"><span style=\"color: #000000;\"><img data-thumb=\"original\" original-height=\"501\" original-width=\"1000\" src=\"//bizweb.sapocdn.net/100/329/122/files/jtlhwyhukjr8g4sfqmtxad.jpg?v=1648199871059\" style=\"width: 100%;\"></span></td></tr></tbody></table><table cellpadding=\"1\" width=\"100%\" style=\"border-collapse: collapse; margin-bottom: 15px;\"><tbody><tr><td width=\"30%\"><span style=\"color: #000000;\"><img data-thumb=\"original\" original-height=\"750\" original-width=\"950\" src=\"//bizweb.sapocdn.net/100/329/122/files/laptop-inspiron-16-5625-pdp-mod02.jpg?v=1648199688017\" style=\"width: 100%;\"></span></td><td width=\"70%\" style=\"text-align: left;\"><p><span style=\"color: #000000;\"><span style=\"font-size: 18pt;\"><strong>Màn hình rực rỡ</strong></span></span></p><p><span style=\"color: #000000;\"><strong>Laptop Dell Inspiron 16 5625</strong>&nbsp;mang đến hình ảnh&nbsp;tươi sáng và đầy màu sắc. Ngoài ra&nbsp;ComfortView là giải pháp được chứng nhận bởi TÜV Rheinland&nbsp;giúp giảm phát thải ánh sáng xanh có hại cùng giảm nhấp nháy để thân thiện hơn với đôi mắt của bạn.</span></p></td></tr></tbody></table><table cellpadding=\"1\" width=\"100%\" style=\"border-collapse: collapse; margin-bottom: 15px;\"><tbody><tr><td width=\"70%\" style=\"text-align: left;\"><p><span style=\"color: #000000;\"><span style=\"font-size: 18pt;\"><strong>Camera 1080P</strong></span></span></p><p><span style=\"color: #000000;\"><strong>Laptop Dell Inspiron 16 5625&nbsp;</strong>với camera FHD được tích hợp Micro&nbsp;kép và AI giúp giảm tiếng ồn xung quanh. Khi bạn cần ngắt kết nối,&nbsp;màn trập riêng tư của camera giúp bạn yên tâm hơn về bảo mật.</span></p></td><td width=\"30%\"><span style=\"color: #000000;\"><img data-thumb=\"original\" original-height=\"1056\" original-width=\"1503\" src=\"//bizweb.sapocdn.net/100/329/122/files/laptop-inspiron-16-5625-pdp-mod03.jpg?v=1648199699688\" style=\"width: 100%;\"></span></td></tr></tbody></table></div>','Laptop Dell Inspiron 16 5625 70281537 (Ryzen 5 5625U, Radeon Graphics, Ram 8GB DDR4, SSD 512GB, 16 Inch FHD)',24990000,6,'mang vẻ bề ngoài thanh lịch, sang trọng cùng thiết kế mỏng, nhẹ và hiệu năng vượt trội từ bộ vi xử lý AMD Ryzen 5000 Series, mang đến khả năng di động vượt trội hơn bao giờ hết.',1,'CPU: Ryzen 5 5625U (2.3GHz~4.3GHz) 6 Cores 12 Threads; VGA: AMD Radeon Graphics; Ram: 8GB DDR4 3200MHz; Ổ cứng: 512GB SSD M.2 PCIe; Màn hình: 16\" FHD; Bảo hành 1 năm.',NULL,'Balo Gaming Aorus.;USB Aorus Chibi 64GB.;Gấu bông Aorus Eagle.;Túi chống sốc.'),
		(3,12,'<div class=\"text-full\"><p><strong> Laptop Gaming Acer Predator Triton 300 PT315-53-7440 NH.QDRSV.003 </strong> kết hợp vừa chơi game giải trí, vừa làm việc với bộ xử lý Intel Core-H thế hệ thứ 11 mạnh mẽ cùng card đồ họa RTX 30 series cho phép bạn xử lý nhiều tác vụ cùng lúc một cách dễ dàng. Hơn nữa, màn hình QHD lên đến 165Hz 3ms, cùng dung lượng lưu trữ lớn và công nghệ Wi-Fi 6 Killer hỗ trợ cho bạn thực hiện các vai trò khác nhau dễ dàng. </p><p><img src=\"https://bizweb.sapocdn.net/100/329/122/files/predator-triton-300.jpg?v=1650621081903\" style=\"width: 100%;\"></p><table cellpadding=\"1\" width=\"100%\" style=\"border-collapse: collapse; margin-bottom: 15px;\"><tbody><tr><td width=\"30%\"><img data-thumb=\"original\" original-height=\"800\" original-width=\"1440\" src=\"//bizweb.sapocdn.net/100/329/122/files/predator-triton-300-1.jpg?v=1650621897310\" style=\"width: 100%;\"></td><td width=\"70%\" style=\"text-align: left;\"><p><span style=\"color: #000000;\"><span style=\"font-size: 18pt;\"><strong>Hiệu năng mạnh mẽ</strong></span></span></p><p><span style=\"color: #000000;\"><strong>Acer Predator Triton 300</strong> trang bị&nbsp;bộ vi xử lý Intel Core-H thế hệ thứ 11 mạnh mẽ với 8&nbsp;nhân 16&nbsp;luồng,&nbsp;cho phép bạn xử lý nhiều tác vụ cùng lúc một cách dễ dàng.</span></p></td></tr></tbody></table><table cellpadding=\"1\" width=\"100%\" style=\"border-collapse: collapse; margin-bottom: 15px;\"><tbody><tr><td width=\"70%\" style=\"text-align: left;\"><p><span style=\"color: #000000;\"><span style=\"font-size: 18pt;\"><strong>GeForce RTX™ 30 Series</strong></span></span></p><p><span style=\"color: #000000;\"><strong>Acer Predator Triton 300&nbsp;</strong>trang bị GPU GeForce RTX 30 Series mang lại hiệu suất tối thượng cho game thủ và nhà sáng tạo video. Card hoạt động trên nền tảng Ampere, Kiến trúc RTX thế hệ thứ 2 của NVIDIA với nhân RT, nhân Tensor và bộ đa xử lý phát trực tuyến mới, cung cấp đồ họa dò tia chân thực nhất và các tính năng AI tiên tiến.</span></p></td><td width=\"30%\"><img data-thumb=\"original\" original-height=\"773\" original-width=\"1230\" src=\"//bizweb.sapocdn.net/100/329/122/files/screenshot-1633151838.png?v=1633151854151\" style=\"width: 100%;\"></td></tr></tbody></table><table cellpadding=\"1\" width=\"100%\" style=\"border-collapse: collapse; margin-bottom: 15px;\"><tbody><tr><td width=\"30%\"><span style=\"color: #000000;\"><img data-thumb=\"original\" original-height=\"800\" original-width=\"1123\" src=\"//bizweb.sapocdn.net/100/329/122/files/predator-helios300-ksp-6.jpg?v=1633152231367\" style=\"width: 100%;\"></span></td><td width=\"70%\" style=\"text-align: left;\"><p><span style=\"color: #000000;\"><span style=\"font-size: 18pt;\"><strong>Màn hình QHD&nbsp;165Hz chân thực</strong></span></span></p><p><span style=\"color: #000000;\">Trang bị màn hình IPS QHD trên&nbsp;<strong>Acer Predator Triton 300</strong>&nbsp;bùng nổ tần số quét&nbsp;lên đến 165Hz 3ms giúp cho việc&nbsp;trải nghiệm hình ảnh một cách liền mạch, không bị rách với độ mờ tối thiểu nhất.</span></p></td></tr></tbody></table></div>','Laptop Gaming Acer Predator Triton 300 PT315-53-7440 NH.QDRSV.003 (i7-11800H, RTX 3050 Ti 4GB, Ram 8GB, SSD 512GB, 15.6 Inch IPS 165Hz QHD)',36990000,2,'kết hợp vừa chơi game giải trí, vừa làm việc với bộ xử lý Intel Core-H thế hệ thứ 11 mạnh mẽ cùng card đồ họa RTX 30 series cho phép bạn xử lý nhiều tác vụ cùng lúc một cách dễ dàng. Hơn nữa, màn hình QHD lên đến 165Hz 3ms, cùng dung lượng lưu trữ lớn và công nghệ Wi-Fi 6 Killer hỗ trợ cho bạn thực hiện các vai trò khác nhau dễ dàng.',1,'CPU: i7-11800H (2.4GHz~4.6GHz) 8 Cores 16 Threads; VGA: GeForce RTX 3050 Ti 4GB; Ram: 8GB DDR4 3200 MHz; Ổ cứng: 512GB SSD M.2 PCIe; Màn hình: 15.6\'\' IPS 165Hz QHD; Bảo hành 1 năm.',NULL,'Balo Gaming Aorus.;USB Aorus Chibi 64GB.;Gấu bông Aorus Eagle.;Túi chống sốc.'),
		(4,8,'<div class=\"text-full\"><p><strong> Laptop Dell Inspiron 15 3511 70270652 </strong> mang vẻ bề ngoài thanh lịch, sang trọng cùng thiết kế mỏng, nhẹ và hiệu năng vượt trội từ bộ vi xử lý Intel Core thế hệ 11th, mang đến khả năng di động vượt trội hơn bao giờ hết. </p><p><img src=\"https://bizweb.sapocdn.net/100/329/122/files/predator-triton-300.jpg?v=1650621081903\" style=\"width: 100%;\"></p><table cellpadding=\"1\" width=\"100%\" style=\"border-collapse: collapse; margin-bottom: 15px;\"><tbody><tr><td width=\"30%\"><span style=\"color: #000000;\"><img data-thumb=\"original\" original-height=\"680\" original-width=\"1020\" src=\"//bizweb.sapocdn.net/100/329/122/files/dell-inspiron-15-3511-i5-70267060-7.jpg?v=1639383916391\" style=\"width: 100%;\"></span></td><td width=\"70%\" style=\"text-align: left;\"><p><span style=\"color: #000000;\"><span style=\"font-size: 18pt;\"><strong>Hiệu suất vượt bật</strong></span></span></p><p><span style=\"color: #000000;\"><strong>Laptop Dell Inspiron 15 3511</strong>&nbsp;được trang bị vi xử lý Intel Core Tiger Lake thế hệ 11 mang đến hiệu năng xử lý vượt trội để máy trở nên cơ động giúp bạn dễ dàng làm việc một cách hiệu quả nhất.</span></p></td></tr></tbody></table><table cellpadding=\"1\" width=\"100%\" style=\"border-collapse: collapse; margin-bottom: 15px;\"><tbody><tr><td width=\"70%\" style=\"text-align: left;\"><p><span style=\"color: #000000;\"><span style=\"font-size: 18pt;\"><strong>Trang bị card đồ họa rời</strong></span></span></p><p><span style=\"color: #000000;\">Card đồ họa NVIDIA GeForce MX350 giúp tăng tốc <strong>Laptop Dell Inspiron 15 3511</strong>&nbsp;của bạn cả trong công việc lẫn giải trí. Giờ đây bạn có thể nhận được tốc độ xử lí cao hơn với các tác vụ chỉnh sửa ảnh, video và chơi game.</span></p></td><td width=\"30%\"><img data-thumb=\"original\" original-height=\"350\" original-width=\"557\" src=\"//bizweb.sapocdn.net/100/329/122/files/nvidia-geforce-mx330-mx350.jpg?v=1635327843752\" style=\"width: 100%;\"></td></tr></tbody></table><table cellpadding=\"1\" width=\"100%\" style=\"border-collapse: collapse; margin-bottom: 15px;\"><tbody><tr><td width=\"30%\"><span style=\"color: #000000;\"><img data-thumb=\"original\" original-height=\"467\" original-width=\"514\" src=\"//bizweb.sapocdn.net/100/329/122/files/screenshot-1634889628.png?v=1634889640483\" style=\"width: 100%;\"></span></td><td width=\"70%\" style=\"text-align: left;\"><p><span style=\"color: #000000;\"><span style=\"font-size: 18pt;\"><strong>Ứng dụng&nbsp;Dell Mobile Connect</strong></span></span></p><p><span style=\"color: #000000;\"><strong>Laptop Dell Inspiron 15 3511</strong>&nbsp;hợp nhất với thiết bị di động của bạn qua ứng dụng Dell Mobile Connect. Bạn có thể dễ dàng làm việc như nhận cuộc gọi&nbsp;hay&nbsp;tin nhắn SMS trực tiếp từ Laptop Dell hay truyền tải các tệp tin từ điện thoại một cách dễ dàng hơn.</span></p></td></tr></tbody></table></div>','Laptop Dell Inspiron 15 3511 70270652 (i7-1165G7, MX350 2GB, Ram 8GB DDR4, SSD 512GB, 15.6 Inch FHD)',25490000,1,'mang vẻ bề ngoài thanh lịch, sang trọng cùng thiết kế mỏng, nhẹ và hiệu năng vượt trội từ bộ vi xử lý Intel Core thế hệ 11th, mang đến khả năng di động vượt trội hơn bao giờ hết.',1,'CPU: i7-1165G7 (Up to 4.7GHz) 4 Cores 8 Threads; VGA: NVIDIA MX350 2GB; Ram: 8GB DDR4 3200MHz; Ổ cứng: 512GB SSD M.2 PCIe; Màn hình: 15.6\" FHD; Bảo hành 1 năm.',NULL,'Balo Gaming Aorus.;USB Aorus Chibi 64GB.;Gấu bông Aorus Eagle.;Túi chống sốc.'),(5,8,'<div class=\"text-full\"><p><strong> Laptop HP Probook 430 G8 614K7PA </strong> mang đến vẻ bề ngoài thanh lịch và cực kỳ hiện đại với tông màu bạc sang trọng. Bên cạnh màu sắc đẹp mắt, laptop khiến người dùng ấn tượng bởi thiết kế siêu mỏng và nhẹ mang đến tính di động hơn bao giờ hết. </p><p><img src=\"https://bizweb.sapocdn.net/100/329/122/files/predator-triton-300.jpg?v=1650621081903\" style=\"width: 100%;\"></p><table cellpadding=\"1\" width=\"100%\" style=\"border-collapse: collapse; margin-bottom: 15px;\"><tbody><tr><td width=\"30%\"><img data-thumb=\"original\" original-height=\"1342\" original-width=\"2100\" src=\"//bizweb.sapocdn.net/100/329/122/files/c07046015.jpg?v=1638417362998\" style=\"width: 100%;\"></td><td width=\"70%\" style=\"text-align: left;\"><p><span style=\"color: #000000;\"><span style=\"font-size: 18pt;\"><strong>Thiết kế khung nhôm sang trọng</strong></span></span></p><p><span style=\"color: #000000;\"><strong>Laptop HP Probook 430 G8</strong> mang đến vẻ bề ngoài thanh lịch&nbsp;và cực kỳ hiện đại với tông&nbsp;màu bạc sang trọng. Bên cạnh màu sắc đẹp mắt, laptop khiến người dùng ấn tượng bởi&nbsp;thiết kế khung nhôm mỏng và nhẹ&nbsp;mang đến tính di động hơn bao giờ hết.</span></p></td></tr></tbody></table><table cellpadding=\"1\" width=\"100%\" style=\"border-collapse: collapse; margin-bottom: 15px;\"><tbody><tr><td width=\"70%\" style=\"text-align: left;\"><p><span style=\"color: #000000;\"><span style=\"font-size: 18pt;\"><strong>Trang bị card đồ họa rời</strong></span></span></p><p><span style=\"color: #000000;\">Card đồ họa NVIDIA GeForce MX350 giúp tăng tốc <strong>Laptop Dell Inspiron 15 3511</strong>&nbsp;của bạn cả trong công việc lẫn giải trí. Giờ đây bạn có thể nhận được tốc độ xử lí cao hơn với các tác vụ chỉnh sửa ảnh, video và chơi game.</span></p></td><td width=\"30%\"><img data-thumb=\"original\" original-height=\"350\" original-width=\"557\" src=\"//bizweb.sapocdn.net/100/329/122/files/nvidia-geforce-mx330-mx350.jpg?v=1635327843752\" style=\"width: 100%;\"></td></tr></tbody></table><table cellpadding=\"1\" width=\"100%\" style=\"border-collapse: collapse; margin-bottom: 15px;\"><tbody><tr><td width=\"30%\"><span style=\"color: #000000;\"><img data-thumb=\"original\" original-height=\"467\" original-width=\"514\" src=\"//bizweb.sapocdn.net/100/329/122/files/screenshot-1634889628.png?v=1634889640483\" style=\"width: 100%;\"></span></td><td width=\"70%\" style=\"text-align: left;\"><p><span style=\"color: #000000;\"><span style=\"font-size: 18pt;\"><strong>Ứng dụng&nbsp;Dell Mobile Connect</strong></span></span></p><p><span style=\"color: #000000;\"><strong>Laptop Dell Inspiron 15 3511</strong>&nbsp;hợp nhất với thiết bị di động của bạn qua ứng dụng Dell Mobile Connect. Bạn có thể dễ dàng làm việc như nhận cuộc gọi&nbsp;hay&nbsp;tin nhắn SMS trực tiếp từ Laptop Dell hay truyền tải các tệp tin từ điện thoại một cách dễ dàng hơn.</span></p></td></tr></tbody></table></div>','Laptop HP Probook 430 G8 614K7PA (i3-1115G4, UHD Graphics, Ram 8GB, SSD 256GB, 13.3 Inch HD)',14890000,15,'mang đến vẻ bề ngoài thanh lịch và cực kỳ hiện đại với tông màu bạc sang trọng. Bên cạnh màu sắc đẹp mắt, laptop khiến người dùng ấn tượng bởi thiết kế siêu mỏng và nhẹ mang đến tính di động hơn bao giờ hết.',1,'CPU: i3-1115G4 (Up to 4.1GHz) 2 Cores 4 Threads; VGA: Intel UHD Graphics; Ram: 8GB DDR4 3200MHz; Ổ cứng: 256GB SSD M.2 PCIe; Màn hình: 13.3\'\' HD; Bảo hành 1 năm.',NULL,'Balo Gaming Aorus.;USB Aorus Chibi 64GB.;Gấu bông Aorus Eagle.;Túi chống sốc.');


DROP TABLE IF EXISTS `image`;
  
CREATE TABLE `image` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `link` varchar(255)    DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKgpextbyee3uk9u6o2381m7ft1` (`product_id`),
  CONSTRAINT `FKgpextbyee3uk9u6o2381m7ft1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `image`
VALUES (1,'laptop-gaming-gigabyte-aorus-17-xe5-73vn534gh.webp',1),
(2,'laptop-gaming-gigabyte-aorus-17-xe5-73vn534gh-3.webp',1),
(3,'laptop-gaming-gigabyte-aorus-17-xe5-73vn534gh-2.webp',1),
(4,'laptop-dell-inspiron-16-5625-70281537.webp',2),
(5,'laptop-dell-inspiron-16-5625-2.webp',2),
(6,'laptop-dell-inspiron-16-5625-1.webp',2),
(7,'laptop-gaming-acer-predator-triton-300-pt315-53-7440-nh-qdrsv-003.webp',3),
(8,'laptop-gaming-acer-predator-triton-300-pt315-53-7440-nh-qdrsv-003-3.webp',3),
(9,'laptop-gaming-acer-predator-triton-300-pt315-53-7440-nh-qdrsv-003-2.webp',3),
(10,'laptop-dell-inspiron-15-3511-70270652.webp',4),
(11,'laptop-dell-inspiron-15-3511-70270650-6-a1ac66eb-4a80-4f42-aafe-58f031578cef.webp',4),
(12,'laptop-dell-inspiron-15-3511-70270650-2-645e50dc-f1ad-4d61-831f-6f1df99cd063.webp',4),
(13,'laptop-hp-probook-430-g8-614k7pa.webp',5),
(14,'laptop-hp-probook-430-g8-614k9pa-4-2e0fab15-c0da-4156-b15a-953861447c3d.webp',5),
(15,'laptop-hp-probook-430-g8-614k9pa-1-8e366d79-7676-4ac2-838e-a01262e11d8d.webp',5);

DROP TABLE IF EXISTS `comment`;
  
CREATE TABLE `comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(255)    DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `star` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `url` text  DEFAULT NULL,
  `phone` varchar(50)    DEFAULT NULL,
  `fullname` varchar(150)    DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKm1rmnfcvq5mk26li4lit88pc5` (`product_id`),
  KEY `FK8kcum44fvpupyw6f5baccx25c` (`user_id`),
  CONSTRAINT `FK8kcum44fvpupyw6f5baccx25c` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKm1rmnfcvq5mk26li4lit88pc5` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `order_detail`;
  
CREATE TABLE `order_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `price` bigint(20) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `bill_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8xyxpaxwufax0438f2rvtb2xs` (`bill_id`),
  KEY `FKb8bg2bkty0oksa3wiq5mp5qnc` (`product_id`),
  CONSTRAINT `FK8xyxpaxwufax0438f2rvtb2xs` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`id`),
  CONSTRAINT `FKb8bg2bkty0oksa3wiq5mp5qnc` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `order_detail` VALUES (1,25000000,1,1,2),(2,15510300,1,2,1);

DROP TABLE IF EXISTS `product_attribute`;
  
CREATE TABLE `product_attribute` (
  `product_id` bigint(20) NOT NULL,
  `attribute_id` bigint(20) NOT NULL,
  KEY `FKefc9famxhv98xs6686269a79` (`attribute_id`),
  KEY `FKlefs59y5kmsbu017n1wp10gf2` (`product_id`),
  CONSTRAINT `FKefc9famxhv98xs6686269a79` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`id`),
  CONSTRAINT `FKlefs59y5kmsbu017n1wp10gf2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `product_attribute` VALUES (1,4),(1,11),(1,15),(1,19),(1,37),(2,3),(2,10),(2,14),(2,18),(2,26),(3,1),(3,10),(3,14),(3,39),(3,35),(4,3),(4,10),(4,14),(4,39),(4,24),(5,5),(5,12),(5,21),(5,10),(5,23);

DROP TABLE IF EXISTS `response`;
  
CREATE TABLE `response` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `comment_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjo7d296slarpmfr8p3oeqlsx2` (`comment_id`),
  KEY `FKo86so3ptvukgyfb2rkb63hab4` (`user_id`),
  CONSTRAINT `FKjo7d296slarpmfr8p3oeqlsx2` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`),
  CONSTRAINT `FKo86so3ptvukgyfb2rkb63hab4` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*update 31/5*/

/*laptop*/
INSERT INTO `product` 
VALUES 
(10,10,'mo ta','Macbook Air M1 2020 Gold MGND3SA/A (Apple M1, 7-Cores GPU, Ram 8GB, SSD 256GB, 13.3 Inch IPS Retina)',24490000,10,'Mo ta ngan',1,'sumary',null,'khuyen mai'),
(11,10,'mo ta','Macbook Pro M1 2020 Silver MYDA2SA/A (Apple M1, 8-Cores GPU, Ram 8GB, SSD 256GB, 13.3 Inch IPS Retina)', 31490000, 10,'Mo ta ngan',1,'sumary',null,'khuyen mai'),
(12,3,'mo ta','Laptop Lenovo ThinkBook 15 G3 ACL 21A400CHVN (Ryzen 3 5300U, Radeon Graphics, Ram 8GB DDR4, SSD 512GB, 15.6 Inch IPS FHD)', 15990000, 9,'Mo ta ngan',1,'sumary',null,'khuyen mai'),
(13,5,'mo ta','Laptop Lenovo V15 G2 ITL 82KB00CVVN (i5-1135G7, MX350 2GB, Ram 8GB, SSD 512GB, 15.6 Inch FHD)', 18690000, 8,'Mo ta ngan',1,'sumary',null,'khuyen mai'),
(14,11,'mo ta','Laptop HUAWEI MateBook 14 AMD 2021 KLVL-W56W (Ryzen 5 5500U, Radeon Graphics, Ram 16GB DDR4, SSD 512GB, 14 Inch IPS QHD)', 20790000, 7,'Mo ta ngan',1,'sumary', null,'khuyen mai'),
(15,12,'mo ta','Laptop HUAWEI MateBook D15 2021 BoD-WDH9 (i5-1135G7, Iris Xe Graphics, Ram 8GB DDR4, SSD 512GB, 15.6 Inch IPS FHD)', 17990000, 10, 'Mo ta ngan',1,'sumary', null,'khuyen mai'),
(16,12,'mo ta','Laptop MSI Modern 14 B11MOU-1030VN/1027VN (i3-1115G4, UHD Graphics, Ram 8GB DDR4, SSD 256GB, 14 Inch IPS FHD)', 11790000, 4,'Mo ta ngan',1,'sumary',null,'khuyen mai'),
(17,12,'mo ta','Laptop Gaming MSI GP66 Leopard 11UE-643VN (i7-11800H, RTX 3060 6GB, Ram 16GB, SSD 512GB, 15.6 Inch IPS 165Hz QHD)', 37390000, 6,'Mo ta ngan',1,'sumary',null,'khuyen mai'),
(18,12,'mo ta','Laptop Asus Vivobook Pro 16X OLED M7600QC-L2077W (Ryzen 5 5600H, RTX 3050 4GB, Ram 16GB DDR4, SSD 512GB, 16 Inch OLED 4K)', 29990000, 20,'Mo ta ngan',1,'sumary',null,'khuyen mai'),
(19,15,'mo ta','Laptop Gaming Asus ROG Zephyrus G14 GA401QH-K2091W (Ryzen 7 5800HS, GTX 1650 4GB, Ram 8GB DDR4, SSD 512GB, 14 Inch IPS 120Hz WQHD)', 24590000, 33,'Mo ta ngan',1,'sumary',null,'khuyen mai'),
(20,2,'mo ta','Laptop Intel NUC M15 BBC710ECUXBC1 (i7-1165G7 EVO, Iris Xe Graphics , Ram 16GB DDR4, SSD 512GB, 15.6 Inch IPS FHD TouchScreen/Gray)', 23490000, 12,'Mo ta ngan',1,'sumary',null,'khuyen mai');

/*ram*/
INSERT INTO `product` 
VALUES 
(21,10,'mo ta','Ram Laptop Samsung DDR4 4GB 3200MHz 1.2v M471A5244CB0-CWE', 390000, 12,'Mo ta ngan',1,'sumary',null,'khuyen mai'),
(22,10,'mo ta','Ram Laptop Kingston DDR4 4GB 3200MHz 1.2v KVR32S22S6/4', 390000, 11,'Mo ta ngan',1,'sumary',null,'khuyen mai'),
(23,0,'mo ta','Ram Laptop Corsair Vengeance DDR4 4GB 2400MHz 1.2v CMSX4GX4M1A2400C16', 590000, 11,'Mo ta ngan',1,'sumary',null,'khuyen mai'),
(24,0,'mo ta','Ram Laptop Crucial DDR4 4GB 2666MHz 1.2v CT4G4SFS8266', 550000,11,'Mo ta ngan',1,'sumary',null,'khuyen mai');

/*Atttribute - PRODUCT_ATTRIBUTE*/
INSERT INTO `attribute` 
VALUES 
(41,'CPU','Apple M1 8 Cores',1),
(42,'VGA','Apple 7 Cores GPU',1),
(43,'RAM','8GB',1),
(44,'Ổ CỨNG','256GB',1),
(45,'KÍCH THƯỚC MÀN HÌNH','13.3 Inch',1),
(46,'VGA','Apple 8 Cores GPU',1),
(47,'VGA','AMD Radeon Graphics',1),
(48,'Ổ CỨNG','512GB',1),
(111,'THƯƠNG HIỆU','Corsair',2),
(112,'THƯƠNG HIỆU','Crucial',2),
(113,'THƯƠNG HIỆU','Kingston',2),
(114,'THƯƠNG HIỆU','Samsung',2),
(115,'BUS','2400',2),
(116,'BUS','2666',2),
(117,'BUS','3000',2),
(118,'BUS','2133',2),
(119,'DUNG LƯỢNG','4GB',2),
(120,'DUNG LƯỢNG','8GB',2),
(121,'DUNG LƯỢNG','16GB',2),
(122,'DUNG LƯỢNG','32GB',2),
(123,'DUNG LƯỢNG','64GB',2),
(124,'DUNG LƯỢNG','128GB',2),
(125,'DUNG LƯỢNG','256GB',2),
(126,'BUS','3200',2);

INSERT INTO `product_attribute` 
VALUES
(10,41),(10,42),(10,43),(10,44),(10,45),
(11,41),(11,46),(11,43),(11,44),(11,45),
(12,17),(12,47),(12,43),(12,48),(12,14),
(21,119),(21,126),(22,119),(22,126),
(23,119),(23,115),(24,119),(24,116);

/*img*/

INSERT INTO `image` VALUES (111,'laptop-gaming-gigabyte-aorus-17-xe5-73vn534gh.webp',1),
    (112,'laptop-gaming-gigabyte-aorus-17-xe5-73vn534gh-1.webp',1),
    (113,'laptop-gaming-gigabyte-aorus-17-xe5-73vn534gh-2.webp',1),
    (114,'laptop-gaming-gigabyte-aorus-17-xe5-73vn534gh-3.webp',1),
    (115,'laptop-gaming-gigabyte-aorus-17-xe5-73vn534gh-4.webp',1);

INSERT INTO `image` VALUES (116,'laptop-dell-inspiron-16-5625-70281537.webp',2),
    (117,'laptop-dell-inspiron-16-5625-1.webp',2),
    (118,'laptop-dell-inspiron-16-5625-2.webp',2),
    (119,'laptop-dell-inspiron-16-5625-3.webp',2),
    (120,'laptop-dell-inspiron-16-5625-4.webp',2),
    (121,'laptop-dell-inspiron-16-5625-5.webp',2);

INSERT INTO `image` VALUES (122,'laptop-gaming-acer-predator-triton-300-pt315-53-7440-nh-qdrsv-003.webp',3),
    (123,'laptop-gaming-acer-predator-triton-300-pt315-53-7440-nh-qdrsv-003-1.webp',3),
    (124,'laptop-gaming-acer-predator-triton-300-pt315-53-7440-nh-qdrsv-003-2.webp',3),
    (125,'laptop-gaming-acer-predator-triton-300-pt315-53-7440-nh-qdrsv-003-3.webp',3),
    (126,'laptop-gaming-acer-predator-triton-300-pt315-53-7440-nh-qdrsv-003-4.webp',3),
    (127,'laptop-gaming-acer-predator-triton-300-pt315-53-7440-nh-qdrsv-003-5.webp',3),
    (128,'laptop-gaming-acer-predator-triton-300-pt315-53-7440-nh-qdrsv-003-6.webp',3);

INSERT INTO `image` VALUES (129,'laptop-dell-inspiron-15-3511-70270652.webp',4),
    (130,'laptop-dell-inspiron-15-3511-70270650-6-a1ac66eb-4a80-4f42-aafe-58f031578cef.webp',4),
    (131,'laptop-dell-inspiron-15-3511-70270650-5-1ad14ffd-a379-4cc8-9fe1-4319c55e522d.webp',4),
    (132,'laptop-dell-inspiron-15-3511-70270650-4-b4b9ecad-c5c9-4706-bc92-3a96f2f7b014.webp',4),
    (133,'laptop-dell-inspiron-15-3511-70270650-3-ad433d93-8890-4317-b3b6-6cf1b0d86b57.webp',4),
    (134,'laptop-dell-inspiron-15-3511-70270650-2-645e50dc-f1ad-4d61-831f-6f1df99cd063.webp',4);


INSERT INTO `image` VALUES (135,'laptop-dell-inspiron-15-3511-70270652.webp',5),
    (136,'laptop-hp-probook-430-g8-614k7pa.webp',5),
    (137,'laptop-hp-probook-430-g8-614k9pa-1-8e366d79-7676-4ac2-838e-a01262e11d8d.webp',5),
    (138,'laptop-hp-probook-430-g8-614k9pa-2-6b95b7a5-b23f-4e2b-8178-87b1197417a2.webp',5),
    (139,'laptop-hp-probook-430-g8-614k9pa-3-8e86b14b-e159-4591-9d0b-5e1b47f16409.webp',5),
    (140,'laptop-hp-probook-430-g8-614k9pa-4-2e0fab15-c0da-4156-b15a-953861447c3d.webp',5);


INSERT INTO `image` VALUES (141,'macbook-air-m1-2020-gold-mgnd3sa-a.webp',10),
    (142,'macbook-air-m1-2020-gold-1-270670a4-0355-470c-8e57-adec570d0456.webp',10),
    (143,'macbook-air-m1-2020-gold-2-8e2f0f39-d953-4d7c-9978-d7f358bf87e2.webp',10),
    (144,'macbook-air-m1-2020-gold-3-cf115125-c567-4736-9aef-327ea55f6898.webp',10),
    (145,'macbook-air-m1-2020-gold-4-c54d5f21-7fb1-4fe8-9dbc-9a4f751306b2.png',10),
    (146,'macbook-air-m1-2020-gold-5-95055c6a-5a26-4245-8dbf-6a7f8502c9d4.webp',10);

INSERT INTO `image` VALUES (147,'macbook-pro-m1-2020-silver-myda2sa-a.webp',11),
    (148,'macbook-pro-m1-2020-silver-86600577-50a8-4782-b76e-46f08e45edcd.webp',11),
    (149,'laptop-apple-macbook-pro-m1-2020-silver.webp',11),
    (150,'laptop-apple-macbook-pro-m1-2020-silver-1.webp',11),
    (151,'laptop-apple-macbook-pro-m1-2020-silver-2.webp',11);

INSERT INTO `image` VALUES (152,'laptop-lenovo-thinkbook-15-g3-acl-21a400chvn-758babfd-3db9-4fc6-952c-9d55e1477c55.webp',12),
    (153,'laptop-lenovo-thinkbook-15-g3-acl-21a400cfvn-7-12c14baa-371b-4ad6-b756-12f37e70ba0c.webp',12),
    (154,'laptop-lenovo-thinkbook-15-g3-acl-21a400cfvn-6-82da2b7c-72df-47f2-882b-b887b60d130a.webp',12),
    (155,'laptop-lenovo-thinkbook-15-g3-acl-21a400cfvn-5-be65bc96-4760-4205-845c-93e08348f8a3.webp',12),
    (156,'laptop-lenovo-thinkbook-15-g3-acl-21a400cfvn-4-99ad3349-81d4-40bf-a48d-77162788e7bd.webp',12),
    (157,'laptop-lenovo-thinkbook-15-g3-acl-21a400cfvn-3-828a7a50-9a92-4b3e-9765-bf4c3bbaf763.webp',12),
    (158,'laptop-lenovo-thinkbook-15-g3-acl-21a400cfvn-1-08c270d6-4547-4c44-a3d5-be6642a0acea.webp',12);

    /*password = 1234567*/
INSERT INTO `user` (
`id`, `birthday`, `created_date`, `email`, `gender`, `password`, `status`, `token`, `updated_date`,`username`) 
 VALUES ('4', '1980-01-15 00:00:00', '2022-07-19 10:47:48', '18130064@st.hcmuaf.edu.vn', '1', '$2a$10$0Dfv6mLWOvfHIEQt24FkEeVWbaa3ZNiSY/bkffWX2i..cmvEb7mzC', '1', null, '2022-07-19 10:47:48', 'u4');
INSERT INTO `user` (
`id`, `birthday`, `created_date`, `email`, `gender`, `password`, `status`, `token`, `updated_date`,`username`) 
 VALUES ('5', '1998-01-15 00:00:00', '2022-07-19 10:47:48', 'hochiminhvilanhtuuvidai@gmail.com', '1', '$2a$10$0Dfv6mLWOvfHIEQt24FkEeVWbaa3ZNiSY/bkffWX2i..cmvEb7mzC', '1', null, '2022-07-19 10:47:48', 'u5');
INSERT INTO `user` (
`id`, `birthday`, `created_date`, `email`, `gender`, `password`, `status`, `token`, `updated_date`,`username`) 
 VALUES ('6', '1998-01-15 00:00:00', '2022-07-19 10:47:48', 'tranquangtuyen326326@gmail.com', '1', '$2a$10$0Dfv6mLWOvfHIEQt24FkEeVWbaa3ZNiSY/bkffWX2i..cmvEb7mzC', '1', null, '2022-07-19 10:47:48', 'u6');

INSERT INTO `comment` 
VALUES 
(4,'I like','2022-07-31 12:24:27',4,1,'f6c5cb6d68714405bf270f5f5afa6042.jpg,79c38fa8033b4ff7b1dbd714f5292b45.png','','u2',1,2),
(5,'Ok','2022-07-31 12:31:13',5,1,'735a46716dee44aea59c690a9709d067.jpg,567adb542c494ce0b09079ef054ec0ba.jpg','','u2',1,2),
(6,'dfaf','2022-07-31 13:33:03',1,1,'bca26ff239cc4be8b1e02f72c0752b8f.jpg,af21b4cdedcd47f18728385d2c83cf28.png','','u2',1,1),
(7,'Fadfas','2022-07-31 13:35:25',3,1,'71c629360df2402e8723dc5fae26498f.png,e160ee28b18844f1a8eae28caf36740f.jpg','','u2',1,1),
(8,'sáng','2022-07-31 13:43:24',3,1,'7de91555096b482187e3c085f366ce86.png','','u2',1,1);

/*
 * Update table category and attribute
 */
UPDATE cdweb2022.attribute
SET status = 'Active'
WHERE id>0;

UPDATE cdweb2022.category
SET status = 'Active'
WHERE id>0;

ALTER TABLE `cdweb2022`.`product` 
CHANGE COLUMN `long_description` `long_description` BLOB NULL DEFAULT NULL ;

/*
 * Add more images
 */
INSERT INTO `image` VALUES 
(159,'dae3569107554efdb4a6f34188986eaf.png',26),(161,'b5c9d0e579fc45e790d0837c216b5ae3.jpg',26),
(162,'7ab1f3673f3241f9bb05288a809acfbb.jpg',19),(163,'e36eccaee1de41a7825e99dd221adf07.jpg',19),
(164,'22cfae1a63fc40228cecd8a84611e36d.jpg',19),(166,'3d464d83a10d4814b111e83e0b05a644.jpg',14),
(167,'de13df9f44ea43849136e2ed296e2765.jpg',25),(168,'e6a61f2ce8464db7bbd9a10e0331c405.jpg',16),
(169,'922d0bc5e2e144ce831ade08d4c62846.jpg',17),(170,'bf22ef2b9a5e4d14925888e124aaf713.jpg',18),
(171,'4b0d69c5494748e9b42d8100074014d6.jpg',20),(172,'b0c528458f2f4d4db35d4c7f90b493b3.jpg',20),
(173,'810ba90d14d04147a1ebc794ffed1369.jpg',21),(174,'db3d897152d747f8999f05a6943149e6.jpg',15),
(175,'4a5d290225df4e19a5d23261eec54945.jpg',15),(176,'857bb0db5f5649158a3112af94a6f5d5.jpg',15),
(177,'03201e1a7f784e71894239834a9f5466.jpg',15),(178,'594834ef9c02452ab57715f127f3e411.jpg',22),
(179,'9ccb4289356d4305a2ff936122e0a2e6.jpg',22),(180,'543d00b06cce4bec9e68b430a5af6d5c.jpg',22),
(181,'d004a8bfe6954ed3b815077011147426.jpg',23),(182,'9334b82741204425a3338741b7956df1.jpg',24),
(183,'21bda3fd4643464980f8e86f8117df02.jpg',24),(184,'e46d16311e3e4eb497c8458960c263ba.jpg',24),
(185,'7035491569e743aeb3cb3cb84184f38b.jpg',24),(186,'4c4f0127e67446eb8db62c541033ae4b.jpg',13),
(187,'add0152c5a4a46e4b02e17caae42c9d4.jpg',13),(188,'d6569de7eacc40b98e38b60e4748c566.jpg',13),
(189,'b863b4944a5f47999fce750345f07c5c.jpg',13);

