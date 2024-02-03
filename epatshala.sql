CREATE DATABASE  IF NOT EXISTS `epatshala` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `epatshala`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: epatshala
-- ------------------------------------------------------
-- Server version	8.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add studentregister',7,'add_studentregister'),(26,'Can change studentregister',7,'change_studentregister'),(27,'Can delete studentregister',7,'delete_studentregister'),(28,'Can view studentregister',7,'view_studentregister'),(29,'Can add addclass',8,'add_addclass'),(30,'Can change addclass',8,'change_addclass'),(31,'Can delete addclass',8,'delete_addclass'),(32,'Can view addclass',8,'view_addclass'),(33,'Can add addsection',9,'add_addsection'),(34,'Can change addsection',9,'change_addsection'),(35,'Can delete addsection',9,'delete_addsection'),(36,'Can view addsection',9,'view_addsection'),(37,'Can add calender',10,'add_calender'),(38,'Can change calender',10,'change_calender'),(39,'Can delete calender',10,'delete_calender'),(40,'Can view calender',10,'view_calender'),(41,'Can add userregister',11,'add_userregister'),(42,'Can change userregister',11,'change_userregister'),(43,'Can delete userregister',11,'delete_userregister'),(44,'Can view userregister',11,'view_userregister'),(45,'Can add classwork',12,'add_classwork'),(46,'Can change classwork',12,'change_classwork'),(47,'Can delete classwork',12,'delete_classwork'),(48,'Can view classwork',12,'view_classwork'),(49,'Can add home work',13,'add_homework'),(50,'Can change home work',13,'change_homework'),(51,'Can delete home work',13,'delete_homework'),(52,'Can view home work',13,'view_homework'),(53,'Can add management members',14,'add_managementmembers'),(54,'Can change management members',14,'change_managementmembers'),(55,'Can delete management members',14,'delete_managementmembers'),(56,'Can view management members',14,'view_managementmembers'),(57,'Can add message',15,'add_message'),(58,'Can change message',15,'change_message'),(59,'Can delete message',15,'delete_message'),(60,'Can view message',15,'view_message'),(61,'Can add account head',16,'add_accounthead'),(62,'Can change account head',16,'change_accounthead'),(63,'Can delete account head',16,'delete_accounthead'),(64,'Can view account head',16,'view_accounthead'),(65,'Can add castes',17,'add_castes'),(66,'Can change castes',17,'change_castes'),(67,'Can delete castes',17,'delete_castes'),(68,'Can view castes',17,'view_castes'),(69,'Can add academic master',18,'add_academicmaster'),(70,'Can change academic master',18,'change_academicmaster'),(71,'Can delete academic master',18,'delete_academicmaster'),(72,'Can view academic master',18,'view_academicmaster'),(73,'Can add caste operator',19,'add_casteoperator'),(74,'Can change caste operator',19,'change_casteoperator'),(75,'Can delete caste operator',19,'delete_casteoperator'),(76,'Can view caste operator',19,'view_casteoperator'),(77,'Can add mst subject',20,'add_mstsubject'),(78,'Can change mst subject',20,'change_mstsubject'),(79,'Can delete mst subject',20,'delete_mstsubject'),(80,'Can view mst subject',20,'view_mstsubject'),(81,'Can add religion',21,'add_religion'),(82,'Can change religion',21,'change_religion'),(83,'Can delete religion',21,'delete_religion'),(84,'Can view religion',21,'view_religion'),(85,'Can add subcaste',22,'add_subcaste'),(86,'Can change subcaste',22,'change_subcaste'),(87,'Can delete subcaste',22,'delete_subcaste'),(88,'Can view subcaste',22,'view_subcaste'),(89,'Can add subject staff class mapping',23,'add_subjectstaffclassmapping'),(90,'Can change subject staff class mapping',23,'change_subjectstaffclassmapping'),(91,'Can delete subject staff class mapping',23,'delete_subjectstaffclassmapping'),(92,'Can view subject staff class mapping',23,'view_subjectstaffclassmapping'),(93,'Can add notice circular',24,'add_noticecircular'),(94,'Can change notice circular',24,'change_noticecircular'),(95,'Can delete notice circular',24,'delete_noticecircular'),(96,'Can view notice circular',24,'view_noticecircular'),(97,'Can add language mapping',25,'add_languagemapping'),(98,'Can change language mapping',25,'change_languagemapping'),(99,'Can delete language mapping',25,'delete_languagemapping'),(100,'Can view language mapping',25,'view_languagemapping'),(101,'Can add mst assesment',26,'add_mstassesment'),(102,'Can change mst assesment',26,'change_mstassesment'),(103,'Can delete mst assesment',26,'delete_mstassesment'),(104,'Can view mst assesment',26,'view_mstassesment'),(105,'Can add student selected subject',27,'add_studentselectedsubject'),(106,'Can change student selected subject',27,'change_studentselectedsubject'),(107,'Can delete student selected subject',27,'delete_studentselectedsubject'),(108,'Can view student selected subject',27,'view_studentselectedsubject'),(109,'Can add assessment marks',28,'add_assessmentmarks'),(110,'Can change assessment marks',28,'change_assessmentmarks'),(111,'Can delete assessment marks',28,'delete_assessmentmarks'),(112,'Can view assessment marks',28,'view_assessmentmarks'),(113,'Can add leave staff',29,'add_leavestaff'),(114,'Can change leave staff',29,'change_leavestaff'),(115,'Can delete leave staff',29,'delete_leavestaff'),(116,'Can view leave staff',29,'view_leavestaff'),(117,'Can add student attendance',30,'add_studentattendance'),(118,'Can change student attendance',30,'change_studentattendance'),(119,'Can delete student attendance',30,'delete_studentattendance'),(120,'Can view student attendance',30,'view_studentattendance'),(121,'Can add expense head',31,'add_expensehead'),(122,'Can change expense head',31,'change_expensehead'),(123,'Can delete expense head',31,'delete_expensehead'),(124,'Can view expense head',31,'view_expensehead'),(125,'Can add mst feedback',32,'add_mstfeedback'),(126,'Can change mst feedback',32,'change_mstfeedback'),(127,'Can delete mst feedback',32,'delete_mstfeedback'),(128,'Can view mst feedback',32,'view_mstfeedback'),(129,'Can add institution profile',33,'add_institutionprofile'),(130,'Can change institution profile',33,'change_institutionprofile'),(131,'Can delete institution profile',33,'delete_institutionprofile'),(132,'Can view institution profile',33,'view_institutionprofile'),(133,'Can add student feeback',34,'add_studentfeeback'),(134,'Can change student feeback',34,'change_studentfeeback'),(135,'Can delete student feeback',34,'delete_studentfeeback'),(136,'Can view student feeback',34,'view_studentfeeback'),(137,'Can add mst designation',35,'add_mstdesignation'),(138,'Can change mst designation',35,'change_mstdesignation'),(139,'Can delete mst designation',35,'delete_mstdesignation'),(140,'Can view mst designation',35,'view_mstdesignation'),(141,'Can add time table schedule',36,'add_timetableschedule'),(142,'Can change time table schedule',36,'change_timetableschedule'),(143,'Can delete time table schedule',36,'delete_timetableschedule'),(144,'Can view time table schedule',36,'view_timetableschedule'),(145,'Can add student document',37,'add_studentdocument'),(146,'Can change student document',37,'change_studentdocument'),(147,'Can delete student document',37,'delete_studentdocument'),(148,'Can view student document',37,'view_studentdocument'),(149,'Can add fees paid details',38,'add_feespaiddetails'),(150,'Can change fees paid details',38,'change_feespaiddetails'),(151,'Can delete fees paid details',38,'delete_feespaiddetails'),(152,'Can view fees paid details',38,'view_feespaiddetails'),(153,'Can add student leave',39,'add_studentleave'),(154,'Can change student leave',39,'change_studentleave'),(155,'Can delete student leave',39,'delete_studentleave'),(156,'Can view student leave',39,'view_studentleave'),(157,'Can add student leave to admin',40,'add_studentleavetoadmin'),(158,'Can change student leave to admin',40,'change_studentleavetoadmin'),(159,'Can delete student leave to admin',40,'delete_studentleavetoadmin'),(160,'Can view student leave to admin',40,'view_studentleavetoadmin'),(161,'Can add mst fees head',41,'add_mstfeeshead'),(162,'Can change mst fees head',41,'change_mstfeeshead'),(163,'Can delete mst fees head',41,'delete_mstfeeshead'),(164,'Can view mst fees head',41,'view_mstfeeshead'),(165,'Can add temp institute fees details',42,'add_tempinstitutefeesdetails'),(166,'Can change temp institute fees details',42,'change_tempinstitutefeesdetails'),(167,'Can delete temp institute fees details',42,'delete_tempinstitutefeesdetails'),(168,'Can view temp institute fees details',42,'view_tempinstitutefeesdetails'),(169,'Can add temp class fees details',43,'add_tempclassfeesdetails'),(170,'Can change temp class fees details',43,'change_tempclassfeesdetails'),(171,'Can delete temp class fees details',43,'delete_tempclassfeesdetails'),(172,'Can view temp class fees details',43,'view_tempclassfeesdetails'),(173,'Can add temp students fees details',44,'add_tempstudentsfeesdetails'),(174,'Can change temp students fees details',44,'change_tempstudentsfeesdetails'),(175,'Can delete temp students fees details',44,'delete_tempstudentsfeesdetails'),(176,'Can view temp students fees details',44,'view_tempstudentsfeesdetails'),(177,'Can add challan details',45,'add_challandetails'),(178,'Can change challan details',45,'change_challandetails'),(179,'Can delete challan details',45,'delete_challandetails'),(180,'Can view challan details',45,'view_challandetails'),(181,'Can add library add book',46,'add_libraryaddbook'),(182,'Can change library add book',46,'change_libraryaddbook'),(183,'Can delete library add book',46,'delete_libraryaddbook'),(184,'Can view library add book',46,'view_libraryaddbook'),(185,'Can add library issue book',47,'add_libraryissuebook'),(186,'Can change library issue book',47,'change_libraryissuebook'),(187,'Can delete library issue book',47,'delete_libraryissuebook'),(188,'Can view library issue book',47,'view_libraryissuebook'),(189,'Can add fees master',48,'add_feesmaster'),(190,'Can change fees master',48,'change_feesmaster'),(191,'Can delete fees master',48,'delete_feesmaster'),(192,'Can view fees master',48,'view_feesmaster'),(193,'Can add fees category',49,'add_feescategory'),(194,'Can change fees category',49,'change_feescategory'),(195,'Can delete fees category',49,'delete_feescategory'),(196,'Can view fees category',49,'view_feescategory'),(197,'Can add mst sub caste',22,'add_mstsubcaste'),(198,'Can change mst sub caste',22,'change_mstsubcaste'),(199,'Can delete mst sub caste',22,'delete_mstsubcaste'),(200,'Can view mst sub caste',22,'view_mstsubcaste');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(18,'nvsapp','academicmaster'),(16,'nvsapp','accounthead'),(8,'nvsapp','addclass'),(9,'nvsapp','addsection'),(28,'nvsapp','assessmentmarks'),(10,'nvsapp','calender'),(19,'nvsapp','casteoperator'),(17,'nvsapp','castes'),(45,'nvsapp','challandetails'),(12,'nvsapp','classwork'),(31,'nvsapp','expensehead'),(49,'nvsapp','feescategory'),(48,'nvsapp','feesmaster'),(38,'nvsapp','feespaiddetails'),(13,'nvsapp','homework'),(33,'nvsapp','institutionprofile'),(25,'nvsapp','languagemapping'),(29,'nvsapp','leavestaff'),(46,'nvsapp','libraryaddbook'),(47,'nvsapp','libraryissuebook'),(14,'nvsapp','managementmembers'),(15,'nvsapp','message'),(26,'nvsapp','mstassesment'),(35,'nvsapp','mstdesignation'),(32,'nvsapp','mstfeedback'),(41,'nvsapp','mstfeeshead'),(22,'nvsapp','mstsubcaste'),(20,'nvsapp','mstsubject'),(24,'nvsapp','noticecircular'),(21,'nvsapp','religion'),(30,'nvsapp','studentattendance'),(37,'nvsapp','studentdocument'),(34,'nvsapp','studentfeeback'),(39,'nvsapp','studentleave'),(40,'nvsapp','studentleavetoadmin'),(7,'nvsapp','studentregister'),(27,'nvsapp','studentselectedsubject'),(23,'nvsapp','subjectstaffclassmapping'),(43,'nvsapp','tempclassfeesdetails'),(42,'nvsapp','tempinstitutefeesdetails'),(44,'nvsapp','tempstudentsfeesdetails'),(36,'nvsapp','timetableschedule'),(11,'nvsapp','userregister'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-09-14 12:21:57.720596'),(2,'auth','0001_initial','2023-09-14 12:21:58.196453'),(3,'admin','0001_initial','2023-09-14 12:21:58.311240'),(4,'admin','0002_logentry_remove_auto_add','2023-09-14 12:21:58.324349'),(5,'admin','0003_logentry_add_action_flag_choices','2023-09-14 12:21:58.334655'),(6,'contenttypes','0002_remove_content_type_name','2023-09-14 12:21:58.410567'),(7,'auth','0002_alter_permission_name_max_length','2023-09-14 12:21:58.464439'),(8,'auth','0003_alter_user_email_max_length','2023-09-14 12:21:58.503631'),(9,'auth','0004_alter_user_username_opts','2023-09-14 12:21:58.517590'),(10,'auth','0005_alter_user_last_login_null','2023-09-14 12:21:58.567058'),(11,'auth','0006_require_contenttypes_0002','2023-09-14 12:21:58.572043'),(12,'auth','0007_alter_validators_add_error_messages','2023-09-14 12:21:58.583150'),(13,'auth','0008_alter_user_username_max_length','2023-09-14 12:21:58.641255'),(14,'auth','0009_alter_user_last_name_max_length','2023-09-14 12:21:58.698061'),(15,'auth','0010_alter_group_name_max_length','2023-09-14 12:21:58.724683'),(16,'auth','0011_update_proxy_permissions','2023-09-14 12:21:58.735412'),(17,'auth','0012_alter_user_first_name_max_length','2023-09-14 12:21:58.790631'),(18,'nvsapp','0001_initial','2023-09-14 12:21:58.842564'),(19,'nvsapp','0002_addclass_addsection_calender_instituteprofile_and_more','2023-09-14 12:21:58.940104'),(20,'nvsapp','0003_classwork_homework_logindetails_managementmembers_and_more','2023-09-14 12:21:59.090939'),(21,'nvsapp','0004_accounthead_castes','2023-09-14 12:21:59.134652'),(22,'nvsapp','0005_remove_userregister_institutionname_and_more','2023-09-14 12:21:59.187573'),(23,'nvsapp','0006_academymaster_alter_accounthead_select_liabilities','2023-09-14 12:21:59.218089'),(24,'nvsapp','0007_rename_academymaster_academicmaster','2023-09-14 12:21:59.255431'),(25,'nvsapp','0008_feestype','2023-09-14 12:21:59.280508'),(26,'nvsapp','0009_mstfeestype_and_more','2023-09-14 12:21:59.407909'),(27,'nvsapp','0010_casteoperator_mstsubject_religion_subcaste_and_more','2023-09-14 12:21:59.938931'),(28,'nvsapp','0011_academicmaster_isactive','2023-09-14 12:21:59.967050'),(29,'nvsapp','0012_noticecircular','2023-09-14 12:21:59.989063'),(30,'nvsapp','0013_languagemapping_and_more','2023-09-14 12:22:00.037688'),(31,'nvsapp','0014_alter_institutionprofile_createdby_and_more','2023-09-14 12:22:00.091221'),(32,'nvsapp','0015_studentregister_subject_studentregister_aadharimage_and_more','2023-09-14 12:22:00.313922'),(33,'nvsapp','0016_mstassesment','2023-09-14 12:22:00.334672'),(34,'nvsapp','0017_studentregister_instituteid','2023-09-14 12:22:00.377254'),(35,'nvsapp','0018_rename_instituteid_studentregister_institutionid','2023-09-14 12:22:00.408112'),(36,'nvsapp','0019_studentselectedsubject_and_more','2023-09-14 12:22:00.495423'),(37,'nvsapp','0020_mstsubject_optional_mstsubject_subjectcategory_and_more','2023-09-14 12:22:00.562229'),(38,'nvsapp','0021_assessmentmarks_leavestaff_studentattendance','2023-09-14 12:22:00.621200'),(39,'nvsapp','0022_studentregister_password','2023-09-14 12:22:00.668941'),(40,'nvsapp','0023_studentattendance_studentid','2023-09-14 12:22:00.698600'),(41,'nvsapp','0024_alter_studentattendance_studentid','2023-09-14 12:22:00.705128'),(42,'nvsapp','0025_alter_studentattendance_studentid','2023-09-14 12:22:00.751284'),(43,'nvsapp','0026_alter_studentattendance_studentid','2023-09-14 12:22:00.796477'),(44,'nvsapp','0027_remove_studentattendance_attid_a_and_more','2023-09-14 12:22:00.854127'),(45,'nvsapp','0028_expensehead','2023-09-14 12:22:00.878813'),(46,'nvsapp','0029_mstfeedback_and_more','2023-09-14 12:22:01.139979'),(47,'nvsapp','0030_alter_academicmaster_instituteid_and_more','2023-09-14 12:22:01.955752'),(48,'nvsapp','0031_delete_institutionprofile_and_more','2023-09-14 12:22:01.998589'),(49,'nvsapp','0032_alter_subjectstaffclassmapping_addclass_id','2023-09-14 12:22:02.047142'),(50,'nvsapp','0033_institutionprofile_rename_caste_mstfeestype_category_and_more','2023-09-14 12:22:19.769276'),(51,'nvsapp','0034_alter_managementmembers_createdby','2023-09-14 12:22:19.880487'),(52,'nvsapp','0035_alter_managementmembers_deletedby_and_more','2023-09-14 12:22:19.902465'),(53,'nvsapp','0036_userregister_homepage','2023-09-14 12:22:20.176479'),(54,'nvsapp','0037_alter_noticecircular_matter_and_more','2023-09-14 12:22:20.401916'),(55,'nvsapp','0038_alter_subjectstaffclassmapping_addclass','2023-09-14 12:22:20.633109'),(56,'nvsapp','0039_alter_subjectstaffclassmapping_addclass_and_more','2023-09-14 12:22:20.912383'),(57,'nvsapp','0040_remove_studentregister_password','2023-09-14 12:22:21.011791'),(58,'nvsapp','0041_studentregister_password','2023-09-14 12:22:21.161620'),(59,'nvsapp','0042_studentfeeback','2023-09-14 12:22:21.621575'),(60,'nvsapp','0043_alter_studentregister_academicyear','2023-09-14 12:22:21.919033'),(61,'nvsapp','0044_mstdesignation','2023-09-14 12:22:21.944635'),(62,'nvsapp','0045_alter_mstdesignation_createdby','2023-09-14 12:22:21.982753'),(63,'nvsapp','0046_alter_mstdesignation_createdby','2023-09-14 12:22:21.992984'),(64,'nvsapp','0047_alter_logindetails_designation_and_more','2023-09-14 12:22:22.776775'),(65,'nvsapp','0048_alter_mstdesignation_designationname','2023-09-14 12:22:22.789469'),(66,'nvsapp','0049_rename_staffid_studentattendance_staffid','2023-09-14 12:22:22.964029'),(67,'nvsapp','0050_alter_leavestaff_leavedate_alter_leavestaff_subject_and_more','2023-09-14 12:22:23.278705'),(68,'nvsapp','0051_rename_createdby_leavestaff_createdby_id_and_more','2023-09-14 12:22:23.577926'),(69,'nvsapp','0052_rename_createdby_id_leavestaff_createdby','2023-09-14 12:22:23.719090'),(70,'nvsapp','0053_timetableschedule','2023-09-14 12:22:29.137005'),(71,'nvsapp','0054_remove_timetableschedule_subjectstaffmapid_and_more','2023-09-14 12:22:30.054671'),(72,'nvsapp','0055_studentdocument_remove_studentregister_areaid_and_more','2023-09-14 12:22:31.757858'),(73,'nvsapp','0056_leavestaff_academicyearid_leavestaff_updatedon_and_more','2023-09-14 12:22:32.221585'),(74,'nvsapp','0057_studentleave','2023-09-14 12:22:32.531264'),(75,'nvsapp','0058_studentleavetoadmin','2023-09-14 12:22:32.750039'),(76,'nvsapp','0059_alter_studentleave_classid_and_more','2023-09-14 12:22:33.646777'),(77,'nvsapp','0060_remove_studentregister_academicyear_and_more','2023-09-14 12:22:34.240060'),(78,'nvsapp','0061_alter_feespaiddetails_studentid_delete_feesmaster','2023-09-14 12:22:34.464898'),(79,'nvsapp','0062_feespaiddetails_classid_feespaiddetails_createdonind_and_more','2023-09-14 12:22:35.068003'),(80,'nvsapp','0063_alter_expensehead_amountpaid_and_more','2023-09-14 12:22:35.869545'),(81,'nvsapp','0064_alter_userregister_emailid_and_more','2023-09-14 12:22:36.340268'),(82,'nvsapp','0065_tempinstitutefeesdetails','2023-09-14 12:22:36.365505'),(83,'nvsapp','0066_alter_tempinstitutefeesdetails_instituteid_and_more','2023-09-14 12:22:36.390003'),(84,'nvsapp','0067_tempinstitutefeesdetails_detailstype_and_more','2023-09-14 12:22:36.463896'),(85,'nvsapp','0068_tempclassfeesdetails','2023-09-14 12:22:36.493079'),(86,'nvsapp','0069_tempstudentsfeesdetails','2023-09-14 12:22:36.519213'),(87,'nvsapp','0070_challandetails','2023-09-14 12:22:37.281866'),(88,'nvsapp','0071_challandetails_feestypeid','2023-09-14 12:22:37.434239'),(89,'nvsapp','0072_alter_mstfeestype_fee_for_alter_mstfeestype_fees','2023-09-14 12:22:37.756322'),(90,'nvsapp','0073_alter_mstfeestype_fee_for','2023-09-14 12:22:37.917232'),(91,'nvsapp','0074_alter_userregister_mobilenumber','2023-09-14 12:22:37.977060'),(92,'nvsapp','0075_challandetails_collecteddate_and_more','2023-09-14 12:22:38.555434'),(93,'nvsapp','0076_feespaiddetails_challanid_delete_logindetails','2023-09-14 12:22:38.709196'),(94,'nvsapp','0077_tempclassfeesdetails_userid_and_more','2023-09-14 12:22:38.788771'),(95,'nvsapp','0078_assessmentmarks_subjectcase','2023-09-14 12:22:38.951747'),(96,'nvsapp','0079_studentregister_promotionstatus','2023-09-14 12:22:39.152382'),(97,'nvsapp','0080_remove_studentregister_promotionstatus_and_more','2023-09-14 12:22:39.377753'),(98,'nvsapp','0081_lbryissuebook_lbryaddbooks','2023-09-14 12:22:39.821938'),(99,'nvsapp','0082_mstdesignation_softdelete','2023-09-14 12:22:39.875734'),(100,'nvsapp','0083_mstdesignation_homepage','2023-09-14 12:22:39.918766'),(101,'nvsapp','0084_remove_userregister_homepage','2023-09-14 12:22:40.160559'),(102,'nvsapp','0085_alter_lbryissuebook_bookid','2023-09-14 12:22:40.418816'),(103,'nvsapp','0086_rename_lbryaddbooks_libraryaddbook_and_more','2023-09-14 12:22:40.940136'),(104,'nvsapp','0087_alter_libraryissuebook_instituteid_and_more','2023-09-14 12:22:41.424134'),(105,'nvsapp','0088_alter_libraryissuebook_instituteid_and_more','2023-09-14 12:22:41.885271'),(106,'nvsapp','0089_alter_libraryissuebook_academicyearid','2023-09-14 12:22:42.065636'),(107,'nvsapp','0090_challandetails_servicefees_and_more','2023-09-14 12:22:42.429111'),(108,'nvsapp','0091_feesmaster_alter_challandetails_feestypeid_and_more','2023-09-14 12:22:42.837819'),(109,'nvsapp','0092_alter_feesmaster_classid','2023-09-14 12:22:43.066543'),(110,'nvsapp','0093_alter_feesmaster_academicyearid','2023-09-14 12:22:43.301206'),(111,'nvsapp','0094_alter_studentregister_rollno_and_more','2023-09-14 12:22:43.703148'),(112,'nvsapp','0095_studentregister_srnumber','2023-09-14 12:22:43.905294'),(113,'nvsapp','0096_remove_accounthead_instituteid','2023-09-14 12:22:44.043847'),(114,'nvsapp','0097_feescategory','2023-09-14 12:22:44.067912'),(115,'nvsapp','0098_remove_accounthead_select_liabilities_and_more','2023-09-14 12:22:44.306624'),(116,'nvsapp','0099_rename_bookreturndate_libraryissuebook_actualreturndate_and_more','2023-09-14 12:22:44.552942'),(117,'sessions','0001_initial','2023-09-14 12:22:44.595920'),(118,'nvsapp','0100_accounthead_instituteid','2023-09-14 17:01:24.174152'),(119,'nvsapp','0101_rename_subcaste_mstsubcaste','2023-09-14 17:48:36.599238');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('d1geb9s0iieiunndnfrp6quby3nw7qre','.eJwtyk0KgCAQQOG7zNqF9p-3mXSIgRxBx0VEdy-o3fvgXZDyxgdJSxsV8LAu8zQOfecsGGCpytqUOIJ3BiJV3gWVs7y21gAGjJQ4nITln1qlL-8Hf2UeEQ:1qhPxe:zpOL7IXHbOcsy0QGelntRUTGuGgVer92DH5ViJlGmNE','2023-09-30 07:43:26.176888');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nvsapp_academicmaster`
--

DROP TABLE IF EXISTS `nvsapp_academicmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nvsapp_academicmaster` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `yeardate` varchar(100) NOT NULL,
  `instituteid_id` bigint NOT NULL,
  `softdelete` int NOT NULL,
  `createdon` varchar(50) NOT NULL,
  `createdby_id` bigint NOT NULL,
  `upadated` varchar(50) NOT NULL,
  `updatedby` varchar(100) NOT NULL,
  `deletedon` varchar(50) NOT NULL,
  `deletedby` varchar(100) NOT NULL,
  `isactive` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nvsapp_academicmaster_createdby_id_e081ef0a` (`createdby_id`),
  KEY `nvsapp_academicmaster_instituteid_id_f7ece429` (`instituteid_id`),
  CONSTRAINT `nvsapp_academicmaste_createdby_id_e081ef0a_fk_nvsapp_us` FOREIGN KEY (`createdby_id`) REFERENCES `nvsapp_userregister` (`id`),
  CONSTRAINT `nvsapp_academicmaste_instituteid_id_f7ece429_fk_nvsapp_in` FOREIGN KEY (`instituteid_id`) REFERENCES `nvsapp_institutionprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nvsapp_academicmaster`
--

LOCK TABLES `nvsapp_academicmaster` WRITE;
/*!40000 ALTER TABLE `nvsapp_academicmaster` DISABLE KEYS */;
INSERT INTO `nvsapp_academicmaster` VALUES (1,'2023-2024',1,0,'14-09-2023',1,'','','','',1);
/*!40000 ALTER TABLE `nvsapp_academicmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nvsapp_accounthead`
--

DROP TABLE IF EXISTS `nvsapp_accounthead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nvsapp_accounthead` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `head` varchar(200) NOT NULL,
  `createdby_id` bigint NOT NULL,
  `createdon` varchar(50) NOT NULL,
  `updatedby` varchar(100) NOT NULL,
  `upadatedon` varchar(50) NOT NULL,
  `deletedby` varchar(100) NOT NULL,
  `deletedon` varchar(50) NOT NULL,
  `softdelete` int NOT NULL,
  `feescategory_id` bigint DEFAULT NULL,
  `instituteid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nvsapp_accounthead_createdby_id_ba6653a4` (`createdby_id`),
  KEY `nvsapp_accounthead_feescategory_id_4f62213f_fk_nvsapp_fe` (`feescategory_id`),
  KEY `nvsapp_accounthead_instituteid_id_55631273_fk_nvsapp_in` (`instituteid_id`),
  CONSTRAINT `nvsapp_accounthead_createdby_id_ba6653a4_fk_nvsapp_us` FOREIGN KEY (`createdby_id`) REFERENCES `nvsapp_userregister` (`id`),
  CONSTRAINT `nvsapp_accounthead_feescategory_id_4f62213f_fk_nvsapp_fe` FOREIGN KEY (`feescategory_id`) REFERENCES `nvsapp_feescategory` (`id`),
  CONSTRAINT `nvsapp_accounthead_instituteid_id_55631273_fk_nvsapp_in` FOREIGN KEY (`instituteid_id`) REFERENCES `nvsapp_institutionprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nvsapp_accounthead`
--

LOCK TABLES `nvsapp_accounthead` WRITE;
/*!40000 ALTER TABLE `nvsapp_accounthead` DISABLE KEYS */;
INSERT INTO `nvsapp_accounthead` VALUES (1,'ADMISSION',1,'','','','','',0,1,1),(2,'ADMISSION',2,'','','','','',0,NULL,1),(3,'STATIONARY',2,'','','','','',0,NULL,1),(4,'2ND STANDARD ',1,'','','','','',0,1,1);
/*!40000 ALTER TABLE `nvsapp_accounthead` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nvsapp_addclass`
--

DROP TABLE IF EXISTS `nvsapp_addclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nvsapp_addclass` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `className` varchar(100) NOT NULL,
  `sectionName` varchar(100) NOT NULL,
  `instituteid_id` bigint NOT NULL,
  `softdelete` int NOT NULL,
  `createdon` varchar(50) NOT NULL,
  `createdby_id` bigint NOT NULL,
  `upadated` varchar(50) NOT NULL,
  `updatedby` varchar(100) NOT NULL,
  `deletedon` varchar(50) NOT NULL,
  `deletedby` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nvsapp_addclass_createdby_id_a06cfe77` (`createdby_id`),
  KEY `nvsapp_addclass_instituteid_id_627e5c82` (`instituteid_id`),
  CONSTRAINT `nvsapp_addclass_createdby_id_a06cfe77_fk_nvsapp_userregister_id` FOREIGN KEY (`createdby_id`) REFERENCES `nvsapp_userregister` (`id`),
  CONSTRAINT `nvsapp_addclass_instituteid_id_627e5c82_fk_nvsapp_in` FOREIGN KEY (`instituteid_id`) REFERENCES `nvsapp_institutionprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nvsapp_addclass`
--

LOCK TABLES `nvsapp_addclass` WRITE;
/*!40000 ALTER TABLE `nvsapp_addclass` DISABLE KEYS */;
INSERT INTO `nvsapp_addclass` VALUES (1,'1st Std','',1,0,'14-09-2023',2,'','','',''),(2,'2nd Std','',1,0,'14-09-2023',2,'','','',''),(3,'3rd Std','',1,0,'14-09-2023',2,'','','',''),(4,'4th Std','',1,0,'14-09-2023',2,'','','',''),(5,'5th Std','',1,0,'14-09-2023',2,'','','',''),(6,'6th Std','',1,0,'14-09-2023',2,'','','',''),(7,'7th Std','',1,0,'14-09-2023',2,'','','',''),(8,'8th Std','',1,0,'14-09-2023',2,'','','',''),(9,'9th Std','',1,0,'14-09-2023',2,'','','',''),(10,'10th Std','',1,0,'14-09-2023',2,'','','','');
/*!40000 ALTER TABLE `nvsapp_addclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nvsapp_addsection`
--

DROP TABLE IF EXISTS `nvsapp_addsection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nvsapp_addsection` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sectionName` varchar(100) NOT NULL,
  `instituteid_id` bigint NOT NULL,
  `softdelete` int NOT NULL,
  `createdon` varchar(50) NOT NULL,
  `createdby_id` bigint NOT NULL,
  `upadated` varchar(50) NOT NULL,
  `updatedby` varchar(100) NOT NULL,
  `deletedon` varchar(50) NOT NULL,
  `deletedby` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nvsapp_addsection_createdby_id_59c2a53b` (`createdby_id`),
  KEY `nvsapp_addsection_instituteid_id_caaa498d` (`instituteid_id`),
  CONSTRAINT `nvsapp_addsection_createdby_id_59c2a53b_fk_nvsapp_us` FOREIGN KEY (`createdby_id`) REFERENCES `nvsapp_userregister` (`id`),
  CONSTRAINT `nvsapp_addsection_instituteid_id_caaa498d_fk_nvsapp_in` FOREIGN KEY (`instituteid_id`) REFERENCES `nvsapp_institutionprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nvsapp_addsection`
--

LOCK TABLES `nvsapp_addsection` WRITE;
/*!40000 ALTER TABLE `nvsapp_addsection` DISABLE KEYS */;
INSERT INTO `nvsapp_addsection` VALUES (1,'A',1,0,'14-09-2023',2,'00-00-0000','','00-00-0000',''),(2,'B',1,0,'14-09-2023',2,'00-00-0000','','00-00-0000',''),(3,'C',1,0,'14-09-2023',2,'00-00-0000','','00-00-0000','');
/*!40000 ALTER TABLE `nvsapp_addsection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nvsapp_assessmentmarks`
--

DROP TABLE IF EXISTS `nvsapp_assessmentmarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nvsapp_assessmentmarks` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `assessmentid_id` bigint NOT NULL,
  `classs_id` bigint NOT NULL,
  `section_id` bigint NOT NULL,
  `subject_id` bigint NOT NULL,
  `studentid_id` bigint NOT NULL,
  `studentname` varchar(200) NOT NULL,
  `assessmentmarks` varchar(200) NOT NULL,
  `instituteid_id` bigint NOT NULL,
  `createdby_id` bigint NOT NULL,
  `createdon` varchar(50) NOT NULL,
  `updatedby` varchar(100) NOT NULL,
  `upadatedon` varchar(50) NOT NULL,
  `deletedby` varchar(100) NOT NULL,
  `deletedon` varchar(50) NOT NULL,
  `softdelete` int NOT NULL,
  `academicyearid` int NOT NULL,
  `subjectcase` varchar(200) NOT NULL,
  `subjectresult` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nvsapp_assessmentmarks_assessmentid_id_97861ee6` (`assessmentid_id`),
  KEY `nvsapp_assessmentmarks_classs_id_000c305a` (`classs_id`),
  KEY `nvsapp_assessmentmarks_createdby_id_511f9c02` (`createdby_id`),
  KEY `nvsapp_assessmentmarks_section_id_1d2eac31` (`section_id`),
  KEY `nvsapp_assessmentmarks_studentid_id_e3f6c15d` (`studentid_id`),
  KEY `nvsapp_assessmentmarks_subject_id_d5e1e856` (`subject_id`),
  KEY `nvsapp_assessmentmarks_instituteid_id_2118e93a` (`instituteid_id`),
  CONSTRAINT `nvsapp_assessmentmar_assessmentid_id_97861ee6_fk_nvsapp_ms` FOREIGN KEY (`assessmentid_id`) REFERENCES `nvsapp_mstassesment` (`id`),
  CONSTRAINT `nvsapp_assessmentmar_createdby_id_511f9c02_fk_nvsapp_us` FOREIGN KEY (`createdby_id`) REFERENCES `nvsapp_userregister` (`id`),
  CONSTRAINT `nvsapp_assessmentmar_instituteid_id_2118e93a_fk_nvsapp_in` FOREIGN KEY (`instituteid_id`) REFERENCES `nvsapp_institutionprofile` (`id`),
  CONSTRAINT `nvsapp_assessmentmar_section_id_1d2eac31_fk_nvsapp_ad` FOREIGN KEY (`section_id`) REFERENCES `nvsapp_addsection` (`id`),
  CONSTRAINT `nvsapp_assessmentmar_studentid_id_e3f6c15d_fk_nvsapp_st` FOREIGN KEY (`studentid_id`) REFERENCES `nvsapp_studentregister` (`id`),
  CONSTRAINT `nvsapp_assessmentmar_subject_id_d5e1e856_fk_nvsapp_ms` FOREIGN KEY (`subject_id`) REFERENCES `nvsapp_mstsubject` (`id`),
  CONSTRAINT `nvsapp_assessmentmarks_classs_id_000c305a_fk_nvsapp_addclass_id` FOREIGN KEY (`classs_id`) REFERENCES `nvsapp_addclass` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nvsapp_assessmentmarks`
--

LOCK TABLES `nvsapp_assessmentmarks` WRITE;
/*!40000 ALTER TABLE `nvsapp_assessmentmarks` DISABLE KEYS */;
/*!40000 ALTER TABLE `nvsapp_assessmentmarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nvsapp_calender`
--

DROP TABLE IF EXISTS `nvsapp_calender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nvsapp_calender` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `event` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `instituteid_id` bigint NOT NULL,
  `softdelete` int NOT NULL,
  `createdon` varchar(50) NOT NULL,
  `createdby_id` bigint NOT NULL,
  `upadated` varchar(50) NOT NULL,
  `updatedby` varchar(100) NOT NULL,
  `deletedon` varchar(50) NOT NULL,
  `deletedby` varchar(100) NOT NULL,
  `academicyearid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nvsapp_calender_academicyearid_id_35cb2904` (`academicyearid_id`),
  KEY `nvsapp_calender_createdby_id_06a1ee8f` (`createdby_id`),
  KEY `nvsapp_calender_instituteid_id_1ac31b67` (`instituteid_id`),
  CONSTRAINT `nvsapp_calender_academicyearid_id_35cb2904_fk_nvsapp_ac` FOREIGN KEY (`academicyearid_id`) REFERENCES `nvsapp_academicmaster` (`id`),
  CONSTRAINT `nvsapp_calender_createdby_id_06a1ee8f_fk_nvsapp_userregister_id` FOREIGN KEY (`createdby_id`) REFERENCES `nvsapp_userregister` (`id`),
  CONSTRAINT `nvsapp_calender_instituteid_id_1ac31b67_fk_nvsapp_in` FOREIGN KEY (`instituteid_id`) REFERENCES `nvsapp_institutionprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nvsapp_calender`
--

LOCK TABLES `nvsapp_calender` WRITE;
/*!40000 ALTER TABLE `nvsapp_calender` DISABLE KEYS */;
INSERT INTO `nvsapp_calender` VALUES (1,'Working','2023-09-15',1,0,'00-00-0000',2,'00-00-0000','','00-00-0000','',1),(2,'Working','2023-09-16',1,0,'00-00-0000',2,'00-00-0000','','00-00-0000','',1);
/*!40000 ALTER TABLE `nvsapp_calender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nvsapp_casteoperator`
--

DROP TABLE IF EXISTS `nvsapp_casteoperator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nvsapp_casteoperator` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `castes` varchar(100) NOT NULL,
  `selectreligion_id` bigint NOT NULL,
  `instituteid_id` bigint NOT NULL,
  `createdby_id` bigint NOT NULL,
  `createdon` varchar(50) NOT NULL,
  `updatedby` varchar(100) NOT NULL,
  `upadatedon` varchar(50) NOT NULL,
  `deletedby` varchar(100) NOT NULL,
  `deletedon` varchar(50) NOT NULL,
  `softdelete` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nvsapp_casteoperator_createdby_id_59fbabfa` (`createdby_id`),
  KEY `nvsapp_casteoperator_selectreligion_id_04464783` (`selectreligion_id`),
  KEY `nvsapp_casteoperator_instituteid_id_10c97286` (`instituteid_id`),
  CONSTRAINT `nvsapp_casteoperator_createdby_id_59fbabfa_fk_nvsapp_us` FOREIGN KEY (`createdby_id`) REFERENCES `nvsapp_userregister` (`id`),
  CONSTRAINT `nvsapp_casteoperator_instituteid_id_10c97286_fk_nvsapp_in` FOREIGN KEY (`instituteid_id`) REFERENCES `nvsapp_institutionprofile` (`id`),
  CONSTRAINT `nvsapp_casteoperator_selectreligion_id_04464783_fk_nvsapp_re` FOREIGN KEY (`selectreligion_id`) REFERENCES `nvsapp_religion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nvsapp_casteoperator`
--

LOCK TABLES `nvsapp_casteoperator` WRITE;
/*!40000 ALTER TABLE `nvsapp_casteoperator` DISABLE KEYS */;
INSERT INTO `nvsapp_casteoperator` VALUES (1,'BRAHMIN',1,1,1,'14-09-2023','','','','',0),(2,'SC',1,1,1,'14-09-2023','','','','',0),(3,'ST',1,1,1,'14-09-2023','','','','',0);
/*!40000 ALTER TABLE `nvsapp_casteoperator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nvsapp_castes`
--

DROP TABLE IF EXISTS `nvsapp_castes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nvsapp_castes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `caste` varchar(200) NOT NULL,
  `instituteid_id` bigint NOT NULL,
  `createdby_id` bigint NOT NULL,
  `createdon` varchar(50) NOT NULL,
  `updatedby` varchar(100) NOT NULL,
  `upadatedon` varchar(50) NOT NULL,
  `deletedby` varchar(100) NOT NULL,
  `deletedon` varchar(50) NOT NULL,
  `softdelete` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nvsapp_castes_createdby_id_294eb8e5` (`createdby_id`),
  KEY `nvsapp_castes_instituteid_id_0e1aabff` (`instituteid_id`),
  CONSTRAINT `nvsapp_castes_createdby_id_294eb8e5_fk_nvsapp_userregister_id` FOREIGN KEY (`createdby_id`) REFERENCES `nvsapp_userregister` (`id`),
  CONSTRAINT `nvsapp_castes_instituteid_id_0e1aabff_fk_nvsapp_in` FOREIGN KEY (`instituteid_id`) REFERENCES `nvsapp_institutionprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nvsapp_castes`
--

LOCK TABLES `nvsapp_castes` WRITE;
/*!40000 ALTER TABLE `nvsapp_castes` DISABLE KEYS */;
/*!40000 ALTER TABLE `nvsapp_castes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nvsapp_challandetails`
--

DROP TABLE IF EXISTS `nvsapp_challandetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nvsapp_challandetails` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amounttopay` double NOT NULL,
  `createdon` varchar(50) NOT NULL,
  `createdonind` varchar(50) NOT NULL,
  `upadatedon` varchar(50) NOT NULL,
  `deletedon` varchar(50) NOT NULL,
  `softdelete` int NOT NULL,
  `academicyearid_id` bigint NOT NULL,
  `classid_id` bigint NOT NULL,
  `createdby_id` bigint NOT NULL,
  `deletedby_id` bigint DEFAULT NULL,
  `instituteid_id` bigint NOT NULL,
  `sectionid_id` bigint NOT NULL,
  `studentid_id` bigint NOT NULL,
  `updatedby_id` bigint DEFAULT NULL,
  `feestypeid_id` bigint NOT NULL,
  `collecteddate` varchar(50) NOT NULL,
  `collecteddateind` varchar(50) NOT NULL,
  `collecterid_id` bigint DEFAULT NULL,
  `collectorcancelchallan` int NOT NULL,
  `collectorcancelchallanreason` varchar(5000) NOT NULL,
  `paymentstatus` varchar(50) NOT NULL,
  `servicefees` double NOT NULL,
  `totalamounttopay` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nvsapp_challandetail_academicyearid_id_3dbfec12_fk_nvsapp_ac` (`academicyearid_id`),
  KEY `nvsapp_challandetails_classid_id_a2c47f8a_fk_nvsapp_addclass_id` (`classid_id`),
  KEY `nvsapp_challandetail_createdby_id_4de50d4e_fk_nvsapp_us` (`createdby_id`),
  KEY `nvsapp_challandetail_deletedby_id_fff49dbb_fk_nvsapp_us` (`deletedby_id`),
  KEY `nvsapp_challandetail_instituteid_id_52fa3b96_fk_nvsapp_in` (`instituteid_id`),
  KEY `nvsapp_challandetail_sectionid_id_2a37f827_fk_nvsapp_ad` (`sectionid_id`),
  KEY `nvsapp_challandetail_studentid_id_623d06a9_fk_nvsapp_st` (`studentid_id`),
  KEY `nvsapp_challandetail_updatedby_id_f5466f47_fk_nvsapp_us` (`updatedby_id`),
  KEY `nvsapp_challandetail_collecterid_id_2a167b1c_fk_nvsapp_us` (`collecterid_id`),
  KEY `nvsapp_challandetail_feestypeid_id_cc3a8ce0_fk_nvsapp_fe` (`feestypeid_id`),
  CONSTRAINT `nvsapp_challandetail_academicyearid_id_3dbfec12_fk_nvsapp_ac` FOREIGN KEY (`academicyearid_id`) REFERENCES `nvsapp_academicmaster` (`id`),
  CONSTRAINT `nvsapp_challandetail_collecterid_id_2a167b1c_fk_nvsapp_us` FOREIGN KEY (`collecterid_id`) REFERENCES `nvsapp_userregister` (`id`),
  CONSTRAINT `nvsapp_challandetail_createdby_id_4de50d4e_fk_nvsapp_us` FOREIGN KEY (`createdby_id`) REFERENCES `nvsapp_userregister` (`id`),
  CONSTRAINT `nvsapp_challandetail_deletedby_id_fff49dbb_fk_nvsapp_us` FOREIGN KEY (`deletedby_id`) REFERENCES `nvsapp_userregister` (`id`),
  CONSTRAINT `nvsapp_challandetail_feestypeid_id_cc3a8ce0_fk_nvsapp_fe` FOREIGN KEY (`feestypeid_id`) REFERENCES `nvsapp_feesmaster` (`id`),
  CONSTRAINT `nvsapp_challandetail_instituteid_id_52fa3b96_fk_nvsapp_in` FOREIGN KEY (`instituteid_id`) REFERENCES `nvsapp_institutionprofile` (`id`),
  CONSTRAINT `nvsapp_challandetail_sectionid_id_2a37f827_fk_nvsapp_ad` FOREIGN KEY (`sectionid_id`) REFERENCES `nvsapp_addsection` (`id`),
  CONSTRAINT `nvsapp_challandetail_studentid_id_623d06a9_fk_nvsapp_st` FOREIGN KEY (`studentid_id`) REFERENCES `nvsapp_studentregister` (`id`),
  CONSTRAINT `nvsapp_challandetail_updatedby_id_f5466f47_fk_nvsapp_us` FOREIGN KEY (`updatedby_id`) REFERENCES `nvsapp_userregister` (`id`),
  CONSTRAINT `nvsapp_challandetails_classid_id_a2c47f8a_fk_nvsapp_addclass_id` FOREIGN KEY (`classid_id`) REFERENCES `nvsapp_addclass` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nvsapp_challandetails`
--

LOCK TABLES `nvsapp_challandetails` WRITE;
/*!40000 ALTER TABLE `nvsapp_challandetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `nvsapp_challandetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nvsapp_classwork`
--

DROP TABLE IF EXISTS `nvsapp_classwork`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nvsapp_classwork` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `classconducted_date` varchar(100) NOT NULL,
  `workdetails` varchar(100) NOT NULL,
  `instituteid_id` bigint NOT NULL,
  `softdelete` int NOT NULL,
  `createdon` varchar(50) NOT NULL,
  `createdby_id` bigint NOT NULL,
  `upadated` varchar(50) NOT NULL,
  `updatedby` varchar(100) NOT NULL,
  `deletedon` varchar(50) NOT NULL,
  `deletedby` varchar(100) NOT NULL,
  `ChooseClass_id` bigint NOT NULL,
  `ChooseSection_id` bigint NOT NULL,
  `academicyearid_id` bigint NOT NULL,
  `subjects_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nvsapp_classwork_ChooseClass_id_cd015a7d` (`ChooseClass_id`),
  KEY `nvsapp_classwork_ChooseSection_id_961f5ac7` (`ChooseSection_id`),
  KEY `nvsapp_classwork_academicyearid_id_d67a3f17` (`academicyearid_id`),
  KEY `nvsapp_classwork_createdby_id_4d8931cf` (`createdby_id`),
  KEY `nvsapp_classwork_subjects_id_7ff01280` (`subjects_id`),
  KEY `nvsapp_classwork_instituteid_id_77c14c22` (`instituteid_id`),
  CONSTRAINT `nvsapp_classwork_academicyearid_id_d67a3f17_fk_nvsapp_ac` FOREIGN KEY (`academicyearid_id`) REFERENCES `nvsapp_academicmaster` (`id`),
  CONSTRAINT `nvsapp_classwork_ChooseClass_id_cd015a7d_fk_nvsapp_addclass_id` FOREIGN KEY (`ChooseClass_id`) REFERENCES `nvsapp_addclass` (`id`),
  CONSTRAINT `nvsapp_classwork_ChooseSection_id_961f5ac7_fk_nvsapp_ad` FOREIGN KEY (`ChooseSection_id`) REFERENCES `nvsapp_addsection` (`id`),
  CONSTRAINT `nvsapp_classwork_createdby_id_4d8931cf_fk_nvsapp_userregister_id` FOREIGN KEY (`createdby_id`) REFERENCES `nvsapp_userregister` (`id`),
  CONSTRAINT `nvsapp_classwork_instituteid_id_77c14c22_fk_nvsapp_in` FOREIGN KEY (`instituteid_id`) REFERENCES `nvsapp_institutionprofile` (`id`),
  CONSTRAINT `nvsapp_classwork_subjects_id_7ff01280_fk_nvsapp_mstsubject_id` FOREIGN KEY (`subjects_id`) REFERENCES `nvsapp_mstsubject` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nvsapp_classwork`
--

LOCK TABLES `nvsapp_classwork` WRITE;
/*!40000 ALTER TABLE `nvsapp_classwork` DISABLE KEYS */;
/*!40000 ALTER TABLE `nvsapp_classwork` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nvsapp_expensehead`
--

DROP TABLE IF EXISTS `nvsapp_expensehead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nvsapp_expensehead` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `expenseheadid_id` bigint NOT NULL,
  `paidto` varchar(100) NOT NULL,
  `paymentdate` varchar(100) NOT NULL,
  `amountpaid` double NOT NULL,
  `paymentmode` varchar(100) NOT NULL,
  `paymentdetails` varchar(255) NOT NULL,
  `instituteid_id` bigint NOT NULL,
  `createdby_id` bigint NOT NULL,
  `createdon` varchar(50) NOT NULL,
  `updatedby` varchar(100) NOT NULL,
  `upadatedon` varchar(50) NOT NULL,
  `deletedby` varchar(100) NOT NULL,
  `deletedon` varchar(50) NOT NULL,
  `softdelete` int NOT NULL,
  `academicyearid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nvsapp_expensehead_createdby_id_9070a0a6` (`createdby_id`),
  KEY `nvsapp_expensehead_expenseheadid_id_4b7e8e8d` (`expenseheadid_id`),
  KEY `nvsapp_expensehead_instituteid_id_4aa880e9` (`instituteid_id`),
  CONSTRAINT `nvsapp_expensehead_createdby_id_9070a0a6_fk_nvsapp_us` FOREIGN KEY (`createdby_id`) REFERENCES `nvsapp_userregister` (`id`),
  CONSTRAINT `nvsapp_expensehead_expenseheadid_id_4b7e8e8d_fk_nvsapp_ac` FOREIGN KEY (`expenseheadid_id`) REFERENCES `nvsapp_accounthead` (`id`),
  CONSTRAINT `nvsapp_expensehead_instituteid_id_4aa880e9_fk_nvsapp_in` FOREIGN KEY (`instituteid_id`) REFERENCES `nvsapp_institutionprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nvsapp_expensehead`
--

LOCK TABLES `nvsapp_expensehead` WRITE;
/*!40000 ALTER TABLE `nvsapp_expensehead` DISABLE KEYS */;
INSERT INTO `nvsapp_expensehead` VALUES (1,3,'sachin','2023-09-16',15000,'1','cash',1,2,'','','','','',0,1);
/*!40000 ALTER TABLE `nvsapp_expensehead` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nvsapp_feescategory`
--

DROP TABLE IF EXISTS `nvsapp_feescategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nvsapp_feescategory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category` varchar(200) NOT NULL,
  `softdelete` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nvsapp_feescategory`
--

LOCK TABLES `nvsapp_feescategory` WRITE;
/*!40000 ALTER TABLE `nvsapp_feescategory` DISABLE KEYS */;
INSERT INTO `nvsapp_feescategory` VALUES (1,'ADMISSION',0),(2,'UNIFORM',0),(3,'BOOKS',0);
/*!40000 ALTER TABLE `nvsapp_feescategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nvsapp_feesmaster`
--

DROP TABLE IF EXISTS `nvsapp_feesmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nvsapp_feesmaster` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `classid_id` bigint NOT NULL,
  `feesterm` int NOT NULL,
  `category` varchar(200) NOT NULL,
  `feestemplate` varchar(200) NOT NULL,
  `fees` double NOT NULL,
  `createdon` varchar(50) NOT NULL,
  `updatedby` varchar(100) NOT NULL,
  `upadatedon` varchar(50) NOT NULL,
  `deletedby` varchar(100) NOT NULL,
  `deletedon` varchar(50) NOT NULL,
  `softdelete` int NOT NULL,
  `academicyearid_id` bigint NOT NULL,
  `createdby_id` bigint NOT NULL,
  `instituteid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nvsapp_feesmaster_createdby_id_81f8203a_fk_nvsapp_us` (`createdby_id`),
  KEY `nvsapp_feesmaster_instituteid_id_bcfc4eb6_fk_nvsapp_in` (`instituteid_id`),
  KEY `nvsapp_feesmaster_classid_id_f58c2786` (`classid_id`),
  KEY `nvsapp_feesmaster_academicyearid_id_62a44282` (`academicyearid_id`),
  CONSTRAINT `nvsapp_feesmaster_academicyearid_id_62a44282_fk_nvsapp_ac` FOREIGN KEY (`academicyearid_id`) REFERENCES `nvsapp_academicmaster` (`id`),
  CONSTRAINT `nvsapp_feesmaster_classid_id_f58c2786_fk_nvsapp_addclass_id` FOREIGN KEY (`classid_id`) REFERENCES `nvsapp_addclass` (`id`),
  CONSTRAINT `nvsapp_feesmaster_createdby_id_81f8203a_fk_nvsapp_us` FOREIGN KEY (`createdby_id`) REFERENCES `nvsapp_userregister` (`id`),
  CONSTRAINT `nvsapp_feesmaster_instituteid_id_bcfc4eb6_fk_nvsapp_in` FOREIGN KEY (`instituteid_id`) REFERENCES `nvsapp_institutionprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nvsapp_feesmaster`
--

LOCK TABLES `nvsapp_feesmaster` WRITE;
/*!40000 ALTER TABLE `nvsapp_feesmaster` DISABLE KEYS */;
INSERT INTO `nvsapp_feesmaster` VALUES (1,1,1,'SC','ADMISSION',15000,'2023-09-15','','','','',0,1,2,1),(2,1,2,'SC','ADMISSION',15000,'2023-09-15','','','','',0,1,2,1),(3,1,12,'SC','ADMISSION',30000,'2023-09-15','','','','',0,1,2,1);
/*!40000 ALTER TABLE `nvsapp_feesmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nvsapp_feespaiddetails`
--

DROP TABLE IF EXISTS `nvsapp_feespaiddetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nvsapp_feespaiddetails` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `studentid_id` bigint NOT NULL,
  `amountpaid` double NOT NULL,
  `ddlpaymentmode` varchar(100) NOT NULL,
  `transactiondetials` varchar(255) NOT NULL,
  `createdon` varchar(50) NOT NULL,
  `updatedby` varchar(100) NOT NULL,
  `upadatedon` varchar(50) NOT NULL,
  `deletedby` varchar(100) NOT NULL,
  `deletedon` varchar(50) NOT NULL,
  `softdelete` int NOT NULL,
  `academicyearid_id` bigint NOT NULL,
  `createdby_id` bigint NOT NULL,
  `instituteid_id` bigint NOT NULL,
  `classid_id` bigint NOT NULL,
  `createdonind` varchar(50) NOT NULL,
  `sectionid_id` bigint NOT NULL,
  `challanid_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nvsapp_feespaiddetai_academicyearid_id_187043fa_fk_nvsapp_ac` (`academicyearid_id`),
  KEY `nvsapp_feespaiddetai_createdby_id_a410ef04_fk_nvsapp_us` (`createdby_id`),
  KEY `nvsapp_feespaiddetai_instituteid_id_fc6dada6_fk_nvsapp_in` (`instituteid_id`),
  KEY `nvsapp_feespaiddetails_studentid_id_e207f261` (`studentid_id`),
  KEY `nvsapp_feespaiddetails_classid_id_461bb74e_fk_nvsapp_addclass_id` (`classid_id`),
  KEY `nvsapp_feespaiddetai_sectionid_id_7b874684_fk_nvsapp_ad` (`sectionid_id`),
  KEY `nvsapp_feespaiddetai_challanid_id_23bf51ed_fk_nvsapp_ch` (`challanid_id`),
  CONSTRAINT `nvsapp_feespaiddetai_academicyearid_id_187043fa_fk_nvsapp_ac` FOREIGN KEY (`academicyearid_id`) REFERENCES `nvsapp_academicmaster` (`id`),
  CONSTRAINT `nvsapp_feespaiddetai_challanid_id_23bf51ed_fk_nvsapp_ch` FOREIGN KEY (`challanid_id`) REFERENCES `nvsapp_challandetails` (`id`),
  CONSTRAINT `nvsapp_feespaiddetai_createdby_id_a410ef04_fk_nvsapp_us` FOREIGN KEY (`createdby_id`) REFERENCES `nvsapp_userregister` (`id`),
  CONSTRAINT `nvsapp_feespaiddetai_instituteid_id_fc6dada6_fk_nvsapp_in` FOREIGN KEY (`instituteid_id`) REFERENCES `nvsapp_institutionprofile` (`id`),
  CONSTRAINT `nvsapp_feespaiddetai_sectionid_id_7b874684_fk_nvsapp_ad` FOREIGN KEY (`sectionid_id`) REFERENCES `nvsapp_addsection` (`id`),
  CONSTRAINT `nvsapp_feespaiddetai_studentid_id_e207f261_fk_nvsapp_st` FOREIGN KEY (`studentid_id`) REFERENCES `nvsapp_studentregister` (`id`),
  CONSTRAINT `nvsapp_feespaiddetails_classid_id_461bb74e_fk_nvsapp_addclass_id` FOREIGN KEY (`classid_id`) REFERENCES `nvsapp_addclass` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nvsapp_feespaiddetails`
--

LOCK TABLES `nvsapp_feespaiddetails` WRITE;
/*!40000 ALTER TABLE `nvsapp_feespaiddetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `nvsapp_feespaiddetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nvsapp_homework`
--

DROP TABLE IF EXISTS `nvsapp_homework`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nvsapp_homework` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `workdate` varchar(100) NOT NULL,
  `workdetail` varchar(100) NOT NULL,
  `softdelete` int NOT NULL,
  `createdon` varchar(50) NOT NULL,
  `createdby_id` bigint NOT NULL,
  `upadated` varchar(50) NOT NULL,
  `updatedby` varchar(100) NOT NULL,
  `deletedon` varchar(50) NOT NULL,
  `deletedby` varchar(100) NOT NULL,
  `ChooseClass_id` bigint NOT NULL,
  `ChooseSection_id` bigint NOT NULL,
  `academicyearid_id` bigint NOT NULL,
  `instituteid_id` bigint NOT NULL,
  `subjects_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nvsapp_homework_ChooseClass_id_98720b9c` (`ChooseClass_id`),
  KEY `nvsapp_homework_ChooseSection_id_df5534bb` (`ChooseSection_id`),
  KEY `nvsapp_homework_academicyearid_id_ee9c6bc6` (`academicyearid_id`),
  KEY `nvsapp_homework_createdby_id_51211124` (`createdby_id`),
  KEY `nvsapp_homework_subjects_id_89c524cb` (`subjects_id`),
  KEY `nvsapp_homework_instituteid_id_604b6b73` (`instituteid_id`),
  CONSTRAINT `nvsapp_homework_academicyearid_id_ee9c6bc6_fk_nvsapp_ac` FOREIGN KEY (`academicyearid_id`) REFERENCES `nvsapp_academicmaster` (`id`),
  CONSTRAINT `nvsapp_homework_ChooseClass_id_98720b9c_fk_nvsapp_addclass_id` FOREIGN KEY (`ChooseClass_id`) REFERENCES `nvsapp_addclass` (`id`),
  CONSTRAINT `nvsapp_homework_ChooseSection_id_df5534bb_fk_nvsapp_ad` FOREIGN KEY (`ChooseSection_id`) REFERENCES `nvsapp_addsection` (`id`),
  CONSTRAINT `nvsapp_homework_createdby_id_51211124_fk_nvsapp_userregister_id` FOREIGN KEY (`createdby_id`) REFERENCES `nvsapp_userregister` (`id`),
  CONSTRAINT `nvsapp_homework_instituteid_id_604b6b73_fk_nvsapp_in` FOREIGN KEY (`instituteid_id`) REFERENCES `nvsapp_institutionprofile` (`id`),
  CONSTRAINT `nvsapp_homework_subjects_id_89c524cb_fk_nvsapp_mstsubject_id` FOREIGN KEY (`subjects_id`) REFERENCES `nvsapp_mstsubject` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nvsapp_homework`
--

LOCK TABLES `nvsapp_homework` WRITE;
/*!40000 ALTER TABLE `nvsapp_homework` DISABLE KEYS */;
/*!40000 ALTER TABLE `nvsapp_homework` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nvsapp_institutionprofile`
--

DROP TABLE IF EXISTS `nvsapp_institutionprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nvsapp_institutionprofile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nameoftrust` varchar(200) NOT NULL,
  `institutename` varchar(200) NOT NULL,
  `institutecode` varchar(200) NOT NULL,
  `address` varchar(500) NOT NULL,
  `mobilenumber` varchar(15) NOT NULL,
  `cashopeningbalance` varchar(30) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `currentAyear` varchar(100) NOT NULL,
  `softdelete` int NOT NULL,
  `createdon` varchar(50) NOT NULL,
  `createdby` varchar(50) NOT NULL,
  `upadated` varchar(50) NOT NULL,
  `updatedby` varchar(100) NOT NULL,
  `deletedon` varchar(50) NOT NULL,
  `deletedby` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nvsapp_institutionprofile`
--

LOCK TABLES `nvsapp_institutionprofile` WRITE;
/*!40000 ALTER TABLE `nvsapp_institutionprofile` DISABLE KEYS */;
INSERT INTO `nvsapp_institutionprofile` VALUES (1,'NUTAN VIDHYALAYA SOCIETY','NUTAN VIDHYALAYA BOYS HIGH SCHOOL','NVBHS','S B TEMPLE ROAD-KALABURAGI','9999999999','0.00','NVS.PNG','2023',0,'14-09-2023','SELF','','','','');
/*!40000 ALTER TABLE `nvsapp_institutionprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nvsapp_languagemapping`
--

DROP TABLE IF EXISTS `nvsapp_languagemapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nvsapp_languagemapping` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fl_id` bigint NOT NULL,
  `sl_id` bigint NOT NULL,
  `tl_id` bigint NOT NULL,
  `instituteid_id` bigint NOT NULL,
  `createdby_id` bigint NOT NULL,
  `createdon` varchar(50) NOT NULL,
  `updatedby` varchar(100) NOT NULL,
  `upadatedon` varchar(50) NOT NULL,
  `deletedby` varchar(100) NOT NULL,
  `deletedon` varchar(50) NOT NULL,
  `softdelete` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nvsapp_languagemapping_createdby_id_fa2f6ba2` (`createdby_id`),
  KEY `nvsapp_languagemapping_fl_id_12ecff24` (`fl_id`),
  KEY `nvsapp_languagemapping_sl_id_a7e94527` (`sl_id`),
  KEY `nvsapp_languagemapping_tl_id_72ca0215` (`tl_id`),
  KEY `nvsapp_languagemapping_instituteid_id_bd11d39f` (`instituteid_id`),
  CONSTRAINT `nvsapp_languagemappi_createdby_id_fa2f6ba2_fk_nvsapp_us` FOREIGN KEY (`createdby_id`) REFERENCES `nvsapp_userregister` (`id`),
  CONSTRAINT `nvsapp_languagemappi_instituteid_id_bd11d39f_fk_nvsapp_in` FOREIGN KEY (`instituteid_id`) REFERENCES `nvsapp_institutionprofile` (`id`),
  CONSTRAINT `nvsapp_languagemapping_fl_id_12ecff24_fk_nvsapp_mstsubject_id` FOREIGN KEY (`fl_id`) REFERENCES `nvsapp_mstsubject` (`id`),
  CONSTRAINT `nvsapp_languagemapping_sl_id_a7e94527_fk_nvsapp_mstsubject_id` FOREIGN KEY (`sl_id`) REFERENCES `nvsapp_mstsubject` (`id`),
  CONSTRAINT `nvsapp_languagemapping_tl_id_72ca0215_fk_nvsapp_mstsubject_id` FOREIGN KEY (`tl_id`) REFERENCES `nvsapp_mstsubject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nvsapp_languagemapping`
--

LOCK TABLES `nvsapp_languagemapping` WRITE;
/*!40000 ALTER TABLE `nvsapp_languagemapping` DISABLE KEYS */;
INSERT INTO `nvsapp_languagemapping` VALUES (1,1,2,3,1,2,'','','','','',0);
/*!40000 ALTER TABLE `nvsapp_languagemapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nvsapp_leavestaff`
--

DROP TABLE IF EXISTS `nvsapp_leavestaff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nvsapp_leavestaff` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `leavestatus` varchar(50) NOT NULL,
  `subject` varchar(1000) NOT NULL,
  `leavedate` varchar(20) NOT NULL,
  `end_date` varchar(100) NOT NULL,
  `text` varchar(10000) NOT NULL,
  `instituteid_id` bigint NOT NULL,
  `createdby_id` bigint NOT NULL,
  `createdon` varchar(50) NOT NULL,
  `updatedby` varchar(100) NOT NULL,
  `upadatedon` varchar(50) NOT NULL,
  `deletedby` varchar(100) NOT NULL,
  `deletedon` varchar(50) NOT NULL,
  `softdelete` int NOT NULL,
  `academicyearid_id` bigint NOT NULL,
  `updatedon` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nvsapp_leavestaff_createdby_id_4b9a77eb` (`createdby_id`),
  KEY `nvsapp_leavestaff_instituteid_id_46a21d17` (`instituteid_id`),
  KEY `nvsapp_leavestaff_academicyearid_id_39288fff_fk_nvsapp_ac` (`academicyearid_id`),
  CONSTRAINT `nvsapp_leavestaff_academicyearid_id_39288fff_fk_nvsapp_ac` FOREIGN KEY (`academicyearid_id`) REFERENCES `nvsapp_academicmaster` (`id`),
  CONSTRAINT `nvsapp_leavestaff_createdby_id_4b9a77eb_fk_nvsapp_us` FOREIGN KEY (`createdby_id`) REFERENCES `nvsapp_userregister` (`id`),
  CONSTRAINT `nvsapp_leavestaff_instituteid_id_46a21d17_fk_nvsapp_in` FOREIGN KEY (`instituteid_id`) REFERENCES `nvsapp_institutionprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nvsapp_leavestaff`
--

LOCK TABLES `nvsapp_leavestaff` WRITE;
/*!40000 ALTER TABLE `nvsapp_leavestaff` DISABLE KEYS */;
/*!40000 ALTER TABLE `nvsapp_leavestaff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nvsapp_libraryaddbook`
--

DROP TABLE IF EXISTS `nvsapp_libraryaddbook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nvsapp_libraryaddbook` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `booktype` varchar(100) NOT NULL,
  `bookname` varchar(200) NOT NULL,
  `booktitle` varchar(200) NOT NULL,
  `ISBNnumber` varchar(100) NOT NULL,
  `publisher` varchar(100) NOT NULL,
  `author` varchar(200) NOT NULL,
  `publishedyear` varchar(200) NOT NULL,
  `edition` varchar(200) NOT NULL,
  `publicationcost` int NOT NULL,
  `numberofbooks` varchar(200) NOT NULL,
  `row` varchar(100) NOT NULL,
  `shelf` varchar(100) NOT NULL,
  `rack` varchar(100) NOT NULL,
  `bookaddedby` varchar(200) NOT NULL,
  `bookaddedon` varchar(100) NOT NULL,
  `updatedon` varchar(100) NOT NULL,
  `updatedby` varchar(100) NOT NULL,
  `softdelete` int NOT NULL,
  `instituteid_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nvsapp_lbryaddbooks_instituteid_id_7ff85f55_fk_nvsapp_in` (`instituteid_id`),
  CONSTRAINT `nvsapp_lbryaddbooks_instituteid_id_7ff85f55_fk_nvsapp_in` FOREIGN KEY (`instituteid_id`) REFERENCES `nvsapp_institutionprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nvsapp_libraryaddbook`
--

LOCK TABLES `nvsapp_libraryaddbook` WRITE;
/*!40000 ALTER TABLE `nvsapp_libraryaddbook` DISABLE KEYS */;
/*!40000 ALTER TABLE `nvsapp_libraryaddbook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nvsapp_libraryissuebook`
--

DROP TABLE IF EXISTS `nvsapp_libraryissuebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nvsapp_libraryissuebook` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `bookid_id` bigint DEFAULT NULL,
  `issued_ISBN_number` varchar(20) NOT NULL,
  `issuedon` varchar(100) NOT NULL,
  `actualreturndate` varchar(100) NOT NULL,
  `returnstatus` varchar(100) NOT NULL,
  `indianissuedon` varchar(100) NOT NULL,
  `indianbookreturndate` varchar(100) NOT NULL,
  `finepaid` int NOT NULL,
  `softdelete` int NOT NULL,
  `academicyearid_id` bigint DEFAULT NULL,
  `instituteid_id` bigint DEFAULT NULL,
  `issuedby_id` bigint DEFAULT NULL,
  `returnissuedby_id` bigint DEFAULT NULL,
  `studentid_id` bigint NOT NULL,
  `indianactualreturndate` varchar(100) NOT NULL,
  `returndate` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nvsapp_lbryissuebook_issuedby_id_eafffaf9_fk_nvsapp_us` (`issuedby_id`),
  KEY `nvsapp_lbryissuebook_studentid_id_cc0d0e4a_fk_nvsapp_st` (`studentid_id`),
  KEY `nvsapp_lbryissuebook_bookid_id_6e6dd5a2` (`bookid_id`),
  KEY `nvsapp_libraryissueb_instituteid_id_4e111157_fk_nvsapp_in` (`instituteid_id`),
  KEY `nvsapp_libraryissuebook_returnissuedby_id_63b9dd80` (`returnissuedby_id`),
  KEY `nvsapp_libraryissueb_academicyearid_id_8b2f27c4_fk_nvsapp_ac` (`academicyearid_id`),
  CONSTRAINT `nvsapp_lbryissuebook_bookid_id_6e6dd5a2_fk_nvsapp_li` FOREIGN KEY (`bookid_id`) REFERENCES `nvsapp_libraryaddbook` (`id`),
  CONSTRAINT `nvsapp_lbryissuebook_issuedby_id_eafffaf9_fk_nvsapp_us` FOREIGN KEY (`issuedby_id`) REFERENCES `nvsapp_userregister` (`id`),
  CONSTRAINT `nvsapp_lbryissuebook_studentid_id_cc0d0e4a_fk_nvsapp_st` FOREIGN KEY (`studentid_id`) REFERENCES `nvsapp_studentregister` (`id`),
  CONSTRAINT `nvsapp_libraryissueb_academicyearid_id_8b2f27c4_fk_nvsapp_ac` FOREIGN KEY (`academicyearid_id`) REFERENCES `nvsapp_academicmaster` (`id`),
  CONSTRAINT `nvsapp_libraryissueb_instituteid_id_4e111157_fk_nvsapp_in` FOREIGN KEY (`instituteid_id`) REFERENCES `nvsapp_institutionprofile` (`id`),
  CONSTRAINT `nvsapp_libraryissueb_returnissuedby_id_63b9dd80_fk_nvsapp_us` FOREIGN KEY (`returnissuedby_id`) REFERENCES `nvsapp_userregister` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nvsapp_libraryissuebook`
--

LOCK TABLES `nvsapp_libraryissuebook` WRITE;
/*!40000 ALTER TABLE `nvsapp_libraryissuebook` DISABLE KEYS */;
/*!40000 ALTER TABLE `nvsapp_libraryissuebook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nvsapp_managementmembers`
--

DROP TABLE IF EXISTS `nvsapp_managementmembers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nvsapp_managementmembers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `mobilenumber` varchar(15) NOT NULL,
  `emailid` varchar(15) NOT NULL,
  `designation` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `softdelete` int NOT NULL,
  `createdon` varchar(50) NOT NULL,
  `createdby` varchar(50) NOT NULL,
  `upadated` varchar(50) NOT NULL,
  `updatedby` varchar(100) NOT NULL,
  `deletedon` varchar(50) NOT NULL,
  `deletedby` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nvsapp_managementmembers`
--

LOCK TABLES `nvsapp_managementmembers` WRITE;
/*!40000 ALTER TABLE `nvsapp_managementmembers` DISABLE KEYS */;
/*!40000 ALTER TABLE `nvsapp_managementmembers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nvsapp_message`
--

DROP TABLE IF EXISTS `nvsapp_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nvsapp_message` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `messagedate` varchar(100) NOT NULL,
  `messagetitle` varchar(100) NOT NULL,
  `messagedetails` varchar(100) NOT NULL,
  `instituteid_id` bigint NOT NULL,
  `softdelete` int NOT NULL,
  `createdon` varchar(50) NOT NULL,
  `createdby_id` bigint NOT NULL,
  `upadated` varchar(50) NOT NULL,
  `updatedby` varchar(100) NOT NULL,
  `deletedon` varchar(50) NOT NULL,
  `deletedby` varchar(100) NOT NULL,
  `academicyearid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nvsapp_message_academicyearid_id_6684429c` (`academicyearid_id`),
  KEY `nvsapp_message_createdby_id_8f59a36a` (`createdby_id`),
  KEY `nvsapp_message_instituteid_id_7c81adb7` (`instituteid_id`),
  CONSTRAINT `nvsapp_message_academicyearid_id_6684429c_fk_nvsapp_ac` FOREIGN KEY (`academicyearid_id`) REFERENCES `nvsapp_academicmaster` (`id`),
  CONSTRAINT `nvsapp_message_createdby_id_8f59a36a_fk_nvsapp_userregister_id` FOREIGN KEY (`createdby_id`) REFERENCES `nvsapp_userregister` (`id`),
  CONSTRAINT `nvsapp_message_instituteid_id_7c81adb7_fk_nvsapp_in` FOREIGN KEY (`instituteid_id`) REFERENCES `nvsapp_institutionprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nvsapp_message`
--

LOCK TABLES `nvsapp_message` WRITE;
/*!40000 ALTER TABLE `nvsapp_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `nvsapp_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nvsapp_mstassesment`
--

DROP TABLE IF EXISTS `nvsapp_mstassesment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nvsapp_mstassesment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `assesment_name` varchar(200) NOT NULL,
  `minimum_marks` varchar(50) NOT NULL,
  `maximum_marks` varchar(50) NOT NULL,
  `instituteid_id` bigint NOT NULL,
  `createdby_id` bigint NOT NULL,
  `createdon` varchar(50) NOT NULL,
  `updatedby` varchar(100) NOT NULL,
  `upadatedon` varchar(50) NOT NULL,
  `deletedby` varchar(100) NOT NULL,
  `deletedon` varchar(50) NOT NULL,
  `softdelete` int NOT NULL,
  `academicyearid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nvsapp_mstassesment_createdby_id_dd4c7abe` (`createdby_id`),
  KEY `nvsapp_mstassesment_instituteid_id_e0e514c1` (`instituteid_id`),
  CONSTRAINT `nvsapp_mstassesment_createdby_id_dd4c7abe_fk_nvsapp_us` FOREIGN KEY (`createdby_id`) REFERENCES `nvsapp_userregister` (`id`),
  CONSTRAINT `nvsapp_mstassesment_instituteid_id_e0e514c1_fk_nvsapp_in` FOREIGN KEY (`instituteid_id`) REFERENCES `nvsapp_institutionprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nvsapp_mstassesment`
--

LOCK TABLES `nvsapp_mstassesment` WRITE;
/*!40000 ALTER TABLE `nvsapp_mstassesment` DISABLE KEYS */;
INSERT INTO `nvsapp_mstassesment` VALUES (1,'1ST UNIT TEST','10','25',1,2,'','','','','',0,1),(2,'2ND UNIT TEST','10','25',1,2,'','','','','',0,1),(3,'3RD UNIT TEST','10','25',1,2,'','','','','',0,1),(4,'4TH UNIT TEST','10','25',1,2,'','','','','',0,1),(5,'MID TERM EXAM','18','50',1,2,'','','','','',0,1),(6,'FINAL EXAM','35','100',1,2,'','','','','',0,1);
/*!40000 ALTER TABLE `nvsapp_mstassesment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nvsapp_mstdesignation`
--

DROP TABLE IF EXISTS `nvsapp_mstdesignation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nvsapp_mstdesignation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `designationname` varchar(100) NOT NULL,
  `createdon` varchar(50) NOT NULL,
  `createdby` int NOT NULL,
  `softdelete` int NOT NULL,
  `homepage` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nvsapp_mstdesignation`
--

LOCK TABLES `nvsapp_mstdesignation` WRITE;
/*!40000 ALTER TABLE `nvsapp_mstdesignation` DISABLE KEYS */;
INSERT INTO `nvsapp_mstdesignation` VALUES (1,'President','17-07-2023',1000,0,'managementhome'),(2,'Vice President','17-07-2023',1000,0,'managementhome'),(3,'Secretary','17-07-2023',1000,0,'managementhome'),(4,'Joint Secretary','17-07-2023',1000,0,'managementhome'),(5,'Treasurer','17-07-2023',1000,0,'managementhome'),(6,'Executive Member','17-07-2023',1000,0,'memberhome'),(7,'Principal','17-07-2023',1000,0,'principalhome'),(8,'Cashier','17-07-2023',1000,0,'cashierhome'),(9,'Operator','17-07-2023',1000,0,'operatorhome'),(10,'Faculty','17-07-2023',1000,0,'facultyhome'),(11,'Accountant','17-07-2023',1000,0,'accountanthome'),(12,'Librarian','17-07-2023',1000,0,'librarianhome'),(100,'Administrator','17-07-2023',1000,0,'adminhome'),(1000,'Super Administrator','17-07-2023',1000,0,'superadminhome');
/*!40000 ALTER TABLE `nvsapp_mstdesignation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nvsapp_mstfeedback`
--

DROP TABLE IF EXISTS `nvsapp_mstfeedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nvsapp_mstfeedback` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `feedback` varchar(5000) NOT NULL,
  `createdby_id` bigint NOT NULL,
  `createdon` varchar(50) NOT NULL,
  `updatedby` varchar(100) NOT NULL,
  `upadatedon` varchar(50) NOT NULL,
  `deletedby` varchar(100) NOT NULL,
  `deletedon` varchar(50) NOT NULL,
  `softdelete` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nvsapp_mstfeedback_createdby_id_5a4f8193` (`createdby_id`),
  CONSTRAINT `nvsapp_mstfeedback_createdby_id_5a4f8193_fk_nvsapp_us` FOREIGN KEY (`createdby_id`) REFERENCES `nvsapp_userregister` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nvsapp_mstfeedback`
--

LOCK TABLES `nvsapp_mstfeedback` WRITE;
/*!40000 ALTER TABLE `nvsapp_mstfeedback` DISABLE KEYS */;
INSERT INTO `nvsapp_mstfeedback` VALUES (1,'Does the Teaching Faculty be on time to the class?',1,'','','','','',0),(2,'Does the Teaching Faculty explain the concepts with sufficient examples?',1,'','','','','',0),(3,'Does the Teaching Faculty clear your doubts when you apporch?',1,'','','','','',0),(4,'Does the Teaching Faculty provide notes in class?',1,'','','','','',0);
/*!40000 ALTER TABLE `nvsapp_mstfeedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nvsapp_mstfeeshead`
--

DROP TABLE IF EXISTS `nvsapp_mstfeeshead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nvsapp_mstfeeshead` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `feeshead` varchar(100) NOT NULL,
  `amount` double NOT NULL,
  `createdon` varchar(50) NOT NULL,
  `updatedby` varchar(100) NOT NULL,
  `upadatedon` varchar(50) NOT NULL,
  `deletedby` varchar(100) NOT NULL,
  `deletedon` varchar(50) NOT NULL,
  `softdelete` int NOT NULL,
  `academicyearid_id` bigint NOT NULL,
  `classid_id` bigint NOT NULL,
  `createdby_id` bigint NOT NULL,
  `instituteid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nvsapp_mstfeeshead_academicyearid_id_a2cfb440_fk_nvsapp_ac` (`academicyearid_id`),
  KEY `nvsapp_mstfeeshead_classid_id_34c45509_fk_nvsapp_addclass_id` (`classid_id`),
  KEY `nvsapp_mstfeeshead_createdby_id_91a323b7_fk_nvsapp_us` (`createdby_id`),
  KEY `nvsapp_mstfeeshead_instituteid_id_0d15a41b_fk_nvsapp_in` (`instituteid_id`),
  CONSTRAINT `nvsapp_mstfeeshead_academicyearid_id_a2cfb440_fk_nvsapp_ac` FOREIGN KEY (`academicyearid_id`) REFERENCES `nvsapp_academicmaster` (`id`),
  CONSTRAINT `nvsapp_mstfeeshead_classid_id_34c45509_fk_nvsapp_addclass_id` FOREIGN KEY (`classid_id`) REFERENCES `nvsapp_addclass` (`id`),
  CONSTRAINT `nvsapp_mstfeeshead_createdby_id_91a323b7_fk_nvsapp_us` FOREIGN KEY (`createdby_id`) REFERENCES `nvsapp_userregister` (`id`),
  CONSTRAINT `nvsapp_mstfeeshead_instituteid_id_0d15a41b_fk_nvsapp_in` FOREIGN KEY (`instituteid_id`) REFERENCES `nvsapp_institutionprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nvsapp_mstfeeshead`
--

LOCK TABLES `nvsapp_mstfeeshead` WRITE;
/*!40000 ALTER TABLE `nvsapp_mstfeeshead` DISABLE KEYS */;
/*!40000 ALTER TABLE `nvsapp_mstfeeshead` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nvsapp_mstsubcaste`
--

DROP TABLE IF EXISTS `nvsapp_mstsubcaste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nvsapp_mstsubcaste` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subcaste` varchar(100) NOT NULL,
  `Category` varchar(100) NOT NULL,
  `selectreligion_id` bigint NOT NULL,
  `selectcastes_id` bigint NOT NULL,
  `instituteid_id` bigint NOT NULL,
  `createdby_id` bigint NOT NULL,
  `createdon` varchar(50) NOT NULL,
  `updatedby` varchar(100) NOT NULL,
  `upadatedon` varchar(50) NOT NULL,
  `deletedby` varchar(100) NOT NULL,
  `deletedon` varchar(50) NOT NULL,
  `softdelete` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nvsapp_subcaste_createdby_id_333aa8bb` (`createdby_id`),
  KEY `nvsapp_subcaste_selectcastes_id_fe97eb3f` (`selectcastes_id`),
  KEY `nvsapp_subcaste_selectreligion_id_8c6efed1` (`selectreligion_id`),
  KEY `nvsapp_subcaste_instituteid_id_1a7427da` (`instituteid_id`),
  CONSTRAINT `nvsapp_subcaste_createdby_id_333aa8bb_fk_nvsapp_userregister_id` FOREIGN KEY (`createdby_id`) REFERENCES `nvsapp_userregister` (`id`),
  CONSTRAINT `nvsapp_subcaste_instituteid_id_1a7427da_fk_nvsapp_in` FOREIGN KEY (`instituteid_id`) REFERENCES `nvsapp_institutionprofile` (`id`),
  CONSTRAINT `nvsapp_subcaste_selectcastes_id_fe97eb3f_fk_nvsapp_ca` FOREIGN KEY (`selectcastes_id`) REFERENCES `nvsapp_casteoperator` (`id`),
  CONSTRAINT `nvsapp_subcaste_selectreligion_id_8c6efed1_fk_nvsapp_religion_id` FOREIGN KEY (`selectreligion_id`) REFERENCES `nvsapp_religion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nvsapp_mstsubcaste`
--

LOCK TABLES `nvsapp_mstsubcaste` WRITE;
/*!40000 ALTER TABLE `nvsapp_mstsubcaste` DISABLE KEYS */;
INSERT INTO `nvsapp_mstsubcaste` VALUES (1,'','SC',1,1,1,1,'','','','','',0);
/*!40000 ALTER TABLE `nvsapp_mstsubcaste` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nvsapp_mstsubject`
--

DROP TABLE IF EXISTS `nvsapp_mstsubject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nvsapp_mstsubject` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subjectname` varchar(200) NOT NULL,
  `instituteid_id` bigint NOT NULL,
  `createdby_id` bigint NOT NULL,
  `createdon` varchar(50) NOT NULL,
  `updatedby` varchar(100) NOT NULL,
  `upadatedon` varchar(50) NOT NULL,
  `deletedby` varchar(100) NOT NULL,
  `deletedon` varchar(50) NOT NULL,
  `softdelete` int NOT NULL,
  `optional` varchar(200) NOT NULL,
  `subjectcategory` varchar(200) NOT NULL,
  `subjecttype` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nvsapp_mstsubject_createdby_id_926cd5ec` (`createdby_id`),
  KEY `nvsapp_mstsubject_instituteid_id_d23e4e22` (`instituteid_id`),
  CONSTRAINT `nvsapp_mstsubject_createdby_id_926cd5ec_fk_nvsapp_us` FOREIGN KEY (`createdby_id`) REFERENCES `nvsapp_userregister` (`id`),
  CONSTRAINT `nvsapp_mstsubject_instituteid_id_d23e4e22_fk_nvsapp_in` FOREIGN KEY (`instituteid_id`) REFERENCES `nvsapp_institutionprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nvsapp_mstsubject`
--

LOCK TABLES `nvsapp_mstsubject` WRITE;
/*!40000 ALTER TABLE `nvsapp_mstsubject` DISABLE KEYS */;
INSERT INTO `nvsapp_mstsubject` VALUES (1,'ENGLISH',1,2,'','','','','',0,'2','1','1'),(2,'KANNADA',1,2,'','','','','',0,'2','1','1'),(3,'HINDI',1,2,'','','','','',0,'2','1','1'),(4,'SOCIAL STUDIES',1,2,'','','','','',0,'2','2','1'),(5,'SOCIAL SCIENCE',1,2,'','','','','',0,'2','2','1'),(6,'MATHS',1,2,'','','','','',0,'2','2','1');
/*!40000 ALTER TABLE `nvsapp_mstsubject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nvsapp_noticecircular`
--

DROP TABLE IF EXISTS `nvsapp_noticecircular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nvsapp_noticecircular` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `classs_id` bigint NOT NULL,
  `section_id` bigint NOT NULL,
  `subject` varchar(2000) NOT NULL,
  `matter` varchar(2000) NOT NULL,
  `instituteid_id` bigint NOT NULL,
  `createdby_id` bigint NOT NULL,
  `createdon` varchar(50) NOT NULL,
  `updatedby` varchar(100) NOT NULL,
  `upadatedon` varchar(50) NOT NULL,
  `deletedby` varchar(100) NOT NULL,
  `deletedon` varchar(50) NOT NULL,
  `softdelete` int NOT NULL,
  `image` varchar(225) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nvsapp_noticecircular_classs_id_5d3eab22` (`classs_id`),
  KEY `nvsapp_noticecircular_createdby_id_63e97a18` (`createdby_id`),
  KEY `nvsapp_noticecircular_section_id_fed8f89c` (`section_id`),
  KEY `nvsapp_noticecircular_instituteid_id_186e3aa9` (`instituteid_id`),
  CONSTRAINT `nvsapp_noticecircula_createdby_id_63e97a18_fk_nvsapp_us` FOREIGN KEY (`createdby_id`) REFERENCES `nvsapp_userregister` (`id`),
  CONSTRAINT `nvsapp_noticecircula_instituteid_id_186e3aa9_fk_nvsapp_in` FOREIGN KEY (`instituteid_id`) REFERENCES `nvsapp_institutionprofile` (`id`),
  CONSTRAINT `nvsapp_noticecircula_section_id_fed8f89c_fk_nvsapp_ad` FOREIGN KEY (`section_id`) REFERENCES `nvsapp_addsection` (`id`),
  CONSTRAINT `nvsapp_noticecircular_classs_id_5d3eab22_fk_nvsapp_addclass_id` FOREIGN KEY (`classs_id`) REFERENCES `nvsapp_addclass` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nvsapp_noticecircular`
--

LOCK TABLES `nvsapp_noticecircular` WRITE;
/*!40000 ALTER TABLE `nvsapp_noticecircular` DISABLE KEYS */;
INSERT INTO `nvsapp_noticecircular` VALUES (1,1,1,'Mid Term Exams from 1th Nov 2023 ','All 1st standard students will be having Mid Term Exams from 1th Nov 2023 ',1,2,'','','','','',0,'/media/Screenshot%20(1).png');
/*!40000 ALTER TABLE `nvsapp_noticecircular` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nvsapp_religion`
--

DROP TABLE IF EXISTS `nvsapp_religion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nvsapp_religion` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `religion` varchar(100) NOT NULL,
  `instituteid_id` bigint NOT NULL,
  `createdby_id` bigint NOT NULL,
  `createdon` varchar(50) NOT NULL,
  `updatedby` varchar(100) NOT NULL,
  `upadatedon` varchar(50) NOT NULL,
  `deletedby` varchar(100) NOT NULL,
  `deletedon` varchar(50) NOT NULL,
  `softdelete` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nvsapp_religion_createdby_id_5417d5e9` (`createdby_id`),
  KEY `nvsapp_religion_instituteid_id_2a4c36d2` (`instituteid_id`),
  CONSTRAINT `nvsapp_religion_createdby_id_5417d5e9_fk_nvsapp_userregister_id` FOREIGN KEY (`createdby_id`) REFERENCES `nvsapp_userregister` (`id`),
  CONSTRAINT `nvsapp_religion_instituteid_id_2a4c36d2_fk_nvsapp_in` FOREIGN KEY (`instituteid_id`) REFERENCES `nvsapp_institutionprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nvsapp_religion`
--

LOCK TABLES `nvsapp_religion` WRITE;
/*!40000 ALTER TABLE `nvsapp_religion` DISABLE KEYS */;
INSERT INTO `nvsapp_religion` VALUES (1,'HINDU',1,1,'14-09-2023','','','','',0),(2,'MUSLIM',1,1,'14-09-2023','','','','',0),(3,'Christian ',1,1,'14-09-2023','','','','',0),(4,'sikh',1,1,'14-09-2023','','','','',0);
/*!40000 ALTER TABLE `nvsapp_religion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nvsapp_studentattendance`
--

DROP TABLE IF EXISTS `nvsapp_studentattendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nvsapp_studentattendance` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `staffid_id` bigint NOT NULL,
  `classid_id` bigint NOT NULL,
  `sectionid_id` bigint NOT NULL,
  `instituteid_id` bigint NOT NULL,
  `academicyearid_id` bigint NOT NULL,
  `createdby_id` bigint NOT NULL,
  `createdon` varchar(50) NOT NULL,
  `updatedby` varchar(100) NOT NULL,
  `upadatedon` varchar(50) NOT NULL,
  `deletedby` varchar(100) NOT NULL,
  `deletedon` varchar(50) NOT NULL,
  `softdelete` int NOT NULL,
  `studentid_id` bigint NOT NULL,
  `attendancestatus` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nvsapp_studentattendance_Staffid_id_cca50265` (`staffid_id`),
  KEY `nvsapp_studentattendance_academicyearid_id_370f53da` (`academicyearid_id`),
  KEY `nvsapp_studentattendance_classid_id_5829a24e` (`classid_id`),
  KEY `nvsapp_studentattendance_createdby_id_562e0df9` (`createdby_id`),
  KEY `nvsapp_studentattendance_sectionid_id_36c4cb89` (`sectionid_id`),
  KEY `nvsapp_studentattendance_studentid_id_6e98cdb5` (`studentid_id`),
  KEY `nvsapp_studentattendance_instituteid_id_c73e6fcf` (`instituteid_id`),
  CONSTRAINT `nvsapp_studentattend_academicyearid_id_370f53da_fk_nvsapp_ac` FOREIGN KEY (`academicyearid_id`) REFERENCES `nvsapp_academicmaster` (`id`),
  CONSTRAINT `nvsapp_studentattend_classid_id_5829a24e_fk_nvsapp_ad` FOREIGN KEY (`classid_id`) REFERENCES `nvsapp_addclass` (`id`),
  CONSTRAINT `nvsapp_studentattend_createdby_id_562e0df9_fk_nvsapp_us` FOREIGN KEY (`createdby_id`) REFERENCES `nvsapp_userregister` (`id`),
  CONSTRAINT `nvsapp_studentattend_instituteid_id_c73e6fcf_fk_nvsapp_in` FOREIGN KEY (`instituteid_id`) REFERENCES `nvsapp_institutionprofile` (`id`),
  CONSTRAINT `nvsapp_studentattend_sectionid_id_36c4cb89_fk_nvsapp_ad` FOREIGN KEY (`sectionid_id`) REFERENCES `nvsapp_addsection` (`id`),
  CONSTRAINT `nvsapp_studentattend_staffid_id_8c78f76e_fk_nvsapp_us` FOREIGN KEY (`staffid_id`) REFERENCES `nvsapp_userregister` (`id`),
  CONSTRAINT `nvsapp_studentattend_studentid_id_6e98cdb5_fk_nvsapp_st` FOREIGN KEY (`studentid_id`) REFERENCES `nvsapp_studentregister` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nvsapp_studentattendance`
--

LOCK TABLES `nvsapp_studentattendance` WRITE;
/*!40000 ALTER TABLE `nvsapp_studentattendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `nvsapp_studentattendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nvsapp_studentdocument`
--

DROP TABLE IF EXISTS `nvsapp_studentdocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nvsapp_studentdocument` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `studentid` varchar(100) NOT NULL,
  `Holticket` varchar(100) NOT NULL,
  `tc` varchar(100) NOT NULL,
  `MarksCard` varchar(100) NOT NULL,
  `CasteCertificate` varchar(100) NOT NULL,
  `IncomeCertificate` varchar(100) NOT NULL,
  `Aadhaar` varchar(100) NOT NULL,
  `BankPassbook` varchar(100) NOT NULL,
  `Rationcard` varchar(100) NOT NULL,
  `Photho` varchar(100) NOT NULL,
  `Handicappedcertificate` varchar(100) NOT NULL,
  `Medicalcertificate` varchar(100) NOT NULL,
  `Bond` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nvsapp_studentdocument`
--

LOCK TABLES `nvsapp_studentdocument` WRITE;
/*!40000 ALTER TABLE `nvsapp_studentdocument` DISABLE KEYS */;
/*!40000 ALTER TABLE `nvsapp_studentdocument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nvsapp_studentfeeback`
--

DROP TABLE IF EXISTS `nvsapp_studentfeeback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nvsapp_studentfeeback` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `feedbackstatus` varchar(100) NOT NULL,
  `instituteid` int NOT NULL,
  `createdon` varchar(50) NOT NULL,
  `updatedby` varchar(100) NOT NULL,
  `upadatedon` varchar(50) NOT NULL,
  `deletedby` varchar(100) NOT NULL,
  `deletedon` varchar(50) NOT NULL,
  `softdelete` int NOT NULL,
  `academicyearid_id` bigint NOT NULL,
  `classid_id` bigint NOT NULL,
  `createdby_id` bigint NOT NULL,
  `sectionid_id` bigint NOT NULL,
  `staffid_id` bigint NOT NULL,
  `studentid_id` bigint NOT NULL,
  `subjectid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nvsapp_studentfeebac_academicyearid_id_1ef4dfe3_fk_nvsapp_ac` (`academicyearid_id`),
  KEY `nvsapp_studentfeeback_classid_id_3460cdac_fk_nvsapp_addclass_id` (`classid_id`),
  KEY `nvsapp_studentfeebac_createdby_id_a520e33f_fk_nvsapp_us` (`createdby_id`),
  KEY `nvsapp_studentfeebac_sectionid_id_c4d02630_fk_nvsapp_ad` (`sectionid_id`),
  KEY `nvsapp_studentfeebac_staffid_id_138b5107_fk_nvsapp_us` (`staffid_id`),
  KEY `nvsapp_studentfeebac_studentid_id_14de515a_fk_nvsapp_st` (`studentid_id`),
  KEY `nvsapp_studentfeebac_subjectid_id_cff4d272_fk_nvsapp_ms` (`subjectid_id`),
  CONSTRAINT `nvsapp_studentfeebac_academicyearid_id_1ef4dfe3_fk_nvsapp_ac` FOREIGN KEY (`academicyearid_id`) REFERENCES `nvsapp_academicmaster` (`id`),
  CONSTRAINT `nvsapp_studentfeebac_createdby_id_a520e33f_fk_nvsapp_us` FOREIGN KEY (`createdby_id`) REFERENCES `nvsapp_userregister` (`id`),
  CONSTRAINT `nvsapp_studentfeebac_sectionid_id_c4d02630_fk_nvsapp_ad` FOREIGN KEY (`sectionid_id`) REFERENCES `nvsapp_addsection` (`id`),
  CONSTRAINT `nvsapp_studentfeebac_staffid_id_138b5107_fk_nvsapp_us` FOREIGN KEY (`staffid_id`) REFERENCES `nvsapp_userregister` (`id`),
  CONSTRAINT `nvsapp_studentfeebac_studentid_id_14de515a_fk_nvsapp_st` FOREIGN KEY (`studentid_id`) REFERENCES `nvsapp_studentregister` (`id`),
  CONSTRAINT `nvsapp_studentfeebac_subjectid_id_cff4d272_fk_nvsapp_ms` FOREIGN KEY (`subjectid_id`) REFERENCES `nvsapp_mstsubject` (`id`),
  CONSTRAINT `nvsapp_studentfeeback_classid_id_3460cdac_fk_nvsapp_addclass_id` FOREIGN KEY (`classid_id`) REFERENCES `nvsapp_addclass` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nvsapp_studentfeeback`
--

LOCK TABLES `nvsapp_studentfeeback` WRITE;
/*!40000 ALTER TABLE `nvsapp_studentfeeback` DISABLE KEYS */;
/*!40000 ALTER TABLE `nvsapp_studentfeeback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nvsapp_studentleave`
--

DROP TABLE IF EXISTS `nvsapp_studentleave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nvsapp_studentleave` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subject` varchar(1000) NOT NULL,
  `leavedate` varchar(20) NOT NULL,
  `end_date` varchar(100) NOT NULL,
  `text` varchar(10000) NOT NULL,
  `classid_id` bigint NOT NULL,
  `sectionsid_id` bigint NOT NULL,
  `createdon` varchar(50) NOT NULL,
  `leavestatus` varchar(50) NOT NULL,
  `updatedby` varchar(100) NOT NULL,
  `upadatedon` varchar(50) NOT NULL,
  `deletedby` varchar(100) NOT NULL,
  `deletedon` varchar(50) NOT NULL,
  `softdelete` int NOT NULL,
  `academicyearid_id` bigint NOT NULL,
  `createdby_id` bigint NOT NULL,
  `instituteid_id` bigint NOT NULL,
  `staffid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nvsapp_studentleave_academicyearid_id_62e58b1d_fk_nvsapp_ac` (`academicyearid_id`),
  KEY `nvsapp_studentleave_createdby_id_3d401eb9_fk_nvsapp_st` (`createdby_id`),
  KEY `nvsapp_studentleave_instituteid_id_7d56e1e8_fk_nvsapp_in` (`instituteid_id`),
  KEY `nvsapp_studentleave_staffid_id_9fe720cd_fk_nvsapp_us` (`staffid_id`),
  KEY `nvsapp_studentleave_classid_id_37b20fed` (`classid_id`),
  KEY `nvsapp_studentleave_sectionsid_id_264bb5a1` (`sectionsid_id`),
  CONSTRAINT `nvsapp_studentleave_academicyearid_id_62e58b1d_fk_nvsapp_ac` FOREIGN KEY (`academicyearid_id`) REFERENCES `nvsapp_academicmaster` (`id`),
  CONSTRAINT `nvsapp_studentleave_classid_id_37b20fed_fk_nvsapp_addclass_id` FOREIGN KEY (`classid_id`) REFERENCES `nvsapp_addclass` (`id`),
  CONSTRAINT `nvsapp_studentleave_createdby_id_3d401eb9_fk_nvsapp_st` FOREIGN KEY (`createdby_id`) REFERENCES `nvsapp_studentregister` (`id`),
  CONSTRAINT `nvsapp_studentleave_instituteid_id_7d56e1e8_fk_nvsapp_in` FOREIGN KEY (`instituteid_id`) REFERENCES `nvsapp_institutionprofile` (`id`),
  CONSTRAINT `nvsapp_studentleave_sectionsid_id_264bb5a1_fk_nvsapp_ad` FOREIGN KEY (`sectionsid_id`) REFERENCES `nvsapp_addsection` (`id`),
  CONSTRAINT `nvsapp_studentleave_staffid_id_9fe720cd_fk_nvsapp_us` FOREIGN KEY (`staffid_id`) REFERENCES `nvsapp_userregister` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nvsapp_studentleave`
--

LOCK TABLES `nvsapp_studentleave` WRITE;
/*!40000 ALTER TABLE `nvsapp_studentleave` DISABLE KEYS */;
/*!40000 ALTER TABLE `nvsapp_studentleave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nvsapp_studentleavetoadmin`
--

DROP TABLE IF EXISTS `nvsapp_studentleavetoadmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nvsapp_studentleavetoadmin` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subject` varchar(1000) NOT NULL,
  `leavedate` varchar(20) NOT NULL,
  `end_date` varchar(100) NOT NULL,
  `text` varchar(10000) NOT NULL,
  `classid_id` bigint NOT NULL,
  `sectionsid_id` bigint NOT NULL,
  `createdon` varchar(50) NOT NULL,
  `leavestatus` varchar(50) NOT NULL,
  `updatedby` varchar(100) NOT NULL,
  `upadatedon` varchar(50) NOT NULL,
  `deletedby` varchar(100) NOT NULL,
  `deletedon` varchar(50) NOT NULL,
  `softdelete` int NOT NULL,
  `academicyearid_id` bigint NOT NULL,
  `createdby_id` bigint NOT NULL,
  `instituteid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nvsapp_studentleavet_academicyearid_id_ac61464c_fk_nvsapp_ac` (`academicyearid_id`),
  KEY `nvsapp_studentleavet_createdby_id_055473a8_fk_nvsapp_st` (`createdby_id`),
  KEY `nvsapp_studentleavet_instituteid_id_5ac02039_fk_nvsapp_in` (`instituteid_id`),
  KEY `nvsapp_studentleavetoadmin_classid_id_59bac9b1` (`classid_id`),
  KEY `nvsapp_studentleavetoadmin_sectionsid_id_992554f7` (`sectionsid_id`),
  CONSTRAINT `nvsapp_studentleavet_academicyearid_id_ac61464c_fk_nvsapp_ac` FOREIGN KEY (`academicyearid_id`) REFERENCES `nvsapp_academicmaster` (`id`),
  CONSTRAINT `nvsapp_studentleavet_classid_id_59bac9b1_fk_nvsapp_ad` FOREIGN KEY (`classid_id`) REFERENCES `nvsapp_addclass` (`id`),
  CONSTRAINT `nvsapp_studentleavet_createdby_id_055473a8_fk_nvsapp_st` FOREIGN KEY (`createdby_id`) REFERENCES `nvsapp_studentregister` (`id`),
  CONSTRAINT `nvsapp_studentleavet_instituteid_id_5ac02039_fk_nvsapp_in` FOREIGN KEY (`instituteid_id`) REFERENCES `nvsapp_institutionprofile` (`id`),
  CONSTRAINT `nvsapp_studentleavet_sectionsid_id_992554f7_fk_nvsapp_ad` FOREIGN KEY (`sectionsid_id`) REFERENCES `nvsapp_addsection` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nvsapp_studentleavetoadmin`
--

LOCK TABLES `nvsapp_studentleavetoadmin` WRITE;
/*!40000 ALTER TABLE `nvsapp_studentleavetoadmin` DISABLE KEYS */;
/*!40000 ALTER TABLE `nvsapp_studentleavetoadmin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nvsapp_studentregister`
--

DROP TABLE IF EXISTS `nvsapp_studentregister`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nvsapp_studentregister` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `admissionno` int NOT NULL,
  `admissiondate` varchar(100) NOT NULL,
  `chooseclass_id` bigint NOT NULL,
  `section_id` bigint NOT NULL,
  `rollno` int NOT NULL,
  `studentid` varchar(15) NOT NULL,
  `studentname` varchar(100) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `aadhaarno` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `dateofbirth` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `religion_id` bigint NOT NULL,
  `caste_id` bigint NOT NULL,
  `subcaste_id` bigint NOT NULL,
  `nationality` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `mobileno` varchar(100) NOT NULL,
  `phoneno` varchar(100) NOT NULL,
  `amount` double NOT NULL,
  `fathername` varchar(100) NOT NULL,
  `fathereducation` varchar(100) NOT NULL,
  `fatherdesignation` varchar(100) NOT NULL,
  `mothername` varchar(100) NOT NULL,
  `mothereducation` varchar(100) NOT NULL,
  `motherdesignation` varchar(100) NOT NULL,
  `mothertongue` varchar(100) NOT NULL,
  `dependents` varchar(100) NOT NULL,
  `annualincome` varchar(100) NOT NULL,
  `lastschool` varchar(100) NOT NULL,
  `tcno` varchar(100) NOT NULL,
  `latitude` varchar(100) NOT NULL,
  `longitude` varchar(100) NOT NULL,
  `academicyearid_id` bigint DEFAULT NULL,
  `createdby_id` bigint NOT NULL,
  `createdon` varchar(100) NOT NULL,
  `deletedby` varchar(100) NOT NULL,
  `deletedon` varchar(100) NOT NULL,
  `softdelete` int NOT NULL,
  `upadatedon` varchar(100) NOT NULL,
  `updatedby` varchar(100) NOT NULL,
  `aadharimage` varchar(100) NOT NULL,
  `bloodgroup` varchar(100) NOT NULL,
  `studentphoto` varchar(100) NOT NULL,
  `instituteid_id` bigint NOT NULL,
  `password` varchar(100) NOT NULL,
  `SchoolBus` varchar(100) NOT NULL,
  `buscharge` varchar(100) NOT NULL,
  `busfacility` varchar(100) NOT NULL,
  `discount` double NOT NULL,
  `hostelfacility` varchar(100) NOT NULL,
  `schoolbusroute` varchar(100) NOT NULL,
  `srnumber` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nvsapp_studentregister_academicyearid_id_4c0569d4` (`academicyearid_id`),
  KEY `nvsapp_studentregister_caste_id_eceae4fd` (`caste_id`),
  KEY `nvsapp_studentregister_chooseclass_id_0a7b80f3` (`chooseclass_id`),
  KEY `nvsapp_studentregister_createdby_id_ee332a9b` (`createdby_id`),
  KEY `nvsapp_studentregister_religion_id_dc347655` (`religion_id`),
  KEY `nvsapp_studentregister_section_id_3882a7f9` (`section_id`),
  KEY `nvsapp_studentregister_subcaste_id_bb13f278` (`subcaste_id`),
  KEY `nvsapp_studentregister_instituteid_id_cd4ddadc` (`instituteid_id`),
  CONSTRAINT `nvsapp_studentregist_academicyearid_id_4c0569d4_fk_nvsapp_ac` FOREIGN KEY (`academicyearid_id`) REFERENCES `nvsapp_academicmaster` (`id`),
  CONSTRAINT `nvsapp_studentregist_caste_id_eceae4fd_fk_nvsapp_ca` FOREIGN KEY (`caste_id`) REFERENCES `nvsapp_casteoperator` (`id`),
  CONSTRAINT `nvsapp_studentregist_chooseclass_id_0a7b80f3_fk_nvsapp_ad` FOREIGN KEY (`chooseclass_id`) REFERENCES `nvsapp_addclass` (`id`),
  CONSTRAINT `nvsapp_studentregist_createdby_id_ee332a9b_fk_nvsapp_us` FOREIGN KEY (`createdby_id`) REFERENCES `nvsapp_userregister` (`id`),
  CONSTRAINT `nvsapp_studentregist_instituteid_id_cd4ddadc_fk_nvsapp_in` FOREIGN KEY (`instituteid_id`) REFERENCES `nvsapp_institutionprofile` (`id`),
  CONSTRAINT `nvsapp_studentregist_religion_id_dc347655_fk_nvsapp_re` FOREIGN KEY (`religion_id`) REFERENCES `nvsapp_religion` (`id`),
  CONSTRAINT `nvsapp_studentregist_section_id_3882a7f9_fk_nvsapp_ad` FOREIGN KEY (`section_id`) REFERENCES `nvsapp_addsection` (`id`),
  CONSTRAINT `nvsapp_studentregist_subcaste_id_bb13f278_fk_nvsapp_ms` FOREIGN KEY (`subcaste_id`) REFERENCES `nvsapp_mstsubcaste` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nvsapp_studentregister`
--

LOCK TABLES `nvsapp_studentregister` WRITE;
/*!40000 ALTER TABLE `nvsapp_studentregister` DISABLE KEYS */;
INSERT INTO `nvsapp_studentregister` VALUES (1,1,'1111-11-11',1,1,1,'','shiva','talmudge','323157138451','M','1111-11-11','SC',1,1,1,'Indian','Byalhalli(w) Bhlaki','Karnataka','+916364603717','+916364603717',0,'chandrakanth','1','Farmer','kaveri','1','house wife','kannada','0','20000','msmr','7888','66676','76767',1,2,'','','',0,'','','noimage.png','1','/media/profile_img.jpg',1,'436438','kA32JA7132','2020','yes',123345,'yes','R T Nagar','NVBHS2023001'),(2,2,'7777-07-07',1,1,1,'','Somu','Ta;mudge','323157138451','M','1111-12-11','SC',1,1,1,'Indian','ffhfhfhf hfhgfhfhf','Karnataka','+916364603717','+916364603717',0,'Shiva','1','kannada','kaveri','1','house wife','kannada','0','10000','sdfgdg ','23232','3232','2323',1,2,'','','',0,'','','noimage.png','1','/media/profile_img_xNbwlII.jpg',1,'622116','kA32JA7132','2323','yes',2000,'yes','R T Nagar','NVBHS2023002'),(3,3,'1111-11-11',1,1,2,'','Ajay','Dole','32323232323','M','2222-12-12','SC',1,1,1,'Indian','devnal gulbarga','Karnataka','8884752201','8884752201',0,'Shekar','1','farmer','shsh','1','farmer','kannda','0','20000','dfjgsdjfg gjsdfjgds f','450','6546544','64',1,2,'','','',0,'','','noimage.png','5','/media/sign_shiva.jpg',1,'754635','kA32JA7132','200','yes',2000,'yes','Ganga Nagar','NVBHS2023003'),(4,4,'1212-01-22',1,1,2,'','Anup','Ghattikarq','222233334444','M','1111-12-12','SC',1,1,1,'Indian','gulbarga','Karnataka','7894561230','3210456789',0,'Dattatri','1','Farmer','kasturi','2','Librarien','kannada','0','50000','Sdkaskdh  djfgjsgdjf ','789456','8787','87778',1,2,'','','',0,'','','noimage.png','3','/media/A%20masterpiece%20portrait%20of%20a%20beautiful%20man%20with%20bla.jpg',1,'433453','kA32JA7132','78778','yes',50,'yes','R T Nagar','NVBHS2023004'),(5,5,'2023-09-16',1,1,2,'','Rahul','Rathod','222244445555','M','1111-11-11','SC',1,1,1,'Indian','Karari gulbarga','Karnataka','7022388219','7022388219',0,'shivraj','1','Farmer','test1','1','house wife','kannada','0','500000','jhhjhjj jhgg','789456','1333','13131',1,2,'','','',0,'','','noimage.png','1','/media/Automobile.jpg',1,'842085','kA32JA7132','2000','no',1111,'no','R T Nagar','NVBHS2023005'),(6,6,'2023-09-16',2,2,1,'','Pooja','yadav','789478947894','F','1111-11-11','SC',1,1,1,'Indian','as sas dasff gdsgsg','Karnataka','8945894545','8945894545',0,'chandrakanth','4','Teacher','kaveri','3','Teacher','kannada','0','80000','msmsms ','202020','2323','787.787',1,2,'','','',0,'','','noimage.png','3','/media/IMG-20190918-WA0026%20(2).jpg',1,'914137','kA32JA7132','kdjskjfq','yes',200,'no','Ganga Nagar','NVBHS2023006'),(7,7,'2023-09-16',2,1,1,'','Nikita','Rathod','555522223333','F','6666-06-06','SC',1,1,1,'Indian','wsdsfsg','Karnataka','8787878788','8778877878',0,'Hari','4','Teacher','Harit','2','House wife','Kannada','0','40000','dfjsdf gjggdjg','4545','878887','877888',1,2,'','','',0,'','','noimage.png','4','/media/sign_shiva_N2MZ2C6.jpg',1,'697119','kA32JA7132','200','yes',5000,'yes','R T Nagar','NVBHS2023007'),(8,8,'1111-11-11',2,1,1,'','Rohit','Pakka','789478947894','M','1111-11-11','SC',1,1,1,'Indian','dsfdhgjf fgjfgjf  tr','Karnataka','7894561230','6364603717',0,'Rahul','3','Teacher','Kaveri','1','House Wife','Kannada','0','500000','dfjsdf gjggdjg','202077','2323','877888',1,2,'','','',0,'','','noimage.png','7','/media/IMG-20190918-WA0026%20(2)_BtTOTT9.jpg',1,'566430','kA32JA7132','200','no',5000,'yes','R T Nagar','NVBHS2023008'),(9,9,'2023-09-16',2,1,1,'','Shashi','Mathpati','456145614561','M','2023-09-16','SC',1,1,1,'Indian','sdgs sdhgfg cn dnd','Karnataka','0636462203','06364605555',0,'Hari','4','Teacher','Kaveri','2','House wife','kannada','0','80000','msmsms  fgf ghgh','4545','78945612','78946',1,2,'','','',0,'','','noimage.png','1','/media/signshiva.jpg',1,'816990','kA32JA7132','200','yes',5000,'no','R T Nagar','NVBHS2023009'),(10,10,'2023-09-14',2,1,1,'','revan','Mathpati','789478947894','M','2023-09-14','SC',1,1,1,'Indian','Byalhalli(w) Bhlaki','Karnataka','+916364603745','7896543210',0,'chandrakanth','3','Teacher','Kaveri','2','Teacher','kannada','0','500000','dfjsdf gjggdjg hf cxsd','454578','232345','7578110',1,2,'','','',0,'','','noimage.png','6','/media/sign.png',1,'929970','kA32JA7132','2000','no',5000,'yes','R T Nagar','NVBHS2023010');
/*!40000 ALTER TABLE `nvsapp_studentregister` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nvsapp_studentselectedsubject`
--

DROP TABLE IF EXISTS `nvsapp_studentselectedsubject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nvsapp_studentselectedsubject` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `classid_id` bigint NOT NULL,
  `sectionid_id` bigint NOT NULL,
  `studentid_id` bigint NOT NULL,
  `subjectid_id` bigint NOT NULL,
  `subjecttype` int NOT NULL,
  `academicyearid_id` bigint NOT NULL,
  `instituteid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nvsapp_studentselectedsubject_academicyearid_id_ec3129d1` (`academicyearid_id`),
  KEY `nvsapp_studentselectedsubject_classid_id_799e55f2` (`classid_id`),
  KEY `nvsapp_studentselectedsubject_sectionid_id_3b58b197` (`sectionid_id`),
  KEY `nvsapp_studentselectedsubject_studentid_id_db0f2399` (`studentid_id`),
  KEY `nvsapp_studentselectedsubject_subjectid_id_9548ba9d` (`subjectid_id`),
  KEY `nvsapp_studentselectedsubject_instituteid_id_513dcf27` (`instituteid_id`),
  CONSTRAINT `nvsapp_studentselect_academicyearid_id_ec3129d1_fk_nvsapp_ac` FOREIGN KEY (`academicyearid_id`) REFERENCES `nvsapp_academicmaster` (`id`),
  CONSTRAINT `nvsapp_studentselect_classid_id_799e55f2_fk_nvsapp_ad` FOREIGN KEY (`classid_id`) REFERENCES `nvsapp_addclass` (`id`),
  CONSTRAINT `nvsapp_studentselect_instituteid_id_513dcf27_fk_nvsapp_in` FOREIGN KEY (`instituteid_id`) REFERENCES `nvsapp_institutionprofile` (`id`),
  CONSTRAINT `nvsapp_studentselect_sectionid_id_3b58b197_fk_nvsapp_ad` FOREIGN KEY (`sectionid_id`) REFERENCES `nvsapp_addsection` (`id`),
  CONSTRAINT `nvsapp_studentselect_studentid_id_db0f2399_fk_nvsapp_st` FOREIGN KEY (`studentid_id`) REFERENCES `nvsapp_studentregister` (`id`),
  CONSTRAINT `nvsapp_studentselect_subjectid_id_9548ba9d_fk_nvsapp_ms` FOREIGN KEY (`subjectid_id`) REFERENCES `nvsapp_mstsubject` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nvsapp_studentselectedsubject`
--

LOCK TABLES `nvsapp_studentselectedsubject` WRITE;
/*!40000 ALTER TABLE `nvsapp_studentselectedsubject` DISABLE KEYS */;
/*!40000 ALTER TABLE `nvsapp_studentselectedsubject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nvsapp_subjectstaffclassmapping`
--

DROP TABLE IF EXISTS `nvsapp_subjectstaffclassmapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nvsapp_subjectstaffclassmapping` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `staffid_id` bigint NOT NULL,
  `subject_id` bigint NOT NULL,
  `section_id` bigint NOT NULL,
  `instituteid_id` bigint NOT NULL,
  `createdby_id` bigint NOT NULL,
  `createdon` varchar(50) NOT NULL,
  `updatedby` varchar(100) NOT NULL,
  `upadatedon` varchar(50) NOT NULL,
  `deletedby` varchar(100) NOT NULL,
  `deletedon` varchar(50) NOT NULL,
  `softdelete` int NOT NULL,
  `academicyearid_id` bigint NOT NULL,
  `classteacher` varchar(200) NOT NULL,
  `Addclass_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nvsapp_subjectstaffclassmapping_academicyearid_id_d824cd02` (`academicyearid_id`),
  KEY `nvsapp_subjectstaffclassmapping_createdby_id_3c75a4c3` (`createdby_id`),
  KEY `nvsapp_subjectstaffclassmapping_section_id_21299f99` (`section_id`),
  KEY `nvsapp_subjectstaffclassmapping_staffid_id_b076307d` (`staffid_id`),
  KEY `nvsapp_subjectstaffclassmapping_subject_id_99efc340` (`subject_id`),
  KEY `nvsapp_subjectstaffclassmapping_instituteid_id_c5ead8d7` (`instituteid_id`),
  KEY `nvsapp_subjectstaffc_Addclass_id_a673156e_fk_nvsapp_ad` (`Addclass_id`),
  CONSTRAINT `nvsapp_subjectstaffc_academicyearid_id_d824cd02_fk_nvsapp_ac` FOREIGN KEY (`academicyearid_id`) REFERENCES `nvsapp_academicmaster` (`id`),
  CONSTRAINT `nvsapp_subjectstaffc_Addclass_id_a673156e_fk_nvsapp_ad` FOREIGN KEY (`Addclass_id`) REFERENCES `nvsapp_addclass` (`id`),
  CONSTRAINT `nvsapp_subjectstaffc_createdby_id_3c75a4c3_fk_nvsapp_us` FOREIGN KEY (`createdby_id`) REFERENCES `nvsapp_userregister` (`id`),
  CONSTRAINT `nvsapp_subjectstaffc_instituteid_id_c5ead8d7_fk_nvsapp_in` FOREIGN KEY (`instituteid_id`) REFERENCES `nvsapp_institutionprofile` (`id`),
  CONSTRAINT `nvsapp_subjectstaffc_section_id_21299f99_fk_nvsapp_ad` FOREIGN KEY (`section_id`) REFERENCES `nvsapp_addsection` (`id`),
  CONSTRAINT `nvsapp_subjectstaffc_staffid_id_b076307d_fk_nvsapp_us` FOREIGN KEY (`staffid_id`) REFERENCES `nvsapp_userregister` (`id`),
  CONSTRAINT `nvsapp_subjectstaffc_subject_id_99efc340_fk_nvsapp_ms` FOREIGN KEY (`subject_id`) REFERENCES `nvsapp_mstsubject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nvsapp_subjectstaffclassmapping`
--

LOCK TABLES `nvsapp_subjectstaffclassmapping` WRITE;
/*!40000 ALTER TABLE `nvsapp_subjectstaffclassmapping` DISABLE KEYS */;
INSERT INTO `nvsapp_subjectstaffclassmapping` VALUES (1,3,1,1,1,2,'','','','','',0,1,'Yes',1),(2,3,2,1,1,2,'','','','','',0,1,'No',1),(3,3,3,1,1,2,'','','','','',0,1,'No',1),(4,5,4,1,1,2,'','','','','',0,1,'No',1),(5,5,5,1,1,2,'','','','','',0,1,'No',1),(6,5,6,1,1,2,'','','','','',0,1,'No',1);
/*!40000 ALTER TABLE `nvsapp_subjectstaffclassmapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nvsapp_tempclassfeesdetails`
--

DROP TABLE IF EXISTS `nvsapp_tempclassfeesdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nvsapp_tempclassfeesdetails` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `instituteid` int NOT NULL,
  `institutename` varchar(1000) NOT NULL,
  `classname` varchar(1000) NOT NULL,
  `classid` varchar(1000) NOT NULL,
  `totalcollection` double NOT NULL,
  `totalcollected` double NOT NULL,
  `totaldiscount` double NOT NULL,
  `pendingamount` double NOT NULL,
  `fromdate` varchar(1000) NOT NULL,
  `todate` varchar(1000) NOT NULL,
  `detailstype` varchar(1000) NOT NULL,
  `userid` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nvsapp_tempclassfeesdetails`
--

LOCK TABLES `nvsapp_tempclassfeesdetails` WRITE;
/*!40000 ALTER TABLE `nvsapp_tempclassfeesdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `nvsapp_tempclassfeesdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nvsapp_tempinstitutefeesdetails`
--

DROP TABLE IF EXISTS `nvsapp_tempinstitutefeesdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nvsapp_tempinstitutefeesdetails` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `institutename` varchar(1000) NOT NULL,
  `instituteid` int NOT NULL,
  `totalcollection` double NOT NULL,
  `totalcollected` double NOT NULL,
  `totaldiscount` double NOT NULL,
  `pendingamount` double NOT NULL,
  `detailstype` varchar(1000) NOT NULL,
  `fromdate` varchar(1000) NOT NULL,
  `todate` varchar(1000) NOT NULL,
  `userid` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nvsapp_tempinstitutefeesdetails`
--

LOCK TABLES `nvsapp_tempinstitutefeesdetails` WRITE;
/*!40000 ALTER TABLE `nvsapp_tempinstitutefeesdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `nvsapp_tempinstitutefeesdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nvsapp_tempstudentsfeesdetails`
--

DROP TABLE IF EXISTS `nvsapp_tempstudentsfeesdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nvsapp_tempstudentsfeesdetails` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `instituteid` int NOT NULL,
  `institutename` varchar(1000) NOT NULL,
  `classname` varchar(1000) NOT NULL,
  `classid` varchar(1000) NOT NULL,
  `studentname` varchar(1000) NOT NULL,
  `studentid` varchar(1000) NOT NULL,
  `totalcollection` double NOT NULL,
  `totalcollected` double NOT NULL,
  `totaldiscount` double NOT NULL,
  `pendingamount` double NOT NULL,
  `fromdate` varchar(1000) NOT NULL,
  `todate` varchar(1000) NOT NULL,
  `detailstype` varchar(1000) NOT NULL,
  `userid` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nvsapp_tempstudentsfeesdetails`
--

LOCK TABLES `nvsapp_tempstudentsfeesdetails` WRITE;
/*!40000 ALTER TABLE `nvsapp_tempstudentsfeesdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `nvsapp_tempstudentsfeesdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nvsapp_timetableschedule`
--

DROP TABLE IF EXISTS `nvsapp_timetableschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nvsapp_timetableschedule` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `createdon` varchar(50) NOT NULL,
  `updatedby` varchar(100) NOT NULL,
  `upadatedon` varchar(50) NOT NULL,
  `deletedby` varchar(100) NOT NULL,
  `deletedon` varchar(50) NOT NULL,
  `softdelete` int NOT NULL,
  `academicyearid_id` bigint DEFAULT NULL,
  `createdby_id` bigint DEFAULT NULL,
  `fp1_id` bigint DEFAULT NULL,
  `fp2_id` bigint DEFAULT NULL,
  `fp3_id` bigint DEFAULT NULL,
  `fp4_id` bigint DEFAULT NULL,
  `fp5_id` bigint DEFAULT NULL,
  `fp6_id` bigint DEFAULT NULL,
  `fp7_id` bigint DEFAULT NULL,
  `instituteid_id` bigint DEFAULT NULL,
  `mp1_id` bigint DEFAULT NULL,
  `mp2_id` bigint DEFAULT NULL,
  `mp3_id` bigint DEFAULT NULL,
  `mp4_id` bigint DEFAULT NULL,
  `mp5_id` bigint DEFAULT NULL,
  `mp6_id` bigint DEFAULT NULL,
  `mp7_id` bigint DEFAULT NULL,
  `sap1_id` bigint DEFAULT NULL,
  `sap2_id` bigint DEFAULT NULL,
  `sap3_id` bigint DEFAULT NULL,
  `sap4_id` bigint DEFAULT NULL,
  `thp1_id` bigint DEFAULT NULL,
  `thp2_id` bigint DEFAULT NULL,
  `thp3_id` bigint DEFAULT NULL,
  `thp4_id` bigint DEFAULT NULL,
  `thp5_id` bigint DEFAULT NULL,
  `thp6_id` bigint DEFAULT NULL,
  `thp7_id` bigint DEFAULT NULL,
  `tup1_id` bigint DEFAULT NULL,
  `tup2_id` bigint DEFAULT NULL,
  `tup3_id` bigint DEFAULT NULL,
  `tup4_id` bigint DEFAULT NULL,
  `tup5_id` bigint DEFAULT NULL,
  `tup6_id` bigint DEFAULT NULL,
  `tup7_id` bigint DEFAULT NULL,
  `wp1_id` bigint DEFAULT NULL,
  `wp2_id` bigint DEFAULT NULL,
  `wp3_id` bigint DEFAULT NULL,
  `wp4_id` bigint DEFAULT NULL,
  `wp5_id` bigint DEFAULT NULL,
  `wp6_id` bigint DEFAULT NULL,
  `wp7_id` bigint DEFAULT NULL,
  `classid_id` bigint NOT NULL,
  `sectionid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nvsapp_timetablesche_academicyearid_id_9cd7acbf_fk_nvsapp_ac` (`academicyearid_id`),
  KEY `nvsapp_timetablesche_createdby_id_e2b36b07_fk_nvsapp_us` (`createdby_id`),
  KEY `nvsapp_timetablesche_fp1_id_62ab5a33_fk_nvsapp_su` (`fp1_id`),
  KEY `nvsapp_timetablesche_fp2_id_290a2478_fk_nvsapp_su` (`fp2_id`),
  KEY `nvsapp_timetablesche_fp3_id_402c41aa_fk_nvsapp_su` (`fp3_id`),
  KEY `nvsapp_timetablesche_fp4_id_e1bd9c61_fk_nvsapp_su` (`fp4_id`),
  KEY `nvsapp_timetablesche_fp5_id_b9036264_fk_nvsapp_su` (`fp5_id`),
  KEY `nvsapp_timetablesche_fp6_id_b7abb1b2_fk_nvsapp_su` (`fp6_id`),
  KEY `nvsapp_timetablesche_fp7_id_aaf35b9e_fk_nvsapp_su` (`fp7_id`),
  KEY `nvsapp_timetablesche_instituteid_id_443e0233_fk_nvsapp_in` (`instituteid_id`),
  KEY `nvsapp_timetablesche_mp1_id_b0ac68d6_fk_nvsapp_su` (`mp1_id`),
  KEY `nvsapp_timetablesche_mp2_id_08f02e24_fk_nvsapp_su` (`mp2_id`),
  KEY `nvsapp_timetablesche_mp3_id_507d6e4d_fk_nvsapp_su` (`mp3_id`),
  KEY `nvsapp_timetablesche_mp4_id_cb9b7a67_fk_nvsapp_su` (`mp4_id`),
  KEY `nvsapp_timetablesche_mp5_id_c0def2f5_fk_nvsapp_su` (`mp5_id`),
  KEY `nvsapp_timetablesche_mp6_id_9807f26b_fk_nvsapp_su` (`mp6_id`),
  KEY `nvsapp_timetablesche_mp7_id_1b476aff_fk_nvsapp_su` (`mp7_id`),
  KEY `nvsapp_timetablesche_sap1_id_8fdea985_fk_nvsapp_su` (`sap1_id`),
  KEY `nvsapp_timetablesche_sap2_id_bc44d2e1_fk_nvsapp_su` (`sap2_id`),
  KEY `nvsapp_timetablesche_sap3_id_cdf6b38d_fk_nvsapp_su` (`sap3_id`),
  KEY `nvsapp_timetablesche_sap4_id_0d825697_fk_nvsapp_su` (`sap4_id`),
  KEY `nvsapp_timetablesche_thp1_id_c4fd4808_fk_nvsapp_su` (`thp1_id`),
  KEY `nvsapp_timetablesche_thp2_id_c179e207_fk_nvsapp_su` (`thp2_id`),
  KEY `nvsapp_timetablesche_thp3_id_39da04a3_fk_nvsapp_su` (`thp3_id`),
  KEY `nvsapp_timetablesche_thp4_id_133a9cd9_fk_nvsapp_su` (`thp4_id`),
  KEY `nvsapp_timetablesche_thp5_id_02c5f62b_fk_nvsapp_su` (`thp5_id`),
  KEY `nvsapp_timetablesche_thp6_id_c97e07b1_fk_nvsapp_su` (`thp6_id`),
  KEY `nvsapp_timetablesche_thp7_id_119ff344_fk_nvsapp_su` (`thp7_id`),
  KEY `nvsapp_timetablesche_tup1_id_06afcf9c_fk_nvsapp_su` (`tup1_id`),
  KEY `nvsapp_timetablesche_tup2_id_ac3508ac_fk_nvsapp_su` (`tup2_id`),
  KEY `nvsapp_timetablesche_tup3_id_5ef341f2_fk_nvsapp_su` (`tup3_id`),
  KEY `nvsapp_timetablesche_tup4_id_909ff2e5_fk_nvsapp_su` (`tup4_id`),
  KEY `nvsapp_timetablesche_tup5_id_06c07a67_fk_nvsapp_su` (`tup5_id`),
  KEY `nvsapp_timetablesche_tup6_id_bac32d0e_fk_nvsapp_su` (`tup6_id`),
  KEY `nvsapp_timetablesche_tup7_id_0a4a5121_fk_nvsapp_su` (`tup7_id`),
  KEY `nvsapp_timetablesche_wp1_id_c0fbc4dd_fk_nvsapp_su` (`wp1_id`),
  KEY `nvsapp_timetablesche_wp2_id_9174dcf2_fk_nvsapp_su` (`wp2_id`),
  KEY `nvsapp_timetablesche_wp3_id_0a811fcf_fk_nvsapp_su` (`wp3_id`),
  KEY `nvsapp_timetablesche_wp4_id_4e5965aa_fk_nvsapp_su` (`wp4_id`),
  KEY `nvsapp_timetablesche_wp5_id_047110bb_fk_nvsapp_su` (`wp5_id`),
  KEY `nvsapp_timetablesche_wp6_id_476dad85_fk_nvsapp_su` (`wp6_id`),
  KEY `nvsapp_timetablesche_wp7_id_8340f6bc_fk_nvsapp_su` (`wp7_id`),
  KEY `nvsapp_timetablesche_classid_id_2f805765_fk_nvsapp_ad` (`classid_id`),
  KEY `nvsapp_timetablesche_sectionid_id_293769d0_fk_nvsapp_ad` (`sectionid_id`),
  CONSTRAINT `nvsapp_timetablesche_academicyearid_id_9cd7acbf_fk_nvsapp_ac` FOREIGN KEY (`academicyearid_id`) REFERENCES `nvsapp_academicmaster` (`id`),
  CONSTRAINT `nvsapp_timetablesche_classid_id_2f805765_fk_nvsapp_ad` FOREIGN KEY (`classid_id`) REFERENCES `nvsapp_addclass` (`id`),
  CONSTRAINT `nvsapp_timetablesche_createdby_id_e2b36b07_fk_nvsapp_us` FOREIGN KEY (`createdby_id`) REFERENCES `nvsapp_userregister` (`id`),
  CONSTRAINT `nvsapp_timetablesche_fp1_id_62ab5a33_fk_nvsapp_su` FOREIGN KEY (`fp1_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_fp2_id_290a2478_fk_nvsapp_su` FOREIGN KEY (`fp2_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_fp3_id_402c41aa_fk_nvsapp_su` FOREIGN KEY (`fp3_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_fp4_id_e1bd9c61_fk_nvsapp_su` FOREIGN KEY (`fp4_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_fp5_id_b9036264_fk_nvsapp_su` FOREIGN KEY (`fp5_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_fp6_id_b7abb1b2_fk_nvsapp_su` FOREIGN KEY (`fp6_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_fp7_id_aaf35b9e_fk_nvsapp_su` FOREIGN KEY (`fp7_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_instituteid_id_443e0233_fk_nvsapp_in` FOREIGN KEY (`instituteid_id`) REFERENCES `nvsapp_institutionprofile` (`id`),
  CONSTRAINT `nvsapp_timetablesche_mp1_id_b0ac68d6_fk_nvsapp_su` FOREIGN KEY (`mp1_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_mp2_id_08f02e24_fk_nvsapp_su` FOREIGN KEY (`mp2_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_mp3_id_507d6e4d_fk_nvsapp_su` FOREIGN KEY (`mp3_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_mp4_id_cb9b7a67_fk_nvsapp_su` FOREIGN KEY (`mp4_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_mp5_id_c0def2f5_fk_nvsapp_su` FOREIGN KEY (`mp5_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_mp6_id_9807f26b_fk_nvsapp_su` FOREIGN KEY (`mp6_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_mp7_id_1b476aff_fk_nvsapp_su` FOREIGN KEY (`mp7_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_sap1_id_8fdea985_fk_nvsapp_su` FOREIGN KEY (`sap1_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_sap2_id_bc44d2e1_fk_nvsapp_su` FOREIGN KEY (`sap2_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_sap3_id_cdf6b38d_fk_nvsapp_su` FOREIGN KEY (`sap3_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_sap4_id_0d825697_fk_nvsapp_su` FOREIGN KEY (`sap4_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_sectionid_id_293769d0_fk_nvsapp_ad` FOREIGN KEY (`sectionid_id`) REFERENCES `nvsapp_addsection` (`id`),
  CONSTRAINT `nvsapp_timetablesche_thp1_id_c4fd4808_fk_nvsapp_su` FOREIGN KEY (`thp1_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_thp2_id_c179e207_fk_nvsapp_su` FOREIGN KEY (`thp2_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_thp3_id_39da04a3_fk_nvsapp_su` FOREIGN KEY (`thp3_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_thp4_id_133a9cd9_fk_nvsapp_su` FOREIGN KEY (`thp4_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_thp5_id_02c5f62b_fk_nvsapp_su` FOREIGN KEY (`thp5_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_thp6_id_c97e07b1_fk_nvsapp_su` FOREIGN KEY (`thp6_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_thp7_id_119ff344_fk_nvsapp_su` FOREIGN KEY (`thp7_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_tup1_id_06afcf9c_fk_nvsapp_su` FOREIGN KEY (`tup1_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_tup2_id_ac3508ac_fk_nvsapp_su` FOREIGN KEY (`tup2_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_tup3_id_5ef341f2_fk_nvsapp_su` FOREIGN KEY (`tup3_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_tup4_id_909ff2e5_fk_nvsapp_su` FOREIGN KEY (`tup4_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_tup5_id_06c07a67_fk_nvsapp_su` FOREIGN KEY (`tup5_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_tup6_id_bac32d0e_fk_nvsapp_su` FOREIGN KEY (`tup6_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_tup7_id_0a4a5121_fk_nvsapp_su` FOREIGN KEY (`tup7_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_wp1_id_c0fbc4dd_fk_nvsapp_su` FOREIGN KEY (`wp1_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_wp2_id_9174dcf2_fk_nvsapp_su` FOREIGN KEY (`wp2_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_wp3_id_0a811fcf_fk_nvsapp_su` FOREIGN KEY (`wp3_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_wp4_id_4e5965aa_fk_nvsapp_su` FOREIGN KEY (`wp4_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_wp5_id_047110bb_fk_nvsapp_su` FOREIGN KEY (`wp5_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_wp6_id_476dad85_fk_nvsapp_su` FOREIGN KEY (`wp6_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_wp7_id_8340f6bc_fk_nvsapp_su` FOREIGN KEY (`wp7_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nvsapp_timetableschedule`
--

LOCK TABLES `nvsapp_timetableschedule` WRITE;
/*!40000 ALTER TABLE `nvsapp_timetableschedule` DISABLE KEYS */;
INSERT INTO `nvsapp_timetableschedule` VALUES (1,'','','','','',0,1,2,1,2,3,4,5,6,5,1,1,2,3,4,5,6,1,1,2,3,4,1,2,3,4,5,6,4,1,2,3,4,5,6,2,1,2,3,4,5,6,3,1,1);
/*!40000 ALTER TABLE `nvsapp_timetableschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nvsapp_userregister`
--

DROP TABLE IF EXISTS `nvsapp_userregister`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nvsapp_userregister` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `mobilenumber` varchar(15) NOT NULL,
  `emailid` varchar(100) NOT NULL,
  `designation_id` bigint NOT NULL,
  `password` varchar(50) NOT NULL,
  `softdelete` int NOT NULL,
  `createdon` varchar(50) NOT NULL,
  `createdby` varchar(50) NOT NULL,
  `upadated` varchar(50) NOT NULL,
  `updatedby` varchar(100) NOT NULL,
  `deletedon` varchar(50) NOT NULL,
  `deletedby` varchar(100) NOT NULL,
  `instituteid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nvsapp_userregister_instituteid_id_4a6cf740` (`instituteid_id`),
  KEY `nvsapp_userregister_designation_id_c6f454f2` (`designation_id`),
  CONSTRAINT `nvsapp_userregister_designation_id_c6f454f2_fk_nvsapp_ms` FOREIGN KEY (`designation_id`) REFERENCES `nvsapp_mstdesignation` (`id`),
  CONSTRAINT `nvsapp_userregister_instituteid_id_4a6cf740_fk_nvsapp_in` FOREIGN KEY (`instituteid_id`) REFERENCES `nvsapp_institutionprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nvsapp_userregister`
--

LOCK TABLES `nvsapp_userregister` WRITE;
/*!40000 ALTER TABLE `nvsapp_userregister` DISABLE KEYS */;
INSERT INTO `nvsapp_userregister` VALUES (1,'Administrator','9876543210','admin@epatshala.in',100,'9876543210',0,'16-06-2023','SUPERADMIN','00-00-0000','','00-00-0000','',1),(2,'Shivukumar','6364603717','sachin@gmail.com',9,'6364603717',0,'00-00-0000','1','00-00-0000','','00-00-0000','',1),(3,'Rahul Rathod','7022388219','rahulrathod@gmail.com',10,'7022388219',0,'00-00-0000','1','00-00-0000','','00-00-0000','',1),(4,'Anup G','8722202312','anupg@gmail.com',11,'8722202312',0,'00-00-0000','1','00-00-0000','','00-00-0000','',1),(5,'Vivek','9845356246','vivek@gmail.com',10,'9845356246',0,'00-00-0000','','00-00-0000','','00-00-0000','',1),(6,'Sandhya','9632029756','sandhyadigamber@gmail.com',7,'9632029756',0,'00-00-0000','1','00-00-0000','','00-00-0000','',1),(7,'Sachin','9886140412','sachinmbhg@gmail.com',10,'9886140412',0,'00-00-0000','','00-00-0000','','00-00-0000','',1),(8,'Ashiq','9901694944','ashiq@gmail.com',10,'9901694944',0,'00-00-0000','1','00-00-0000','','00-00-0000','',1),(9,'Cashier','9845356247','cashier@gmail.com',8,'9845356247',0,'00-00-0000','1','00-00-0000','','00-00-0000','',1),(10,'Shivkumar','9845356248','shivu@gmail.com',11,'9845356248',0,'00-00-0000','1','00-00-0000','','00-00-0000','',1);
/*!40000 ALTER TABLE `nvsapp_userregister` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-16 13:30:24
