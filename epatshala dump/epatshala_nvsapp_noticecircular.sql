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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-16 13:29:43
