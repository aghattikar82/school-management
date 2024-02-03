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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-16 13:29:36
