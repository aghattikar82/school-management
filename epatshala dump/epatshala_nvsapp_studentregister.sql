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
-- Table structure for table `nvsapp_studentregister`
--

DROP TABLE IF EXISTS `nvsapp_studentregister`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nvsapp_studentregister` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `admissionno` int NOT NULL,
  `admissiondate` varchar(100) NOT NULL,
  `chooseclass_id` bigint NOT NULL,
  `section_id` bigint NOT NULL,
  `rollno` int NOT NULL,
  `studentid` varchar(15) NOT NULL,
  `studentname` varchar(100) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `aadhaarno` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `dateofbirth` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `religion_id` bigint NOT NULL,
  `caste_id` bigint NOT NULL,
  `subcaste_id` bigint NOT NULL,
  `nationality` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `mobileno` varchar(100) NOT NULL,
  `phoneno` varchar(100) NOT NULL,
  `amount` double NOT NULL,
  `fathername` varchar(100) NOT NULL,
  `fathereducation` varchar(100) NOT NULL,
  `fatherdesignation` varchar(100) NOT NULL,
  `mothername` varchar(100) NOT NULL,
  `mothereducation` varchar(100) NOT NULL,
  `motherdesignation` varchar(100) NOT NULL,
  `mothertongue` varchar(100) NOT NULL,
  `dependents` varchar(100) NOT NULL,
  `annualincome` varchar(100) NOT NULL,
  `lastschool` varchar(100) NOT NULL,
  `tcno` varchar(100) NOT NULL,
  `latitude` varchar(100) NOT NULL,
  `longitude` varchar(100) NOT NULL,
  `academicyearid_id` bigint DEFAULT NULL,
  `createdby_id` bigint NOT NULL,
  `createdon` varchar(100) NOT NULL,
  `deletedby` varchar(100) NOT NULL,
  `deletedon` varchar(100) NOT NULL,
  `softdelete` int NOT NULL,
  `upadatedon` varchar(100) NOT NULL,
  `updatedby` varchar(100) NOT NULL,
  `aadharimage` varchar(100) NOT NULL,
  `bloodgroup` varchar(100) NOT NULL,
  `studentphoto` varchar(100) NOT NULL,
  `instituteid_id` bigint NOT NULL,
  `password` varchar(100) NOT NULL,
  `SchoolBus` varchar(100) NOT NULL,
  `buscharge` varchar(100) NOT NULL,
  `busfacility` varchar(100) NOT NULL,
  `discount` double NOT NULL,
  `hostelfacility` varchar(100) NOT NULL,
  `schoolbusroute` varchar(100) NOT NULL,
  `srnumber` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nvsapp_studentregister_academicyearid_id_4c0569d4` (`academicyearid_id`),
  KEY `nvsapp_studentregister_caste_id_eceae4fd` (`caste_id`),
  KEY `nvsapp_studentregister_chooseclass_id_0a7b80f3` (`chooseclass_id`),
  KEY `nvsapp_studentregister_createdby_id_ee332a9b` (`createdby_id`),
  KEY `nvsapp_studentregister_religion_id_dc347655` (`religion_id`),
  KEY `nvsapp_studentregister_section_id_3882a7f9` (`section_id`),
  KEY `nvsapp_studentregister_subcaste_id_bb13f278` (`subcaste_id`),
  KEY `nvsapp_studentregister_instituteid_id_cd4ddadc` (`instituteid_id`),
  CONSTRAINT `nvsapp_studentregist_academicyearid_id_4c0569d4_fk_nvsapp_ac` FOREIGN KEY (`academicyearid_id`) REFERENCES `nvsapp_academicmaster` (`id`),
  CONSTRAINT `nvsapp_studentregist_caste_id_eceae4fd_fk_nvsapp_ca` FOREIGN KEY (`caste_id`) REFERENCES `nvsapp_casteoperator` (`id`),
  CONSTRAINT `nvsapp_studentregist_chooseclass_id_0a7b80f3_fk_nvsapp_ad` FOREIGN KEY (`chooseclass_id`) REFERENCES `nvsapp_addclass` (`id`),
  CONSTRAINT `nvsapp_studentregist_createdby_id_ee332a9b_fk_nvsapp_us` FOREIGN KEY (`createdby_id`) REFERENCES `nvsapp_userregister` (`id`),
  CONSTRAINT `nvsapp_studentregist_instituteid_id_cd4ddadc_fk_nvsapp_in` FOREIGN KEY (`instituteid_id`) REFERENCES `nvsapp_institutionprofile` (`id`),
  CONSTRAINT `nvsapp_studentregist_religion_id_dc347655_fk_nvsapp_re` FOREIGN KEY (`religion_id`) REFERENCES `nvsapp_religion` (`id`),
  CONSTRAINT `nvsapp_studentregist_section_id_3882a7f9_fk_nvsapp_ad` FOREIGN KEY (`section_id`) REFERENCES `nvsapp_addsection` (`id`),
  CONSTRAINT `nvsapp_studentregist_subcaste_id_bb13f278_fk_nvsapp_ms` FOREIGN KEY (`subcaste_id`) REFERENCES `nvsapp_mstsubcaste` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nvsapp_studentregister`
--

LOCK TABLES `nvsapp_studentregister` WRITE;
/*!40000 ALTER TABLE `nvsapp_studentregister` DISABLE KEYS */;
INSERT INTO `nvsapp_studentregister` VALUES (1,1,'1111-11-11',1,1,1,'','shiva','talmudge','323157138451','M','1111-11-11','SC',1,1,1,'Indian','Byalhalli(w) Bhlaki','Karnataka','+916364603717','+916364603717',0,'chandrakanth','1','Farmer','kaveri','1','house wife','kannada','0','20000','msmr','7888','66676','76767',1,2,'','','',0,'','','noimage.png','1','/media/profile_img.jpg',1,'436438','kA32JA7132','2020','yes',123345,'yes','R T Nagar','NVBHS2023001'),(2,2,'7777-07-07',1,1,1,'','Somu','Ta;mudge','323157138451','M','1111-12-11','SC',1,1,1,'Indian','ffhfhfhf hfhgfhfhf','Karnataka','+916364603717','+916364603717',0,'Shiva','1','kannada','kaveri','1','house wife','kannada','0','10000','sdfgdg ','23232','3232','2323',1,2,'','','',0,'','','noimage.png','1','/media/profile_img_xNbwlII.jpg',1,'622116','kA32JA7132','2323','yes',2000,'yes','R T Nagar','NVBHS2023002'),(3,3,'1111-11-11',1,1,2,'','Ajay','Dole','32323232323','M','2222-12-12','SC',1,1,1,'Indian','devnal gulbarga','Karnataka','8884752201','8884752201',0,'Shekar','1','farmer','shsh','1','farmer','kannda','0','20000','dfjgsdjfg gjsdfjgds f','450','6546544','64',1,2,'','','',0,'','','noimage.png','5','/media/sign_shiva.jpg',1,'754635','kA32JA7132','200','yes',2000,'yes','Ganga Nagar','NVBHS2023003'),(4,4,'1212-01-22',1,1,2,'','Anup','Ghattikarq','222233334444','M','1111-12-12','SC',1,1,1,'Indian','gulbarga','Karnataka','7894561230','3210456789',0,'Dattatri','1','Farmer','kasturi','2','Librarien','kannada','0','50000','Sdkaskdh  djfgjsgdjf ','789456','8787','87778',1,2,'','','',0,'','','noimage.png','3','/media/A%20masterpiece%20portrait%20of%20a%20beautiful%20man%20with%20bla.jpg',1,'433453','kA32JA7132','78778','yes',50,'yes','R T Nagar','NVBHS2023004'),(5,5,'2023-09-16',1,1,2,'','Rahul','Rathod','222244445555','M','1111-11-11','SC',1,1,1,'Indian','Karari gulbarga','Karnataka','7022388219','7022388219',0,'shivraj','1','Farmer','test1','1','house wife','kannada','0','500000','jhhjhjj jhgg','789456','1333','13131',1,2,'','','',0,'','','noimage.png','1','/media/Automobile.jpg',1,'842085','kA32JA7132','2000','no',1111,'no','R T Nagar','NVBHS2023005'),(6,6,'2023-09-16',2,2,1,'','Pooja','yadav','789478947894','F','1111-11-11','SC',1,1,1,'Indian','as sas dasff gdsgsg','Karnataka','8945894545','8945894545',0,'chandrakanth','4','Teacher','kaveri','3','Teacher','kannada','0','80000','msmsms ','202020','2323','787.787',1,2,'','','',0,'','','noimage.png','3','/media/IMG-20190918-WA0026%20(2).jpg',1,'914137','kA32JA7132','kdjskjfq','yes',200,'no','Ganga Nagar','NVBHS2023006'),(7,7,'2023-09-16',2,1,1,'','Nikita','Rathod','555522223333','F','6666-06-06','SC',1,1,1,'Indian','wsdsfsg','Karnataka','8787878788','8778877878',0,'Hari','4','Teacher','Harit','2','House wife','Kannada','0','40000','dfjsdf gjggdjg','4545','878887','877888',1,2,'','','',0,'','','noimage.png','4','/media/sign_shiva_N2MZ2C6.jpg',1,'697119','kA32JA7132','200','yes',5000,'yes','R T Nagar','NVBHS2023007'),(8,8,'1111-11-11',2,1,1,'','Rohit','Pakka','789478947894','M','1111-11-11','SC',1,1,1,'Indian','dsfdhgjf fgjfgjf  tr','Karnataka','7894561230','6364603717',0,'Rahul','3','Teacher','Kaveri','1','House Wife','Kannada','0','500000','dfjsdf gjggdjg','202077','2323','877888',1,2,'','','',0,'','','noimage.png','7','/media/IMG-20190918-WA0026%20(2)_BtTOTT9.jpg',1,'566430','kA32JA7132','200','no',5000,'yes','R T Nagar','NVBHS2023008'),(9,9,'2023-09-16',2,1,1,'','Shashi','Mathpati','456145614561','M','2023-09-16','SC',1,1,1,'Indian','sdgs sdhgfg cn dnd','Karnataka','0636462203','06364605555',0,'Hari','4','Teacher','Kaveri','2','House wife','kannada','0','80000','msmsms  fgf ghgh','4545','78945612','78946',1,2,'','','',0,'','','noimage.png','1','/media/signshiva.jpg',1,'816990','kA32JA7132','200','yes',5000,'no','R T Nagar','NVBHS2023009'),(10,10,'2023-09-14',2,1,1,'','revan','Mathpati','789478947894','M','2023-09-14','SC',1,1,1,'Indian','Byalhalli(w) Bhlaki','Karnataka','+916364603745','7896543210',0,'chandrakanth','3','Teacher','Kaveri','2','Teacher','kannada','0','500000','dfjsdf gjggdjg hf cxsd','454578','232345','7578110',1,2,'','','',0,'','','noimage.png','6','/media/sign.png',1,'929970','kA32JA7132','2000','no',5000,'yes','R T Nagar','NVBHS2023010');
/*!40000 ALTER TABLE `nvsapp_studentregister` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-16 13:29:42
