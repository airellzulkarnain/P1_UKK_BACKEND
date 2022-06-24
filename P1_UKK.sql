-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: P1UKK
-- ------------------------------------------------------
-- Server version	8.0.29-0ubuntu0.22.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `catatan_perjalanan`
--

DROP TABLE IF EXISTS `catatan_perjalanan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catatan_perjalanan` (
  `tanggal` date NOT NULL,
  `waktu` time NOT NULL,
  `lokasi` varchar(100) NOT NULL,
  `NIK` varchar(16) NOT NULL,
  `suhu_tubuh` decimal(3,1) NOT NULL,
  KEY `FK_NIK` (`NIK`),
  CONSTRAINT `FK_NIK` FOREIGN KEY (`NIK`) REFERENCES `user` (`NIK`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catatan_perjalanan`
--

LOCK TABLES `catatan_perjalanan` WRITE;
/*!40000 ALTER TABLE `catatan_perjalanan` DISABLE KEYS */;
INSERT INTO `catatan_perjalanan` VALUES ('2005-10-27','11:20:05','dimana yaaa','1111111111111111',33.6),('2002-12-22','11:00:05','dimana hayoo','1111111111111112',35.6),('2002-12-22','11:00:00','dimana hayoo','1111111111111112',35.6),('2002-12-22','11:00:00','dimana hayoo','1111111111111113',35.6),('2002-12-22','12:00:00','dimana hayoo','1111111111111114',35.6),('2002-12-22','12:00:00','dimana hayoo','1111111111111114',32.6),('2002-12-22','10:00:00','dimana hayoo','1111111111111114',32.6),('2022-05-06','22:59:37','string','1111111111111111',0.0),('2022-05-24','15:28:50','adfasdf','1111111111111111',0.0),('2022-05-24','15:28:50','adfasdf','1111111111111111',0.0),('2022-03-24','17:28:00','sdfasdf','1111111111111111',35.0),('2022-12-12','12:12:12','sdfasfd','1111111111111111',30.0),('2022-05-24','12:12:12','adasdfas','1111111111111111',40.0),('2022-05-24','22:00:01','Medina','1111111111111125',30.0),('2022-03-04','20:10:25','Rumah Duka Heavens','1111111111111125',34.5),('2005-10-27','24:00:00','Bojong Nangka','1111111111111111',20.5),('2012-12-12','12:12:12','Tangerang','1111111111111111',13.0),('1111-11-11','11:11:11','DKI Jakarta','1111111111111111',11.1),('1212-12-12','12:12:12','12','1111111111111111',12.1),('0212-12-12','21:12:21','212','1111111111111111',21.2),('2022-05-31','07:33:00','Perum. Dasana Indah','1111111111111111',36.5);
/*!40000 ALTER TABLE `catatan_perjalanan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testtime`
--

DROP TABLE IF EXISTS `testtime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testtime` (
  `timer` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testtime`
--

LOCK TABLES `testtime` WRITE;
/*!40000 ALTER TABLE `testtime` DISABLE KEYS */;
INSERT INTO `testtime` VALUES ('10:10:10'),('04:00:00'),('04:32:00');
/*!40000 ALTER TABLE `testtime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `NIK` varchar(17) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `profile` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`NIK`),
  CONSTRAINT `user_chk_1` CHECK ((length(`NIK`) = 16)),
  CONSTRAINT `user_chk_2` CHECK (((length(`NIK`) = 16) and regexp_like(`NIK`,_utf8mb4'^[0-9]+$'))),
  CONSTRAINT `user_chk_3` CHECK (((length(`NIK`) = 16) and regexp_like(`NIK`,_utf8mb4'^[0-9]+$')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('1111111111111111','bambang','AIRELL'),('1111111111111112','dimas','AIRELL'),('1111111111111113','eka','AIRELL'),('1111111111111114','wanda','AIRELL'),('1111111111111115','alena','AIRELL'),('1111111111111125','bambang_12',NULL),('1111131111111111','bambang','AIRELL'),('1212131314141515','wakakwakak',''),('1212131314141516','wakakwakak',''),('1212131314141586','wakakwakak',''),('1213141516171819','bambang ini bambang',NULL),('2020202120222023','1111','stri11ng'),('2222222222222222',NULL,NULL),('2223242526272829','just another thing i wanted','some path XD'),('5824731043079584','string','string'),('6666666666666666','666',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-24 13:28:32
