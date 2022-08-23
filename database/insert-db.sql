
--role
INSERT INTO `role`
VALUES
    (0,'admin'),
    (1,'client');
--user
INSERT INTO `user` VALUES
                       (1,NULL,NULL,NULL,NULL,'$2a$10$Wuvn5QeH9/hNzscjyV/DG.Oz1x2bf57KTMVjtrE/VOM8ifZE.2/TG',1,NULL,NULL,'admin'), /*pwd : 123456*/
                       (2,NULL,NULL,NULL,NULL,'$2a$10$Wuvn5QeH9/hNzscjyV/DG.Oz1x2bf57KTMVjtrE/VOM8ifZE.2/TG',1,NULL,NULL,'u2');

--role_user
INSERT INTO `user_role` VALUES (1,0),(2,1);
--size
INSERT INTO `size` VALUES (1,'S'),(2,'M'),(3,'L'),(4,'XL'),(5,'XXL');
--category
INSERT INTO `category` VALUES (1,'Áo thun','Active'),(2,'Ao sơ mi','Active'),(3,'Áo hoodie','Active'),(4,'Áo polo','Active'),(5,'Áo khoác','Active'),(6,'Áo blazer','Active');

--group-product
INSERT INTO `group_product` VALUES (1,'Mô tả sp 1',10,'DirtyCoins Save The Earth T-shirt - Black',1,1),(2,'Mô tả sp 2',10,'Dico Junior Print T-shirt - White',1,1),(3,'Mô tả sp 3',10,'DirtyCoins Retro T-Shirt',1,1),(4,'Mô tả sp 4',10,'Dico B&F Print T-shirt - White',1,1),(5,'Mô tả sp 5',10,'Dico Mate World T-shirt - White',1,1)
