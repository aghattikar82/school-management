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
-- Table structure for table `nvsapp_libraryaddbook`
--

DROP TABLE IF EXISTS `nvsapp_libraryaddbook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nvsapp_libraryaddbook` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `booktype` varchar(100) NOT NULL,
  `bookname` varchar(200) NOT NULL,
  `booktitle` varchar(200) NOT NULL,
  `ISBNnumber` varchar(100) NOT NULL,
  `publisher` varchar(100) NOT NULL,
  `author` varchar(200) NOT NULL,
  `publishedyear` varchar(200) NOT NULL,
  `edition` varchar(200) NOT NULL,
  `publicationcost` int NOT NULL,
  `numberofbooks` varchar(200) NOT NULL,
  `row` varchar(100) NOT NULL,
  `shelf` varchar(100) NOT NULL,
  `rack` varchar(100) NOT NULL,
  `bookaddedby` varchar(200) NOT NULL,
  `bookaddedon` varchar(100) NOT NULL,
  `updatedon` varchar(100) NOT NULL,
  `updatedby` varchar(100) NOT NULL,
  `softdelete` int NOT NULL,
  `instituteid_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nvsapp_lbryaddbooks_instituteid_id_7ff85f55_fk_nvsapp_in` (`instituteid_id`),
  CONSTRAINT `nvsapp_lbryaddbooks_instituteid_id_7ff85f55_fk_nvsapp_in` FOREIGN KEY (`instituteid_id`) REFERENCES `nvsapp_institutionprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nvsapp_libraryaddbook`
--

LOCK TABLES `nvsapp_libraryaddbook` WRITE;
/*!40000 ALTER TABLE `nvsapp_libraryaddbook` DISABLE KEYS */;
/*!40000 ALTER TABLE `nvsapp_libraryaddbook` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-16 13:29:38
