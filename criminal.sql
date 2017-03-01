-- MySQL dump 10.13  Distrib 5.6.30, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: criminal
-- ------------------------------------------------------
-- Server version	5.6.30-1

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
-- Table structure for table `accused`
--

DROP TABLE IF EXISTS `accused`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accused` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `f_name` varchar(50) DEFAULT NULL,
  `status` varchar(8) DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `nic` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `photo` varchar(20) DEFAULT NULL,
  `finger_print` varchar(20) DEFAULT NULL,
  `fir_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `fir_id` (`fir_id`),
  CONSTRAINT `accused_ibfk_1` FOREIGN KEY (`fir_id`) REFERENCES `fir` (`fir_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accused`
--

LOCK TABLES `accused` WRITE;
/*!40000 ALTER TABLE `accused` DISABLE KEYS */;
INSERT INTO `accused` VALUES (39,'asd','1243','asd',12,'f','ads','asd','image~81.jpg','image~82.jpg',7),(41,'142','qwe','arrested',123,'m','124','jjadakj','image~83.png','image~84.jpg',9),(43,'123123','123','arrested',123,'m','123','123123','image~86.png','image~87.jpg',10),(45,'adsa','qweqw','arrested',12,'m','qe','ads','image~89.png','image~90.jpg',11),(47,'qweqw','qweqwe','statushb',123,'m','qwe','qwe','image~95.jpg','image~96.png',12),(50,'irshad khan ','m khan','guilty',50,'m','12','hdhh@hdhd.com','image~106.jpg','image~107.png',14),(52,'sneha','sd1','arrested',34,'m','1000','hshh@gags.com','image~108.jpg','image~109.jpg',15),(53,'asd','124',NULL,12,'f','rqw','qw213','image~110.png','image~111.jpg',16),(59,'123','asd','punished',123,'f','asd','142','image~116.jpg','image~117.jpg',16),(60,'124','123',NULL,12,'f','asd','1124124','image~118.jpg','default.png',16),(61,'lisma','ls1','arrested',40,'f','11234','sjdjs@ghd.com','image~119.jpg','image~120.jpg',22),(62,'asd','sqew',NULL,123,'f','qwe','qwe1231231','image~123.jpg','image~125.jpg',24);
/*!40000 ALTER TABLE `accused` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accused_address`
--

DROP TABLE IF EXISTS `accused_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accused_address` (
  `id` int(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  PRIMARY KEY (`id`,`address`),
  CONSTRAINT `accused_address_ibfk_1` FOREIGN KEY (`id`) REFERENCES `accused` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accused_address`
--

LOCK TABLES `accused_address` WRITE;
/*!40000 ALTER TABLE `accused_address` DISABLE KEYS */;
INSERT INTO `accused_address` VALUES (39,'124'),(39,'ads'),(41,'e'),(41,'qwe'),(43,'hjb'),(43,'qwrq1'),(43,'rqw'),(45,'412'),(45,'qweqe'),(47,'ASD'),(47,'qwe'),(50,'jfgngfg , 009hjhmyufgfjgj'),(52,'CHANDRAMA COMPLEX'),(52,'i am happy '),(53,'124'),(53,'asd'),(59,'124'),(60,'142'),(61,'asd wqe ewrrt'),(61,'bcbc dgsd ewer'),(62,'123'),(62,'qe');
/*!40000 ALTER TABLE `accused_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accused_alias`
--

DROP TABLE IF EXISTS `accused_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accused_alias` (
  `id` int(11) NOT NULL,
  `alias` varchar(50) NOT NULL,
  PRIMARY KEY (`id`,`alias`),
  CONSTRAINT `accused_alias_ibfk_1` FOREIGN KEY (`id`) REFERENCES `accused` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accused_alias`
--

LOCK TABLES `accused_alias` WRITE;
/*!40000 ALTER TABLE `accused_alias` DISABLE KEYS */;
INSERT INTO `accused_alias` VALUES (39,'asd'),(39,'asd12'),(41,'124'),(41,'1424'),(43,'qwr'),(43,'wqe'),(45,'124'),(45,'21414'),(47,'ASDAS'),(50,'chota  rajan'),(50,'chota don'),(52,'chota rajan'),(52,'chota shakeel'),(53,'14124'),(53,'412'),(59,'asd'),(60,'132'),(61,'don 1'),(61,'don 2'),(62,'aeqew');
/*!40000 ALTER TABLE `accused_alias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accused_contact`
--

DROP TABLE IF EXISTS `accused_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accused_contact` (
  `id` int(11) NOT NULL,
  `phone_no` bigint(12) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`phone_no`),
  CONSTRAINT `accused_contact_ibfk_1` FOREIGN KEY (`id`) REFERENCES `accused` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accused_contact`
--

LOCK TABLES `accused_contact` WRITE;
/*!40000 ALTER TABLE `accused_contact` DISABLE KEYS */;
INSERT INTO `accused_contact` VALUES (39,142),(39,1243412),(41,1234),(41,412412),(43,124),(43,214),(45,412),(45,21421),(47,412),(47,412214),(50,85478542),(50,98545625),(52,674258),(52,9865412),(53,1241241244),(53,124124124124214),(59,124),(60,123),(61,878945),(61,98745621),(62,124);
/*!40000 ALTER TABLE `accused_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `case_fir`
--

DROP TABLE IF EXISTS `case_fir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `case_fir` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(25) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `lawofsection` varchar(10) DEFAULT NULL,
  `fir_id` int(11) DEFAULT NULL,
  `officer_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fir_id` (`fir_id`),
  KEY `officer_id` (`officer_id`),
  CONSTRAINT `case_fir_ibfk_1` FOREIGN KEY (`fir_id`) REFERENCES `fir` (`fir_id`) ON DELETE CASCADE,
  CONSTRAINT `case_fir_ibfk_2` FOREIGN KEY (`officer_id`) REFERENCES `investigation_officer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case_fir`
--

LOCK TABLES `case_fir` WRITE;
/*!40000 ALTER TABLE `case_fir` DISABLE KEYS */;
INSERT INTO `case_fir` VALUES (1,'open','asd','asd',7,'123'),(2,'closed','asd','asd',7,'123'),(3,'closed','123','qwe',7,'123'),(4,'closed','qwe','12',7,'123'),(5,'closed','123','adsda',9,'123'),(6,'closed','ew','qwe',10,'123'),(7,'closed','qwe','qwe',11,'123'),(8,'ff','rrr','frfr',12,'123'),(9,'closed','revenge','344',14,'joydeep123'),(10,'open','heavy','344',15,'heramba'),(11,'OPEN','qwr','124',16,'heramba'),(12,'closed','murder','344',22,'lisma'),(13,'OPEN','qqweqw','q1',22,'lisma'),(14,'OPEN','qeqew','qweq',11,'lisma');
/*!40000 ALTER TABLE `case_fir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fir`
--

DROP TABLE IF EXISTS `fir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fir` (
  `fir_id` int(11) NOT NULL AUTO_INCREMENT,
  `dateTime` datetime DEFAULT NULL,
  `i_place` varchar(150) DEFAULT NULL,
  `i_dateTime` datetime DEFAULT NULL,
  `description` text,
  `p_id` varchar(15) CHARACTER SET utf8 DEFAULT NULL,
  `p_name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `ps_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`fir_id`),
  KEY `p_id` (`p_id`,`p_name`),
  CONSTRAINT `fir_ibfk_1` FOREIGN KEY (`p_id`, `p_name`) REFERENCES `petitioner` (`nic`, `name`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fir`
--

LOCK TABLES `fir` WRITE;
/*!40000 ALTER TABLE `fir` DISABLE KEYS */;
INSERT INTO `fir` VALUES (5,'2016-10-25 11:23:37','asd','2016-10-19 12:03:00','ads','asd','123',4),(6,'2016-10-25 11:28:25','asd','2016-10-20 21:03:00','ads','asd','123',5),(7,'2016-10-25 11:36:58','asd','2016-10-06 12:02:00','ads','sad','412',6),(8,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'2016-10-25 15:20:35','123132','2016-10-15 12:04:00','123','abc','123',2),(10,'2016-10-25 15:24:47','adsasd1','2016-10-13 12:03:00','231','qweq','qweqwe',3),(11,'2016-10-25 15:34:59','qewqwe','2016-10-15 12:21:00','qw','jhk','jk',3),(12,'2016-10-25 15:53:29','qqwe','2016-10-14 12:21:00','wqeq','hj','h',4),(13,'2016-10-25 16:11:39','bnn','2016-10-07 23:59:00','rfrgrg','1','dd',14),(14,'2016-10-25 16:39:58','bbsr','2011-04-22 05:00:00','asdsd assasad asdasdsad ajfjfjhfdj asdjfjfhjd ','12','JOY',1),(15,'2016-10-25 16:55:21','patia','2009-12-12 22:22:00','sapa kamudi dela ','100','heramba',2),(16,'2016-10-27 02:26:43','1asd','2016-10-19 12:32:00','asd','123123','asd',3),(22,'2016-10-27 10:12:37','bhubaneswar','2015-02-02 05:05:00','murder','1123','JOY',1),(23,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,'2016-11-08 15:45:35','as','2016-11-03 15:51:00','123','2131','qwe',2);
/*!40000 ALTER TABLE `fir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fir_status`
--

DROP TABLE IF EXISTS `fir_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fir_status` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `fir_id` int(11) DEFAULT NULL,
  `stat` char(1) DEFAULT NULL,
  `dt` datetime DEFAULT NULL,
  PRIMARY KEY (`sno`),
  KEY `fir_id` (`fir_id`),
  CONSTRAINT `fir_status_ibfk_1` FOREIGN KEY (`fir_id`) REFERENCES `fir` (`fir_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fir_status`
--

LOCK TABLES `fir_status` WRITE;
/*!40000 ALTER TABLE `fir_status` DISABLE KEYS */;
INSERT INTO `fir_status` VALUES (5,5,'0','2016-10-25 11:23:22'),(6,6,'0','2016-10-25 11:28:03'),(7,7,'1','2016-10-25 11:36:33'),(8,8,'0','2016-10-25 14:15:04'),(9,9,'1','2016-10-25 15:20:05'),(10,10,'1','2016-10-25 15:24:26'),(11,11,'1','2016-10-25 15:34:34'),(12,12,'1','2016-10-25 15:53:07'),(13,13,'1','2016-10-25 16:10:12'),(14,14,'1','2016-10-25 16:37:17'),(15,15,'1','2016-10-25 16:54:05'),(16,16,'1','2016-10-27 02:23:58'),(22,22,'1','2016-10-27 10:11:28'),(23,23,'0','2016-10-27 10:52:18'),(24,24,'1','2016-11-08 15:45:08');
/*!40000 ALTER TABLE `fir_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `sno` int(11) DEFAULT NULL,
  `imageno` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,125);
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `investigation_officer`
--

DROP TABLE IF EXISTS `investigation_officer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `investigation_officer` (
  `id` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `rank` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investigation_officer`
--

LOCK TABLES `investigation_officer` WRITE;
/*!40000 ALTER TABLE `investigation_officer` DISABLE KEYS */;
INSERT INTO `investigation_officer` VALUES ('123','123','412'),('heramba','heramba dash','sp'),('joydeep123','JOydeep mishra','sp'),('lisma','lisma','1');
/*!40000 ALTER TABLE `investigation_officer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `petitioner`
--

DROP TABLE IF EXISTS `petitioner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `petitioner` (
  `nic` varchar(15) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `name` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `f_name` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `contact` bigint(13) DEFAULT NULL,
  PRIMARY KEY (`nic`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `petitioner`
--

LOCK TABLES `petitioner` WRITE;
/*!40000 ALTER TABLE `petitioner` DISABLE KEYS */;
INSERT INTO `petitioner` VALUES ('1','dd','gt','ff',55),('100','heramba','hd1','asd asd dfg ghj',9861012),('1123','JOY','jd1','abc def ghi jkl 123',986154578),('12','JOY','JD','C-4/5,FGGD , REPT04,OOO0',96685245),('123123','asd','142','ad',12345678910),('1234','asdasd','asdasd','asdasd',4124125),('2131','qwe','qwe','qweq13',123132),('abc','123','142','412',124),('asd','123','asd','124',123),('asd','asd','dasw','asdad',241421),('asdasd','123','241','asd',241),('hj','h','jhj','hj',124124),('jhk','jk','qwe','124',142123),('null','null','null','null',NULL),('qwe','123','412','ads',123),('qweq','qweqwe','qweqwe','qweqwe`',123123),('qweqwe','124','dsadas','12412',412),('sad','412','ads','412',412);
/*!40000 ALTER TABLE `petitioner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `police_station`
--

DROP TABLE IF EXISTS `police_station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `police_station` (
  `ps_id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(100) DEFAULT NULL,
  `pincode` varchar(8) DEFAULT NULL,
  `phone_no` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`ps_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `police_station`
--

LOCK TABLES `police_station` WRITE;
/*!40000 ALTER TABLE `police_station` DISABLE KEYS */;
INSERT INTO `police_station` VALUES (1,'a-48,shahid nagar,khurda,odisha','567895','7896426799'),(2,'plot no-567,khandagiri,khurda,odisha','567898','7896555799'),(3,'890,begumpet,hyd,Andhra pradesh','567895','7896426799'),(4,'111,khaitabad,chennai,tamil nadu','567889','8996426799'),(5,'b890,bapuji nagar nagar,thiru,kerala','807895','906426799'),(6,'001,sindhi colony,bhopal,Madhya pradesh','457895','966426799'),(7,'c-607,gandhinagar,ahmedabad,gujarat','237895','9896426899'),(8,'567,bandra,mumbai,maharashtra','327895','7896426675'),(9,'3,hubli,bangalore,karnataka','566695','789642809'),(10,'bg -06,station road,secunderabad,andhra pradeshl','677895','789632457'),(11,'a-48,lithi chowk,patna,bihar','010895','7896477777'),(12,'ab-48,lucknow,khurda,uttar pradesh','58995','7896427890'),(13,'a890,duns colony,dehradun,uttrakhand','667895','7896426890'),(14,'789,banjara hills,shillong,meghalaya','567895','7896426009'),(15,'345,safilguda,panaji,goa','467895','7896426900'),(16,'a-48,west marredpally,bangalore,karnataka','367895','7896426708'),(17,'a-48,sarojini nagar,kolkata,west bengal','267895','7796426799'),(18,'a-48,sindhi colony,mumbai,maharashtra','167895','9796426799');
/*!40000 ALTER TABLE `police_station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `uname` varchar(45) DEFAULT NULL,
  `pass` char(60) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('jeswin','$2a$10$QxE5jVbvsIO2x21lFarUveWXmkLfEchffhucqKG7Dhbvq3RZgaFBa','admin'),('123','$2a$10$Pure1DeB/gVVv1SO0Lxp8.AlrbZtQow0r7tX.SxTgSynNw1rfGze2','officer'),('12345','$2a$10$XgwAZqnuZUrQlk9S.RvQrOqfS75kKopO7g82MExWQ5jLg0BMdYnze','localAuth'),('joydeep123','$2a$10$GPM1P.TYaMwAMlfuQELGR.2/LQLfypVfTNMwVxTr3s.ckNZGnitdO','officer'),('heramba','$2a$10$G/v8z0YuRItAAffPHTqOq.IG9GBosnKXdzmW4aTkTpUVJDRbCWnFm','officer'),('lisma','$2a$10$Odp.sePbFXxRwGKwSunES.jmkUYqYfdBcdOMQi6LAdjwL88G96Uli','officer'),('lisma','$2a$10$9cria25ZmWZJuVKW22WOv.OlQRrCk/rBzq./uugV1pHdUwkx/FHqW','officer'),('Minerva','$2a$10$Sd841jdF9gqPbX9ZGEFGveNUyb4C0rz8llyDfuZusgepupRUFrqy2','localAuth'),('Minerva','$2a$10$G.cDxMTgxBRiAIK61Yl/0eR3FPkT0ccdULhZ1TxcdPq6TnH0dDakO','localAuth'),('Minerva','$2a$10$O2w8wPdGKLXM1s6RTuEox.TSarAjn4pbONsn1iBGSfEgCOeKtD.xO','localAuth'),('Minerva','$2a$10$kmDOtrQ6fmZVx4xSetzKSO8yXWBC.UrPoxmzPx5amJhU15J9KVOX6','localAuth'),('minerva','$2a$10$/nP20QftJbvMij.xKStuu.qSyKGzxb7nsK1TVtcrRkl9PpOgejqNG','localAuth'),('manish','$2a$10$q.V9Jz0KS33evwGxXhqcJe4rAyJAzlvE4XdgKijv4Zabey9pnjr5m','localAuth');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `victims`
--

DROP TABLE IF EXISTS `victims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `victims` (
  `name` varchar(50) NOT NULL,
  `f_name` varchar(50) NOT NULL DEFAULT '',
  `address` varchar(100) NOT NULL DEFAULT '',
  `contact` bigint(12) DEFAULT NULL,
  `fir_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`,`address`,`fir_id`),
  KEY `fir_id` (`fir_id`),
  CONSTRAINT `victims_ibfk_1` FOREIGN KEY (`fir_id`) REFERENCES `fir` (`fir_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `victims`
--

LOCK TABLES `victims` WRITE;
/*!40000 ALTER TABLE `victims` DISABLE KEYS */;
INSERT INTO `victims` VALUES ('124','ads','124',123,7),('ads','12','asdasdasdasdasdas',12,7),('asd','213','412',142241,16),('asd','12412','asdas',124124,16),('bbb','vvv','jdfdfjdf',78945654,14),('jd','jpm','sdsd dsds sdsds o9543 df',98547412,14),('jh','hbj','hjn',1234,10),('jnkjnk','kjnkjn','kjn',124,9),('joydeep','jd1','sadhad ashdgshad asdhghsad dhsag',9852145,15),('qad','123','321',213,5),('qwe','qweq','qwe1',123123,24),('qwr','qw','qw',124124,11),('rohan','rd1','sdnasfh asdhsahd hasdha',97541256,15),('sandeep','sd1','sdhfds hfdshf sdfdsfhds',987456123,22);
/*!40000 ALTER TABLE `victims` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-09 21:27:42
