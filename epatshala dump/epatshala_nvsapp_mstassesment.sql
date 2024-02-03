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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-16 13:29:44
