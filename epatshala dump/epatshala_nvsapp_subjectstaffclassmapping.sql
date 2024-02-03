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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-16 13:29:41
