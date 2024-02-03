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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-16 13:29:41
