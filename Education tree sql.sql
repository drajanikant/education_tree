-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: education_tree
-- ------------------------------------------------------
-- Server version	5.7.12-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `address_line_1` varchar(150) DEFAULT NULL,
  `address_line_2` varchar(150) DEFAULT NULL,
  `address_state` int(11) DEFAULT NULL,
  `address_district` int(11) DEFAULT NULL,
  `address_taluka` int(11) DEFAULT NULL,
  `address_city` int(11) DEFAULT NULL,
  `address_pin_code` int(11) DEFAULT NULL,
  `member_id` int(11) NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `fk_address_state_idx` (`address_state`),
  KEY `fk_address_dist_idx` (`address_district`),
  KEY `fk_address_taluka_idx` (`address_taluka`),
  KEY `fk_address_city_idx` (`address_city`),
  KEY `fk_member_id_idx` (`member_id`),
  CONSTRAINT `fk_address_city` FOREIGN KEY (`address_city`) REFERENCES `city` (`city_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_address_dist` FOREIGN KEY (`address_district`) REFERENCES `district` (`district_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_address_state` FOREIGN KEY (`address_state`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_address_taluka` FOREIGN KEY (`address_taluka`) REFERENCES `taluka` (`taluka_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (3,'AP Dhamai','Sangli',2,1,2,18,415414,1);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(100) DEFAULT NULL,
  `admin_email` varchar(150) NOT NULL,
  `admin_pass` varchar(45) NOT NULL,
  `admin_contact` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `Admin_email_UNIQUE` (`admin_email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admina','admin@gmail.com','admin','8600743509'),(3,'sam','sam@gmail.com','sam','9975565598');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `taluka_id` int(11) DEFAULT NULL,
  `city_name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`city_id`),
  KEY `fk_city_taluka_idx` (`taluka_id`),
  CONSTRAINT `fk_city_taluka` FOREIGN KEY (`taluka_id`) REFERENCES `taluka` (`taluka_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='		';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,1,'sangli'),(2,3,'Kumbhoj'),(3,1,'Miraj'),(5,2,'Walawa'),(6,8,'Jat'),(7,9,'Tasgaon'),(8,10,'Khanapur'),(9,11,'Palus'),(10,12,'Shirala'),(11,13,'Kavathemahankal'),(12,14,'Kadegaon'),(13,15,'Atpadi'),(14,3,'Hathkanangle'),(15,4,'Gadhinglaj'),(16,5,'Kagal'),(17,6,'Ajara'),(18,2,'Uran Islampur'),(19,2,'Ashta'),(20,10,'VIta');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `college`
--

DROP TABLE IF EXISTS `college`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `college` (
  `college_id` int(11) NOT NULL AUTO_INCREMENT,
  `college_name` varchar(200) DEFAULT NULL,
  `college_state` int(11) DEFAULT NULL,
  `college_district` int(11) DEFAULT NULL,
  `college_taluka` int(11) DEFAULT NULL,
  `college_city` int(11) DEFAULT NULL,
  `college_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`college_id`),
  KEY `fk_college_state_idx` (`college_state`),
  KEY `fk_college_dist_idx` (`college_district`),
  KEY `fk_college_taluka_idx` (`college_taluka`),
  KEY `fk_college_city_idx` (`college_city`),
  CONSTRAINT `fk_college_city` FOREIGN KEY (`college_city`) REFERENCES `city` (`city_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_college_dist` FOREIGN KEY (`college_district`) REFERENCES `district` (`district_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_college_state` FOREIGN KEY (`college_state`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_college_taluka` FOREIGN KEY (`college_taluka`) REFERENCES `taluka` (`taluka_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college`
--

LOCK TABLES `college` WRITE;
/*!40000 ALTER TABLE `college` DISABLE KEYS */;
INSERT INTO `college` VALUES (9,'Walchand College Of Engineering , Sangli-Sangli',2,1,1,1,'Diploma'),(10,'Latthe Education Societys Polytechnic , Sangli-Sangli',2,1,1,3,'Diploma'),(11,'Pad.Vasantdada Patil Institute of Technology , Budhgaon-Sangli',2,1,1,3,'Diploma'),(12,'GOVERNMENT POLYTECHNIC , Miraj-Sangli',2,1,1,3,'Diploma'),(13,'BHARATI VIDYAPEETH INSTITUTE OF TECHNOLOGY , Palus-Sangli',2,1,11,9,'Diploma'),(14,'Loknete Hanmantrao Patil Charitable Trust\'s Adarsh Institute of Technology , Vita-Sangli',2,1,10,20,'Diploma'),(15,'Shantiniketan Polytechnic College , Sangli-Sangli',2,1,1,1,'Diploma'),(16,'BHARATI VIDYAPEETH\'S INSTITUTE OF TECHNOLOGY(POLYTECHNIC) , Palus-',2,1,11,9,'Diploma'),(17,'BHARATI VIDYAPEETH\'S INSTITUTE OF TECHNOLOGY(POLYTECHNIC) , Palus-',2,1,2,5,'Diploma'),(18,'SHIVAJI POLYTECHNIC , Atpadi-Sangli',2,1,15,13,'Diploma'),(19,'Vitthal Patil Polytechnic , Miraj-Sangli',2,1,1,3,'Diploma'),(20,'M D Jadhav Instituite of Technology , Bhose-Sangli',2,1,1,3,'Diploma'),(21,'M D Jadhav Instituite of Technology , Bhose-Sangli',2,1,8,6,'Diploma'),(22,'GOVERNMENT RESIDENCE WOMEN POLYTECHNIC , Tasgaon-Sangli',2,1,9,7,'Diploma'),(23,'Shri.Jaywantrao Bhosale Polytechnic , Walva-Sangli',2,1,2,5,'Diploma'),(24,'Shri.Jaywantrao Bhosale Polytechnic , Walva-Sangli',2,1,12,10,'Diploma'),(25,'Shri.Shivajirao Deshmukh Institute of Technology , Shirala-Sangli',2,1,12,10,'Diploma'),(26,'Sanjay Bhokare Group of Institutes , Miraj-Sangli',2,1,1,3,'Diploma'),(27,'SCT\'s Vishveshwarya Technical Campus Faculty of Diploma Engineering , Miraj-Sangli',2,1,1,3,'Diploma'),(28,'SVSS\'s Nanasaheb Mahadik Polytechnic Institute , Sangli-',2,1,1,1,'Diploma'),(29,'LHHPCT\'s Adarsh Institute of Technology(Polytechnic) , Vita-Sangli',2,1,10,20,'Diploma'),(30,'PRAKASH SHIKSHAN PRASARAK MANDAL\'S MANAJIRAJE BHOSALE TECHNICAL CAMPUS (FACULTY OF ENGINEERING) , Islampur-',2,1,2,18,'Diploma'),(31,'Kasegaon Education Society\'s Rajarambapu Institute of Technology , Walva-Sangli',2,1,2,18,'Diploma'),(32,'Kasegaon Education Society\'s Rajarambapu Institute of Technology , Walva-Sangli',2,1,2,18,'U.G.'),(33,'K. E. Society\'s Rajarambapu Institute of Technology, Walwa, Sangli',2,1,2,18,'U.G.'),(34,'Shetkari Shikshan Mandal\'s Pad. Vasantraodada Patil Institute of Technology, Budhgaon, Sangli',2,1,1,1,'U.G.'),(35,'Annasaheb Dange College of Engineering and Technology, Ashta, Sangli',2,1,2,19,'U.G.'),(36,'Loknete Hanumantrao Charitable Trust\'s Adarsh Institute of Technology and Research Centre, Vita,Sangli',2,1,10,20,'U.G.'),(37,'Jaywant College of Engineering & Management, Kille Macchindragad Tal. Walva',2,1,2,5,'U.G.'),(38,'Shri. Ambabai Talim Sanstha\'s Sanjay Bhokare Group of Institutes, Miraj',2,1,1,3,'U.G.'),(39,'Nanasaheb Mahadik College of Engineering,Walwa, Sangli.',2,1,2,5,'U.G.'),(40,'Manajiraje Bhosale Technical Campus, Urun Islampur',2,1,2,18,'U.G.'),(41,'Shivganga Charitable Trust, Sangli Vishveshwarya Technical Campus, Faculty of Degree Engineering, Patgaon, Miraj',2,1,1,3,'U.G.'),(42,'abc',2,1,15,13,'U.G.');
/*!40000 ALTER TABLE `college` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `district` (
  `district_id` int(11) NOT NULL AUTO_INCREMENT,
  `state_id` int(11) DEFAULT NULL,
  `district_name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`district_id`),
  KEY `fk_dist_state_idx` (`state_id`),
  CONSTRAINT `fk_dist_state` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district`
--

LOCK TABLES `district` WRITE;
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
INSERT INTO `district` VALUES (1,2,'Sangli'),(2,2,'Kolhapur'),(3,2,'Satara'),(4,2,'Pune'),(5,2,'Nagpur');
/*!40000 ALTER TABLE `district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `member_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_name` varchar(100) DEFAULT NULL,
  `member_dob` date DEFAULT NULL,
  `member_gender` varchar(20) DEFAULT NULL,
  `member_email` varchar(150) NOT NULL,
  `password` varchar(50) NOT NULL,
  `member_mobile` varchar(20) DEFAULT NULL,
  `education_type` varchar(100) DEFAULT NULL,
  `job_type` varchar(45) DEFAULT NULL,
  `company_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`member_id`),
  UNIQUE KEY `member_email_UNIQUE` (`member_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'Arif Sanadi','1995-12-24','Male','arif@gmail.com','arif','9876543210','Engineering','Self Employed','Arif');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_college`
--

DROP TABLE IF EXISTS `member_college`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_college` (
  `member_college_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `college_id` int(11) NOT NULL,
  `year_of_passing` varchar(20) NOT NULL,
  `college_type` varchar(45) NOT NULL,
  PRIMARY KEY (`member_college_id`),
  KEY `fk_member_college_to_member_idx` (`member_id`),
  KEY `fk_member_college_to_college_idx` (`college_id`),
  CONSTRAINT `fk_member_college_to_college` FOREIGN KEY (`college_id`) REFERENCES `college` (`college_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_member_college_to_member` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_college`
--

LOCK TABLES `member_college` WRITE;
/*!40000 ALTER TABLE `member_college` DISABLE KEYS */;
INSERT INTO `member_college` VALUES (4,1,23,'2017','Diploma');
/*!40000 ALTER TABLE `member_college` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_links`
--

DROP TABLE IF EXISTS `social_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_links` (
  `social_link_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `site_name` varchar(100) NOT NULL,
  `social_address` varchar(400) NOT NULL,
  PRIMARY KEY (`social_link_id`),
  KEY `fk_social_member_idx` (`member_id`),
  CONSTRAINT `fk_social_member` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_links`
--

LOCK TABLES `social_links` WRITE;
/*!40000 ALTER TABLE `social_links` DISABLE KEYS */;
INSERT INTO `social_links` VALUES (1,1,'Facebook','jhqudfhiuwgfiu'),(3,1,'YouTube','jhgsudvgiuer');
/*!40000 ALTER TABLE `social_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state` (
  `state_id` int(11) NOT NULL AUTO_INCREMENT,
  `state_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (1,'Aasam'),(2,'Maharashtra');
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taluka`
--

DROP TABLE IF EXISTS `taluka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taluka` (
  `taluka_id` int(11) NOT NULL AUTO_INCREMENT,
  `district_id` int(11) DEFAULT NULL,
  `taluka_name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`taluka_id`),
  KEY `fk_taluka_district_idx` (`district_id`),
  CONSTRAINT `fk_taluka_district` FOREIGN KEY (`district_id`) REFERENCES `district` (`district_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taluka`
--

LOCK TABLES `taluka` WRITE;
/*!40000 ALTER TABLE `taluka` DISABLE KEYS */;
INSERT INTO `taluka` VALUES (1,1,'Miraj'),(2,1,'Walawa'),(3,2,'Hathkanangle'),(4,2,'Gadhinglaj'),(5,2,'Kagal'),(6,2,'Ajara'),(7,2,'Sawantwadi'),(8,1,'Jat'),(9,1,'Tasgaon'),(10,1,'Khanapur'),(11,1,'Palus'),(12,1,'Shirala'),(13,1,'Kavathemahankal'),(14,1,'Kadegaon'),(15,1,'Atpadi');
/*!40000 ALTER TABLE `taluka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_address`
--

DROP TABLE IF EXISTS `view_address`;
/*!50001 DROP VIEW IF EXISTS `view_address`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_address` AS SELECT 
 1 AS `address_id`,
 1 AS `address_line_1`,
 1 AS `address_line_2`,
 1 AS `address_pin_code`,
 1 AS `member_id`,
 1 AS `state_name`,
 1 AS `district_name`,
 1 AS `taluka_name`,
 1 AS `city_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_college`
--

DROP TABLE IF EXISTS `view_college`;
/*!50001 DROP VIEW IF EXISTS `view_college`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_college` AS SELECT 
 1 AS `college_id`,
 1 AS `college_name`,
 1 AS `college_type`,
 1 AS `state_id`,
 1 AS `state_name`,
 1 AS `district_id`,
 1 AS `district_name`,
 1 AS `taluka_id`,
 1 AS `taluka_name`,
 1 AS `city_id`,
 1 AS `city_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_member_college`
--

DROP TABLE IF EXISTS `view_member_college`;
/*!50001 DROP VIEW IF EXISTS `view_member_college`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_member_college` AS SELECT 
 1 AS `member_college_id`,
 1 AS `member_id`,
 1 AS `college_id`,
 1 AS `year_of_passing`,
 1 AS `college_type`,
 1 AS `college_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_state`
--

DROP TABLE IF EXISTS `view_state`;
/*!50001 DROP VIEW IF EXISTS `view_state`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_state` AS SELECT 
 1 AS `taluka_id`,
 1 AS `district_id`,
 1 AS `state_id`,
 1 AS `state_name`,
 1 AS `district_name`,
 1 AS `taluka_name`,
 1 AS `city_id`,
 1 AS `city_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_address`
--

/*!50001 DROP VIEW IF EXISTS `view_address`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_address` AS select `ad`.`address_id` AS `address_id`,`ad`.`address_line_1` AS `address_line_1`,`ad`.`address_line_2` AS `address_line_2`,`ad`.`address_pin_code` AS `address_pin_code`,`ad`.`member_id` AS `member_id`,`st`.`state_name` AS `state_name`,`di`.`district_name` AS `district_name`,`ta`.`taluka_name` AS `taluka_name`,`ci`.`city_name` AS `city_name` from ((((`address` `ad` join `state` `st`) join `district` `di`) join `taluka` `ta`) join `city` `ci`) where ((`ad`.`address_state` = `st`.`state_id`) and (`ad`.`address_district` = `di`.`district_id`) and (`ad`.`address_taluka` = `ta`.`taluka_id`) and (`ad`.`address_city` = `ci`.`city_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_college`
--

/*!50001 DROP VIEW IF EXISTS `view_college`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_college` AS select `college`.`college_id` AS `college_id`,`college`.`college_name` AS `college_name`,`college`.`college_type` AS `college_type`,`state`.`state_id` AS `state_id`,`state`.`state_name` AS `state_name`,`district`.`district_id` AS `district_id`,`district`.`district_name` AS `district_name`,`taluka`.`taluka_id` AS `taluka_id`,`taluka`.`taluka_name` AS `taluka_name`,`city`.`city_id` AS `city_id`,`city`.`city_name` AS `city_name` from ((((`state` join `city`) join `district` on((`state`.`state_id` = `district`.`state_id`))) join `taluka` on(((`city`.`taluka_id` = `taluka`.`taluka_id`) and (`district`.`district_id` = `taluka`.`district_id`)))) join `college`) where ((`college`.`college_state` = `state`.`state_id`) and (`college`.`college_district` = `district`.`district_id`) and (`college`.`college_taluka` = `taluka`.`taluka_id`) and (`college`.`college_city` = `city`.`city_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_member_college`
--

/*!50001 DROP VIEW IF EXISTS `view_member_college`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_member_college` AS select `mem`.`member_college_id` AS `member_college_id`,`mem`.`member_id` AS `member_id`,`mem`.`college_id` AS `college_id`,`mem`.`year_of_passing` AS `year_of_passing`,`mem`.`college_type` AS `college_type`,`col`.`college_name` AS `college_name` from (`member_college` `mem` join `college` `col`) where (`mem`.`college_id` = `col`.`college_id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_state`
--

/*!50001 DROP VIEW IF EXISTS `view_state`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_state` AS select `taluka`.`taluka_id` AS `taluka_id`,`district`.`district_id` AS `district_id`,`state`.`state_id` AS `state_id`,`state`.`state_name` AS `state_name`,`district`.`district_name` AS `district_name`,`taluka`.`taluka_name` AS `taluka_name`,`city`.`city_id` AS `city_id`,`city`.`city_name` AS `city_name` from (((`state` join `district` on((`state`.`state_id` = `district`.`state_id`))) join `taluka` on((`district`.`district_id` = `taluka`.`district_id`))) join `city` on((`taluka`.`taluka_id` = `city`.`taluka_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-18  1:37:18
