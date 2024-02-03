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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-16 13:29:42
