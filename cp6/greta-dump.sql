-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: greta
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

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `courses` (
  `id_c` tinyint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `coeff` tinyint DEFAULT NULL,
  `id_tr` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_c`),
  KEY `courses_id_tr_fk` (`id_tr`),
  CONSTRAINT `courses_id_tr_fk` FOREIGN KEY (`id_tr`) REFERENCES `trainers` (`id_tr`),
  CONSTRAINT `courses_coeff_ck` CHECK ((`coeff` between 1 and 7))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'Maquetter une application',1,1),(2,'Réaliser une interface utilisateur web statique et adaptable',1,1),(3,'Développer une interface utilisateur web dynamique',2,2),(4,'Réaliser une interface utilisateur avec une solution de gestion de contenu ou e-commerce',1,1),(5,'Créer une base de données',1,2),(6,'Développer les composants d\'accès aux données',1,2),(7,'Développer la partie back-end d\'une application web ou web mobile',2,2),(8,'Elaborer et mettre en oeuvre des composants dans une application de gestion de contenu ou e-commerce',1,1);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follows`
--

DROP TABLE IF EXISTS `follows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `follows` (
  `id_te` tinyint NOT NULL,
  `id_c` tinyint NOT NULL,
  `eval` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`id_te`,`id_c`),
  KEY `follows_id_c_fk` (`id_c`),
  CONSTRAINT `follows_id_c_fk` FOREIGN KEY (`id_c`) REFERENCES `courses` (`id_c`),
  CONSTRAINT `follows_id_te_fk` FOREIGN KEY (`id_te`) REFERENCES `trainees` (`id_te`),
  CONSTRAINT `follows_eval_ck` CHECK ((`eval` between 0 and 20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follows`
--

LOCK TABLES `follows` WRITE;
/*!40000 ALTER TABLE `follows` DISABLE KEYS */;
INSERT INTO `follows` VALUES (1,1,15.88),(1,2,18.27),(1,3,8.86),(1,4,11.40),(1,5,18.44),(1,6,5.76),(1,7,10.96),(1,8,6.16),(2,1,9.22),(2,2,9.34),(2,3,6.96),(2,4,11.93),(2,5,12.38),(2,6,9.45),(2,7,9.50),(2,8,10.04),(3,1,10.05),(3,2,13.67),(3,3,19.64),(3,4,6.72),(3,5,19.54),(3,6,16.42),(3,7,5.29),(3,8,8.41),(4,1,18.12),(4,2,5.24),(4,3,10.49),(4,4,15.00),(4,5,13.04),(4,6,8.44),(4,7,6.08),(4,8,5.79),(5,1,11.20),(5,2,12.63),(5,3,19.59),(5,4,14.84),(5,5,7.11),(5,6,6.31),(5,7,8.38),(5,8,17.33),(6,1,7.68),(6,2,13.12),(6,3,5.20),(6,4,6.03),(6,5,16.07),(6,6,8.71),(6,7,13.31),(6,8,11.70),(7,1,5.46),(7,2,9.23),(7,3,11.86),(7,4,18.53),(7,5,12.68),(7,6,6.90),(7,7,10.12),(7,8,12.42),(8,1,15.83),(8,2,18.26),(8,3,16.86),(8,4,10.44),(8,5,16.29),(8,6,10.20),(8,7,15.57),(8,8,14.78),(9,1,15.07),(9,2,8.67),(9,3,11.94),(9,4,14.37),(9,5,6.11),(9,6,6.72),(9,7,12.80),(9,8,7.36),(10,1,15.06),(10,2,12.92),(10,3,14.84),(10,4,13.06),(10,5,11.22),(10,6,8.90),(10,7,13.06),(10,8,9.90),(11,1,16.63),(11,2,13.91),(11,3,10.37),(11,4,12.42),(11,5,17.54),(11,6,12.21),(11,7,16.95),(11,8,16.23),(12,1,11.83),(12,2,5.76),(12,3,19.64),(12,4,14.84),(12,5,13.73),(12,6,18.97),(12,7,17.23),(12,8,6.11),(13,1,19.28),(13,2,10.63),(13,3,17.15),(13,4,12.51),(13,5,14.56),(13,6,16.94),(13,7,7.32),(13,8,6.71),(14,5,7.84),(14,6,14.40),(14,7,19.88),(14,8,15.53),(15,1,6.92),(15,2,14.71),(15,3,12.44),(15,4,18.33),(15,5,13.76),(15,6,5.55),(15,7,18.59),(15,8,10.75);
/*!40000 ALTER TABLE `follows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainees`
--

DROP TABLE IF EXISTS `trainees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `trainees` (
  `id_te` tinyint NOT NULL AUTO_INCREMENT,
  `fname` varchar(30) NOT NULL,
  `dob` date DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `internal` tinyint(1) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_te`),
  UNIQUE KEY `trainees_email_uq` (`email`),
  KEY `trainees_dob_idx` (`dob`),
  CONSTRAINT `trainees_internal_ck1` CHECK ((`internal` in (0,1))),
  CONSTRAINT `trainees_sex_ck2` CHECK ((`sex` in (_utf8mb3'F',_utf8mb3'M',_utf8mb3'N')))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainees`
--

LOCK TABLES `trainees` WRITE;
/*!40000 ALTER TABLE `trainees` DISABLE KEYS */;
INSERT INTO `trainees` VALUES (1,'Sidonie','2000-02-26','F',1,'sidonie.moulart@gmail.com'),(2,'Océane','2000-08-02','F',0,'oceane.pichard@orange.fr'),(3,'Céline','2000-05-23','F',0,'celinebrechet@hotmail.fr'),(4,'Blandine','2000-04-28','F',1,'blandinefiguet@gmail.com'),(5,'Mélissa','2000-09-25','F',0,'melissagustave4@gmail.com'),(6,'Edwin','2000-01-15','M',1,'edwinjones.m@gmail.com'),(7,'Kiris','1998-09-05','M',1,'kirishankerpro@gmail.com'),(8,'Vinoth','1980-07-27','M',1,'tvkmr@outlook.fr'),(9,'Bunsen','2000-10-20','M',1,'changivy.bunsen@gmail.com'),(10,'Tiago','1995-03-23','M',0,'tiagofonseca1995@gmail.com'),(11,'Paulo','1991-03-31','M',0,'paulo_magalhaes@outlook.fr'),(12,'Kamal','1995-01-04','M',0,'kamalknina@hotmail.fr'),(13,'Dioclès','1961-12-04','M',1,'diotura@yahoo.fr'),(14,'Flaviu','1999-11-20','M',0,'skydemmon@gmail.com'),(15,'Léo','1997-01-14','M',1,'leo.labeaume@hotmail.fr');
/*!40000 ALTER TABLE `trainees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainers`
--

DROP TABLE IF EXISTS `trainers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `trainers` (
  `id_tr` tinyint NOT NULL AUTO_INCREMENT,
  `fname` varchar(30) NOT NULL,
  `grade` enum('A','B','C','D','E') DEFAULT NULL,
  `dob` date DEFAULT NULL,
  PRIMARY KEY (`id_tr`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainers`
--

LOCK TABLES `trainers` WRITE;
/*!40000 ALTER TABLE `trainers` DISABLE KEYS */;
INSERT INTO `trainers` VALUES (1,'Nadjet','C','2000-08-19'),(2,'Lesly','A','1967-11-11');
/*!40000 ALTER TABLE `trainers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-08 10:53:57
