-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: holidays
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


DROP SCHEMA IF EXISTS holidays;
CREATE SCHEMA holidays CHARACTER SET utf8;
USE holidays;


--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `booking` (
  `rno` varchar(20) NOT NULL,
  `cno` tinyint NOT NULL,
  `arrival` date NOT NULL,
  `departure` date NOT NULL,
  `price` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`rno`,`cno`,`arrival`,`departure`),
  KEY `booking_cno_idx` (`cno`),
  CONSTRAINT `booking_cno` FOREIGN KEY (`cno`) REFERENCES `customers` (`cno`),
  CONSTRAINT `booking_rno_fk` FOREIGN KEY (`rno`) REFERENCES `rooms` (`rno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES ('1-2',44,'2021-05-01','2021-05-03',200.00),('13-1',39,'2021-03-01','2021-03-03',160.00),('14-2',31,'2021-01-23','2021-02-08',200.00),('15-2',41,'2021-05-12','2021-05-15',190.00),('4-2',30,'2021-06-13','2021-06-15',140.00),('5-2',36,'2021-03-14','2021-03-24',180.00),('6-2',43,'2021-05-14','2021-05-17',200.00),('7-2',43,'2021-04-12','2021-04-30',180.00),('8-2',30,'2021-03-24','2021-04-06',150.00),('9-2',32,'2021-04-14','2021-04-18',150.00);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cities` (
  `zip` char(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `land` char(2) NOT NULL,
  PRIMARY KEY (`zip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES ('00100','Rome','IT'),('0054','Erevan','AM'),('06400','Cannes','FR'),('100-0001','Tokyo','JP'),('10019','New York','US'),('10316','Stockholm','SE'),('10431','Athènes','GR'),('10580','New York','US'),('11788','Long Island','US'),('12203','Albany','US'),('20005','Seattle','US'),('20019','Seattle','US'),('20037','Seattle','US'),('20903','Silver Spring','US'),('230532','Mumbai','IN'),('32018','Daytona Beach','US'),('33441','Deerfield Beach','US'),('33575','Clearwater','US'),('4000','Porto','PT'),('45211','Cincinnati','US'),('48226','Detroit','US'),('6000','Perth','AU'),('60018','Rosemont','US'),('605001','Pondichery','IN'),('605005','Mattour','IN'),('60601','Chicago','US'),('60615','Chicago','US'),('70112','New Orleans','US'),('75001','Paris','FR'),('75243','Dallas','US'),('90018','Los Angeles','US'),('90029','Hollywood','US'),('90804','Long Beach','US'),('91150','Etampes','FR'),('91290','Arpajon','FR'),('92262','Palm Springs','US'),('92714','Irvine','US'),('95054','Santa Clara','US'),('97213','Portland','US'),('97232','Lamentin','MQ'),('G0A 4V0','Québec','CA');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customers` (
  `cno` tinyint NOT NULL AUTO_INCREMENT,
  `fname` varchar(30) NOT NULL,
  `lname` varchar(30) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  PRIMARY KEY (`cno`),
  UNIQUE KEY `mail_UNIQUE` (`mail`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (30,'Jenny','Porter','jenny.porter@greta.com','secret'),(31,'Peter','Brown','peter.brown@greta.com','secret'),(32,' ','Datasoft','contact@datasoft.com','secret'),(33,'Rose','Brian','rose.brian@greta.com','secret'),(34,'Mary','Griffith','mgriffith@greta.com','secret'),(35,'Martin','Randolph','martin_randolph@greta.com','secret'),(36,'Sally','Smith','sally.smith@greta.com','secret'),(37,'Mike','Jackson','mike-jax@greta.com','secret'),(38,'Rita','Doe','rita.doe@greta.com','secret'),(39,'George','Howe','ghowe@greta.com','secret'),(40,'Frank','Miller','frak.miller@greta.com','secret'),(41,'Susan','Baker','susan.baker@greta.com','secret'),(42,'Joseph','Peters','jp@greta.com','secret'),(43,' ','TOOLware','hr@toolware.com','secret'),(44,'Antony','Jenkins','antojenk@greta.com','secret');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotels`
--

DROP TABLE IF EXISTS `hotels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hotels` (
  `hno` tinyint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip` char(10) DEFAULT NULL,
  `photo` mediumblob,
  PRIMARY KEY (`hno`),
  KEY `hotels_zip_fk_idx` (`zip`),
  CONSTRAINT `hotels_zip_fk` FOREIGN KEY (`zip`) REFERENCES `cities` (`zip`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotels`
--

LOCK TABLES `hotels` WRITE;
/*!40000 ALTER TABLE `hotels` DISABLE KEYS */;
INSERT INTO `hotels` VALUES (1,'Congress','155 Beechwood St.','20005',NULL),(2,'Regency','477 17th Avenue','20037',NULL),(3,'Long Island','1499 Grove Street','11788',NULL),(4,'Empire State','65 Yellowstone Dr.','12203',NULL),(5,'Midtown','12 Barnard St.','10019',NULL),(6,'Eighth Avenue','112 8th Avenue','10019',NULL),(7,'Lake Michigan','354 OAK Terrace','60601',NULL),(8,'Airport','650 C Parkway','60018',NULL),(9,'Sunshine','200 Yellowstone Dr.','33575',NULL),(10,'Beach','1980 34th St.','32018',NULL),(11,'Atlantic','111 78th St.','33441',NULL),(12,'Long Beach','35 Broadway','90804',NULL),(13,'Indian Horse','16 Main Street','92262',NULL),(14,'Star','13 Beechwood Place','90029',NULL),(15,'River Boat','788 Main Street','70112',NULL),(16,'Hôtel de police',NULL,'91290',NULL),(17,'Miros',NULL,'10431',NULL),(18,'Marriott',NULL,'0054',NULL),(19,'Hilton Slussen',NULL,'10316',NULL),(20,'Napoleon Hotel',NULL,'00100',NULL),(21,'Tropical',NULL,'97232',NULL),(22,'Kumar Hotel',NULL,'605005',NULL),(23,'Calinga Inn',NULL,'230532',NULL),(24,'Ibis',NULL,'91150',NULL),(25,'ANNAMALAI',NULL,'605001',NULL),(26,'Silva Resort',NULL,'4000',NULL),(27,'Sunroute Plaza',NULL,'100-0001',NULL),(28,'Hotel Plaza',NULL,'75001',NULL),(29,'Hôtel Universel',NULL,'G0A 4V0',NULL),(30,'Carlton',NULL,'06400',NULL),(31,'Palfi Inn',NULL,'6000',NULL);
/*!40000 ALTER TABLE `hotels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rooms` (
  `rno` varchar(20) NOT NULL,
  `type` varchar(6) DEFAULT NULL,
  `price` decimal(6,2) DEFAULT NULL,
  `hno` tinyint NOT NULL,
  PRIMARY KEY (`rno`),
  KEY `fk_rooms_hotels_idx` (`hno`),
  CONSTRAINT `fk_rooms_hotels` FOREIGN KEY (`hno`) REFERENCES `hotels` (`hno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES ('1-1','single',135.00,1),('1-2','double',200.00,1),('10-1','single',60.00,10),('10-2','double',100.00,10),('11-1','single',70.00,11),('11-2','double',130.00,11),('12-1','single',80.00,12),('12-2','double',140.00,12),('12-3','suite',350.00,12),('13-1','single',160.00,13),('13-2','double',270.00,13),('13-3','suite',700.00,13),('14-1','single',125.00,14),('14-2','double',200.00,14),('14-3','suite',600.00,14),('15-1','single',100.00,15),('15-2','double',190.00,15),('15-3','suite',450.00,15),('2-1','single',70.00,2),('2-2','double',100.00,2),('3-1','single',45.00,3),('3-2','double',80.00,3),('4-1','single',85.00,4),('4-2','double',140.00,4),('5-1','single',105.00,5),('5-2','double',180.00,5),('5-3','suite',500.00,5),('6-1','single',120.00,6),('6-2','double',200.00,6),('6-3','suite',500.00,6),('7-1','single',115.00,7),('7-2','double',180.00,7),('8-1','single',90.00,8),('8-2','double',150.00,8),('8-3','suite',400.00,8),('9-1','single',90.00,9),('9-2','double',150.00,9),('9-3','suite',300.00,9);
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-10 20:38:38
