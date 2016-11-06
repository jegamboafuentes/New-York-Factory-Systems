-- MySQL dump 10.13  Distrib 5.5.49, for Linux (x86_64)
--
-- Host: localhost    Database: nyfs_sales
-- ------------------------------------------------------
-- Server version	5.5.49-cll-lve

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
-- Table structure for table `cat_products_nyfs`
--

DROP TABLE IF EXISTS `cat_products_nyfs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_products_nyfs` (
  `id_cat_prod_nyfs` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id_cat_prod_nyfs`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_products_nyfs`
--

LOCK TABLES `cat_products_nyfs` WRITE;
/*!40000 ALTER TABLE `cat_products_nyfs` DISABLE KEYS */;
INSERT INTO `cat_products_nyfs` (`id_cat_prod_nyfs`, `name`) VALUES (1,'Basic web pages'),(2,'Medium systems'),(3,'Advanced systems');
/*!40000 ALTER TABLE `cat_products_nyfs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `id_client` varchar(100) NOT NULL,
  `name_client` varchar(100) NOT NULL,
  `id_seller` varchar(50) NOT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id_client`),
  KEY `client_seller_fk_idx` (`id_seller`),
  CONSTRAINT `client_seller_fk` FOREIGN KEY (`id_seller`) REFERENCES `seller` (`id_seller`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` (`id_client`, `name_client`, `id_seller`, `date_creation`) VALUES ('everydaynewyorker','Every day New Yorker','hpbriffel@nyfactorysystems.com','2016-01-15 23:41:53'),('prueba','Prueba 1','hpbriffel@nyfactorysystems.com','2016-01-18 14:23:18');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_contact`
--

DROP TABLE IF EXISTS `client_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_contact` (
  `id_client_contact` varchar(50) NOT NULL,
  `id_client` varchar(100) NOT NULL,
  `name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `telephone` varchar(45) NOT NULL,
  PRIMARY KEY (`id_client_contact`),
  KEY `clientContact_client_fk_idx` (`id_client`),
  CONSTRAINT `clientContact_client_fk` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_contact`
--

LOCK TABLES `client_contact` WRITE;
/*!40000 ALTER TABLE `client_contact` DISABLE KEYS */;
INSERT INTO `client_contact` (`id_client_contact`, `id_client`, `name`, `last_name`, `telephone`) VALUES ('danielle_ettl@yahoo.com','everydaynewyorker','Danielle','Ettl','2013200456'),('prueba@prueba.com','prueba','enrique','gamboa','1234567890');
/*!40000 ALTER TABLE `client_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_req`
--

DROP TABLE IF EXISTS `client_req`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_req` (
  `id_client_req` varchar(100) NOT NULL,
  `id_client` varchar(100) NOT NULL,
  `id_cat_prod_nyfs` int(11) NOT NULL,
  `id_client_contact` varchar(50) NOT NULL,
  `date_issue` date DEFAULT NULL,
  `aprox_finish` date DEFAULT NULL,
  `date_finish` date DEFAULT NULL,
  PRIMARY KEY (`id_client_req`),
  KEY `fk_client_req_client_idx` (`id_client`),
  KEY `fk_client_req_cat_products_nyfs_idx` (`id_cat_prod_nyfs`),
  CONSTRAINT `fk_client_req_cat_products_nyfs` FOREIGN KEY (`id_cat_prod_nyfs`) REFERENCES `cat_products_nyfs` (`id_cat_prod_nyfs`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_client_req_client` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_req`
--

LOCK TABLES `client_req` WRITE;
/*!40000 ALTER TABLE `client_req` DISABLE KEYS */;
INSERT INTO `client_req` (`id_client_req`, `id_client`, `id_cat_prod_nyfs`, `id_client_contact`, `date_issue`, `aprox_finish`, `date_finish`) VALUES ('everydaynewyorker-1','everydaynewyorker',2,'danielle_ettl@yahoo.com','2016-01-18',NULL,NULL);
/*!40000 ALTER TABLE `client_req` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_req_det`
--

DROP TABLE IF EXISTS `client_req_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_req_det` (
  `id_client_req_det` int(11) NOT NULL AUTO_INCREMENT,
  `id_client_req` varchar(50) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `text` mediumtext,
  `note_client` mediumtext,
  `note_nyfs` mediumtext,
  `aprox_dates_working` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_client_req_det`),
  KEY `fk_client_req_det_client_req_idx` (`id_client_req`),
  CONSTRAINT `fk_client_req_det_client_req` FOREIGN KEY (`id_client_req`) REFERENCES `client_req` (`id_client_req`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_req_det`
--

LOCK TABLES `client_req_det` WRITE;
/*!40000 ALTER TABLE `client_req_det` DISABLE KEYS */;
INSERT INTO `client_req_det` (`id_client_req_det`, `id_client_req`, `title`, `text`, `note_client`, `note_nyfs`, `aprox_dates_working`) VALUES (7,'everydaynewyorker-1','Develop pricing model – put on site?',NULL,NULL,NULL,NULL),(8,'everydaynewyorker-1','Design logo (describe demographic)',NULL,NULL,NULL,NULL),(9,'everydaynewyorker-1','Web Page (look like l’altra donna)',NULL,NULL,NULL,NULL),(10,'everydaynewyorker-1','Web Content and inclusion of form (contact.applicaiton):',NULL,NULL,NULL,NULL),(11,'everydaynewyorker-1','Develop web app? Based on feedback re: what people like',NULL,NULL,NULL,NULL),(12,'everydaynewyorker-1','Can info entered into website be captured in a Database or fed into standard templates?',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `client_req_det` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_req_files`
--

DROP TABLE IF EXISTS `client_req_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_req_files` (
  `idclient_req_files` int(11) NOT NULL AUTO_INCREMENT,
  `id_client_req` varchar(100) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `path` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idclient_req_files`),
  KEY `fk_client_req_files_client_req_idx` (`id_client_req`),
  CONSTRAINT `fk_client_req_files_client_req` FOREIGN KEY (`id_client_req`) REFERENCES `client_req` (`id_client_req`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_req_files`
--

LOCK TABLES `client_req_files` WRITE;
/*!40000 ALTER TABLE `client_req_files` DISABLE KEYS */;
INSERT INTO `client_req_files` (`idclient_req_files`, `id_client_req`, `title`, `path`) VALUES (1,'everydaynewyorker-1','Every day new yorker 1','../../../clients/everydaynewyorker/files/EverydayNYWebV1.docx'),(2,'everydaynewyorker-1','Every day new yorker req','../../../clients/everydaynewyorker/files/EveryDayNYEnrique.docx');
/*!40000 ALTER TABLE `client_req_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_security`
--

DROP TABLE IF EXISTS `client_security`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_security` (
  `id_client` varchar(100) NOT NULL,
  `id_client_contact` varchar(50) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id_client`,`id_client_contact`),
  KEY `c_security_c_contact_fk_idx` (`id_client_contact`),
  CONSTRAINT `c_security_client_fk` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `c_security_c_contact_fk` FOREIGN KEY (`id_client_contact`) REFERENCES `client_contact` (`id_client_contact`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_security`
--

LOCK TABLES `client_security` WRITE;
/*!40000 ALTER TABLE `client_security` DISABLE KEYS */;
INSERT INTO `client_security` (`id_client`, `id_client_contact`, `password`) VALUES ('everydaynewyorker','danielle_ettl@yahoo.com','12345'),('prueba','prueba@prueba.com','1234');
/*!40000 ALTER TABLE `client_security` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seller` (
  `id_seller` varchar(50) NOT NULL,
  `name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `telephone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_seller`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` (`id_seller`, `name`, `last_name`, `telephone`) VALUES ('hpbriffel@nyfactorysystems.com','Henry P.','Briffel','9174149340');
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'nyfs_sales'
--

--
-- Dumping routines for database 'nyfs_sales'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-05 15:32:55
