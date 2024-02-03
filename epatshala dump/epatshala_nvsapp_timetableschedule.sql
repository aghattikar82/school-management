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
-- Table structure for table `nvsapp_timetableschedule`
--

DROP TABLE IF EXISTS `nvsapp_timetableschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nvsapp_timetableschedule` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `createdon` varchar(50) NOT NULL,
  `updatedby` varchar(100) NOT NULL,
  `upadatedon` varchar(50) NOT NULL,
  `deletedby` varchar(100) NOT NULL,
  `deletedon` varchar(50) NOT NULL,
  `softdelete` int NOT NULL,
  `academicyearid_id` bigint DEFAULT NULL,
  `createdby_id` bigint DEFAULT NULL,
  `fp1_id` bigint DEFAULT NULL,
  `fp2_id` bigint DEFAULT NULL,
  `fp3_id` bigint DEFAULT NULL,
  `fp4_id` bigint DEFAULT NULL,
  `fp5_id` bigint DEFAULT NULL,
  `fp6_id` bigint DEFAULT NULL,
  `fp7_id` bigint DEFAULT NULL,
  `instituteid_id` bigint DEFAULT NULL,
  `mp1_id` bigint DEFAULT NULL,
  `mp2_id` bigint DEFAULT NULL,
  `mp3_id` bigint DEFAULT NULL,
  `mp4_id` bigint DEFAULT NULL,
  `mp5_id` bigint DEFAULT NULL,
  `mp6_id` bigint DEFAULT NULL,
  `mp7_id` bigint DEFAULT NULL,
  `sap1_id` bigint DEFAULT NULL,
  `sap2_id` bigint DEFAULT NULL,
  `sap3_id` bigint DEFAULT NULL,
  `sap4_id` bigint DEFAULT NULL,
  `thp1_id` bigint DEFAULT NULL,
  `thp2_id` bigint DEFAULT NULL,
  `thp3_id` bigint DEFAULT NULL,
  `thp4_id` bigint DEFAULT NULL,
  `thp5_id` bigint DEFAULT NULL,
  `thp6_id` bigint DEFAULT NULL,
  `thp7_id` bigint DEFAULT NULL,
  `tup1_id` bigint DEFAULT NULL,
  `tup2_id` bigint DEFAULT NULL,
  `tup3_id` bigint DEFAULT NULL,
  `tup4_id` bigint DEFAULT NULL,
  `tup5_id` bigint DEFAULT NULL,
  `tup6_id` bigint DEFAULT NULL,
  `tup7_id` bigint DEFAULT NULL,
  `wp1_id` bigint DEFAULT NULL,
  `wp2_id` bigint DEFAULT NULL,
  `wp3_id` bigint DEFAULT NULL,
  `wp4_id` bigint DEFAULT NULL,
  `wp5_id` bigint DEFAULT NULL,
  `wp6_id` bigint DEFAULT NULL,
  `wp7_id` bigint DEFAULT NULL,
  `classid_id` bigint NOT NULL,
  `sectionid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nvsapp_timetablesche_academicyearid_id_9cd7acbf_fk_nvsapp_ac` (`academicyearid_id`),
  KEY `nvsapp_timetablesche_createdby_id_e2b36b07_fk_nvsapp_us` (`createdby_id`),
  KEY `nvsapp_timetablesche_fp1_id_62ab5a33_fk_nvsapp_su` (`fp1_id`),
  KEY `nvsapp_timetablesche_fp2_id_290a2478_fk_nvsapp_su` (`fp2_id`),
  KEY `nvsapp_timetablesche_fp3_id_402c41aa_fk_nvsapp_su` (`fp3_id`),
  KEY `nvsapp_timetablesche_fp4_id_e1bd9c61_fk_nvsapp_su` (`fp4_id`),
  KEY `nvsapp_timetablesche_fp5_id_b9036264_fk_nvsapp_su` (`fp5_id`),
  KEY `nvsapp_timetablesche_fp6_id_b7abb1b2_fk_nvsapp_su` (`fp6_id`),
  KEY `nvsapp_timetablesche_fp7_id_aaf35b9e_fk_nvsapp_su` (`fp7_id`),
  KEY `nvsapp_timetablesche_instituteid_id_443e0233_fk_nvsapp_in` (`instituteid_id`),
  KEY `nvsapp_timetablesche_mp1_id_b0ac68d6_fk_nvsapp_su` (`mp1_id`),
  KEY `nvsapp_timetablesche_mp2_id_08f02e24_fk_nvsapp_su` (`mp2_id`),
  KEY `nvsapp_timetablesche_mp3_id_507d6e4d_fk_nvsapp_su` (`mp3_id`),
  KEY `nvsapp_timetablesche_mp4_id_cb9b7a67_fk_nvsapp_su` (`mp4_id`),
  KEY `nvsapp_timetablesche_mp5_id_c0def2f5_fk_nvsapp_su` (`mp5_id`),
  KEY `nvsapp_timetablesche_mp6_id_9807f26b_fk_nvsapp_su` (`mp6_id`),
  KEY `nvsapp_timetablesche_mp7_id_1b476aff_fk_nvsapp_su` (`mp7_id`),
  KEY `nvsapp_timetablesche_sap1_id_8fdea985_fk_nvsapp_su` (`sap1_id`),
  KEY `nvsapp_timetablesche_sap2_id_bc44d2e1_fk_nvsapp_su` (`sap2_id`),
  KEY `nvsapp_timetablesche_sap3_id_cdf6b38d_fk_nvsapp_su` (`sap3_id`),
  KEY `nvsapp_timetablesche_sap4_id_0d825697_fk_nvsapp_su` (`sap4_id`),
  KEY `nvsapp_timetablesche_thp1_id_c4fd4808_fk_nvsapp_su` (`thp1_id`),
  KEY `nvsapp_timetablesche_thp2_id_c179e207_fk_nvsapp_su` (`thp2_id`),
  KEY `nvsapp_timetablesche_thp3_id_39da04a3_fk_nvsapp_su` (`thp3_id`),
  KEY `nvsapp_timetablesche_thp4_id_133a9cd9_fk_nvsapp_su` (`thp4_id`),
  KEY `nvsapp_timetablesche_thp5_id_02c5f62b_fk_nvsapp_su` (`thp5_id`),
  KEY `nvsapp_timetablesche_thp6_id_c97e07b1_fk_nvsapp_su` (`thp6_id`),
  KEY `nvsapp_timetablesche_thp7_id_119ff344_fk_nvsapp_su` (`thp7_id`),
  KEY `nvsapp_timetablesche_tup1_id_06afcf9c_fk_nvsapp_su` (`tup1_id`),
  KEY `nvsapp_timetablesche_tup2_id_ac3508ac_fk_nvsapp_su` (`tup2_id`),
  KEY `nvsapp_timetablesche_tup3_id_5ef341f2_fk_nvsapp_su` (`tup3_id`),
  KEY `nvsapp_timetablesche_tup4_id_909ff2e5_fk_nvsapp_su` (`tup4_id`),
  KEY `nvsapp_timetablesche_tup5_id_06c07a67_fk_nvsapp_su` (`tup5_id`),
  KEY `nvsapp_timetablesche_tup6_id_bac32d0e_fk_nvsapp_su` (`tup6_id`),
  KEY `nvsapp_timetablesche_tup7_id_0a4a5121_fk_nvsapp_su` (`tup7_id`),
  KEY `nvsapp_timetablesche_wp1_id_c0fbc4dd_fk_nvsapp_su` (`wp1_id`),
  KEY `nvsapp_timetablesche_wp2_id_9174dcf2_fk_nvsapp_su` (`wp2_id`),
  KEY `nvsapp_timetablesche_wp3_id_0a811fcf_fk_nvsapp_su` (`wp3_id`),
  KEY `nvsapp_timetablesche_wp4_id_4e5965aa_fk_nvsapp_su` (`wp4_id`),
  KEY `nvsapp_timetablesche_wp5_id_047110bb_fk_nvsapp_su` (`wp5_id`),
  KEY `nvsapp_timetablesche_wp6_id_476dad85_fk_nvsapp_su` (`wp6_id`),
  KEY `nvsapp_timetablesche_wp7_id_8340f6bc_fk_nvsapp_su` (`wp7_id`),
  KEY `nvsapp_timetablesche_classid_id_2f805765_fk_nvsapp_ad` (`classid_id`),
  KEY `nvsapp_timetablesche_sectionid_id_293769d0_fk_nvsapp_ad` (`sectionid_id`),
  CONSTRAINT `nvsapp_timetablesche_academicyearid_id_9cd7acbf_fk_nvsapp_ac` FOREIGN KEY (`academicyearid_id`) REFERENCES `nvsapp_academicmaster` (`id`),
  CONSTRAINT `nvsapp_timetablesche_classid_id_2f805765_fk_nvsapp_ad` FOREIGN KEY (`classid_id`) REFERENCES `nvsapp_addclass` (`id`),
  CONSTRAINT `nvsapp_timetablesche_createdby_id_e2b36b07_fk_nvsapp_us` FOREIGN KEY (`createdby_id`) REFERENCES `nvsapp_userregister` (`id`),
  CONSTRAINT `nvsapp_timetablesche_fp1_id_62ab5a33_fk_nvsapp_su` FOREIGN KEY (`fp1_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_fp2_id_290a2478_fk_nvsapp_su` FOREIGN KEY (`fp2_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_fp3_id_402c41aa_fk_nvsapp_su` FOREIGN KEY (`fp3_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_fp4_id_e1bd9c61_fk_nvsapp_su` FOREIGN KEY (`fp4_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_fp5_id_b9036264_fk_nvsapp_su` FOREIGN KEY (`fp5_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_fp6_id_b7abb1b2_fk_nvsapp_su` FOREIGN KEY (`fp6_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_fp7_id_aaf35b9e_fk_nvsapp_su` FOREIGN KEY (`fp7_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_instituteid_id_443e0233_fk_nvsapp_in` FOREIGN KEY (`instituteid_id`) REFERENCES `nvsapp_institutionprofile` (`id`),
  CONSTRAINT `nvsapp_timetablesche_mp1_id_b0ac68d6_fk_nvsapp_su` FOREIGN KEY (`mp1_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_mp2_id_08f02e24_fk_nvsapp_su` FOREIGN KEY (`mp2_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_mp3_id_507d6e4d_fk_nvsapp_su` FOREIGN KEY (`mp3_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_mp4_id_cb9b7a67_fk_nvsapp_su` FOREIGN KEY (`mp4_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_mp5_id_c0def2f5_fk_nvsapp_su` FOREIGN KEY (`mp5_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_mp6_id_9807f26b_fk_nvsapp_su` FOREIGN KEY (`mp6_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_mp7_id_1b476aff_fk_nvsapp_su` FOREIGN KEY (`mp7_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_sap1_id_8fdea985_fk_nvsapp_su` FOREIGN KEY (`sap1_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_sap2_id_bc44d2e1_fk_nvsapp_su` FOREIGN KEY (`sap2_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_sap3_id_cdf6b38d_fk_nvsapp_su` FOREIGN KEY (`sap3_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_sap4_id_0d825697_fk_nvsapp_su` FOREIGN KEY (`sap4_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_sectionid_id_293769d0_fk_nvsapp_ad` FOREIGN KEY (`sectionid_id`) REFERENCES `nvsapp_addsection` (`id`),
  CONSTRAINT `nvsapp_timetablesche_thp1_id_c4fd4808_fk_nvsapp_su` FOREIGN KEY (`thp1_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_thp2_id_c179e207_fk_nvsapp_su` FOREIGN KEY (`thp2_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_thp3_id_39da04a3_fk_nvsapp_su` FOREIGN KEY (`thp3_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_thp4_id_133a9cd9_fk_nvsapp_su` FOREIGN KEY (`thp4_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_thp5_id_02c5f62b_fk_nvsapp_su` FOREIGN KEY (`thp5_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_thp6_id_c97e07b1_fk_nvsapp_su` FOREIGN KEY (`thp6_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_thp7_id_119ff344_fk_nvsapp_su` FOREIGN KEY (`thp7_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_tup1_id_06afcf9c_fk_nvsapp_su` FOREIGN KEY (`tup1_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_tup2_id_ac3508ac_fk_nvsapp_su` FOREIGN KEY (`tup2_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_tup3_id_5ef341f2_fk_nvsapp_su` FOREIGN KEY (`tup3_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_tup4_id_909ff2e5_fk_nvsapp_su` FOREIGN KEY (`tup4_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_tup5_id_06c07a67_fk_nvsapp_su` FOREIGN KEY (`tup5_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_tup6_id_bac32d0e_fk_nvsapp_su` FOREIGN KEY (`tup6_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_tup7_id_0a4a5121_fk_nvsapp_su` FOREIGN KEY (`tup7_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_wp1_id_c0fbc4dd_fk_nvsapp_su` FOREIGN KEY (`wp1_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_wp2_id_9174dcf2_fk_nvsapp_su` FOREIGN KEY (`wp2_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_wp3_id_0a811fcf_fk_nvsapp_su` FOREIGN KEY (`wp3_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_wp4_id_4e5965aa_fk_nvsapp_su` FOREIGN KEY (`wp4_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_wp5_id_047110bb_fk_nvsapp_su` FOREIGN KEY (`wp5_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_wp6_id_476dad85_fk_nvsapp_su` FOREIGN KEY (`wp6_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`),
  CONSTRAINT `nvsapp_timetablesche_wp7_id_8340f6bc_fk_nvsapp_su` FOREIGN KEY (`wp7_id`) REFERENCES `nvsapp_subjectstaffclassmapping` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nvsapp_timetableschedule`
--

LOCK TABLES `nvsapp_timetableschedule` WRITE;
/*!40000 ALTER TABLE `nvsapp_timetableschedule` DISABLE KEYS */;
INSERT INTO `nvsapp_timetableschedule` VALUES (1,'','','','','',0,1,2,1,2,3,4,5,6,5,1,1,2,3,4,5,6,1,1,2,3,4,1,2,3,4,5,6,4,1,2,3,4,5,6,2,1,2,3,4,5,6,3,1,1);
/*!40000 ALTER TABLE `nvsapp_timetableschedule` ENABLE KEYS */;
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
