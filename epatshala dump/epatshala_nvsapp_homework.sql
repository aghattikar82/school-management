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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-16 13:29:45
