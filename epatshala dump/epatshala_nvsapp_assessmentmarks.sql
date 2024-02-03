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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-16 13:29:45
