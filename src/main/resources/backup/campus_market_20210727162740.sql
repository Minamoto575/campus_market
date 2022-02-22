-- MySQL dump 10.16  Distrib 10.1.32-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: campus_market
-- ------------------------------------------------------
-- Server version	10.1.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ylrc_database_bak`
--

DROP TABLE IF EXISTS `ylrc_database_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ylrc_database_bak` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `filename` varchar(32) NOT NULL,
  `filepath` varchar(128) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_database_bak`
--

LOCK TABLES `ylrc_database_bak` WRITE;
/*!40000 ALTER TABLE `ylrc_database_bak` DISABLE KEYS */;
INSERT INTO `ylrc_database_bak` VALUES (34,'2021-07-27 16:27:40','2021-07-27 16:27:40','campus_market_20210727162740.sql','D:/BaiduNetdiskDownload1/xm/campus-market/src/main/resources/backup/');
/*!40000 ALTER TABLE `ylrc_database_bak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_friend_link`
--

DROP TABLE IF EXISTS `ylrc_friend_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ylrc_friend_link` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `name` varchar(64) NOT NULL,
  `sort` int(11) NOT NULL,
  `url` varchar(256) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ylrc_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `content` varchar(1024) NOT NULL,
  `name` varchar(32) NOT NULL,
  `photo` varchar(128) NOT NULL,
  `recommend` int(11) NOT NULL,
  `sell_price` float NOT NULL,
  `status` int(11) NOT NULL,
  `goods_category_id` bigint(20) DEFAULT NULL,
  `view_number` int(11) NOT NULL,
  `buy_price` float NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FKjtyl6pmb9j4aj64sm54xi1hbi` (`goods_category_id`) USING BTREE,
  CONSTRAINT `FKjtyl6pmb9j4aj64sm54xi1hbi` FOREIGN KEY (`goods_category_id`) REFERENCES `ylrc_goods_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_goods`
--

LOCK TABLES `ylrc_goods` WRITE;
/*!40000 ALTER TABLE `ylrc_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `ylrc_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_goods_category`
--

DROP TABLE IF EXISTS `ylrc_goods_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ylrc_goods_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `icon` varchar(32) DEFAULT NULL,
  `name` varchar(18) NOT NULL,
  `sort` int(11) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FKos35mkmw4k5dvi4fi2govg2pa` (`parent_id`) USING BTREE,
  CONSTRAINT `FKos35mkmw4k5dvi4fi2govg2pa` FOREIGN KEY (`parent_id`) REFERENCES `ylrc_goods_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ylrc_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `name` varchar(18) NOT NULL,
  `url` varchar(128) DEFAULT NULL,
  `icon` varchar(32) DEFAULT NULL,
  `sort` int(11) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `is_bitton` bit(1) NOT NULL,
  `is_show` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FKsbtnjocfrq29e8taxdwo21gic` (`parent_id`) USING BTREE,
  CONSTRAINT `FKsbtnjocfrq29e8taxdwo21gic` FOREIGN KEY (`parent_id`) REFERENCES `ylrc_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_menu`
--

LOCK TABLES `ylrc_menu` WRITE;
/*!40000 ALTER TABLE `ylrc_menu` DISABLE KEYS */;
INSERT INTO `ylrc_menu` VALUES (2,'2020-03-14 14:26:03','2020-03-14 18:24:53','系统设置','','mdi-settings',0,NULL,'\0',''),(3,'2020-03-14 16:58:55','2020-03-14 18:26:02','菜单管理','/admin/menu/list','mdi-view-list',1,2,'\0',''),(5,'2020-03-14 17:04:44','2020-03-14 18:27:53','新增','/admin/menu/add','mdi-plus',2,3,'\0',''),(7,'2020-03-14 17:07:43','2020-03-15 12:11:25','角色管理','/admin/role/list','mdi-account-settings-variant',5,2,'\0',''),(8,'2020-03-14 18:28:48','2020-03-21 22:04:45','编辑','edit(\'/admin/menu/edit\')','mdi-grease-pencil',3,3,'',''),(9,'2020-03-14 18:30:00','2020-03-21 22:08:20','删除','del(\'/admin/menu/delete\')','mdi-close',4,3,'',''),(10,'2020-03-15 12:12:00','2020-03-15 12:12:00','添加','/admin/role/add','mdi-account-plus',6,7,'\0',''),(11,'2020-03-15 12:12:36','2020-03-21 22:10:45','编辑','edit(\'/admin/role/edit\')','mdi-account-edit',7,7,'',''),(12,'2020-03-15 12:13:19','2020-03-21 22:15:27','删除','del(\'/admin/role/delete\')','mdi-account-remove',8,7,'',''),(13,'2020-03-15 12:14:52','2020-03-15 12:17:00','用户管理','/admin/user/list','mdi-account-multiple',9,2,'\0',''),(14,'2020-03-15 12:15:22','2020-03-15 12:17:27','添加','/admin/user/add','mdi-account-plus',10,13,'\0',''),(15,'2020-03-16 17:18:14','2020-03-21 22:11:19','编辑','edit(\'/admin/user/edit\')','mdi-account-edit',11,13,'',''),(16,'2020-03-16 17:19:01','2020-03-21 22:15:36','删除','del(\'/admin/user/delete\')','mdi-account-remove',12,13,'',''),(19,'2020-03-22 11:24:36','2021-07-23 18:14:20','上传图片','/admin/upload/upload_photo','mdi-arrow-up-bold-circle',13,13,'\0','\0'),(20,'2020-03-22 14:09:35','2021-07-23 18:14:31','日志管理','/system/operator_log_list','mdi-tag-multiple',14,2,'\0',''),(21,'2020-03-22 14:11:39','2021-07-23 18:14:39','删除','del(\'/system/delete_operator_log\')','mdi-tag-remove',15,20,'',''),(22,'2020-03-22 14:12:57','2021-07-23 18:14:47','清空日志','delAll(\'/system/delete_all_operator_log\')','mdi-delete-circle',16,20,'',''),(23,'2020-03-22 14:46:40','2021-07-23 18:14:56','数据备份','/admin/database_bak/list','mdi-database',17,2,'\0',''),(24,'2020-03-22 14:48:07','2021-07-23 18:15:05','备份','add(\'/admin/database_bak/add\')','mdi-database-plus',18,23,'',''),(25,'2020-03-22 14:49:03','2021-07-23 18:15:14','删除','del(\'/admin/database_bak/delete\')','mdi-database-minus',19,23,'',''),(26,'2020-03-22 19:36:20','2021-07-23 18:15:22','还原','restore(\'/admin/database_bak/restore\')','mdi-database-minus',20,23,'',''),(27,'2020-04-01 20:35:09','2021-07-23 18:15:39','物品管理','/admin/goods_category/list','mdi-dialpad',21,NULL,'\0',''),(28,'2020-04-01 20:35:46','2021-07-23 18:15:50','分类管理','/admin/goods_category/list','mdi-apps',22,27,'\0',''),(29,'2020-04-01 20:36:27','2021-07-23 18:16:45','物品管理','/admin/goods/list','mdi-cart',26,27,'\0',''),(30,'2020-04-01 20:40:48','2021-07-23 18:16:06','添加','/admin/goods_category/add','mdi-battery-positive',23,28,'\0',''),(31,'2020-04-01 20:41:33','2021-07-23 18:16:16','编辑','edit(\'/admin/goods_category/edit\')','mdi-border-color',24,28,'',''),(32,'2020-04-01 20:42:15','2021-07-23 18:16:28','删除','del(\'/admin/goods_category/delete\')','mdi-close',25,28,'',''),(33,'2020-04-13 18:52:12','2021-07-23 18:16:58','上架','up(\'/admin/goods/up_down\')','mdi-arrow-up-bold-box',27,29,'',''),(34,'2020-04-13 18:52:55','2021-07-23 18:17:21','下架','down(\'/admin/goods/up_down\')','mdi-arrow-down-bold-box',28,29,'',''),(35,'2020-04-13 18:54:10','2021-07-23 18:17:35','删除','del(\'/admin/goods/delete\')','mdi-close-box',29,29,'',''),(36,'2020-04-15 19:06:49','2021-07-23 18:17:44','推荐','recommend(\'/admin/goods/recommend\')','mdi-thumb-up',30,29,'',''),(37,'2020-04-15 19:07:45','2021-07-23 18:17:54','取消推荐','unrecommend(\'/admin/goods/recommend\')','mdi-thumb-down',31,29,'',''),(38,'2020-04-15 19:32:16','2021-07-23 18:18:16','求购物品','/admin/wanted_goods/list','mdi-ticket',33,27,'\0',''),(39,'2020-04-15 19:32:55','2021-07-23 18:18:24','删除','del(\'/admin/wanted_goods/delete\')','mdi-close-box',34,38,'',''),(40,'2020-04-15 20:02:04','2021-07-23 18:18:55','学生管理','/admin/student/list','mdi-account-multiple',37,NULL,'\0',''),(41,'2020-04-15 20:02:38','2021-07-23 18:19:06','学生列表','/admin/student/list','mdi-account-multiple',38,40,'\0',''),(42,'2020-04-15 20:06:28','2021-07-23 18:19:17','冻结','freeze(\'/admin/student/update_status\')','mdi-account-settings-variant',39,41,'',''),(43,'2020-04-15 20:06:59','2021-07-23 18:19:27','激活','openStudent(\'/admin/student/update_status\')','mdi-account-key',40,41,'',''),(44,'2020-04-15 20:07:33','2021-07-23 18:19:38','删除','del(\'/admin/student/delete\')','mdi-account-remove',41,41,'',''),(45,'2020-04-15 21:52:57','2021-07-23 18:19:49','评论管理','/admin/comment/list','mdi-comment-account',42,NULL,'\0',''),(46,'2020-04-15 21:53:39','2021-07-23 18:19:58','评论列表','/admin/comment/list','mdi-comment-multiple-outline',43,45,'\0',''),(47,'2020-04-15 21:54:35','2021-07-23 18:20:07','删除','del(\'/admin/comment/delete\')','mdi-message-bulleted-off',44,46,'',''),(48,'2020-04-16 19:28:48','2021-07-23 18:20:18','举报管理','/admin/report/list','mdi-alert',45,NULL,'\0',''),(49,'2020-04-16 19:30:31','2021-07-23 18:20:27','举报列表','/admin/report/list','mdi-view-headline',46,48,'\0',''),(50,'2020-04-16 19:31:09','2021-07-23 18:20:41','删除','del(\'/admin/report/delete\')','mdi-close-box',47,49,'',''),(51,'2020-04-16 19:46:08','2021-07-23 18:20:52','新闻公告','/admin/news/list','mdi-onenote',48,NULL,'\0',''),(52,'2020-04-16 19:46:39','2021-07-23 18:21:02','公告列表','/admin/news/list','mdi-book-open',49,51,'\0',''),(53,'2020-04-16 19:48:01','2021-07-23 18:21:14','添加','/admin/news/add','mdi-plus',50,52,'\0',''),(54,'2020-04-16 19:48:46','2021-07-23 18:21:24','编辑','edit(\'/admin/news/edit\')','mdi-border-color',51,52,'',''),(55,'2020-04-16 19:49:37','2021-07-23 18:21:35','删除','del(\'/admin/news/delete\')','mdi-close',52,52,'',''),(56,'2020-04-18 14:25:58','2021-07-23 18:21:44','网站设置','','mdi-settings',53,NULL,'\0',''),(57,'2020-04-18 14:27:31','2021-07-23 18:22:02','友情链接','/admin/friend_link/list','mdi-vector-line',54,56,'\0',''),(58,'2020-04-18 14:28:36','2021-07-23 18:22:16','添加','/admin/friend_link/add','mdi-plus',55,57,'\0',''),(59,'2020-04-18 14:29:17','2021-07-23 18:22:32','编辑','edit(\'/admin/friend_link/edit\')','mdi-border-color',56,57,'',''),(60,'2020-04-18 14:29:45','2021-07-23 18:22:46','删除','del(\'/admin/friend_link/delete\')','mdi-close-box',57,57,'',''),(61,'2020-04-18 16:26:45','2021-07-23 18:22:57','站点设置','/admin/site_setting/setting','mdi-wrench',58,56,'\0',''),(62,'2020-04-18 16:28:25','2021-07-23 18:23:09','提交修改','/admin/site_setting/save_setting','mdi-marker-check',59,61,'','\0'),(63,'2021-03-08 14:02:42','2021-07-23 18:18:33','收购物品管理','/admin/student_goods/list','mdi-clipboard-text',35,27,'\0',''),(64,'2021-03-08 16:36:53','2021-07-23 18:18:44','收购','/admin/student_goods/purchase','mdi-currency-cny',36,63,'\0','\0'),(65,'2021-03-08 17:09:56','2021-07-23 18:18:06','编辑','edit(\'/admin/goods/edit\')','mdi-pencil',32,29,'',''),(66,'2021-03-09 15:20:12','2021-07-23 18:23:20','订单管理','','mdi-file-document-box',60,NULL,'\0',''),(67,'2021-03-09 15:21:00','2021-07-23 18:23:31','订单列表','/admin/order_form/list','mdi-file-document',61,66,'\0','');
/*!40000 ALTER TABLE `ylrc_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_news`
--

DROP TABLE IF EXISTS `ylrc_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ylrc_news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `content` varchar(10024) NOT NULL,
  `sort` int(11) NOT NULL,
  `title` varchar(1024) NOT NULL,
  `view_number` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_news`
--

LOCK TABLES `ylrc_news` WRITE;
/*!40000 ALTER TABLE `ylrc_news` DISABLE KEYS */;
INSERT INTO `ylrc_news` VALUES (1,'2020-04-16 21:29:17','2021-07-27 16:21:41','猿来入此校园二手市场平台书籍',2,'关于猿来入此校园二手书籍市场平台',0),(2,'2020-04-16 21:29:49','2021-07-27 16:21:09','1.禁止和限制发布物品管理规则\r\n2.重复铺书籍管理规则\r\n3.支付方式不符书籍管理规则\r\n4.书籍价格、邮费不符书籍管理规则\r\n5.信用炒作书籍管理规则',0,'猿来入此校园二手市场发布书籍规则',0),(3,'2020-04-16 21:30:22','2021-07-27 16:21:25','注册时请填写详细的注册信息，学号为必填项。',1,'猿来入此校园二手书籍账号注册规则',0);
/*!40000 ALTER TABLE `ylrc_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_operater_log`
--

DROP TABLE IF EXISTS `ylrc_operater_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ylrc_operater_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `content` varchar(1024) NOT NULL,
  `operator` varchar(18) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=514 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_operater_log`
--

LOCK TABLES `ylrc_operater_log` WRITE;
/*!40000 ALTER TABLE `ylrc_operater_log` DISABLE KEYS */;
INSERT INTO `ylrc_operater_log` VALUES (512,'2021-07-27 16:27:27','2021-07-27 16:27:27','修改网站设置:SiteSetting [siteName=猿来入此二手校园书籍交易网站, siteUrl=www.yuanlrc.com/?fuid=6666, logo1=20210723/1627034257059.png, logo2=20210723/1627034260776.png, qrcode=20210727/1627374443899.png, allRights=©2016-2021【猿来入此】 版权所有]','猿来入此'),(513,'2021-07-27 16:27:40','2021-07-27 16:27:40','数据库成功备份，备份文件信息：DatabaseBak [filename=campus_market_20210727162740.sql, filepath=D:/BaiduNetdiskDownload1/xm/campus-market/src/main/resources/backup/]','猿来入此');
/*!40000 ALTER TABLE `ylrc_operater_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_order_auth`
--

DROP TABLE IF EXISTS `ylrc_order_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ylrc_order_auth` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `mac` varchar(32) DEFAULT NULL,
  `order_sn` varchar(18) NOT NULL,
  `phone` varchar(12) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_order_auth`
--

LOCK TABLES `ylrc_order_auth` WRITE;
/*!40000 ALTER TABLE `ylrc_order_auth` DISABLE KEYS */;
INSERT INTO `ylrc_order_auth` VALUES (9,'2021-03-12 11:11:12','2021-03-12 11:11:12','8C04FF14C46C','161504329584807509','18677308397');
/*!40000 ALTER TABLE `ylrc_order_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_order_form`
--

DROP TABLE IF EXISTS `ylrc_order_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ylrc_order_form` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `is_use` int(11) DEFAULT NULL,
  `pay_price` float DEFAULT NULL,
  `sell_price` float DEFAULT NULL,
  `goods_id` bigint(20) DEFAULT NULL,
  `student_id` bigint(20) DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK11yl4v8bca07chjxgak9i9scf` (`goods_id`) USING BTREE,
  KEY `FKcj9lrmtuxci36bu3c3sn1m3t7` (`student_id`) USING BTREE,
  CONSTRAINT `FK11yl4v8bca07chjxgak9i9scf` FOREIGN KEY (`goods_id`) REFERENCES `ylrc_goods` (`id`),
  CONSTRAINT `FKcj9lrmtuxci36bu3c3sn1m3t7` FOREIGN KEY (`student_id`) REFERENCES `ylrc_studnet` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_order_form`
--

LOCK TABLES `ylrc_order_form` WRITE;
/*!40000 ALTER TABLE `ylrc_order_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `ylrc_order_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_report_goods`
--

DROP TABLE IF EXISTS `ylrc_report_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ylrc_report_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `content` varchar(1024) NOT NULL,
  `goods_id` bigint(20) DEFAULT NULL,
  `student_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK6g0s4688rq2bnty1u1ev1rgly` (`goods_id`) USING BTREE,
  KEY `FKmr7s3q3jpq824h69f5ip9gleq` (`student_id`) USING BTREE,
  CONSTRAINT `FK6g0s4688rq2bnty1u1ev1rgly` FOREIGN KEY (`goods_id`) REFERENCES `ylrc_goods` (`id`),
  CONSTRAINT `FKmr7s3q3jpq824h69f5ip9gleq` FOREIGN KEY (`student_id`) REFERENCES `ylrc_studnet` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_report_goods`
--

LOCK TABLES `ylrc_report_goods` WRITE;
/*!40000 ALTER TABLE `ylrc_report_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `ylrc_report_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_role`
--

DROP TABLE IF EXISTS `ylrc_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ylrc_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `name` varchar(18) NOT NULL,
  `remark` varchar(128) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_role`
--

LOCK TABLES `ylrc_role` WRITE;
/*!40000 ALTER TABLE `ylrc_role` DISABLE KEYS */;
INSERT INTO `ylrc_role` VALUES (1,'2020-03-15 13:16:38','2021-03-09 15:21:18','超级管理员','超级管理员拥有最高权限。',1),(2,'2020-03-15 13:18:57','2020-03-21 22:18:43','普通管理员','普通管理员只有部分权限',1),(4,'2020-03-21 20:11:00','2020-03-23 17:49:00','测试角色','sadsa',0);
/*!40000 ALTER TABLE `ylrc_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_role_authorities`
--

DROP TABLE IF EXISTS `ylrc_role_authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ylrc_role_authorities` (
  `role_id` bigint(20) NOT NULL,
  `authorities_id` bigint(20) NOT NULL,
  KEY `FKhj7ap1o1cjrl7enr9arf5f2qp` (`authorities_id`) USING BTREE,
  KEY `FKg3xdaexmr0x1qx8omhvjtk46d` (`role_id`) USING BTREE,
  CONSTRAINT `FKg3xdaexmr0x1qx8omhvjtk46d` FOREIGN KEY (`role_id`) REFERENCES `ylrc_role` (`id`),
  CONSTRAINT `FKhj7ap1o1cjrl7enr9arf5f2qp` FOREIGN KEY (`authorities_id`) REFERENCES `ylrc_menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_role_authorities`
--

LOCK TABLES `ylrc_role_authorities` WRITE;
/*!40000 ALTER TABLE `ylrc_role_authorities` DISABLE KEYS */;
INSERT INTO `ylrc_role_authorities` VALUES (2,2),(2,3),(2,5),(2,7),(2,11),(2,13),(2,16),(4,2),(4,13),(4,15),(1,2),(1,3),(1,5),(1,8),(1,9),(1,7),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,19),(1,20),(1,21),(1,22),(1,23),(1,24),(1,25),(1,26),(1,27),(1,28),(1,30),(1,31),(1,32),(1,29),(1,33),(1,34),(1,35),(1,36),(1,37),(1,65),(1,38),(1,39),(1,63),(1,64),(1,40),(1,41),(1,42),(1,43),(1,44),(1,45),(1,46),(1,47),(1,48),(1,49),(1,50),(1,51),(1,52),(1,53),(1,54),(1,55),(1,56),(1,57),(1,58),(1,59),(1,60),(1,61),(1,62),(1,66),(1,67);
/*!40000 ALTER TABLE `ylrc_role_authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_site_setting`
--

DROP TABLE IF EXISTS `ylrc_site_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ylrc_site_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `all_rights` varchar(256) NOT NULL,
  `logo_1` varchar(256) NOT NULL,
  `logo_2` varchar(256) NOT NULL,
  `qrcode` varchar(256) NOT NULL,
  `site_name` varchar(128) NOT NULL,
  `site_url` varchar(256) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_site_setting`
--

LOCK TABLES `ylrc_site_setting` WRITE;
/*!40000 ALTER TABLE `ylrc_site_setting` DISABLE KEYS */;
INSERT INTO `ylrc_site_setting` VALUES (1,'2020-04-18 17:02:17','2021-07-27 16:27:27','©2016-2021【猿来入此】 版权所有','20210723/1627034257059.png','20210723/1627034260776.png','20210727/1627374443899.png','猿来入此二手校园书籍交易网站','www.yuanlrc.com/?fuid=6666');
/*!40000 ALTER TABLE `ylrc_site_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_student_goods`
--

DROP TABLE IF EXISTS `ylrc_student_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ylrc_student_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `buy_price` float NOT NULL,
  `content` varchar(1024) NOT NULL,
  `name` varchar(32) NOT NULL,
  `photo` varchar(128) NOT NULL,
  `sell_price` float NOT NULL,
  `status` int(11) NOT NULL,
  `goods_category_id` bigint(20) DEFAULT NULL,
  `student_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK63xin129lr9gu2ebayil16qff` (`goods_category_id`) USING BTREE,
  KEY `FKgn6djcsfmc7c7yu3prds04gtn` (`student_id`) USING BTREE,
  CONSTRAINT `FK63xin129lr9gu2ebayil16qff` FOREIGN KEY (`goods_category_id`) REFERENCES `ylrc_goods_category` (`id`),
  CONSTRAINT `FKgn6djcsfmc7c7yu3prds04gtn` FOREIGN KEY (`student_id`) REFERENCES `ylrc_studnet` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_student_goods`
--

LOCK TABLES `ylrc_student_goods` WRITE;
/*!40000 ALTER TABLE `ylrc_student_goods` DISABLE KEYS */;
INSERT INTO `ylrc_student_goods` VALUES (11,'2021-03-10 11:20:20','2021-03-10 11:20:51',59,'只看过几遍，九成新.\r\n\r\n\r\n《白夜行》被普遍视为日本作家东野圭吾作品的无冕之王，一经推出即成为东野圭吾的长篇小说代表作，中文版销量超450万册，与《嫌疑人X的献身》《恶意》《解忧杂货店》并称为东野圭吾四大杰作。\r\n','白夜行','20210310/1615346371403.jpeg',48,2,55,36),(12,'2021-03-10 11:23:04','2021-03-10 11:23:14',230,'《白夜行》被普遍视为日本作家东野圭吾作品的无冕之王，一经推出即成为东野圭吾的长篇小说代表作，中文版销量超450万册，与《嫌疑人X的献身》《恶意》《解忧杂货店》并称为东野圭吾四大杰作。','白夜行','20210310/1615346553915.jpeg',159,2,23,36),(13,'2021-03-10 11:26:36','2021-03-10 13:45:41',59,'老舍的《四世同堂(精)》以抗战时期北平一个普通的小羊圈胡同作为故事展开的具体环境，以几个家庭众多小人物屈辱、悲惨的经历来反映北平市民在八年抗战中惶惑、偷生、苟安的社会心态，再现他们在国破家亡之际缓慢、痛苦而又艰难的觉醒历程。作品\r\n深刻的思想意蕴表明，一个民族的兴衰存亡，不仅在于其经济的发达、武器的先进，而且还取决于该民族普遍的社会心态。拥有几千年灿烂文明的大国为什么却遭受日本人的侵略，这不能不引起包括作者在内的知识分子的深刻反省。老舍继承了鲁迅改造国民灵魂\r\n的五四传统，他把造成国人性格懦弱、敷衍、苟且偷安的思想根源指向传统的北平文化，而整个北平文化又是以家族文化为基础的。因此老舍在作品中便集中地审视了中国的家族文化，对其消极性因素进行了理性的审视与批判。众所周知，＂家，在中国是礼教的堡垒。＂而这个堡垒却容纳了包括等级观念、宗法思想、伦理道德、风俗习惯等在内的家族文化的诸多内容。','四世同堂','20210310/1615346770586.jpeg',50,2,38,37),(14,'2021-03-10 13:53:08','2021-03-10 13:53:15',100,'老舍的《四世同堂(精)》以抗战时期北平一个普通的小羊圈胡同作为故事展开的具体环境，以几个家庭众多小人物屈辱、悲惨的经历来反映北平市民在八年抗战中惶惑、偷生、苟安的社会心态，再现他们在国破家亡之际缓慢、痛苦而又艰难的觉醒历程。作品\r\n深刻的思想意蕴表明，一个民族的兴衰存亡，不仅在于其经济的发达、武器的先进，而且还取决于该民族普遍的社会心态。拥有几千年灿烂文明的大国为什么却遭受日本人的侵略，','四世同堂','20210310/1615355568799.jpeg',50,2,55,36),(15,'2021-03-10 13:55:44','2021-03-10 13:55:53',99999,'老舍的《四世同堂(精)》以抗战时期北平一个普通的小羊圈胡同作为故事展开的具体环境，以几个家庭众多小人物屈辱、悲惨的经历来反映北平市民在八年抗战中惶惑、偷生、苟安的社会心态，再现他们在国破家亡之际缓慢、痛苦而又艰难的觉醒历程。作品\r\n深刻的思想意蕴表明，一个民族的兴衰存亡，不仅在于其经济的发达、武器的先进，而且还取决于该民族普遍的社会心态。拥有几千年灿烂文明的大国为什么却遭受日本人的侵略，这不能不引起包括作者在内的知识分子的深刻反省。老舍继承了鲁迅改造国民灵魂','四世同堂','20210310/1615355723081.jpeg',50000,2,47,37),(16,'2021-03-10 14:00:59','2021-03-10 14:01:10',59.6556,'《资治通鉴》(第5辑.乱世烽烟)(柏杨白话版)(全4册)是一部浓缩了中国古代政治运作、权力游戏的历史巨著，是古代帝王鉴于往事、资于治道的必读史书。九百年后的今天，柏杨先生耗时十年（一九八三至一九九三）将其译成现代语言，亲手增绘地图，并注入自己的观点，谈论历史成败因果，使一部原本只供帝王将相阅读的史书在今天的读者面前竟然如此之亲切','资治通鉴','20210310/1615356037400.jpeg',58,2,55,37),(17,'2021-03-10 14:03:13','2021-03-10 14:03:23',108,'平装 · 套装 3 册\r\n这是一部现实主义小说，也是小说化的家族史。作家高度浓缩了中国西北农村的历史变迁过程，作品达到了思想性与艺术性的高度统一，特别是主人公面对困境艰苦奋斗的精神，对今天的大学生朋友仍有启迪。这是一部全','平凡的世界','20210310/1615356159531.png',95.6,2,9,37),(18,'2021-07-27 11:33:07','2021-07-27 11:33:41',50,'乒乓球拍乒乓球拍乒乓球拍乒乓球拍','乒乓球拍','20210727/1627356654832.jpg',25,2,29,37),(19,'2021-07-27 11:35:47','2021-07-27 11:35:53',30,'呼啦圈呼啦圈呼啦圈呼啦圈呼啦圈呼啦圈呼啦圈','呼啦圈','20210727/1627356919487.jpg',20,2,29,37),(20,'2021-07-27 14:05:56','2021-07-27 14:06:15',5000,'跑步机跑步机跑步机跑步机跑步机跑步机','跑步机','20210727/1627365931529.jpg',3000,2,55,4),(21,'2021-07-27 14:17:08','2021-07-27 14:19:32',200,'机械手表机械手表机械手表机械手表机械手表机械手表','机械手表','20210727/1627366597565.jpg',80,2,54,4),(22,'2021-07-27 14:17:55','2021-07-27 14:19:30',260,'篮球篮球篮球篮球篮球篮球篮球篮球篮球篮球篮球','篮球','20210727/1627366644677.jpg',250,2,26,4),(23,'2021-07-27 14:18:30','2021-07-27 14:19:34',360,'足球足球足球足球足球足球足球足球足球足球足球足球足球足球足球足球足球足球','足球','20210727/1627366687211.jpg',270,2,27,4),(24,'2021-07-27 14:19:18','2021-07-27 14:19:28',150,'羽毛球拍羽毛球拍羽毛球拍羽毛球拍','羽毛球拍','20210727/1627366718446.jpg',100,2,28,4),(25,'2021-07-27 14:22:20','2021-07-27 14:22:26',5420,'尼泊尔照相机尼泊尔照相机尼泊尔照相机尼泊尔照相机','尼泊尔照相机','20210727/1627366902578.jpg',4800,2,23,4);
/*!40000 ALTER TABLE `ylrc_student_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_studnet`
--

DROP TABLE IF EXISTS `ylrc_studnet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ylrc_studnet` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
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
  `status` int(11) DEFAULT NULL,
  `password` varchar(18) NOT NULL,
  `discount_coupon` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UK_5se32pxcytmbwgepjrjrdmvjr` (`sn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_studnet`
--

LOCK TABLES `ylrc_studnet` WRITE;
/*!40000 ALTER TABLE `ylrc_studnet` DISABLE KEYS */;
INSERT INTO `ylrc_studnet` VALUES (2,'2020-04-06 12:52:02','2020-04-18 18:05:56','计算机科学与技术学院','软件1102','13656565656','猿来入此','11221232132','东华大学','158540174520','20210723/1627033104103.jpeg',1,'123456',0),(3,'2020-04-11 15:20:12','2020-04-11 15:23:29','计算机科学与技术学院','计算机1103','13946598956','小猪爱佩琪','11956256','清华大学','158540174521','20210723/1627033104103.jpeg',1,'123456',0),(4,'2020-04-11 23:35:40','2020-04-15 21:48:47','材料学院','材料1104','13656569456','会飞的小乌龟','1658555644','同济大学','158540174522','20210723/1627033104103.jpeg',1,'123456',0),(36,'2021-03-10 11:16:28','2021-03-10 11:21:58','计算机科学与技术学院','软件1103',NULL,NULL,'123456',NULL,'158540174523','20210723/1627033129962.png',1,'123456',2),(37,'2021-03-10 11:25:54','2021-03-10 13:59:29','计算机科学与技术学院','软件1101',NULL,NULL,'123456',NULL,'158540174524','20210723/1627033129962.png',1,'123456',2);
/*!40000 ALTER TABLE `ylrc_studnet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_user`
--

DROP TABLE IF EXISTS `ylrc_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ylrc_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `email` varchar(32) DEFAULT NULL,
  `head_pic` varchar(128) DEFAULT NULL,
  `mobile` varchar(12) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `sex` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `username` varchar(18) NOT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UK_btsosjytrl4hu7fnm1intcpo8` (`username`) USING BTREE,
  KEY `FKg09b8o67eu61st68rv6nk8npj` (`role_id`) USING BTREE,
  CONSTRAINT `FKg09b8o67eu61st68rv6nk8npj` FOREIGN KEY (`role_id`) REFERENCES `ylrc_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_user`
--

LOCK TABLES `ylrc_user` WRITE;
/*!40000 ALTER TABLE `ylrc_user` DISABLE KEYS */;
INSERT INTO `ylrc_user` VALUES (1,'2020-03-18 19:18:53','2021-07-23 17:38:28','ylrc@qq.com','20210723/1627033104103.jpeg','13356565656','123456',2,1,'猿来入此',1),(2,'2020-03-18 19:20:36','2021-07-23 17:38:53','llq@qq.com','20210723/1627033129962.png','13918655656','123456',1,1,'测试账号',2);
/*!40000 ALTER TABLE `ylrc_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_wanted_goods`
--

DROP TABLE IF EXISTS `ylrc_wanted_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ylrc_wanted_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `content` varchar(1024) NOT NULL,
  `name` varchar(32) NOT NULL,
  `sell_price` float NOT NULL,
  `trade_place` varchar(128) NOT NULL,
  `view_number` int(11) NOT NULL,
  `student_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FKqvrfd43yhp11er38hkfcxi103` (`student_id`) USING BTREE,
  CONSTRAINT `FKqvrfd43yhp11er38hkfcxi103` FOREIGN KEY (`student_id`) REFERENCES `ylrc_studnet` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_wanted_goods`
--

LOCK TABLES `ylrc_wanted_goods` WRITE;
/*!40000 ALTER TABLE `ylrc_wanted_goods` DISABLE KEYS */;
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

-- Dump completed on 2021-07-27 16:27:41
