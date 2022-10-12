/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : campus_market

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 12/10/2022 21:50:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id主键',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后修改时间',
  `content` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `reply_to` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论对象',
  `goods_id` bigint NULL DEFAULT NULL COMMENT '评论商品id',
  `student_id` bigint NULL DEFAULT NULL COMMENT '评论人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKd01gnchhuj06oumqxrikccc3r`(`goods_id`) USING BTREE,
  INDEX `FKswirics8hhydki5ff0emtmbii`(`student_id`) USING BTREE,
  CONSTRAINT `FKd01gnchhuj06oumqxrikccc3r` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKswirics8hhydki5ff0emtmbii` FOREIGN KEY (`student_id`) REFERENCES `studnet` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, '2021-07-27 17:02:25', '2021-07-27 17:02:25', '您好', NULL, 69, 4);
INSERT INTO `comment` VALUES (2, '2021-07-27 17:03:30', '2021-07-27 17:03:30', '这个书籍可以再便宜一些吗', NULL, 69, 4);
INSERT INTO `comment` VALUES (3, '2022-02-22 15:17:39', '2022-02-22 15:17:39', '1', NULL, 71, 2);

-- ----------------------------
-- Table structure for consumption
-- ----------------------------
DROP TABLE IF EXISTS `consumption`;
CREATE TABLE `consumption`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `student_id` bigint NOT NULL COMMENT '学生id',
  `create_time` datetime NOT NULL COMMENT '消费时间',
  `amount` float NOT NULL COMMENT '消费金额',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKe70lwlwkgs7dd1ef1q5nrwxfq`(`student_id`) USING BTREE,
  CONSTRAINT `FKe70lwlwkgs7dd1ef1q5nrwxfq` FOREIGN KEY (`student_id`) REFERENCES `studnet` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '消费记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of consumption
-- ----------------------------
INSERT INTO `consumption` VALUES (1, 2, '2022-02-24 15:18:14', 11, '2022-02-24 15:18:18');
INSERT INTO `consumption` VALUES (2, 2, '2022-02-24 16:26:23', 22, '2022-02-24 16:26:27');
INSERT INTO `consumption` VALUES (3, 2, '2022-02-24 16:26:37', 1, '2022-02-24 16:26:39');
INSERT INTO `consumption` VALUES (4, 2, '2022-02-24 16:26:46', 2, '2022-02-24 16:26:48');
INSERT INTO `consumption` VALUES (5, 2, '2022-02-24 16:26:57', 3, '2022-02-24 16:27:00');
INSERT INTO `consumption` VALUES (6, 2, '2022-02-24 16:27:32', 2, '2022-02-24 16:27:34');
INSERT INTO `consumption` VALUES (7, 2, '2022-02-24 16:27:43', 2, '2022-02-24 16:27:46');
INSERT INTO `consumption` VALUES (8, 2, '2022-02-15 16:27:53', 2, '2022-02-24 16:27:57');
INSERT INTO `consumption` VALUES (9, 2, '2022-02-24 16:28:10', 2, '2022-02-24 16:28:14');
INSERT INTO `consumption` VALUES (10, 2, '2022-02-08 16:28:23', 2, '2022-02-24 16:28:27');
INSERT INTO `consumption` VALUES (11, 2, '2022-02-24 16:28:38', 3, '2022-02-24 16:28:40');
INSERT INTO `consumption` VALUES (12, 2, '2022-02-24 17:20:06', 72, '2022-02-24 17:20:06');
INSERT INTO `consumption` VALUES (13, 2, '2022-02-24 17:20:28', 169, '2022-02-24 17:20:28');
INSERT INTO `consumption` VALUES (14, 2, '2022-02-25 10:13:43', 34, '2022-02-25 10:13:43');
INSERT INTO `consumption` VALUES (15, 2, '2022-02-25 10:24:06', 50, '2022-02-25 10:24:06');
INSERT INTO `consumption` VALUES (16, 2, '2022-02-25 10:50:12', 20, '2022-02-25 10:50:12');
INSERT INTO `consumption` VALUES (17, 2, '2022-02-25 10:52:07', 20, '2022-02-25 10:52:07');
INSERT INTO `consumption` VALUES (18, 3, '2022-02-28 16:47:26', 1, '2022-02-28 16:47:31');
INSERT INTO `consumption` VALUES (19, 2, '2022-03-01 17:16:43', 20, '2022-03-01 17:16:43');
INSERT INTO `consumption` VALUES (20, 2, '2022-05-08 15:10:36', 36, '2022-05-08 15:10:36');
INSERT INTO `consumption` VALUES (21, 2, '2022-05-08 15:11:23', 34, '2022-05-08 15:11:23');

-- ----------------------------
-- Table structure for database_bak
-- ----------------------------
DROP TABLE IF EXISTS `database_bak`;
CREATE TABLE `database_bak`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id主键',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后修改时间',
  `filename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '脚本文件名称',
  `filepath` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '脚本文件路径',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据库备份表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of database_bak
-- ----------------------------
INSERT INTO `database_bak` VALUES (44, '2022-02-06 04:30:09', '2022-02-06 04:30:09', 'campus_market_20220206043009.sql', 'D:/campus-market/src/main/resources/backup/');
INSERT INTO `database_bak` VALUES (45, '2022-02-07 09:27:32', '2022-02-07 09:27:32', 'campus_market_20220207092731.sql', 'D:/campus-market/src/main/resources/backup/');
INSERT INTO `database_bak` VALUES (46, '2022-02-09 09:32:21', '2022-02-09 09:32:21', 'campus_market_20220209093216.sql', 'D:/campus-market/src/main/resources/backup/');
INSERT INTO `database_bak` VALUES (47, '2022-02-12 09:13:30', '2022-02-12 09:13:30', 'campus_market_20220212091329.sql', 'D:/campus-market/src/main/resources/backup/');
INSERT INTO `database_bak` VALUES (48, '2022-02-13 09:19:22', '2022-02-13 09:19:22', 'campus_market_20220213091922.sql', 'D:/campus-market/src/main/resources/backup/');
INSERT INTO `database_bak` VALUES (49, '2022-02-14 09:30:24', '2022-02-14 09:30:24', 'campus_market_20220214093023.sql', 'D:/campus-market/src/main/resources/backup/');
INSERT INTO `database_bak` VALUES (50, '2022-02-15 09:11:19', '2022-02-15 09:11:19', 'campus_market_20220215091118.sql', 'D:/campus-market/src/main/resources/backup/');
INSERT INTO `database_bak` VALUES (51, '2022-02-16 09:23:29', '2022-02-16 09:23:29', 'campus_market_20220216092328.sql', 'D:/campus-market/src/main/resources/backup/');
INSERT INTO `database_bak` VALUES (52, '2022-03-02 09:29:58', '2022-03-02 09:29:58', 'campus_market_20220302092957.sql', 'D:/campus-market/src/main/resources/backup/');
INSERT INTO `database_bak` VALUES (53, '2022-03-17 22:53:26', '2022-03-17 22:53:26', 'campus_market_20220317225325.sql', 'D:/campus-market/src/main/resources/backup/');
INSERT INTO `database_bak` VALUES (54, '2022-03-17 23:05:27', '2022-03-17 23:05:27', 'campus_market_20220317230527.sql', 'D:/campus-market/src/main/resources/backup/');
INSERT INTO `database_bak` VALUES (55, '2022-05-09 01:00:03', '2022-05-09 01:00:03', 'campus_market_20220509010002.sql', 'D:/campus-market/src/main/resources/backup/');

-- ----------------------------
-- Table structure for friend_link
-- ----------------------------
DROP TABLE IF EXISTS `friend_link`;
CREATE TABLE `friend_link`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id主键',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后修改时间',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `sort` int NOT NULL COMMENT '顺序',
  `url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网站url',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '友情链接表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of friend_link
-- ----------------------------
INSERT INTO `friend_link` VALUES (1, '2020-04-18 14:32:25', '2021-07-27 11:26:29', 'bilibili', 1, 'www.bilibili.com');
INSERT INTO `friend_link` VALUES (11, '2020-04-18 15:49:20', '2021-07-27 11:26:34', '百度', 0, 'www.baidu.com');
INSERT INTO `friend_link` VALUES (15, '2020-04-18 15:59:56', '2021-07-27 11:26:24', 'github', 2, 'www.github.com');
INSERT INTO `friend_link` VALUES (16, '2020-04-18 16:00:20', '2021-07-27 11:26:18', 'csdn', 3, 'www.csdn.com');
INSERT INTO `friend_link` VALUES (17, '2020-04-18 16:00:31', '2021-07-27 11:26:12', 'google', 4, 'www.google.com');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id主键',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后修改时间',
  `content` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `photo` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片',
  `recommend` int NOT NULL COMMENT '简介',
  `sell_price` float NOT NULL COMMENT '卖价',
  `status` int NOT NULL COMMENT '状态',
  `goods_category_id` bigint NULL DEFAULT NULL COMMENT '商品种类id',
  `view_number` int NOT NULL COMMENT '浏览数',
  `buy_price` float NOT NULL COMMENT '买入价格',
  `student_id` bigint NOT NULL COMMENT '发布人id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKjtyl6pmb9j4aj64sm54xi1hbi`(`goods_category_id`) USING BTREE,
  INDEX `fsadfsafsaf`(`student_id`) USING BTREE,
  CONSTRAINT `FKf68a0a9u8u8hqckg0ycnjarv6` FOREIGN KEY (`student_id`) REFERENCES `studnet` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKjtyl6pmb9j4aj64sm54xi1hbi` FOREIGN KEY (`goods_category_id`) REFERENCES `goods_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (67, '2021-07-27 16:45:51', '2022-02-25 10:50:12', '开 本：16开   纸 张：胶版纸  包 装：平装-胶订  是否套装：否   国际标准书号ISBN：9787303236879   丛书名：新世纪高等学校教材 心理学基础课系列教材\r\n\r\n\r\n它既是心理学专业的基础课教材，也是相关专业和心理学爱好者的入门教材，还是部分高校招收心理学博、硕士研究生的重要参考教材', '普通心理学(第5版）', '20210727/1627375530150.jpg', 0, 20, 1, 11, 1, 50, 4);
INSERT INTO `goods` VALUES (69, '2021-07-27 16:45:54', '2022-03-01 15:49:50', '开 本：16开   纸 张：胶版纸   包 装：平装-胶订  是否套装：否   国际标准书号ISBN：9787115435590   丛书名：图灵数学·统计学丛书', '普林斯顿微积分读本（修订版）', '20210727/1627375367494.jpg', 0, 20, 1, 9, 11, 50, 36);
INSERT INTO `goods` VALUES (70, '2021-07-28 15:54:55', '2022-03-01 15:49:35', '开 本：32开   纸 张：轻型纸   包 装：精装   是否套装：否   国际标准书号ISBN：9787020162925\r\n叛逆者 邮差 氰化钾 胭脂 《人民文学》奖 《上海文学》奖 中国作家出版集团奖', '叛逆者（定制明信片版，朱一龙主演）', '20210727/1627375775548.jpg', 0, 15, 1, 20, 3, 25, 37);
INSERT INTO `goods` VALUES (71, '2021-07-28 15:54:57', '2022-03-01 15:49:37', '罗翔推荐！荣获日本推理小说至高荣誉江户川乱步奖！是否值得为一场痛快的复仇，陪葬掉自己的人生？', '消失的13级台阶', '20210727/1627376069270.jpg', 0, 15, 1, 18, 47, 30, 38);
INSERT INTO `goods` VALUES (72, '2021-07-28 18:13:44', '2021-07-28 18:14:25', '看懂罗马，就能看懂世界。东京大学古罗马史教授倾囊相授，非传统意义上的“罗马通史”，宏大视角，多维解读，于罗马帝国的兴衰洪流中感知历史深处的规律与真相 ', '罗马兴衰1200年', '20210728/1627467192044.jpg', 0, 32, 1, 11, 0, 67, 39);
INSERT INTO `goods` VALUES (73, '2021-07-28 18:13:54', '2021-07-28 18:14:53', '开 本：32开  纸 张：胶版纸   包 装：平装-胶订  是否套装：否    国际标准书号ISBN：9787020170760', '三生三世步生莲 贰·神祈（B版：限量', '20210728/1627466806697.jpg', 0, 32, 1, 22, 0, 64, 2);
INSERT INTO `goods` VALUES (74, '2021-07-28 18:13:56', '2022-02-12 09:19:05', '唐七作品，三生三世系列，东华和凤九的故事。畅销百万册言情经典作品全新再版，新增作者序言解密【三生】系列未来规划。', '三生三世枕上书. 全二册', '20210728/1627466938937.jpg', 0, 32, 1, 22, 1, 62, 39);
INSERT INTO `goods` VALUES (75, '2021-07-28 18:13:58', '2022-03-17 22:17:25', '宫闱秘史、珍馐美味；济世名臣、末代公子 这里的故事传奇且精彩', '“高阳谈中国历史”系列（套装6册）', '20210728/1627467036695.jpg', 0, 56, 1, 11, 7, 114, 40);
INSERT INTO `goods` VALUES (76, '2021-07-28 18:14:00', '2021-07-29 14:15:18', '《撒野》热血兄弟篇！高燃继续，重磅来袭！新增出版番外！随书附赠人物海报+双面卡册+Q萌贴纸+书签。当当独家专享印签本！', '轻狂2 畅销书作家巫哲燃情力作 当当', '20210728/1627466762307.jpg', 0, 23, 1, 24, 1, 54, 2);
INSERT INTO `goods` VALUES (77, '2021-07-28 18:14:02', '2022-02-25 10:24:06', '畅销书作家木苏里无限流幻想小说力作，高人气原创作品，从光怪陆离的设定到有血有肉的人物且看秦究游惑如何带一众小伙伴从凄冷风雪走到熙攘人间!\r\n', '全球高考收藏版礼盒', '20210728/1627466686862.jpg', 0, 50, 1, 24, 4, 169, 36);
INSERT INTO `goods` VALUES (78, '2021-07-28 18:14:05', '2022-02-24 16:34:33', '山河令男主张哲瀚推荐！\r\n开 本：32开   纸 张：胶版纸   包 装：平装-胶订   是否套装：否   国际标准书号ISBN：9787540483548', '嘿，小家伙', '20210728/1627466605383.jpg', 0, 19, 1, 24, 2, 54, 39);
INSERT INTO `goods` VALUES (79, '2021-07-28 18:14:07', '2022-03-01 17:16:43', '特别懂年轻人的知名自媒体“原来是柒公子”首部文集。从未想过安分过一生，也注定有人愿与你同行。\r\n开 本：32开  纸 张：胶版纸   包 装：平装-胶订  是否套装：否      国际标准书号ISBN：9787517096610', '总有人喜欢你的奇奇怪怪', '20210728/1627466509612.jpg', 0, 20, 3, 24, 2, 35, 4);
INSERT INTO `goods` VALUES (80, '2021-07-28 18:26:56', '2022-03-01 15:19:45', '以考古出土的青铜面具、青铜人像、青铜神树、玉琮、玉璋、黄金面具等实物为依托，系统描述了古蜀文明三星堆的全貌。对中华文明与三星堆文明的关系做了解码似的揭示，解读三星堆文化的来龙去脉及其与长江流域、黄河流', ' 三星堆：开启中华文明之门（精装版）', '20210728/1627467989100.jpg', 0, 34, 1, 11, 5, 68, 2);
INSERT INTO `goods` VALUES (81, '2021-07-28 18:26:58', '2022-02-24 17:20:20', '中国古代海权史经典之作！从海洋的角度看中国史！翻开本书，从战争、贸易、文化等方面，看清古代中国如何一步步成为海洋强国！\r\n古代中国其实是一个海洋强国！造船技术世界当先，航海足迹远至东非，傲视东方海域数百年！从海洋看中国史', '被遗忘的海上中国史', '20210728/1627467865716.jpg', 0, 36, 1, 11, 10, 72, 37);
INSERT INTO `goods` VALUES (82, '2021-07-29 14:05:50', '2022-02-08 19:03:34', '开 本：32开   纸 张：胶版纸   包 装：精装   是否套装：是   国际标准书号ISBN：9787101098570', '资治通鉴（全12册·中华国学文库）', '20210729/1627538707357.jpg', 0, 560, 1, 11, 7, 1024, 4);
INSERT INTO `goods` VALUES (83, '2021-07-29 14:05:52', '2022-03-01 17:10:52', '开 本：32开  纸 张：胶版纸   包 装：精装   是否套装：否   国际标准书号ISBN：9787100099806', '古代汉语词典（精装）(第2版)', '20210729/1627538616020.jpg', 0, 50, 1, 11, 5, 102, 38);
INSERT INTO `goods` VALUES (84, '2022-03-01 15:53:20', '2022-03-01 16:51:57', '计算机网络计算机网络计算机网络计算机网络计算机网络计算机网络计算机网络', '计算机网络', '20220301/1646120103481.jpg', 0, 10, 1, 26, 9, 100, 37);
INSERT INTO `goods` VALUES (85, '2022-03-01 15:53:22', '2022-03-17 22:17:19', '12312312312发打发士大夫撒打发', '我的书', '20210729/1627538707357.jpg', 0, 11, 1, 51, 3, 12, 4);
INSERT INTO `goods` VALUES (86, '2022-03-01 15:53:24', '2022-03-01 15:59:25', '开 本：32开   纸 张：胶版纸   包 装：精装   是否套装：是   国际标准书号ISBN：9787101098570', '资治通鉴（全12册·中华国学文库）', '20210729/1627538707357.jpg', 0, 560, 1, 11, 0, 1024, 40);
INSERT INTO `goods` VALUES (87, '2022-03-01 15:53:25', '2022-03-01 17:16:04', '开 本：32开  纸 张：胶版纸   包 装：精装   是否套装：否   国际标准书号ISBN：9787100099806', '古代汉语词典（精装）(第2版)', '20210729/1627538616020.jpg', 0, 50, 1, 11, 1, 102, 36);
INSERT INTO `goods` VALUES (88, '2022-03-01 15:53:27', '2022-05-08 15:11:23', '以考古出土的青铜面具、青铜人像、青铜神树、玉琮、玉璋、黄金面具等实物为依托，系统描述了古蜀文明三星堆的全貌。对中华文明与三星堆文明的关系做了解码似的揭示，解读三星堆文化的来龙去脉及其与长江流域、黄河流', ' 三星堆：开启中华文明之门（精装版）', '20210728/1627467989100.jpg', 0, 34, 3, 11, 2, 68, 4);
INSERT INTO `goods` VALUES (89, '2022-03-01 15:53:29', '2022-05-08 15:10:36', '中国古代海权史经典之作！从海洋的角度看中国史！翻开本书，从战争、贸易、文化等方面，看清古代中国如何一步步成为海洋强国！\r\n古代中国其实是一个海洋强国！造船技术世界当先，航海足迹远至东非，傲视东方海域数百年！从海洋看中国史', '被遗忘的海上中国史', '20210728/1627467865716.jpg', 0, 36, 3, 11, 3, 72, 36);
INSERT INTO `goods` VALUES (90, '2022-03-01 16:35:36', '2022-03-17 22:21:59', '啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊 ', '计网', '20220301/1646123694505.jpg', 1, 1, 1, 23, 14, 200, 3);

-- ----------------------------
-- Table structure for goods_category
-- ----------------------------
DROP TABLE IF EXISTS `goods_category`;
CREATE TABLE `goods_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id主键',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后修改时间',
  `icon` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `name` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `sort` int NOT NULL COMMENT '顺序',
  `parent_id` bigint NULL DEFAULT NULL COMMENT '父种类id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKos35mkmw4k5dvi4fi2govg2pa`(`parent_id`) USING BTREE,
  CONSTRAINT `FKos35mkmw4k5dvi4fi2govg2pa` FOREIGN KEY (`parent_id`) REFERENCES `goods_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品种类表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of goods_category
-- ----------------------------
INSERT INTO `goods_category` VALUES (1, '2020-04-02 20:20:05', '2021-07-27 15:58:34', '20210727/1627372711692.png', '特色书单', 0, NULL);
INSERT INTO `goods_category` VALUES (4, '2020-04-02 20:26:45', '2021-07-27 15:40:02', '20210727/1627372711692.png', '童书', 1, 1);
INSERT INTO `goods_category` VALUES (5, '2020-04-02 21:13:04', '2021-07-27 15:40:40', '20210727/1627372711692.png', '文艺', 2, 1);
INSERT INTO `goods_category` VALUES (6, '2020-04-02 21:37:05', '2021-07-27 15:40:55', '20210727/1627372711692.png', '社科', 3, 1);
INSERT INTO `goods_category` VALUES (7, '2020-04-02 21:37:23', '2021-07-27 15:41:16', '20210727/1627372711692.png', '生活', 4, 1);
INSERT INTO `goods_category` VALUES (8, '2020-04-02 21:37:50', '2021-07-27 15:41:35', '20210727/1627372711692.png', '人文教育', 5, NULL);
INSERT INTO `goods_category` VALUES (9, '2020-04-02 21:38:08', '2021-07-27 15:41:57', '20210727/1627372711692.png', '教材', 6, 8);
INSERT INTO `goods_category` VALUES (10, '2020-04-02 21:38:26', '2021-07-27 15:42:11', '20210727/1627372711692.png', '外语', 7, 8);
INSERT INTO `goods_category` VALUES (11, '2020-04-02 21:38:45', '2021-07-27 15:42:23', '20210727/1627372711692.png', '工具书', 8, 8);
INSERT INTO `goods_category` VALUES (15, '2020-04-05 18:46:54', '2021-07-27 15:42:40', '20210727/1627372711692.png', '小说', 9, NULL);
INSERT INTO `goods_category` VALUES (16, '2020-04-05 19:06:56', '2020-04-05 19:07:20', '20210727/1627372711692.png', '中国古典小说', 10, 15);
INSERT INTO `goods_category` VALUES (17, '2020-04-05 19:07:45', '2020-04-05 19:07:45', '20210727/1627372711692.png', '中国当代小说', 11, 15);
INSERT INTO `goods_category` VALUES (18, '2020-04-05 19:08:15', '2020-04-05 19:08:15', '20210727/1627372711692.png', '外国小说', 12, 15);
INSERT INTO `goods_category` VALUES (19, '2020-04-05 19:08:44', '2020-04-05 19:08:44', '20210727/1627372711692.png', '科幻小说', 13, 15);
INSERT INTO `goods_category` VALUES (20, '2020-04-05 19:09:04', '2020-04-05 19:09:04', '20210727/1627372711692.png', '中国近现代小说', 14, 15);
INSERT INTO `goods_category` VALUES (21, '2020-04-05 19:10:14', '2020-04-05 19:10:14', '20210727/1627372711692.png', '青春文学', 15, NULL);
INSERT INTO `goods_category` VALUES (22, '2020-04-05 19:10:45', '2020-04-05 19:10:45', '20210727/1627372711692.png', '古代言情', 16, 21);
INSERT INTO `goods_category` VALUES (23, '2020-04-05 19:11:08', '2020-04-05 19:11:08', '20210727/1627372711692.png', '校园', 17, 21);
INSERT INTO `goods_category` VALUES (24, '2020-04-05 19:11:25', '2020-04-05 19:11:25', '20210727/1627372711692.png', '大陆原创', 18, 21);
INSERT INTO `goods_category` VALUES (25, '2020-04-05 19:11:50', '2020-04-05 19:11:50', '20210727/1627372711692.png', '成功励志', 19, NULL);
INSERT INTO `goods_category` VALUES (26, '2020-04-05 19:12:13', '2020-04-05 19:12:13', '20210727/1627372711692.png', '心灵与修养', 20, 25);
INSERT INTO `goods_category` VALUES (27, '2020-04-05 19:12:34', '2020-04-05 19:12:34', '20210727/1627372711692.png', '性格与习惯', 21, 25);
INSERT INTO `goods_category` VALUES (28, '2020-04-05 19:12:53', '2020-04-05 19:12:53', '20210727/1627372711692.png', '人在职场', 22, 25);
INSERT INTO `goods_category` VALUES (29, '2020-04-05 19:13:11', '2020-04-05 19:13:11', '20210727/1627372711692.png', '处世学', 23, 25);
INSERT INTO `goods_category` VALUES (30, '2020-04-05 19:13:50', '2020-04-05 19:13:50', '20210727/1627372711692.png', '科技', 24, NULL);
INSERT INTO `goods_category` VALUES (31, '2020-04-05 19:14:15', '2020-04-05 19:14:15', '20210727/1627372711692.png', '宇宙知识', 25, 30);
INSERT INTO `goods_category` VALUES (32, '2020-04-05 19:14:30', '2020-04-05 19:14:30', '20210727/1627372711692.png', '百科知识', 26, 30);
INSERT INTO `goods_category` VALUES (33, '2020-04-05 19:14:48', '2020-04-05 19:14:48', '20210727/1627372711692.png', '科学世界', 27, 30);
INSERT INTO `goods_category` VALUES (34, '2020-04-05 19:15:12', '2020-04-05 19:15:12', '20210727/1627372711692.png', '生物世界', 28, 30);
INSERT INTO `goods_category` VALUES (35, '2020-04-05 19:15:29', '2020-04-05 19:15:29', '20210727/1627372711692.png', '网络安全', 29, 30);
INSERT INTO `goods_category` VALUES (36, '2020-04-05 19:15:55', '2020-04-05 19:15:55', '20210727/1627372711692.png', '中医学', 30, 30);
INSERT INTO `goods_category` VALUES (37, '2020-04-05 19:16:38', '2020-04-05 19:16:38', '20210727/1627372711692.png', '工业技术', 31, NULL);
INSERT INTO `goods_category` VALUES (38, '2020-04-05 19:17:05', '2020-04-05 19:17:05', '20210727/1627372711692.png', '电工', 32, 37);
INSERT INTO `goods_category` VALUES (39, '2020-04-05 19:17:22', '2020-04-05 19:17:22', '20210727/1627372711692.png', '化工', 33, 37);
INSERT INTO `goods_category` VALUES (40, '2020-04-05 19:17:39', '2020-04-05 19:17:39', '20210727/1627372711692.png', '轻工', 34, 37);
INSERT INTO `goods_category` VALUES (41, '2020-04-05 19:18:00', '2020-04-05 19:18:00', '20210727/1627372711692.png', '环境科学', 35, 37);
INSERT INTO `goods_category` VALUES (42, '2020-04-05 19:18:31', '2020-04-05 19:18:31', '20210727/1627372711692.png', '艺术', 36, NULL);
INSERT INTO `goods_category` VALUES (43, '2020-04-05 19:18:49', '2020-04-05 19:18:49', '20210727/1627372711692.png', '民间艺术', 37, 42);
INSERT INTO `goods_category` VALUES (44, '2020-04-05 19:19:05', '2020-04-05 19:19:05', '20210727/1627372711692.png', '建筑艺术', 38, 42);
INSERT INTO `goods_category` VALUES (45, '2020-04-05 19:19:24', '2020-04-05 19:19:24', '20210727/1627372711692.png', '人体艺术', 39, 42);
INSERT INTO `goods_category` VALUES (46, '2020-04-05 19:19:54', '2020-04-05 19:19:54', '20210727/1627372711692.png', '现代管理', 40, NULL);
INSERT INTO `goods_category` VALUES (47, '2020-04-05 19:20:18', '2020-04-05 19:20:18', '20210727/1627372711692.png', '经营管理', 41, 46);
INSERT INTO `goods_category` VALUES (48, '2020-04-05 19:20:35', '2020-04-05 19:20:35', '20210727/1627372711692.png', '人力资源', 42, 46);
INSERT INTO `goods_category` VALUES (49, '2020-04-05 19:21:01', '2020-04-05 19:21:01', '20210727/1627372711692.png', '组织学', 43, 46);
INSERT INTO `goods_category` VALUES (50, '2020-04-05 19:21:29', '2020-04-05 19:21:29', '20210727/1627372711692.png', '财务会计', 44, NULL);
INSERT INTO `goods_category` VALUES (51, '2020-04-05 19:21:47', '2020-04-05 19:21:47', '20210727/1627372711692.png', '会计理论', 45, 50);
INSERT INTO `goods_category` VALUES (52, '2020-04-05 19:22:05', '2020-04-05 19:22:05', '20210727/1627372711692.png', '成本会计', 46, 50);
INSERT INTO `goods_category` VALUES (53, '2020-04-05 19:22:29', '2020-04-05 19:22:29', '20210727/1627372711692.png', '期刊杂志', 46, NULL);
INSERT INTO `goods_category` VALUES (54, '2020-04-11 21:19:25', '2021-07-23 18:25:45', '20210727/1627372711692.png', '外文杂志', 47, 21);
INSERT INTO `goods_category` VALUES (55, '2020-04-12 22:31:58', '2021-07-23 18:26:11', '20210727/1627372711692.png', '专业期刊', 48, 53);

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id主键',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后修改时间',
  `name` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'url',
  `icon` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `sort` int NOT NULL COMMENT '顺序',
  `parent_id` bigint NULL DEFAULT NULL COMMENT '父菜单id',
  `is_bitton` bit(1) NOT NULL COMMENT '是否是按钮',
  `is_show` bit(1) NOT NULL COMMENT '是否是展示页面',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKsbtnjocfrq29e8taxdwo21gic`(`parent_id`) USING BTREE,
  CONSTRAINT `FKsbtnjocfrq29e8taxdwo21gic` FOREIGN KEY (`parent_id`) REFERENCES `menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 87 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (2, '2020-03-14 14:26:03', '2020-03-14 18:24:53', '系统设置', '', 'mdi-settings', 0, NULL, b'0', b'1');
INSERT INTO `menu` VALUES (3, '2020-03-14 16:58:55', '2021-07-29 18:00:32', '菜单管理', '/admin/menu/list', 'mdi-view-list', 1, 2, b'0', b'1');
INSERT INTO `menu` VALUES (5, '2020-03-14 17:04:44', '2021-07-29 18:00:39', '新增', '/admin/menu/add', 'mdi-plus', 2, 3, b'0', b'1');
INSERT INTO `menu` VALUES (7, '2020-03-14 17:07:43', '2021-07-29 18:00:59', '角色管理', '/admin/role/list', 'mdi-account-settings-variant', 5, 2, b'0', b'1');
INSERT INTO `menu` VALUES (8, '2020-03-14 18:28:48', '2021-07-29 18:00:46', '编辑', 'edit(\'/admin/menu/edit\')', 'mdi-grease-pencil', 3, 3, b'1', b'1');
INSERT INTO `menu` VALUES (9, '2020-03-14 18:30:00', '2021-07-29 18:00:53', '删除', 'del(\'/admin/menu/delete\')', 'mdi-close', 4, 3, b'1', b'1');
INSERT INTO `menu` VALUES (10, '2020-03-15 12:12:00', '2021-07-29 18:02:56', '添加', '/admin/role/add', 'mdi-account-plus', 6, 7, b'0', b'1');
INSERT INTO `menu` VALUES (11, '2020-03-15 12:12:36', '2020-03-21 22:10:45', '编辑', 'edit(\'/admin/role/edit\')', 'mdi-account-edit', 7, 7, b'1', b'1');
INSERT INTO `menu` VALUES (12, '2020-03-15 12:13:19', '2020-03-21 22:15:27', '删除', 'del(\'/admin/role/delete\')', 'mdi-account-remove', 8, 7, b'1', b'1');
INSERT INTO `menu` VALUES (13, '2020-03-15 12:14:52', '2020-03-15 12:17:00', '用户管理', '/admin/user/list', 'mdi-account-multiple', 9, 2, b'0', b'1');
INSERT INTO `menu` VALUES (14, '2020-03-15 12:15:22', '2020-03-15 12:17:27', '添加', '/admin/user/add', 'mdi-account-plus', 10, 13, b'0', b'1');
INSERT INTO `menu` VALUES (15, '2020-03-16 17:18:14', '2020-03-21 22:11:19', '编辑', 'edit(\'/admin/user/edit\')', 'mdi-account-edit', 11, 13, b'1', b'1');
INSERT INTO `menu` VALUES (16, '2020-03-16 17:19:01', '2020-03-21 22:15:36', '删除', 'del(\'/admin/user/delete\')', 'mdi-account-remove', 12, 13, b'1', b'1');
INSERT INTO `menu` VALUES (19, '2020-03-22 11:24:36', '2021-07-23 18:14:20', '上传图片', '/admin/upload/upload_photo', 'mdi-arrow-up-bold-circle', 13, 13, b'0', b'0');
INSERT INTO `menu` VALUES (20, '2020-03-22 14:09:35', '2021-07-23 18:14:31', '日志管理', '/system/operator_log_list', 'mdi-tag-multiple', 14, 2, b'0', b'1');
INSERT INTO `menu` VALUES (21, '2020-03-22 14:11:39', '2021-07-23 18:14:39', '删除', 'del(\'/system/delete_operator_log\')', 'mdi-tag-remove', 15, 20, b'1', b'1');
INSERT INTO `menu` VALUES (22, '2020-03-22 14:12:57', '2021-07-23 18:14:47', '清空日志', 'delAll(\'/system/delete_all_operator_log\')', 'mdi-delete-circle', 16, 20, b'1', b'1');
INSERT INTO `menu` VALUES (23, '2020-03-22 14:46:40', '2021-07-23 18:14:56', '数据备份', '/admin/database_bak/list', 'mdi-database', 17, 2, b'0', b'1');
INSERT INTO `menu` VALUES (24, '2020-03-22 14:48:07', '2021-07-23 18:15:05', '备份', 'add(\'/admin/database_bak/add\')', 'mdi-database-plus', 18, 23, b'1', b'1');
INSERT INTO `menu` VALUES (25, '2020-03-22 14:49:03', '2021-07-23 18:15:14', '删除', 'del(\'/admin/database_bak/delete\')', 'mdi-database-minus', 19, 23, b'1', b'1');
INSERT INTO `menu` VALUES (26, '2020-03-22 19:36:20', '2021-07-23 18:15:22', '还原', 'restore(\'/admin/database_bak/restore\')', 'mdi-database-minus', 20, 23, b'1', b'1');
INSERT INTO `menu` VALUES (27, '2021-07-27 17:49:22', '2021-07-29 18:09:10', '求购管理', '', 'mdi-book-open-variant', 21, NULL, b'0', b'1');
INSERT INTO `menu` VALUES (28, '2021-07-27 17:50:34', '2021-07-29 18:09:34', '收购管理', '', 'mdi-book-open-page-variant', 23, NULL, b'0', b'1');
INSERT INTO `menu` VALUES (40, '2020-04-15 20:02:04', '2021-07-29 18:10:01', '学生管理', '', 'mdi-account-multiple', 27, NULL, b'0', b'1');
INSERT INTO `menu` VALUES (41, '2020-04-15 20:02:38', '2021-07-29 18:10:12', '学生列表', '/admin/student/list', 'mdi-account-multiple', 28, 40, b'0', b'1');
INSERT INTO `menu` VALUES (42, '2020-04-15 20:06:28', '2021-07-29 18:10:21', '冻结', 'freeze(\'/admin/student/update_status\')', 'mdi-account-settings-variant', 29, 41, b'1', b'1');
INSERT INTO `menu` VALUES (43, '2020-04-15 20:06:59', '2021-07-29 18:10:39', '激活', 'openStudent(\'/admin/student/update_status\')', 'mdi-account-key', 30, 41, b'1', b'1');
INSERT INTO `menu` VALUES (44, '2020-04-15 20:07:33', '2021-07-29 18:11:07', '删除', 'del(\'/admin/student/delete\')', 'mdi-account-remove', 31, 41, b'1', b'1');
INSERT INTO `menu` VALUES (45, '2020-04-15 21:52:57', '2021-07-23 18:19:49', '评论管理', '/admin/comment/list', 'mdi-comment-account', 0, NULL, b'0', b'1');
INSERT INTO `menu` VALUES (46, '2020-04-15 21:53:39', '2021-07-23 18:19:58', '评论列表', '/admin/comment/list', 'mdi-comment-multiple-outline', 0, 45, b'0', b'1');
INSERT INTO `menu` VALUES (47, '2020-04-15 21:54:35', '2021-07-23 18:20:07', '删除', 'del(\'/admin/comment/delete\')', 'mdi-message-bulleted-off', 0, 46, b'1', b'1');
INSERT INTO `menu` VALUES (48, '2020-04-16 19:28:48', '2021-07-28 18:28:03', '建议管理', '/admin/report/list', 'mdi-alert', 0, NULL, b'0', b'1');
INSERT INTO `menu` VALUES (49, '2020-04-16 19:30:31', '2021-07-28 18:28:15', '建议列表', '/admin/report/list', 'mdi-view-headline', 0, 48, b'0', b'1');
INSERT INTO `menu` VALUES (50, '2020-04-16 19:31:09', '2021-07-23 18:20:41', '删除', 'del(\'/admin/report/delete\')', 'mdi-close-box', 0, 49, b'1', b'1');
INSERT INTO `menu` VALUES (51, '2020-04-16 19:46:08', '2021-07-23 18:20:52', '新闻公告', '/admin/news/list', 'mdi-onenote', 0, NULL, b'0', b'1');
INSERT INTO `menu` VALUES (52, '2020-04-16 19:46:39', '2021-07-23 18:21:02', '公告列表', '/admin/news/list', 'mdi-book-open', 0, 51, b'0', b'1');
INSERT INTO `menu` VALUES (53, '2020-04-16 19:48:01', '2021-07-23 18:21:14', '添加', '/admin/news/add', 'mdi-plus', 0, 52, b'0', b'1');
INSERT INTO `menu` VALUES (54, '2020-04-16 19:48:46', '2021-07-23 18:21:24', '编辑', 'edit(\'/admin/news/edit\')', 'mdi-border-color', 0, 52, b'1', b'1');
INSERT INTO `menu` VALUES (55, '2020-04-16 19:49:37', '2021-07-23 18:21:35', '删除', 'del(\'/admin/news/delete\')', 'mdi-close', 0, 52, b'1', b'1');
INSERT INTO `menu` VALUES (56, '2020-04-18 14:25:58', '2021-07-23 18:21:44', '网站设置', '', 'mdi-settings', 0, NULL, b'0', b'1');
INSERT INTO `menu` VALUES (57, '2020-04-18 14:27:31', '2021-07-23 18:22:02', '友情链接', '/admin/friend_link/list', 'mdi-vector-line', 0, 56, b'0', b'1');
INSERT INTO `menu` VALUES (58, '2020-04-18 14:28:36', '2021-07-23 18:22:16', '添加', '/admin/friend_link/add', 'mdi-plus', 0, 57, b'0', b'1');
INSERT INTO `menu` VALUES (59, '2020-04-18 14:29:17', '2021-07-23 18:22:32', '编辑', 'edit(\'/admin/friend_link/edit\')', 'mdi-border-color', 0, 57, b'1', b'1');
INSERT INTO `menu` VALUES (60, '2020-04-18 14:29:45', '2021-07-23 18:22:46', '删除', 'del(\'/admin/friend_link/delete\')', 'mdi-close-box', 0, 57, b'1', b'1');
INSERT INTO `menu` VALUES (61, '2020-04-18 16:26:45', '2021-07-23 18:22:57', '站点设置', '/admin/site_setting/setting', 'mdi-wrench', 0, 56, b'0', b'1');
INSERT INTO `menu` VALUES (62, '2020-04-18 16:28:25', '2021-07-23 18:23:09', '提交修改', '/admin/site_setting/save_setting', 'mdi-marker-check', 0, 61, b'1', b'0');
INSERT INTO `menu` VALUES (63, '2021-03-08 14:02:42', '2021-07-29 18:09:43', '收购图书管理', '/admin/student_goods/list', 'mdi-clipboard-text', 25, 28, b'0', b'1');
INSERT INTO `menu` VALUES (64, '2021-03-08 16:36:53', '2021-07-29 18:09:53', '收购', '/admin/student_goods/purchase', 'mdi-currency-cny', 26, 63, b'0', b'0');
INSERT INTO `menu` VALUES (65, '2021-03-08 17:09:56', '2021-07-23 18:18:06', '编辑', 'edit(\'/admin/goods/edit\')', 'mdi-pencil', 0, 72, b'1', b'1');
INSERT INTO `menu` VALUES (66, '2021-03-09 15:20:12', '2021-07-23 18:23:20', '订单管理', '', 'mdi-file-document-box', 0, NULL, b'0', b'1');
INSERT INTO `menu` VALUES (67, '2021-03-09 15:21:00', '2021-07-23 18:23:31', '订单列表', '/admin/order_form/list', 'mdi-file-document', 0, 66, b'0', b'1');
INSERT INTO `menu` VALUES (70, '2020-04-01 20:35:09', '2021-07-29 17:58:45', '图书管理', '/admin/goods_category/list', 'mdi-book-open-variant', 0, NULL, b'0', b'1');
INSERT INTO `menu` VALUES (71, '2020-04-01 20:35:46', '2021-07-28 18:29:02', '图书分类列表', '/admin/goods_category/list', 'mdi-apps', 0, 70, b'0', b'1');
INSERT INTO `menu` VALUES (72, '2020-04-01 20:36:27', '2021-07-28 18:28:38', '前台图书列表', '/admin/goods/list', 'mdi-cart', 0, 70, b'0', b'1');
INSERT INTO `menu` VALUES (73, '2020-04-01 20:40:48', '2021-07-23 18:16:06', '添加', '/admin/goods_category/add', 'mdi-battery-positive', 0, 71, b'0', b'1');
INSERT INTO `menu` VALUES (74, '2020-04-01 20:41:33', '2021-07-23 18:16:16', '编辑', 'edit(\'/admin/goods_category/edit\')', 'mdi-border-color', 0, 71, b'1', b'1');
INSERT INTO `menu` VALUES (75, '2020-04-01 20:42:15', '2021-07-23 18:16:28', '删除', 'del(\'/admin/goods_category/delete\')', 'mdi-close', 0, 71, b'1', b'1');
INSERT INTO `menu` VALUES (76, '2020-04-13 18:52:12', '2021-07-23 18:16:58', '上架', 'up(\'/admin/goods/up_down\')', 'mdi-arrow-up-bold-box', 0, 72, b'1', b'1');
INSERT INTO `menu` VALUES (77, '2020-04-13 18:52:55', '2021-07-23 18:17:21', '下架', 'down(\'/admin/goods/up_down\')', 'mdi-arrow-down-bold-box', 0, 72, b'1', b'1');
INSERT INTO `menu` VALUES (78, '2020-04-13 18:54:10', '2021-07-23 18:17:35', '删除', 'del(\'/admin/goods/delete\')', 'mdi-close-box', 0, 72, b'1', b'1');
INSERT INTO `menu` VALUES (79, '2020-04-15 19:06:49', '2021-07-23 18:17:44', '推荐', 'recommend(\'/admin/goods/recommend\')', 'mdi-thumb-up', 0, 72, b'1', b'1');
INSERT INTO `menu` VALUES (80, '2020-04-15 19:07:45', '2021-07-23 18:17:54', '取消推荐', 'unrecommend(\'/admin/goods/recommend\')', 'mdi-thumb-down', 0, 72, b'1', b'1');
INSERT INTO `menu` VALUES (81, '2020-04-15 19:32:16', '2021-07-29 18:09:18', '求购管理', '/admin/wanted_goods/list', 'mdi-ticket', 22, 27, b'0', b'1');
INSERT INTO `menu` VALUES (82, '2020-04-15 19:32:55', '2021-07-29 18:09:26', '删除', 'del(\'/admin/wanted_goods/delete\')', 'mdi-close-box', 23, 81, b'1', b'1');
INSERT INTO `menu` VALUES (84, '2022-02-25 15:21:24', '2022-02-25 15:21:24', '流水管理', '', 'mdi-diamond', 32, NULL, b'0', b'1');
INSERT INTO `menu` VALUES (85, '2022-02-25 15:48:27', '2022-02-25 15:48:27', '消费记录', '/admin/money/consumption', 'mdi-menu', 0, 84, b'0', b'1');
INSERT INTO `menu` VALUES (86, '2022-02-25 16:23:51', '2022-02-25 16:23:51', '充值记录', '/admin/money/recharge', 'mdi-page-layout-body', 0, 84, b'0', b'1');
INSERT INTO `menu` VALUES (87, '2022-03-01 10:36:36', '2022-03-01 10:36:36', '充值', '/admin/money/add', 'mdi-plus-box-outline', 0, 86, b'0', b'1');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id主键',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后修改时间',
  `content` varchar(10024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '新闻内容',
  `sort` int NOT NULL COMMENT '顺序',
  `title` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `view_number` int NOT NULL COMMENT '浏览数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '新闻表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (1, '2020-04-16 21:29:17', '2022-03-17 22:54:30', '校园二手市场平台书籍', 2, '关于武汉高校校园二手书籍市场平台', 0);
INSERT INTO `news` VALUES (2, '2020-04-16 21:29:49', '2022-03-17 22:54:02', '1.禁止和限制发布物品管理规则\r\n2.重复铺书籍管理规则\r\n3.支付方式不符书籍管理规则\r\n4.书籍价格、邮费不符书籍管理规则\r\n5.信用炒作书籍管理规则', 0, '武汉高校校园二手市场发布书籍规则', 0);
INSERT INTO `news` VALUES (3, '2020-04-16 21:30:22', '2022-03-17 22:54:15', '注册时请填写详细的注册信息，学号为必填项。', 1, '武汉高校校园二手书籍账号注册规则', 0);

-- ----------------------------
-- Table structure for operater_log
-- ----------------------------
DROP TABLE IF EXISTS `operater_log`;
CREATE TABLE `operater_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id主键',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后修改时间',
  `content` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `operator` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 666 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of operater_log
-- ----------------------------
INSERT INTO `operater_log` VALUES (656, '2022-03-17 22:52:30', '2022-03-17 22:52:30', '用户【admin】于【2022-03-17 22:52:29】登录系统！', 'admin');
INSERT INTO `operater_log` VALUES (657, '2022-03-17 22:53:26', '2022-03-17 22:53:26', '数据库成功备份，备份文件信息：DatabaseBak [filename=campus_market_20220317225325.sql, filepath=D:/campus-market/src/main/resources/backup/]', 'admin');
INSERT INTO `operater_log` VALUES (658, '2022-03-17 22:54:02', '2022-03-17 22:54:02', '编辑新闻公告：News [title=武汉高校校园二手市场发布书籍规则, content=1.禁止和限制发布物品管理规则\r\n2.重复铺书籍管理规则\r\n3.支付方式不符书籍管理规则\r\n4.书籍价格、邮费不符书籍管理规则\r\n5.信用炒作书籍管理规则, viewNumber=0, sort=0]', 'admin');
INSERT INTO `operater_log` VALUES (659, '2022-03-17 22:54:15', '2022-03-17 22:54:15', '编辑新闻公告：News [title=五号高校校园二手书籍账号注册规则, content=注册时请填写详细的注册信息，学号为必填项。, viewNumber=0, sort=1]', 'admin');
INSERT INTO `operater_log` VALUES (660, '2022-03-17 22:54:31', '2022-03-17 22:54:31', '编辑新闻公告：News [title=关于武汉高校校园二手书籍市场平台, content=校园二手市场平台书籍, viewNumber=0, sort=2]', 'admin');
INSERT INTO `operater_log` VALUES (661, '2022-03-17 23:05:10', '2022-03-17 23:05:10', '用户【zou123】于【2022-03-17 23:05:09】登录系统！', 'zou123');
INSERT INTO `operater_log` VALUES (662, '2022-03-17 23:05:27', '2022-03-17 23:05:27', '数据库成功备份，备份文件信息：DatabaseBak [filename=campus_market_20220317230527.sql, filepath=D:/campus-market/src/main/resources/backup/]', 'zou123');
INSERT INTO `operater_log` VALUES (663, '2022-03-20 15:19:18', '2022-03-20 15:19:18', '用户【zou123】于【2022-03-20 15:19:17】登录系统！', 'zou123');
INSERT INTO `operater_log` VALUES (664, '2022-03-20 15:36:11', '2022-03-20 15:36:11', '用户【zou123】于【2022-03-20 15:36:10】登录系统！', 'zou123');
INSERT INTO `operater_log` VALUES (665, '2022-03-20 15:43:08', '2022-03-20 15:43:08', '用户【zou123】于【2022-03-20 15:43:08】登录系统！', 'zou123');
INSERT INTO `operater_log` VALUES (666, '2022-05-09 01:00:03', '2022-05-09 01:00:03', '数据库成功备份，备份文件信息：DatabaseBak [filename=campus_market_20220509010002.sql, filepath=D:/campus-market/src/main/resources/backup/]', '未知(获取登录用户失败)');

-- ----------------------------
-- Table structure for order_auth
-- ----------------------------
DROP TABLE IF EXISTS `order_auth`;
CREATE TABLE `order_auth`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id主键',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后修改时间',
  `mac` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'mac地址',
  `order_sn` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单编号',
  `phone` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单验证表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_auth
-- ----------------------------
INSERT INTO `order_auth` VALUES (10, '2022-01-29 14:46:00', '2022-01-29 14:46:00', '646C8056905F', '164342600219535467', '13387653281');

-- ----------------------------
-- Table structure for order_form
-- ----------------------------
DROP TABLE IF EXISTS `order_form`;
CREATE TABLE `order_form`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id主键',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后修改时间',
  `is_use` int NULL DEFAULT NULL COMMENT '是否使用优惠券',
  `pay_price` float NULL DEFAULT NULL COMMENT '支付价格',
  `sell_price` float NULL DEFAULT NULL COMMENT '售出价格',
  `goods_id` bigint NULL DEFAULT NULL COMMENT '商品id',
  `student_id` bigint NULL DEFAULT NULL COMMENT '购买人id',
  `place` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '送货地点',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK11yl4v8bca07chjxgak9i9scf`(`goods_id`) USING BTREE,
  INDEX `FKcj9lrmtuxci36bu3c3sn1m3t7`(`student_id`) USING BTREE,
  CONSTRAINT `FK11yl4v8bca07chjxgak9i9scf` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKcj9lrmtuxci36bu3c3sn1m3t7` FOREIGN KEY (`student_id`) REFERENCES `studnet` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单表单' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of order_form
-- ----------------------------
INSERT INTO `order_form` VALUES (1, '2021-07-29 14:15:04', '2021-07-29 14:15:04', 2, 20, 20, 79, 37, '上海大学');
INSERT INTO `order_form` VALUES (2, '2021-07-29 14:15:18', '2021-07-29 14:15:18', 2, 23, 23, 76, 37, '上海大学');
INSERT INTO `order_form` VALUES (3, '2022-01-29 15:54:21', '2022-01-29 15:54:21', 1, 40, 50, 83, 39, '北京');
INSERT INTO `order_form` VALUES (4, '2022-02-08 19:03:34', '2022-02-08 19:03:34', 2, 560, 560, 82, 40, '楼下');
INSERT INTO `order_form` VALUES (5, '2022-02-24 16:34:33', '2022-02-24 16:34:33', 2, 19, 19, 78, 2, 'hhh');
INSERT INTO `order_form` VALUES (6, '2022-02-24 17:20:20', '2022-02-24 17:20:20', 2, 36, 36, 81, 2, '11');
INSERT INTO `order_form` VALUES (7, '2022-02-25 10:13:43', '2022-02-25 10:13:43', 2, 34, 34, 80, 2, '222');
INSERT INTO `order_form` VALUES (8, '2022-02-25 10:24:06', '2022-02-25 10:24:06', 2, 50, 50, 77, 2, '333');
INSERT INTO `order_form` VALUES (9, '2022-02-25 10:50:12', '2022-02-25 10:50:12', 2, 20, 20, 67, 2, '1');
INSERT INTO `order_form` VALUES (10, '2022-02-25 10:52:07', '2022-02-25 10:52:07', 2, 20, 20, 69, 2, '2');
INSERT INTO `order_form` VALUES (11, '2022-03-01 17:16:43', '2022-03-01 17:16:43', 2, 20, 20, 79, 2, '11');
INSERT INTO `order_form` VALUES (12, '2022-05-08 15:10:35', '2022-05-08 15:10:35', 2, 36, 36, 89, 2, '1111');
INSERT INTO `order_form` VALUES (13, '2022-05-08 15:11:23', '2022-05-08 15:11:23', 2, 34, 34, 88, 2, '111');

-- ----------------------------
-- Table structure for recharge
-- ----------------------------
DROP TABLE IF EXISTS `recharge`;
CREATE TABLE `recharge`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `student_id` bigint NOT NULL COMMENT '学生id',
  `user_id` bigint NOT NULL COMMENT '管理员id',
  `create_time` datetime NOT NULL COMMENT '充值时间',
  `amount` float NOT NULL COMMENT '充值金额',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKggyjkmhgmad0rp2lqf429xnxp`(`student_id`) USING BTREE,
  INDEX `FK44gtncr84ef3208pp0quacgec`(`user_id`) USING BTREE,
  CONSTRAINT `FK44gtncr84ef3208pp0quacgec` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKggyjkmhgmad0rp2lqf429xnxp` FOREIGN KEY (`student_id`) REFERENCES `studnet` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '充值表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of recharge
-- ----------------------------
INSERT INTO `recharge` VALUES (1, 2, 1, '2022-02-23 11:22:18', 10, '2022-02-23 11:22:18', '线下充值');
INSERT INTO `recharge` VALUES (2, 2, 1, '2022-02-28 15:14:17', 20, '2022-02-28 15:14:21', '线下充值');
INSERT INTO `recharge` VALUES (3, 2, 1, '2022-02-28 15:14:41', 3, '2022-02-28 15:14:46', '线下充值');
INSERT INTO `recharge` VALUES (4, 2, 1, '2022-02-28 15:14:59', 3, '2022-02-28 15:15:03', '线下充值');
INSERT INTO `recharge` VALUES (5, 2, 1, '2022-02-28 15:15:50', 4, '2022-02-28 15:15:55', '线下充值');
INSERT INTO `recharge` VALUES (6, 2, 1, '2022-02-28 15:16:18', 100, '2022-02-28 15:16:25', '线下充值');
INSERT INTO `recharge` VALUES (7, 2, 1, '2022-02-28 15:16:43', 111, '2022-02-28 15:16:45', '线下充值');
INSERT INTO `recharge` VALUES (8, 2, 1, '2022-02-28 15:17:03', 333, '2022-02-28 15:17:07', '线下充值');
INSERT INTO `recharge` VALUES (9, 2, 1, '2022-02-16 15:17:18', 2, '2022-02-28 15:17:24', '线下充值');
INSERT INTO `recharge` VALUES (10, 2, 1, '2022-02-28 15:17:36', 22, '2022-02-16 15:17:40', '线下充值');
INSERT INTO `recharge` VALUES (11, 2, 1, '2022-02-28 15:17:50', 23, '2022-02-28 15:17:51', '线下充值');
INSERT INTO `recharge` VALUES (12, 4, 2, '2022-02-28 16:31:35', 2, '2022-02-28 16:31:39', '线上充值');
INSERT INTO `recharge` VALUES (13, 2, 1, '2022-03-01 14:50:14', 1, '2022-03-01 14:50:14', '线下充值');
INSERT INTO `recharge` VALUES (14, 2, 1, '2022-03-01 15:09:30', 100, '2022-03-01 15:09:30', '线下充值');
INSERT INTO `recharge` VALUES (15, 2, 1, '2022-03-01 15:15:10', 100, '2022-03-01 15:15:10', '线下充值');
INSERT INTO `recharge` VALUES (16, 40, 1, '2022-03-01 17:18:15', 100000000, '2022-03-01 17:18:15', '线下充值');
INSERT INTO `recharge` VALUES (17, 2, 1, '2022-03-01 17:18:45', 1.11111e18, '2022-03-01 17:18:45', '线下充值');

-- ----------------------------
-- Table structure for report_goods
-- ----------------------------
DROP TABLE IF EXISTS `report_goods`;
CREATE TABLE `report_goods`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id主键',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后修改时间',
  `content` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `goods_id` bigint NULL DEFAULT NULL COMMENT '商品id',
  `student_id` bigint NULL DEFAULT NULL COMMENT '学生id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK6g0s4688rq2bnty1u1ev1rgly`(`goods_id`) USING BTREE,
  INDEX `FKmr7s3q3jpq824h69f5ip9gleq`(`student_id`) USING BTREE,
  CONSTRAINT `FK6g0s4688rq2bnty1u1ev1rgly` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKmr7s3q3jpq824h69f5ip9gleq` FOREIGN KEY (`student_id`) REFERENCES `studnet` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '推荐商品表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of report_goods
-- ----------------------------
INSERT INTO `report_goods` VALUES (2, '2021-07-27 17:04:42', '2021-07-27 17:04:42', '该图书新的也没有这个贵', 69, 4);
INSERT INTO `report_goods` VALUES (3, '2021-07-29 14:12:46', '2021-07-29 14:12:46', '相关的介绍太少了', 83, 37);
INSERT INTO `report_goods` VALUES (4, '2021-07-29 14:13:18', '2021-07-29 14:13:18', '建议分开出售，一套太贵了', 82, 37);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id主键',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后修改时间',
  `name` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` int NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '2020-03-15 13:16:38', '2021-07-27 18:46:20', '超级管理员', '超级管理员拥有最高权限。', 1);
INSERT INTO `role` VALUES (2, '2020-03-15 13:18:57', '2020-03-21 22:18:43', '普通管理员', '普通管理员只有部分权限', 1);
INSERT INTO `role` VALUES (4, '2020-03-21 20:11:00', '2020-03-23 17:49:00', '测试角色', 'sadsa', 0);

-- ----------------------------
-- Table structure for role_authorities
-- ----------------------------
DROP TABLE IF EXISTS `role_authorities`;
CREATE TABLE `role_authorities`  (
  `role_id` bigint NOT NULL COMMENT '角色id',
  `authorities_id` bigint NOT NULL COMMENT '权限id',
  INDEX `FKhj7ap1o1cjrl7enr9arf5f2qp`(`authorities_id`) USING BTREE,
  INDEX `FKg3xdaexmr0x1qx8omhvjtk46d`(`role_id`) USING BTREE,
  CONSTRAINT `FKg3xdaexmr0x1qx8omhvjtk46d` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKhj7ap1o1cjrl7enr9arf5f2qp` FOREIGN KEY (`authorities_id`) REFERENCES `menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色权限关联表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of role_authorities
-- ----------------------------
INSERT INTO `role_authorities` VALUES (2, 2);
INSERT INTO `role_authorities` VALUES (2, 3);
INSERT INTO `role_authorities` VALUES (2, 5);
INSERT INTO `role_authorities` VALUES (2, 7);
INSERT INTO `role_authorities` VALUES (2, 11);
INSERT INTO `role_authorities` VALUES (2, 13);
INSERT INTO `role_authorities` VALUES (2, 16);
INSERT INTO `role_authorities` VALUES (4, 2);
INSERT INTO `role_authorities` VALUES (4, 13);
INSERT INTO `role_authorities` VALUES (4, 15);
INSERT INTO `role_authorities` VALUES (1, 2);
INSERT INTO `role_authorities` VALUES (1, 3);
INSERT INTO `role_authorities` VALUES (1, 5);
INSERT INTO `role_authorities` VALUES (1, 8);
INSERT INTO `role_authorities` VALUES (1, 9);
INSERT INTO `role_authorities` VALUES (1, 7);
INSERT INTO `role_authorities` VALUES (1, 10);
INSERT INTO `role_authorities` VALUES (1, 11);
INSERT INTO `role_authorities` VALUES (1, 12);
INSERT INTO `role_authorities` VALUES (1, 13);
INSERT INTO `role_authorities` VALUES (1, 14);
INSERT INTO `role_authorities` VALUES (1, 15);
INSERT INTO `role_authorities` VALUES (1, 16);
INSERT INTO `role_authorities` VALUES (1, 19);
INSERT INTO `role_authorities` VALUES (1, 20);
INSERT INTO `role_authorities` VALUES (1, 21);
INSERT INTO `role_authorities` VALUES (1, 22);
INSERT INTO `role_authorities` VALUES (1, 23);
INSERT INTO `role_authorities` VALUES (1, 24);
INSERT INTO `role_authorities` VALUES (1, 25);
INSERT INTO `role_authorities` VALUES (1, 26);
INSERT INTO `role_authorities` VALUES (1, 27);
INSERT INTO `role_authorities` VALUES (1, 81);
INSERT INTO `role_authorities` VALUES (1, 82);
INSERT INTO `role_authorities` VALUES (1, 28);
INSERT INTO `role_authorities` VALUES (1, 63);
INSERT INTO `role_authorities` VALUES (1, 64);
INSERT INTO `role_authorities` VALUES (1, 40);
INSERT INTO `role_authorities` VALUES (1, 41);
INSERT INTO `role_authorities` VALUES (1, 42);
INSERT INTO `role_authorities` VALUES (1, 43);
INSERT INTO `role_authorities` VALUES (1, 44);
INSERT INTO `role_authorities` VALUES (1, 45);
INSERT INTO `role_authorities` VALUES (1, 46);
INSERT INTO `role_authorities` VALUES (1, 47);
INSERT INTO `role_authorities` VALUES (1, 48);
INSERT INTO `role_authorities` VALUES (1, 49);
INSERT INTO `role_authorities` VALUES (1, 50);
INSERT INTO `role_authorities` VALUES (1, 51);
INSERT INTO `role_authorities` VALUES (1, 52);
INSERT INTO `role_authorities` VALUES (1, 53);
INSERT INTO `role_authorities` VALUES (1, 54);
INSERT INTO `role_authorities` VALUES (1, 55);
INSERT INTO `role_authorities` VALUES (1, 56);
INSERT INTO `role_authorities` VALUES (1, 57);
INSERT INTO `role_authorities` VALUES (1, 58);
INSERT INTO `role_authorities` VALUES (1, 59);
INSERT INTO `role_authorities` VALUES (1, 60);
INSERT INTO `role_authorities` VALUES (1, 61);
INSERT INTO `role_authorities` VALUES (1, 62);
INSERT INTO `role_authorities` VALUES (1, 66);
INSERT INTO `role_authorities` VALUES (1, 67);
INSERT INTO `role_authorities` VALUES (1, 70);
INSERT INTO `role_authorities` VALUES (1, 71);
INSERT INTO `role_authorities` VALUES (1, 73);
INSERT INTO `role_authorities` VALUES (1, 74);
INSERT INTO `role_authorities` VALUES (1, 75);
INSERT INTO `role_authorities` VALUES (1, 72);
INSERT INTO `role_authorities` VALUES (1, 65);
INSERT INTO `role_authorities` VALUES (1, 76);
INSERT INTO `role_authorities` VALUES (1, 77);
INSERT INTO `role_authorities` VALUES (1, 78);
INSERT INTO `role_authorities` VALUES (1, 79);
INSERT INTO `role_authorities` VALUES (1, 80);
INSERT INTO `role_authorities` VALUES (1, 84);
INSERT INTO `role_authorities` VALUES (1, 85);
INSERT INTO `role_authorities` VALUES (1, 86);
INSERT INTO `role_authorities` VALUES (1, 87);

-- ----------------------------
-- Table structure for site_setting
-- ----------------------------
DROP TABLE IF EXISTS `site_setting`;
CREATE TABLE `site_setting`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id主键',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后修改时间',
  `all_rights` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '版权所有',
  `logo_1` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'logo1 url',
  `logo_2` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'logo2 url',
  `qrcode` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrcode url',
  `site_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网站名称',
  `site_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网站url',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '网站设置表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of site_setting
-- ----------------------------
INSERT INTO `site_setting` VALUES (1, '2020-04-18 17:02:17', '2022-01-29 16:19:17', '©2022 邹振杨 开发', '20220129/1643444335976.png', '20220129/1643444349610.png', '20220129/1643444354384.png', '武汉高校二手教材交易系统', 'localhost');

-- ----------------------------
-- Table structure for student_goods
-- ----------------------------
DROP TABLE IF EXISTS `student_goods`;
CREATE TABLE `student_goods`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id主键',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后修改时间',
  `buy_price` float NOT NULL COMMENT '买入价格',
  `content` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `photo` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '照片',
  `sell_price` float NOT NULL COMMENT '卖出价格',
  `status` int NOT NULL COMMENT '状态',
  `goods_category_id` bigint NULL DEFAULT NULL COMMENT '商品种类id',
  `student_id` bigint NULL DEFAULT NULL COMMENT '学生id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK63xin129lr9gu2ebayil16qff`(`goods_category_id`) USING BTREE,
  INDEX `FKgn6djcsfmc7c7yu3prds04gtn`(`student_id`) USING BTREE,
  CONSTRAINT `FK63xin129lr9gu2ebayil16qff` FOREIGN KEY (`goods_category_id`) REFERENCES `goods_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKgn6djcsfmc7c7yu3prds04gtn` FOREIGN KEY (`student_id`) REFERENCES `studnet` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '学生申请卖出商品表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of student_goods
-- ----------------------------
INSERT INTO `student_goods` VALUES (26, '2021-07-27 16:38:21', '2021-07-27 16:39:16', 47.6, '开 本：16开              纸 张：胶版纸                                    \r\n包 装：平装-胶订         是否套装：否国际标准书号ISBN：9787040396638', '高等数学（第七版）（上册）', '20210727/1627374920745.jpg', 20, 2, 9, 37);
INSERT INTO `student_goods` VALUES (27, '2021-07-27 16:41:48', '2021-07-27 16:45:53', 198, '开 本：16开   纸 张：胶版纸    包 装：平装-胶订  是否套装：是    \r\n  国际标准书号ISBN：28965526', '经济学原理（第8版）(套装微观经济学', '20210727/1627375270797.jpg', 100, 2, 9, 37);
INSERT INTO `student_goods` VALUES (28, '2021-07-27 16:43:41', '2021-07-27 16:45:54', 50, '开 本：16开   纸 张：胶版纸   包 装：平装-胶订  是否套装：否   国际标准书号ISBN：9787115435590   丛书名：图灵数学·统计学丛书', '普林斯顿微积分读本（修订版）', '20210727/1627375367494.jpg', 20, 2, 9, 37);
INSERT INTO `student_goods` VALUES (29, '2021-07-27 16:45:31', '2021-07-27 16:45:51', 50, '开 本：16开   纸 张：胶版纸  包 装：平装-胶订  是否套装：否   国际标准书号ISBN：9787303236879   丛书名：新世纪高等学校教材 心理学基础课系列教材\r\n\r\n\r\n它既是心理学专业的基础课教材，也是相关专业和心理学爱好者的入门教材，还是部分高校招收心理学博、硕士研究生的重要参考教材', '普通心理学(第5版）', '20210727/1627375530150.jpg', 20, 2, 11, 37);
INSERT INTO `student_goods` VALUES (30, '2021-07-27 16:50:48', '2021-07-28 15:54:55', 25, '开 本：32开   纸 张：轻型纸   包 装：精装   是否套装：否   国际标准书号ISBN：9787020162925\r\n叛逆者 邮差 氰化钾 胭脂 《人民文学》奖 《上海文学》奖 中国作家出版集团奖', '叛逆者（定制明信片版，朱一龙主演）', '20210727/1627375775548.jpg', 15, 2, 20, 4);
INSERT INTO `student_goods` VALUES (31, '2021-07-27 16:54:36', '2021-07-28 15:54:57', 30, '罗翔推荐！荣获日本推理小说至高荣誉江户川乱步奖！是否值得为一场痛快的复仇，陪葬掉自己的人生？', '消失的13级台阶', '20210727/1627376069270.jpg', 15, 2, 18, 4);
INSERT INTO `student_goods` VALUES (32, '2021-07-28 18:01:51', '2021-07-28 18:14:07', 35, '特别懂年轻人的知名自媒体“原来是柒公子”首部文集。从未想过安分过一生，也注定有人愿与你同行。\r\n开 本：32开  纸 张：胶版纸   包 装：平装-胶订  是否套装：否      国际标准书号ISBN：9787517096610', '总有人喜欢你的奇奇怪怪', '20210728/1627466509612.jpg', 20, 2, 24, 38);
INSERT INTO `student_goods` VALUES (33, '2021-07-28 18:03:26', '2021-07-28 18:14:05', 54, '山河令男主张哲瀚推荐！\r\n开 本：32开   纸 张：胶版纸   包 装：平装-胶订   是否套装：否   国际标准书号ISBN：9787540483548', '嘿，小家伙', '20210728/1627466605383.jpg', 19, 2, 24, 38);
INSERT INTO `student_goods` VALUES (34, '2021-07-28 18:05:07', '2021-07-28 18:14:02', 169, '畅销书作家木苏里无限流幻想小说力作，高人气原创作品，从光怪陆离的设定到有血有肉的人物且看秦究游惑如何带一众小伙伴从凄冷风雪走到熙攘人间!\r\n', '全球高考收藏版礼盒', '20210728/1627466686862.jpg', 50, 2, 24, 38);
INSERT INTO `student_goods` VALUES (35, '2021-07-28 18:06:04', '2021-07-28 18:14:00', 54, '《撒野》热血兄弟篇！高燃继续，重磅来袭！新增出版番外！随书附赠人物海报+双面卡册+Q萌贴纸+书签。当当独家专享印签本！', '轻狂2 畅销书作家巫哲燃情力作 当当', '20210728/1627466762307.jpg', 23, 2, 24, 38);
INSERT INTO `student_goods` VALUES (36, '2021-07-28 18:07:41', '2021-07-28 18:13:54', 64, '开 本：32开  纸 张：胶版纸   包 装：平装-胶订  是否套装：否    国际标准书号ISBN：9787020170760', '三生三世步生莲 贰·神祈（B版：限量', '20210728/1627466806697.jpg', 32, 2, 22, 38);
INSERT INTO `student_goods` VALUES (37, '2021-07-28 18:09:19', '2021-07-28 18:13:56', 62, '唐七作品，三生三世系列，东华和凤九的故事。畅销百万册言情经典作品全新再版，新增作者序言解密【三生】系列未来规划。', '三生三世枕上书. 全二册', '20210728/1627466938937.jpg', 32, 2, 22, 38);
INSERT INTO `student_goods` VALUES (38, '2021-07-28 18:11:13', '2021-07-28 18:13:58', 114, '宫闱秘史、珍馐美味；济世名臣、末代公子 这里的故事传奇且精彩', '“高阳谈中国历史”系列（套装6册）', '20210728/1627467036695.jpg', 56, 2, 11, 38);
INSERT INTO `student_goods` VALUES (39, '2021-07-28 18:13:13', '2021-07-28 18:13:44', 67, '看懂罗马，就能看懂世界。东京大学古罗马史教授倾囊相授，非传统意义上的“罗马通史”，宏大视角，多维解读，于罗马帝国的兴衰洪流中感知历史深处的规律与真相 ', '罗马兴衰1200年', '20210728/1627467192044.jpg', 32, 2, 11, 38);
INSERT INTO `student_goods` VALUES (40, '2021-07-28 18:25:20', '2022-03-01 15:53:29', 72, '中国古代海权史经典之作！从海洋的角度看中国史！翻开本书，从战争、贸易、文化等方面，看清古代中国如何一步步成为海洋强国！\r\n古代中国其实是一个海洋强国！造船技术世界当先，航海足迹远至东非，傲视东方海域数百年！从海洋看中国史', '被遗忘的海上中国史', '20210728/1627467865716.jpg', 36, 2, 11, 38);
INSERT INTO `student_goods` VALUES (41, '2021-07-28 18:26:47', '2022-03-01 15:53:27', 68, '以考古出土的青铜面具、青铜人像、青铜神树、玉琮、玉璋、黄金面具等实物为依托，系统描述了古蜀文明三星堆的全貌。对中华文明与三星堆文明的关系做了解码似的揭示，解读三星堆文化的来龙去脉及其与长江流域、黄河流', ' 三星堆：开启中华文明之门（精装版）', '20210728/1627467989100.jpg', 34, 2, 11, 38);
INSERT INTO `student_goods` VALUES (42, '2021-07-29 14:04:13', '2022-03-01 15:53:25', 102, '开 本：32开  纸 张：胶版纸   包 装：精装   是否套装：否   国际标准书号ISBN：9787100099806', '古代汉语词典（精装）(第2版)', '20210729/1627538616020.jpg', 50, 2, 11, 37);
INSERT INTO `student_goods` VALUES (43, '2021-07-29 14:05:41', '2022-03-01 15:53:24', 1024, '开 本：32开   纸 张：胶版纸   包 装：精装   是否套装：是   国际标准书号ISBN：9787101098570', '资治通鉴（全12册·中华国学文库）', '20210729/1627538707357.jpg', 560, 2, 11, 37);
INSERT INTO `student_goods` VALUES (44, '2022-01-29 15:55:17', '2022-03-01 15:53:22', 12, '12312312312发打发士大夫撒打发', '我的书', '20220129/1643442901485.png', 11, 2, 51, 39);
INSERT INTO `student_goods` VALUES (45, '2022-03-01 15:35:36', '2022-03-01 15:53:20', 100, '计算机网络计算机网络计算机网络计算机网络计算机网络计算机网络计算机网络', '计算机网络', '20220301/1646120103481.jpg', 10, 2, 26, 2);
INSERT INTO `student_goods` VALUES (46, '2022-03-01 16:35:23', '2022-03-01 16:35:36', 200, '啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊 ', '计网', '20220301/1646123694505.jpg', 1, 2, 23, 2);

-- ----------------------------
-- Table structure for studnet
-- ----------------------------
DROP TABLE IF EXISTS `studnet`;
CREATE TABLE `studnet`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id主键',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后更新时间',
  `academy` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业',
  `grade` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班级',
  `mobile` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `nickname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `qq` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'qq',
  `school` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学校',
  `sn` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学号',
  `head_pic` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `status` int NULL DEFAULT NULL COMMENT '状态',
  `password` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `discount_coupon` int NULL DEFAULT NULL COMMENT '优惠券',
  `balance` float NULL DEFAULT NULL COMMENT '余额\r\n',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_5se32pxcytmbwgepjrjrdmvjr`(`sn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '学生表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of studnet
-- ----------------------------
INSERT INTO `studnet` VALUES (2, '2020-04-06 12:52:02', '2022-05-08 15:11:23', '计算机科学与技术学院', '软件1102', '13656565656', '猿来入此11', '11221232132', '东华大学', '158540174520', '20210723/1627033104103.jpeg', 1, '123456', 0, 999930);
INSERT INTO `studnet` VALUES (3, '2020-04-11 15:20:12', '2020-04-11 15:23:29', '计算机科学与技术学院', '计算机1103', '13946598956', '小猪爱佩琪', '11956256', '清华大学', '158540174521', '20210723/1627033129962.png', 1, '123456', 0, 10000);
INSERT INTO `studnet` VALUES (4, '2020-04-11 23:35:40', '2022-05-08 15:11:23', '材料学院', '材料1104', '13656569456', '会飞的小乌龟', '1658555644', '同济大学', '158540174522', '20210723/1627033104103.jpeg', 1, '123456', 0, 10034);
INSERT INTO `studnet` VALUES (36, '2021-03-10 11:16:28', '2022-05-08 15:10:36', '计算机科学与技术学院', '软件1103', '13656569456', '啦啦啦', '123456', '北京大学', '158540174523', '20210723/1627033129962.png', 1, '123456', 2, 10036);
INSERT INTO `studnet` VALUES (37, '2021-03-10 11:25:54', '2021-07-29 14:18:49', '计算机科学与技术学院', '软件1101', '13656569456', '猿来入此', '123456', '武汉纺织大学', '158540174524', '20210723/1627033129962.png', 1, '123456', 2, 10000);
INSERT INTO `studnet` VALUES (38, '2021-07-27 17:08:19', '2021-07-28 18:07:50', '经管', '会计1101', '13656569456', '呜呜呜', '2568877110', '武汉理工大学', '158540174519', '20210728/1627466870608.jpg', 1, '123456', 1, 10000);
INSERT INTO `studnet` VALUES (39, '2022-01-29 15:53:52', '2022-01-29 15:54:21', '城设', '搬砖2001', '13656569456', '哈哈哈', '111111', '武汉大学', '202939393922', '20210728/1627466870608.jpg', 1, '123456', 2, 10000);
INSERT INTO `studnet` VALUES (40, '2022-01-29 17:03:55', '2022-03-01 17:18:15', '土木', '打灰1901', '13656569456', '嘻嘻嘻', '2727251', '华中师范大学', '121212121212', '20210728/1627466870608.jpg', 1, '123456', 1, 100010000);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id主键',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后修改时间',
  `email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '有效',
  `head_pic` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `mobile` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `sex` int NULL DEFAULT NULL COMMENT '性别',
  `status` int NULL DEFAULT NULL COMMENT '状态',
  `username` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `role_id` bigint NULL DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_btsosjytrl4hu7fnm1intcpo8`(`username`) USING BTREE,
  INDEX `FKg09b8o67eu61st68rv6nk8npj`(`role_id`) USING BTREE,
  CONSTRAINT `FKg09b8o67eu61st68rv6nk8npj` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '2020-03-18 19:18:53', '2021-07-23 17:38:28', 'ylrc@qq.com', '20210723/1627033104103.jpeg', '1333333333', '123456', 2, 1, 'zou123', 1);
INSERT INTO `user` VALUES (2, '2022-02-28 16:30:41', '2022-02-28 16:30:44', '123@123.com', '20210723/1627033104103.jpeg', '1222222222', '123456', 1, 1, 'test', 1);

-- ----------------------------
-- Table structure for wanted_goods
-- ----------------------------
DROP TABLE IF EXISTS `wanted_goods`;
CREATE TABLE `wanted_goods`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id主键',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后更新时间',
  `content` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `sell_price` float NOT NULL COMMENT '收购价格',
  `trade_place` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '交易地点',
  `view_number` int NOT NULL COMMENT '浏览图',
  `student_id` bigint NULL DEFAULT NULL COMMENT '学生id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKqvrfd43yhp11er38hkfcxi103`(`student_id`) USING BTREE,
  CONSTRAINT `FKqvrfd43yhp11er38hkfcxi103` FOREIGN KEY (`student_id`) REFERENCES `studnet` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '心愿商品表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of wanted_goods
-- ----------------------------
INSERT INTO `wanted_goods` VALUES (10, '2021-07-27 16:56:55', '2021-07-27 16:56:55', '学习英语口语，有打算出手的联系我。qq:2567845120', '英语口语方面的书籍', 30, '校园里面', 0, 4);
INSERT INTO `wanted_goods` VALUES (11, '2021-07-27 17:00:51', '2021-07-27 17:00:51', '最近在看穿越剧，想参考一下。看看电视剧里面有多少是符合历史的', '明朝方面的历史书籍', 30, '校园里面', 0, 4);
INSERT INTO `wanted_goods` VALUES (12, '2021-07-29 14:09:58', '2021-07-29 14:09:58', '在学习礼仪文化，谁有这方面的书籍。求购', '礼仪文化', 30, '校园里面', 0, 37);
INSERT INTO `wanted_goods` VALUES (13, '2021-07-29 14:11:32', '2021-07-29 14:11:32', '想了解一下生肖方面的信息，谁有这方面的书籍', '生肖方面的书籍', 15, '校园里面', 0, 37);
INSERT INTO `wanted_goods` VALUES (14, '2022-01-29 15:55:55', '2022-01-29 15:55:55', '我想要2342342342发的发撒的', '这个书', 11, '光谷广场', 0, 39);

SET FOREIGN_KEY_CHECKS = 1;
