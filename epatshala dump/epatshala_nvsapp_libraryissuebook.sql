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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-16 13:29:44
