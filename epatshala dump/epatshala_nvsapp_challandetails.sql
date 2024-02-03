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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-16 13:29:39
