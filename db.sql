-- MariaDB dump 10.19  Distrib 10.5.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: notes_manager
-- ------------------------------------------------------
-- Server version	10.5.12-MariaDB-0+deb11u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `isActive` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'important',1),(2,'kitchen',1),(3,'food',1),(4,'work',0),(5,'postponable',1),(6,'pets',0),(7,'study',1),(8,'nightlife',0),(9,'vacation',1),(10,'trip',1);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_notes`
--

DROP TABLE IF EXISTS `categories_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories_notes` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` mediumint(8) unsigned NOT NULL,
  `note_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `categories_notes_FK` (`category_id`),
  KEY `categories_notes_FK2` (`note_id`),
  CONSTRAINT `categories_notes_FK` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `categories_notes_FK2` FOREIGN KEY (`note_id`) REFERENCES `notes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_notes`
--

LOCK TABLES `categories_notes` WRITE;
/*!40000 ALTER TABLE `categories_notes` DISABLE KEYS */;
INSERT INTO `categories_notes` VALUES (1,8,6),(2,2,9),(3,2,7),(4,7,10),(5,4,8),(6,5,9),(7,1,3),(8,1,1),(9,9,5),(10,10,5),(11,5,4);
/*!40000 ALTER TABLE `categories_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `modifiedAt` datetime NOT NULL DEFAULT current_timestamp(),
  `description` varchar(100) NOT NULL,
  `isEraseable` tinyint(4) NOT NULL DEFAULT 0,
  `user_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `notes_FK` (`user_id`),
  CONSTRAINT `notes_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (1,'sprint deadline','2021-11-01 20:45:03','2021-11-01 20:45:03','deliver sprint before 4/11',0,1),(2,'plan holidays','2021-11-01 20:45:03','2021-11-01 20:45:03','search for nice place',1,1),(3,'buy more food','2021-11-01 20:45:03','2021-11-01 21:01:01','buy meat and salad',0,4),(4,'DH playground','2021-11-01 20:45:03','2021-11-01 20:45:03','end exercise 666',1,8),(5,'book hotel','2021-11-01 20:45:03','2021-11-01 20:45:03','book hostel in MDQ',1,9),(6,'call John','2021-11-01 20:45:03','2021-11-01 20:45:03','call at 8pm',0,2),(7,'tonight recipe','2021-11-01 20:46:03','2021-11-01 20:46:03','search recipe for barbacue',0,10),(8,'compile kernel','2021-11-01 20:46:03','2021-11-01 20:46:03','download and copile 5.4.2',0,4),(9,'wash dishes','2021-11-01 20:46:03','2021-11-01 20:46:03','use dishwasher',1,3),(10,'learn react','2021-11-01 20:46:03','2021-11-01 20:46:03','watch video about react',0,6);
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER notes_modifiedAt
BEFORE UPDATE
ON notes FOR EACH ROW
BEGIN
	SET NEW.modifiedAt = now();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `isActive` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Joelle Justice','erat.eget.tincidunt@aliquamornare.co.uk','Penatibus Et Inc.',1),(2,'Jordan Salazar','porttitor.interdum@nullaeu.ca','Lobortis Class Aptent Associates',0),(3,'Kieran Mccarty','neque.et@necurna.net','Dui PC',1),(4,'Conan Chaney','est.tempor.bibendum@namporttitorscelerisque.net','Nec Ante Ltd',0),(5,'Ursula Blackburn','a@ac.co.uk','Interdum Curabitur Industries',0),(6,'MacKenzie Willis','eget.magna@sem.edu','Velit Quisque Varius Industries',1),(7,'Bo Acevedo','massa.vestibulum@tempor.org','Nullam Ltd',0),(8,'Teagan Moran','lacus.etiam@erosnec.edu','Suspendisse Non Leo Industries',1),(9,'Karleigh Harmon','nulla.in.tincidunt@dolorvitae.edu','Dolor Quam Elementum Consulting',1),(10,'Christen Terry','ipsum@consectetuereuismod.edu','Aenean Gravida LLC',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-01 23:14:57
