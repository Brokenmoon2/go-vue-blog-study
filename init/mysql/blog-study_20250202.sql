-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: blog-study
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `advert_models`
--

DROP TABLE IF EXISTS `advert_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advert_models` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `title` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `href` longtext COLLATE utf8mb4_unicode_ci,
  `images` longtext COLLATE utf8mb4_unicode_ci,
  `is_show` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advert_models`
--

LOCK TABLES `advert_models` WRITE;
/*!40000 ALTER TABLE `advert_models` DISABLE KEYS */;
INSERT INTO `advert_models` VALUES (2,'2024-12-30 12:25:28.282','2024-12-30 12:25:28.282','1','https://kimi.moonshot.cn/chat/ctp1n09djjphhguonp50','https://image.kungal.com/galgame/1358/banner/banner.webp',1),(4,'2024-12-30 20:19:06.190','2024-12-30 20:20:24.656','3','https://chatgpt.com/c/67728c7e-513c-8001-a61e-3ee78de2da2c','/uploads/file/kongwu/80cb39dbb6fd5266c1ac8fd9ee18972bd5073673_20241230201859.jpg',0);
/*!40000 ALTER TABLE `advert_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_models`
--

DROP TABLE IF EXISTS `article_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_models` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` longtext COLLATE utf8mb4_unicode_ci,
  `updated_at` longtext COLLATE utf8mb4_unicode_ci,
  `title` longtext COLLATE utf8mb4_unicode_ci,
  `abstract` longtext COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `look_count` bigint DEFAULT NULL,
  `comment_count` bigint DEFAULT NULL,
  `digg_count` bigint DEFAULT NULL,
  `collects_count` bigint DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `category` longtext COLLATE utf8mb4_unicode_ci,
  `source` longtext COLLATE utf8mb4_unicode_ci,
  `link` longtext COLLATE utf8mb4_unicode_ci,
  `banner_id` bigint unsigned DEFAULT NULL,
  `nick_name` varchar(42) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_path` longtext COLLATE utf8mb4_unicode_ci,
  `tags` longtext COLLATE utf8mb4_unicode_ci,
  `keyword` longtext COLLATE utf8mb4_unicode_ci,
  `user_nick_name` longtext COLLATE utf8mb4_unicode_ci,
  `user_avatar` longtext COLLATE utf8mb4_unicode_ci,
  `banner_url` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `fk_user_models_article_models` (`user_id`),
  KEY `fk_article_models_banner` (`banner_id`),
  CONSTRAINT `fk_article_models_banner` FOREIGN KEY (`banner_id`) REFERENCES `banner_models` (`id`),
  CONSTRAINT `fk_user_models_article_models` FOREIGN KEY (`user_id`) REFERENCES `user_models` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_models`
--

LOCK TABLES `article_models` WRITE;
/*!40000 ALTER TABLE `article_models` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_tag_models`
--

DROP TABLE IF EXISTS `article_tag_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_tag_models` (
  `article_model_id` bigint unsigned NOT NULL,
  `tag_model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`article_model_id`,`tag_model_id`),
  KEY `fk_article_tag_models_tag_model` (`tag_model_id`),
  CONSTRAINT `fk_article_tag_models_article_model` FOREIGN KEY (`article_model_id`) REFERENCES `article_models` (`id`),
  CONSTRAINT `fk_article_tag_models_tag_model` FOREIGN KEY (`tag_model_id`) REFERENCES `tag_models` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_tag_models`
--

LOCK TABLES `article_tag_models` WRITE;
/*!40000 ALTER TABLE `article_tag_models` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_tag_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banner_models`
--

DROP TABLE IF EXISTS `banner_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banner_models` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `path` longtext COLLATE utf8mb4_unicode_ci,
  `hash` longtext COLLATE utf8mb4_unicode_ci,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_type` bigint DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner_models`
--

LOCK TABLES `banner_models` WRITE;
/*!40000 ALTER TABLE `banner_models` DISABLE KEYS */;
INSERT INTO `banner_models` VALUES (2,'2024-10-22 19:14:37.853','2024-10-22 19:14:37.853','uploads/file/Granblue_Fantasy_Graphic_Archive_000.jpg','dd776da98d9a5bdc9bdc6f5f5c7d1f08','Granblue_Fantasy_Graphic_Archive_000.jpg',1),(3,'2024-10-22 19:18:32.168','2024-10-22 20:36:44.188','uploads/file/Granblue_Fantasy_Graphic_Archive_001.jpg','07e795051123b035bb1d6b96c8f40a02','碧蓝幻想设定图',1),(4,'2024-10-22 19:18:32.174','2024-10-22 19:18:32.174','uploads/file/Granblue_Fantasy_Graphic_Archive_002.jpg','48de9249c14fc100cd3397b1203b6751','Granblue_Fantasy_Graphic_Archive_002.jpg',1),(5,'2024-10-22 19:18:32.181','2024-10-22 19:18:32.181','uploads/file/Granblue_Fantasy_Graphic_Archive_003.jpg','bf849200900fd3b5cf3ed88be1262a6e','Granblue_Fantasy_Graphic_Archive_003.jpg',1),(6,'2024-10-22 19:18:32.187','2024-10-22 19:18:32.187','uploads/file/Granblue_Fantasy_Graphic_Archive_004.jpg','f8e5946a820216c506a91741aa1ca66c','Granblue_Fantasy_Graphic_Archive_004.jpg',1),(7,'2024-10-22 19:18:32.194','2024-10-22 19:18:32.194','uploads/file/Granblue_Fantasy_Graphic_Archive_005.jpg','823aba25c0819c024998e1a235eb8f82','Granblue_Fantasy_Graphic_Archive_005.jpg',1),(8,'2024-10-22 19:18:32.202','2024-10-22 19:18:32.202','uploads/file/Granblue_Fantasy_Graphic_Archive_006.jpg','84ec69f5993c82dc077166550b214fc0','Granblue_Fantasy_Graphic_Archive_006.jpg',1),(9,'2024-10-22 19:18:32.211','2024-10-22 19:18:32.211','uploads/file/Granblue_Fantasy_Graphic_Archive_007.jpg','1571ef09669b103ecf4f4bc248aded4d','Granblue_Fantasy_Graphic_Archive_007.jpg',1),(10,'2024-10-22 19:18:32.220','2024-10-22 19:18:32.220','uploads/file/Granblue_Fantasy_Graphic_Archive_008.jpg','eedf03398bf8ccf3e9ed3179d6aebc78','Granblue_Fantasy_Graphic_Archive_008.jpg',1),(11,'2024-10-22 19:18:32.228','2024-10-22 19:18:32.228','uploads/file/Granblue_Fantasy_Graphic_Archive_009.jpg','df342de75737deda0ab6e281a1c0f8a0','Granblue_Fantasy_Graphic_Archive_009.jpg',1),(12,'2024-10-25 21:00:20.835','2024-10-25 21:00:20.835','uploads/file/Granblue_Fantasy_Graphic_Archive_010.jpg','6cbb129f0634a8e0885a6193973685c3','Granblue_Fantasy_Graphic_Archive_010.jpg',1),(13,'2024-10-25 21:00:20.842','2024-10-25 21:00:20.842','uploads/file/Granblue_Fantasy_Graphic_Archive_011.jpg','00dfffce5b6eebe0897fdf0b6a2f4b54','Granblue_Fantasy_Graphic_Archive_011.jpg',1),(14,'2024-10-25 21:00:20.847','2024-10-25 21:00:20.847','uploads/file/Granblue_Fantasy_Graphic_Archive_012.jpg','5871949b16db01b07ec366c2f9b9e51a','Granblue_Fantasy_Graphic_Archive_012.jpg',1),(15,'2024-10-25 21:00:20.852','2024-10-25 21:00:20.852','uploads/file/Granblue_Fantasy_Graphic_Archive_013.jpg','fb1be57e17a9310e3ff0535857bb905f','Granblue_Fantasy_Graphic_Archive_013.jpg',1),(16,'2024-10-25 21:00:20.857','2024-10-25 21:00:20.857','uploads/file/Granblue_Fantasy_Graphic_Archive_014.jpg','61e673a94ea167f6b700b574f68055f9','Granblue_Fantasy_Graphic_Archive_014.jpg',1),(18,'2025-01-07 20:28:20.865','2025-01-07 20:28:20.865','uploads/file/uTools_1689816995487.png','611e7f7c8628458231de529a255ceae2','uTools_1689816995487.png',1),(19,'2025-01-27 17:41:30.161','2025-01-27 17:41:30.161','uploads/file/menu1.png','1df0acddd571a418faceb0866c6aa274','menu1.png',1),(20,'2025-01-27 17:41:30.174','2025-01-27 17:41:30.174','uploads/file/menu2.jpg','b74f1e9a5e737f3cfcc14957b3c1c9da','menu2.jpg',1),(21,'2025-01-27 17:41:30.184','2025-01-27 17:41:30.184','uploads/file/menu3.jpg','3a6d8fa4c52bc9f5f4438ea4ef215df9','menu3.jpg',1),(22,'2025-01-27 17:41:30.192','2025-01-27 17:41:30.192','uploads/file/menu4.jpg','67360209fad6eecf3d3c3b3aaabb7fda','menu4.jpg',1),(23,'2025-01-27 17:41:30.204','2025-01-27 17:41:30.204','uploads/file/menu5.jpg','253ff76a3b4e8c5e96264e6ee7e3aef5','menu5.jpg',1);
/*!40000 ALTER TABLE `banner_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_models`
--

DROP TABLE IF EXISTS `chat_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_models` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `nick_name` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像',
  `content` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '内容',
  `ip` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ip',
  `addr` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
  `is_group` tinyint(1) DEFAULT NULL COMMENT '是否是群组消息',
  `msg_type` tinyint DEFAULT NULL COMMENT '消息类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_models`
--

LOCK TABLES `chat_models` WRITE;
/*!40000 ALTER TABLE `chat_models` DISABLE KEYS */;
INSERT INTO `chat_models` VALUES (1,'2024-11-26 14:29:57.435','2024-11-26 14:29:57.435','','','无聊的乔丹 离开聊天室','127.0.0.1','内网',1,7),(2,'2024-11-26 14:32:01.937','2024-11-26 14:32:01.937','贝利在巴黎徒步','uploads/chat_avatar/贝.png','贝利在巴黎徒步 进入聊天室','127.0.0.1','内网',1,1),(3,'2024-11-26 14:32:23.165','2024-11-26 14:32:23.165','贝利在巴黎徒步','uploads/chat_avatar/贝.png','这是1','127.0.0.1','内网',1,2),(4,'2024-11-26 14:32:31.148','2024-11-26 14:32:31.148','贝利在巴黎徒步','uploads/chat_avatar/贝.png','这是2','127.0.0.1','内网',1,2),(6,'2025-01-13 18:18:44.414','2025-01-13 18:18:44.414','含糊的西瓜太郎','uploads/chat_avatar/含.png','含糊的西瓜太郎 进入聊天室','127.0.0.1','内网地址',1,1),(7,'2025-01-13 18:18:48.539','2025-01-13 18:18:48.539','含糊的西瓜太郎','uploads/chat_avatar/含.png','你好','127.0.0.1','内网地址',1,2),(8,'2025-01-13 23:14:27.403','2025-01-13 23:14:27.403','含糊的西瓜太郎','uploads/chat_avatar/含.png','含糊的西瓜太郎 离开聊天室','127.0.0.1','内网地址',1,7),(9,'2025-01-14 17:37:58.697','2025-01-14 17:37:58.697','儒雅的贝克汉姆','uploads/chat_avatar/儒.png','儒雅的贝克汉姆 进入聊天室','127.0.0.1','内网地址',1,1),(10,'2025-01-14 17:38:07.059','2025-01-14 17:38:07.059','鸣人大力出奇迹','uploads/chat_avatar/鸣.png','鸣人大力出奇迹 进入聊天室','127.0.0.1','内网地址',1,1),(11,'2025-01-14 17:38:12.470','2025-01-14 17:38:12.470','鸣人大力出奇迹','uploads/chat_avatar/鸣.png','你好\n','127.0.0.1','内网地址',1,2),(12,'2025-01-14 17:38:20.808','2025-01-14 17:38:20.808','儒雅的贝克汉姆','uploads/chat_avatar/儒.png','这是','127.0.0.1','内网地址',1,2),(13,'2025-01-14 17:38:27.025','2025-01-14 17:38:27.025','鸣人大力出奇迹','uploads/chat_avatar/鸣.png','鸣人大力出奇迹 离开聊天室','127.0.0.1','内网地址',1,7),(14,'2025-01-14 17:38:29.196','2025-01-14 17:38:29.196','普斯卡什救了一个美女','uploads/chat_avatar/普.png','普斯卡什救了一个美女 进入聊天室','127.0.0.1','内网地址',1,1),(15,'2025-01-30 20:55:43.087','2025-01-30 20:55:43.087','优美的罗马里奥','uploads/chat_avatar/优.png','优美的罗马里奥 进入聊天室','127.0.0.1','内网地址',1,1),(16,'2025-01-30 20:55:48.954','2025-01-30 20:55:48.954','优美的罗马里奥','uploads/chat_avatar/优.png','你好\n','127.0.0.1','内网地址',1,2),(17,'2025-01-30 20:56:00.566','2025-01-30 20:56:00.566','优美的罗马里奥','uploads/chat_avatar/优.png','优美的罗马里奥 离开聊天室','127.0.0.1','内网地址',1,7);
/*!40000 ALTER TABLE `chat_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_models`
--

DROP TABLE IF EXISTS `comment_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment_models` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `parent_comment_id` bigint unsigned DEFAULT NULL COMMENT '父评论id',
  `content` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论内容',
  `digg_count` tinyint DEFAULT '0' COMMENT '点赞数',
  `comment_count` tinyint DEFAULT '0' COMMENT '子评论数',
  `article_id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文章id',
  `user_id` bigint unsigned DEFAULT NULL COMMENT '关联的用户id',
  `article_es_id` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `fk_comment_models_sub_comments` (`parent_comment_id`),
  KEY `fk_comment_models_user` (`user_id`),
  KEY `fk_article_models_comment_models` (`article_id`),
  CONSTRAINT `fk_comment_models_sub_comments` FOREIGN KEY (`parent_comment_id`) REFERENCES `comment_models` (`id`),
  CONSTRAINT `fk_comment_models_user` FOREIGN KEY (`user_id`) REFERENCES `user_models` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_models`
--

LOCK TABLES `comment_models` WRITE;
/*!40000 ALTER TABLE `comment_models` DISABLE KEYS */;
INSERT INTO `comment_models` VALUES (4,'2024-11-23 21:17:35.190','2024-11-23 21:18:41.180',NULL,'测试评论优化',0,1,'o2coWZMBoS0-M-vqaMdH',1,NULL),(6,'2024-11-23 21:17:55.870','2024-11-23 21:17:55.870',NULL,'测试评论优化2',0,0,'o2coWZMBoS0-M-vqaMdH',1,NULL),(8,'2024-11-23 21:18:41.182','2025-01-11 18:16:22.734',4,'测试评论优化0+0',0,1,'o2coWZMBoS0-M-vqaMdH',1,NULL),(9,'2025-01-11 17:53:48.826','2025-01-11 17:53:48.826',NULL,'测试评论优化0+0',0,0,'Xzk7RZQBX2Nc4z52Ymfg',1,NULL),(10,'2025-01-11 17:57:06.853','2025-01-11 17:57:06.853',NULL,'测试评论优化宝可梦',0,0,'Xzk7RZQBX2Nc4z52Ymfg',5,NULL),(11,'2025-01-11 18:16:22.736','2025-01-11 18:16:22.736',8,'测试',0,0,'o2coWZMBoS0-M-vqaMdH',1,NULL),(12,'2025-01-13 10:21:53.779','2025-01-13 10:21:53.779',NULL,'你好',0,0,'o2coWZMBoS0-M-vqaMdH',1,NULL),(13,'2025-01-13 10:23:46.193','2025-01-13 10:23:46.193',NULL,'你好',0,0,'Xzk7RZQBX2Nc4z52Ymfg',1,NULL);
/*!40000 ALTER TABLE `comment_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fade_back_models`
--

DROP TABLE IF EXISTS `fade_back_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fade_back_models` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `email` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apply_content` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_apply` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fade_back_models`
--

LOCK TABLES `fade_back_models` WRITE;
/*!40000 ALTER TABLE `fade_back_models` DISABLE KEYS */;
/*!40000 ALTER TABLE `fade_back_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback_models`
--

DROP TABLE IF EXISTS `feedback_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback_models` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `email` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback_models`
--

LOCK TABLES `feedback_models` WRITE;
/*!40000 ALTER TABLE `feedback_models` DISABLE KEYS */;
INSERT INTO `feedback_models` VALUES (1,'2025-01-30 18:48:25.007','2025-01-30 18:48:25.007','1941658318@qq.com','手机端适配不行');
/*!40000 ALTER TABLE `feedback_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_models`
--

DROP TABLE IF EXISTS `image_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image_models` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `path` longtext COLLATE utf8mb4_unicode_ci,
  `hash` longtext COLLATE utf8mb4_unicode_ci,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `suffix` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT 'image',
  `file_location` tinyint DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_models`
--

LOCK TABLES `image_models` WRITE;
/*!40000 ALTER TABLE `image_models` DISABLE KEYS */;
/*!40000 ALTER TABLE `image_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_models`
--

DROP TABLE IF EXISTS `log_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_models` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `created_at` datetime(3) DEFAULT NULL COMMENT '添加时间',
  `updated_at` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `ip` longtext COLLATE utf8mb4_unicode_ci COMMENT 'ip',
  `addr` longtext COLLATE utf8mb4_unicode_ci COMMENT '地址',
  `level` bigint DEFAULT NULL COMMENT '等级',
  `title` longtext COLLATE utf8mb4_unicode_ci COMMENT '标题',
  `content` longtext COLLATE utf8mb4_unicode_ci COMMENT '详情',
  `user_id` bigint unsigned DEFAULT NULL COMMENT '用户id',
  `user_name` longtext COLLATE utf8mb4_unicode_ci COMMENT '用户名',
  `service_name` longtext COLLATE utf8mb4_unicode_ci COMMENT '服务名',
  `status` tinyint(1) DEFAULT NULL COMMENT '登录状态',
  `type` bigint DEFAULT NULL COMMENT '日志类型，1登录，2操作，3运行',
  `readStatus` tinyint(1) DEFAULT '0' COMMENT '阅读状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_models`
--

LOCK TABLES `log_models` WRITE;
/*!40000 ALTER TABLE `log_models` DISABLE KEYS */;
INSERT INTO `log_models` VALUES (1,'2025-01-02 16:27:08.748','2025-01-02 16:27:08.748','127.0.0.1','内网地址',0,'登录成功','--',1,'kongwu','',1,1,0),(2,'2025-01-02 16:27:09.771','2025-01-02 16:27:09.771','127.0.0.1','内网地址',0,'登录成功','--',1,'kongwu','',1,1,0),(3,'2025-01-02 16:27:10.691','2025-01-02 16:27:10.691','127.0.0.1','内网地址',0,'登录成功','--',1,'kongwu','',1,1,0),(4,'2025-01-04 09:36:32.036','2025-01-04 09:36:32.036','1.1.1.1','未知地址',0,'登录成功','--',1,'kongwu','',1,1,0),(5,'2025-01-04 22:29:18.593','2025-01-04 22:29:18.593','1.1.1.1','未知地址',0,'登录成功','--',1,'kongwu','',1,1,0),(6,'2025-01-05 21:10:11.199','2025-01-05 21:10:11.199','1.1.1.1','未知地址',0,'登录成功','--',1,'kongwu','',1,1,0),(7,'2025-01-05 21:32:33.856','2025-01-05 21:32:33.856','1.1.1.1','未知地址',0,'登录成功','--',1,'kongwu','',1,1,0),(8,'2025-01-05 21:57:38.356','2025-01-05 21:57:38.356','1.1.1.1','未知地址',0,'登录成功','--',1,'kongwu','',1,1,0),(9,'2025-01-05 22:03:01.712','2025-01-05 22:03:01.712','1.1.1.1','未知地址',0,'登录成功','--',1,'kongwu','',1,1,0),(10,'2025-01-05 22:23:58.362','2025-01-05 22:23:58.362','1.1.1.1','未知地址',0,'登录成功','--',1,'kongwu','',1,1,0),(13,'2025-01-06 15:45:06.112','2025-01-06 15:45:06.115','1.1.1.1','未知地址',1,'删除日志成功','<div class=\"log_request\">\n	<div class=\"log_request_head\">\n		<span class=\"log_request_method delete\">DELETE</span>\n		<span class=\"log_request_path\">/api/logs/v2</span>\n	</div>\n	<div class=\"log_request_body\">\n		<pre class=\"log_json_body\">{\"id_list\":[11]}</pre>\n	</div>\n</div>\n<div class=\"log_item info\"><div class=\"log_item_label\">IDList</div><div class=\"log_item_content\">[11]</div></div>\n<div class=\"log_item info\"><div class=\"log_item_label\">共删除日志</div><div class=\"log_item_content\">1</div></div>\n\n<div class=\"log_response\">\n	<pre class=\"log_json_body\">{\"code\":0,\"data\":{},\"msg\":\"共删除 1 条日志\"}</pre>\n</div>\n',1,'kongwu','',0,2,0),(15,'2025-01-06 18:51:31.506','2025-01-06 19:23:13.805','1.1.1.1','未知地址',1,'删除日志成功','<div class=\"log_request\">\n	<div class=\"log_request_head\">\n		<span class=\"log_request_method delete\">DELETE</span>\n		<span class=\"log_request_path\">/api/logs/v2</span>\n	</div>\n	<div class=\"log_request_body\">\n		<pre class=\"log_json_body\">{\"id_list\":[14]}</pre>\n	</div>\n</div>\n<div class=\"log_item info\"><div class=\"log_item_label\">IDList</div><div class=\"log_item_content\">[14]</div></div>\n<div class=\"log_item info\"><div class=\"log_item_label\">共删除日志</div><div class=\"log_item_content\">1</div></div>\n\n<div class=\"log_response\">\n	<pre class=\"log_json_body\">{\"code\":0,\"data\":{},\"msg\":\"共删除 1 条日志\"}</pre>\n</div>\n',1,'kongwu','',0,2,1),(16,'2025-01-06 18:51:33.575','2025-01-06 18:52:21.357','1.1.1.1','未知地址',1,'删除日志成功','<div class=\"log_request\">\n	<div class=\"log_request_head\">\n		<span class=\"log_request_method delete\">DELETE</span>\n		<span class=\"log_request_path\">/api/logs/v2</span>\n	</div>\n	<div class=\"log_request_body\">\n		<pre class=\"log_json_body\">{\"id_list\":[12]}</pre>\n	</div>\n</div>\n<div class=\"log_item info\"><div class=\"log_item_label\">IDList</div><div class=\"log_item_content\">[12]</div></div>\n<div class=\"log_item info\"><div class=\"log_item_label\">共删除日志</div><div class=\"log_item_content\">1</div></div>\n\n<div class=\"log_response\">\n	<pre class=\"log_json_body\">{\"code\":0,\"data\":{},\"msg\":\"共删除 1 条日志\"}</pre>\n</div>\n',1,'kongwu','',0,2,1),(17,'2025-01-07 18:51:12.005','2025-01-07 18:51:12.005','1.1.1.1','未知地址',0,'登录成功','--',1,'kongwu','',1,1,0),(18,'2025-01-07 19:17:58.525','2025-01-07 19:17:58.525','127.0.0.1','内网地址',0,'登录成功','--',1,'kongwu','',1,1,0),(19,'2025-01-08 11:04:39.777','2025-01-08 11:04:39.777','1.1.1.1','未知地址',0,'登录成功','--',1,'kongwu','',1,1,0),(20,'2025-01-08 11:21:56.606','2025-01-08 11:21:56.606','1.1.1.1','未知地址',0,'登录成功','--',1,'kongwu','',1,1,0),(21,'2025-01-09 10:16:33.514','2025-01-09 10:16:33.514','127.0.0.1','内网地址',0,'登录成功','--',1,'kongwu','',1,1,0),(22,'2025-01-11 17:53:40.326','2025-01-11 17:53:40.326','127.0.0.1','内网地址',0,'登录成功','--',1,'kongwu','',1,1,0),(23,'2025-01-11 17:56:43.346','2025-01-11 17:56:43.346','127.0.0.1','内网地址',0,'登录成功','--',5,'宝可梦大师','',1,1,0),(24,'2025-01-11 17:57:19.418','2025-01-11 17:57:19.418','1.1.1.1','未知地址',0,'登录成功','--',1,'kongwu','',1,1,0),(25,'2025-01-11 18:02:41.738','2025-01-11 18:02:41.738','127.0.0.1','内网地址',0,'登录成功','--',1,'kongwu','',1,1,0),(26,'2025-01-12 08:35:00.177','2025-01-12 08:35:00.177','1.1.1.1','未知地址',0,'登录成功','--',1,'kongwu','',1,1,0),(27,'2025-01-12 08:40:29.306','2025-01-12 08:40:29.306','1.1.1.1','未知地址',0,'登录成功','--',1,'kongwu','',1,1,0),(28,'2025-01-12 08:43:57.629','2025-01-12 08:43:57.629','1.1.1.1','未知地址',0,'登录成功','--',1,'kongwu','',1,1,0),(29,'2025-01-12 08:46:54.599','2025-01-12 08:46:54.599','1.1.1.1','未知地址',0,'登录成功','--',1,'kongwu','',1,1,0),(30,'2025-01-12 08:54:46.074','2025-01-12 08:54:46.074','1.1.1.1','未知地址',0,'登录成功','--',1,'kongwu','',1,1,0),(31,'2025-01-22 09:30:42.434','2025-01-22 09:30:42.434','1.1.1.1','未知地址',0,'登录成功','--',1,'kongwu','',1,1,0),(32,'2025-01-24 12:33:05.753','2025-01-24 12:33:05.753','1.1.1.1','未知地址',0,'登录成功','--',1,'kongwu','',1,1,0),(33,'2025-01-26 20:49:07.009','2025-01-26 20:49:07.009','127.0.0.1','内网地址',0,'登录成功','--',1,'kongwu','',1,1,0),(34,'2025-01-27 14:16:18.975','2025-01-27 14:16:18.975','1.1.1.1','未知地址',0,'登录成功','--',1,'kongwu','',1,1,0),(35,'2025-01-27 14:43:10.939','2025-01-27 14:43:10.939','127.0.0.1','内网地址',0,'登录成功','--',1,'kongwu','',1,1,0),(36,'2025-01-27 14:53:51.149','2025-01-27 14:53:51.149','1.1.1.1','未知地址',0,'登录成功','--',1,'kongwu','',1,1,0);
/*!40000 ALTER TABLE `log_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_stash_models`
--

DROP TABLE IF EXISTS `log_stash_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_stash_models` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `ip` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addr` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` tinyint DEFAULT NULL,
  `content` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_stash_models`
--

LOCK TABLES `log_stash_models` WRITE;
/*!40000 ALTER TABLE `log_stash_models` DISABLE KEYS */;
INSERT INTO `log_stash_models` VALUES (1,'2025-01-02 16:16:02.540','127.0.0.1','内网',2,'登录成功',1),(2,'2025-01-02 16:16:03.393','127.0.0.1','内网',2,'登录成功',1);
/*!40000 ALTER TABLE `log_stash_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_data_models`
--

DROP TABLE IF EXISTS `login_data_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_data_models` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nick_name` varchar(42) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addr` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_type` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_login_data_models_user_model` (`user_id`),
  CONSTRAINT `fk_login_data_models_user_model` FOREIGN KEY (`user_id`) REFERENCES `user_models` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_data_models`
--

LOCK TABLES `login_data_models` WRITE;
/*!40000 ALTER TABLE `login_data_models` DISABLE KEYS */;
INSERT INTO `login_data_models` VALUES (1,'2025-01-02 16:27:08.752','2025-01-02 16:27:08.752',1,'127.0.0.1','kongwu','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJrb25nd3UiLCJyb2xlIjoxLCJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6Imtvbmd3dSIsImlzcyI6IjEyMzQiLCJleHAiOjE3MzgzOTg0Mjh9.5-_C95LAyOcxKgQcc5gWIDxbfAXm1Ez5QytSUOer_dU','','内网地址',4),(2,'2025-01-02 16:27:09.773','2025-01-02 16:27:09.773',1,'127.0.0.1','kongwu','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJrb25nd3UiLCJyb2xlIjoxLCJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6Imtvbmd3dSIsImlzcyI6IjEyMzQiLCJleHAiOjE3MzgzOTg0Mjl9.n5-QAQtjUj29yAzfHKjgmC8JtnSpuHlAmINH_2wVrUE','','内网地址',4),(3,'2025-01-02 16:27:10.693','2025-01-02 16:27:10.693',1,'127.0.0.1','kongwu','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJrb25nd3UiLCJyb2xlIjoxLCJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6Imtvbmd3dSIsImlzcyI6IjEyMzQiLCJleHAiOjE3MzgzOTg0MzB9._kRn85-tHG0eITt7RRRlOscbTuc-Tzry5AR9SmWhTPU','','内网地址',4),(4,'2025-01-04 09:36:32.042','2025-01-04 09:36:32.042',1,'1.1.1.1','kongwu','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJrb25nd3UiLCJyb2xlIjoxLCJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6Imtvbmd3dSIsImlzcyI6IjEyMzQiLCJleHAiOjE3Mzg1NDY1OTJ9.2sU5TUwqg8tcth9mc8_lXzExYTixoSUIM6dGMLFm43E','','-',4),(5,'2025-01-04 22:29:18.597','2025-01-04 22:29:18.597',1,'1.1.1.1','kongwu','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJrb25nd3UiLCJyb2xlIjoxLCJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6Imtvbmd3dSIsImlzcyI6IjEyMzQiLCJleHAiOjE3Mzg1OTI5NTh9.H861diGNZaV0aBEJXgYqRFEWxFSGlRClZD9DLJGcDSk','','-',4),(6,'2025-01-05 21:10:11.205','2025-01-05 21:10:11.205',1,'1.1.1.1','kongwu','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJrb25nd3UiLCJyb2xlIjoxLCJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6Imtvbmd3dSIsImlzcyI6IjEyMzQiLCJleHAiOjE3Mzg2NzQ2MTF9.u9LZbW3yKFgwhaxmqXY-Cs2oVdLPt8nUPsEm4EbFZAQ','','-',4),(7,'2025-01-05 21:32:33.859','2025-01-05 21:32:33.859',1,'1.1.1.1','kongwu','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJrb25nd3UiLCJyb2xlIjoxLCJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6Imtvbmd3dSIsImlzcyI6IjEyMzQiLCJleHAiOjE3Mzg2NzU5NTN9.POjxA1UYChdtm39ccUTFruME4O1sV0T-Q8Ligkhn7mU','','-',4),(8,'2025-01-05 21:57:38.361','2025-01-05 21:57:38.361',1,'1.1.1.1','kongwu','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJrb25nd3UiLCJyb2xlIjoxLCJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6Imtvbmd3dSIsImlzcyI6IjEyMzQiLCJleHAiOjE3Mzg2Nzc0NTh9.NW7fLuv5FYScMgtVd3RP0RW3q9Zh6dw0IHkQdRadKfA','','-',4),(9,'2025-01-05 22:03:01.715','2025-01-05 22:03:01.715',1,'1.1.1.1','kongwu','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJrb25nd3UiLCJyb2xlIjoxLCJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6Imtvbmd3dSIsImlzcyI6IjEyMzQiLCJleHAiOjE3Mzg2Nzc3ODF9.ppUUuoHNrW9ZLvVW4mCi18ASXzI4yu152WHgDEpWZ3k','','-',4),(10,'2025-01-05 22:23:58.365','2025-01-05 22:23:58.365',1,'1.1.1.1','kongwu','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJrb25nd3UiLCJyb2xlIjoxLCJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6Imtvbmd3dSIsImlzcyI6IjEyMzQiLCJleHAiOjE3Mzg2NzkwMzh9.tsXXrHdI0CHzRq0vrF_Gn_42x4KfHtEVkCP7KZFrZwI','','-',4),(11,'2025-01-05 22:59:24.815','2025-01-05 22:59:24.815',1,'1.1.1.1','kongwu','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJrb25nd3UiLCJyb2xlIjoxLCJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6Imtvbmd3dSIsImlzcyI6IjEyMzQiLCJleHAiOjE3Mzg2ODExNjR9.0aN-LaudwPuCG6Gj4kcj4vtZv1nI1QRxs7LrSJiqFYE','','-',4),(12,'2025-01-06 15:14:22.392','2025-01-06 15:14:22.392',1,'1.1.1.1','kongwu','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJrb25nd3UiLCJyb2xlIjoxLCJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6Imtvbmd3dSIsImlzcyI6IjEyMzQiLCJleHAiOjE3Mzg3Mzk2NjJ9.WER-7OnWqX602MMLbUbwOxlBG_MmmG3oaNcdMoxJubo','','-',4),(13,'2025-01-06 16:26:26.703','2025-01-06 16:26:26.703',1,'1.1.1.1','kongwu','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJrb25nd3UiLCJyb2xlIjoxLCJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6Imtvbmd3dSIsImlzcyI6IjEyMzQiLCJleHAiOjE3Mzg3NDM5ODZ9.KftN9T4Q4ZbTpBPJAWAelJHPnluyHlBEtEyeE3A6oMw','','-',4),(14,'2025-01-07 18:51:12.016','2025-01-07 18:51:12.016',1,'1.1.1.1','kongwu','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJrb25nd3UiLCJyb2xlIjoxLCJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6Imtvbmd3dSIsImlzcyI6IjEyMzQiLCJleHAiOjE3Mzg4MzkwNzJ9.7Zs83M0TCeUU0QM54TIg8_jK2ejopzVNlPEf_cmjzGI','','-',4),(15,'2025-01-07 19:17:58.527','2025-01-07 19:17:58.527',1,'127.0.0.1','kongwu','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJrb25nd3UiLCJyb2xlIjoxLCJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6Imtvbmd3dSIsImlzcyI6IjEyMzQiLCJleHAiOjE3Mzg4NDA2Nzh9.sAkLsQ0zFvUhL487O6zx5SWntUk76cyoNBSP4lw1J64','','内网地址',4),(16,'2025-01-08 11:04:39.781','2025-01-08 11:04:39.781',1,'1.1.1.1','kongwu','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJrb25nd3UiLCJyb2xlIjoxLCJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6Imtvbmd3dSIsImlzcyI6IjEyMzQiLCJleHAiOjE3Mzg4OTc0Nzl9.pt4vRT_G1GxEWxkHsIckhZ5ecEmYOM6sXMlDbt2IbF8','','-',4),(17,'2025-01-08 11:21:56.608','2025-01-08 11:21:56.608',1,'1.1.1.1','kongwu','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJrb25nd3UiLCJyb2xlIjoxLCJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6Imtvbmd3dSIsImlzcyI6IjEyMzQiLCJleHAiOjE3Mzg4OTg1MTZ9.pvsZI3aS1onRG_ZyUNGidIgWFbOUAkRMGIu7MMu5UwQ','','-',4),(18,'2025-01-09 10:16:33.517','2025-01-09 10:16:33.517',1,'127.0.0.1','kongwu','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJrb25nd3UiLCJyb2xlIjoxLCJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6Imtvbmd3dSIsImlzcyI6IjEyMzQiLCJleHAiOjE3Mzg5ODA5OTN9.QeJa5SWlU4_eqJg8-8ynddIY6KK2T0z1DXSQo_Yg7vE','','内网地址',4),(19,'2025-01-11 17:53:40.330','2025-01-11 17:53:40.330',1,'127.0.0.1','kongwu','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJrb25nd3UiLCJyb2xlIjoxLCJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6Imtvbmd3dSIsImlzcyI6IjEyMzQiLCJleHAiOjE3MzkxODEyMjB9.-IaBwb28JM49IL8Xb2ih28tsodIyeQeSq2RTFTgYuBU','','内网地址',4),(20,'2025-01-11 17:56:43.348','2025-01-11 17:56:43.348',5,'127.0.0.1','宝可梦大师','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiLlrp3lj6_moqblpKfluIgiLCJyb2xlIjoxLCJ1c2VyX2lkIjo1LCJ1c2VybmFtZSI6IuWuneWPr-aipuWkp-W4iCIsImlzcyI6IjEyMzQiLCJleHAiOjE3MzkxODE0MDN9.3F0xOZ3BFl5s_nr75zp-B0E2hsrunziguNM6oWCwcAI','','内网地址',4),(21,'2025-01-11 17:57:19.419','2025-01-11 17:57:19.419',1,'1.1.1.1','kongwu','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJrb25nd3UiLCJyb2xlIjoxLCJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6Imtvbmd3dSIsImlzcyI6IjEyMzQiLCJleHAiOjE3MzkxODE0Mzl9.wsXWUOE3ui-YBdJtoXqbo4UPj8XPAJ_3IaStm6ahQBo','','-',4),(22,'2025-01-11 18:02:41.740','2025-01-11 18:02:41.740',1,'127.0.0.1','kongwu','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJrb25nd3UiLCJyb2xlIjoxLCJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6Imtvbmd3dSIsImlzcyI6IjEyMzQiLCJleHAiOjE3MzkxODE3NjF9.5R21AlmkcEI36MtuskYvKZ0lkAepuG-4oYQLofp-Bek','','内网地址',4),(23,'2025-01-12 08:35:00.180','2025-01-12 08:35:00.180',1,'1.1.1.1','kongwu','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJrb25nd3UiLCJyb2xlIjoxLCJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6Imtvbmd3dSIsImV4cCI6MTczNjY0MjEwMH0.MU5E5kc_gM-uwicLpGeS-y8iOo7_QFYYpp77gRgeQLQ','','-',4),(24,'2025-01-12 08:40:29.309','2025-01-12 08:40:29.309',1,'1.1.1.1','kongwu','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJrb25nd3UiLCJyb2xlIjoxLCJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6Imtvbmd3dSIsImV4cCI6MTczNjY0MjQyOX0.eck_oSdy6aBm6_fvEndDl_j_f5UMXEXINLhcAgFTh5s','','-',4),(25,'2025-01-12 08:43:57.632','2025-01-12 08:43:57.632',1,'1.1.1.1','kongwu','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJrb25nd3UiLCJyb2xlIjoxLCJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6Imtvbmd3dSIsImV4cCI6MTczNjY0MjYzN30.fk207Y1ALw2WMPt1ReXw4rwjHtj4Gi6lU0DlYN0voa0','','-',4),(26,'2025-01-12 08:46:54.601','2025-01-12 08:46:54.601',1,'1.1.1.1','kongwu','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJrb25nd3UiLCJyb2xlIjoxLCJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6Imtvbmd3dSIsImV4cCI6MTczNjY0MjgxNH0.UBeWnV9nEDLW9i3Nbgvl0PMafk3Th6jtP8ly3J8XPpw','','-',4),(27,'2025-01-12 08:54:46.078','2025-01-12 08:54:46.078',1,'1.1.1.1','kongwu','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJrb25nd3UiLCJyb2xlIjoxLCJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6Imtvbmd3dSIsImlzcyI6IjEyMzQiLCJleHAiOjE3MzkyMzUyODZ9.y3nXvPhb1MMlmSKCJw8cVnivTnTW2FlLGlw3GrCE5b8','','-',4),(28,'2025-01-22 09:30:42.437','2025-01-22 09:30:42.437',1,'1.1.1.1','kongwu','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJrb25nd3UiLCJyb2xlIjoxLCJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6Imtvbmd3dSIsImlzcyI6IjEyMzQiLCJleHAiOjE3NDAxMDE0NDJ9.QswuEi9g3UmY0QfFW0SVVWZ9N6p10qE0hgl4Tav2fzo','','-',4),(29,'2025-01-24 12:33:05.758','2025-01-24 12:33:05.758',1,'1.1.1.1','kongwu','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJrb25nd3UiLCJyb2xlIjoxLCJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6Imtvbmd3dSIsImlzcyI6IjEyMzQiLCJleHAiOjE3NDAyODUxODV9.ZxIGwsJqTT9wOHoI17AlyDsk8IGg_n7VrLlgpuuICAA','','-',4),(30,'2025-01-26 20:49:07.012','2025-01-26 20:49:07.012',1,'127.0.0.1','kongwu','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJrb25nd3UiLCJyb2xlIjoxLCJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6Imtvbmd3dSIsImlzcyI6IjEyMzQiLCJleHAiOjE3NDA0ODc3NDd9._a6Gn8aQVDD-FY9xnJjxwdMc_iYt0a0oEEjQder1g5k','','内网地址',4),(31,'2025-01-27 14:16:18.981','2025-01-27 14:16:18.981',1,'1.1.1.1','kongwu','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJrb25nd3UiLCJyb2xlIjoxLCJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6Imtvbmd3dSIsImlzcyI6IjEyMzQiLCJleHAiOjE3NDA1NTA1Nzh9.Luo98llybVcvymwlCxTYFOC6UEFUNUghA6QouSOHdyE','','-',4),(32,'2025-01-27 14:43:10.941','2025-01-27 14:43:10.941',1,'127.0.0.1','kongwu','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJrb25nd3UiLCJyb2xlIjoxLCJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6Imtvbmd3dSIsImlzcyI6IjEyMzQiLCJleHAiOjE3NDA1NTIxOTB9.C4mm79S_7onuI6g0fOMeOJcVNvnudGkqtyZsTXglnbI','','内网地址',4),(33,'2025-01-27 14:53:51.150','2025-01-27 14:53:51.150',1,'1.1.1.1','kongwu','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJrb25nd3UiLCJyb2xlIjoxLCJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6Imtvbmd3dSIsImlzcyI6IjEyMzQiLCJleHAiOjE3NDA1NTI4MzF9.WcuN14xIMLIPHcbH2MINlJbA2KmigGyQYX4AdKMgwNE','','-',4);
/*!40000 ALTER TABLE `login_data_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_banner_models`
--

DROP TABLE IF EXISTS `menu_banner_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_banner_models` (
  `menu_id` bigint unsigned DEFAULT NULL,
  `banner_id` bigint unsigned DEFAULT NULL,
  `sort` smallint DEFAULT NULL,
  KEY `fk_menu_banner_models_menu_model` (`menu_id`),
  KEY `fk_menu_banner_models_banner_model` (`banner_id`),
  CONSTRAINT `fk_menu_banner_models_banner_model` FOREIGN KEY (`banner_id`) REFERENCES `banner_models` (`id`),
  CONSTRAINT `fk_menu_banner_models_menu_model` FOREIGN KEY (`menu_id`) REFERENCES `menu_models` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_banner_models`
--

LOCK TABLES `menu_banner_models` WRITE;
/*!40000 ALTER TABLE `menu_banner_models` DISABLE KEYS */;
INSERT INTO `menu_banner_models` VALUES (15,19,1),(16,20,1),(18,22,1);
/*!40000 ALTER TABLE `menu_banner_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_models`
--

DROP TABLE IF EXISTS `menu_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_models` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `title` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slogan` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abstract` longtext COLLATE utf8mb4_unicode_ci,
  `abstract_time` bigint DEFAULT NULL,
  `banner_time` bigint DEFAULT NULL,
  `sort` smallint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_models`
--

LOCK TABLES `menu_models` WRITE;
/*!40000 ALTER TABLE `menu_models` DISABLE KEYS */;
INSERT INTO `menu_models` VALUES (15,'2025-01-27 18:12:05.491','2025-01-27 18:12:05.491','首页','/','hello world','need a little romance',3,6,2),(16,'2025-01-27 18:14:47.959','2025-01-27 18:14:47.959','搜索','/search','This is a new','All the news that’s fit to print',3,6,2),(18,'2025-01-27 18:16:35.259','2025-01-27 18:16:35.259','聊天室','/chat','This is a new','All the news that’s fit to print',3,6,1);
/*!40000 ALTER TABLE `menu_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_models`
--

DROP TABLE IF EXISTS `message_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_models` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `send_user_id` bigint unsigned NOT NULL,
  `send_user_nicek_name` varchar(42) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `send_user_avatar` longtext COLLATE utf8mb4_unicode_ci COMMENT '发送人头像',
  `rev_user_id` bigint unsigned NOT NULL,
  `rev_user_nicek_name` varchar(42) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rev_user_avatar` longtext COLLATE utf8mb4_unicode_ci COMMENT '接收人头像',
  `is_read` tinyint(1) DEFAULT '0' COMMENT '接收人是否查看',
  `content` longtext COLLATE utf8mb4_unicode_ci COMMENT '消息内容',
  `send_user_nick_name` varchar(42) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发送人昵称',
  `rev_user_nick_name` varchar(42) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '接收人昵称',
  PRIMARY KEY (`id`,`send_user_id`,`rev_user_id`),
  KEY `fk_message_models_send_user_model` (`send_user_id`),
  KEY `fk_message_models_rev_user_model` (`rev_user_id`),
  CONSTRAINT `fk_message_models_rev_user_model` FOREIGN KEY (`rev_user_id`) REFERENCES `user_models` (`id`),
  CONSTRAINT `fk_message_models_send_user_model` FOREIGN KEY (`send_user_id`) REFERENCES `user_models` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_models`
--

LOCK TABLES `message_models` WRITE;
/*!40000 ALTER TABLE `message_models` DISABLE KEYS */;
INSERT INTO `message_models` VALUES (1,'2024-11-07 15:58:21.013','2024-11-07 15:58:21.013',1,NULL,'/uploads/avatar/default.png',3,NULL,'/uploads/avatar/default.png',0,'你好','kongwu','张三'),(2,'2025-01-07 19:18:45.956','2025-01-07 19:18:45.956',1,NULL,'/uploads/avatar/default.png',10,NULL,'/uploads/avatar/default.png',0,'测试1','kongwu','菊草叶'),(3,'2025-01-07 19:18:50.560','2025-01-07 19:18:50.560',1,NULL,'/uploads/avatar/default.png',10,NULL,'/uploads/avatar/default.png',0,'测试2','kongwu','菊草叶'),(4,'2025-01-07 19:18:54.935','2025-01-07 19:18:54.935',1,NULL,'/uploads/avatar/default.png',10,NULL,'/uploads/avatar/default.png',0,'测试3','kongwu','菊草叶'),(5,'2025-01-07 19:19:18.918','2025-01-07 19:19:18.918',10,NULL,'/uploads/avatar/default.png',1,NULL,'/uploads/avatar/default.png',0,'测试4','菊草叶','kongwu'),(6,'2025-01-09 18:52:30.711','2025-01-09 18:52:30.711',1,NULL,'/uploads/avatar/default.png',10,NULL,'/uploads/avatar/default.png',0,'你好','kongwu','菊草叶'),(7,'2025-01-09 18:53:50.552','2025-01-09 18:53:50.552',1,NULL,'/uploads/avatar/default.png',10,NULL,'/uploads/avatar/default.png',0,'测试5','kongwu','菊草叶'),(8,'2025-01-13 10:22:03.901','2025-01-13 10:22:03.901',1,NULL,'/uploads/avatar/default.png',10,NULL,'/uploads/avatar/default.png',0,'你好','kongwu','菊草叶'),(9,'2025-01-14 18:37:14.010','2025-01-14 18:37:14.010',1,NULL,'/uploads/avatar/default.png',7,NULL,'/uploads/avatar/default.png',0,'你好','kongwu','妙蛙种子');
/*!40000 ALTER TABLE `message_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_models`
--

DROP TABLE IF EXISTS `tag_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_models` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `title` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标签的名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_models`
--

LOCK TABLES `tag_models` WRITE;
/*!40000 ALTER TABLE `tag_models` DISABLE KEYS */;
INSERT INTO `tag_models` VALUES (1,'2024-11-14 09:20:32.000','2024-11-14 09:20:37.000','go'),(2,'2024-11-14 09:20:47.000','2024-11-14 09:20:50.000','后端'),(3,'2024-11-14 09:34:10.000','2024-11-14 09:34:16.000','Java'),(4,'2024-11-14 09:34:31.000','2024-11-14 09:34:36.000','Python'),(5,'2024-11-14 09:34:51.000','2024-11-14 09:34:56.000','c'),(6,'2024-11-14 09:35:10.000','2024-11-14 09:35:13.000','基础'),(7,'2024-11-14 09:35:28.000','2024-11-14 09:35:30.000','框架'),(8,'2024-11-14 09:35:43.000','2024-11-14 09:35:45.000','脚本');
/*!40000 ALTER TABLE `tag_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_collect_models`
--

DROP TABLE IF EXISTS `user_collect_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_collect_models` (
  `user_id` bigint unsigned NOT NULL,
  `article_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`article_id`),
  KEY `fk_user_collect_models_article_model` (`article_id`),
  CONSTRAINT `fk_user_collect_models_user_model` FOREIGN KEY (`user_id`) REFERENCES `user_models` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_collect_models`
--

LOCK TABLES `user_collect_models` WRITE;
/*!40000 ALTER TABLE `user_collect_models` DISABLE KEYS */;
INSERT INTO `user_collect_models` VALUES (1,'AWfJJ5MBfk62mTv7iWIa','2024-11-18 17:11:42.582');
/*!40000 ALTER TABLE `user_collect_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_models`
--

DROP TABLE IF EXISTS `user_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_models` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `nick_name` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '昵称',
  `user_name` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salt` longtext COLLATE utf8mb4_unicode_ci,
  `avatar` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像',
  `email` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `tel` varchar(18) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `addr` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
  `token` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '其他平台的唯一id',
  `ip` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ip',
  `role` tinyint DEFAULT '1' COMMENT '权限，1管理员，2普通用户，3游客',
  `sign_status` bigint DEFAULT NULL COMMENT '注册来源，1qq，3邮箱',
  `pass_word` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密码',
  `integral` bigint DEFAULT '0' COMMENT '我的积分',
  `scope` bigint DEFAULT '0' COMMENT '我的积分',
  `sign` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '我的签名',
  `link` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '我的链接地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_models`
--

LOCK TABLES `user_models` WRITE;
/*!40000 ALTER TABLE `user_models` DISABLE KEYS */;
INSERT INTO `user_models` VALUES (1,'2024-11-01 09:34:43.677','2025-02-02 10:12:57.923','kongwu','kongwu','$2a$04$YbEfhwoWFpkze8OnjEP/wemiubqx/9gMNQIrwOQpIPrP8/Vcd8N5e',NULL,'/uploads/file/kongwu/images_20250202101257.png','1941658307@qq.com','','内网地址','','127.0.0.1',1,4,'$2a$04$FEel9gu5HBUN1ps29Tv5L./IZl.PfYm01RxfsMQ3k8h5uKARb33KK',0,0,'2','2'),(3,'2024-11-06 21:30:04.151','2024-11-06 21:30:04.151','张三','zhangsan',NULL,NULL,'/uploads/avatar/default.png','','','内网地址','','127.0.0.1',1,4,'$2a$04$N3DHpABlzRA7o6jkLbqIruBQLS7G0a6/W8WX4V/NlZldw696YDL1a',0,0,NULL,NULL),(4,'2024-11-08 21:16:45.128','2024-11-08 21:16:45.128','admin0','admin',NULL,NULL,'/uploads/avatar/default.png','admin@qq.com','','内网地址','','127.0.0.1',1,4,'$2a$04$B4LI3tNA1lwkgM7nSeCc.OtMroIFThYIFtNfWZ3KRyznbJihGR0u2',0,0,NULL,NULL),(5,'2024-12-25 20:18:53.985','2024-12-25 20:18:53.985','宝可梦大师','宝可梦大师',NULL,NULL,'/uploads/avatar/default.png','','','内网地址','','127.0.0.1',1,4,'$2a$04$iNQnnAZARnc5J9FbIuR18.XNoV/n3gO3egMB5DCikMrl89zYkK/Na',0,0,NULL,NULL),(6,'2024-12-25 20:27:04.620','2024-12-25 20:27:04.620','小火龙','小火龙',NULL,NULL,'/uploads/avatar/default.png','','','内网地址','','127.0.0.1',2,4,'$2a$04$KLkgaldoQn0vZj9HGLNbNOrD5y.6deQFB/zK6QvP.biDGzL/fpvAy',0,0,NULL,NULL),(7,'2024-12-25 20:27:21.184','2024-12-25 20:27:21.184','妙蛙种子','妙蛙种子',NULL,NULL,'/uploads/avatar/default.png','','','内网地址','','127.0.0.1',2,4,'$2a$04$A0YDQtQwTWMA9dM5CvRmVOYZ65NomfSoDI8oOgH1MwwWPTPGxvXxW',0,0,NULL,NULL),(8,'2024-12-25 20:30:00.775','2024-12-25 20:30:00.775','杰尼龟','杰尼龟',NULL,NULL,'/uploads/avatar/default.png','','','内网地址','','127.0.0.1',2,4,'$2a$04$UoAuxJ2sxcndosDF./d4N.ewyfinmF.5KwVFhk1WI4SEaKl8ndfwy',0,0,NULL,NULL),(10,'2024-12-27 21:28:42.271','2024-12-27 21:38:26.214','菊草叶','菊草叶',NULL,NULL,'/uploads/avatar/default.png','','','内网地址','','1.1.1.1',2,4,'$2a$04$hwjU/XGbqY1GfMmXoqP2EO0vkkl8jxh2G69AJxzz.TX/xT/fIqlQq',0,0,NULL,NULL);
/*!40000 ALTER TABLE `user_models` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-02 16:42:49
