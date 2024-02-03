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
-- Table structure for table `nvsapp_userregister`
--

DROP TABLE IF EXISTS `nvsapp_userregister`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nvsapp_userregister` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `mobilenumber` varchar(15) NOT NULL,
  `emailid` varchar(100) NOT NULL,
  `designation_id` bigint NOT NULL,
  `password` varchar(50) NOT NULL,
  `softdelete` int NOT NULL,
  `createdon` varchar(50) NOT NULL,
  `createdby` varchar(50) NOT NULL,
  `upadated` varchar(50) NOT NULL,
  `updatedby` varchar(100) NOT NULL,
  `deletedon` varchar(50) NOT NULL,
  `deletedby` varchar(100) NOT NULL,
  `instituteid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nvsapp_userregister_instituteid_id_4a6cf740` (`instituteid_id`),
  KEY `nvsapp_userregister_designation_id_c6f454f2` (`designation_id`),
  CONSTRAINT `nvsapp_userregister_designation_id_c6f454f2_fk_nvsapp_ms` FOREIGN KEY (`designation_id`) REFERENCES `nvsapp_mstdesignation` (`id`),
  CONSTRAINT `nvsapp_userregister_instituteid_id_4a6cf740_fk_nvsapp_in` FOREIGN KEY (`instituteid_id`) REFERENCES `nvsapp_institutionprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nvsapp_userregister`
--

LOCK TABLES `nvsapp_userregister` WRITE;
/*!40000 ALTER TABLE `nvsapp_userregister` DISABLE KEYS */;
INSERT INTO `nvsapp_userregister` VALUES (1,'Administrator','9876543210','admin@epatshala.in',100,'9876543210',0,'16-06-2023','SUPERADMIN','00-00-0000','','00-00-0000','',1),(2,'Shivukumar','6364603717','sachin@gmail.com',9,'6364603717',0,'00-00-0000','1','00-00-0000','','00-00-0000','',1),(3,'Rahul Rathod','7022388219','rahulrathod@gmail.com',10,'7022388219',0,'00-00-0000','1','00-00-0000','','00-00-0000','',1),(4,'Anup G','8722202312','anupg@gmail.com',11,'8722202312',0,'00-00-0000','1','00-00-0000','','00-00-0000','',1),(5,'Vivek','9845356246','vivek@gmail.com',10,'9845356246',0,'00-00-0000','','00-00-0000','','00-00-0000','',1),(6,'Sandhya','9632029756','sandhyadigamber@gmail.com',7,'9632029756',0,'00-00-0000','1','00-00-0000','','00-00-0000','',1),(7,'Sachin','9886140412','sachinmbhg@gmail.com',10,'9886140412',0,'00-00-0000','','00-00-0000','','00-00-0000','',1),(8,'Ashiq','9901694944','ashiq@gmail.com',10,'9901694944',0,'00-00-0000','1','00-00-0000','','00-00-0000','',1),(9,'Cashier','9845356247','cashier@gmail.com',8,'9845356247',0,'00-00-0000','1','00-00-0000','','00-00-0000','',1),(10,'Shivkumar','9845356248','shivu@gmail.com',11,'9845356248',0,'00-00-0000','1','00-00-0000','','00-00-0000','',1);
/*!40000 ALTER TABLE `nvsapp_userregister` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-16 13:29:37
