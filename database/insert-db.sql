use webbanao;
-- role
INSERT INTO `webbanao`.`role` (`name`) VALUES ('admin');
INSERT INTO `webbanao`.`role` (`name`) VALUES ('client');


-- user
INSERT INTO `webbanao`.`user` (`birthday`, `created_date`, `email`, `gender`, `password`, `status`, `username`) VALUES 
('2022-10-17 12:15:00', '2022-10-17 12:15:00', 'trungcoder@gmail.com', '1', '$10$zXWNNS2MZDt1tl6SO9Tl.O/cff4CMJLqiB85LlrpbtPsnVONgIXZ6', '1', 'nguyentrung2'),
('2022-10-17 12:15:00', '2022-10-17 12:15:00', 'trungcoder@gmail.com', '1', '$10$zXWNNS2MZDt1tl6SO9Tl.O/cff4CMJLqiB85LlrpbtPsnVONgIXZ6', '1', 'nguyentrung3'),
('2022-10-17 12:15:00', '2022-10-17 12:15:00', 'trungcoder@gmail.com', '1', '$10$zXWNNS2MZDt1tl6SO9Tl.O/cff4CMJLqiB85LlrpbtPsnVONgIXZ6', '1', 'nguyentrung4'),
('2022-10-17 12:15:00', '2022-10-17 12:15:00', 'trungcoder@gmail.com', '1', '$10$zXWNNS2MZDt1tl6SO9Tl.O/cff4CMJLqiB85LlrpbtPsnVONgIXZ6', '1', 'nguyentrung5');


-- role_user
INSERT INTO `webbanao`.`user_role` VALUES (1,1),(2,1),(3,2),(4,2);

-- size
INSERT INTO `size` VALUES (1,'S'),(2,'M'),(3,'L'),(4,'XL'),(5,'XXL');

-- group-product
INSERT INTO `group_product` VALUES (1,'DirtyCoins Save The Earth T-shirt - Black'),(2,'Dico Junior Print T-shirt - White'),(3,'DirtyCoins Retro T-Shirt'),(4,'Dico B&F Print T-shirt - White'),(5,'Dico Mate World T-shirt - White');

-- category
INSERT INTO `category` VALUES (1,'Áo thun','Active'),(2,'Ao sơ mi','Active'),(3,'Áo hoodie','Active'),(4,'Áo polo','Active'),(5,'Áo khoác','Active'),(6,'Áo blazer','Active');

INSERT INTO `voucher` (`code`, `cost`, `ended_date`, `started_date`, `status`, `time`) 
VALUES 
('aaa', '20000', '2022-10-17 12:15:00', '2022-5-17 12:15:00', '1', '14'),
( 'bbb', '20000', '2022-6-17 12:15:00', '2022-4-17 12:15:00', '1', '1'),
( 'ccc', '40000', '2022-10-17 12:15:00', '2022-5-17 12:15:00', '1', '4'),
('ddd', '20000', '2022-6-17 12:15:00', '2022-4-17 12:15:00', '1', '1');