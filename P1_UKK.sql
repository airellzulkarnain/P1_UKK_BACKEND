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
INSERT INTO `catatan_perjalanan` VALUES ('2005-10-27','11:20:05','dimana yaaa','1111111111111111',33.6),('2002-12-22','11:00:05','dimana hayoo','1111111111111112',35.6),('2002-12-22','11:00:00','dimana hayoo','1111111111111112',35.6),('2002-12-22','11:00:00','dimana hayoo','1111111111111113',35.6),('2002-12-22','12:00:00','dimana hayoo','1111111111111114',35.6),('2002-12-22','12:00:00','dimana hayoo','1111111111111114',32.6),('2002-12-22','10:00:00','dimana hayoo','1111111111111114',32.6),('2022-05-06','22:59:37','string','1111111111111111',0.0),('2022-05-24','15:28:50','adfasdf','1111111111111111',0.0),('2022-05-24','15:28:50','adfasdf','1111111111111111',0.0),('2022-03-24','17:28:00','sdfasdf','1111111111111111',35.0),('2022-12-12','12:12:12','sdfasfd','1111111111111111',30.0),('2022-05-24','12:12:12','adasdfas','1111111111111111',40.0),('2022-05-24','22:00:01','Medina','1111111111111125',30.0),('2022-03-04','20:10:25','Rumah Duka Heavens','1111111111111125',34.5),('2005-10-27','24:00:00','Bojong Nangka','1111111111111111',20.5),('2012-12-12','12:12:12','Tangerang','1111111111111111',13.0),('1111-11-11','11:11:11','DKI Jakarta','1111111111111111',11.1),('1212-12-12','12:12:12','12','1111111111111111',12.1),('0212-12-12','21:12:21','212','1111111111111111',21.2),('2022-05-31','07:33:00','Perum. Dasana Indah','1111111111111111',36.5),('2022-06-24','14:57:12','string','1111111111111111',0.0),('2022-06-24','14:57:12','string','1111111111111111',0.0),('2020-02-02','10:10:10','asdfsf','1111111111111111',30.0),('2022-06-02','20:22:00','Tangerang','1234567890123456',35.0),('2022-02-02','10:10:10','Tangerang','1234567890123456',36.0),('2022-10-15','15:44:01','Tangerang','1908199627031996',35.0),('2001-01-01','01:01:01','Merkurius','2020202020202020',34.0),('2021-10-15','12:10:01','Serang','1908199627031996',34.0),('2002-02-02','02:02:02','Venus','2020202020202020',35.0),('2015-10-15','12:15:01','Kotabumi','1908199627031996',33.0),('2003-03-03','03:03:03','Bumi','2020202020202020',36.0),('2016-10-15','15:15:01','Sepatan','1908199627031996',34.5),('2004-04-04','04:04:04','mars','2020202020202020',34.0),('2017-10-15','15:19:01','Pisangan Jaya','1908199627031996',34.7),('2005-05-05','05:05:05','pluto','2020202020202020',36.0),('2018-10-15','10:19:01','Kelapadua','1908199627031996',35.7),('2006-06-06','06:06:06','dadap','2020202020202020',34.0),('2019-10-15','13:19:01','Perumnas Karawaci','1908199627031996',35.9),('2007-07-07','07:07:07','TNG','2020202020202020',35.0),('2020-10-15','17:10:01','Bojong Kenyot','1908199627031996',33.9),('2021-10-15','19:10:01','Benda baru','1908199627031996',36.8),('2008-08-08','08:08:08','PKM','2020202020202020',36.0),('2022-10-15','15:10:15','Sepatan','1908199627031996',36.8),('2009-09-09','09:09:09','SUB','2020202020202020',35.0),('2010-10-10','10:10:10','JKT','2020202020202020',37.0),('2022-08-19','19:08:00','Tangerang','1908199627031996',35.9),('2002-08-08','19:08:00','Pondok Jaya','1908199627031996',35.6),('2011-11-11','11:11:11','URANUS','2020202020202020',35.0),('2020-01-13','14:45:01','Karawaci','1908199627031996',38.0),('2012-12-12','12:12:12','KARAWACI','2020202020202020',35.0),('2012-12-13','13:13:13','BLARAJA','2020202020202020',36.0),('2020-12-15','13:45:01','Taman Ubud','1908199627031996',38.9),('2012-12-14','14:14:14','JAKSEL','2020202020202020',35.0),('2012-12-15','15:15:15','JAKUT','2020202020202020',36.0),('2022-09-08','06:45:01','Tari Kolot','1908199627031996',34.1),('2015-01-01','15:15:15','JAKBAR','2020202020202020',34.0),('2022-01-20','10:45:01','Bekasi','1908199627031996',39.0),('2015-01-02','15:15:20','TANGSEL','2020202020202020',36.0),('2022-03-23','10:01:02','Cilegon','1908199627031996',41.0),('2015-01-03','15:30:25','KOTBUM','2020202020202020',35.0),('2015-01-04','16:40:30','KARAWANG','2020202020202020',36.0),('2022-05-16','05:59:01','Yogyakarta','1908199627031996',35.1),('2022-12-12','11:03:01','Yogyakarta','1908199627031996',35.1),('2015-01-05','16:50:40','CIKARANG','2020202020202020',35.0),('2022-04-26','15:03:01','Pamulang','1908199627031996',36.0),('2015-01-05','16:50:40','CIKARANG','2020202020202020',35.0),('2016-02-01','17:10:10','DM','2020202020202020',36.0),('2020-01-09','08:30:40','Jakarta','1908199627031996',39.0),('2016-02-02','17:20:20','BATU CEPER','2020202020202020',35.0),('2016-03-03','17:30:30','PDK INDAH','2020202020202020',36.0),('2016-04-04','17:35:35','PDK KAPUK','2020202020202020',35.0),('2016-05-05','17:40:40','PDK ARUM','2020202020202020',36.0),('1996-08-19','14:04:05','Kosambi','1908199627031996',36.0),('2016-06-06','17:45:45','PDK CABE','2020202020202020',37.0),('2017-06-06','17:50:50','PDK AREN','2020202020202020',34.0),('1998-09-19','13:04:08','Jambi','1908199627031996',34.0),('2017-07-07','18:00:00','PDK BUMI','2020202020202020',36.0),('2017-08-08','18:08:08','PDK ALAM','2020202020202020',35.0),('2017-09-09','18:09:09','PDK JUDI','2020202020202020',37.0),('2023-08-20','18:01:00','Hayam Wuruk','1908199627031996',38.0),('2009-01-19','14:03:01','Lampung','1908199627031996',32.0),('2022-03-03','15:03:01','Jombang','1908199627031996',36.0),('2025-03-03','07:03:01','Jateng','1908199627031996',36.0),('2025-07-05','03:01:01','Kemiri','1908199627031996',39.0),('2022-09-01','14:52:01','Purukambera','1908199627031996',36.0),('2024-12-25','17:03:03','Palembang','1908199627031996',35.1);
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
INSERT INTO `user` VALUES ('1111111111111111','bambang','AIRELL'),('1111111111111112','dimas','AIRELL'),('1111111111111113','eka','AIRELL'),('1111111111111114','wanda','AIRELL'),('1111111111111115','alena','AIRELL'),('1111111111111125','bambang_12',NULL),('1111131111111111','bambang','AIRELL'),('1212131314141515','wakakwakak',''),('1212131314141516','wakakwakak',''),('1212131314141586','wakakwakak',''),('1213141516171819','bambang ini bambang',NULL),('1234567890123456','Dev',NULL),('1908199627031996','Dede Tri Kurniawan',NULL),('2020202020202020','Putri_Zerista',NULL),('2020202120222023','1111','stri11ng'),('2222222222222222',NULL,NULL),('2223242526272829','just another thing i wanted','some path XD'),('5824731043079584','string','string'),('6666666666666666','666',NULL),('7777777777777777','7777',NULL),('8888888888888888','88888888',NULL),('9999999999999999','99999999',NULL);
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

-- Dump completed on 2022-07-01 11:31:50
