/*
 Navicat Premium Data Transfer

 Source Server         : maria 7.3
 Source Server Type    : MariaDB
 Source Server Version : 100410
 Source Host           : localhost:3306
 Source Schema         : yemoncash

 Target Server Type    : MariaDB
 Target Server Version : 100410
 File Encoding         : 65001

 Date: 08/06/2020 09:34:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'uuid',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'hash',
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role` enum('master','admin','kasir') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  `cookies` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `remember` smallint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_id`(`id`) USING BTREE,
  INDEX `admin_nama`(`nama`) USING BTREE,
  FULLTEXT INDEX `admin_username`(`username`)
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('09674429-6247-4e33-9ad6-b3ffaf078e54', 'kasir', '$2y$10$AoTr23wuFeetVYMNRe.fi.2IG5HqWm7cHxSB1q97uEh3nCt/nc3Ni', 'Kasir Dummy', 'kasir', '2020-06-05 15:16:19', '2020-06-05 15:16:19', NULL, NULL, NULL);
INSERT INTO `admin` VALUES ('ac9d43f4-6085-462d-8e5b-38d6b3346eb4', 'adam', '$2y$10$Kfoy6kgBPrTlCmqewkKcL.ZExNhMXkQiLfVKws4UHwpP3nJZul15m', 'Adam', 'admin', '2020-06-06 01:48:22', '2020-06-06 01:54:59', NULL, NULL, NULL);
INSERT INTO `admin` VALUES ('c43a5bd3-7471-473b-954e-1af3580784a5', 'admin', '$2y$10$7W04dtG2zVt4aFHBA.aNE.SPk5EFdtWNZAloUKT7efvsg8lt8vKki', 'Admin', 'master', '2020-06-05 15:16:19', '2020-06-05 15:16:19', NULL, 'ZFjeE8SnZDX9bRNruGJbompqfdv1HrtPj1mIOghDWGLzdoYiCTwi2uq9C5aU4ePM', 1);

-- ----------------------------
-- Table structure for bank
-- ----------------------------
DROP TABLE IF EXISTS `bank`;
CREATE TABLE `bank`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bank
-- ----------------------------
INSERT INTO `bank` VALUES ('08d99da6-6d4b-4ec4-a278-c83703a737bf', 'BTN');
INSERT INTO `bank` VALUES ('2b2adfc9-b507-4cec-a5da-8b0585542a64', 'Panin');
INSERT INTO `bank` VALUES ('6566dac3-a290-4f85-9fcb-faa4856c45ea', 'Permata');
INSERT INTO `bank` VALUES ('b1ca7773-17ea-41e2-9668-f8e101ce2857', 'CIMB');
INSERT INTO `bank` VALUES ('d2b80e07-295d-463b-8a7b-dfcdc499506a', 'Danamon');
INSERT INTO `bank` VALUES ('d6ef613c-7cd9-4b27-89b8-2b7503038f6e', 'Mandiri');
INSERT INTO `bank` VALUES ('d87b8097-00c0-4768-814c-c8a9ab55843c', 'BNI');
INSERT INTO `bank` VALUES ('d9b87a03-1be4-4a22-917e-4af6bd0ca45c', 'BII');
INSERT INTO `bank` VALUES ('ddfb1533-89a7-44a6-90ab-a0dd918a5709', 'BRI');
INSERT INTO `bank` VALUES ('f7cdec47-805c-48c0-9108-8720595cac78', 'BCA');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('215bc859-fc59-443b-ad8e-0603a3b73a45', 'Kawat');
INSERT INTO `category` VALUES ('262031b4-ef3e-4f18-bc39-60a38c358bb8', 'Besi Holo');
INSERT INTO `category` VALUES ('35730670-4c35-4fee-9581-fb5a0ef31eea', 'Lain-lain');
INSERT INTO `category` VALUES ('4f09e16f-3df2-48e9-8876-f078e7298dc2', 'Keramik');
INSERT INTO `category` VALUES ('5c22e2b4-acc2-4dec-8571-3e4c52afe80f', 'Pasir');
INSERT INTO `category` VALUES ('5e01b1d4-47a8-46f1-adf9-a3f62c7830ff', 'Kayu');
INSERT INTO `category` VALUES ('6113fb8c-11a2-4e6f-a371-4ca1901edc83', 'Alumunium');
INSERT INTO `category` VALUES ('6bb97be0-ada7-41b9-ad5a-bb47db47d025', 'Besi Beton');
INSERT INTO `category` VALUES ('72976093-f1f0-495e-9e1a-1badf9b41397', 'Fiber');
INSERT INTO `category` VALUES ('7d1f6357-7e45-4ef2-bcd0-ee22c83c8fd8', 'Asbes');
INSERT INTO `category` VALUES ('8018fdfd-f7f4-4950-8ec6-d561c49f9e33', 'Batu');
INSERT INTO `category` VALUES ('8852403b-af62-4efc-819a-e85ca4b29b56', 'Plastik');
INSERT INTO `category` VALUES ('8dcdc092-204d-4bf6-b70f-f8250c8b1c55', 'Baja Ringan');
INSERT INTO `category` VALUES ('aa27ebc7-ffbe-43f6-a93c-6e6e4e0f4d69', 'Besi');
INSERT INTO `category` VALUES ('b6b932f1-c006-4d55-a5e5-87a3d1854b15', 'Seng');
INSERT INTO `category` VALUES ('bc0d107d-d3a0-4d7c-aeae-12561b0ff9b6', 'Benang');
INSERT INTO `category` VALUES ('c151a008-e6e4-4076-805e-a850cf5a612b', 'Mesin');
INSERT INTO `category` VALUES ('c4f6db73-bbc4-4bca-b135-5c6395189d0d', 'Genteng');
INSERT INTO `category` VALUES ('ca54ff1e-0cdc-49eb-b009-e168a3108125', 'Las');
INSERT INTO `category` VALUES ('df121041-570f-4378-873e-f8c4512f0921', 'Semen');
INSERT INTO `category` VALUES ('e7fa3406-3dac-4b49-8c44-d58e983e9de8', 'Listrik');

-- ----------------------------
-- Table structure for kota
-- ----------------------------
DROP TABLE IF EXISTS `kota`;
CREATE TABLE `kota`  (
  `id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id_provinsi` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kota
-- ----------------------------
INSERT INTO `kota` VALUES ('d1cb9a2c-7dbd-4002-895b-6af072921369', 'Kabupaten Badung', '710da499-7507-447a-9aa9-77610a434034');
INSERT INTO `kota` VALUES ('3cb1ea48-f1d1-400b-aa68-19f591bb1292', 'Kabupaten Bangli', '710da499-7507-447a-9aa9-77610a434034');
INSERT INTO `kota` VALUES ('1266f414-b3f8-44b3-98f5-d7b965bb91f1', 'Kabupaten Buleleng', '710da499-7507-447a-9aa9-77610a434034');
INSERT INTO `kota` VALUES ('d8f070ab-4046-4726-8cbc-0005d220431f', 'Kabupaten Gianyar', '710da499-7507-447a-9aa9-77610a434034');
INSERT INTO `kota` VALUES ('1d695615-d7b8-4ae8-a85b-d89451ce01d3', 'Kabupaten Jembrana', '710da499-7507-447a-9aa9-77610a434034');
INSERT INTO `kota` VALUES ('712b9f2a-8d32-4392-8f39-cf6b0ccedb20', 'Kabupaten Karangasem', '710da499-7507-447a-9aa9-77610a434034');
INSERT INTO `kota` VALUES ('4f792986-9e8a-44a6-a964-1b95513ed1db', 'Kabupaten Klungkung', '710da499-7507-447a-9aa9-77610a434034');
INSERT INTO `kota` VALUES ('011c7c8a-35e9-4a58-9607-2340549c7009', 'Kabupaten Tabanan', '710da499-7507-447a-9aa9-77610a434034');
INSERT INTO `kota` VALUES ('cfd771e1-1c34-47cc-a9db-2ee44205302e', 'Kota Denpasar', '710da499-7507-447a-9aa9-77610a434034');
INSERT INTO `kota` VALUES ('ad43ea62-581e-4eae-9fd9-fe603df6b986', 'Kabupaten Bangka', '1f2ba666-37d8-4420-af3c-426d38a36419');
INSERT INTO `kota` VALUES ('db0375aa-2b16-425f-996c-8f03ca954979', 'Kabupaten Bangka Barat', '1f2ba666-37d8-4420-af3c-426d38a36419');
INSERT INTO `kota` VALUES ('dba02316-d1e0-4066-ac3c-632dab34ccfd', 'Kabupaten Bangka Selatan', '1f2ba666-37d8-4420-af3c-426d38a36419');
INSERT INTO `kota` VALUES ('8c298435-96c1-4695-8ade-d448e626d592', 'Kabupaten Bangka Tengah', '1f2ba666-37d8-4420-af3c-426d38a36419');
INSERT INTO `kota` VALUES ('0e235ebd-98c0-4e2b-ba49-c994d93cc529', 'Kabupaten Belitung', '1f2ba666-37d8-4420-af3c-426d38a36419');
INSERT INTO `kota` VALUES ('0da57628-52a5-4d5b-94cd-3ec85aa7e33f', 'Kabupaten Belitung Timur', '1f2ba666-37d8-4420-af3c-426d38a36419');
INSERT INTO `kota` VALUES ('c3d03b8e-706d-4570-9262-8b2e47958a22', 'Kota Pangkal Pinang', '1f2ba666-37d8-4420-af3c-426d38a36419');
INSERT INTO `kota` VALUES ('2e876ca5-aced-4e4b-b5fe-4567e594efe1', 'Kabupaten Lebak', '4714671c-7593-4e1c-93ea-0c1c4255be79');
INSERT INTO `kota` VALUES ('805e84f8-46ec-4cd1-930f-ae7ab358d342', 'Kabupaten Pandeglang', '4714671c-7593-4e1c-93ea-0c1c4255be79');
INSERT INTO `kota` VALUES ('6364cbb5-336f-4afd-b238-129f5f928ffb', 'Kabupaten Serang', '4714671c-7593-4e1c-93ea-0c1c4255be79');
INSERT INTO `kota` VALUES ('3a4c1706-e578-4453-bc44-295c904fb750', 'Kabupaten Tangerang', '4714671c-7593-4e1c-93ea-0c1c4255be79');
INSERT INTO `kota` VALUES ('57b7b54b-85f2-45c0-b86d-b84a94d588ca', 'Kota Cilegon', '4714671c-7593-4e1c-93ea-0c1c4255be79');
INSERT INTO `kota` VALUES ('3606858d-b883-441c-a0cf-8a3f0fafbce6', 'Kota Serang', '4714671c-7593-4e1c-93ea-0c1c4255be79');
INSERT INTO `kota` VALUES ('7395b7df-b20e-45ed-a999-7be9916b922d', 'Kota Tangerang', '4714671c-7593-4e1c-93ea-0c1c4255be79');
INSERT INTO `kota` VALUES ('171b800b-d6d1-44db-bc97-2348b07c3dc6', 'Kota Tangerang Selatan', '4714671c-7593-4e1c-93ea-0c1c4255be79');
INSERT INTO `kota` VALUES ('e5468c45-cb78-4222-889a-d47c832ed7d7', 'Kabupaten Bengkulu Selatan', '2338c9a3-fe2f-4bea-a46c-890e28c5dbf7');
INSERT INTO `kota` VALUES ('44470773-af23-4e8a-ad57-74504373fd76', 'Kabupaten Bengkulu Tengah', '2338c9a3-fe2f-4bea-a46c-890e28c5dbf7');
INSERT INTO `kota` VALUES ('091b9962-0a76-4e32-8ccf-8897bbf6e1db', 'Kabupaten Bengkulu Utara', '2338c9a3-fe2f-4bea-a46c-890e28c5dbf7');
INSERT INTO `kota` VALUES ('e46921bf-bd96-4889-bd92-132c87aa34d0', 'Kabupaten Kaur', '2338c9a3-fe2f-4bea-a46c-890e28c5dbf7');
INSERT INTO `kota` VALUES ('649c69ce-3888-4f93-ab09-b8cbf7a573ca', 'Kabupaten Kepahiang', '2338c9a3-fe2f-4bea-a46c-890e28c5dbf7');
INSERT INTO `kota` VALUES ('e8d101da-e335-4f17-8f58-15edf019fe08', 'Kabupaten Lebong', '2338c9a3-fe2f-4bea-a46c-890e28c5dbf7');
INSERT INTO `kota` VALUES ('4b3d4a96-7164-491a-9a9a-9dbbe4f2964a', 'Kabupaten Muko Muko', '2338c9a3-fe2f-4bea-a46c-890e28c5dbf7');
INSERT INTO `kota` VALUES ('219cd4e7-6a84-45ef-955b-455e696c15a9', 'Kabupaten Rejang Lebong', '2338c9a3-fe2f-4bea-a46c-890e28c5dbf7');
INSERT INTO `kota` VALUES ('c395ea9e-b56b-4a9e-8283-cae8eac9dabd', 'Kabupaten Seluma', '2338c9a3-fe2f-4bea-a46c-890e28c5dbf7');
INSERT INTO `kota` VALUES ('e2f6002f-1e0a-4dc6-a48e-aa7b4f325efd', 'Kota Bengkulu', '2338c9a3-fe2f-4bea-a46c-890e28c5dbf7');
INSERT INTO `kota` VALUES ('c2186a25-2fec-4998-bf29-d70b4a9315dc', 'Kabupaten Bantul', 'd37010cd-cf14-438f-a996-9cff4c5293e5');
INSERT INTO `kota` VALUES ('3998c4a7-e00c-4ecf-9d2b-5e7326846215', 'Kabupaten Gunung Kidul', 'd37010cd-cf14-438f-a996-9cff4c5293e5');
INSERT INTO `kota` VALUES ('2cfdf3ca-86cc-46a3-97dd-5f39e39b8d39', 'Kabupaten Kulon Progo', 'd37010cd-cf14-438f-a996-9cff4c5293e5');
INSERT INTO `kota` VALUES ('35724d67-37c9-4f11-bddf-791bef5642f1', 'Kabupaten Sleman', 'd37010cd-cf14-438f-a996-9cff4c5293e5');
INSERT INTO `kota` VALUES ('143d222a-29b0-4b7f-bbd8-f5fb0ecc4a6c', 'Kota Yogyakarta', 'd37010cd-cf14-438f-a996-9cff4c5293e5');
INSERT INTO `kota` VALUES ('f7fc1650-b034-4d1b-b2ce-e05a88b74c90', 'Kabupaten Kepulauan Seribu', 'fbabf1e3-8638-425a-abd7-973e484ff2c6');
INSERT INTO `kota` VALUES ('363d4350-1756-43cd-9d2b-53be14da58fe', 'Kota Jakarta Barat', 'fbabf1e3-8638-425a-abd7-973e484ff2c6');
INSERT INTO `kota` VALUES ('bc990a1e-015d-4360-b886-3241a293f710', 'Kota Jakarta Pusat', 'fbabf1e3-8638-425a-abd7-973e484ff2c6');
INSERT INTO `kota` VALUES ('527f34be-ffbd-4fda-be6b-655ef768eff5', 'Kota Jakarta Selatan', 'fbabf1e3-8638-425a-abd7-973e484ff2c6');
INSERT INTO `kota` VALUES ('f5023a4b-6015-4440-bdb1-e96c9dadc5b9', 'Kota Jakarta Timur', 'fbabf1e3-8638-425a-abd7-973e484ff2c6');
INSERT INTO `kota` VALUES ('a7fd0338-c994-485c-b86b-2af563fc15f8', 'Kota Jakarta Utara', 'fbabf1e3-8638-425a-abd7-973e484ff2c6');
INSERT INTO `kota` VALUES ('454de74e-1658-4881-9001-ec45d9fef8b5', 'Kabupaten Boalemo', '52e3ce15-ef50-46f5-8f76-345d1e407c08');
INSERT INTO `kota` VALUES ('3d732a35-3db6-4ec5-8423-703821caf420', 'Kabupaten Bone Bolango', '52e3ce15-ef50-46f5-8f76-345d1e407c08');
INSERT INTO `kota` VALUES ('7f976c62-e5b3-49b3-af95-a7f058bbfe56', 'Kabupaten Gorontalo', '52e3ce15-ef50-46f5-8f76-345d1e407c08');
INSERT INTO `kota` VALUES ('8b976698-e9d7-45d2-bda2-1887dd17b095', 'Kabupaten Gorontalo Utara', '52e3ce15-ef50-46f5-8f76-345d1e407c08');
INSERT INTO `kota` VALUES ('e640c0fe-3c23-4aeb-92d5-faba94c7d2bf', 'Kabupaten Pohuwato', '52e3ce15-ef50-46f5-8f76-345d1e407c08');
INSERT INTO `kota` VALUES ('4d1a1b53-569c-48ef-9974-4f61081a8e60', 'Kota Gorontalo', '52e3ce15-ef50-46f5-8f76-345d1e407c08');
INSERT INTO `kota` VALUES ('188342bd-2165-4f0e-9953-70c5b4af7b63', 'Kabupaten Batang Hari', '255eab9e-2d5c-4025-9e6d-c4d702cad4db');
INSERT INTO `kota` VALUES ('ee55a36f-8ae2-4384-bb7a-38bca6349626', 'Kabupaten Bungo', '255eab9e-2d5c-4025-9e6d-c4d702cad4db');
INSERT INTO `kota` VALUES ('03873458-b88a-4d76-bc5f-a29ef4d8b779', 'Kabupaten Kerinci', '255eab9e-2d5c-4025-9e6d-c4d702cad4db');
INSERT INTO `kota` VALUES ('a241a28f-8646-4b94-ba17-c8b73fa90425', 'Kabupaten Merangin', '255eab9e-2d5c-4025-9e6d-c4d702cad4db');
INSERT INTO `kota` VALUES ('5a969735-b392-40a7-bb8c-f3a10430f21e', 'Kabupaten Muaro Jambi', '255eab9e-2d5c-4025-9e6d-c4d702cad4db');
INSERT INTO `kota` VALUES ('5c65d074-70f7-441c-9a62-f7bdb9a13941', 'Kabupaten Sarolangun', '255eab9e-2d5c-4025-9e6d-c4d702cad4db');
INSERT INTO `kota` VALUES ('ceea12be-9bc9-4c34-a226-e83a03e31812', 'Kabupaten Tanjung Jabung Barat', '255eab9e-2d5c-4025-9e6d-c4d702cad4db');
INSERT INTO `kota` VALUES ('681aaeaa-bfef-435d-87ec-3d59d26c447f', 'Kabupaten Tanjung Jabung Timur', '255eab9e-2d5c-4025-9e6d-c4d702cad4db');
INSERT INTO `kota` VALUES ('dfacc0ef-1d62-4898-aa28-cd4224f2ddc1', 'Kabupaten Tebo', '255eab9e-2d5c-4025-9e6d-c4d702cad4db');
INSERT INTO `kota` VALUES ('7c8ed56a-410f-49bc-a406-ff51a0277780', 'Kota Jambi', '255eab9e-2d5c-4025-9e6d-c4d702cad4db');
INSERT INTO `kota` VALUES ('6a952e16-f6dc-4ac2-8f43-f69b0bc2b954', 'Kota Sungaipenuh', '255eab9e-2d5c-4025-9e6d-c4d702cad4db');
INSERT INTO `kota` VALUES ('7b6aec6e-f207-4297-a029-bfae898ba7eb', 'Kabupaten Bandung', '1e72ea5b-932a-4703-820f-3f05028e88f0');
INSERT INTO `kota` VALUES ('2c91ede1-ba89-483d-9dcf-a6bff213a46b', 'Kabupaten Bandung Barat', '1e72ea5b-932a-4703-820f-3f05028e88f0');
INSERT INTO `kota` VALUES ('67c0ce39-70b9-4c2b-90dc-8797d824797c', 'Kabupaten Bekasi', '1e72ea5b-932a-4703-820f-3f05028e88f0');
INSERT INTO `kota` VALUES ('1ca68009-31f4-4ff7-939b-79d872b76a90', 'Kabupaten Bogor', '1e72ea5b-932a-4703-820f-3f05028e88f0');
INSERT INTO `kota` VALUES ('9d4efac0-737e-475f-91b7-524d539bd90c', 'Kabupaten Ciamis', '1e72ea5b-932a-4703-820f-3f05028e88f0');
INSERT INTO `kota` VALUES ('ff26e4aa-460f-4b71-9780-7a25953866c5', 'Kabupaten Cianjur', '1e72ea5b-932a-4703-820f-3f05028e88f0');
INSERT INTO `kota` VALUES ('32a5c2c8-a4c4-4f8b-8198-3f219753e73b', 'Kabupaten Cirebon', '1e72ea5b-932a-4703-820f-3f05028e88f0');
INSERT INTO `kota` VALUES ('dfe9a571-7ace-451a-a0d9-ba4b2229acf5', 'Kabupaten Garut', '1e72ea5b-932a-4703-820f-3f05028e88f0');
INSERT INTO `kota` VALUES ('da650c05-bb24-485c-afd5-5ef6e0eeba4d', 'Kabupaten Indramayu', '1e72ea5b-932a-4703-820f-3f05028e88f0');
INSERT INTO `kota` VALUES ('0839c92a-7088-4e5a-ae26-56338e35e68f', 'Kabupaten Karawang', '1e72ea5b-932a-4703-820f-3f05028e88f0');
INSERT INTO `kota` VALUES ('8b5a9a54-e851-4d01-b08e-64a4b0267bd2', 'Kabupaten Kuningan', '1e72ea5b-932a-4703-820f-3f05028e88f0');
INSERT INTO `kota` VALUES ('246f2664-aa81-4206-a198-5747bb5bebaa', 'Kabupaten Majalengka', '1e72ea5b-932a-4703-820f-3f05028e88f0');
INSERT INTO `kota` VALUES ('9bfa698d-3232-45ef-bcaa-72698e8e660a', 'Kabupaten Pangandaran', '1e72ea5b-932a-4703-820f-3f05028e88f0');
INSERT INTO `kota` VALUES ('e16d2465-4a29-433d-b022-1b5fa132d25c', 'Kabupaten Purwakarta', '1e72ea5b-932a-4703-820f-3f05028e88f0');
INSERT INTO `kota` VALUES ('2a256fc6-312c-4918-aa25-7f86517f9b53', 'Kabupaten Subang', '1e72ea5b-932a-4703-820f-3f05028e88f0');
INSERT INTO `kota` VALUES ('4ae4359c-3fcf-458a-8464-5c9cdf5451b4', 'Kabupaten Sukabumi', '1e72ea5b-932a-4703-820f-3f05028e88f0');
INSERT INTO `kota` VALUES ('5a762b81-ac3d-4a8b-a375-9747721dd430', 'Kabupaten Sumedang', '1e72ea5b-932a-4703-820f-3f05028e88f0');
INSERT INTO `kota` VALUES ('786f0d55-8843-44a7-8349-8d50a6335167', 'Kabupaten Tasikmalaya', '1e72ea5b-932a-4703-820f-3f05028e88f0');
INSERT INTO `kota` VALUES ('1b5d7fbc-876a-4df6-ba65-75134f88f8cb', 'Kota Bandung', '1e72ea5b-932a-4703-820f-3f05028e88f0');
INSERT INTO `kota` VALUES ('80adcb78-1d1c-4f67-9203-643af3c1ff66', 'Kota Banjar', '1e72ea5b-932a-4703-820f-3f05028e88f0');
INSERT INTO `kota` VALUES ('2da22c19-620a-450a-8105-129e9e4ff65b', 'Kota Bekasi', '1e72ea5b-932a-4703-820f-3f05028e88f0');
INSERT INTO `kota` VALUES ('741d1584-9a7f-4afb-96bc-58ce5aa3e6da', 'Kota Bogor', '1e72ea5b-932a-4703-820f-3f05028e88f0');
INSERT INTO `kota` VALUES ('c5906c40-fc05-45ef-b7af-6959603ab93e', 'Kota Cimahi', '1e72ea5b-932a-4703-820f-3f05028e88f0');
INSERT INTO `kota` VALUES ('da93c2e2-48ad-448e-96da-d775665d5236', 'Kota Cirebon', '1e72ea5b-932a-4703-820f-3f05028e88f0');
INSERT INTO `kota` VALUES ('781ec83f-be2c-427f-af48-73144e8df7f3', 'Kota Depok', '1e72ea5b-932a-4703-820f-3f05028e88f0');
INSERT INTO `kota` VALUES ('a78cf116-6b5f-4db4-9ddf-b3e29268b370', 'Kota Sukabumi', '1e72ea5b-932a-4703-820f-3f05028e88f0');
INSERT INTO `kota` VALUES ('0f72bbc6-9c9e-43b6-84dc-4d614f26af45', 'Kota Tasikmalaya', '1e72ea5b-932a-4703-820f-3f05028e88f0');
INSERT INTO `kota` VALUES ('9163cb0f-ae73-4fa3-98dd-550a14f6cc55', 'Kabupaten Banjarnegara', '9991e93c-e3fc-4618-95e2-8132243cfbd8');
INSERT INTO `kota` VALUES ('effb3000-7225-47b6-9bc2-5ce0cc5a9b30', 'Kabupaten Banyumas', '9991e93c-e3fc-4618-95e2-8132243cfbd8');
INSERT INTO `kota` VALUES ('3e343f19-569b-4e79-9d26-929c9f623833', 'Kabupaten Batang', '9991e93c-e3fc-4618-95e2-8132243cfbd8');
INSERT INTO `kota` VALUES ('d82ecec4-0e2c-4d20-a30a-2ec0b0bcd1d1', 'Kabupaten Blora', '9991e93c-e3fc-4618-95e2-8132243cfbd8');
INSERT INTO `kota` VALUES ('a1e308ac-1dce-4e07-bcdf-9af3950edb4e', 'Kabupaten Boyolali', '9991e93c-e3fc-4618-95e2-8132243cfbd8');
INSERT INTO `kota` VALUES ('ed6b6241-a3cd-4ff0-9875-67cde0de8031', 'Kabupaten Brebes', '9991e93c-e3fc-4618-95e2-8132243cfbd8');
INSERT INTO `kota` VALUES ('5023740a-fbad-44bd-8e71-0803be006536', 'Kabupaten Cilacap', '9991e93c-e3fc-4618-95e2-8132243cfbd8');
INSERT INTO `kota` VALUES ('29c43c30-f318-4f79-ae5e-a126b7d11c96', 'Kabupaten Demak', '9991e93c-e3fc-4618-95e2-8132243cfbd8');
INSERT INTO `kota` VALUES ('eb368afd-d6a0-4d0a-a71a-cf2a9eaccdc6', 'Kabupaten Grobogan', '9991e93c-e3fc-4618-95e2-8132243cfbd8');
INSERT INTO `kota` VALUES ('5679e801-0ece-4f4c-abf5-74e3a042300e', 'Kabupaten Jepara', '9991e93c-e3fc-4618-95e2-8132243cfbd8');
INSERT INTO `kota` VALUES ('17aa3dbb-9d0b-4942-8408-6898cb72bc11', 'Kabupaten Karanganyar', '9991e93c-e3fc-4618-95e2-8132243cfbd8');
INSERT INTO `kota` VALUES ('47d62063-ffe0-4163-98e9-48022a5db185', 'Kabupaten Kebumen', '9991e93c-e3fc-4618-95e2-8132243cfbd8');
INSERT INTO `kota` VALUES ('6557f938-191a-463e-aad3-08893a1222a1', 'Kabupaten Kendal', '9991e93c-e3fc-4618-95e2-8132243cfbd8');
INSERT INTO `kota` VALUES ('7142a9d9-a28d-488f-b0a7-f0debe4c00f4', 'Kabupaten Klaten', '9991e93c-e3fc-4618-95e2-8132243cfbd8');
INSERT INTO `kota` VALUES ('ece5f6e0-94e7-4af4-afa1-74f227feeff4', 'Kabupaten Kudus', '9991e93c-e3fc-4618-95e2-8132243cfbd8');
INSERT INTO `kota` VALUES ('007f9903-4b95-4923-8095-04c113372f07', 'Kabupaten Magelang', '9991e93c-e3fc-4618-95e2-8132243cfbd8');
INSERT INTO `kota` VALUES ('ded4313f-ef38-408a-8ce0-4ac46e709279', 'Kabupaten Pati', '9991e93c-e3fc-4618-95e2-8132243cfbd8');
INSERT INTO `kota` VALUES ('4dadc074-8cad-4434-85c8-bb120e186f13', 'Kabupaten Pekalongan', '9991e93c-e3fc-4618-95e2-8132243cfbd8');
INSERT INTO `kota` VALUES ('9af2e320-1a22-4358-a3e3-cee2bb08c16e', 'Kabupaten Pemalang', '9991e93c-e3fc-4618-95e2-8132243cfbd8');
INSERT INTO `kota` VALUES ('513d42cd-a4d4-4399-9347-08071db7ac45', 'Kabupaten Purbalingga', '9991e93c-e3fc-4618-95e2-8132243cfbd8');
INSERT INTO `kota` VALUES ('69baef91-8f88-4db3-8388-908a82ac799b', 'Kabupaten Purworejo', '9991e93c-e3fc-4618-95e2-8132243cfbd8');
INSERT INTO `kota` VALUES ('595a1e33-f8af-42b0-a455-e8d8e746d987', 'Kabupaten Rembang', '9991e93c-e3fc-4618-95e2-8132243cfbd8');
INSERT INTO `kota` VALUES ('6e642384-73f3-46f5-990c-3a645b820af3', 'Kabupaten Semarang', '9991e93c-e3fc-4618-95e2-8132243cfbd8');
INSERT INTO `kota` VALUES ('33be3c66-b77b-42d7-9728-c4a3afb8cc63', 'Kabupaten Sragen', '9991e93c-e3fc-4618-95e2-8132243cfbd8');
INSERT INTO `kota` VALUES ('835b9971-d838-4bf2-9e3d-c2edd5ccd325', 'Kabupaten Sukoharjo', '9991e93c-e3fc-4618-95e2-8132243cfbd8');
INSERT INTO `kota` VALUES ('4fd4bb71-56dd-49ac-a194-1b4ab48d8227', 'Kabupaten Tegal', '9991e93c-e3fc-4618-95e2-8132243cfbd8');
INSERT INTO `kota` VALUES ('9ac44ba3-426f-45d5-a246-82e3c244e9b6', 'Kabupaten Temanggung', '9991e93c-e3fc-4618-95e2-8132243cfbd8');
INSERT INTO `kota` VALUES ('fdc9555d-58db-44bc-b124-7c658af8c229', 'Kabupaten Wonogiri', '9991e93c-e3fc-4618-95e2-8132243cfbd8');
INSERT INTO `kota` VALUES ('2c332b9b-9511-4c4c-b7d9-efef715c5c18', 'Kabupaten Wonosobo', '9991e93c-e3fc-4618-95e2-8132243cfbd8');
INSERT INTO `kota` VALUES ('eb5bfec6-5e20-4034-8de6-9a7502c7b972', 'Kota Magelang', '9991e93c-e3fc-4618-95e2-8132243cfbd8');
INSERT INTO `kota` VALUES ('632cbc3d-7bc8-482a-876e-88c6e7a3045c', 'Kota Pekalongan', '9991e93c-e3fc-4618-95e2-8132243cfbd8');
INSERT INTO `kota` VALUES ('91f604a2-9277-4f27-8b18-33e729098aec', 'Kota Salatiga', '9991e93c-e3fc-4618-95e2-8132243cfbd8');
INSERT INTO `kota` VALUES ('bb02e878-91f4-4579-b5a3-a048b38912b8', 'Kota Semarang', '9991e93c-e3fc-4618-95e2-8132243cfbd8');
INSERT INTO `kota` VALUES ('0ed52af3-c8de-4da6-8546-0e0e9cb5f5eb', 'Kota Surakarta', '9991e93c-e3fc-4618-95e2-8132243cfbd8');
INSERT INTO `kota` VALUES ('4bd16372-148c-495f-8861-062c5d702863', 'Kota Tegal', '9991e93c-e3fc-4618-95e2-8132243cfbd8');
INSERT INTO `kota` VALUES ('0e21b753-75b3-426f-a761-3b7cb7d17aa6', 'Kabupaten Bangkalan', '082c040d-a9b2-4d27-8b39-e9af1babde30');
INSERT INTO `kota` VALUES ('03a490cf-6a31-43fa-9427-fb1980df44d7', 'Kabupaten Banyuwangi', '082c040d-a9b2-4d27-8b39-e9af1babde30');
INSERT INTO `kota` VALUES ('74dad5d4-c870-44b7-b875-8045cf4724cd', 'Kabupaten Blitar', '082c040d-a9b2-4d27-8b39-e9af1babde30');
INSERT INTO `kota` VALUES ('d1490441-321f-40c1-b7eb-af13c0adbdc3', 'Kabupaten Bojonegoro', '082c040d-a9b2-4d27-8b39-e9af1babde30');
INSERT INTO `kota` VALUES ('530bd1c9-c475-45ff-86d7-04bbb61aca09', 'Kabupaten Bondowoso', '082c040d-a9b2-4d27-8b39-e9af1babde30');
INSERT INTO `kota` VALUES ('d452bd73-dbcc-4f76-bbfb-b6afed0cf8a3', 'Kabupaten Gresik', '082c040d-a9b2-4d27-8b39-e9af1babde30');
INSERT INTO `kota` VALUES ('37d17588-2ac8-4d9e-91e8-3183b23761f6', 'Kabupaten Jember', '082c040d-a9b2-4d27-8b39-e9af1babde30');
INSERT INTO `kota` VALUES ('4a4a2d5f-8e14-423d-b4e6-264005f4a7eb', 'Kabupaten Jombang', '082c040d-a9b2-4d27-8b39-e9af1babde30');
INSERT INTO `kota` VALUES ('0428200e-de58-4f59-8f65-232126e91496', 'Kabupaten Kediri', '082c040d-a9b2-4d27-8b39-e9af1babde30');
INSERT INTO `kota` VALUES ('f1cacd6f-14f4-4667-bc12-1a7c14304e28', 'Kabupaten Lamongan', '082c040d-a9b2-4d27-8b39-e9af1babde30');
INSERT INTO `kota` VALUES ('3dfcb8bf-3984-47f8-aca1-304931edf8f0', 'Kabupaten Lumajang', '082c040d-a9b2-4d27-8b39-e9af1babde30');
INSERT INTO `kota` VALUES ('dc895d55-9788-429c-873f-47272259cde8', 'Kabupaten Madiun', '082c040d-a9b2-4d27-8b39-e9af1babde30');
INSERT INTO `kota` VALUES ('b7a9434e-a049-479f-bfa0-322144f4167c', 'Kabupaten Magetan', '082c040d-a9b2-4d27-8b39-e9af1babde30');
INSERT INTO `kota` VALUES ('062fc043-8dcb-42b1-af29-25cfad67825d', 'Kabupaten Malang', '082c040d-a9b2-4d27-8b39-e9af1babde30');
INSERT INTO `kota` VALUES ('486a9032-7cff-443c-b579-adbc152fb1de', 'Kabupaten Mojokerto', '082c040d-a9b2-4d27-8b39-e9af1babde30');
INSERT INTO `kota` VALUES ('80abdc20-87bb-47c2-b703-b65790296aee', 'Kabupaten Nganjuk', '082c040d-a9b2-4d27-8b39-e9af1babde30');
INSERT INTO `kota` VALUES ('1e255dae-a386-4537-adfe-f1c6689dc9a5', 'Kabupaten Ngawi', '082c040d-a9b2-4d27-8b39-e9af1babde30');
INSERT INTO `kota` VALUES ('72049ab0-d8d2-41eb-a2d0-bc918759e13c', 'Kabupaten Pacitan', '082c040d-a9b2-4d27-8b39-e9af1babde30');
INSERT INTO `kota` VALUES ('6ddfa859-ab41-47dd-ab7f-e4661452db7b', 'Kabupaten Pamekasan', '082c040d-a9b2-4d27-8b39-e9af1babde30');
INSERT INTO `kota` VALUES ('dee0ba46-2105-4eb9-8e99-38e9e002406d', 'Kabupaten Pasuruan', '082c040d-a9b2-4d27-8b39-e9af1babde30');
INSERT INTO `kota` VALUES ('c77c2d3d-7ffe-4650-b987-ca1ac436f78c', 'Kabupaten Ponorogo', '082c040d-a9b2-4d27-8b39-e9af1babde30');
INSERT INTO `kota` VALUES ('e740c375-295b-432e-b469-63ba7a07615c', 'Kabupaten Probolinggo', '082c040d-a9b2-4d27-8b39-e9af1babde30');
INSERT INTO `kota` VALUES ('1899e2aa-fce2-4048-ac0a-6a7b6eb96124', 'Kabupaten Sampang', '082c040d-a9b2-4d27-8b39-e9af1babde30');
INSERT INTO `kota` VALUES ('5685398d-b98d-44ed-8a41-68bf12024fe9', 'Kabupaten Sidoarjo', '082c040d-a9b2-4d27-8b39-e9af1babde30');
INSERT INTO `kota` VALUES ('f26f05af-8109-48a7-9a78-e105e662c373', 'Kabupaten Situbondo', '082c040d-a9b2-4d27-8b39-e9af1babde30');
INSERT INTO `kota` VALUES ('963564e5-bb7e-499f-accc-e0bdb3a2d877', 'Kabupaten Sumenep', '082c040d-a9b2-4d27-8b39-e9af1babde30');
INSERT INTO `kota` VALUES ('b3a1e869-092f-4054-82fd-08a2b7e41f07', 'Kabupaten Trenggalek', '082c040d-a9b2-4d27-8b39-e9af1babde30');
INSERT INTO `kota` VALUES ('6ea4c403-855f-48b7-be54-1b3f6381a55f', 'Kabupaten Tuban', '082c040d-a9b2-4d27-8b39-e9af1babde30');
INSERT INTO `kota` VALUES ('43af50c5-9a19-4c6c-b01a-01118e0f4d7f', 'Kabupaten Tulungagung', '082c040d-a9b2-4d27-8b39-e9af1babde30');
INSERT INTO `kota` VALUES ('97fad6ad-e192-45cc-af80-a2b78098f16b', 'Kota Batu', '082c040d-a9b2-4d27-8b39-e9af1babde30');
INSERT INTO `kota` VALUES ('b9c37603-e1de-4f54-ae7b-a4ccd600747a', 'Kota Blitar', '082c040d-a9b2-4d27-8b39-e9af1babde30');
INSERT INTO `kota` VALUES ('a889925e-8b10-4035-8ea2-d9420baae1d5', 'Kota Kediri', '082c040d-a9b2-4d27-8b39-e9af1babde30');
INSERT INTO `kota` VALUES ('7bf2cafd-5844-4874-8967-1f2664dec93d', 'Kota Madiun', '082c040d-a9b2-4d27-8b39-e9af1babde30');
INSERT INTO `kota` VALUES ('81274245-616c-4994-9e7c-98744f51ee6c', 'Kota Malang', '082c040d-a9b2-4d27-8b39-e9af1babde30');
INSERT INTO `kota` VALUES ('7ba77099-1139-4050-9036-8b69875137bd', 'Kota Mojokerto', '082c040d-a9b2-4d27-8b39-e9af1babde30');
INSERT INTO `kota` VALUES ('40cbe08c-4dc2-4a11-b62c-1f61704b6d54', 'Kota Pasuruan', '082c040d-a9b2-4d27-8b39-e9af1babde30');
INSERT INTO `kota` VALUES ('31af49ee-8c62-4be3-bb15-f402b649872b', 'Kota Probolinggo', '082c040d-a9b2-4d27-8b39-e9af1babde30');
INSERT INTO `kota` VALUES ('78fdfab5-c2b4-44c7-be41-9ed331bcc991', 'Kota Surabaya', '082c040d-a9b2-4d27-8b39-e9af1babde30');
INSERT INTO `kota` VALUES ('b52239ca-ee79-4e61-95ed-839b8925c4b1', 'Kabupaten Bengkayang', '68b39269-2909-4301-aa9d-92677786c3ff');
INSERT INTO `kota` VALUES ('1d8fd2ee-b767-46d1-9771-ab32a99a5017', 'Kabupaten Kapuas Hulu', '68b39269-2909-4301-aa9d-92677786c3ff');
INSERT INTO `kota` VALUES ('42ad284e-3182-4d71-b21b-96733367d197', 'Kabupaten Kayong Utara', '68b39269-2909-4301-aa9d-92677786c3ff');
INSERT INTO `kota` VALUES ('72f4fdb1-3fb0-4e5c-ae17-668c1b1a3703', 'Kabupaten Ketapang', '68b39269-2909-4301-aa9d-92677786c3ff');
INSERT INTO `kota` VALUES ('835f00b0-8bef-464b-941d-d6a2bab21e30', 'Kabupaten Kubu Raya', '68b39269-2909-4301-aa9d-92677786c3ff');
INSERT INTO `kota` VALUES ('c15d64df-c1d1-42ec-bce4-ac18ad8ec098', 'Kabupaten Landak', '68b39269-2909-4301-aa9d-92677786c3ff');
INSERT INTO `kota` VALUES ('34653646-18ca-4775-8137-e17dd9de1cc8', 'Kabupaten Melawi', '68b39269-2909-4301-aa9d-92677786c3ff');
INSERT INTO `kota` VALUES ('2ff4252f-782b-4d3f-8f05-6ea6d29f7a7c', 'Kabupaten Mempawah', '68b39269-2909-4301-aa9d-92677786c3ff');
INSERT INTO `kota` VALUES ('d22d5440-f1d8-4417-8d69-f1c36c3a231c', 'Kabupaten Sambas', '68b39269-2909-4301-aa9d-92677786c3ff');
INSERT INTO `kota` VALUES ('41c31e10-a85c-4921-9dbf-424013821948', 'Kabupaten Sanggau', '68b39269-2909-4301-aa9d-92677786c3ff');
INSERT INTO `kota` VALUES ('8b4bd736-6522-405c-bb0e-4b65c63eb5fd', 'Kabupaten Sekadau', '68b39269-2909-4301-aa9d-92677786c3ff');
INSERT INTO `kota` VALUES ('3e5daeec-492e-4d81-b690-ea2a7cc97fbd', 'Kabupaten Sintang', '68b39269-2909-4301-aa9d-92677786c3ff');
INSERT INTO `kota` VALUES ('da0d38f0-0da4-4d72-9766-7780b13a51c1', 'Kota Pontianak', '68b39269-2909-4301-aa9d-92677786c3ff');
INSERT INTO `kota` VALUES ('610dd359-84d1-4352-a511-8f2635c31f90', 'Kota Singkawang', '68b39269-2909-4301-aa9d-92677786c3ff');
INSERT INTO `kota` VALUES ('c769e60f-8b9b-4981-846c-b9e3641d3e1d', 'Kabupaten Balangan', 'd41945fb-2447-4573-8298-25d88f5cdbd4');
INSERT INTO `kota` VALUES ('9d8fdfef-fe88-42a1-9638-32f284564840', 'Kabupaten Banjar', 'd41945fb-2447-4573-8298-25d88f5cdbd4');
INSERT INTO `kota` VALUES ('487cbe8f-7f23-41c6-8fa0-6565d02021f7', 'Kabupaten Barito Kuala', 'd41945fb-2447-4573-8298-25d88f5cdbd4');
INSERT INTO `kota` VALUES ('b44578ae-6b94-4e15-8f41-0c9fca3b42a5', 'Kabupaten Hulu Sungai Selatan', 'd41945fb-2447-4573-8298-25d88f5cdbd4');
INSERT INTO `kota` VALUES ('122cc718-5aa1-45f9-85f0-99d28731ff18', 'Kabupaten Hulu Sungai Tengah', 'd41945fb-2447-4573-8298-25d88f5cdbd4');
INSERT INTO `kota` VALUES ('744f9f53-cff7-4a65-9897-eb69d41faea6', 'Kabupaten Hulu Sungai Utara', 'd41945fb-2447-4573-8298-25d88f5cdbd4');
INSERT INTO `kota` VALUES ('7580337c-6039-4e8f-8b3d-280c101258e5', 'Kabupaten Kotabaru', 'd41945fb-2447-4573-8298-25d88f5cdbd4');
INSERT INTO `kota` VALUES ('1445cd81-7812-44cf-985a-3d06b550e47d', 'Kabupaten Tabalong', 'd41945fb-2447-4573-8298-25d88f5cdbd4');
INSERT INTO `kota` VALUES ('8d0dce81-2f96-4764-bbc0-6675a1dba032', 'Kabupaten Tanah Bumbu', 'd41945fb-2447-4573-8298-25d88f5cdbd4');
INSERT INTO `kota` VALUES ('01c67afd-e004-41e2-94c7-a6b4434a3867', 'Kabupaten Tanah Laut', 'd41945fb-2447-4573-8298-25d88f5cdbd4');
INSERT INTO `kota` VALUES ('aac526a2-1093-48f6-9834-21f0eaa8183b', 'Kabupaten Tapin', 'd41945fb-2447-4573-8298-25d88f5cdbd4');
INSERT INTO `kota` VALUES ('7d504a4a-37c4-4a5c-bfb3-f817ad67ee5f', 'Kota Banjarbaru', 'd41945fb-2447-4573-8298-25d88f5cdbd4');
INSERT INTO `kota` VALUES ('63eff47f-e0b4-4a9f-b1fb-9f963bfc5035', 'Kota Banjarmasin', 'd41945fb-2447-4573-8298-25d88f5cdbd4');
INSERT INTO `kota` VALUES ('dc031883-1939-4d70-9f34-b5f328929eef', 'Kabupaten Barito Selatan', 'ff1c75ed-c5a8-49ba-a57b-fa503140e44e');
INSERT INTO `kota` VALUES ('d88b480d-9054-4efe-82e2-80dfc92344b7', 'Kabupaten Barito Timur', 'ff1c75ed-c5a8-49ba-a57b-fa503140e44e');
INSERT INTO `kota` VALUES ('479a08e0-76c2-4b93-8eb8-c72c0c6444dc', 'Kabupaten Barito Utara', 'ff1c75ed-c5a8-49ba-a57b-fa503140e44e');
INSERT INTO `kota` VALUES ('53ab030e-9168-4330-8065-c0adc4f6e0e6', 'Kabupaten Gunung Mas', 'ff1c75ed-c5a8-49ba-a57b-fa503140e44e');
INSERT INTO `kota` VALUES ('320fcb6b-cedc-4b76-b7cd-cc01f8f033f4', 'Kabupaten Kapuas', 'ff1c75ed-c5a8-49ba-a57b-fa503140e44e');
INSERT INTO `kota` VALUES ('b91ec27e-5316-4b4b-976d-ef633ff7e009', 'Kabupaten Katingan', 'ff1c75ed-c5a8-49ba-a57b-fa503140e44e');
INSERT INTO `kota` VALUES ('52426898-8eed-4271-8931-d43060f041ab', 'Kabupaten Kotawaringin Barat', 'ff1c75ed-c5a8-49ba-a57b-fa503140e44e');
INSERT INTO `kota` VALUES ('838a512d-c3a6-4edc-a786-b06d70d58f8d', 'Kabupaten Kotawaringin Timur', 'ff1c75ed-c5a8-49ba-a57b-fa503140e44e');
INSERT INTO `kota` VALUES ('2aaec16f-3aec-4c3d-a52c-bdeff2bc11e6', 'Kabupaten Lamandau', 'ff1c75ed-c5a8-49ba-a57b-fa503140e44e');
INSERT INTO `kota` VALUES ('0bfb4e0b-a888-4b9d-80a5-94f90f713ab3', 'Kabupaten Murung Raya', 'ff1c75ed-c5a8-49ba-a57b-fa503140e44e');
INSERT INTO `kota` VALUES ('688d25da-e1ef-4666-bfda-55fea28b123d', 'Kabupaten Pulang Pisau', 'ff1c75ed-c5a8-49ba-a57b-fa503140e44e');
INSERT INTO `kota` VALUES ('a73f29f9-be1f-44d7-b890-3e8bbeffae69', 'Kabupaten Seruyan', 'ff1c75ed-c5a8-49ba-a57b-fa503140e44e');
INSERT INTO `kota` VALUES ('c3053102-3da6-463d-82ae-11fc9ba4eddc', 'Kabupaten Sukamara', 'ff1c75ed-c5a8-49ba-a57b-fa503140e44e');
INSERT INTO `kota` VALUES ('371a57d1-3a2d-44b4-8e17-b1e5381e5fb7', 'Kota Palangka Raya', 'ff1c75ed-c5a8-49ba-a57b-fa503140e44e');
INSERT INTO `kota` VALUES ('8ce23739-5a1b-49de-bd49-02c50d65f09c', 'Kabupaten Berau', 'f964ca9f-8cc4-431f-8d6d-afbce83a1482');
INSERT INTO `kota` VALUES ('51d2f424-b47b-4c98-bcd8-722a32660729', 'Kabupaten Kutai Barat', 'f964ca9f-8cc4-431f-8d6d-afbce83a1482');
INSERT INTO `kota` VALUES ('ef294aa4-0f62-4849-aaa8-48bc043584d2', 'Kabupaten Kutai Kartanegara', 'f964ca9f-8cc4-431f-8d6d-afbce83a1482');
INSERT INTO `kota` VALUES ('5e577981-2d00-42ed-8d4b-233e660431f8', 'Kabupaten Kutai Timur', 'f964ca9f-8cc4-431f-8d6d-afbce83a1482');
INSERT INTO `kota` VALUES ('ac1629b2-d517-45e2-a305-2c9fdea1a41b', 'Kabupaten Mahakam Ulu', 'f964ca9f-8cc4-431f-8d6d-afbce83a1482');
INSERT INTO `kota` VALUES ('8859b0ae-ebcb-478a-8b1b-e0b731925d5f', 'Kabupaten Paser', 'f964ca9f-8cc4-431f-8d6d-afbce83a1482');
INSERT INTO `kota` VALUES ('8d428c78-a29b-4011-8bb6-59557d06bace', 'Kabupaten Penajam Paser Utara', 'f964ca9f-8cc4-431f-8d6d-afbce83a1482');
INSERT INTO `kota` VALUES ('e6efc981-666f-42fa-a6c3-c2ccac1fe239', 'Kota Balikpapan', 'f964ca9f-8cc4-431f-8d6d-afbce83a1482');
INSERT INTO `kota` VALUES ('06108423-0948-405d-8d6d-0ae7f2696b55', 'Kota Bontang', 'f964ca9f-8cc4-431f-8d6d-afbce83a1482');
INSERT INTO `kota` VALUES ('5015f98c-23dd-410b-8901-55735ad70548', 'Kota Samarinda', 'f964ca9f-8cc4-431f-8d6d-afbce83a1482');
INSERT INTO `kota` VALUES ('fa4fe92b-e64a-4a60-8804-4d7b1d9afbab', 'Kabupaten Bulungan', '636165b8-b850-4e38-b476-5dcbff4ddeee');
INSERT INTO `kota` VALUES ('2e85ba0a-63b5-42be-83f9-f4717ed2d7a5', 'Kabupaten Malinau', '636165b8-b850-4e38-b476-5dcbff4ddeee');
INSERT INTO `kota` VALUES ('485cb30b-8fdc-46b5-b671-9c0c2b6b462a', 'Kabupaten Nunukan', '636165b8-b850-4e38-b476-5dcbff4ddeee');
INSERT INTO `kota` VALUES ('dc8942c7-27cd-46df-ab56-f2e8a9517bef', 'Kabupaten Tana Tidung', '636165b8-b850-4e38-b476-5dcbff4ddeee');
INSERT INTO `kota` VALUES ('af7eee3f-af90-47be-9c6a-c9523513694e', 'Kota Tarakan', '636165b8-b850-4e38-b476-5dcbff4ddeee');
INSERT INTO `kota` VALUES ('3d90835b-3ff1-42be-a75c-7d3a75769a18', 'Kabupaten Bintan', 'e62c819c-8e09-47b9-b8ea-751a6229dfd5');
INSERT INTO `kota` VALUES ('2b3f9697-b1ab-41b6-b77a-fc236ac97671', 'Kabupaten Karimun', 'e62c819c-8e09-47b9-b8ea-751a6229dfd5');
INSERT INTO `kota` VALUES ('b5586eb6-041d-4ddd-9af3-7ab5fa30304d', 'Kabupaten Kepulauan Anambas', 'e62c819c-8e09-47b9-b8ea-751a6229dfd5');
INSERT INTO `kota` VALUES ('38c1a01c-68e4-4570-be8f-8efc30854c87', 'Kabupaten Lingga', 'e62c819c-8e09-47b9-b8ea-751a6229dfd5');
INSERT INTO `kota` VALUES ('d0d53b85-7d40-4676-8597-6bb634cef78c', 'Kabupaten Natuna', 'e62c819c-8e09-47b9-b8ea-751a6229dfd5');
INSERT INTO `kota` VALUES ('869dbcfa-a87e-4b67-bd56-6847312ec77a', 'Kota Batam', 'e62c819c-8e09-47b9-b8ea-751a6229dfd5');
INSERT INTO `kota` VALUES ('0103dda4-b954-4a11-8e03-ed79f08ae8a3', 'Kota Tanjung Pinang', 'e62c819c-8e09-47b9-b8ea-751a6229dfd5');
INSERT INTO `kota` VALUES ('9b79d30d-91c4-4f8f-bcb5-4ed09d47bbad', 'Kabupaten Lampung Barat', 'c401a144-a6be-41fa-8593-950c3c234754');
INSERT INTO `kota` VALUES ('54bede0e-766b-4fc8-a28c-f14e63731612', 'Kabupaten Lampung Selatan', 'c401a144-a6be-41fa-8593-950c3c234754');
INSERT INTO `kota` VALUES ('4b6faf9f-c3cb-4efc-826a-c4f0b6b11ce2', 'Kabupaten Lampung Tengah', 'c401a144-a6be-41fa-8593-950c3c234754');
INSERT INTO `kota` VALUES ('c7bf64cf-40c4-4b0b-9bc3-adbd8a50c5aa', 'Kabupaten Lampung Timur', 'c401a144-a6be-41fa-8593-950c3c234754');
INSERT INTO `kota` VALUES ('6658b358-c7dc-4592-90a4-0bec78e6c8ce', 'Kabupaten Lampung Utara', 'c401a144-a6be-41fa-8593-950c3c234754');
INSERT INTO `kota` VALUES ('f51c0b14-8a0e-4ba1-a534-9911624fdf86', 'Kabupaten Mesuji', 'c401a144-a6be-41fa-8593-950c3c234754');
INSERT INTO `kota` VALUES ('adb9df16-629d-4ca9-ba94-0ca142fcc74f', 'Kabupaten Pesawaran', 'c401a144-a6be-41fa-8593-950c3c234754');
INSERT INTO `kota` VALUES ('db1d360c-24e5-46f0-8bde-a8aa272d8f1d', 'Kabupaten Pesisir Barat', 'c401a144-a6be-41fa-8593-950c3c234754');
INSERT INTO `kota` VALUES ('5b7e8b0d-b1e5-473a-b469-2d38a9d3a7b2', 'Kabupaten Pringsewu', 'c401a144-a6be-41fa-8593-950c3c234754');
INSERT INTO `kota` VALUES ('6bbe5387-3b9b-427b-97e0-da16db4ec27b', 'Kabupaten Tanggamus', 'c401a144-a6be-41fa-8593-950c3c234754');
INSERT INTO `kota` VALUES ('01b82f13-af51-4c92-91fa-d13f4c31cb2d', 'Kabupaten Tulang Bawang', 'c401a144-a6be-41fa-8593-950c3c234754');
INSERT INTO `kota` VALUES ('cf0609dc-3c33-49e5-a3ff-e8a7807acf1e', 'Kabupaten Tulang Bawang Barat', 'c401a144-a6be-41fa-8593-950c3c234754');
INSERT INTO `kota` VALUES ('28d25df5-d396-4dd0-9137-421c91a1c042', 'Kabupaten Way Kanan', 'c401a144-a6be-41fa-8593-950c3c234754');
INSERT INTO `kota` VALUES ('cfee59a9-b789-430a-9a4f-b7ae92beb089', 'Kota Bandar Lampung', 'c401a144-a6be-41fa-8593-950c3c234754');
INSERT INTO `kota` VALUES ('45b58e11-0a55-45ea-b0dd-86328f70798f', 'Kota Metro', 'c401a144-a6be-41fa-8593-950c3c234754');
INSERT INTO `kota` VALUES ('f45e53e3-824d-477c-b498-aa9e30d08622', 'Kabupaten Buru', '856513ab-774d-43b9-ac4e-c1c0a2dbf396');
INSERT INTO `kota` VALUES ('abb217bf-17c2-4bcd-8365-ef8d8a677497', 'Kabupaten Buru Selatan', '856513ab-774d-43b9-ac4e-c1c0a2dbf396');
INSERT INTO `kota` VALUES ('9d403c91-e9f0-4162-90b3-61de894a2b1b', 'Kabupaten Kepulauan Aru', '856513ab-774d-43b9-ac4e-c1c0a2dbf396');
INSERT INTO `kota` VALUES ('5c34ff7e-34f1-475e-a0e7-af65e454b09a', 'Kabupaten Maluku Barat Daya', '856513ab-774d-43b9-ac4e-c1c0a2dbf396');
INSERT INTO `kota` VALUES ('53e87b66-6d04-44b0-8366-efd0bfa63508', 'Kabupaten Maluku Tengah', '856513ab-774d-43b9-ac4e-c1c0a2dbf396');
INSERT INTO `kota` VALUES ('a96838e6-5ae1-4ba7-8267-3050783d6809', 'Kabupaten Maluku Tenggara', '856513ab-774d-43b9-ac4e-c1c0a2dbf396');
INSERT INTO `kota` VALUES ('d0b9b942-0f99-46cb-85dd-aa9bd0de176d', 'Kabupaten Maluku Tenggara Barat', '856513ab-774d-43b9-ac4e-c1c0a2dbf396');
INSERT INTO `kota` VALUES ('cc1e7741-0161-4689-9d37-1d807a874659', 'Kabupaten Seram Bagian Barat', '856513ab-774d-43b9-ac4e-c1c0a2dbf396');
INSERT INTO `kota` VALUES ('fb1f7842-4c4d-46c0-a7f3-e52eb0e7e4fe', 'Kabupaten Seram Bagian Timur', '856513ab-774d-43b9-ac4e-c1c0a2dbf396');
INSERT INTO `kota` VALUES ('cad39432-a901-42ac-a709-46868a6a36ea', 'Kota Ambon', '856513ab-774d-43b9-ac4e-c1c0a2dbf396');
INSERT INTO `kota` VALUES ('f981a5a6-4209-46f7-ae06-82ed27e38b5f', 'Kota Tual', '856513ab-774d-43b9-ac4e-c1c0a2dbf396');
INSERT INTO `kota` VALUES ('afb19544-182d-44e0-9076-d0615ae647d3', 'Kabupaten Halmahera Barat', 'ce193c2c-afff-4c52-8528-aeb024d60ca7');
INSERT INTO `kota` VALUES ('d2b5ae47-5127-43f5-87ae-75345aad2418', 'Kabupaten Halmahera Selatan', 'ce193c2c-afff-4c52-8528-aeb024d60ca7');
INSERT INTO `kota` VALUES ('79936454-68da-498b-a1d8-c34177d573a6', 'Kabupaten Halmahera Tengah', 'ce193c2c-afff-4c52-8528-aeb024d60ca7');
INSERT INTO `kota` VALUES ('47f3a999-b002-4cd6-aae7-36a9133911fb', 'Kabupaten Halmahera Timur', 'ce193c2c-afff-4c52-8528-aeb024d60ca7');
INSERT INTO `kota` VALUES ('1fd940e7-4f8b-48a6-b237-c943ac5df6a5', 'Kabupaten Halmahera Utara', 'ce193c2c-afff-4c52-8528-aeb024d60ca7');
INSERT INTO `kota` VALUES ('481aa490-d053-4d61-939c-31fa977ddebb', 'Kabupaten Kepulauan Sula', 'ce193c2c-afff-4c52-8528-aeb024d60ca7');
INSERT INTO `kota` VALUES ('c6917cef-c1ae-4422-ac0d-854ee67f802d', 'Kabupaten Pulau Morotai', 'ce193c2c-afff-4c52-8528-aeb024d60ca7');
INSERT INTO `kota` VALUES ('054d1b10-7061-43ea-8945-a30200786fe9', 'Kabupaten Pulau Taliabu', 'ce193c2c-afff-4c52-8528-aeb024d60ca7');
INSERT INTO `kota` VALUES ('7b5dde2c-6d3f-468a-b7ea-78d520a33d21', 'Kota Ternate', 'ce193c2c-afff-4c52-8528-aeb024d60ca7');
INSERT INTO `kota` VALUES ('71d12582-af85-4dda-86a1-0f24cb7235a5', 'Kota Tidore Kepulauan', 'ce193c2c-afff-4c52-8528-aeb024d60ca7');
INSERT INTO `kota` VALUES ('be2bd385-2486-4f57-a94f-5df413968113', 'Kabupaten Aceh Barat', '6ba6a5d8-5d0d-4518-ba10-809e0c1d9c68');
INSERT INTO `kota` VALUES ('175d2a6d-08a7-4923-90b8-46d3fad83a6d', 'Kabupaten Aceh Barat Daya', '6ba6a5d8-5d0d-4518-ba10-809e0c1d9c68');
INSERT INTO `kota` VALUES ('fde7e6fe-bb0c-4084-b07f-bbae15ff5c4a', 'Kabupaten Aceh Besar', '6ba6a5d8-5d0d-4518-ba10-809e0c1d9c68');
INSERT INTO `kota` VALUES ('38a57276-62d4-42ee-aadc-42bb4c0d8a0c', 'Kabupaten Aceh Jaya', '6ba6a5d8-5d0d-4518-ba10-809e0c1d9c68');
INSERT INTO `kota` VALUES ('d863edda-c310-4eeb-8113-3255914e00a4', 'Kabupaten Aceh Selatan', '6ba6a5d8-5d0d-4518-ba10-809e0c1d9c68');
INSERT INTO `kota` VALUES ('7a675674-f0b9-4d2b-8845-3dbf1713464c', 'Kabupaten Aceh Singkil', '6ba6a5d8-5d0d-4518-ba10-809e0c1d9c68');
INSERT INTO `kota` VALUES ('aa3e2ad8-7ebd-4fdb-825e-eb57ada79681', 'Kabupaten Aceh Tamiang', '6ba6a5d8-5d0d-4518-ba10-809e0c1d9c68');
INSERT INTO `kota` VALUES ('5040d27b-e26a-4a87-823d-d21b3d2e8591', 'Kabupaten Aceh Tengah', '6ba6a5d8-5d0d-4518-ba10-809e0c1d9c68');
INSERT INTO `kota` VALUES ('ef896600-63b0-4411-bbff-ba76266291ed', 'Kabupaten Aceh Tenggara', '6ba6a5d8-5d0d-4518-ba10-809e0c1d9c68');
INSERT INTO `kota` VALUES ('7cb6a21d-aae8-4816-90d0-c0063602469c', 'Kabupaten Aceh Timur', '6ba6a5d8-5d0d-4518-ba10-809e0c1d9c68');
INSERT INTO `kota` VALUES ('6237d0fb-c84d-418b-9af2-83507234fc05', 'Kabupaten Aceh Utara', '6ba6a5d8-5d0d-4518-ba10-809e0c1d9c68');
INSERT INTO `kota` VALUES ('203fe142-f7d2-48cb-839d-d639d0bef17d', 'Kabupaten Bener Meriah', '6ba6a5d8-5d0d-4518-ba10-809e0c1d9c68');
INSERT INTO `kota` VALUES ('92b54360-2819-4173-b150-dc8cd18f7671', 'Kabupaten Bireuen', '6ba6a5d8-5d0d-4518-ba10-809e0c1d9c68');
INSERT INTO `kota` VALUES ('b22c8550-b77a-4077-92c7-7cfbe131e4e2', 'Kabupaten Gayo Lues', '6ba6a5d8-5d0d-4518-ba10-809e0c1d9c68');
INSERT INTO `kota` VALUES ('d9d3e5c4-a54b-43eb-8026-b3c8b6054902', 'Kabupaten Nagan Raya', '6ba6a5d8-5d0d-4518-ba10-809e0c1d9c68');
INSERT INTO `kota` VALUES ('2ec6d3b7-0853-46ac-88d0-49120b49d2e1', 'Kabupaten Pidie', '6ba6a5d8-5d0d-4518-ba10-809e0c1d9c68');
INSERT INTO `kota` VALUES ('f4851a98-ee1a-4472-b17f-26ca4e7a5ae4', 'Kabupaten Pidie Jaya', '6ba6a5d8-5d0d-4518-ba10-809e0c1d9c68');
INSERT INTO `kota` VALUES ('7121507d-800a-418e-8189-5f7305235cc2', 'Kabupaten Simeulue', '6ba6a5d8-5d0d-4518-ba10-809e0c1d9c68');
INSERT INTO `kota` VALUES ('fef487a1-0498-4e3e-ad40-e2c0bd4d47d6', 'Kota Banda Aceh', '6ba6a5d8-5d0d-4518-ba10-809e0c1d9c68');
INSERT INTO `kota` VALUES ('62c28559-4597-46cd-83ab-c1ea83ee283f', 'Kota Lhokseumawe', '6ba6a5d8-5d0d-4518-ba10-809e0c1d9c68');
INSERT INTO `kota` VALUES ('cb3f402d-bd0f-4c25-bd11-af6605f75deb', 'Kota Sabang', '6ba6a5d8-5d0d-4518-ba10-809e0c1d9c68');
INSERT INTO `kota` VALUES ('d7672315-b4c1-43cb-9920-25b110557e5e', 'Kota Subulussalam', '6ba6a5d8-5d0d-4518-ba10-809e0c1d9c68');
INSERT INTO `kota` VALUES ('ba01b3b0-d4a3-4be5-a446-9de11a173991', 'Kabupaten Bima', 'ef1f50e3-95aa-4be9-acd1-fcbf627fc2db');
INSERT INTO `kota` VALUES ('aa4998b1-eed3-4aee-91e7-b2ab3c827bc6', 'Kabupaten Dompu', 'ef1f50e3-95aa-4be9-acd1-fcbf627fc2db');
INSERT INTO `kota` VALUES ('2d93f140-95a0-488f-82b7-98e5c763e14c', 'Kabupaten Lombok Barat', 'ef1f50e3-95aa-4be9-acd1-fcbf627fc2db');
INSERT INTO `kota` VALUES ('36e2a2c3-afe2-49c2-9220-c8c43c906a78', 'Kabupaten Lombok Tengah', 'ef1f50e3-95aa-4be9-acd1-fcbf627fc2db');
INSERT INTO `kota` VALUES ('8792d748-3506-4616-a9d8-85727d9254b2', 'Kabupaten Lombok Timur', 'ef1f50e3-95aa-4be9-acd1-fcbf627fc2db');
INSERT INTO `kota` VALUES ('d6c15ded-a718-431e-9d72-6443dbff75b6', 'Kabupaten Lombok Utara', 'ef1f50e3-95aa-4be9-acd1-fcbf627fc2db');
INSERT INTO `kota` VALUES ('04be918e-1d44-4c26-9a7d-e4bfec8f8056', 'Kabupaten Sumbawa', 'ef1f50e3-95aa-4be9-acd1-fcbf627fc2db');
INSERT INTO `kota` VALUES ('b8829723-f2e1-4acd-b28e-8093b5ad1658', 'Kabupaten Sumbawa Barat', 'ef1f50e3-95aa-4be9-acd1-fcbf627fc2db');
INSERT INTO `kota` VALUES ('6475089e-e238-4dfa-9f7c-193169592d9e', 'Kota Bima', 'ef1f50e3-95aa-4be9-acd1-fcbf627fc2db');
INSERT INTO `kota` VALUES ('8944a76f-dc1d-4d16-83f5-b39e91fbb7cb', 'Kota Mataram', 'ef1f50e3-95aa-4be9-acd1-fcbf627fc2db');
INSERT INTO `kota` VALUES ('f5f788bd-56f2-4771-ab7a-f6be4eb3a8ae', 'Kabupaten  Ende', '96690524-d32f-4483-9a40-7547ebf61132');
INSERT INTO `kota` VALUES ('547734c8-0115-46d2-8286-af2e77c43a0b', 'Kabupaten  Flores Timur', '96690524-d32f-4483-9a40-7547ebf61132');
INSERT INTO `kota` VALUES ('8f12de4a-cc0a-4e1e-a25e-322a6fc53ce0', 'Kabupaten Alor', '96690524-d32f-4483-9a40-7547ebf61132');
INSERT INTO `kota` VALUES ('233565f2-ab07-41ce-a1b9-858a734b9c02', 'Kabupaten Belu', '96690524-d32f-4483-9a40-7547ebf61132');
INSERT INTO `kota` VALUES ('23896617-e86b-49b5-ac02-188ee11a70f7', 'Kabupaten Ende', '96690524-d32f-4483-9a40-7547ebf61132');
INSERT INTO `kota` VALUES ('905b2f4e-b50c-4de1-a158-0c037436511d', 'Kabupaten Flores Timur', '96690524-d32f-4483-9a40-7547ebf61132');
INSERT INTO `kota` VALUES ('fa9e27f8-4623-4756-9e8e-3d3cae81a4b7', 'Kabupaten Kupang', '96690524-d32f-4483-9a40-7547ebf61132');
INSERT INTO `kota` VALUES ('9b1b7c7a-3942-4e98-8b12-0ea5f7b261ea', 'Kabupaten Lembata', '96690524-d32f-4483-9a40-7547ebf61132');
INSERT INTO `kota` VALUES ('5cd81287-00bb-4e30-9741-5d4ad18fa587', 'Kabupaten Malaka', '96690524-d32f-4483-9a40-7547ebf61132');
INSERT INTO `kota` VALUES ('94f22429-099f-4b48-a8f3-239d0e9540e4', 'Kabupaten Manggarai', '96690524-d32f-4483-9a40-7547ebf61132');
INSERT INTO `kota` VALUES ('a71d3d6f-b4eb-49b9-ab02-ddd634c69619', 'Kabupaten Manggarai Barat', '96690524-d32f-4483-9a40-7547ebf61132');
INSERT INTO `kota` VALUES ('23aebb65-770f-40f0-8469-4e4980f13a07', 'Kabupaten Manggarai Timur', '96690524-d32f-4483-9a40-7547ebf61132');
INSERT INTO `kota` VALUES ('73fe1e05-0a64-416e-b760-138ca8cc29d5', 'Kabupaten Nagekeo', '96690524-d32f-4483-9a40-7547ebf61132');
INSERT INTO `kota` VALUES ('a4d4f569-f7a9-403e-8427-7af5a02d9782', 'Kabupaten Ngada', '96690524-d32f-4483-9a40-7547ebf61132');
INSERT INTO `kota` VALUES ('40d68a93-42d9-4056-803c-7e3681cd4446', 'Kabupaten Rote Ndao', '96690524-d32f-4483-9a40-7547ebf61132');
INSERT INTO `kota` VALUES ('9fc76f12-c45c-4a2e-a18d-6a2614fa01aa', 'Kabupaten Sabu Raijua', '96690524-d32f-4483-9a40-7547ebf61132');
INSERT INTO `kota` VALUES ('3f73ebbe-2f03-44ad-b168-c8c06a525291', 'Kabupaten Sikka', '96690524-d32f-4483-9a40-7547ebf61132');
INSERT INTO `kota` VALUES ('64887ded-eff3-4f51-b002-4f1ee2279ece', 'Kabupaten Sumba Barat', '96690524-d32f-4483-9a40-7547ebf61132');
INSERT INTO `kota` VALUES ('9fa956b1-f43f-4069-b704-a0bb8f5e5fa5', 'Kabupaten Sumba Barat Daya', '96690524-d32f-4483-9a40-7547ebf61132');
INSERT INTO `kota` VALUES ('31b829d1-c4c6-4aa8-bec3-ed56fdd15119', 'Kabupaten Sumba Tengah', '96690524-d32f-4483-9a40-7547ebf61132');
INSERT INTO `kota` VALUES ('9fb60ed3-146e-4814-8cd7-cc90620f1e8b', 'Kabupaten Sumba Timur', '96690524-d32f-4483-9a40-7547ebf61132');
INSERT INTO `kota` VALUES ('76b0c80a-51cf-47b6-a04a-7ba33e88407f', 'Kabupaten Timor Tengah Selatan', '96690524-d32f-4483-9a40-7547ebf61132');
INSERT INTO `kota` VALUES ('c2201274-5633-445a-9c61-e6de2103abdb', 'Kabupaten Timor Tengah Utara', '96690524-d32f-4483-9a40-7547ebf61132');
INSERT INTO `kota` VALUES ('672f84ba-fdd1-4bd1-ab56-ab950f992ac2', 'Kota Kupang', '96690524-d32f-4483-9a40-7547ebf61132');
INSERT INTO `kota` VALUES ('8053b8e0-5225-4a3a-a135-aa14f6f949b6', 'Kabupaten Asmat', '236821d4-2f85-4bd7-b1a6-cc924148e49b');
INSERT INTO `kota` VALUES ('c552abe2-35ce-44bc-9df7-ecdb0935cabf', 'Kabupaten Biak Numfor', '236821d4-2f85-4bd7-b1a6-cc924148e49b');
INSERT INTO `kota` VALUES ('2135b0d8-3fd5-4e14-aa95-bd806c3f57d8', 'Kabupaten Boven Digoel', '236821d4-2f85-4bd7-b1a6-cc924148e49b');
INSERT INTO `kota` VALUES ('3550914a-f350-4c62-b7bb-bda0153d10ad', 'Kabupaten Deiyai', '236821d4-2f85-4bd7-b1a6-cc924148e49b');
INSERT INTO `kota` VALUES ('04cfc248-6f1a-424b-9e16-ab4c7100faa4', 'Kabupaten Dogiyai', '236821d4-2f85-4bd7-b1a6-cc924148e49b');
INSERT INTO `kota` VALUES ('9f3c618e-1830-4a96-b91a-71c3a8d144fa', 'Kabupaten Intan Jaya', '236821d4-2f85-4bd7-b1a6-cc924148e49b');
INSERT INTO `kota` VALUES ('b68f0a94-7539-4f04-8b1d-89302089731b', 'Kabupaten Jayapura', '236821d4-2f85-4bd7-b1a6-cc924148e49b');
INSERT INTO `kota` VALUES ('49050ec2-c849-4ed6-9472-61897ad20d97', 'Kabupaten Jayawijaya', '236821d4-2f85-4bd7-b1a6-cc924148e49b');
INSERT INTO `kota` VALUES ('cebc0649-e446-48fb-bef0-f7ea25f6ca71', 'Kabupaten Keerom', '236821d4-2f85-4bd7-b1a6-cc924148e49b');
INSERT INTO `kota` VALUES ('d84d1c5b-343d-4181-90e8-5ce65ec2550f', 'Kabupaten Kepulauan Yapen', '236821d4-2f85-4bd7-b1a6-cc924148e49b');
INSERT INTO `kota` VALUES ('37e49988-c7f1-497c-b63b-54b49027c012', 'Kabupaten Lanny Jaya', '236821d4-2f85-4bd7-b1a6-cc924148e49b');
INSERT INTO `kota` VALUES ('fd8c4d50-f71c-4963-bd59-7b0af8ba3daf', 'Kabupaten Mamberamo Raya', '236821d4-2f85-4bd7-b1a6-cc924148e49b');
INSERT INTO `kota` VALUES ('f4831f49-6dc9-4e0d-bb96-df7454975687', 'Kabupaten Mamberamo Tengah', '236821d4-2f85-4bd7-b1a6-cc924148e49b');
INSERT INTO `kota` VALUES ('f506fc5d-cbf7-418d-ad55-9dbd848b7a6f', 'Kabupaten Mappi', '236821d4-2f85-4bd7-b1a6-cc924148e49b');
INSERT INTO `kota` VALUES ('45ae60d5-71eb-4427-9959-c126c0385ed9', 'Kabupaten Merauke', '236821d4-2f85-4bd7-b1a6-cc924148e49b');
INSERT INTO `kota` VALUES ('010dd74f-d05d-4001-9a27-b40f22a956f0', 'Kabupaten Mimika', '236821d4-2f85-4bd7-b1a6-cc924148e49b');
INSERT INTO `kota` VALUES ('99c514da-03fe-402a-a231-a091e1fadb96', 'Kabupaten Nabire', '236821d4-2f85-4bd7-b1a6-cc924148e49b');
INSERT INTO `kota` VALUES ('e30f9ee7-58d1-4185-9826-e76f92f736ec', 'Kabupaten Nduga', '236821d4-2f85-4bd7-b1a6-cc924148e49b');
INSERT INTO `kota` VALUES ('381c9043-10e5-4a1d-9218-730c7c82eb79', 'Kabupaten Paniai', '236821d4-2f85-4bd7-b1a6-cc924148e49b');
INSERT INTO `kota` VALUES ('31e7961c-1346-4f15-803d-7c55bf19a4b4', 'Kabupaten Pegunungan Bintang', '236821d4-2f85-4bd7-b1a6-cc924148e49b');
INSERT INTO `kota` VALUES ('7a947dfc-8480-4639-9cd1-042070736f8a', 'Kabupaten Puncak', '236821d4-2f85-4bd7-b1a6-cc924148e49b');
INSERT INTO `kota` VALUES ('1693c62c-784c-46b1-9947-83ebe8b0fdd4', 'Kabupaten Puncak Jaya', '236821d4-2f85-4bd7-b1a6-cc924148e49b');
INSERT INTO `kota` VALUES ('c40561ec-0630-49e5-98b7-5591fd4b7db8', 'Kabupaten Sarmi', '236821d4-2f85-4bd7-b1a6-cc924148e49b');
INSERT INTO `kota` VALUES ('fe501580-5fbd-4b0d-9570-cb0e44a6c91e', 'Kabupaten Supiori', '236821d4-2f85-4bd7-b1a6-cc924148e49b');
INSERT INTO `kota` VALUES ('9855ca9d-5a83-4232-8813-380c3927f727', 'Kabupaten Tolikara', '236821d4-2f85-4bd7-b1a6-cc924148e49b');
INSERT INTO `kota` VALUES ('0c9b0cb1-c9ad-4643-a7ac-6acca0601b7d', 'Kabupaten Waropen', '236821d4-2f85-4bd7-b1a6-cc924148e49b');
INSERT INTO `kota` VALUES ('3cff23ca-d60c-43f7-a699-240b8cb6dd0c', 'Kabupaten Yahukimo', '236821d4-2f85-4bd7-b1a6-cc924148e49b');
INSERT INTO `kota` VALUES ('4348899f-db26-47c2-a117-966c3d227bad', 'Kabupaten Yalimo', '236821d4-2f85-4bd7-b1a6-cc924148e49b');
INSERT INTO `kota` VALUES ('b9738f91-29ec-4e4e-ae49-5f8f6d0bef26', 'Kota Jayapura', '236821d4-2f85-4bd7-b1a6-cc924148e49b');
INSERT INTO `kota` VALUES ('a00f78c2-5003-4057-b256-36f8d367d8d3', 'Kabupaten Fakfak', '6843edbf-c175-4f71-b80d-3f61c23abcca');
INSERT INTO `kota` VALUES ('215506f1-6b90-4090-b442-1d27a13d17d9', 'Kabupaten Kaimana', '6843edbf-c175-4f71-b80d-3f61c23abcca');
INSERT INTO `kota` VALUES ('d748f553-563f-40ba-95d2-a82eb2c07e50', 'Kabupaten Manokwari', '6843edbf-c175-4f71-b80d-3f61c23abcca');
INSERT INTO `kota` VALUES ('829eb861-8a87-401c-b349-9096920c74f4', 'Kabupaten Manokwari Selatan', '6843edbf-c175-4f71-b80d-3f61c23abcca');
INSERT INTO `kota` VALUES ('cd3ec942-0298-4b89-ac0b-0c158caeb446', 'Kabupaten Maybrat', '6843edbf-c175-4f71-b80d-3f61c23abcca');
INSERT INTO `kota` VALUES ('7b750565-2ce7-4088-b418-c93e81952ac1', 'Kabupaten Pegunungan Arfak', '6843edbf-c175-4f71-b80d-3f61c23abcca');
INSERT INTO `kota` VALUES ('7307a51c-4013-4a82-9bf6-78552792d9f0', 'Kabupaten Raja Ampat', '6843edbf-c175-4f71-b80d-3f61c23abcca');
INSERT INTO `kota` VALUES ('906f2052-f3ae-4947-8f0b-bfb4f6951cf4', 'Kabupaten Sorong', '6843edbf-c175-4f71-b80d-3f61c23abcca');
INSERT INTO `kota` VALUES ('88cdc053-8541-4729-a9ad-be3cc752d003', 'Kabupaten Sorong Selatan', '6843edbf-c175-4f71-b80d-3f61c23abcca');
INSERT INTO `kota` VALUES ('0f91926e-2b41-46f4-808f-b75059132b9d', 'Kabupaten Tambrauw', '6843edbf-c175-4f71-b80d-3f61c23abcca');
INSERT INTO `kota` VALUES ('bfbc636f-260b-4be7-9b1d-ec898d7ff9fb', 'Kabupaten Teluk Bintuni', '6843edbf-c175-4f71-b80d-3f61c23abcca');
INSERT INTO `kota` VALUES ('a986947d-fbe3-4d80-859a-93cbd1c274c9', 'Kabupaten Teluk Wondama', '6843edbf-c175-4f71-b80d-3f61c23abcca');
INSERT INTO `kota` VALUES ('f56f5db7-73bd-4644-9b7e-0f87e699e71c', 'Kota Sorong', '6843edbf-c175-4f71-b80d-3f61c23abcca');
INSERT INTO `kota` VALUES ('0c218512-2b81-4f6c-b7e0-a328a931eb72', 'Kabupaten Bengkalis', '831f2974-255f-4644-aa20-ffa6d449b9ce');
INSERT INTO `kota` VALUES ('56a6d96e-22cf-4afa-b702-50d4deeafac2', 'Kabupaten Indragiri Hilir', '831f2974-255f-4644-aa20-ffa6d449b9ce');
INSERT INTO `kota` VALUES ('21076e6b-fde6-4f6d-b90b-c80927d1d00c', 'Kabupaten Indragiri Hulu', '831f2974-255f-4644-aa20-ffa6d449b9ce');
INSERT INTO `kota` VALUES ('c4e63f5b-21fb-4a54-93d3-25c780c1699e', 'Kabupaten Kampar', '831f2974-255f-4644-aa20-ffa6d449b9ce');
INSERT INTO `kota` VALUES ('b2cac8df-ef58-4974-8c2a-a404e7466b6b', 'Kabupaten Kepulauan Meranti', '831f2974-255f-4644-aa20-ffa6d449b9ce');
INSERT INTO `kota` VALUES ('d97390d6-0b44-4052-be79-a9413da680e3', 'Kabupaten Kuantan Singingi', '831f2974-255f-4644-aa20-ffa6d449b9ce');
INSERT INTO `kota` VALUES ('71dc2666-aa2e-47b3-8e79-26f2d3b36814', 'Kabupaten Pelalawan', '831f2974-255f-4644-aa20-ffa6d449b9ce');
INSERT INTO `kota` VALUES ('607cb7e0-8483-4039-b20c-85c65c632bd0', 'Kabupaten Rokan Hilir', '831f2974-255f-4644-aa20-ffa6d449b9ce');
INSERT INTO `kota` VALUES ('caad7f9a-7da6-4536-8f5c-8a90d04f5983', 'Kabupaten Rokan Hulu', '831f2974-255f-4644-aa20-ffa6d449b9ce');
INSERT INTO `kota` VALUES ('2b61aabd-a749-4443-a2e8-432e04ee3fa3', 'Kabupaten Siak', '831f2974-255f-4644-aa20-ffa6d449b9ce');
INSERT INTO `kota` VALUES ('a2bbe008-c041-4523-943e-ff4232ba6e4c', 'Kota Dumai', '831f2974-255f-4644-aa20-ffa6d449b9ce');
INSERT INTO `kota` VALUES ('d534a8f5-69d5-4d80-b642-85351d629a7e', 'Kota Pekanbaru', '831f2974-255f-4644-aa20-ffa6d449b9ce');
INSERT INTO `kota` VALUES ('311bf488-4b0f-4951-b571-847ecb9793bc', 'Kabupaten Majene', '83acc126-0068-4644-8bbc-27aa81778e37');
INSERT INTO `kota` VALUES ('e18ccbd6-1e69-40e0-a51d-0f9e908e1e83', 'Kabupaten Mamasa', '83acc126-0068-4644-8bbc-27aa81778e37');
INSERT INTO `kota` VALUES ('481cf9ac-c6c8-4fa1-9427-9593708dada8', 'Kabupaten Mamuju', '83acc126-0068-4644-8bbc-27aa81778e37');
INSERT INTO `kota` VALUES ('3cb6b7fb-448c-4661-8185-86252bdbc924', 'Kabupaten Mamuju Tengah', '83acc126-0068-4644-8bbc-27aa81778e37');
INSERT INTO `kota` VALUES ('83ca76f0-56a2-4f6a-bbec-538492083e31', 'Kabupaten Mamuju Utara', '83acc126-0068-4644-8bbc-27aa81778e37');
INSERT INTO `kota` VALUES ('cde8a371-594f-42e9-82de-bc2417fba3bc', 'Kabupaten Polewali Mandar', '83acc126-0068-4644-8bbc-27aa81778e37');
INSERT INTO `kota` VALUES ('c1192169-a432-44ee-90f7-2f372b32be4f', 'Kabupaten Bantaeng', '568bd7cb-9177-44b3-bf5e-8b2a62414409');
INSERT INTO `kota` VALUES ('40b37d76-a21c-4a32-ad22-f85bf62e5493', 'Kabupaten Barru', '568bd7cb-9177-44b3-bf5e-8b2a62414409');
INSERT INTO `kota` VALUES ('8ce68e51-1da7-4643-92e4-c853a9102dff', 'Kabupaten Bone', '568bd7cb-9177-44b3-bf5e-8b2a62414409');
INSERT INTO `kota` VALUES ('4c6d256f-16fb-4d9d-b336-57dc7ac61c2d', 'Kabupaten Bulukumba', '568bd7cb-9177-44b3-bf5e-8b2a62414409');
INSERT INTO `kota` VALUES ('aee4f762-9495-486c-ae74-2463ec3b5e04', 'Kabupaten Enrekang', '568bd7cb-9177-44b3-bf5e-8b2a62414409');
INSERT INTO `kota` VALUES ('edbe9d14-d434-42fa-8c86-c28a77076a59', 'Kabupaten Gowa', '568bd7cb-9177-44b3-bf5e-8b2a62414409');
INSERT INTO `kota` VALUES ('9ae8c62a-b0c2-43aa-81d7-ea174ec5c989', 'Kabupaten Jeneponto', '568bd7cb-9177-44b3-bf5e-8b2a62414409');
INSERT INTO `kota` VALUES ('57b10f84-6929-46ed-acbb-f082b37abd21', 'Kabupaten Kepulauan Selayar', '568bd7cb-9177-44b3-bf5e-8b2a62414409');
INSERT INTO `kota` VALUES ('122e9928-f724-48d0-9c54-5d3a6d81928c', 'Kabupaten Luwu', '568bd7cb-9177-44b3-bf5e-8b2a62414409');
INSERT INTO `kota` VALUES ('f4a608de-b588-4ccd-8136-2dbf3db2a1c1', 'Kabupaten Luwu Timur', '568bd7cb-9177-44b3-bf5e-8b2a62414409');
INSERT INTO `kota` VALUES ('e82b60a9-ac7b-4ee5-b53b-48bbd573ea6b', 'Kabupaten Luwu Utara', '568bd7cb-9177-44b3-bf5e-8b2a62414409');
INSERT INTO `kota` VALUES ('24287e29-5ac1-4903-860f-965d1f4c7915', 'Kabupaten Maros', '568bd7cb-9177-44b3-bf5e-8b2a62414409');
INSERT INTO `kota` VALUES ('b8de321e-4ea4-40b9-9ca9-81f59325171e', 'Kabupaten Pangkajene Kepulauan', '568bd7cb-9177-44b3-bf5e-8b2a62414409');
INSERT INTO `kota` VALUES ('b566dbb6-3653-447f-92d0-b22f68f0acf4', 'Kabupaten Pinrang', '568bd7cb-9177-44b3-bf5e-8b2a62414409');
INSERT INTO `kota` VALUES ('cf22c3f4-65fc-46e4-b155-7f0bbf8756c3', 'Kabupaten Sidenreng Rappang', '568bd7cb-9177-44b3-bf5e-8b2a62414409');
INSERT INTO `kota` VALUES ('2de14136-7174-4837-8568-e0da09791554', 'Kabupaten Sinjai', '568bd7cb-9177-44b3-bf5e-8b2a62414409');
INSERT INTO `kota` VALUES ('feaf051f-dd5d-420a-a7c8-9dd58c2d1724', 'Kabupaten Soppeng', '568bd7cb-9177-44b3-bf5e-8b2a62414409');
INSERT INTO `kota` VALUES ('e7947c16-f98d-48d9-aaa6-7ce7891ef708', 'Kabupaten Takalar', '568bd7cb-9177-44b3-bf5e-8b2a62414409');
INSERT INTO `kota` VALUES ('90220f3a-9ef1-4195-8f39-0e7425054e13', 'Kabupaten Tana Toraja', '568bd7cb-9177-44b3-bf5e-8b2a62414409');
INSERT INTO `kota` VALUES ('57eaa780-c321-4688-a102-15f8fa3c0b7e', 'Kabupaten Toraja Utara', '568bd7cb-9177-44b3-bf5e-8b2a62414409');
INSERT INTO `kota` VALUES ('8908f378-7119-4405-b183-3dafe9236f91', 'Kabupaten Wajo', '568bd7cb-9177-44b3-bf5e-8b2a62414409');
INSERT INTO `kota` VALUES ('09c305dc-c6ae-442f-a1a3-d11677c20c6d', 'Kota Makassar', '568bd7cb-9177-44b3-bf5e-8b2a62414409');
INSERT INTO `kota` VALUES ('356cc134-7153-4231-b214-be1722a9597a', 'Kota Palopo', '568bd7cb-9177-44b3-bf5e-8b2a62414409');
INSERT INTO `kota` VALUES ('8a09fa06-5837-4d55-ad9a-def2c8a884d3', 'Kota Parepare', '568bd7cb-9177-44b3-bf5e-8b2a62414409');
INSERT INTO `kota` VALUES ('a59d4294-9f20-4a15-b827-b2aa2aaf5b84', 'Kabupaten Banggai', '6edb509a-a17e-44c3-bb9c-c6a9f1d6f361');
INSERT INTO `kota` VALUES ('5db0844b-0b63-498c-9848-63b6bfcec27c', 'Kabupaten Banggai Kepulauan', '6edb509a-a17e-44c3-bb9c-c6a9f1d6f361');
INSERT INTO `kota` VALUES ('51596a0a-091c-4443-ba91-6d3bac234f3c', 'Kabupaten Banggai Laut', '6edb509a-a17e-44c3-bb9c-c6a9f1d6f361');
INSERT INTO `kota` VALUES ('8ba6fc32-6143-468a-aeb2-ef823be59503', 'Kabupaten Buol', '6edb509a-a17e-44c3-bb9c-c6a9f1d6f361');
INSERT INTO `kota` VALUES ('bc4589e9-9d03-46d3-8918-d6da2ccd665f', 'Kabupaten Donggala', '6edb509a-a17e-44c3-bb9c-c6a9f1d6f361');
INSERT INTO `kota` VALUES ('9eceb577-20d1-4640-a123-5c604ea54f87', 'Kabupaten Morowali', '6edb509a-a17e-44c3-bb9c-c6a9f1d6f361');
INSERT INTO `kota` VALUES ('f1387875-6951-4ae3-85a2-c762c9ca323d', 'Kabupaten Morowali Utara', '6edb509a-a17e-44c3-bb9c-c6a9f1d6f361');
INSERT INTO `kota` VALUES ('86a044e0-0f75-4ae1-839f-f3b9a56de5e6', 'Kabupaten Parigi Moutong', '6edb509a-a17e-44c3-bb9c-c6a9f1d6f361');
INSERT INTO `kota` VALUES ('bbf1566e-9f3e-4954-aad8-a41a015d2806', 'Kabupaten Poso', '6edb509a-a17e-44c3-bb9c-c6a9f1d6f361');
INSERT INTO `kota` VALUES ('1d4b7e4e-b376-49d0-aaef-15df82857b16', 'Kabupaten Sigi', '6edb509a-a17e-44c3-bb9c-c6a9f1d6f361');
INSERT INTO `kota` VALUES ('cc0cc0f0-3e2b-4c75-8f84-d073956aeaf5', 'Kabupaten Tojo Una-Una', '6edb509a-a17e-44c3-bb9c-c6a9f1d6f361');
INSERT INTO `kota` VALUES ('267ac5c4-09e4-458c-9fdc-a3f0e580a3e3', 'Kabupaten Toli-Toli', '6edb509a-a17e-44c3-bb9c-c6a9f1d6f361');
INSERT INTO `kota` VALUES ('12a39801-6a79-4441-8cb4-ad219fc0daf4', 'Kota Palu', '6edb509a-a17e-44c3-bb9c-c6a9f1d6f361');
INSERT INTO `kota` VALUES ('7f8a9ef6-2d2c-4f2a-a5c3-fe694dcb8028', 'Kabupaten Bombana', 'bb86d61a-b563-4b5c-9e16-f59f7ae231df');
INSERT INTO `kota` VALUES ('703cafe6-5c71-4658-a631-7c3cf8ea3637', 'Kabupaten Buton', 'bb86d61a-b563-4b5c-9e16-f59f7ae231df');
INSERT INTO `kota` VALUES ('bbaeecfe-a9e7-4012-8232-401d9c26ccc4', 'Kabupaten Buton Selatan', 'bb86d61a-b563-4b5c-9e16-f59f7ae231df');
INSERT INTO `kota` VALUES ('5f944059-224d-4f25-b8cc-79f4eb684b96', 'Kabupaten Buton Tengah', 'bb86d61a-b563-4b5c-9e16-f59f7ae231df');
INSERT INTO `kota` VALUES ('4eccfee8-f36f-475f-8942-16d4bb14b0de', 'Kabupaten Buton Utara', 'bb86d61a-b563-4b5c-9e16-f59f7ae231df');
INSERT INTO `kota` VALUES ('cf033fe5-d99f-4143-bc40-a862468fe760', 'Kabupaten Kolaka', 'bb86d61a-b563-4b5c-9e16-f59f7ae231df');
INSERT INTO `kota` VALUES ('5c5db1a5-02db-4c4d-b084-d0290321f992', 'Kabupaten Kolaka Timur', 'bb86d61a-b563-4b5c-9e16-f59f7ae231df');
INSERT INTO `kota` VALUES ('665f4d47-e7ca-496a-8a69-74ababaf7088', 'Kabupaten Kolaka Utara', 'bb86d61a-b563-4b5c-9e16-f59f7ae231df');
INSERT INTO `kota` VALUES ('0041676f-a872-45fa-aa28-3a317f764969', 'Kabupaten Konawe', 'bb86d61a-b563-4b5c-9e16-f59f7ae231df');
INSERT INTO `kota` VALUES ('b52e4f59-88e9-4f1e-981c-ee58df55dcec', 'Kabupaten Konawe Kepulauan', 'bb86d61a-b563-4b5c-9e16-f59f7ae231df');
INSERT INTO `kota` VALUES ('92d32297-a86b-416f-8acd-f2ed1d50b2cc', 'Kabupaten Konawe Selatan', 'bb86d61a-b563-4b5c-9e16-f59f7ae231df');
INSERT INTO `kota` VALUES ('4c4e9b06-ddf8-4231-8937-8574cb54589b', 'Kabupaten Konawe Utara', 'bb86d61a-b563-4b5c-9e16-f59f7ae231df');
INSERT INTO `kota` VALUES ('fb53b669-2164-43a8-a07e-42c5bcecafdb', 'Kabupaten Muna', 'bb86d61a-b563-4b5c-9e16-f59f7ae231df');
INSERT INTO `kota` VALUES ('c483dd91-9972-456d-8ae5-b96d097315f9', 'Kabupaten Muna Barat', 'bb86d61a-b563-4b5c-9e16-f59f7ae231df');
INSERT INTO `kota` VALUES ('8ad52bf3-b409-4c4e-9ef7-39a001bc5448', 'Kabupaten Wakatobi', 'bb86d61a-b563-4b5c-9e16-f59f7ae231df');
INSERT INTO `kota` VALUES ('e22c3120-b097-48bf-b59e-9c35e2d2fd64', 'Kota Bau-Bau', 'bb86d61a-b563-4b5c-9e16-f59f7ae231df');
INSERT INTO `kota` VALUES ('afc89d74-9054-4c15-9e32-912ad49218b6', 'Kota Kendari', 'bb86d61a-b563-4b5c-9e16-f59f7ae231df');
INSERT INTO `kota` VALUES ('739307a9-eaba-49d8-af38-751ba7e7c67b', 'Kabupaten Bolaang Mongondow', '8f08882e-09c7-4d36-bd67-fbb75ebe6d7b');
INSERT INTO `kota` VALUES ('9d014855-d185-4ca5-8129-8a229d2a3400', 'Kabupaten Bolaang Mongondow Selatan', '8f08882e-09c7-4d36-bd67-fbb75ebe6d7b');
INSERT INTO `kota` VALUES ('a4620d26-4c4b-4034-a168-098cc8fa1376', 'Kabupaten Bolaang Mongondow Timur', '8f08882e-09c7-4d36-bd67-fbb75ebe6d7b');
INSERT INTO `kota` VALUES ('e8785f08-6c5c-4136-b127-160a19863c96', 'Kabupaten Bolaang Mongondow Utara', '8f08882e-09c7-4d36-bd67-fbb75ebe6d7b');
INSERT INTO `kota` VALUES ('bbff591b-287d-42be-b249-a4019f50f6c8', 'Kabupaten Kepulauan Sangihe', '8f08882e-09c7-4d36-bd67-fbb75ebe6d7b');
INSERT INTO `kota` VALUES ('0772e27a-0b8f-4561-ba24-3848f1c37be9', 'Kabupaten Kepulauan Siau Tagulandang Biaro (Sitaro', '8f08882e-09c7-4d36-bd67-fbb75ebe6d7b');
INSERT INTO `kota` VALUES ('04b9aefe-25e5-4298-b5e0-08629a37a9dc', 'Kabupaten Kepulauan Talaud', '8f08882e-09c7-4d36-bd67-fbb75ebe6d7b');
INSERT INTO `kota` VALUES ('d3837124-54fc-45b3-bb7c-ea899387f308', 'Kabupaten Minahasa', '8f08882e-09c7-4d36-bd67-fbb75ebe6d7b');
INSERT INTO `kota` VALUES ('1e430199-3a9a-485a-bd2d-477f83ed8b4c', 'Kabupaten Minahasa Selatan', '8f08882e-09c7-4d36-bd67-fbb75ebe6d7b');
INSERT INTO `kota` VALUES ('8b210830-28b4-4706-8b41-2b8995f08fd5', 'Kabupaten Minahasa Tenggara', '8f08882e-09c7-4d36-bd67-fbb75ebe6d7b');
INSERT INTO `kota` VALUES ('ff0f46ea-dbe4-4c97-bc2f-65a8529782c5', 'Kabupaten Minahasa Utara', '8f08882e-09c7-4d36-bd67-fbb75ebe6d7b');
INSERT INTO `kota` VALUES ('aeb96466-5134-4a1b-96d2-af083ac3da09', 'Kota Bitung', '8f08882e-09c7-4d36-bd67-fbb75ebe6d7b');
INSERT INTO `kota` VALUES ('56fd419e-03c6-4273-bdd4-f0504b4c1fa1', 'Kota Kotamobagu', '8f08882e-09c7-4d36-bd67-fbb75ebe6d7b');
INSERT INTO `kota` VALUES ('7a641206-bac9-4072-a434-9e48da45f0b6', 'Kota Manado', '8f08882e-09c7-4d36-bd67-fbb75ebe6d7b');
INSERT INTO `kota` VALUES ('d57b4278-b497-4402-afb8-31ed4c82076e', 'Kota Tomohon', '8f08882e-09c7-4d36-bd67-fbb75ebe6d7b');
INSERT INTO `kota` VALUES ('60b0c630-ff7c-42ca-a481-8580bbc1ab6a', 'Kabupaten Agam', 'ad80f715-e6af-45c5-ab1c-ecdf213fe012');
INSERT INTO `kota` VALUES ('0427ba8c-2033-434a-afe2-b479da47fa4f', 'Kabupaten Dharmasraya', 'ad80f715-e6af-45c5-ab1c-ecdf213fe012');
INSERT INTO `kota` VALUES ('34f11447-db4b-428b-97b7-d25b37573dfa', 'Kabupaten Kepulauan Mentawai', 'ad80f715-e6af-45c5-ab1c-ecdf213fe012');
INSERT INTO `kota` VALUES ('00547358-39f7-40c1-8565-92d7538ee1d4', 'Kabupaten Lima Puluh Kota', 'ad80f715-e6af-45c5-ab1c-ecdf213fe012');
INSERT INTO `kota` VALUES ('092eeee8-80c5-44eb-888f-cad100574e96', 'Kabupaten Padang Pariaman', 'ad80f715-e6af-45c5-ab1c-ecdf213fe012');
INSERT INTO `kota` VALUES ('63ded95d-7b85-4d16-9402-6441aeff0233', 'Kabupaten Pasaman', 'ad80f715-e6af-45c5-ab1c-ecdf213fe012');
INSERT INTO `kota` VALUES ('ff7c141e-e3a8-4093-8594-70d2a84fe435', 'Kabupaten Pasaman Barat', 'ad80f715-e6af-45c5-ab1c-ecdf213fe012');
INSERT INTO `kota` VALUES ('79534f2d-5164-4f12-9adc-4e77147a0940', 'Kabupaten Pesisir Selatan', 'ad80f715-e6af-45c5-ab1c-ecdf213fe012');
INSERT INTO `kota` VALUES ('14f3c570-ec7b-4a7e-a28d-2546bb31c4fd', 'Kabupaten Sijunjung', 'ad80f715-e6af-45c5-ab1c-ecdf213fe012');
INSERT INTO `kota` VALUES ('293abf13-c4dc-4e7d-8d11-b3cad0f21ebc', 'Kabupaten Solok', 'ad80f715-e6af-45c5-ab1c-ecdf213fe012');
INSERT INTO `kota` VALUES ('c323b0b1-37ca-4096-9f80-202840fa721c', 'Kabupaten Solok Selatan', 'ad80f715-e6af-45c5-ab1c-ecdf213fe012');
INSERT INTO `kota` VALUES ('4b304e17-f093-4af6-99c1-bd597ccdc9b1', 'Kabupaten Tanah Datar', 'ad80f715-e6af-45c5-ab1c-ecdf213fe012');
INSERT INTO `kota` VALUES ('2b15d9cd-9de3-4213-9cae-81faf7d5a0cf', 'Kota Bukittinggi', 'ad80f715-e6af-45c5-ab1c-ecdf213fe012');
INSERT INTO `kota` VALUES ('7d9c2469-42ba-40cd-a7a6-e1aa49e01f24', 'Kota Padang', 'ad80f715-e6af-45c5-ab1c-ecdf213fe012');
INSERT INTO `kota` VALUES ('11dd6469-c14e-449e-aa9c-24a7f968f54d', 'Kota Padang Panjang', 'ad80f715-e6af-45c5-ab1c-ecdf213fe012');
INSERT INTO `kota` VALUES ('cfb31d2c-16c8-49a4-bd84-2cd693dba3fc', 'Kota Pariaman', 'ad80f715-e6af-45c5-ab1c-ecdf213fe012');
INSERT INTO `kota` VALUES ('9205768b-927f-4a0f-b3d9-1e9cd8b36041', 'Kota Payakumbuh', 'ad80f715-e6af-45c5-ab1c-ecdf213fe012');
INSERT INTO `kota` VALUES ('48a09680-df96-406e-bd40-7234d92f89aa', 'Kota Sawah Lunto', 'ad80f715-e6af-45c5-ab1c-ecdf213fe012');
INSERT INTO `kota` VALUES ('1e9e8e26-dcf8-4859-96ee-4ab53ee4a106', 'Kota Solok', 'ad80f715-e6af-45c5-ab1c-ecdf213fe012');
INSERT INTO `kota` VALUES ('acefe642-eb35-4724-9889-5399688ee75b', 'Kabupaten Banyuasin', '3096b847-c11a-435f-97df-44c95b5b2289');
INSERT INTO `kota` VALUES ('6268faa6-46ab-4e5b-bc77-91621c473dc0', 'Kabupaten Empat Lawang', '3096b847-c11a-435f-97df-44c95b5b2289');
INSERT INTO `kota` VALUES ('83e48b7c-d7b7-42a0-8c35-610d918f11d7', 'Kabupaten Lahat', '3096b847-c11a-435f-97df-44c95b5b2289');
INSERT INTO `kota` VALUES ('caf1fcc9-69d5-4564-8ed8-672d7d4086fe', 'Kabupaten Muara Enim', '3096b847-c11a-435f-97df-44c95b5b2289');
INSERT INTO `kota` VALUES ('0608d8d0-f80c-40f0-9a5f-017ad0566cbf', 'Kabupaten Musi Banyuasin', '3096b847-c11a-435f-97df-44c95b5b2289');
INSERT INTO `kota` VALUES ('e92ceb14-64f4-4095-bb66-30f39dafa8e1', 'Kabupaten Musi Rawas', '3096b847-c11a-435f-97df-44c95b5b2289');
INSERT INTO `kota` VALUES ('d5ccf6a0-60b4-4f22-8ebc-8ce77b59a3d5', 'Kabupaten Musi Rawas Utara', '3096b847-c11a-435f-97df-44c95b5b2289');
INSERT INTO `kota` VALUES ('073ae570-39f3-4314-b9ee-fee97dc83bae', 'Kabupaten Ogan Ilir', '3096b847-c11a-435f-97df-44c95b5b2289');
INSERT INTO `kota` VALUES ('254dc83c-3c2e-45d9-84f4-5861fc29d427', 'Kabupaten Ogan Komering Ilir', '3096b847-c11a-435f-97df-44c95b5b2289');
INSERT INTO `kota` VALUES ('d882d09a-fab5-43cd-b32c-50bf36266a93', 'Kabupaten Ogan Komering Ulu', '3096b847-c11a-435f-97df-44c95b5b2289');
INSERT INTO `kota` VALUES ('390c1fa3-80ae-4eba-83c9-97f19cb6d088', 'Kabupaten Ogan Komering Ulu Selatan', '3096b847-c11a-435f-97df-44c95b5b2289');
INSERT INTO `kota` VALUES ('7906ba78-e3e5-45bc-84c0-1e7b741702b0', 'Kabupaten Ogan Komering Ulu Timur', '3096b847-c11a-435f-97df-44c95b5b2289');
INSERT INTO `kota` VALUES ('31f23fe0-747b-4484-b57d-9e31697c7025', 'Kabupaten Penukal Abab Lematang Ilir', '3096b847-c11a-435f-97df-44c95b5b2289');
INSERT INTO `kota` VALUES ('a777fcb5-b645-40e1-b04c-410995bbff43', 'Kota Lubuk Linggau', '3096b847-c11a-435f-97df-44c95b5b2289');
INSERT INTO `kota` VALUES ('05d34b92-8a06-4c28-b0ba-bc88d5f1361e', 'Kota Pagar Alam', '3096b847-c11a-435f-97df-44c95b5b2289');
INSERT INTO `kota` VALUES ('2eb8a8ae-f105-41a4-be11-29389b64c2cc', 'Kota Palembang', '3096b847-c11a-435f-97df-44c95b5b2289');
INSERT INTO `kota` VALUES ('3c93a605-2c7e-4be6-b287-a2ca4a0d4310', 'Kota Prabumulih', '3096b847-c11a-435f-97df-44c95b5b2289');
INSERT INTO `kota` VALUES ('24101e90-3106-4999-a0a7-c4d9570aa0bb', 'Kabupaten Asahan', '54987b31-dba7-430e-9087-4294f0753877');
INSERT INTO `kota` VALUES ('22913121-1742-4c52-b417-bc7fa6682beb', 'Kabupaten Batu Bara', '54987b31-dba7-430e-9087-4294f0753877');
INSERT INTO `kota` VALUES ('fc83e81b-bc1e-4ab7-aa8b-89fc37b4b204', 'Kabupaten Dairi', '54987b31-dba7-430e-9087-4294f0753877');
INSERT INTO `kota` VALUES ('6005a71c-58e6-4241-abeb-3d9362ff2a89', 'Kabupaten Deli Serdang', '54987b31-dba7-430e-9087-4294f0753877');
INSERT INTO `kota` VALUES ('15128c3c-9538-4a1d-a40f-168f8837c454', 'Kabupaten Humbang Hasundutan', '54987b31-dba7-430e-9087-4294f0753877');
INSERT INTO `kota` VALUES ('b4bcb14f-1a96-4d91-bab4-cff6340d5218', 'Kabupaten Karo', '54987b31-dba7-430e-9087-4294f0753877');
INSERT INTO `kota` VALUES ('6f82bd59-dead-4755-9e7f-d2f9be81080c', 'Kabupaten Labuhanbatu', '54987b31-dba7-430e-9087-4294f0753877');
INSERT INTO `kota` VALUES ('52b03d34-faf4-4210-8f54-7b51dfcd794a', 'Kabupaten Labuhanbatu Selatan', '54987b31-dba7-430e-9087-4294f0753877');
INSERT INTO `kota` VALUES ('08efa14c-a7a1-46ea-a714-5ad458ccff53', 'Kabupaten Labuhanbatu Utara', '54987b31-dba7-430e-9087-4294f0753877');
INSERT INTO `kota` VALUES ('7857f87b-cd07-42bb-bd61-bc58e2cfe28f', 'Kabupaten Langkat', '54987b31-dba7-430e-9087-4294f0753877');
INSERT INTO `kota` VALUES ('889e7906-40c6-49e4-b4ba-b2b0b9196c72', 'Kabupaten Mandailing Natal', '54987b31-dba7-430e-9087-4294f0753877');
INSERT INTO `kota` VALUES ('4020eaf5-2c3d-4f67-b31e-8b9d8b64742a', 'Kabupaten Nias', '54987b31-dba7-430e-9087-4294f0753877');
INSERT INTO `kota` VALUES ('1667f51e-9094-425c-8769-76a59fca7218', 'Kabupaten Nias Barat', '54987b31-dba7-430e-9087-4294f0753877');
INSERT INTO `kota` VALUES ('f824f629-2f58-4af1-8567-18925c136562', 'Kabupaten Nias Selatan', '54987b31-dba7-430e-9087-4294f0753877');
INSERT INTO `kota` VALUES ('50e14c2c-e3a3-46e0-88b2-d4841822c6a9', 'Kabupaten Nias Utara', '54987b31-dba7-430e-9087-4294f0753877');
INSERT INTO `kota` VALUES ('8f267e45-2da3-4d18-a1f4-2b271536154b', 'Kabupaten Padang Lawas', '54987b31-dba7-430e-9087-4294f0753877');
INSERT INTO `kota` VALUES ('ffa1b856-6c84-46b8-ba4e-ceeb2021b806', 'Kabupaten Padang Lawas Utara', '54987b31-dba7-430e-9087-4294f0753877');
INSERT INTO `kota` VALUES ('84249b1b-d8e4-44a5-8540-4f3e44f12fec', 'Kabupaten Pakpak Bharat', '54987b31-dba7-430e-9087-4294f0753877');
INSERT INTO `kota` VALUES ('52495b51-ada6-4f96-ae52-220e37612e79', 'Kabupaten Samosir', '54987b31-dba7-430e-9087-4294f0753877');
INSERT INTO `kota` VALUES ('7d418ae0-31c8-4285-bfb0-5f7cc77c6bb7', 'Kabupaten Serdang Bedagai', '54987b31-dba7-430e-9087-4294f0753877');
INSERT INTO `kota` VALUES ('8ea93dab-db78-48ef-b90a-4d95b581156f', 'Kabupaten Simalungun', '54987b31-dba7-430e-9087-4294f0753877');
INSERT INTO `kota` VALUES ('c1c406f0-f593-4565-a4a7-e2fb6ba36e27', 'Kabupaten Tapanuli Selatan', '54987b31-dba7-430e-9087-4294f0753877');
INSERT INTO `kota` VALUES ('14a1ce2a-19bf-480e-b1d0-45853ae72a65', 'Kabupaten Tapanuli Tengah', '54987b31-dba7-430e-9087-4294f0753877');
INSERT INTO `kota` VALUES ('f910692d-f5da-4c7f-8432-92868e04cf76', 'Kabupaten Tapanuli Utara', '54987b31-dba7-430e-9087-4294f0753877');
INSERT INTO `kota` VALUES ('8035ead9-2de8-4251-a15d-562988185504', 'Kabupaten Toba Samosir', '54987b31-dba7-430e-9087-4294f0753877');
INSERT INTO `kota` VALUES ('e9b9ea74-3b40-4cd1-bbc0-654c50e14282', 'Kota Binjai', '54987b31-dba7-430e-9087-4294f0753877');
INSERT INTO `kota` VALUES ('34005838-12ca-46d0-8c98-9aa50d696f72', 'Kota Gunungsitoli', '54987b31-dba7-430e-9087-4294f0753877');
INSERT INTO `kota` VALUES ('64f666a2-1a76-4407-8710-b47a935a07dc', 'Kota Medan', '54987b31-dba7-430e-9087-4294f0753877');
INSERT INTO `kota` VALUES ('4f1b1d5d-9c34-498f-94db-41d0c5df7634', 'Kota Padang Sidempuan', '54987b31-dba7-430e-9087-4294f0753877');
INSERT INTO `kota` VALUES ('cc34729e-0a4f-4b6b-a3ef-6c6bb2ebcd77', 'Kota Pematang Siantar', '54987b31-dba7-430e-9087-4294f0753877');
INSERT INTO `kota` VALUES ('7dc75bc0-eb11-4c98-93a0-432b277e57a5', 'Kota Sibolga', '54987b31-dba7-430e-9087-4294f0753877');
INSERT INTO `kota` VALUES ('831dbdf0-56c0-4028-8502-334d3c5f33e1', 'Kota Tanjung Balai', '54987b31-dba7-430e-9087-4294f0753877');
INSERT INTO `kota` VALUES ('bcd19498-9f52-480e-a886-9b5fd6d8642f', 'Kota Tebing Tinggi', '54987b31-dba7-430e-9087-4294f0753877');

-- ----------------------------
-- Table structure for pembelian
-- ----------------------------
DROP TABLE IF EXISTS `pembelian`;
CREATE TABLE `pembelian`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tanggal_pembelian` date NULL DEFAULT NULL,
  `id_supplier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `faktur` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tanggal_jatuh_tempo` date NULL DEFAULT NULL,
  `catatan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ppn` enum('ya','tidak') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nominal_ppn` decimal(16, 2) NULL DEFAULT NULL,
  `sub_total` decimal(16, 2) NULL DEFAULT NULL,
  `grand_total` decimal(16, 2) NULL DEFAULT NULL,
  `hutang` decimal(16, 2) NULL DEFAULT NULL,
  `kode_pembelian` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tanggal_pelunasan` date NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  `deleted_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kode` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `id_kategori` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `id_satuan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `hpp` decimal(16, 2) NULL DEFAULT NULL,
  `hpj` decimal(16, 2) NULL DEFAULT NULL,
  `hpg` decimal(16, 2) NULL DEFAULT NULL,
  `margin_hpj` decimal(16, 2) NULL DEFAULT NULL,
  `margin_hpg` decimal(16, 2) NULL DEFAULT NULL,
  `qty` decimal(9, 2) NULL DEFAULT NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `barcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  `deleted_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('52f3ac98-fcf0-4003-a7b3-cf84e416eaa2', 'B0010', 'Triplek 8mm', 'Triplek 8mm', '5e01b1d4-47a8-46f1-adf9-a3f62c7830ff', '48c6e89f-8ebf-46c6-a165-088b860539a3', 86000.00, 100000.00, 95000.00, 16.28, 10.47, 0.00, '', 'T0004', '2020-06-06 21:06:38', 'c43a5bd3-7471-473b-954e-1af3580784a5', '2020-06-06 21:06:38', 'c43a5bd3-7471-473b-954e-1af3580784a5', NULL, NULL);
INSERT INTO `product` VALUES ('cc23c7d4-92c5-4bdc-ae45-cbbc58ff5d4d', 'B2623', 'Nym 2x2,5 Eterna', 'Nym 2x2,5x50m E', '35730670-4c35-4fee-9581-fb5a0ef31eea', 'b2862ff3-8275-4031-b1bc-7cda8d16795e', 8300.00, 12000.00, 10000.00, 44.58, 20.48, 0.00, '', '6352', '2020-06-06 21:16:06', 'c43a5bd3-7471-473b-954e-1af3580784a5', '2020-06-06 21:16:06', 'c43a5bd3-7471-473b-954e-1af3580784a5', NULL, NULL);
INSERT INTO `product` VALUES ('ef867ce8-4f10-4f34-b73b-722e2f1b6036', '1', '111', '111', '6113fb8c-11a2-4e6f-a371-4ca1901edc83', '70db0161-cb66-469f-96c7-654ca39568a4', 1000.00, 2000.00, 1500.00, 100.00, 50.00, 0.00, '', 'a', '2020-06-06 20:17:06', 'c43a5bd3-7471-473b-954e-1af3580784a5', '2020-06-06 20:17:06', 'c43a5bd3-7471-473b-954e-1af3580784a5', '2020-06-06 21:06:55', 'c43a5bd3-7471-473b-954e-1af3580784a5');

-- ----------------------------
-- Table structure for provinsi
-- ----------------------------
DROP TABLE IF EXISTS `provinsi`;
CREATE TABLE `provinsi`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of provinsi
-- ----------------------------
INSERT INTO `provinsi` VALUES ('082c040d-a9b2-4d27-8b39-e9af1babde30', 'Jawa Timur');
INSERT INTO `provinsi` VALUES ('1e72ea5b-932a-4703-820f-3f05028e88f0', 'Jawa Barat');
INSERT INTO `provinsi` VALUES ('1f2ba666-37d8-4420-af3c-426d38a36419', 'Bangka Belitung');
INSERT INTO `provinsi` VALUES ('2338c9a3-fe2f-4bea-a46c-890e28c5dbf7', 'Bengkulu');
INSERT INTO `provinsi` VALUES ('236821d4-2f85-4bd7-b1a6-cc924148e49b', 'Papua');
INSERT INTO `provinsi` VALUES ('255eab9e-2d5c-4025-9e6d-c4d702cad4db', 'Jambi');
INSERT INTO `provinsi` VALUES ('3096b847-c11a-435f-97df-44c95b5b2289', 'Sumatera Selatan');
INSERT INTO `provinsi` VALUES ('4714671c-7593-4e1c-93ea-0c1c4255be79', 'Banten');
INSERT INTO `provinsi` VALUES ('52e3ce15-ef50-46f5-8f76-345d1e407c08', 'Gorontalo');
INSERT INTO `provinsi` VALUES ('54987b31-dba7-430e-9087-4294f0753877', 'Sumatera Utara');
INSERT INTO `provinsi` VALUES ('568bd7cb-9177-44b3-bf5e-8b2a62414409', 'Sulawesi Selatan');
INSERT INTO `provinsi` VALUES ('636165b8-b850-4e38-b476-5dcbff4ddeee', 'Kalimantan Utara');
INSERT INTO `provinsi` VALUES ('6843edbf-c175-4f71-b80d-3f61c23abcca', 'Papua Barat');
INSERT INTO `provinsi` VALUES ('68b39269-2909-4301-aa9d-92677786c3ff', 'Kalimantan Barat');
INSERT INTO `provinsi` VALUES ('6ba6a5d8-5d0d-4518-ba10-809e0c1d9c68', 'Nanggroe Aceh Darussalam (NAD)');
INSERT INTO `provinsi` VALUES ('6edb509a-a17e-44c3-bb9c-c6a9f1d6f361', 'Sulawesi Tengah');
INSERT INTO `provinsi` VALUES ('710da499-7507-447a-9aa9-77610a434034', 'Bali');
INSERT INTO `provinsi` VALUES ('831f2974-255f-4644-aa20-ffa6d449b9ce', 'Riau');
INSERT INTO `provinsi` VALUES ('83acc126-0068-4644-8bbc-27aa81778e37', 'Sulawesi Barat');
INSERT INTO `provinsi` VALUES ('856513ab-774d-43b9-ac4e-c1c0a2dbf396', 'Maluku');
INSERT INTO `provinsi` VALUES ('8f08882e-09c7-4d36-bd67-fbb75ebe6d7b', 'Sulawesi Utara');
INSERT INTO `provinsi` VALUES ('96690524-d32f-4483-9a40-7547ebf61132', 'Nusa Tenggara Timur (NTT)');
INSERT INTO `provinsi` VALUES ('9991e93c-e3fc-4618-95e2-8132243cfbd8', 'Jawa Tengah');
INSERT INTO `provinsi` VALUES ('ad80f715-e6af-45c5-ab1c-ecdf213fe012', 'Sumatera Barat');
INSERT INTO `provinsi` VALUES ('bb86d61a-b563-4b5c-9e16-f59f7ae231df', 'Sulawesi Tenggara');
INSERT INTO `provinsi` VALUES ('c401a144-a6be-41fa-8593-950c3c234754', 'Lampung');
INSERT INTO `provinsi` VALUES ('ce193c2c-afff-4c52-8528-aeb024d60ca7', 'Maluku Utara');
INSERT INTO `provinsi` VALUES ('d37010cd-cf14-438f-a996-9cff4c5293e5', 'DI Yogyakarta');
INSERT INTO `provinsi` VALUES ('d41945fb-2447-4573-8298-25d88f5cdbd4', 'Kalimantan Selatan');
INSERT INTO `provinsi` VALUES ('e62c819c-8e09-47b9-b8ea-751a6229dfd5', 'Kepulauan Riau');
INSERT INTO `provinsi` VALUES ('ef1f50e3-95aa-4be9-acd1-fcbf627fc2db', 'Nusa Tenggara Barat (NTB)');
INSERT INTO `provinsi` VALUES ('f964ca9f-8cc4-431f-8d6d-afbce83a1482', 'Kalimantan Timur');
INSERT INTO `provinsi` VALUES ('fbabf1e3-8638-425a-abd7-973e484ff2c6', 'DKI Jakarta');
INSERT INTO `provinsi` VALUES ('ff1c75ed-c5a8-49ba-a57b-fa503140e44e', 'Kalimantan Tengah');

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier`  (
  `id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `alamat` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id_provinsi` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id_kota` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kodepos` int(5) NULL DEFAULT NULL,
  `no_telepon` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_fax` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pic` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_handphone` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id_bank` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_rekening` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `atas_nama` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `catatan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES ('e3cdc1ff-34e8-4820-8ea9-0af66d2676d3', 'V0001', 'CV. Gemilang 1', 'Jl raya cikande Km 45 kaero', '1e72ea5b-932a-4703-820f-3f05028e88f0', '1ca68009-31f4-4ff7-939b-79d872b76a90', 16617, '02543408807', '123', 'test@gmail.com', 'kgndn', '502038503', 'f7cdec47-805c-48c0-9108-8720595cac78', '2052058', 'gdbkjgb', 'sgdk', '2020-06-06 14:33:30', 'c43a5bd3-7471-473b-954e-1af3580784a5');

-- ----------------------------
-- Table structure for unit
-- ----------------------------
DROP TABLE IF EXISTS `unit`;
CREATE TABLE `unit`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of unit
-- ----------------------------
INSERT INTO `unit` VALUES ('01788cd6-3d61-407f-986e-6431e690e3c8', 'Phil');
INSERT INTO `unit` VALUES ('234fa6ea-0bfb-41c1-ad57-6f3520e31848', 'Kaleng');
INSERT INTO `unit` VALUES ('26f9ab84-e912-4271-ae9e-7a9adfc0634c', 'Rol');
INSERT INTO `unit` VALUES ('2cec3392-3148-4bad-a1f0-11176d2f1614', 'Lsn');
INSERT INTO `unit` VALUES ('44728095-927b-4641-9fc5-3764bcdeb0db', 'SET');
INSERT INTO `unit` VALUES ('48c6e89f-8ebf-46c6-a165-088b860539a3', 'Lbr');
INSERT INTO `unit` VALUES ('5b235a14-9e7b-41c5-98d7-e6961adce1e2', 'Dus');
INSERT INTO `unit` VALUES ('6b4d2a87-cb0a-48e7-a393-d5f71b5842fc', 'KTK');
INSERT INTO `unit` VALUES ('6e360a3f-9af6-44fa-b145-55bb99494a9f', 'Gln');
INSERT INTO `unit` VALUES ('6e92fd4c-09ce-408a-8dc6-0cc07037828c', 'PAK');
INSERT INTO `unit` VALUES ('6fd3ec14-244f-4a5d-80fe-a15e8628366f', 'Kg');
INSERT INTO `unit` VALUES ('70db0161-cb66-469f-96c7-654ca39568a4', 'Btg');
INSERT INTO `unit` VALUES ('a1c319f0-cb43-450e-9c86-6bd9431ed158', 'Pcs');
INSERT INTO `unit` VALUES ('aec64000-ce89-45f3-a93f-16bdd45e708c', 'Ltr');
INSERT INTO `unit` VALUES ('b2862ff3-8275-4031-b1bc-7cda8d16795e', 'Mtr');
INSERT INTO `unit` VALUES ('bc35bd9e-2494-484b-a058-95ab7d43c4ae', 'Set');
INSERT INTO `unit` VALUES ('c241b077-e1fa-4f19-87ae-e7c63edb8aa5', 'Kubikasi');
INSERT INTO `unit` VALUES ('d5df2966-794b-468f-8cc6-0c616305ced2', 'Roll');
INSERT INTO `unit` VALUES ('d61a6236-5388-4471-ac4e-147a5e3441fd', 'SAK');
INSERT INTO `unit` VALUES ('d7dc92e1-4d54-48ce-a3db-b8db4234bb0d', 'psg');

SET FOREIGN_KEY_CHECKS = 1;
