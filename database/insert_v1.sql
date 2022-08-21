use cdweb2022;

INSERT INTO `cdweb2022`.`category` (`id`, `name`) VALUES ('1', 'Laptop');
INSERT INTO `cdweb2022`.`category` (`id`, `name`) VALUES ('2', 'RAM');
INSERT INTO `cdweb2022`.`category` (`id`, `name`) VALUES ('3', 'SSD');
INSERT INTO `cdweb2022`.`category` (`id`, `name`) VALUES ('4', 'USB');

INSERT INTO `cdweb2022`.`attribute` (`id`, `name`, `value`, `category_id`) VALUES ('1', 'THƯƠNG HIỆU', 'Acer', '1');
INSERT INTO `cdweb2022`.`attribute` (`id`, `name`, `value`, `category_id`) VALUES ('2', 'THƯƠNG HIỆU', 'Asus', '1');
INSERT INTO `cdweb2022`.`attribute` (`id`, `name`, `value`, `category_id`) VALUES ('3', 'THƯƠNG HIỆU', 'Dell', '1');
INSERT INTO `cdweb2022`.`attribute` (`id`, `name`, `value`, `category_id`) VALUES ('4', 'THƯƠNG HIỆU', 'Gigabyte', '1');
INSERT INTO `cdweb2022`.`attribute` (`id`, `name`, `value`, `category_id`) VALUES ('5', 'THƯƠNG HIỆU', 'HP', '1');
INSERT INTO `cdweb2022`.`attribute` (`id`, `name`, `value`, `category_id`) VALUES ('6', 'THƯƠNG HIỆU', 'HUAWEI', '1');
INSERT INTO `cdweb2022`.`attribute` (`id`, `name`, `value`, `category_id`) VALUES ('7', 'THƯƠNG HIỆU', 'Intel', '1');
INSERT INTO `cdweb2022`.`attribute` (`id`, `name`, `value`, `category_id`) VALUES ('8', 'THƯƠNG HIỆU', 'Lenovo', '1');
INSERT INTO `cdweb2022`.`attribute` (`id`, `name`, `value`, `category_id`) VALUES ('9', 'THƯƠNG HIỆU', 'MSI', '1');
INSERT INTO `cdweb2022`.`attribute` (`id`, `name`, `value`, `category_id`) VALUES ('10', 'NHU CẦU', 'Mỏng nhẹ', '1');
INSERT INTO `cdweb2022`.`attribute` (`id`, `name`, `value`, `category_id`) VALUES ('11', 'NHU CẦU', 'Gaming và Đồ họa', '1');
INSERT INTO `cdweb2022`.`attribute` (`id`, `name`, `value`, `category_id`) VALUES ('12', 'KÍCH THƯỚC MÀN HÌNH', '13 Inch', '1');
INSERT INTO `cdweb2022`.`attribute` (`id`, `name`, `value`, `category_id`) VALUES ('13', 'KÍCH THƯỚC MÀN HÌNH', '14 Inch', '1');
INSERT INTO `cdweb2022`.`attribute` (`id`, `name`, `value`, `category_id`) VALUES ('14', 'KÍCH THƯỚC MÀN HÌNH', '15.6 Inch', '1');
INSERT INTO `cdweb2022`.`attribute` (`id`, `name`, `value`, `category_id`) VALUES ('15', 'KÍCH THƯỚC MÀN HÌNH', '17.3 Inch', '1');
INSERT INTO `cdweb2022`.`attribute` (`id`, `name`, `value`, `category_id`) VALUES ('16', 'CPU', 'Intel EVO', '1');
INSERT INTO `cdweb2022`.`attribute` (`id`, `name`, `value`, `category_id`) VALUES ('17', 'CPU', 'Ryzen 3', '1');
INSERT INTO `cdweb2022`.`attribute` (`id`, `name`, `value`, `category_id`) VALUES ('18', 'CPU', 'Ryzen 5', '1');
INSERT INTO `cdweb2022`.`attribute` (`id`, `name`, `value`, `category_id`) VALUES ('19', 'CPU', 'Ryzen 7', '1');
INSERT INTO `cdweb2022`.`attribute` (`id`, `name`, `value`, `category_id`) VALUES ('20', 'CPU', 'Ryzen 9', '1');
INSERT INTO `cdweb2022`.`attribute` (`id`, `name`, `value`, `category_id`) VALUES ('21', 'CPU', 'Intel Core i3', '1');
INSERT INTO `cdweb2022`.`attribute` (`id`, `name`, `value`, `category_id`) VALUES ('22', 'CPU', ' Intel Core i5', '1');
INSERT INTO `cdweb2022`.`attribute` (`id`, `name`, `value`, `category_id`) VALUES ('39', 'CPU', ' Intel Core i7', '1');
INSERT INTO `cdweb2022`.`attribute` (`id`, `name`, `value`, `category_id`) VALUES ('40', 'CPU', ' Intel Core i9', '1');

INSERT INTO `cdweb2022`.`attribute` (`id`, `name`, `value`, `category_id`) VALUES
  ('23', 'VGA', 'MX330', '1'),
  ('24', 'VGA', 'MX350', '1') ,
  ('25', 'VGA', 'MX450', '1') ,
  ('26', 'VGA', 'RX 5500M', '1') ,
  ('27', 'VGA', 'GTX 1650', '1') ,
  ('28', 'VGA', 'GTX 1660', '1') ,
  ('29', 'VGA', 'RTX 2070', '1') ,
  ('30', 'VGA', 'RTX A2000', '1') ,
  ('31', 'VGA', 'Quadro', '1') ,
  ('32', 'VGA', 'RX 6600', '1') ,
  ('33', 'VGA', 'RX 6700', '1') ,
  ('34', 'VGA', 'RTX 3050', '1') ,
  ('35', 'VGA', 'RTX 3050 Ti', '1') ,
  ('36', 'VGA', 'RTX 3060', '1') ,
  ('37', 'VGA', 'RTX 3070', '1') ,
  ('38', 'VGA', 'RTX 3080', '1') ;
  
INSERT INTO `cdweb2022`.`product` (`id`, `discount`, `name`, `price`, `quantity`, `status`, `summary`) VALUES ('1', '2', 'Laptop Gaming Gigabyte AORUS 17 XE5-73VN534GH (i7-12700H, RTX 3070 Ti 8GB, Ram 16GB DDR5, SSD 1TB, 17.3 Inch IPS 360Hz FHD)', '60990000', '3', '1', 'CPU: i7-12700H (Up to 4.7GHz) 14 Cores 20 Threads VGA: GeForce RTX 3070 Ti 8GB Ram: 16GB (2x8GB) DDR5 4800MHz SSD: 1TB SSD M.2 PCIe Gen4 x4 Màn hình: 17.3\'\' IPS 360Hz FHD BẢO HÀNH 2 năm');
INSERT INTO `cdweb2022`.`product` (`id`, `discount`, `name`, `price`, `quantity`, `status`,`summary`) VALUES ('2', '16', 'Laptop Dell Inspiron 16 5625 70281537 (Ryzen 5 5625U, Radeon Graphics, Ram 8GB DDR4, SSD 512GB, 16 Inch FHD)', '24990000', '6','1', 'CPU: Ryzen 5 5625U (2.3GHz~4.3GHz) 6 Cores 12 Threads VGA: AMD Radeon Graphics Ram: 8GB DDR4 3200MHz Ổ cứng: 512GB SSD M.2 PCIe Màn hình: 16\" FHD Bảo hành 1 năm.');
INSERT INTO `cdweb2022`.`product` (`id`, `discount`, `name`, `price`, `quantity`, `status`, `summary`) VALUES ('3', '12', 'Laptop Gaming Acer Predator Triton 300 PT315-53-7440 NH.QDRSV.003 (i7-11800H, RTX 3050 Ti 4GB, Ram 8GB, SSD 512GB, 15.6 Inch IPS 165Hz QHD)', '36990000', '2', '1', 'CPU: i7-11800H (2.4GHz~4.6GHz) 8 Cores 16 Threads VGA: GeForce RTX 3050 Ti 4GB Ram: 8GB DDR4 3200 MHz Ổ cứng: 512GB SSD M.2 PCIe Màn hình: 15.6\'\' IPS 165Hz QHD Bảo hành 1 năm.');
INSERT INTO `cdweb2022`.`product` (`id`, `discount`, `name`, `price`, `quantity`, `status`, `summary`) VALUES ('4', '8', 'Laptop Dell Inspiron 15 3511 70270652 (i7-1165G7, MX350 2GB, Ram 8GB DDR4, SSD 512GB, 15.6 Inch FHD)', '25490000', '1', '1', 'CPU: i7-1165G7 (Up to 4.7GHz) 4 Cores 8 Threads VGA: NVIDIA MX350 2GB Ram: 8GB DDR4 3200MHz Ổ cứng: 512GB SSD M.2 PCIe Màn hình: 15.6\" FHD Bảo hành 1 năm.');
INSERT INTO `cdweb2022`.`product` (`id`, `discount`, `name`, `price`, `quantity`, `status`, `summary`) VALUES ('5', '8', 'Laptop HP Probook 430 G8 614K7PA (i3-1115G4, UHD Graphics, Ram 8GB, SSD 256GB, 13.3 Inch HD)', '14890000', '15', '1', 'CPU: i3-1115G4 (Up to 4.1GHz) 2 Cores 4 Threads VGA: Intel UHD Graphics Ram: 8GB DDR4 3200MHz Ổ cứng: 256GB SSD M.2 PCIe Màn hình: 13.3\'\' HD Bảo hành 1 năm. Tình trạng: sẵn sàng');

INSERT INTO `cdweb2022`.`image` (`id`, `link`, `product_id`) VALUES ('1', 'https://bizweb.sapocdn.net/thumb/1024x1024/100/329/122/products/laptop-gaming-gigabyte-aorus-17-xe5-73vn534gh.png?v=1648702456317', '1');
INSERT INTO `cdweb2022`.`image` (`id`, `link`, `product_id`) VALUES ('2', 'https://bizweb.sapocdn.net/100/329/122/products/laptop-gaming-gigabyte-aorus-17-xe5-73vn534gh-3.png?v=1648702456317', '1');
INSERT INTO `cdweb2022`.`image` (`id`, `link`, `product_id`) VALUES ('3', 'https://bizweb.sapocdn.net/100/329/122/products/laptop-gaming-gigabyte-aorus-17-xe5-73vn534gh-2.png?v=1648702456317', '1');
INSERT INTO `cdweb2022`.`image` (`id`, `link`, `product_id`) VALUES ('4', 'https://bizweb.sapocdn.net/thumb/1024x1024/100/329/122/products/laptop-dell-inspiron-16-5625-70281537.png?v=1650264869833', '2');
INSERT INTO `cdweb2022`.`image` (`id`, `link`, `product_id`) VALUES ('5', 'https://bizweb.sapocdn.net/100/329/122/products/laptop-dell-inspiron-16-5625-2.png?v=1650264871713', '2');
INSERT INTO `cdweb2022`.`image` (`id`, `link`, `product_id`) VALUES ('6', 'https://bizweb.sapocdn.net/100/329/122/products/laptop-dell-inspiron-16-5625-1.png?v=1650264871713', '2');
INSERT INTO `cdweb2022`.`image` (`id`, `link`, `product_id`) VALUES ('7', 'https://bizweb.sapocdn.net/thumb/1024x1024/100/329/122/products/laptop-gaming-acer-predator-triton-300-pt315-53-7440-nh-qdrsv-003.png?v=1650623448350', '3');
INSERT INTO `cdweb2022`.`image` (`id`, `link`, `product_id`) VALUES ('8', 'https://bizweb.sapocdn.net/100/329/122/products/laptop-gaming-acer-predator-triton-300-pt315-53-7440-nh-qdrsv-003-3.png?v=1650623448350', '3');
INSERT INTO `cdweb2022`.`image` (`id`, `link`, `product_id`) VALUES ('9', 'https://bizweb.sapocdn.net/100/329/122/products/laptop-gaming-acer-predator-triton-300-pt315-53-7440-nh-qdrsv-003-2.png?v=1650623448350', '3');
INSERT INTO `cdweb2022`.`image` (`id`, `link`, `product_id`) VALUES ('10', 'https://bizweb.sapocdn.net/thumb/1024x1024/100/329/122/products/laptop-dell-inspiron-15-3511-70270652.png?v=1646630760913', '4');
INSERT INTO `cdweb2022`.`image` (`id`, `link`, `product_id`) VALUES ('11', 'https://bizweb.sapocdn.net/100/329/122/products/laptop-dell-inspiron-15-3511-70270650-6-a1ac66eb-4a80-4f42-aafe-58f031578cef.png?v=1646630762337', '4');
INSERT INTO `cdweb2022`.`image` (`id`, `link`, `product_id`) VALUES ('12', 'https://bizweb.sapocdn.net/100/329/122/products/laptop-dell-inspiron-15-3511-70270650-2-645e50dc-f1ad-4d61-831f-6f1df99cd063.png?v=1646630762337', '4');
INSERT INTO `cdweb2022`.`image` (`id`, `link`, `product_id`) VALUES ('13', 'https://bizweb.sapocdn.net/thumb/1024x1024/100/329/122/products/laptop-hp-probook-430-g8-614k7pa.png?v=1649315244117', '5');
INSERT INTO `cdweb2022`.`image` (`id`, `link`, `product_id`) VALUES ('14', 'https://bizweb.sapocdn.net/100/329/122/products/laptop-hp-probook-430-g8-614k9pa-4-2e0fab15-c0da-4156-b15a-953861447c3d.png?v=1649315245997', '5');
INSERT INTO `cdweb2022`.`image` (`id`, `link`, `product_id`) VALUES ('15', 'https://bizweb.sapocdn.net/100/329/122/products/laptop-hp-probook-430-g8-614k9pa-1-8e366d79-7676-4ac2-838e-a01262e11d8d.png?v=1649315245997', '5');

INSERT INTO `cdweb2022`.`product_attribute` (`product_id`, `attribute_id`) VALUES
  ('1', '4');
  
INSERT INTO `cdweb2022`.`product_attribute` (`product_id`, `attribute_id`) VALUES
  ('1', '11'),
  ('1', '15'),
  ('1', '19'),
  ('1', '37');

INSERT INTO `cdweb2022`.`product_attribute` (`product_id`, `attribute_id`) VALUES
  ('2', '3'),
  ('2', '10'),
  ('2', '14'),
  ('2', '18'),
  ('2', '26');

INSERT INTO `cdweb2022`.`product_attribute` (`product_id`, `attribute_id`) VALUES
  ('3', '1'),
  ('3', '10'),
  ('3', '14'),
  ('3', '39'),
  ('3', '35');

INSERT INTO `cdweb2022`.`product_attribute` (`product_id`, `attribute_id`) VALUES
  ('4', '3'),
  ('4', '10'),
  ('4', '14'),
  ('4', '39'),
  ('4', '24');
  
INSERT INTO `cdweb2022`.`product_attribute` (`product_id`, `attribute_id`) VALUES
  ('5', '5'),
  ('5', '12'),
  ('5', '21'),
  ('5', '10'),
  ('5', '23');

INSERT INTO `cdweb2022`.`role` (`id`, `name`) VALUES ('1', 'client');
INSERT INTO `cdweb2022`.`role` (`id`, `name`) VALUES ('2', 'admin');

INSERT INTO `cdweb2022`.`user` (`id`, `password`, `status`, `username`) VALUES ('1', '123', '1', 'u1');
INSERT INTO `cdweb2022`.`user` (`id`, `password`, `status`, `username`) VALUES ('2', '123', '1', 'u2');

INSERT INTO `cdweb2022`.`user_role` (`user_id`, `role_id`) VALUES
  ('1', '1'),
  ('2', '2');

INSERT INTO `cdweb2022`.`address` (`id`, `city`, `fullname`, `user_id`) VALUES ('1', 'HCM', 'AN', '1');
INSERT INTO `cdweb2022`.`address` (`id`, `city`, `fullname`, `user_id`) VALUES ('2', 'HCM', 'Hải', '2');

INSERT INTO `cdweb2022`.`voucher` (`id`, `code`, `cost`, `ended_date`, `started_date`) VALUES ('1', 'aaa', '10000', '2022-05-03, 12:15:00', '2022-05-10, 12:15:00');

INSERT INTO `cdweb2022`.`bill` (`id`, `created_date`, `shipping_cost`, `status`, `total`, `updated_date`, `address_id`, `voucher_id`) VALUES ('1', '2022-05-03, 12:15:00', '40000', '1', '60000000', '2022-05-03, 12:15:00', '1', '1');

INSERT INTO `cdweb2022`.`order_detail` (`id`, `price`, `quantity`, `bill_id`, `product_id`) VALUES ('1', '25000000', '1', '1', '2');

/*Update 11/5/2022*/
ALTER TABLE `cdweb2022`.`product` 
ADD COLUMN `promotion` VARCHAR(255) NULL DEFAULT NULL AFTER `view`;

ALTER TABLE `cdweb2022`.`product` 
ADD COLUMN `view` BIGINT(20) NULL DEFAULT NULL AFTER `summary`;

ALTER TABLE `cdweb2022`.`product` 
CHANGE COLUMN `long_description` `long_description` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `short_description` `short_description` TEXT NULL DEFAULT NULL ;

UPDATE `cdweb2022`.`product` 
SET `long_description` = '<div class=\"text-full\"><p><strong>Laptop Gaming Gigabyte AORUS 17 XE5-73VN534GH </strong> đáp ứng đủ các tiêu chuẩn của người chơi chuyên nghiệp. Được trang bị GPU GeForce RTX 30 series mới nhất, công nghệ làm mát Windforce Infinity độc quyền, cùng với bộ xử lý Intel Core H thế hệ thứ 12, đảm bảo sự ổn định trong việc cung cấp 100% hiệu suất đầu ra, mang đến cho bạn hiệu ứng hiển thị tốt nhất và chân thực trong các trò chơi. </p><p><img src=\"//bizweb.sapocdn.net/100/329/122/files/screenshot-1648700593.jpg?v=1648700644129\" style=\"width: 100%;\"></p><table cellpadding=\"1\" width=\"100%\" style=\"border-collapse: collapse; margin-bottom: 15px;\"><tbody><tr><td width=\"70%\" style=\"text-align: left; padding: 15px; border: 1px solid #e1e1e1;\"><p><span style=\"color: #000000;\"><span style=\"font-size: 24px;\"><b>Bộ xử lý Intel Core thế hệ 12</b></span></span></p><p><span style=\"color: #000000;\"><strong>AORUS 17&nbsp;XE5</strong>&nbsp;được trang bị bộ vi xử lý Intel Core thế hệ 12 với 14 nhân và xung nhịp lên đến 4.7GHz giúp tăng đến 32% hiệu suất so với thế hệ trước để bạn dễ dàng trải nghiệm các tác vụ nặng một cách dễ dàng.</span></p></td><td width=\"30%\" style=\"padding: 15px; border: 1px solid #e1e1e1;\"><span style=\"color: #000000;\"><img data-thumb=\"original\" original-height=\"631\" original-width=\"1019\" src=\"//bizweb.sapocdn.net/100/329/122/files/screenshot-1645002575.png?v=1645003425022\" style=\"width: 100%;\"></span></td></tr></tbody></table><table cellpadding=\"1\" width=\"100%\" style=\"border-collapse: collapse; margin-bottom: 15px;\"><tbody><tr><td width=\"30%\" style=\"padding: 15px; border: 1px solid #e1e1e1;\"><span style=\"color: #000000;\"><img data-thumb=\"original\" original-height=\"1080\" original-width=\"1920\" src=\"//bizweb.sapocdn.net/100/329/122/files/367-nvidia-ampere-gpu-general.jpg?v=1627703999772\" style=\"width: 100%;\"></span></td><td width=\"70%\" style=\"text-align: left; padding: 15px; border: 1px solid #e1e1e1;\"><p><span style=\"color: #000000;\"><span style=\"font-size: 18pt;\"><strong>GeForce RTX™ 30 Series</strong></span></span></p><p><span style=\"color: #000000;\">Trang bị GPU&nbsp;GeForce RTX&nbsp;30 Series giúp&nbsp;<em><strong>Gigabyte AORUS 17</strong></em>&nbsp;mang lại hiệu suất tối thượng cho game thủ và nhà&nbsp;sáng tạo video. Card hoạt động trên nền tảng Ampere, Kiến trúc RTX thế hệ thứ 2 của NVIDIA với nhân RT, nhân Tensor và bộ đa xử lý phát trực tuyến mới, cung cấp đồ họa dò tia chân thực nhất và các tính năng AI tiên tiến. </span></p></td></tr></tbody></table><table cellpadding=\"1\" width=\"100%\" style=\"border-collapse: collapse; margin-bottom: 15px;\"><tbody><tr><td width=\"70%\" style=\"text-align: left; padding: 15px; border: 1px solid #e1e1e1;\"><p><span style=\"color: #000000;\"><span style=\"font-size: 24px;\"><b>Bộ xử lý Intel Core thế hệ 12</b></span></span></p><p><span style=\"color: #000000;\"><strong>AORUS 17&nbsp;XE5</strong>&nbsp;được trang bị bộ vi xử lý Intel Core thế hệ 12 với 14 nhân và xung nhịp lên đến 4.7GHz giúp tăng đến 32% hiệu suất so với thế hệ trước để bạn dễ dàng trải nghiệm các tác vụ nặng một cách dễ dàng.</span></p></td><td width=\"30%\" style=\"padding: 15px; border: 1px solid #e1e1e1;\"><span style=\"color: #000000;\"><img data-thumb=\"original\" original-height=\"631\" original-width=\"1019\" src=\"//bizweb.sapocdn.net/100/329/122/files/screenshot-1645002575.png?v=1645003425022\" style=\"width: 100%;\"></span></td></tr></tbody></table><table cellpadding=\"1\" width=\"100%\" style=\"border-collapse: collapse; margin-bottom: 15px;\"><tbody><tr><td width=\"30%\" style=\"padding: 15px; border: 1px solid #e1e1e1;\"><span style=\"color: #000000;\"><img data-thumb=\"original\" original-height=\"1080\" original-width=\"1920\" src=\"//bizweb.sapocdn.net/100/329/122/files/367-nvidia-ampere-gpu-general.jpg?v=1627703999772\" style=\"width: 100%;\"></span></td><td width=\"70%\" style=\"text-align: left; padding: 15px; border: 1px solid #e1e1e1;\"><p><span style=\"color: #000000;\"><span style=\"font-size: 18pt;\"><strong>GeForce RTX™ 30 Series</strong></span></span></p><p><span style=\"color: #000000;\">Trang bị GPU&nbsp;GeForce RTX&nbsp;30 Series giúp&nbsp;<em><strong>Gigabyte AORUS 17</strong></em>&nbsp;mang lại hiệu suất tối thượng cho game thủ và nhà&nbsp;sáng tạo video. Card hoạt động trên nền tảng Ampere, Kiến trúc RTX thế hệ thứ 2 của NVIDIA với nhân RT, nhân Tensor và bộ đa xử lý phát trực tuyến mới, cung cấp đồ họa dò tia chân thực nhất và các tính năng AI tiên tiến. </span></p></td></tr></tbody></table></div>' 
WHERE (`id` = '1');

UPDATE `cdweb2022`.`product` SET `promotion` = 'Balo Gaming Aorus.;USB Aorus Chibi 64GB.;Gấu bông Aorus Eagle.;Túi chống sốc.' WHERE (`id` = '1');

UPDATE `cdweb2022`.`product` SET `summary` = 'CPU: i7-12700H (Up to 4.7GHz) 14 Cores 20 Threads; VGA: GeForce RTX 3070 Ti 8GB; Ram: 16GB (2x8GB) DDR5 4800MHz; SSD: 1TB SSD M.2 PCIe Gen4 x4; Màn hình: 17.3\'\' IPS 360Hz FHD; BẢO HÀNH 2 năm toàn cầu' WHERE (`id` = '1');
UPDATE `cdweb2022`.`product` SET `summary` = 'CPU: Ryzen 5 5625U (2.3GHz~4.3GHz) 6 Cores 12 Threads; VGA: AMD Radeon Graphics; Ram: 8GB DDR4 3200MHz; Ổ cứng: 512GB SSD M.2 PCIe; Màn hình: 16\" FHD; Bảo hành 1 năm.' WHERE (`id` = '2');
UPDATE `cdweb2022`.`product` SET `summary` = 'CPU: i7-11800H (2.4GHz~4.6GHz) 8 Cores 16 Threads; VGA: GeForce RTX 3050 Ti 4GB; Ram: 8GB DDR4 3200 MHz; Ổ cứng: 512GB SSD M.2 PCIe; Màn hình: 15.6\'\' IPS 165Hz QHD; Bảo hành 1 năm.' WHERE (`id` = '3');
UPDATE `cdweb2022`.`product` SET `summary` = 'CPU: i7-1165G7 (Up to 4.7GHz) 4 Cores 8 Threads; VGA: NVIDIA MX350 2GB; Ram: 8GB DDR4 3200MHz; Ổ cứng: 512GB SSD M.2 PCIe; Màn hình: 15.6\" FHD; Bảo hành 1 năm.' WHERE (`id` = '4');
UPDATE `cdweb2022`.`product` SET `summary` = 'CPU: i3-1115G4 (Up to 4.1GHz) 2 Cores 4 Threads; VGA: Intel UHD Graphics; Ram: 8GB DDR4 3200MHz; Ổ cứng: 256GB SSD M.2 PCIe; Màn hình: 13.3\'\' HD; Bảo hành 1 năm.' WHERE (`id` = '5');

UPDATE `cdweb2022`.`product` SET `short_description` = 'đáp ứng đủ các tiêu chuẩn của người chơi chuyên nghiệp. Được trang bị GPU GeForce RTX 30 series mới nhất, công nghệ làm mát Windforce Infinity độc quyền, cùng với bộ xử lý Intel Core H thế hệ thứ 12, đảm bảo sự ổn định trong việc cung cấp 100% hiệu suất đầu ra, mang đến cho bạn hiệu ứng hiển thị tốt nhất và chân thực trong các trò chơi.' WHERE (`id` = '1');
UPDATE `cdweb2022`.`product` SET `short_description` = 'mang đến vẻ bề ngoài thanh lịch và cực kỳ hiện đại với tông màu bạc sang trọng. Bên cạnh màu sắc đẹp mắt, laptop khiến người dùng ấn tượng bởi thiết kế siêu mỏng và nhẹ mang đến tính di động hơn bao giờ hết.' WHERE (`id` = '5');
UPDATE `cdweb2022`.`product` SET `short_description` = 'mang vẻ bề ngoài thanh lịch, sang trọng cùng thiết kế mỏng, nhẹ và hiệu năng vượt trội từ bộ vi xử lý Intel Core thế hệ 11th, mang đến khả năng di động vượt trội hơn bao giờ hết.' WHERE (`id` = '4');
UPDATE `cdweb2022`.`product` SET `short_description` = 'kết hợp vừa chơi game giải trí, vừa làm việc với bộ xử lý Intel Core-H thế hệ thứ 11 mạnh mẽ cùng card đồ họa RTX 30 series cho phép bạn xử lý nhiều tác vụ cùng lúc một cách dễ dàng. Hơn nữa, màn hình QHD lên đến 165Hz 3ms, cùng dung lượng lưu trữ lớn và công nghệ Wi-Fi 6 Killer hỗ trợ cho bạn thực hiện các vai trò khác nhau dễ dàng.' WHERE (`id` = '3');
UPDATE `cdweb2022`.`product` SET `short_description` = 'mang vẻ bề ngoài thanh lịch, sang trọng cùng thiết kế mỏng, nhẹ và hiệu năng vượt trội từ bộ vi xử lý AMD Ryzen 5000 Series, mang đến khả năng di động vượt trội hơn bao giờ hết.' WHERE (`id` = '2');

INSERT INTO `cdweb2022`.`image` (`id`, `link`, `product_id`) VALUES ('16', '//bizweb.sapocdn.net/100/329/122/files/screenshot-1648700593.jpg?v=1648700644129', '1');
INSERT INTO `cdweb2022`.`image` (`id`, `link`, `product_id`) VALUES ('17', 'https://bizweb.sapocdn.net/100/329/122/files/laptop-inspiron-16-5625-pdp-mod01-fpr.jpg?v=1648199714183', '2');
INSERT INTO `cdweb2022`.`image` (`id`, `link`, `product_id`) VALUES ('18', 'https://bizweb.sapocdn.net/100/329/122/files/predator-triton-300.jpg?v=1650621081903', '3');
INSERT INTO `cdweb2022`.`image` (`id`, `link`, `product_id`) VALUES ('19', 'https://bizweb.sapocdn.net/100/329/122/files/dell-inspiron-15-3511-i5-70267060-8-1.jpg?v=1639383263823', '4');
INSERT INTO `cdweb2022`.`image` (`id`, `link`, `product_id`) VALUES ('20', 'https://bizweb.sapocdn.net/100/329/122/files/c07046023.jpg?v=1638416952108', '5');

UPDATE `cdweb2022`.`product` SET `long_description` = '<div class=\"text-full\"><p><strong> Laptop Dell Inspiron 16 5625 70281537 </strong> mang vẻ bề ngoài thanh lịch, sang trọng cùng thiết kế mỏng, nhẹ và hiệu năng vượt trội từ bộ vi xử lý AMD Ryzen 5000 Series, mang đến khả năng di động vượt trội hơn bao giờ hết. </p><p><img src=\"//bizweb.sapocdn.net/100/329/122/files/laptop-inspiron-16-5625-pdp-mod01-fpr.jpg?v=1648199714183\" style=\"width: 100%;\"></p><table cellpadding=\"1\" width=\"100%\" style=\"border-collapse: collapse; margin-bottom: 15px;\"><tbody><tr><td width=\"70%\" style=\"text-align: left;\"><p><span style=\"color: #000000;\"><span style=\"font-size: 18pt;\"><strong>Hiệu suất vượt bật</strong></span></span></p><p><span style=\"color: #000000;\"><strong>Laptop Dell Inspiron 16 5625</strong>&nbsp;được trang bị vi xử lý AMD Ryzen 5000 Series mang đến hiệu năng xử lý vượt trội để máy trở nên cơ động giúp bạn dễ dàng làm việc một cách hiệu quả nhất.</span></p></td><td width=\"30%\"><span style=\"color: #000000;\"><img data-thumb=\"original\" original-height=\"501\" original-width=\"1000\" src=\"//bizweb.sapocdn.net/100/329/122/files/jtlhwyhukjr8g4sfqmtxad.jpg?v=1648199871059\" style=\"width: 100%;\"></span></td></tr></tbody></table><table cellpadding=\"1\" width=\"100%\" style=\"border-collapse: collapse; margin-bottom: 15px;\"><tbody><tr><td width=\"30%\"><span style=\"color: #000000;\"><img data-thumb=\"original\" original-height=\"750\" original-width=\"950\" src=\"//bizweb.sapocdn.net/100/329/122/files/laptop-inspiron-16-5625-pdp-mod02.jpg?v=1648199688017\" style=\"width: 100%;\"></span></td><td width=\"70%\" style=\"text-align: left;\"><p><span style=\"color: #000000;\"><span style=\"font-size: 18pt;\"><strong>Màn hình rực rỡ</strong></span></span></p><p><span style=\"color: #000000;\"><strong>Laptop Dell Inspiron 16 5625</strong>&nbsp;mang đến hình ảnh&nbsp;tươi sáng và đầy màu sắc. Ngoài ra&nbsp;ComfortView là giải pháp được chứng nhận bởi TÜV Rheinland&nbsp;giúp giảm phát thải ánh sáng xanh có hại cùng giảm nhấp nháy để thân thiện hơn với đôi mắt của bạn.</span></p></td></tr></tbody></table><table cellpadding=\"1\" width=\"100%\" style=\"border-collapse: collapse; margin-bottom: 15px;\"><tbody><tr><td width=\"70%\" style=\"text-align: left;\"><p><span style=\"color: #000000;\"><span style=\"font-size: 18pt;\"><strong>Camera 1080P</strong></span></span></p><p><span style=\"color: #000000;\"><strong>Laptop Dell Inspiron 16 5625&nbsp;</strong>với camera FHD được tích hợp Micro&nbsp;kép và AI giúp giảm tiếng ồn xung quanh. Khi bạn cần ngắt kết nối,&nbsp;màn trập riêng tư của camera giúp bạn yên tâm hơn về bảo mật.</span></p></td><td width=\"30%\"><span style=\"color: #000000;\"><img data-thumb=\"original\" original-height=\"1056\" original-width=\"1503\" src=\"//bizweb.sapocdn.net/100/329/122/files/laptop-inspiron-16-5625-pdp-mod03.jpg?v=1648199699688\" style=\"width: 100%;\"></span></td></tr></tbody></table></div>' WHERE (`id` = '2');
UPDATE `cdweb2022`.`product` SET `long_description` = '<div class=\"text-full\"><p><strong> Laptop Gaming Acer Predator Triton 300 PT315-53-7440 NH.QDRSV.003 </strong> kết hợp vừa chơi game giải trí, vừa làm việc với bộ xử lý Intel Core-H thế hệ thứ 11 mạnh mẽ cùng card đồ họa RTX 30 series cho phép bạn xử lý nhiều tác vụ cùng lúc một cách dễ dàng. Hơn nữa, màn hình QHD lên đến 165Hz 3ms, cùng dung lượng lưu trữ lớn và công nghệ Wi-Fi 6 Killer hỗ trợ cho bạn thực hiện các vai trò khác nhau dễ dàng. </p><p><img src=\"https://bizweb.sapocdn.net/100/329/122/files/predator-triton-300.jpg?v=1650621081903\" style=\"width: 100%;\"></p><table cellpadding=\"1\" width=\"100%\" style=\"border-collapse: collapse; margin-bottom: 15px;\"><tbody><tr><td width=\"30%\"><img data-thumb=\"original\" original-height=\"800\" original-width=\"1440\" src=\"//bizweb.sapocdn.net/100/329/122/files/predator-triton-300-1.jpg?v=1650621897310\" style=\"width: 100%;\"></td><td width=\"70%\" style=\"text-align: left;\"><p><span style=\"color: #000000;\"><span style=\"font-size: 18pt;\"><strong>Hiệu năng mạnh mẽ</strong></span></span></p><p><span style=\"color: #000000;\"><strong>Acer Predator Triton 300</strong> trang bị&nbsp;bộ vi xử lý Intel Core-H thế hệ thứ 11 mạnh mẽ với 8&nbsp;nhân 16&nbsp;luồng,&nbsp;cho phép bạn xử lý nhiều tác vụ cùng lúc một cách dễ dàng.</span></p></td></tr></tbody></table><table cellpadding=\"1\" width=\"100%\" style=\"border-collapse: collapse; margin-bottom: 15px;\"><tbody><tr><td width=\"70%\" style=\"text-align: left;\"><p><span style=\"color: #000000;\"><span style=\"font-size: 18pt;\"><strong>GeForce RTX™ 30 Series</strong></span></span></p><p><span style=\"color: #000000;\"><strong>Acer Predator Triton 300&nbsp;</strong>trang bị GPU GeForce RTX 30 Series mang lại hiệu suất tối thượng cho game thủ và nhà sáng tạo video. Card hoạt động trên nền tảng Ampere, Kiến trúc RTX thế hệ thứ 2 của NVIDIA với nhân RT, nhân Tensor và bộ đa xử lý phát trực tuyến mới, cung cấp đồ họa dò tia chân thực nhất và các tính năng AI tiên tiến.</span></p></td><td width=\"30%\"><img data-thumb=\"original\" original-height=\"773\" original-width=\"1230\" src=\"//bizweb.sapocdn.net/100/329/122/files/screenshot-1633151838.png?v=1633151854151\" style=\"width: 100%;\"></td></tr></tbody></table><table cellpadding=\"1\" width=\"100%\" style=\"border-collapse: collapse; margin-bottom: 15px;\"><tbody><tr><td width=\"30%\"><span style=\"color: #000000;\"><img data-thumb=\"original\" original-height=\"800\" original-width=\"1123\" src=\"//bizweb.sapocdn.net/100/329/122/files/predator-helios300-ksp-6.jpg?v=1633152231367\" style=\"width: 100%;\"></span></td><td width=\"70%\" style=\"text-align: left;\"><p><span style=\"color: #000000;\"><span style=\"font-size: 18pt;\"><strong>Màn hình QHD&nbsp;165Hz chân thực</strong></span></span></p><p><span style=\"color: #000000;\">Trang bị màn hình IPS QHD trên&nbsp;<strong>Acer Predator Triton 300</strong>&nbsp;bùng nổ tần số quét&nbsp;lên đến 165Hz 3ms giúp cho việc&nbsp;trải nghiệm hình ảnh một cách liền mạch, không bị rách với độ mờ tối thiểu nhất.</span></p></td></tr></tbody></table></div>' WHERE (`id` = '3');
UPDATE `cdweb2022`.`product` SET `long_description` = '<div class=\"text-full\"><p><strong> Laptop Dell Inspiron 15 3511 70270652 </strong> mang vẻ bề ngoài thanh lịch, sang trọng cùng thiết kế mỏng, nhẹ và hiệu năng vượt trội từ bộ vi xử lý Intel Core thế hệ 11th, mang đến khả năng di động vượt trội hơn bao giờ hết. </p><p><img src=\"https://bizweb.sapocdn.net/100/329/122/files/predator-triton-300.jpg?v=1650621081903\" style=\"width: 100%;\"></p><table cellpadding=\"1\" width=\"100%\" style=\"border-collapse: collapse; margin-bottom: 15px;\"><tbody><tr><td width=\"30%\"><span style=\"color: #000000;\"><img data-thumb=\"original\" original-height=\"680\" original-width=\"1020\" src=\"//bizweb.sapocdn.net/100/329/122/files/dell-inspiron-15-3511-i5-70267060-7.jpg?v=1639383916391\" style=\"width: 100%;\"></span></td><td width=\"70%\" style=\"text-align: left;\"><p><span style=\"color: #000000;\"><span style=\"font-size: 18pt;\"><strong>Hiệu suất vượt bật</strong></span></span></p><p><span style=\"color: #000000;\"><strong>Laptop Dell Inspiron 15 3511</strong>&nbsp;được trang bị vi xử lý Intel Core Tiger Lake thế hệ 11 mang đến hiệu năng xử lý vượt trội để máy trở nên cơ động giúp bạn dễ dàng làm việc một cách hiệu quả nhất.</span></p></td></tr></tbody></table><table cellpadding=\"1\" width=\"100%\" style=\"border-collapse: collapse; margin-bottom: 15px;\"><tbody><tr><td width=\"70%\" style=\"text-align: left;\"><p><span style=\"color: #000000;\"><span style=\"font-size: 18pt;\"><strong>Trang bị card đồ họa rời</strong></span></span></p><p><span style=\"color: #000000;\">Card đồ họa NVIDIA GeForce MX350 giúp tăng tốc <strong>Laptop Dell Inspiron 15 3511</strong>&nbsp;của bạn cả trong công việc lẫn giải trí. Giờ đây bạn có thể nhận được tốc độ xử lí cao hơn với các tác vụ chỉnh sửa ảnh, video và chơi game.</span></p></td><td width=\"30%\"><img data-thumb=\"original\" original-height=\"350\" original-width=\"557\" src=\"//bizweb.sapocdn.net/100/329/122/files/nvidia-geforce-mx330-mx350.jpg?v=1635327843752\" style=\"width: 100%;\"></td></tr></tbody></table><table cellpadding=\"1\" width=\"100%\" style=\"border-collapse: collapse; margin-bottom: 15px;\"><tbody><tr><td width=\"30%\"><span style=\"color: #000000;\"><img data-thumb=\"original\" original-height=\"467\" original-width=\"514\" src=\"//bizweb.sapocdn.net/100/329/122/files/screenshot-1634889628.png?v=1634889640483\" style=\"width: 100%;\"></span></td><td width=\"70%\" style=\"text-align: left;\"><p><span style=\"color: #000000;\"><span style=\"font-size: 18pt;\"><strong>Ứng dụng&nbsp;Dell Mobile Connect</strong></span></span></p><p><span style=\"color: #000000;\"><strong>Laptop Dell Inspiron 15 3511</strong>&nbsp;hợp nhất với thiết bị di động của bạn qua ứng dụng Dell Mobile Connect. Bạn có thể dễ dàng làm việc như nhận cuộc gọi&nbsp;hay&nbsp;tin nhắn SMS trực tiếp từ Laptop Dell hay truyền tải các tệp tin từ điện thoại một cách dễ dàng hơn.</span></p></td></tr></tbody></table></div>' WHERE (`id` = '4');
UPDATE `cdweb2022`.`product` SET `long_description` = '<div class=\"text-full\"><p><strong> Laptop HP Probook 430 G8 614K7PA </strong> mang đến vẻ bề ngoài thanh lịch và cực kỳ hiện đại với tông màu bạc sang trọng. Bên cạnh màu sắc đẹp mắt, laptop khiến người dùng ấn tượng bởi thiết kế siêu mỏng và nhẹ mang đến tính di động hơn bao giờ hết. </p><p><img src=\"https://bizweb.sapocdn.net/100/329/122/files/predator-triton-300.jpg?v=1650621081903\" style=\"width: 100%;\"></p><table cellpadding=\"1\" width=\"100%\" style=\"border-collapse: collapse; margin-bottom: 15px;\"><tbody><tr><td width=\"30%\"><img data-thumb=\"original\" original-height=\"1342\" original-width=\"2100\" src=\"//bizweb.sapocdn.net/100/329/122/files/c07046015.jpg?v=1638417362998\" style=\"width: 100%;\"></td><td width=\"70%\" style=\"text-align: left;\"><p><span style=\"color: #000000;\"><span style=\"font-size: 18pt;\"><strong>Thiết kế khung nhôm sang trọng</strong></span></span></p><p><span style=\"color: #000000;\"><strong>Laptop HP Probook 430 G8</strong> mang đến vẻ bề ngoài thanh lịch&nbsp;và cực kỳ hiện đại với tông&nbsp;màu bạc sang trọng. Bên cạnh màu sắc đẹp mắt, laptop khiến người dùng ấn tượng bởi&nbsp;thiết kế khung nhôm mỏng và nhẹ&nbsp;mang đến tính di động hơn bao giờ hết.</span></p></td></tr></tbody></table><table cellpadding=\"1\" width=\"100%\" style=\"border-collapse: collapse; margin-bottom: 15px;\"><tbody><tr><td width=\"70%\" style=\"text-align: left;\"><p><span style=\"color: #000000;\"><span style=\"font-size: 18pt;\"><strong>Trang bị card đồ họa rời</strong></span></span></p><p><span style=\"color: #000000;\">Card đồ họa NVIDIA GeForce MX350 giúp tăng tốc <strong>Laptop Dell Inspiron 15 3511</strong>&nbsp;của bạn cả trong công việc lẫn giải trí. Giờ đây bạn có thể nhận được tốc độ xử lí cao hơn với các tác vụ chỉnh sửa ảnh, video và chơi game.</span></p></td><td width=\"30%\"><img data-thumb=\"original\" original-height=\"350\" original-width=\"557\" src=\"//bizweb.sapocdn.net/100/329/122/files/nvidia-geforce-mx330-mx350.jpg?v=1635327843752\" style=\"width: 100%;\"></td></tr></tbody></table><table cellpadding=\"1\" width=\"100%\" style=\"border-collapse: collapse; margin-bottom: 15px;\"><tbody><tr><td width=\"30%\"><span style=\"color: #000000;\"><img data-thumb=\"original\" original-height=\"467\" original-width=\"514\" src=\"//bizweb.sapocdn.net/100/329/122/files/screenshot-1634889628.png?v=1634889640483\" style=\"width: 100%;\"></span></td><td width=\"70%\" style=\"text-align: left;\"><p><span style=\"color: #000000;\"><span style=\"font-size: 18pt;\"><strong>Ứng dụng&nbsp;Dell Mobile Connect</strong></span></span></p><p><span style=\"color: #000000;\"><strong>Laptop Dell Inspiron 15 3511</strong>&nbsp;hợp nhất với thiết bị di động của bạn qua ứng dụng Dell Mobile Connect. Bạn có thể dễ dàng làm việc như nhận cuộc gọi&nbsp;hay&nbsp;tin nhắn SMS trực tiếp từ Laptop Dell hay truyền tải các tệp tin từ điện thoại một cách dễ dàng hơn.</span></p></td></tr></tbody></table></div>' WHERE (`id` = '5');

UPDATE `cdweb2022`.`product` SET `promotion` = 'Balo Gaming Aorus.;USB Aorus Chibi 64GB.;Gấu bông Aorus Eagle.;Túi chống sốc.' WHERE (`id` = '2');
UPDATE `cdweb2022`.`product` SET `promotion` = 'Balo Gaming Aorus.;USB Aorus Chibi 64GB.;Gấu bông Aorus Eagle.;Túi chống sốc.' WHERE (`id` = '3');
UPDATE `cdweb2022`.`product` SET `promotion` = 'Balo Gaming Aorus.;USB Aorus Chibi 64GB.;Gấu bông Aorus Eagle.;Túi chống sốc.' WHERE (`id` = '4');
UPDATE `cdweb2022`.`product` SET `promotion` = 'Balo Gaming Aorus.;USB Aorus Chibi 64GB.;Gấu bông Aorus Eagle.;Túi chống sốc.' WHERE (`id` = '5');
