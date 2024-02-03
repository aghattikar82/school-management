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
-- Table structure for table `nvsapp_languagemapping`
--

DROP TABLE IF EXISTS `nvsapp_languagemapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nvsapp_languagemapping` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fl_id` bigint NOT NULL,
  `sl_id` bigint NOT NULL,
  `tl_id` bigint NOT NULL,
  `instituteid_id` bigint NOT NULL,
  `createdby_id` bigint NOT NULL,
  `createdon` varchar(50) NOT NULL,
  `updatedby` varchar(100) NOT NULL,
  `upadatedon` varchar(50) NOT NULL,
  `deletedby` varchar(100) NOT NULL,
  `deletedon` varchar(50) NOT NULL,
  `softdelete` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nvsapp_languagemapping_createdby_id_fa2f6ba2` (`createdby_id`),
  KEY `nvsapp_languagemapping_fl_id_12ecff24` (`fl_id`),
  KEY `nvsapp_languagemapping_sl_id_a7e94527` (`sl_id`),
  KEY `nvsapp_languagemapping_tl_id_72ca0215` (`tl_id`),
  KEY `nvsapp_languagemapping_instituteid_id_bd11d39f` (`instituteid_id`),
  CONSTRAINT `nvsapp_languagemappi_createdby_id_fa2f6ba2_fk_nvsapp_us` FOREIGN KEY (`createdby_id`) REFERENCES `nvsapp_userregister` (`id`),
  CONSTRAINT `nvsapp_languagemappi_instituteid_id_bd11d39f_fk_nvsapp_in` FOREIGN KEY (`instituteid_id`) REFERENCES `nvsapp_institutionprofile` (`id`),
  CONSTRAINT `nvsapp_languagemapping_fl_id_12ecff24_fk_nvsapp_mstsubject_id` FOREIGN KEY (`fl_id`) REFERENCES `nvsapp_mstsubject` (`id`),
  CONSTRAINT `nvsapp_languagemapping_sl_id_a7e94527_fk_nvsapp_mstsubject_id` FOREIGN KEY (`sl_id`) REFERENCES `nvsapp_mstsubject` (`id`),
  CONSTRAINT `nvsapp_languagemapping_tl_id_72ca0215_fk_nvsapp_mstsubject_id` FOREIGN KEY (`tl_id`) REFERENCES `nvsapp_mstsubject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nvsapp_languagemapping`
--

LOCK TABLES `nvsapp_languagemapping` WRITE;
/*!40000 ALTER TABLE `nvsapp_languagemapping` DISABLE KEYS */;
INSERT INTO `nvsapp_languagemapping` VALUES (1,1,2,3,1,2,'','','','','',0);
/*!40000 ALTER TABLE `nvsapp_languagemapping` ENABLE KEYS */;
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
