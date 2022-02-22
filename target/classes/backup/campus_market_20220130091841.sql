-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: campus_market
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ylrc_comment`
--

DROP TABLE IF EXISTS `ylrc_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ylrc_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `content` varchar(1024) NOT NULL,
  `reply_to` varchar(64) DEFAULT NULL,
  `goods_id` bigint DEFAULT NULL,
  `student_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKd01gnchhuj06oumqxrikccc3r` (`goods_id`),
  KEY `FKswirics8hhydki5ff0emtmbii` (`student_id`),
  CONSTRAINT `FKd01gnchhuj06oumqxrikccc3r` FOREIGN KEY (`goods_id`) REFERENCES `ylrc_goods` (`id`),
  CONSTRAINT `FKswirics8hhydki5ff0emtmbii` FOREIGN KEY (`student_id`) REFERENCES `ylrc_studnet` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_comment`
--

LOCK TABLES `ylrc_comment` WRITE;
/*!40000 ALTER TABLE `ylrc_comment` DISABLE KEYS */;
INSERT INTO `ylrc_comment` VALUES (1,'2021-07-27 17:02:25','2021-07-27 17:02:25','您好',NULL,69,4),(2,'2021-07-27 17:03:30','2021-07-27 17:03:30','这个书籍可以再便宜一些吗',NULL,69,4);
/*!40000 ALTER TABLE `ylrc_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_database_bak`
--

DROP TABLE IF EXISTS `ylrc_database_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ylrc_database_bak` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `filename` varchar(32) NOT NULL,
  `filepath` varchar(128) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_database_bak`
--

LOCK TABLES `ylrc_database_bak` WRITE;
/*!40000 ALTER TABLE `ylrc_database_bak` DISABLE KEYS */;
INSERT INTO `ylrc_database_bak` VALUES (34,'2021-07-27 16:27:40','2021-07-27 16:27:40','campus_market_20210727162740.sql','D:/BaiduNetdiskDownload1/xm/campus-market/src/main/resources/backup/'),(35,'2021-07-27 17:12:45','2021-07-27 17:12:45','campus_market_20210727171245.sql','D:/BaiduNetdiskDownload1/xm/campus-market/src/main/resources/backup/'),(36,'2021-07-28 18:29:07','2021-07-28 18:29:07','campus_market_20210728182907.sql','D:/BaiduNetdiskDownload1/xm/campus-market/src/main/resources/backup/'),(37,'2022-01-30 09:18:42','2022-01-30 09:18:42','campus_market_20220130091841.sql','D:/campus-market/src/main/resources/backup/');
/*!40000 ALTER TABLE `ylrc_database_bak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_friend_link`
--

DROP TABLE IF EXISTS `ylrc_friend_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ylrc_friend_link` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `name` varchar(64) NOT NULL,
  `sort` int NOT NULL,
  `url` varchar(256) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_friend_link`
--

LOCK TABLES `ylrc_friend_link` WRITE;
/*!40000 ALTER TABLE `ylrc_friend_link` DISABLE KEYS */;
INSERT INTO `ylrc_friend_link` VALUES (1,'2020-04-18 14:32:25','2021-07-27 11:26:29','猿来入此',1,'www.yuanlrc.com/?fuid=6666'),(11,'2020-04-18 15:49:20','2021-07-27 11:26:34','猿来入此Beta',0,'www.yuanlrc.com/?fuid=6666'),(15,'2020-04-18 15:59:56','2021-07-27 11:26:24','猿来入此A',2,'www.yuanlrc.com/?fuid=6666'),(16,'2020-04-18 16:00:20','2021-07-27 11:26:18','猿来入此B',3,'www.yuanlrc.com/?fuid=6666'),(17,'2020-04-18 16:00:31','2021-07-27 11:26:12','猿来入此C',4,'www.yuanlrc.com/?fuid=6666');
/*!40000 ALTER TABLE `ylrc_friend_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_goods`
--

DROP TABLE IF EXISTS `ylrc_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ylrc_goods` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `content` varchar(1024) NOT NULL,
  `name` varchar(32) NOT NULL,
  `photo` varchar(128) NOT NULL,
  `recommend` int NOT NULL,
  `sell_price` float NOT NULL,
  `status` int NOT NULL,
  `goods_category_id` bigint DEFAULT NULL,
  `view_number` int NOT NULL,
  `buy_price` float NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FKjtyl6pmb9j4aj64sm54xi1hbi` (`goods_category_id`) USING BTREE,
  CONSTRAINT `FKjtyl6pmb9j4aj64sm54xi1hbi` FOREIGN KEY (`goods_category_id`) REFERENCES `ylrc_goods_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_goods`
--

LOCK TABLES `ylrc_goods` WRITE;
/*!40000 ALTER TABLE `ylrc_goods` DISABLE KEYS */;
INSERT INTO `ylrc_goods` VALUES (67,'2021-07-27 16:45:51','2021-07-27 16:46:26','开 本：16开   纸 张：胶版纸  包 装：平装-胶订  是否套装：否   国际标准书号ISBN：9787303236879   丛书名：新世纪高等学校教材 心理学基础课系列教材\r\n\r\n\r\n它既是心理学专业的基础课教材，也是相关专业和心理学爱好者的入门教材，还是部分高校招收心理学博、硕士研究生的重要参考教材','普通心理学(第5版）','20210727/1627375530150.jpg',0,20,1,11,0,50),(69,'2021-07-27 16:45:54','2021-07-28 18:36:48','开 本：16开   纸 张：胶版纸   包 装：平装-胶订  是否套装：否   国际标准书号ISBN：9787115435590   丛书名：图灵数学·统计学丛书','普林斯顿微积分读本（修订版）','20210727/1627375367494.jpg',0,20,1,9,9,50),(70,'2021-07-28 15:54:55','2021-07-28 16:01:17','开 本：32开   纸 张：轻型纸   包 装：精装   是否套装：否   国际标准书号ISBN：9787020162925\r\n叛逆者 邮差 氰化钾 胭脂 《人民文学》奖 《上海文学》奖 中国作家出版集团奖','叛逆者（定制明信片版，朱一龙主演）','20210727/1627375775548.jpg',0,15,1,20,2,25),(71,'2021-07-28 15:54:57','2021-07-28 17:56:10','罗翔推荐！荣获日本推理小说至高荣誉江户川乱步奖！是否值得为一场痛快的复仇，陪葬掉自己的人生？','消失的13级台阶','20210727/1627376069270.jpg',0,15,1,18,44,30),(72,'2021-07-28 18:13:44','2021-07-28 18:14:25','看懂罗马，就能看懂世界。东京大学古罗马史教授倾囊相授，非传统意义上的“罗马通史”，宏大视角，多维解读，于罗马帝国的兴衰洪流中感知历史深处的规律与真相 ','罗马兴衰1200年','20210728/1627467192044.jpg',0,32,1,11,0,67),(73,'2021-07-28 18:13:54','2021-07-28 18:14:53','开 本：32开  纸 张：胶版纸   包 装：平装-胶订  是否套装：否    国际标准书号ISBN：9787020170760','三生三世步生莲 贰·神祈（B版：限量','20210728/1627466806697.jpg',0,32,1,22,0,64),(74,'2021-07-28 18:13:56','2021-07-28 18:14:50','唐七作品，三生三世系列，东华和凤九的故事。畅销百万册言情经典作品全新再版，新增作者序言解密【三生】系列未来规划。','三生三世枕上书. 全二册','20210728/1627466938937.jpg',0,32,1,22,0,62),(75,'2021-07-28 18:13:58','2022-01-29 17:51:04','宫闱秘史、珍馐美味；济世名臣、末代公子 这里的故事传奇且精彩','“高阳谈中国历史”系列（套装6册）','20210728/1627467036695.jpg',0,56,1,11,5,114),(76,'2021-07-28 18:14:00','2021-07-29 14:15:18','《撒野》热血兄弟篇！高燃继续，重磅来袭！新增出版番外！随书附赠人物海报+双面卡册+Q萌贴纸+书签。当当独家专享印签本！','轻狂2 畅销书作家巫哲燃情力作 当当','20210728/1627466762307.jpg',0,23,3,24,1,54),(77,'2021-07-28 18:14:02','2022-01-29 17:48:12','畅销书作家木苏里无限流幻想小说力作，高人气原创作品，从光怪陆离的设定到有血有肉的人物且看秦究游惑如何带一众小伙伴从凄冷风雪走到熙攘人间!\r\n','全球高考收藏版礼盒','20210728/1627466686862.jpg',0,50,1,24,1,169),(78,'2021-07-28 18:14:05','2021-07-28 18:14:33','山河令男主张哲瀚推荐！\r\n开 本：32开   纸 张：胶版纸   包 装：平装-胶订   是否套装：否   国际标准书号ISBN：9787540483548','嘿，小家伙','20210728/1627466605383.jpg',0,19,1,24,0,54),(79,'2021-07-28 18:14:07','2021-07-29 14:15:04','特别懂年轻人的知名自媒体“原来是柒公子”首部文集。从未想过安分过一生，也注定有人愿与你同行。\r\n开 本：32开  纸 张：胶版纸   包 装：平装-胶订  是否套装：否      国际标准书号ISBN：9787517096610','总有人喜欢你的奇奇怪怪','20210728/1627466509612.jpg',0,20,3,24,1,35),(80,'2021-07-28 18:26:56','2022-01-29 17:48:05','以考古出土的青铜面具、青铜人像、青铜神树、玉琮、玉璋、黄金面具等实物为依托，系统描述了古蜀文明三星堆的全貌。对中华文明与三星堆文明的关系做了解码似的揭示，解读三星堆文化的来龙去脉及其与长江流域、黄河流',' 三星堆：开启中华文明之门（精装版）','20210728/1627467989100.jpg',0,34,1,11,1,68),(81,'2021-07-28 18:26:58','2021-07-29 17:57:21','中国古代海权史经典之作！从海洋的角度看中国史！翻开本书，从战争、贸易、文化等方面，看清古代中国如何一步步成为海洋强国！\r\n古代中国其实是一个海洋强国！造船技术世界当先，航海足迹远至东非，傲视东方海域数百年！从海洋看中国史','被遗忘的海上中国史','20210728/1627467865716.jpg',0,36,1,11,9,72),(82,'2021-07-29 14:05:50','2022-01-29 17:47:11','开 本：32开   纸 张：胶版纸   包 装：精装   是否套装：是   国际标准书号ISBN：9787101098570','资治通鉴（全12册·中华国学文库）','20210729/1627538707357.jpg',0,560,1,11,4,1024),(83,'2021-07-29 14:05:52','2022-01-29 15:54:21','开 本：32开  纸 张：胶版纸   包 装：精装   是否套装：否   国际标准书号ISBN：9787100099806','古代汉语词典（精装）(第2版)','20210729/1627538616020.jpg',0,50,3,11,4,102);
/*!40000 ALTER TABLE `ylrc_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_goods_category`
--

DROP TABLE IF EXISTS `ylrc_goods_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ylrc_goods_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `icon` varchar(32) DEFAULT NULL,
  `name` varchar(18) NOT NULL,
  `sort` int NOT NULL,
  `parent_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FKos35mkmw4k5dvi4fi2govg2pa` (`parent_id`) USING BTREE,
  CONSTRAINT `FKos35mkmw4k5dvi4fi2govg2pa` FOREIGN KEY (`parent_id`) REFERENCES `ylrc_goods_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_goods_category`
--

LOCK TABLES `ylrc_goods_category` WRITE;
/*!40000 ALTER TABLE `ylrc_goods_category` DISABLE KEYS */;
INSERT INTO `ylrc_goods_category` VALUES (1,'2020-04-02 20:20:05','2021-07-27 15:58:34','20210727/1627372711692.png','特色书单',0,NULL),(4,'2020-04-02 20:26:45','2021-07-27 15:40:02','20210727/1627372711692.png','童书',1,1),(5,'2020-04-02 21:13:04','2021-07-27 15:40:40','20210727/1627372711692.png','文艺',2,1),(6,'2020-04-02 21:37:05','2021-07-27 15:40:55','20210727/1627372711692.png','社科',3,1),(7,'2020-04-02 21:37:23','2021-07-27 15:41:16','20210727/1627372711692.png','生活',4,1),(8,'2020-04-02 21:37:50','2021-07-27 15:41:35','20210727/1627372711692.png','人文教育',5,NULL),(9,'2020-04-02 21:38:08','2021-07-27 15:41:57','20210727/1627372711692.png','教材',6,8),(10,'2020-04-02 21:38:26','2021-07-27 15:42:11','20210727/1627372711692.png','外语',7,8),(11,'2020-04-02 21:38:45','2021-07-27 15:42:23','20210727/1627372711692.png','工具书',8,8),(15,'2020-04-05 18:46:54','2021-07-27 15:42:40','20210727/1627372711692.png','小说',9,NULL),(16,'2020-04-05 19:06:56','2020-04-05 19:07:20','20210727/1627372711692.png','中国古典小说',10,15),(17,'2020-04-05 19:07:45','2020-04-05 19:07:45','20210727/1627372711692.png','中国当代小说',11,15),(18,'2020-04-05 19:08:15','2020-04-05 19:08:15','20210727/1627372711692.png','外国小说',12,15),(19,'2020-04-05 19:08:44','2020-04-05 19:08:44','20210727/1627372711692.png','科幻小说',13,15),(20,'2020-04-05 19:09:04','2020-04-05 19:09:04','20210727/1627372711692.png','中国近现代小说',14,15),(21,'2020-04-05 19:10:14','2020-04-05 19:10:14','20210727/1627372711692.png','青春文学',15,NULL),(22,'2020-04-05 19:10:45','2020-04-05 19:10:45','20210727/1627372711692.png','古代言情',16,21),(23,'2020-04-05 19:11:08','2020-04-05 19:11:08','20210727/1627372711692.png','校园',17,21),(24,'2020-04-05 19:11:25','2020-04-05 19:11:25','20210727/1627372711692.png','大陆原创',18,21),(25,'2020-04-05 19:11:50','2020-04-05 19:11:50','20210727/1627372711692.png','成功励志',19,NULL),(26,'2020-04-05 19:12:13','2020-04-05 19:12:13','20210727/1627372711692.png','心灵与修养',20,25),(27,'2020-04-05 19:12:34','2020-04-05 19:12:34','20210727/1627372711692.png','性格与习惯',21,25),(28,'2020-04-05 19:12:53','2020-04-05 19:12:53','20210727/1627372711692.png','人在职场',22,25),(29,'2020-04-05 19:13:11','2020-04-05 19:13:11','20210727/1627372711692.png','处世学',23,25),(30,'2020-04-05 19:13:50','2020-04-05 19:13:50','20210727/1627372711692.png','科技',24,NULL),(31,'2020-04-05 19:14:15','2020-04-05 19:14:15','20210727/1627372711692.png','宇宙知识',25,30),(32,'2020-04-05 19:14:30','2020-04-05 19:14:30','20210727/1627372711692.png','百科知识',26,30),(33,'2020-04-05 19:14:48','2020-04-05 19:14:48','20210727/1627372711692.png','科学世界',27,30),(34,'2020-04-05 19:15:12','2020-04-05 19:15:12','20210727/1627372711692.png','生物世界',28,30),(35,'2020-04-05 19:15:29','2020-04-05 19:15:29','20210727/1627372711692.png','网络安全',29,30),(36,'2020-04-05 19:15:55','2020-04-05 19:15:55','20210727/1627372711692.png','中医学',30,30),(37,'2020-04-05 19:16:38','2020-04-05 19:16:38','20210727/1627372711692.png','工业技术',31,NULL),(38,'2020-04-05 19:17:05','2020-04-05 19:17:05','20210727/1627372711692.png','电工',32,37),(39,'2020-04-05 19:17:22','2020-04-05 19:17:22','20210727/1627372711692.png','化工',33,37),(40,'2020-04-05 19:17:39','2020-04-05 19:17:39','20210727/1627372711692.png','轻工',34,37),(41,'2020-04-05 19:18:00','2020-04-05 19:18:00','20210727/1627372711692.png','环境科学',35,37),(42,'2020-04-05 19:18:31','2020-04-05 19:18:31','20210727/1627372711692.png','艺术',36,NULL),(43,'2020-04-05 19:18:49','2020-04-05 19:18:49','20210727/1627372711692.png','民间艺术',37,42),(44,'2020-04-05 19:19:05','2020-04-05 19:19:05','20210727/1627372711692.png','建筑艺术',38,42),(45,'2020-04-05 19:19:24','2020-04-05 19:19:24','20210727/1627372711692.png','人体艺术',39,42),(46,'2020-04-05 19:19:54','2020-04-05 19:19:54','20210727/1627372711692.png','现代管理',40,NULL),(47,'2020-04-05 19:20:18','2020-04-05 19:20:18','20210727/1627372711692.png','经营管理',41,46),(48,'2020-04-05 19:20:35','2020-04-05 19:20:35','20210727/1627372711692.png','人力资源',42,46),(49,'2020-04-05 19:21:01','2020-04-05 19:21:01','20210727/1627372711692.png','组织学',43,46),(50,'2020-04-05 19:21:29','2020-04-05 19:21:29','20210727/1627372711692.png','财务会计',44,NULL),(51,'2020-04-05 19:21:47','2020-04-05 19:21:47','20210727/1627372711692.png','会计理论',45,50),(52,'2020-04-05 19:22:05','2020-04-05 19:22:05','20210727/1627372711692.png','成本会计',46,50),(53,'2020-04-05 19:22:29','2020-04-05 19:22:29','20210727/1627372711692.png','期刊杂志',46,NULL),(54,'2020-04-11 21:19:25','2021-07-23 18:25:45','20210727/1627372711692.png','外文杂志',47,21),(55,'2020-04-12 22:31:58','2021-07-23 18:26:11','20210727/1627372711692.png','专业期刊',48,53);
/*!40000 ALTER TABLE `ylrc_goods_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_menu`
--

DROP TABLE IF EXISTS `ylrc_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ylrc_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `name` varchar(18) NOT NULL,
  `url` varchar(128) DEFAULT NULL,
  `icon` varchar(32) DEFAULT NULL,
  `sort` int NOT NULL,
  `parent_id` bigint DEFAULT NULL,
  `is_bitton` bit(1) NOT NULL,
  `is_show` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FKsbtnjocfrq29e8taxdwo21gic` (`parent_id`) USING BTREE,
  CONSTRAINT `FKsbtnjocfrq29e8taxdwo21gic` FOREIGN KEY (`parent_id`) REFERENCES `ylrc_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_menu`
--

LOCK TABLES `ylrc_menu` WRITE;
/*!40000 ALTER TABLE `ylrc_menu` DISABLE KEYS */;
INSERT INTO `ylrc_menu` VALUES (2,'2020-03-14 14:26:03','2020-03-14 18:24:53','系统设置','','mdi-settings',0,NULL,_binary '\0',_binary ''),(3,'2020-03-14 16:58:55','2021-07-29 18:00:32','菜单管理','/admin/menu/list','mdi-view-list',1,2,_binary '\0',_binary ''),(5,'2020-03-14 17:04:44','2021-07-29 18:00:39','新增','/admin/menu/add','mdi-plus',2,3,_binary '\0',_binary ''),(7,'2020-03-14 17:07:43','2021-07-29 18:00:59','角色管理','/admin/role/list','mdi-account-settings-variant',5,2,_binary '\0',_binary ''),(8,'2020-03-14 18:28:48','2021-07-29 18:00:46','编辑','edit(\'/admin/menu/edit\')','mdi-grease-pencil',3,3,_binary '',_binary ''),(9,'2020-03-14 18:30:00','2021-07-29 18:00:53','删除','del(\'/admin/menu/delete\')','mdi-close',4,3,_binary '',_binary ''),(10,'2020-03-15 12:12:00','2021-07-29 18:02:56','添加','/admin/role/add','mdi-account-plus',6,7,_binary '\0',_binary ''),(11,'2020-03-15 12:12:36','2020-03-21 22:10:45','编辑','edit(\'/admin/role/edit\')','mdi-account-edit',7,7,_binary '',_binary ''),(12,'2020-03-15 12:13:19','2020-03-21 22:15:27','删除','del(\'/admin/role/delete\')','mdi-account-remove',8,7,_binary '',_binary ''),(13,'2020-03-15 12:14:52','2020-03-15 12:17:00','用户管理','/admin/user/list','mdi-account-multiple',9,2,_binary '\0',_binary ''),(14,'2020-03-15 12:15:22','2020-03-15 12:17:27','添加','/admin/user/add','mdi-account-plus',10,13,_binary '\0',_binary ''),(15,'2020-03-16 17:18:14','2020-03-21 22:11:19','编辑','edit(\'/admin/user/edit\')','mdi-account-edit',11,13,_binary '',_binary ''),(16,'2020-03-16 17:19:01','2020-03-21 22:15:36','删除','del(\'/admin/user/delete\')','mdi-account-remove',12,13,_binary '',_binary ''),(19,'2020-03-22 11:24:36','2021-07-23 18:14:20','上传图片','/admin/upload/upload_photo','mdi-arrow-up-bold-circle',13,13,_binary '\0',_binary '\0'),(20,'2020-03-22 14:09:35','2021-07-23 18:14:31','日志管理','/system/operator_log_list','mdi-tag-multiple',14,2,_binary '\0',_binary ''),(21,'2020-03-22 14:11:39','2021-07-23 18:14:39','删除','del(\'/system/delete_operator_log\')','mdi-tag-remove',15,20,_binary '',_binary ''),(22,'2020-03-22 14:12:57','2021-07-23 18:14:47','清空日志','delAll(\'/system/delete_all_operator_log\')','mdi-delete-circle',16,20,_binary '',_binary ''),(23,'2020-03-22 14:46:40','2021-07-23 18:14:56','数据备份','/admin/database_bak/list','mdi-database',17,2,_binary '\0',_binary ''),(24,'2020-03-22 14:48:07','2021-07-23 18:15:05','备份','add(\'/admin/database_bak/add\')','mdi-database-plus',18,23,_binary '',_binary ''),(25,'2020-03-22 14:49:03','2021-07-23 18:15:14','删除','del(\'/admin/database_bak/delete\')','mdi-database-minus',19,23,_binary '',_binary ''),(26,'2020-03-22 19:36:20','2021-07-23 18:15:22','还原','restore(\'/admin/database_bak/restore\')','mdi-database-minus',20,23,_binary '',_binary ''),(27,'2021-07-27 17:49:22','2021-07-29 18:09:10','求购管理','','mdi-book-open-variant',21,NULL,_binary '\0',_binary ''),(28,'2021-07-27 17:50:34','2021-07-29 18:09:34','收购管理','','mdi-book-open-page-variant',23,NULL,_binary '\0',_binary ''),(40,'2020-04-15 20:02:04','2021-07-29 18:10:01','学生管理','/admin/student/list','mdi-account-multiple',27,NULL,_binary '\0',_binary ''),(41,'2020-04-15 20:02:38','2021-07-29 18:10:12','学生列表','/admin/student/list','mdi-account-multiple',28,40,_binary '\0',_binary ''),(42,'2020-04-15 20:06:28','2021-07-29 18:10:21','冻结','freeze(\'/admin/student/update_status\')','mdi-account-settings-variant',29,41,_binary '',_binary ''),(43,'2020-04-15 20:06:59','2021-07-29 18:10:39','激活','openStudent(\'/admin/student/update_status\')','mdi-account-key',30,41,_binary '',_binary ''),(44,'2020-04-15 20:07:33','2021-07-29 18:11:07','删除','del(\'/admin/student/delete\')','mdi-account-remove',31,41,_binary '',_binary ''),(45,'2020-04-15 21:52:57','2021-07-23 18:19:49','评论管理','/admin/comment/list','mdi-comment-account',0,NULL,_binary '\0',_binary ''),(46,'2020-04-15 21:53:39','2021-07-23 18:19:58','评论列表','/admin/comment/list','mdi-comment-multiple-outline',0,45,_binary '\0',_binary ''),(47,'2020-04-15 21:54:35','2021-07-23 18:20:07','删除','del(\'/admin/comment/delete\')','mdi-message-bulleted-off',0,46,_binary '',_binary ''),(48,'2020-04-16 19:28:48','2021-07-28 18:28:03','建议管理','/admin/report/list','mdi-alert',0,NULL,_binary '\0',_binary ''),(49,'2020-04-16 19:30:31','2021-07-28 18:28:15','建议列表','/admin/report/list','mdi-view-headline',0,48,_binary '\0',_binary ''),(50,'2020-04-16 19:31:09','2021-07-23 18:20:41','删除','del(\'/admin/report/delete\')','mdi-close-box',0,49,_binary '',_binary ''),(51,'2020-04-16 19:46:08','2021-07-23 18:20:52','新闻公告','/admin/news/list','mdi-onenote',0,NULL,_binary '\0',_binary ''),(52,'2020-04-16 19:46:39','2021-07-23 18:21:02','公告列表','/admin/news/list','mdi-book-open',0,51,_binary '\0',_binary ''),(53,'2020-04-16 19:48:01','2021-07-23 18:21:14','添加','/admin/news/add','mdi-plus',0,52,_binary '\0',_binary ''),(54,'2020-04-16 19:48:46','2021-07-23 18:21:24','编辑','edit(\'/admin/news/edit\')','mdi-border-color',0,52,_binary '',_binary ''),(55,'2020-04-16 19:49:37','2021-07-23 18:21:35','删除','del(\'/admin/news/delete\')','mdi-close',0,52,_binary '',_binary ''),(56,'2020-04-18 14:25:58','2021-07-23 18:21:44','网站设置','','mdi-settings',0,NULL,_binary '\0',_binary ''),(57,'2020-04-18 14:27:31','2021-07-23 18:22:02','友情链接','/admin/friend_link/list','mdi-vector-line',0,56,_binary '\0',_binary ''),(58,'2020-04-18 14:28:36','2021-07-23 18:22:16','添加','/admin/friend_link/add','mdi-plus',0,57,_binary '\0',_binary ''),(59,'2020-04-18 14:29:17','2021-07-23 18:22:32','编辑','edit(\'/admin/friend_link/edit\')','mdi-border-color',0,57,_binary '',_binary ''),(60,'2020-04-18 14:29:45','2021-07-23 18:22:46','删除','del(\'/admin/friend_link/delete\')','mdi-close-box',0,57,_binary '',_binary ''),(61,'2020-04-18 16:26:45','2021-07-23 18:22:57','站点设置','/admin/site_setting/setting','mdi-wrench',0,56,_binary '\0',_binary ''),(62,'2020-04-18 16:28:25','2021-07-23 18:23:09','提交修改','/admin/site_setting/save_setting','mdi-marker-check',0,61,_binary '',_binary '\0'),(63,'2021-03-08 14:02:42','2021-07-29 18:09:43','收购图书管理','/admin/student_goods/list','mdi-clipboard-text',25,28,_binary '\0',_binary ''),(64,'2021-03-08 16:36:53','2021-07-29 18:09:53','收购','/admin/student_goods/purchase','mdi-currency-cny',26,63,_binary '\0',_binary '\0'),(65,'2021-03-08 17:09:56','2021-07-23 18:18:06','编辑','edit(\'/admin/goods/edit\')','mdi-pencil',0,72,_binary '',_binary ''),(66,'2021-03-09 15:20:12','2021-07-23 18:23:20','订单管理','','mdi-file-document-box',0,NULL,_binary '\0',_binary ''),(67,'2021-03-09 15:21:00','2021-07-23 18:23:31','订单列表','/admin/order_form/list','mdi-file-document',0,66,_binary '\0',_binary ''),(70,'2020-04-01 20:35:09','2021-07-29 17:58:45','图书管理','/admin/goods_category/list','mdi-book-open-variant',0,NULL,_binary '\0',_binary ''),(71,'2020-04-01 20:35:46','2021-07-28 18:29:02','图书分类列表','/admin/goods_category/list','mdi-apps',0,70,_binary '\0',_binary ''),(72,'2020-04-01 20:36:27','2021-07-28 18:28:38','前台图书列表','/admin/goods/list','mdi-cart',0,70,_binary '\0',_binary ''),(73,'2020-04-01 20:40:48','2021-07-23 18:16:06','添加','/admin/goods_category/add','mdi-battery-positive',0,71,_binary '\0',_binary ''),(74,'2020-04-01 20:41:33','2021-07-23 18:16:16','编辑','edit(\'/admin/goods_category/edit\')','mdi-border-color',0,71,_binary '',_binary ''),(75,'2020-04-01 20:42:15','2021-07-23 18:16:28','删除','del(\'/admin/goods_category/delete\')','mdi-close',0,71,_binary '',_binary ''),(76,'2020-04-13 18:52:12','2021-07-23 18:16:58','上架','up(\'/admin/goods/up_down\')','mdi-arrow-up-bold-box',0,72,_binary '',_binary ''),(77,'2020-04-13 18:52:55','2021-07-23 18:17:21','下架','down(\'/admin/goods/up_down\')','mdi-arrow-down-bold-box',0,72,_binary '',_binary ''),(78,'2020-04-13 18:54:10','2021-07-23 18:17:35','删除','del(\'/admin/goods/delete\')','mdi-close-box',0,72,_binary '',_binary ''),(79,'2020-04-15 19:06:49','2021-07-23 18:17:44','推荐','recommend(\'/admin/goods/recommend\')','mdi-thumb-up',0,72,_binary '',_binary ''),(80,'2020-04-15 19:07:45','2021-07-23 18:17:54','取消推荐','unrecommend(\'/admin/goods/recommend\')','mdi-thumb-down',0,72,_binary '',_binary ''),(81,'2020-04-15 19:32:16','2021-07-29 18:09:18','求购管理','/admin/wanted_goods/list','mdi-ticket',22,27,_binary '\0',_binary ''),(82,'2020-04-15 19:32:55','2021-07-29 18:09:26','删除','del(\'/admin/wanted_goods/delete\')','mdi-close-box',23,81,_binary '',_binary '');
/*!40000 ALTER TABLE `ylrc_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_news`
--

DROP TABLE IF EXISTS `ylrc_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ylrc_news` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `content` varchar(10024) NOT NULL,
  `sort` int NOT NULL,
  `title` varchar(1024) NOT NULL,
  `view_number` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_news`
--

LOCK TABLES `ylrc_news` WRITE;
/*!40000 ALTER TABLE `ylrc_news` DISABLE KEYS */;
INSERT INTO `ylrc_news` VALUES (1,'2020-04-16 21:29:17','2021-07-27 16:21:41','猿来入此校园二手市场平台书籍',2,'关于猿来入此校园二手书籍市场平台',0),(2,'2020-04-16 21:29:49','2021-09-12 19:55:34','1.禁止和限制发布物品管理规则\r\n2.重复铺书籍管理规则\r\n3.支付方式不符书籍管理规则\r\n4.书籍价格、邮费不符书籍管理规则\r\n5.信用炒作书籍管理规则',0,'猿来入此校园二手市场发布书籍规则',2),(3,'2020-04-16 21:30:22','2021-07-27 16:21:25','注册时请填写详细的注册信息，学号为必填项。',1,'猿来入此校园二手书籍账号注册规则',0);
/*!40000 ALTER TABLE `ylrc_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_operater_log`
--

DROP TABLE IF EXISTS `ylrc_operater_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ylrc_operater_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `content` varchar(1024) NOT NULL,
  `operator` varchar(18) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=577 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_operater_log`
--

LOCK TABLES `ylrc_operater_log` WRITE;
/*!40000 ALTER TABLE `ylrc_operater_log` DISABLE KEYS */;
INSERT INTO `ylrc_operater_log` VALUES (514,'2021-07-27 17:12:40','2021-07-27 17:12:40','用户【猿来入此】于【2021-07-27 17:12:40】登录系统！','猿来入此'),(515,'2021-07-27 17:12:45','2021-07-27 17:12:45','数据库成功备份，备份文件信息：DatabaseBak [filename=campus_market_20210727171245.sql, filepath=D:/BaiduNetdiskDownload1/xm/campus-market/src/main/resources/backup/]','猿来入此'),(516,'2021-07-27 17:39:51','2021-07-27 17:39:51','编辑菜单信息【Menu [name=求购图书, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=/admin/wanted_goods/list, icon=mdi-ticket, sort=33, isButton=false, isShow=true]】','猿来入此'),(517,'2021-07-27 17:40:50','2021-07-27 17:40:50','用户【猿来入此】于【2021-07-27 17:40:50】登录系统！','猿来入此'),(518,'2021-07-27 17:45:24','2021-07-27 17:45:24','编辑菜单信息【Menu [name=收购图书管理, parent=null, url=/admin/student_goods/list, icon=mdi-clipboard-text, sort=35, isButton=false, isShow=true]】','猿来入此'),(519,'2021-07-27 17:46:17','2021-07-27 17:46:17','编辑菜单信息【Menu [name=求购管理, parent=null, url=/admin/wanted_goods/list, icon=mdi-ticket, sort=33, isButton=false, isShow=true]】','猿来入此'),(520,'2021-07-27 17:46:35','2021-07-27 17:46:35','用户【猿来入此】于【2021-07-27 17:46:35】登录系统！','猿来入此'),(521,'2021-07-27 17:49:22','2021-07-27 17:49:22','添加菜单信息【Menu [name=求购管理, parent=null, url=, icon=mdi-book-open-variant, sort=0, isButton=false, isShow=true]】','猿来入此'),(522,'2021-07-27 17:49:51','2021-07-27 17:49:51','编辑菜单信息【Menu [name=求购管理, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=/admin/wanted_goods/list, icon=mdi-ticket, sort=33, isButton=false, isShow=true]】','猿来入此'),(523,'2021-07-27 17:50:34','2021-07-27 17:50:34','添加菜单信息【Menu [name=收购管理, parent=null, url=, icon=mdi-book-open-page-variant, sort=0, isButton=false, isShow=true]】','猿来入此'),(524,'2021-07-27 17:50:50','2021-07-27 17:50:50','编辑菜单信息【Menu [name=收购图书管理, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=/admin/student_goods/list, icon=mdi-clipboard-text, sort=35, isButton=false, isShow=true]】','猿来入此'),(525,'2021-07-27 17:51:00','2021-07-27 17:51:00','编辑角色【超级管理员】','猿来入此'),(526,'2021-07-27 17:51:14','2021-07-27 17:51:14','用户【猿来入此】于【2021-07-27 17:51:14】登录系统！','猿来入此'),(527,'2021-07-27 18:46:20','2021-07-27 18:46:20','编辑角色【超级管理员】','猿来入此'),(528,'2021-07-27 18:46:37','2021-07-27 18:46:37','用户【猿来入此】于【2021-07-27 18:46:37】登录系统！','猿来入此'),(529,'2021-07-28 15:23:45','2021-07-28 15:23:45','用户【猿来入此】于【2021-07-28 15:23:45】登录系统！','猿来入此'),(530,'2021-07-28 15:26:50','2021-07-28 15:26:50','用户【猿来入此】于【2021-07-28 15:26:50】登录系统！','猿来入此'),(531,'2021-07-28 17:57:46','2021-07-28 17:57:46','用户【猿来入此】于【2021-07-28 17:57:46】登录系统！','猿来入此'),(532,'2021-07-28 18:13:35','2021-07-28 18:13:35','用户【猿来入此】于【2021-07-28 18:13:35】登录系统！','猿来入此'),(533,'2021-07-28 18:28:03','2021-07-28 18:28:03','编辑菜单信息【Menu [name=建议管理, parent=null, url=/admin/report/list, icon=mdi-alert, sort=0, isButton=false, isShow=true]】','猿来入此'),(534,'2021-07-28 18:28:15','2021-07-28 18:28:15','编辑菜单信息【Menu [name=建议列表, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=/admin/report/list, icon=mdi-view-headline, sort=0, isButton=false, isShow=true]】','猿来入此'),(535,'2021-07-28 18:28:38','2021-07-28 18:28:38','编辑菜单信息【Menu [name=前台图书列表, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=/admin/goods/list, icon=mdi-cart, sort=0, isButton=false, isShow=true]】','猿来入此'),(536,'2021-07-28 18:29:02','2021-07-28 18:29:02','编辑菜单信息【Menu [name=图书分类列表, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=/admin/goods_category/list, icon=mdi-apps, sort=0, isButton=false, isShow=true]】','猿来入此'),(537,'2021-07-28 18:29:07','2021-07-28 18:29:07','数据库成功备份，备份文件信息：DatabaseBak [filename=campus_market_20210728182907.sql, filepath=D:/BaiduNetdiskDownload1/xm/campus-market/src/main/resources/backup/]','猿来入此'),(538,'2021-07-28 18:45:53','2021-07-28 18:45:53','用户【猿来入此】于【2021-07-28 18:45:53】登录系统！','猿来入此'),(539,'2021-07-29 13:31:25','2021-07-29 13:31:25','用户【猿来入此】于【2021-07-29 13:31:25】登录系统！','猿来入此'),(540,'2021-07-29 13:31:45','2021-07-29 13:31:45','修改网站设置:SiteSetting [siteName=猿来入此二手校园书籍交易网站, siteUrl=www.yuanlrc.com/?fuid=6666, logo1=20210723/1627034257059.png, logo2=20210729/1627536702317.png, qrcode=20210727/1627374443899.png, allRights=©2016-2021【猿来入此】 版权所有]','猿来入此'),(541,'2021-07-29 13:32:37','2021-07-29 13:32:37','修改网站设置:SiteSetting [siteName=猿来入此二手校园书籍交易网, siteUrl=www.yuanlrc.com/?fuid=6666, logo1=20210723/1627034257059.png, logo2=20210729/1627536702317.png, qrcode=20210727/1627374443899.png, allRights=©2016-2021【猿来入此】 版权所有]','猿来入此'),(542,'2021-07-29 13:59:39','2021-07-29 13:59:39','用户【猿来入此】于【2021-07-29 13:59:39】登录系统！','猿来入此'),(543,'2021-07-29 14:52:53','2021-07-29 14:52:53','用户【猿来入此】于【2021-07-29 14:52:53】登录系统！','猿来入此'),(544,'2021-07-29 17:58:03','2021-07-29 17:58:03','用户【猿来入此】于【2021-07-29 17:58:03】登录系统！','猿来入此'),(545,'2021-07-29 17:58:45','2021-07-29 17:58:45','编辑菜单信息【Menu [name=图书管理, parent=null, url=/admin/goods_category/list, icon=mdi-book-open-variant, sort=0, isButton=false, isShow=true]】','猿来入此'),(546,'2021-07-29 18:00:32','2021-07-29 18:00:32','编辑菜单信息【Menu [name=菜单管理, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=/admin/menu/list, icon=mdi-view-list, sort=1, isButton=false, isShow=true]】','猿来入此'),(547,'2021-07-29 18:00:39','2021-07-29 18:00:39','编辑菜单信息【Menu [name=新增, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=/admin/menu/add, icon=mdi-plus, sort=2, isButton=false, isShow=true]】','猿来入此'),(548,'2021-07-29 18:00:46','2021-07-29 18:00:46','编辑菜单信息【Menu [name=编辑, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=edit(\'/admin/menu/edit\'), icon=mdi-grease-pencil, sort=3, isButton=true, isShow=true]】','猿来入此'),(549,'2021-07-29 18:00:53','2021-07-29 18:00:53','编辑菜单信息【Menu [name=删除, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=del(\'/admin/menu/delete\'), icon=mdi-close, sort=4, isButton=true, isShow=true]】','猿来入此'),(550,'2021-07-29 18:00:59','2021-07-29 18:00:59','编辑菜单信息【Menu [name=角色管理, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=/admin/role/list, icon=mdi-account-settings-variant, sort=5, isButton=false, isShow=true]】','猿来入此'),(551,'2021-07-29 18:02:56','2021-07-29 18:02:56','编辑菜单信息【Menu [name=添加, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=/admin/role/add, icon=mdi-account-plus, sort=6, isButton=false, isShow=true]】','猿来入此'),(552,'2021-07-29 18:06:45','2021-07-29 18:06:45','用户【猿来入此】于【2021-07-29 18:06:45】登录系统！','猿来入此'),(553,'2021-07-29 18:09:10','2021-07-29 18:09:10','编辑菜单信息【Menu [name=求购管理, parent=null, url=, icon=mdi-book-open-variant, sort=21, isButton=false, isShow=true]】','猿来入此'),(554,'2021-07-29 18:09:18','2021-07-29 18:09:18','编辑菜单信息【Menu [name=求购管理, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=/admin/wanted_goods/list, icon=mdi-ticket, sort=22, isButton=false, isShow=true]】','猿来入此'),(555,'2021-07-29 18:09:26','2021-07-29 18:09:26','编辑菜单信息【Menu [name=删除, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=del(\'/admin/wanted_goods/delete\'), icon=mdi-close-box, sort=23, isButton=true, isShow=true]】','猿来入此'),(556,'2021-07-29 18:09:34','2021-07-29 18:09:34','编辑菜单信息【Menu [name=收购管理, parent=null, url=, icon=mdi-book-open-page-variant, sort=23, isButton=false, isShow=true]】','猿来入此'),(557,'2021-07-29 18:09:43','2021-07-29 18:09:43','编辑菜单信息【Menu [name=收购图书管理, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=/admin/student_goods/list, icon=mdi-clipboard-text, sort=25, isButton=false, isShow=true]】','猿来入此'),(558,'2021-07-29 18:09:53','2021-07-29 18:09:53','编辑菜单信息【Menu [name=收购, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=/admin/student_goods/purchase, icon=mdi-currency-cny, sort=26, isButton=false, isShow=false]】','猿来入此'),(559,'2021-07-29 18:10:01','2021-07-29 18:10:01','编辑菜单信息【Menu [name=学生管理, parent=null, url=/admin/student/list, icon=mdi-account-multiple, sort=27, isButton=false, isShow=true]】','猿来入此'),(560,'2021-07-29 18:10:12','2021-07-29 18:10:12','编辑菜单信息【Menu [name=学生列表, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=/admin/student/list, icon=mdi-account-multiple, sort=28, isButton=false, isShow=true]】','猿来入此'),(561,'2021-07-29 18:10:21','2021-07-29 18:10:21','编辑菜单信息【Menu [name=冻结, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=freeze(\'/admin/student/update_status\'), icon=mdi-account-settings-variant, sort=29, isButton=true, isShow=true]】','猿来入此'),(562,'2021-07-29 18:10:30','2021-07-29 18:10:30','编辑菜单信息【Menu [name=激活, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=openStudent(\'/admin/student/update_status\'), icon=mdi-account-key, sort=31, isButton=true, isShow=true]】','猿来入此'),(563,'2021-07-29 18:10:39','2021-07-29 18:10:39','编辑菜单信息【Menu [name=激活, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=openStudent(\'/admin/student/update_status\'), icon=mdi-account-key, sort=30, isButton=true, isShow=true]】','猿来入此'),(564,'2021-07-29 18:10:48','2021-07-29 18:10:48','编辑菜单信息【Menu [name=删除, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=del(\'/admin/student/delete\'), icon=mdi-account-remove, sort=32, isButton=true, isShow=true]】','猿来入此'),(565,'2021-07-29 18:10:57','2021-07-29 18:10:57','编辑菜单信息【Menu [name=删除, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=del(\'/admin/student/delete\'), icon=mdi-account-remove, sort=1, isButton=true, isShow=true]】','猿来入此'),(566,'2021-07-29 18:11:07','2021-07-29 18:11:07','编辑菜单信息【Menu [name=删除, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=del(\'/admin/student/delete\'), icon=mdi-account-remove, sort=13, isButton=true, isShow=true]】','猿来入此'),(567,'2021-09-12 19:52:09','2021-09-12 19:52:09','用户【猿来入此】于【2021-09-12 19:52:08】登录系统！','猿来入此'),(568,'2021-09-12 20:03:32','2021-09-12 20:03:32','用户【猿来入此】于【2021-09-12 20:03:32】登录系统！','猿来入此'),(569,'2021-09-12 20:07:25','2021-09-12 20:07:25','用户【猿来入此】于【2021-09-12 20:07:25】登录系统！','猿来入此'),(570,'2022-01-29 14:36:49','2022-01-29 14:36:49','用户【zou123】于【2022-01-29 14:36:49】登录系统！','zou123'),(571,'2022-01-29 15:13:51','2022-01-29 15:13:51','用户【zou123】于【2022-01-29 15:13:51】登录系统！','zou123'),(572,'2022-01-29 15:31:16','2022-01-29 15:31:16','修改网站设置:SiteSetting [siteName=武汉纺织大学二手书交易平台, siteUrl=localhost, logo1=20220129/1643441437236.png, logo2=20210729/1627536702317.png, qrcode=20210727/1627374443899.png, allRights=©2022 邹振杨 开发]','zou123'),(573,'2022-01-29 15:41:34','2022-01-29 15:41:34','修改网站设置:SiteSetting [siteName=武汉纺织大学二手书交易平台, siteUrl=localhost, logo1=20220129/1643442089284.png, logo2=20210729/1627536702317.png, qrcode=20210727/1627374443899.png, allRights=©2022 邹振杨 开发]','zou123'),(574,'2022-01-29 15:49:48','2022-01-29 15:49:48','修改网站设置:SiteSetting [siteName=武汉高校二手教材交易系统, siteUrl=localhost, logo1=20220129/1643442089284.png, logo2=20220129/1643442439817.png, qrcode=20220129/1643442546878.png, allRights=©2022 邹振杨 开发]','zou123'),(575,'2022-01-29 16:19:17','2022-01-29 16:19:17','修改网站设置:SiteSetting [siteName=武汉高校二手教材交易系统, siteUrl=localhost, logo1=20220129/1643444335976.png, logo2=20220129/1643444349610.png, qrcode=20220129/1643444354384.png, allRights=©2022 邹振杨 开发]','zou123'),(576,'2022-01-30 09:18:42','2022-01-30 09:18:42','数据库成功备份，备份文件信息：DatabaseBak [filename=campus_market_20220130091841.sql, filepath=D:/campus-market/src/main/resources/backup/]','未知(获取登录用户失败)');
/*!40000 ALTER TABLE `ylrc_operater_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_order_auth`
--

DROP TABLE IF EXISTS `ylrc_order_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ylrc_order_auth` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `mac` varchar(32) DEFAULT NULL,
  `order_sn` varchar(18) NOT NULL,
  `phone` varchar(12) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_order_auth`
--

LOCK TABLES `ylrc_order_auth` WRITE;
/*!40000 ALTER TABLE `ylrc_order_auth` DISABLE KEYS */;
INSERT INTO `ylrc_order_auth` VALUES (10,'2022-01-29 14:46:00','2022-01-29 14:46:00','646C8056905F','164342600219535467','13387653281');
/*!40000 ALTER TABLE `ylrc_order_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_order_form`
--

DROP TABLE IF EXISTS `ylrc_order_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ylrc_order_form` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `is_use` int DEFAULT NULL,
  `pay_price` float DEFAULT NULL,
  `sell_price` float DEFAULT NULL,
  `goods_id` bigint DEFAULT NULL,
  `student_id` bigint DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK11yl4v8bca07chjxgak9i9scf` (`goods_id`) USING BTREE,
  KEY `FKcj9lrmtuxci36bu3c3sn1m3t7` (`student_id`) USING BTREE,
  CONSTRAINT `FK11yl4v8bca07chjxgak9i9scf` FOREIGN KEY (`goods_id`) REFERENCES `ylrc_goods` (`id`),
  CONSTRAINT `FKcj9lrmtuxci36bu3c3sn1m3t7` FOREIGN KEY (`student_id`) REFERENCES `ylrc_studnet` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_order_form`
--

LOCK TABLES `ylrc_order_form` WRITE;
/*!40000 ALTER TABLE `ylrc_order_form` DISABLE KEYS */;
INSERT INTO `ylrc_order_form` VALUES (1,'2021-07-29 14:15:04','2021-07-29 14:15:04',2,20,20,79,37,'上海大学'),(2,'2021-07-29 14:15:18','2021-07-29 14:15:18',2,23,23,76,37,'上海大学'),(3,'2022-01-29 15:54:21','2022-01-29 15:54:21',1,40,50,83,39,'北京');
/*!40000 ALTER TABLE `ylrc_order_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_report_goods`
--

DROP TABLE IF EXISTS `ylrc_report_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ylrc_report_goods` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `content` varchar(1024) NOT NULL,
  `goods_id` bigint DEFAULT NULL,
  `student_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK6g0s4688rq2bnty1u1ev1rgly` (`goods_id`) USING BTREE,
  KEY `FKmr7s3q3jpq824h69f5ip9gleq` (`student_id`) USING BTREE,
  CONSTRAINT `FK6g0s4688rq2bnty1u1ev1rgly` FOREIGN KEY (`goods_id`) REFERENCES `ylrc_goods` (`id`),
  CONSTRAINT `FKmr7s3q3jpq824h69f5ip9gleq` FOREIGN KEY (`student_id`) REFERENCES `ylrc_studnet` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_report_goods`
--

LOCK TABLES `ylrc_report_goods` WRITE;
/*!40000 ALTER TABLE `ylrc_report_goods` DISABLE KEYS */;
INSERT INTO `ylrc_report_goods` VALUES (2,'2021-07-27 17:04:42','2021-07-27 17:04:42','该图书新的也没有这个贵',69,4),(3,'2021-07-29 14:12:46','2021-07-29 14:12:46','相关的介绍太少了',83,37),(4,'2021-07-29 14:13:18','2021-07-29 14:13:18','建议分开出售，一套太贵了',82,37);
/*!40000 ALTER TABLE `ylrc_report_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_role`
--

DROP TABLE IF EXISTS `ylrc_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ylrc_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `name` varchar(18) NOT NULL,
  `remark` varchar(128) DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_role`
--

LOCK TABLES `ylrc_role` WRITE;
/*!40000 ALTER TABLE `ylrc_role` DISABLE KEYS */;
INSERT INTO `ylrc_role` VALUES (1,'2020-03-15 13:16:38','2021-07-27 18:46:20','超级管理员','超级管理员拥有最高权限。',1),(2,'2020-03-15 13:18:57','2020-03-21 22:18:43','普通管理员','普通管理员只有部分权限',1),(4,'2020-03-21 20:11:00','2020-03-23 17:49:00','测试角色','sadsa',0);
/*!40000 ALTER TABLE `ylrc_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_role_authorities`
--

DROP TABLE IF EXISTS `ylrc_role_authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ylrc_role_authorities` (
  `role_id` bigint NOT NULL,
  `authorities_id` bigint NOT NULL,
  KEY `FKhj7ap1o1cjrl7enr9arf5f2qp` (`authorities_id`) USING BTREE,
  KEY `FKg3xdaexmr0x1qx8omhvjtk46d` (`role_id`) USING BTREE,
  CONSTRAINT `FKg3xdaexmr0x1qx8omhvjtk46d` FOREIGN KEY (`role_id`) REFERENCES `ylrc_role` (`id`),
  CONSTRAINT `FKhj7ap1o1cjrl7enr9arf5f2qp` FOREIGN KEY (`authorities_id`) REFERENCES `ylrc_menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_role_authorities`
--

LOCK TABLES `ylrc_role_authorities` WRITE;
/*!40000 ALTER TABLE `ylrc_role_authorities` DISABLE KEYS */;
INSERT INTO `ylrc_role_authorities` VALUES (2,2),(2,3),(2,5),(2,7),(2,11),(2,13),(2,16),(4,2),(4,13),(4,15),(1,2),(1,3),(1,5),(1,8),(1,9),(1,7),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,19),(1,20),(1,21),(1,22),(1,23),(1,24),(1,25),(1,26),(1,27),(1,81),(1,82),(1,28),(1,63),(1,64),(1,40),(1,41),(1,42),(1,43),(1,44),(1,45),(1,46),(1,47),(1,48),(1,49),(1,50),(1,51),(1,52),(1,53),(1,54),(1,55),(1,56),(1,57),(1,58),(1,59),(1,60),(1,61),(1,62),(1,66),(1,67),(1,70),(1,71),(1,73),(1,74),(1,75),(1,72),(1,65),(1,76),(1,77),(1,78),(1,79),(1,80);
/*!40000 ALTER TABLE `ylrc_role_authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_site_setting`
--

DROP TABLE IF EXISTS `ylrc_site_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ylrc_site_setting` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `all_rights` varchar(256) NOT NULL,
  `logo_1` varchar(256) NOT NULL,
  `logo_2` varchar(256) NOT NULL,
  `qrcode` varchar(256) NOT NULL,
  `site_name` varchar(128) NOT NULL,
  `site_url` varchar(256) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_site_setting`
--

LOCK TABLES `ylrc_site_setting` WRITE;
/*!40000 ALTER TABLE `ylrc_site_setting` DISABLE KEYS */;
INSERT INTO `ylrc_site_setting` VALUES (1,'2020-04-18 17:02:17','2022-01-29 16:19:17','©2022 邹振杨 开发','20220129/1643444335976.png','20220129/1643444349610.png','20220129/1643444354384.png','武汉高校二手教材交易系统','localhost');
/*!40000 ALTER TABLE `ylrc_site_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_student_goods`
--

DROP TABLE IF EXISTS `ylrc_student_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ylrc_student_goods` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `buy_price` float NOT NULL,
  `content` varchar(1024) NOT NULL,
  `name` varchar(32) NOT NULL,
  `photo` varchar(128) NOT NULL,
  `sell_price` float NOT NULL,
  `status` int NOT NULL,
  `goods_category_id` bigint DEFAULT NULL,
  `student_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK63xin129lr9gu2ebayil16qff` (`goods_category_id`) USING BTREE,
  KEY `FKgn6djcsfmc7c7yu3prds04gtn` (`student_id`) USING BTREE,
  CONSTRAINT `FK63xin129lr9gu2ebayil16qff` FOREIGN KEY (`goods_category_id`) REFERENCES `ylrc_goods_category` (`id`),
  CONSTRAINT `FKgn6djcsfmc7c7yu3prds04gtn` FOREIGN KEY (`student_id`) REFERENCES `ylrc_studnet` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_student_goods`
--

LOCK TABLES `ylrc_student_goods` WRITE;
/*!40000 ALTER TABLE `ylrc_student_goods` DISABLE KEYS */;
INSERT INTO `ylrc_student_goods` VALUES (26,'2021-07-27 16:38:21','2021-07-27 16:39:16',47.6,'开 本：16开              纸 张：胶版纸                                    \r\n包 装：平装-胶订         是否套装：否国际标准书号ISBN：9787040396638','高等数学（第七版）（上册）','20210727/1627374920745.jpg',20,2,9,37),(27,'2021-07-27 16:41:48','2021-07-27 16:45:53',198,'开 本：16开   纸 张：胶版纸    包 装：平装-胶订  是否套装：是    \r\n  国际标准书号ISBN：28965526','经济学原理（第8版）(套装微观经济学','20210727/1627375270797.jpg',100,2,9,37),(28,'2021-07-27 16:43:41','2021-07-27 16:45:54',50,'开 本：16开   纸 张：胶版纸   包 装：平装-胶订  是否套装：否   国际标准书号ISBN：9787115435590   丛书名：图灵数学·统计学丛书','普林斯顿微积分读本（修订版）','20210727/1627375367494.jpg',20,2,9,37),(29,'2021-07-27 16:45:31','2021-07-27 16:45:51',50,'开 本：16开   纸 张：胶版纸  包 装：平装-胶订  是否套装：否   国际标准书号ISBN：9787303236879   丛书名：新世纪高等学校教材 心理学基础课系列教材\r\n\r\n\r\n它既是心理学专业的基础课教材，也是相关专业和心理学爱好者的入门教材，还是部分高校招收心理学博、硕士研究生的重要参考教材','普通心理学(第5版）','20210727/1627375530150.jpg',20,2,11,37),(30,'2021-07-27 16:50:48','2021-07-28 15:54:55',25,'开 本：32开   纸 张：轻型纸   包 装：精装   是否套装：否   国际标准书号ISBN：9787020162925\r\n叛逆者 邮差 氰化钾 胭脂 《人民文学》奖 《上海文学》奖 中国作家出版集团奖','叛逆者（定制明信片版，朱一龙主演）','20210727/1627375775548.jpg',15,2,20,4),(31,'2021-07-27 16:54:36','2021-07-28 15:54:57',30,'罗翔推荐！荣获日本推理小说至高荣誉江户川乱步奖！是否值得为一场痛快的复仇，陪葬掉自己的人生？','消失的13级台阶','20210727/1627376069270.jpg',15,2,18,4),(32,'2021-07-28 18:01:51','2021-07-28 18:14:07',35,'特别懂年轻人的知名自媒体“原来是柒公子”首部文集。从未想过安分过一生，也注定有人愿与你同行。\r\n开 本：32开  纸 张：胶版纸   包 装：平装-胶订  是否套装：否      国际标准书号ISBN：9787517096610','总有人喜欢你的奇奇怪怪','20210728/1627466509612.jpg',20,2,24,38),(33,'2021-07-28 18:03:26','2021-07-28 18:14:05',54,'山河令男主张哲瀚推荐！\r\n开 本：32开   纸 张：胶版纸   包 装：平装-胶订   是否套装：否   国际标准书号ISBN：9787540483548','嘿，小家伙','20210728/1627466605383.jpg',19,2,24,38),(34,'2021-07-28 18:05:07','2021-07-28 18:14:02',169,'畅销书作家木苏里无限流幻想小说力作，高人气原创作品，从光怪陆离的设定到有血有肉的人物且看秦究游惑如何带一众小伙伴从凄冷风雪走到熙攘人间!\r\n','全球高考收藏版礼盒','20210728/1627466686862.jpg',50,2,24,38),(35,'2021-07-28 18:06:04','2021-07-28 18:14:00',54,'《撒野》热血兄弟篇！高燃继续，重磅来袭！新增出版番外！随书附赠人物海报+双面卡册+Q萌贴纸+书签。当当独家专享印签本！','轻狂2 畅销书作家巫哲燃情力作 当当','20210728/1627466762307.jpg',23,2,24,38),(36,'2021-07-28 18:07:41','2021-07-28 18:13:54',64,'开 本：32开  纸 张：胶版纸   包 装：平装-胶订  是否套装：否    国际标准书号ISBN：9787020170760','三生三世步生莲 贰·神祈（B版：限量','20210728/1627466806697.jpg',32,2,22,38),(37,'2021-07-28 18:09:19','2021-07-28 18:13:56',62,'唐七作品，三生三世系列，东华和凤九的故事。畅销百万册言情经典作品全新再版，新增作者序言解密【三生】系列未来规划。','三生三世枕上书. 全二册','20210728/1627466938937.jpg',32,2,22,38),(38,'2021-07-28 18:11:13','2021-07-28 18:13:58',114,'宫闱秘史、珍馐美味；济世名臣、末代公子 这里的故事传奇且精彩','“高阳谈中国历史”系列（套装6册）','20210728/1627467036695.jpg',56,2,11,38),(39,'2021-07-28 18:13:13','2021-07-28 18:13:44',67,'看懂罗马，就能看懂世界。东京大学古罗马史教授倾囊相授，非传统意义上的“罗马通史”，宏大视角，多维解读，于罗马帝国的兴衰洪流中感知历史深处的规律与真相 ','罗马兴衰1200年','20210728/1627467192044.jpg',32,2,11,38),(40,'2021-07-28 18:25:20','2021-07-28 18:26:58',72,'中国古代海权史经典之作！从海洋的角度看中国史！翻开本书，从战争、贸易、文化等方面，看清古代中国如何一步步成为海洋强国！\r\n古代中国其实是一个海洋强国！造船技术世界当先，航海足迹远至东非，傲视东方海域数百年！从海洋看中国史','被遗忘的海上中国史','20210728/1627467865716.jpg',36,2,11,38),(41,'2021-07-28 18:26:47','2021-07-28 18:26:56',68,'以考古出土的青铜面具、青铜人像、青铜神树、玉琮、玉璋、黄金面具等实物为依托，系统描述了古蜀文明三星堆的全貌。对中华文明与三星堆文明的关系做了解码似的揭示，解读三星堆文化的来龙去脉及其与长江流域、黄河流',' 三星堆：开启中华文明之门（精装版）','20210728/1627467989100.jpg',34,2,11,38),(42,'2021-07-29 14:04:13','2021-07-29 14:05:52',102,'开 本：32开  纸 张：胶版纸   包 装：精装   是否套装：否   国际标准书号ISBN：9787100099806','古代汉语词典（精装）(第2版)','20210729/1627538616020.jpg',50,2,11,37),(43,'2021-07-29 14:05:41','2021-07-29 14:05:50',1024,'开 本：32开   纸 张：胶版纸   包 装：精装   是否套装：是   国际标准书号ISBN：9787101098570','资治通鉴（全12册·中华国学文库）','20210729/1627538707357.jpg',560,2,11,37),(44,'2022-01-29 15:55:17','2022-01-29 15:55:17',12,'12312312312发打发士大夫撒打发','我的书','20220129/1643442901485.png',11,1,51,39);
/*!40000 ALTER TABLE `ylrc_student_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_studnet`
--

DROP TABLE IF EXISTS `ylrc_studnet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ylrc_studnet` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `academy` varchar(18) DEFAULT NULL,
  `grade` varchar(18) DEFAULT NULL,
  `mobile` varchar(18) DEFAULT NULL,
  `nickname` varchar(32) DEFAULT NULL,
  `qq` varchar(18) DEFAULT NULL,
  `school` varchar(18) DEFAULT NULL,
  `sn` varchar(18) NOT NULL,
  `head_pic` varchar(128) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `password` varchar(18) NOT NULL,
  `discount_coupon` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UK_5se32pxcytmbwgepjrjrdmvjr` (`sn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_studnet`
--

LOCK TABLES `ylrc_studnet` WRITE;
/*!40000 ALTER TABLE `ylrc_studnet` DISABLE KEYS */;
INSERT INTO `ylrc_studnet` VALUES (2,'2020-04-06 12:52:02','2020-04-18 18:05:56','计算机科学与技术学院','软件1102','13656565656','猿来入此','11221232132','东华大学','158540174520','20210723/1627033104103.jpeg',1,'123456',0),(3,'2020-04-11 15:20:12','2020-04-11 15:23:29','计算机科学与技术学院','计算机1103','13946598956','小猪爱佩琪','11956256','清华大学','158540174521','20210723/1627033104103.jpeg',1,'123456',0),(4,'2020-04-11 23:35:40','2020-04-15 21:48:47','材料学院','材料1104','13656569456','会飞的小乌龟','1658555644','同济大学','158540174522','20210723/1627033104103.jpeg',1,'123456',0),(36,'2021-03-10 11:16:28','2021-03-10 11:21:58','计算机科学与技术学院','软件1103',NULL,NULL,'123456',NULL,'158540174523','20210723/1627033129962.png',1,'123456',2),(37,'2021-03-10 11:25:54','2021-07-29 14:18:49','计算机科学与技术学院','软件1101','','猿来入此','123456','','158540174524','20210723/1627033129962.png',1,'123456',2),(38,'2021-07-27 17:08:19','2021-07-28 18:07:50',NULL,NULL,NULL,NULL,'2568877110',NULL,'158540174519','20210728/1627466870608.jpg',1,'123456',1),(39,'2022-01-29 15:53:52','2022-01-29 15:54:21',NULL,NULL,NULL,NULL,'111111',NULL,'202939393922',NULL,1,'123456',2),(40,'2022-01-29 17:03:55','2022-01-29 17:03:55',NULL,NULL,NULL,NULL,'2727251',NULL,'121212121212',NULL,1,'zou123567',1);
/*!40000 ALTER TABLE `ylrc_studnet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_user`
--

DROP TABLE IF EXISTS `ylrc_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ylrc_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `email` varchar(32) DEFAULT NULL,
  `head_pic` varchar(128) DEFAULT NULL,
  `mobile` varchar(12) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `sex` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `username` varchar(18) NOT NULL,
  `role_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UK_btsosjytrl4hu7fnm1intcpo8` (`username`) USING BTREE,
  KEY `FKg09b8o67eu61st68rv6nk8npj` (`role_id`) USING BTREE,
  CONSTRAINT `FKg09b8o67eu61st68rv6nk8npj` FOREIGN KEY (`role_id`) REFERENCES `ylrc_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_user`
--

LOCK TABLES `ylrc_user` WRITE;
/*!40000 ALTER TABLE `ylrc_user` DISABLE KEYS */;
INSERT INTO `ylrc_user` VALUES (1,'2020-03-18 19:18:53','2021-07-23 17:38:28','ylrc@qq.com','20210723/1627033104103.jpeg','1333333333','123456',2,1,'zou123',1);
/*!40000 ALTER TABLE `ylrc_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_wanted_goods`
--

DROP TABLE IF EXISTS `ylrc_wanted_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ylrc_wanted_goods` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `content` varchar(1024) NOT NULL,
  `name` varchar(32) NOT NULL,
  `sell_price` float NOT NULL,
  `trade_place` varchar(128) NOT NULL,
  `view_number` int NOT NULL,
  `student_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FKqvrfd43yhp11er38hkfcxi103` (`student_id`) USING BTREE,
  CONSTRAINT `FKqvrfd43yhp11er38hkfcxi103` FOREIGN KEY (`student_id`) REFERENCES `ylrc_studnet` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_wanted_goods`
--

LOCK TABLES `ylrc_wanted_goods` WRITE;
/*!40000 ALTER TABLE `ylrc_wanted_goods` DISABLE KEYS */;
INSERT INTO `ylrc_wanted_goods` VALUES (10,'2021-07-27 16:56:55','2021-07-27 16:56:55','学习英语口语，有打算出手的联系我。qq:2567845120','英语口语方面的书籍',30,'校园里面',0,4),(11,'2021-07-27 17:00:51','2021-07-27 17:00:51','最近在看穿越剧，想参考一下。看看电视剧里面有多少是符合历史的','明朝方面的历史书籍',30,'校园里面',0,4),(12,'2021-07-29 14:09:58','2021-07-29 14:09:58','在学习礼仪文化，谁有这方面的书籍。求购','礼仪文化',30,'校园里面',0,37),(13,'2021-07-29 14:11:32','2021-07-29 14:11:32','想了解一下生肖方面的信息，谁有这方面的书籍','生肖方面的书籍',15,'校园里面',0,37),(14,'2022-01-29 15:55:55','2022-01-29 15:55:55','我想要2342342342发的发撒的','这个书',11,'光谷广场',0,39);
/*!40000 ALTER TABLE `ylrc_wanted_goods` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-30  9:18:42
