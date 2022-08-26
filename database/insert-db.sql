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
INSERT INTO `role`
VALUES
    (0,'admin'),
    (1,'client');
-- user
INSERT INTO `user` VALUES
                       (1,NULL,NULL,NULL,NULL,'$2a$10$Wuvn5QeH9/hNzscjyV/DG.Oz1x2bf57KTMVjtrE/VOM8ifZE.2/TG',1,NULL,NULL,'admin'), /*pwd : 123456*/
                       (2,NULL,NULL,NULL,NULL,'$2a$10$Wuvn5QeH9/hNzscjyV/DG.Oz1x2bf57KTMVjtrE/VOM8ifZE.2/TG',1,NULL,NULL,'u2');

-- role_user
INSERT INTO `user_role` VALUES (1,0),(2,1);
-- size
INSERT INTO `size` VALUES (1,'S'),(2,'M'),(3,'L'),(4,'XL'),(5,'XXL');
-- category
INSERT INTO `category` VALUES (1,'Áo thun','Active'),(2,'Ao sơ mi','Active'),(3,'Áo hoodie','Active'),(4,'Áo polo','Active'),(5,'Áo khoác','Active'),(6,'Áo blazer','Active');


--group-product
INSERT INTO `group_product` VALUES (1,'Mô tả sp 1',10,'DirtyCoins Save The Earth T-shirt - Black',200000,1,1),(2,'Mô tả sp 2',10,'Dico Junior Print T-shirt - White',350000,1,1),(3,'Mô tả sp 3',10,'DirtyCoins Retro T-Shirt',400000,1,1),(4,'Mô tả sp 4',10,'Dico B&F Print T-shirt - White',250000,1,1),(5,'Mô tả sp 5',10,'Dico Mate World T-shirt - White',400000,1,1)

