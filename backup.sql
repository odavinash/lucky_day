-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: demotask.mysql.pythonanywhere-services.com    Database: demotask$lucky_day
-- ------------------------------------------------------
-- Server version	5.6.40-log

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
-- Table structure for table `app_settings`
--

DROP TABLE IF EXISTS `app_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_settings` (
  `app_settings_id` int(11) NOT NULL AUTO_INCREMENT,
  `top_up_coin` int(11) DEFAULT NULL,
  PRIMARY KEY (`app_settings_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_settings`
--

LOCK TABLES `app_settings` WRITE;
/*!40000 ALTER TABLE `app_settings` DISABLE KEYS */;
INSERT INTO `app_settings` VALUES (1,10);
/*!40000 ALTER TABLE `app_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add user',6,'add_user'),(17,'Can change user',6,'change_user'),(18,'Can delete user',6,'delete_user'),(19,'Can add offer',7,'add_offer'),(20,'Can change offer',7,'change_offer'),(21,'Can delete offer',7,'delete_offer'),(22,'Can add order',8,'add_order'),(23,'Can change order',8,'change_order'),(24,'Can delete order',8,'delete_order'),(25,'Can add profile',9,'add_profile'),(26,'Can change profile',9,'change_profile'),(27,'Can delete profile',9,'delete_profile'),(28,'Can add scratch card',10,'add_scratchcard'),(29,'Can change scratch card',10,'change_scratchcard'),(30,'Can delete scratch card',10,'delete_scratchcard'),(31,'Can add wire transfer',11,'add_wiretransfer'),(32,'Can change wire transfer',11,'change_wiretransfer'),(33,'Can delete wire transfer',11,'delete_wiretransfer'),(34,'Can add leader board',12,'add_leaderboard'),(35,'Can change leader board',12,'change_leaderboard'),(36,'Can delete leader board',12,'delete_leaderboard'),(37,'Can add app_ settings',13,'add_app_settings'),(38,'Can change app_ settings',13,'change_app_settings'),(39,'Can delete app_ settings',13,'delete_app_settings'),(40,'Can add paypal',14,'add_paypal'),(41,'Can change paypal',14,'change_paypal'),(42,'Can delete paypal',14,'delete_paypal'),(43,'Can add redeem offer',15,'add_redeemoffer'),(44,'Can change redeem offer',15,'change_redeemoffer'),(45,'Can delete redeem offer',15,'delete_redeemoffer');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (47,'2019-04-24 15:07:18.236338','39','AVINASH',2,'[{\"changed\": {\"fields\": [\"last_login\", \"first_name\", \"last_name\"]}}]',6,39),(48,'2019-04-24 17:13:13.219539','4','LeaderBoard object (4)',1,'[{\"added\": {}}]',12,39),(49,'2019-04-24 17:17:38.952920','6','LeaderBoard object (6)',2,'[{\"changed\": {\"fields\": [\"rank_no\"]}}]',12,39),(50,'2019-04-24 17:18:57.554620','7','LeaderBoard object (7)',1,'[{\"added\": {}}]',12,39),(51,'2019-04-24 17:26:05.218168','46','Profile object (46)',2,'[{\"changed\": {\"fields\": [\"profile_media\"]}}]',9,39),(52,'2019-04-24 17:39:52.268360','39','Admin',2,'[{\"changed\": {\"fields\": [\"first_name\"]}}]',6,39),(53,'2019-04-24 17:40:04.279012','39','Admin',2,'[{\"changed\": {\"fields\": [\"last_name\"]}}]',6,39),(54,'2019-04-24 17:41:12.701489','43','aa',3,'',6,39),(55,'2019-04-24 17:41:12.710237','42','od',3,'',6,39),(56,'2019-04-24 17:41:12.719879','41','V',3,'',6,39),(57,'2019-04-24 17:41:12.726356','40','V',3,'',6,39),(58,'2019-04-24 17:41:38.208916','4','LeaderBoard object (4)',3,'',12,39),(59,'2019-04-25 06:40:43.640731','46','Vishal',3,'',6,39),(60,'2019-04-26 05:42:31.862686','5','Offer object (5)',1,'[{\"added\": {}}]',7,39),(61,'2019-04-26 05:43:08.801923','6','Offer object (6)',1,'[{\"added\": {}}]',7,39),(62,'2019-04-26 05:44:02.340157','7','Offer object (7)',1,'[{\"added\": {}}]',7,39),(63,'2019-04-26 05:45:08.331245','8','Offer object (8)',1,'[{\"added\": {}}]',7,39),(64,'2019-04-26 05:45:45.838786','9','Offer object (9)',1,'[{\"added\": {}}]',7,39),(65,'2019-04-26 05:46:47.441355','10','Offer object (10)',1,'[{\"added\": {}}]',7,39),(66,'2019-04-26 05:47:14.752652','11','Offer object (11)',1,'[{\"added\": {}}]',7,39),(67,'2019-04-26 05:59:59.080893','12','Offer object (12)',1,'[{\"added\": {}}]',7,39),(68,'2019-04-26 06:00:28.586819','13','Offer object (13)',1,'[{\"added\": {}}]',7,39),(69,'2019-04-26 06:01:13.456049','14','Offer object (14)',1,'[{\"added\": {}}]',7,39),(70,'2019-04-26 06:01:49.460405','15','Offer object (15)',1,'[{\"added\": {}}]',7,39),(71,'2019-04-26 06:02:05.832930','16','Offer object (16)',1,'[{\"added\": {}}]',7,39),(72,'2019-04-26 06:02:18.858187','17','Offer object (17)',1,'[{\"added\": {}}]',7,39),(73,'2019-04-26 16:07:08.373345','1','App_Settings object (1)',1,'[{\"added\": {}}]',13,39),(74,'2019-06-05 11:08:05.305530','55','kp',3,'',6,39),(75,'2019-06-07 05:29:23.130099','18','Offer object (18)',1,'[{\"added\": {}}]',7,39),(76,'2019-06-07 05:31:39.246505','19','Offer object (19)',1,'[{\"added\": {}}]',7,39),(77,'2019-06-07 05:36:01.845629','20','Offer object (20)',1,'[{\"added\": {}}]',7,39),(78,'2019-06-07 05:36:16.618321','21','Offer object (21)',1,'[{\"added\": {}}]',7,39),(79,'2019-06-07 05:36:26.645447','22','Offer object (22)',1,'[{\"added\": {}}]',7,39),(80,'2019-06-07 05:36:52.904193','23','Offer object (23)',1,'[{\"added\": {}}]',7,39),(81,'2019-06-07 05:37:15.949080','24','Offer object (24)',1,'[{\"added\": {}}]',7,39),(82,'2019-06-07 05:38:35.112013','25','Offer object (25)',1,'[{\"added\": {}}]',7,39),(83,'2019-06-07 05:38:44.901039','26','Offer object (26)',1,'[{\"added\": {}}]',7,39),(84,'2019-06-07 05:39:02.475600','27','Offer object (27)',1,'[{\"added\": {}}]',7,39),(85,'2019-06-11 16:48:58.466490','1','RedeemOffer object (1)',1,'[{\"added\": {}}]',15,39),(86,'2019-06-11 16:49:12.939246','2','RedeemOffer object (2)',1,'[{\"added\": {}}]',15,39),(87,'2019-06-12 04:31:45.474830','3','RedeemOffer object (3)',1,'[{\"added\": {}}]',15,39),(88,'2019-06-12 08:47:32.658156','4','RedeemOffer object (4)',1,'[{\"added\": {}}]',15,39),(89,'2019-06-12 08:49:25.981271','5','RedeemOffer object (5)',1,'[{\"added\": {}}]',15,39),(90,'2019-06-12 10:37:21.366880','5','RedeemOffer object (5)',2,'[{\"changed\": {\"fields\": [\"price\"]}}]',15,39),(91,'2019-06-12 11:34:16.926862','2','RedeemOffer object (2)',3,'',15,39),(92,'2019-06-12 11:34:16.942021','1','RedeemOffer object (1)',3,'',15,39),(93,'2019-06-12 11:35:37.055472','6','RedeemOffer object (6)',1,'[{\"added\": {}}]',15,39),(94,'2019-06-12 11:37:25.758152','7','RedeemOffer object (7)',1,'[{\"added\": {}}]',15,39);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(13,'lucky_dayapp','app_settings'),(12,'lucky_dayapp','leaderboard'),(7,'lucky_dayapp','offer'),(8,'lucky_dayapp','order'),(14,'lucky_dayapp','paypal'),(9,'lucky_dayapp','profile'),(15,'lucky_dayapp','redeemoffer'),(10,'lucky_dayapp','scratchcard'),(6,'lucky_dayapp','user'),(11,'lucky_dayapp','wiretransfer'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-04-17 17:36:58.720416'),(2,'contenttypes','0002_remove_content_type_name','2019-04-17 17:36:58.801928'),(3,'auth','0001_initial','2019-04-17 17:37:23.177888'),(4,'auth','0002_alter_permission_name_max_length','2019-04-17 17:37:23.231547'),(5,'auth','0003_alter_user_email_max_length','2019-04-17 17:37:23.253046'),(6,'auth','0004_alter_user_username_opts','2019-04-17 17:37:23.273534'),(7,'auth','0005_alter_user_last_login_null','2019-04-17 17:37:23.288790'),(8,'auth','0006_require_contenttypes_0002','2019-04-17 17:37:23.295814'),(9,'auth','0007_alter_validators_add_error_messages','2019-04-17 17:37:23.310748'),(10,'auth','0008_alter_user_username_max_length','2019-04-17 17:37:23.326886'),(11,'auth','0009_alter_user_last_name_max_length','2019-04-17 17:37:23.342862'),(12,'lucky_dayapp','0001_initial','2019-04-17 17:37:53.372261'),(13,'admin','0001_initial','2019-04-17 17:38:07.237700'),(14,'admin','0002_logentry_remove_auto_add','2019-04-17 17:38:07.256645'),(15,'sessions','0001_initial','2019-04-17 17:38:12.170036'),(16,'lucky_dayapp','0002_user_provider_id','2019-04-19 16:58:20.253322'),(17,'lucky_dayapp','0003_offer_order_profile_scratchcard_wiretransfer','2019-04-19 16:59:20.108512'),(18,'lucky_dayapp','0004_auto_20190419_1657','2019-04-20 04:19:45.104157'),(19,'lucky_dayapp','0005_auto_20190419_1723','2019-04-20 04:19:45.136007'),(20,'lucky_dayapp','0006_remove_order_order_no','2019-04-20 04:57:48.486684'),(21,'lucky_dayapp','0007_auto_20190420_0522','2019-04-20 07:02:40.928261'),(22,'lucky_dayapp','0008_auto_20190420_0553','2019-04-20 07:02:40.971718'),(23,'lucky_dayapp','0009_auto_20190420_0800','2019-04-22 03:40:14.460021'),(24,'lucky_dayapp','0010_app_settings','2019-04-26 16:06:07.304871'),(25,'lucky_dayapp','0011_auto_20190426_1550','2019-04-26 16:06:07.336142'),(26,'lucky_dayapp','0012_paypal','2019-06-11 16:44:43.806919'),(27,'lucky_dayapp','0013_redeemoffer','2019-06-11 16:44:58.181575'),(28,'lucky_dayapp','0014_paypal_amount','2019-06-12 16:11:20.053141'),(29,'lucky_dayapp','0015_auto_20190612_1531','2019-06-12 16:11:20.273263');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('3a54w4smg6flb77zxh6d72cpa7x2sf5y','OTJiYmNhNjA1Mjc1NjZmNjk1YWIxNmRlMDIxYzY1YTQ3ZTc1ZWU2NTp7Il9hdXRoX3VzZXJfaWQiOiIzOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOTZjMTFjYjVkY2ZkOTJhOWRmMGQ2MWUxODhkNjM4ODMzZjIxZGRhNSJ9','2019-06-19 04:19:36.154189'),('68y7tl26t38oahri2zm7oea3sitzuqf4','OTJiYmNhNjA1Mjc1NjZmNjk1YWIxNmRlMDIxYzY1YTQ3ZTc1ZWU2NTp7Il9hdXRoX3VzZXJfaWQiOiIzOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOTZjMTFjYjVkY2ZkOTJhOWRmMGQ2MWUxODhkNjM4ODMzZjIxZGRhNSJ9','2019-05-08 17:12:22.604005'),('8z75oprjvbf5lv4ng7jwsnvtil6n08of','ZWZiZWIxM2Q1NmJhMDE1MTI3MWRiMGM4ZjczZDAzYjYzOGZkMTUzZjp7Il9hdXRoX3VzZXJfaWQiOiIxMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmQzNzRiY2UxMjI3OTljZDUxZTk1ZTQ5Y2Y1Yjk4MTk4ZjUwODUwYSJ9','2019-05-02 06:48:45.928473'),('ejweiw0wy441mlp1fhadrfyf4sl7g823','OTJiYmNhNjA1Mjc1NjZmNjk1YWIxNmRlMDIxYzY1YTQ3ZTc1ZWU2NTp7Il9hdXRoX3VzZXJfaWQiOiIzOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOTZjMTFjYjVkY2ZkOTJhOWRmMGQ2MWUxODhkNjM4ODMzZjIxZGRhNSJ9','2019-05-10 00:58:10.677701'),('fglagb70ay9w3tp4whvrlgd89wbarvch','OTJiYmNhNjA1Mjc1NjZmNjk1YWIxNmRlMDIxYzY1YTQ3ZTc1ZWU2NTp7Il9hdXRoX3VzZXJfaWQiOiIzOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOTZjMTFjYjVkY2ZkOTJhOWRmMGQ2MWUxODhkNjM4ODMzZjIxZGRhNSJ9','2019-05-09 06:38:20.774968'),('mv2f7ubk5wt9rz6atbwo0r1duzl5re6l','OTJiYmNhNjA1Mjc1NjZmNjk1YWIxNmRlMDIxYzY1YTQ3ZTc1ZWU2NTp7Il9hdXRoX3VzZXJfaWQiOiIzOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOTZjMTFjYjVkY2ZkOTJhOWRmMGQ2MWUxODhkNjM4ODMzZjIxZGRhNSJ9','2019-06-20 05:14:59.356599'),('n1rij0ft8hoema7e2xrp287d7r5skdlu','OTJiYmNhNjA1Mjc1NjZmNjk1YWIxNmRlMDIxYzY1YTQ3ZTc1ZWU2NTp7Il9hdXRoX3VzZXJfaWQiOiIzOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOTZjMTFjYjVkY2ZkOTJhOWRmMGQ2MWUxODhkNjM4ODMzZjIxZGRhNSJ9','2019-06-21 05:27:31.965831'),('n4koywoz9d76q2tjnsuu8e5fbyn7mxl4','OTJiYmNhNjA1Mjc1NjZmNjk1YWIxNmRlMDIxYzY1YTQ3ZTc1ZWU2NTp7Il9hdXRoX3VzZXJfaWQiOiIzOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOTZjMTFjYjVkY2ZkOTJhOWRmMGQ2MWUxODhkNjM4ODMzZjIxZGRhNSJ9','2019-05-08 15:06:27.756583'),('ps3ukecfwvtb12xipq1y8vi5rwlknkwx','OTJiYmNhNjA1Mjc1NjZmNjk1YWIxNmRlMDIxYzY1YTQ3ZTc1ZWU2NTp7Il9hdXRoX3VzZXJfaWQiOiIzOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOTZjMTFjYjVkY2ZkOTJhOWRmMGQ2MWUxODhkNjM4ODMzZjIxZGRhNSJ9','2019-05-09 06:40:18.811428'),('zheeieqgyckik3ouicgdbz9a7klbljh2','OTJiYmNhNjA1Mjc1NjZmNjk1YWIxNmRlMDIxYzY1YTQ3ZTc1ZWU2NTp7Il9hdXRoX3VzZXJfaWQiOiIzOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOTZjMTFjYjVkY2ZkOTJhOWRmMGQ2MWUxODhkNjM4ODMzZjIxZGRhNSJ9','2019-06-25 16:45:40.622042');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaderboard`
--

DROP TABLE IF EXISTS `leaderboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leaderboard` (
  `leaderboard_id` int(11) NOT NULL AUTO_INCREMENT,
  `rank_no` int(11) NOT NULL,
  `date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`leaderboard_id`),
  KEY `leaderboard_user_id_09084c20_fk_user_id` (`user_id`),
  CONSTRAINT `leaderboard_user_id_09084c20_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leaderboard`
--

LOCK TABLES `leaderboard` WRITE;
/*!40000 ALTER TABLE `leaderboard` DISABLE KEYS */;
INSERT INTO `leaderboard` VALUES (10,0,'2019-04-24',44),(11,0,'2019-04-24',45),(14,0,'2019-04-25',47),(15,0,'2019-04-25',48),(16,0,'2019-04-25',48),(17,0,'2019-04-25',48),(18,0,'2019-04-25',49),(19,0,'2019-04-25',50),(20,0,'2019-04-26',51),(21,0,'2019-04-26',52),(22,0,'2019-04-27',53),(23,0,'2019-06-05',54),(25,0,'2019-06-05',56),(26,0,'2019-06-05',57),(27,0,'2019-06-05',58),(28,0,'2019-06-05',59),(29,0,'2019-06-05',60),(30,0,'2019-06-05',61),(31,0,'2019-06-06',62),(32,0,'2019-06-06',48),(33,0,'2019-06-07',63),(34,0,'2019-06-11',45);
/*!40000 ALTER TABLE `leaderboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer`
--

DROP TABLE IF EXISTS `offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer` (
  `offer_id` int(11) NOT NULL AUTO_INCREMENT,
  `offer_media` varchar(100) NOT NULL,
  `top_up_coin` int(11) DEFAULT NULL,
  `cash` int(11) DEFAULT NULL,
  PRIMARY KEY (`offer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer`
--

LOCK TABLES `offer` WRITE;
/*!40000 ALTER TABLE `offer` DISABLE KEYS */;
INSERT INTO `offer` VALUES (2,'offer/14467da8-c710-46dc-8108-a6f6151a0b13.png',2000,0),(3,'offer/ea1f0ac8-aa73-4472-ac8e-e880068abfa5.png',5000,0),(4,'offer/f2487180-8cc8-4331-9eed-3d13ed73151a.png',1500,0),(5,'offer/8dce3274-d52b-40be-a860-7501495a09c3.png',5000,0),(6,'offer/ae8cbf0e-79c4-427b-91a6-b35b199ef4d3.png',3000,0),(7,'offer/2029d142-8591-483e-8bec-0a6a32184221.png',2000,10),(8,'offer/e0d3adf8-35b8-4964-a87b-e8061697b89c.png',1000,20),(9,'offer/7845ba8b-286e-492e-a6ed-4bd213c209e6.png',6000,40),(10,'offer/edd2b522-4dda-4d52-bb6e-cf372753b783.png',1000,0),(11,'offer/904110f0-f641-47c6-85cf-10426b49fe5f.png',5000,0),(12,'offer/07277062-dc7c-4eae-b4b9-2150f3d3ef1e.png',2000,1),(13,'offer/725bf4c0-e704-4daa-b4b3-a17c380cb367.png',5000,3),(14,'offer/b7f706c0-4adf-4a78-b6ae-e6c024a61a05.png',4000,2),(15,'offer/9ded7ec3-7d06-476b-a6ce-72f99ceb7968.png',5000,0),(16,'offer/8cbb6fb7-99ad-4280-8197-583eebf9a687.png',3000,2),(17,'offer/7b0a131b-f93b-439f-886d-7d1fc2a1480c.png',7000,5),(18,'offer/446d6e57-0860-4242-9b6e-eb9e66cbd852.png',0,1000),(19,'offer/53bac17a-e277-43ea-a56d-303c8d0e48e4.png',1000,0),(20,'offer/36a5de56-40ca-47fe-ba9d-340b65ee154d.jpg',NULL,NULL),(21,'offer/532cc554-4431-49ce-9798-43dce237fb29.jpg',1,0),(22,'offer/258e53e0-454e-4183-bc08-667435fac55c.jpg',0,8),(23,'offer/4cd34489-f278-48b3-921d-5b3d8c4fca75.jpg',19,0),(24,'offer/e877123e-fbb1-485f-b65b-251682f6bfe0.jpg',90,0),(25,'offer/1092023b-c682-4ff6-8589-b3d92c5d8f97.webp',22,0),(26,'offer/4db43c84-5126-4f4c-b1e6-2738b0b38904.webp',0,99),(27,'offer/b1c9cb5b-0137-4e55-829b-9b7de0cfc0cc.webp',0,88);
/*!40000 ALTER TABLE `offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `datetime` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `order_user_id_e323497c_fk_user_id` (`user_id`),
  CONSTRAINT `order_user_id_e323497c_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (3,'2019-04-25 06:45:05.024254',47),(4,'2019-06-05 04:38:13.070487',54),(5,'2019-06-05 10:00:20.312227',51),(6,'2019-06-05 11:41:50.502282',51),(7,'2019-06-06 05:19:31.233796',57),(8,'2019-06-06 06:20:01.988992',62);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal`
--

DROP TABLE IF EXISTS `paypal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal` (
  `paypal_primary_keys` int(11) NOT NULL AUTO_INCREMENT,
  `paypal_id` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`paypal_primary_keys`),
  KEY `paypal_user_id_cbe6dc31_fk_user_id` (`user_id`),
  CONSTRAINT `paypal_user_id_cbe6dc31_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal`
--

LOCK TABLES `paypal` WRITE;
/*!40000 ALTER TABLE `paypal` DISABLE KEYS */;
INSERT INTO `paypal` VALUES (1,'avi@gmail.com',53,NULL),(2,'test@gmail.com',53,NULL),(3,'bhayanivishal007@gmail.com',51,NULL),(4,'bhayanivishal007@gmail.com',51,NULL),(5,'bhayanivishal007@gmail.com',51,NULL),(6,'bhayanivishal007@gmail.com',51,NULL),(7,'vb@gmail.com',62,NULL),(8,'vb@gmail.com',62,NULL),(9,'vb@gmail.com',62,NULL),(10,'k@gmail.com',62,NULL),(11,'vb@gmail.com',62,NULL),(12,'vb@gmail.com',62,NULL),(13,'vb@gmail.com',62,NULL),(14,'vb@gmail.com',62,NULL),(15,'vb@gmail.com',62,NULL),(16,'k@gmail.com',62,NULL),(17,'bhayanivishal007@gmail.com',51,NULL),(18,'bhayanivishal007@gmail.com',51,NULL),(19,'bhayanivishal007@gmail.com',51,1234.00),(20,'bhayanivishal007@gmail.com',51,1234.00),(21,'vb@gmail.com',62,12345.00),(22,'vb@gmail.com',62,NULL),(23,'bhayanivishal007@gmail.com',51,NULL),(24,'bhayanivishal007@gmail.com',51,NULL),(25,'bhayanivishal007@gmail.com',51,123.00),(26,'vb@gmail.com',62,NULL),(27,'bhayanivishal007@gmail.com',51,123.00),(28,'m@gmail.com',57,1234.00),(29,'vb@gmail.com',57,1.00),(30,'vb@gmail.com',57,12.00),(31,'vb@gmail.com',57,11.00);
/*!40000 ALTER TABLE `paypal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `profile_id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_media` varchar(100) NOT NULL,
  `coin` int(11) DEFAULT NULL,
  `cash` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`profile_id`),
  KEY `profile_user_id_2aeb6f6b_fk_user_id` (`user_id`),
  CONSTRAINT `profile_user_id_2aeb6f6b_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (48,'',NULL,NULL,44),(49,'',NULL,NULL,45),(52,'',NULL,NULL,47),(53,'',NULL,NULL,48),(54,'',NULL,NULL,48),(55,'',NULL,NULL,48),(56,'',0,0,49),(57,'',0,0,50),(58,'profile/f902dd97-70e9-44dc-974f-a828770d2f9f.jpg',50000000,500,51),(59,'',0,0,52),(60,'',0,5,53),(61,'',17000,110,54),(63,'',160500,307,56),(64,'profile/0361d15d-824b-43e8-ba00-d159c7bba8af.png',500000,50,57),(65,'',159500,261,58),(66,'',0,0,59),(67,'',0,0,60),(68,'',0,0,61),(69,'',249980,3610,62),(70,'',0,0,48),(71,'',153373,1960,63),(72,'',0,0,45);
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `redeem_offer`
--

DROP TABLE IF EXISTS `redeem_offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `redeem_offer` (
  `redeem_offer_id` int(11) NOT NULL AUTO_INCREMENT,
  `redeem_offer_media` varchar(100) NOT NULL,
  `title` varchar(500) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `feature` varchar(5000) NOT NULL,
  `description` varchar(10000) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`redeem_offer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `redeem_offer`
--

LOCK TABLES `redeem_offer` WRITE;
/*!40000 ALTER TABLE `redeem_offer` DISABLE KEYS */;
INSERT INTO `redeem_offer` VALUES (3,'offer/d748fca4-2ee2-4848-8a8a-7c8275119e6b.png','Amazon',5000,'Gift Card For 500 INR','Gift Card For 500 INR description',1),(4,'offer/d271b132-608d-4f27-b24c-3a64d8770deb.jpg','Amazon',150000,'Amazon','Amazon',1),(5,'offer/2bb51c78-d733-46ab-a75f-e19062eae91b.jpg','Amazon',5000,'Amazon','Amazon',1),(6,'offer/aea977ac-524b-45f4-b36b-86b594b0857c.jpg','AMAZON PRIME INDIA',10,'Amazon','Amazon',1),(7,'offer/58e21584-e5e1-40a4-a308-ef1f994ab5eb.png','Redeem Offers',10000,'Gift Card For 500 INR','Redeem Offers',1);
/*!40000 ALTER TABLE `redeem_offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scratch_card`
--

DROP TABLE IF EXISTS `scratch_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scratch_card` (
  `scratch_card_id` int(11) NOT NULL AUTO_INCREMENT,
  `offer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`scratch_card_id`),
  KEY `scratch_card_offer_id_c25bc058_fk_offer_offer_id` (`offer_id`),
  KEY `scratch_card_user_id_e14ceb25_fk_user_id` (`user_id`),
  CONSTRAINT `scratch_card_offer_id_c25bc058_fk_offer_offer_id` FOREIGN KEY (`offer_id`) REFERENCES `offer` (`offer_id`),
  CONSTRAINT `scratch_card_user_id_e14ceb25_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=436 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scratch_card`
--

LOCK TABLES `scratch_card` WRITE;
/*!40000 ALTER TABLE `scratch_card` DISABLE KEYS */;
INSERT INTO `scratch_card` VALUES (14,4,51),(15,4,51),(16,4,51),(17,10,51),(18,10,51),(19,10,51),(20,9,51),(21,9,51),(22,11,51),(23,11,51),(24,6,51),(25,6,51),(26,6,51),(27,17,51),(28,17,51),(29,17,51),(30,2,51),(31,17,53),(32,17,54),(33,17,54),(34,17,54),(35,17,54),(36,17,54),(37,10,54),(38,10,54),(39,16,54),(40,16,54),(41,16,54),(42,16,54),(43,16,54),(44,16,54),(45,15,54),(46,15,54),(47,15,54),(52,10,54),(56,12,54),(57,12,54),(58,12,54),(59,14,54),(60,14,54),(61,14,54),(62,2,51),(63,2,51),(64,13,54),(65,13,54),(66,11,54),(67,11,54),(68,11,54),(69,5,54),(70,5,54),(71,4,54),(72,4,54),(73,7,54),(74,2,54),(75,2,54),(76,2,54),(77,9,54),(78,9,54),(79,9,54),(85,3,54),(86,3,54),(89,16,51),(90,16,51),(91,16,51),(92,2,51),(93,13,51),(94,13,51),(95,3,51),(96,5,51),(97,2,51),(98,12,51),(99,12,51),(100,12,51),(101,15,51),(102,15,51),(103,2,51),(104,3,51),(105,14,51),(106,14,51),(107,6,54),(108,6,54),(109,6,54),(126,7,51),(127,7,51),(128,7,51),(129,3,51),(137,17,56),(138,17,56),(139,17,56),(140,9,56),(141,9,56),(142,9,56),(143,16,56),(144,16,56),(145,16,56),(146,13,56),(147,13,56),(148,13,56),(149,8,54),(150,8,54),(151,8,54),(152,15,56),(153,15,56),(154,15,56),(155,6,56),(156,6,56),(157,6,56),(158,3,56),(159,3,56),(160,3,56),(161,14,56),(162,14,56),(163,12,56),(164,12,56),(165,12,56),(166,7,56),(167,7,56),(168,7,56),(169,5,56),(170,5,56),(171,11,56),(172,11,56),(173,10,56),(174,10,56),(175,4,56),(176,4,56),(177,4,56),(178,8,56),(179,8,56),(180,8,56),(181,8,56),(182,8,56),(183,8,56),(184,2,56),(185,2,56),(186,2,56),(187,17,57),(188,17,57),(189,17,57),(190,17,57),(191,16,57),(192,16,57),(193,16,57),(194,16,57),(195,16,57),(196,15,57),(197,12,57),(198,12,57),(199,12,57),(200,11,57),(201,11,57),(202,14,57),(203,14,57),(204,14,57),(205,13,57),(206,13,57),(207,13,57),(208,10,57),(209,10,57),(210,10,57),(211,9,57),(212,9,57),(213,8,57),(214,8,57),(215,8,57),(216,6,57),(217,6,57),(218,6,57),(219,17,58),(220,17,58),(221,17,58),(222,16,58),(223,16,58),(224,15,58),(225,15,58),(226,14,58),(227,14,58),(228,12,58),(229,12,58),(230,13,58),(231,13,58),(232,11,58),(233,11,58),(234,11,58),(235,5,58),(236,5,58),(237,5,58),(238,5,58),(239,9,58),(240,9,58),(241,9,58),(242,8,58),(243,8,58),(244,8,58),(245,8,58),(246,7,57),(247,7,57),(248,5,57),(249,5,57),(250,3,57),(251,2,57),(252,4,57),(253,4,57),(254,4,57),(255,10,58),(256,10,58),(257,10,58),(258,3,58),(259,3,58),(260,3,58),(261,4,58),(262,4,58),(263,4,58),(264,17,62),(265,17,62),(266,17,62),(267,6,58),(268,6,58),(269,6,58),(270,2,58),(271,2,58),(272,2,58),(273,15,62),(274,15,62),(275,15,62),(276,7,58),(277,7,58),(278,7,58),(279,12,62),(280,12,62),(281,12,62),(282,16,62),(283,16,62),(284,14,62),(285,14,62),(286,14,62),(287,13,62),(288,13,62),(289,13,62),(290,11,62),(291,11,62),(292,11,62),(293,11,62),(294,11,62),(295,2,62),(296,2,62),(297,26,62),(298,25,62),(299,24,62),(300,24,62),(301,24,62),(302,24,62),(303,27,62),(304,27,62),(305,27,62),(306,23,62),(307,23,62),(308,23,62),(309,23,62),(310,21,62),(311,21,62),(312,22,62),(313,22,62),(314,22,62),(315,22,62),(316,22,62),(317,20,62),(318,20,62),(319,20,62),(320,20,62),(321,20,62),(322,18,62),(323,18,62),(324,18,62),(325,9,62),(326,9,62),(327,19,62),(328,19,62),(329,19,62),(330,20,62),(331,20,62),(332,19,62),(333,19,62),(334,19,62),(335,10,62),(336,10,62),(337,7,62),(338,7,62),(339,7,62),(340,8,62),(341,8,62),(342,8,62),(343,6,62),(344,6,62),(345,6,62),(346,5,62),(347,5,62),(348,5,62),(349,5,62),(350,5,62),(351,6,62),(352,6,62),(353,6,62),(354,5,62),(355,5,62),(356,6,62),(357,6,62),(358,6,62),(359,5,62),(360,5,62),(361,3,62),(362,3,62),(363,3,62),(364,4,62),(365,4,62),(366,4,62),(367,3,62),(368,3,62),(369,3,62),(370,3,62),(371,3,62),(372,27,63),(373,27,63),(374,26,63),(375,26,63),(376,25,63),(377,25,63),(378,25,63),(379,26,63),(380,26,63),(381,23,63),(382,23,63),(383,24,63),(384,24,63),(385,22,63),(386,22,63),(387,21,63),(388,21,63),(389,21,63),(390,23,63),(391,23,63),(392,23,63),(393,23,63),(394,11,63),(395,11,63),(396,11,63),(397,11,63),(398,11,63),(399,15,63),(400,9,63),(401,9,63),(402,9,63),(403,9,63),(404,9,63),(405,9,63),(406,9,63),(407,9,63),(408,16,63),(409,16,63),(410,16,63),(411,12,63),(412,7,63),(413,5,63),(414,19,63),(415,4,63),(416,4,63),(417,2,63),(418,2,63),(419,2,63),(420,2,63),(421,2,63),(422,2,63),(423,3,63),(424,3,63),(425,3,63),(426,6,63),(427,18,63),(428,8,63),(429,17,63),(430,17,63),(431,17,63),(432,10,63),(433,2,51),(434,3,51),(435,2,51);
/*!40000 ALTER TABLE `scratch_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `email` varchar(254) NOT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(150) DEFAULT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `provider_id` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (39,'pbkdf2_sha256$100000$4G6m4GC6zT6i$hRwmZ3N2oU1dmYD+GSbik0sKI777LTeblwr1frH4bS8=','2019-06-11 16:45:40.610015',1,'admin@gmail.com','Admin','Admin',1,1,''),(44,'pbkdf2_sha256$100000$PcMxjCyf73hJ$s458NSFnAU/eZmf5X+MOHGjnUBDLhmt+l/+eWHaJg4k=',NULL,0,'ashwmadhu786@gmail.com','AVINASH','OD',0,1,''),(45,'pbkdf2_sha256$100000$G6QvEvpbTJgN$LBcZuvc75ZSdVNHnNzLfOwF7y/c4167+3Pa5GUwhYwg=',NULL,0,'test@gmail.com','test','test 2',0,1,'5615615616515615665'),(47,'pbkdf2_sha256$100000$zsiYZEqHrOdj$fa58il0eO6LZcM6lLt60RDEITEc21Uxcum7TZbF1qPs=',NULL,0,'pooja123@gmail.com','p','p',0,1,''),(48,'',NULL,0,'Vishal@gmail.com','Vishal','Bhayani',0,1,'2324179037674543'),(49,'pbkdf2_sha256$100000$gKX13beAnVYI$CsYTIw/DxlYOK5anKOPN7mL01NF78F1l9A9Z4wTHuqI=',NULL,0,'aaa@gmail.com','avi','od',0,1,''),(50,'',NULL,0,'aaa12@gmail.com','AVINASH','OD',0,1,'aaaaa'),(51,'pbkdf2_sha256$100000$HCN60XISgDTo$esipVUt/lmGzSLYJ9TW6QJ+oAnaHYtWkXmvQalzr7/0=',NULL,0,'j@gmail.com','jack','jonas',0,1,''),(52,'pbkdf2_sha256$100000$acXEDhXausUC$9jzrihTEmoK0/IcNkhn3FKLTKfx72Xmvpuw5+cZpNdg=',NULL,0,'ashwmadhu1207@gmail.com','AVINASH','OD',0,1,''),(53,'pbkdf2_sha256$100000$pTepFkcnfeox$sL8/G/GMHXQXUFT+nodSEs7niiAr9+/WajFjZtClOkQ=',NULL,0,'ashwmadhu12@gmail.com','AVINASH','OD',0,1,''),(54,'pbkdf2_sha256$100000$mvNJIsYIf65J$pZbji9SNSAUWycQKkYPB2RIRuuYRgYWOjN4nMf1bbNU=',NULL,0,'h@gmail.com','herry','patel',0,1,''),(56,'pbkdf2_sha256$100000$HnwRqTOVZPoF$9qDvgPiB/iEHQK/DRfLkRCgLFIf0rO2MRq8WcFw6Pec=',NULL,0,'sd@gmail.com','sd','sd',0,1,''),(57,'pbkdf2_sha256$100000$7di9dkm2O8Ie$qNr82F7JoC//J69ENS9Fj//n1Xfma/75OTHfOgSouo4=',NULL,0,'vb@gmail.com','vb','vb',0,1,''),(58,'pbkdf2_sha256$100000$COJoXK7lZWa9$cIP5qBHDZSYDB7/fR/Tw7jzv9b8YxaRtVnpXRvJiZCw=',NULL,0,'jess@gmail.com','jesss','patel',0,1,''),(59,'pbkdf2_sha256$100000$BEg1uCdzrvPc$UOpD6erIfsuD/JIGtpY26smgSJ6XYNl1KswxxkebUFw=',NULL,0,'z@gmail.com','zain','patel',0,1,''),(60,'pbkdf2_sha256$100000$fkf08YFiVNlE$s5gKrmhQY/Bzr/PNxCs5gBSS454PK2KhPHeMDXp8ulA=',NULL,0,'zil@gmail.com','zil','zil',0,1,''),(61,'pbkdf2_sha256$100000$qeq5eN1bSmBP$3jYZbVTB/mpB0QITGc5FOAg8PqfutvDeKJyVpPDKMzk=',NULL,0,'abc@gmail.com','abc','abc',0,1,''),(62,'pbkdf2_sha256$100000$DkaoBRShNpgV$OzEunuAJuxRkM9ZQwnGufYxZWih0ueKf/i5anEXoQzY=',NULL,0,'m@gmail.com','jacky','manakh',0,1,''),(63,'pbkdf2_sha256$100000$TWvmr3oE1j7n$A1Fa6J4yHu8AUZ3lyZnyWxLQ0l7T7yyQyFmwSIu5CoE=',NULL,0,'sid@gmail.com','sid','gajera',0,1,'');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_groups_user_id_group_id_40beef00_uniq` (`user_id`,`group_id`),
  KEY `user_groups_group_id_b76f8aba_fk_auth_group_id` (`group_id`),
  CONSTRAINT `user_groups_group_id_b76f8aba_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_groups_user_id_abaea130_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user_permissions`
--

DROP TABLE IF EXISTS `user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_user_permissions_user_id_permission_id_7dc6e2e0_uniq` (`user_id`,`permission_id`),
  KEY `user_user_permission_permission_id_9deb68a3_fk_auth_perm` (`permission_id`),
  CONSTRAINT `user_user_permission_permission_id_9deb68a3_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_user_permissions_user_id_ed4a47ea_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user_permissions`
--

LOCK TABLES `user_user_permissions` WRITE;
/*!40000 ALTER TABLE `user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wire_transfer`
--

DROP TABLE IF EXISTS `wire_transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wire_transfer` (
  `wire_transfer_id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_no` varchar(18) NOT NULL,
  `ifsc` varchar(18) DEFAULT NULL,
  `swift` varchar(18) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`wire_transfer_id`),
  KEY `wire_transfer_user_id_c00afc4e_fk_user_id` (`user_id`),
  CONSTRAINT `wire_transfer_user_id_c00afc4e_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wire_transfer`
--

LOCK TABLES `wire_transfer` WRITE;
/*!40000 ALTER TABLE `wire_transfer` DISABLE KEYS */;
INSERT INTO `wire_transfer` VALUES (4,'9565959595','bsbsbdb','bsbdbd',25.00,62),(5,'543434','sdfsd1f561','jk4551',1561.00,62),(6,'1','w','q',1.00,62);
/*!40000 ALTER TABLE `wire_transfer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-13 18:24:01
