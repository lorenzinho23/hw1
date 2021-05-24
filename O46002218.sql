-- MariaDB dump 10.17  Distrib 10.4.14-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: esame
-- ------------------------------------------------------
-- Server version	10.4.14-MariaDB

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
-- Table structure for table `banca`
--

DROP TABLE IF EXISTS `banca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banca` (
  `codice_abi` int(11) NOT NULL,
  `nome` varchar(16) DEFAULT NULL,
  `immagine` varchar(255) DEFAULT NULL,
  `descrizione` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codice_abi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banca`
--

LOCK TABLES `banca` WRITE;
/*!40000 ALTER TABLE `banca` DISABLE KEYS */;
INSERT INTO `banca` VALUES (111,'UniCredit','https://confcommerciolecco.it/wp-content/uploads/2020/07/unicredit.png','Con ben 259 filiali è la banca più presente in Sicilia.','../foto/banca2.png'),(222,'BPER','https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB1e7mTF.img?h=0&w=600&m=6&q=60&u=t&o=f&l=f','Questa banca è presente in Sicilia con 93 filiali','../foto/banca5.png'),(333,'Intesa SanPaolo ','https://www.firstcisl.it/wp-content/uploads/2017/07/intesa_600x400.png','Una delle piu presenti in Sicilia, con 136 filiali.','../foto/banca7.png'),(444,'Credito Etneo',NULL,'Nasce il 30 aprile del 2000. Dispone di sei filiali: Catania, Mascalucia, Belpasso, Biancavilla, Ragalna e Paternò. Sede centrale: Catania.','../foto/banca1.png'),(555,'Creval',NULL,'Banca popolare fino al 2016, diventa poi società per azioni. Presente in 11 regioni con ben 355 filiali. Sede centrale: Sondrio','../foto/banca3.jpg'),(666,'BNL',NULL,'Fondata nel 1913, è uno dei maggiori gruppi bancari italiani con 2,5 milioni di clienti privati. Sede centrale: Roma.','../foto/banca6.png'),(777,'Montepaschi',NULL,'Fondata nel 1472: è la più antica banca in attività ed è ritenuta anche la più longeva al mondo. Sede centrale: Siena.','../foto/banca4.jpg'),(888,'Banca Carige',NULL,'Banca che può contare su 503 sportelli bancari diffusi su gran parte del territorio nazionale e oltre 1 milione di clienti. Sede centrale: Genova.','../foto/banca8.png'),(999,'CREDEM',NULL,'E\' un istituto di credito che presenta 60 sedi in Sicilia. Sede centrale: Reggio Emilia.','../foto/banca9.png');
/*!40000 ALTER TABLE `banca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `banca_piu_quotata`
--

DROP TABLE IF EXISTS `banca_piu_quotata`;
/*!50001 DROP VIEW IF EXISTS `banca_piu_quotata`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `banca_piu_quotata` (
  `banca_destinataria` tinyint NOT NULL,
  `num_prelievi` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `citta`
--

DROP TABLE IF EXISTS `citta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `citta` (
  `regione` varchar(16) DEFAULT NULL,
  `codice_citta` varchar(2) NOT NULL,
  `numero_clienti` int(11) DEFAULT 0,
  PRIMARY KEY (`codice_citta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citta`
--

LOCK TABLES `citta` WRITE;
/*!40000 ALTER TABLE `citta` DISABLE KEYS */;
INSERT INTO `citta` VALUES ('Sicilia','BP',0),('Sicilia','CT',2),('Sicilia','EN',0),('Liguria','GE',1),('Lombardia','MI',0),('Romagna','MO',0),('Campania','NA',0),('Sicilia','PA',0),('Sicilia','PT',2),('Lazio','RO',0),('Campania','SE',0),('Sicilia','SR',0),('Piemonte','TO',0),('Veneto','VE',0);
/*!40000 ALTER TABLE `citta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `codice` int(11) NOT NULL,
  `eta` int(11) DEFAULT NULL,
  `data_di_nascita` date DEFAULT NULL,
  `citta` varchar(2) DEFAULT NULL,
  `id_conto` int(11) NOT NULL,
  PRIMARY KEY (`codice`,`id_conto`),
  KEY `nome_citta` (`citta`),
  KEY `conto` (`id_conto`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`citta`) REFERENCES `citta` (`codice_citta`),
  CONSTRAINT `cliente_ibfk_2` FOREIGN KEY (`id_conto`) REFERENCES `conto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,40,'1980-10-15','CT',123),(2,80,'1940-02-12','PA',456),(3,70,'1950-11-18','VE',789),(4,100,'1920-08-10','MI',321),(5,18,'2000-05-05','BP',654),(6,70,'1950-01-05','NA',987),(7,45,'1975-11-09','BP',248),(8,21,'1999-05-14','BP',684),(10,21,'1999-05-23','BP',347),(11,21,'1999-06-10','SR',597),(12,21,'1999-06-16','PT',664),(16,22,'1999-01-16','PT',715),(20,23,'1998-04-28','GE',583),(24,22,'1999-05-24','CT',715),(25,22,'1999-05-24','CT',632);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER aggiorna_clienti
AFTER INSERT ON CLIENTE
FOR EACH ROW
BEGIN
	UPDATE CITTA SET numero_clienti = numero_clienti + 1
    WHERE codice_citta = NEW.CITTA;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `conto`
--

DROP TABLE IF EXISTS `conto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conto` (
  `id` int(11) NOT NULL,
  `saldo` int(11) DEFAULT NULL,
  `data_scadenza` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conto`
--

LOCK TABLES `conto` WRITE;
/*!40000 ALTER TABLE `conto` DISABLE KEYS */;
INSERT INTO `conto` VALUES (0,50,'2038-02-06'),(123,1240,'2024-11-10'),(183,0,'2028-01-27'),(216,0,'2026-07-11'),(222,0,'2050-12-13'),(241,0,'2037-07-09'),(248,0,'2028-11-11'),(249,0,'2033-01-10'),(253,0,'2031-05-17'),(256,0,'2047-02-27'),(281,0,'2024-10-20'),(321,0,'2030-06-15'),(347,1991,'2030-07-28'),(414,100,'2042-04-16'),(456,80,'2028-12-05'),(510,0,'2027-11-25'),(575,0,'2026-08-13'),(583,0,'2047-08-16'),(597,50,'2026-03-12'),(632,250,'2023-03-10'),(651,0,'2054-07-25'),(654,300,'2026-07-09'),(664,0,'2038-05-08'),(684,0,'2048-09-23'),(714,0,'2053-02-08'),(715,150,'2042-04-18'),(723,0,'2043-07-01'),(789,20,'2026-07-09'),(829,0,'2049-06-04'),(830,0,'2033-10-13'),(878,0,'2022-03-13'),(957,0,'2032-01-25'),(987,0,'2030-06-15');
/*!40000 ALTER TABLE `conto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dati_login`
--

DROP TABLE IF EXISTS `dati_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dati_login` (
  `id_session` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(61) DEFAULT NULL,
  `codice` int(11) DEFAULT NULL,
  `citta` varchar(2) DEFAULT NULL,
  `id_conto` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_session`),
  UNIQUE KEY `id_conto` (`id_conto`),
  KEY `codice` (`codice`),
  KEY `citta` (`citta`),
  CONSTRAINT `dati_login_ibfk_1` FOREIGN KEY (`codice`) REFERENCES `cliente` (`codice`),
  CONSTRAINT `dati_login_ibfk_2` FOREIGN KEY (`citta`) REFERENCES `cliente` (`citta`),
  CONSTRAINT `dati_login_ibfk_3` FOREIGN KEY (`id_conto`) REFERENCES `cliente` (`id_conto`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dati_login`
--

LOCK TABLES `dati_login` WRITE;
/*!40000 ALTER TABLE `dati_login` DISABLE KEYS */;
INSERT INTO `dati_login` VALUES (1,'lorenzinho1','$2y$10$B5FJcRZnLLiAFKFol39d0O5.VZv8.V.AkM6LhDrBPt1ZgztFmwhzm',10,'BP',347),(2,'matteoT','$2y$10$/RCCdGEUXxRvpmPOD609Iu1GpiCeSnH2Nc6oAfS.4zzYtR/7EVOXq',11,'SR',597),(3,'riccardoP','$2y$10$9ii2s5ZecNDOroG/T0rQsu5OUw7vUSv.XDvWPdYqvY3m0NwB3J6CO',12,'PT',123),(4,'simona16','$2y$10$89sjjUcuZpfUj1fkjZqZze4QBojeZOF0M10A02zYMFBdRHCMr6avK',16,'PT',715),(18,'prova2021','$2y$10$w9VPCS2YGzn.j76RHAoNxeFCfAkjaQE7q.i3vrHw8pmcC56iHM7vK',25,'CT',632);
/*!40000 ALTER TABLE `dati_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direttore`
--

DROP TABLE IF EXISTS `direttore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `direttore` (
  `id` int(11) NOT NULL,
  `nome` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direttore`
--

LOCK TABLES `direttore` WRITE;
/*!40000 ALTER TABLE `direttore` DISABLE KEYS */;
INSERT INTO `direttore` VALUES (1,'Giacomo'),(2,'Andrea'),(3,'Ivan'),(4,'Alessio');
/*!40000 ALTER TABLE `direttore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direzione`
--

DROP TABLE IF EXISTS `direzione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `direzione` (
  `direttore` int(11) DEFAULT NULL,
  `filiale` int(11) NOT NULL,
  PRIMARY KEY (`filiale`),
  UNIQUE KEY `direttore` (`direttore`),
  KEY `diret` (`direttore`),
  KEY `fil` (`filiale`),
  CONSTRAINT `direzione_ibfk_1` FOREIGN KEY (`direttore`) REFERENCES `direttore` (`id`),
  CONSTRAINT `direzione_ibfk_2` FOREIGN KEY (`filiale`) REFERENCES `filiale` (`codice_cab`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direzione`
--

LOCK TABLES `direzione` WRITE;
/*!40000 ALTER TABLE `direzione` DISABLE KEYS */;
INSERT INTO `direzione` VALUES (1,20),(2,21),(3,22),(4,23);
/*!40000 ALTER TABLE `direzione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eseguita`
--

DROP TABLE IF EXISTS `eseguita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eseguita` (
  `num_operazione` int(11) NOT NULL,
  `filiale_destinataria` int(11) NOT NULL,
  PRIMARY KEY (`num_operazione`,`filiale_destinataria`),
  KEY `numero_op` (`num_operazione`),
  KEY `filiale` (`filiale_destinataria`),
  CONSTRAINT `eseguita_ibfk_1` FOREIGN KEY (`num_operazione`) REFERENCES `operazione` (`numero`),
  CONSTRAINT `eseguita_ibfk_2` FOREIGN KEY (`filiale_destinataria`) REFERENCES `filiale` (`codice_cab`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eseguita`
--

LOCK TABLES `eseguita` WRITE;
/*!40000 ALTER TABLE `eseguita` DISABLE KEYS */;
INSERT INTO `eseguita` VALUES (1,20),(2,21),(3,22),(4,23),(5,24),(6,25),(7,26),(8,22),(9,24),(10,26),(11,25),(12,22),(13,27);
/*!40000 ALTER TABLE `eseguita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filiale`
--

DROP TABLE IF EXISTS `filiale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filiale` (
  `codice_cab` int(11) NOT NULL,
  `banca` int(11) NOT NULL,
  PRIMARY KEY (`codice_cab`,`banca`),
  KEY `nome_banca` (`banca`),
  CONSTRAINT `filiale_ibfk_1` FOREIGN KEY (`banca`) REFERENCES `banca` (`codice_abi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filiale`
--

LOCK TABLES `filiale` WRITE;
/*!40000 ALTER TABLE `filiale` DISABLE KEYS */;
INSERT INTO `filiale` VALUES (20,111),(21,222),(22,333),(23,444),(24,555),(25,666),(26,777),(27,333);
/*!40000 ALTER TABLE `filiale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `impiegato`
--

DROP TABLE IF EXISTS `impiegato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `impiegato` (
  `id` int(11) NOT NULL,
  `nome` varchar(16) DEFAULT NULL,
  `stipendio` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `impiegato`
--

LOCK TABLES `impiegato` WRITE;
/*!40000 ALTER TABLE `impiegato` DISABLE KEYS */;
INSERT INTO `impiegato` VALUES (1,'Riccardo',5000),(2,'Eugenio',8000),(3,'Andrea',5000),(4,'Luca',9000),(5,'Giacomo',1000),(6,'Aldo',5000),(7,'Nicola',8000);
/*!40000 ALTER TABLE `impiegato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lavora`
--

DROP TABLE IF EXISTS `lavora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lavora` (
  `impiegato` int(11) NOT NULL,
  `filiale` int(11) NOT NULL,
  `anno_inizio` date DEFAULT NULL,
  `anno_fine` date DEFAULT NULL,
  PRIMARY KEY (`impiegato`,`filiale`),
  KEY `new_impiegato` (`impiegato`),
  KEY `new_filiale` (`filiale`),
  CONSTRAINT `lavora_ibfk_1` FOREIGN KEY (`impiegato`) REFERENCES `impiegato` (`id`),
  CONSTRAINT `lavora_ibfk_2` FOREIGN KEY (`filiale`) REFERENCES `filiale` (`codice_cab`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lavora`
--

LOCK TABLES `lavora` WRITE;
/*!40000 ALTER TABLE `lavora` DISABLE KEYS */;
INSERT INTO `lavora` VALUES (1,20,'2010-05-10',NULL),(2,21,'2004-04-11','2017-10-21'),(3,22,'2008-07-12','2018-07-10'),(4,20,'2011-09-10','2020-11-19'),(5,24,'2018-08-11',NULL),(6,20,'2017-04-14',NULL),(7,20,'2014-04-14','2020-12-24');
/*!40000 ALTER TABLE `lavora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `max_prelievo`
--

DROP TABLE IF EXISTS `max_prelievo`;
/*!50001 DROP VIEW IF EXISTS `max_prelievo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `max_prelievo` (
  `banca_destinataria` tinyint NOT NULL,
  `somma` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `media`
--

DROP TABLE IF EXISTS `media`;
/*!50001 DROP VIEW IF EXISTS `media`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `media` (
  `num` tinyint NOT NULL,
  `anno` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mutuo`
--

DROP TABLE IF EXISTS `mutuo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mutuo` (
  `numero_operazione` int(11) NOT NULL,
  `id_conto` int(11) NOT NULL,
  `data` date DEFAULT NULL,
  `num_rate` int(11) DEFAULT NULL,
  PRIMARY KEY (`numero_operazione`,`id_conto`),
  KEY `numero` (`numero_operazione`),
  KEY `conto` (`id_conto`),
  CONSTRAINT `mutuo_ibfk_1` FOREIGN KEY (`numero_operazione`) REFERENCES `operazione` (`numero`),
  CONSTRAINT `mutuo_ibfk_2` FOREIGN KEY (`id_conto`) REFERENCES `conto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mutuo`
--

LOCK TABLES `mutuo` WRITE;
/*!40000 ALTER TABLE `mutuo` DISABLE KEYS */;
INSERT INTO `mutuo` VALUES (1,456,'2019-10-11',12),(2,789,'2007-04-08',21),(3,123,'2014-06-14',16),(4,654,'2018-05-16',20),(5,321,'2000-01-21',15),(6,987,'2020-05-05',19),(150,632,'2020-05-24',24);
/*!40000 ALTER TABLE `mutuo` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER aggiungi_operazione_mutuo
BEFORE INSERT ON MUTUO
FOR EACH ROW 
BEGIN 
	INSERT INTO OPERAZIONE VALUES (NEW.numero_operazione, NEW.id_conto);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `operazione`
--

DROP TABLE IF EXISTS `operazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operazione` (
  `numero` int(11) NOT NULL,
  `id_conto` int(11) DEFAULT NULL,
  PRIMARY KEY (`numero`),
  KEY `conto` (`id_conto`),
  CONSTRAINT `operazione_ibfk_1` FOREIGN KEY (`id_conto`) REFERENCES `conto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operazione`
--

LOCK TABLES `operazione` WRITE;
/*!40000 ALTER TABLE `operazione` DISABLE KEYS */;
INSERT INTO `operazione` VALUES (3,123),(7,123),(11,123),(14,123),(12,248),(5,321),(9,321),(20,347),(21,347),(22,347),(25,347),(27,347),(130,347),(343,347),(362,347),(430,347),(559,347),(560,347),(568,347),(586,347),(689,347),(738,347),(749,347),(855,347),(876,347),(927,347),(1,456),(659,597),(150,632),(888,632),(4,654),(656,715),(2,789),(8,789),(6,987),(10,987),(13,987);
/*!40000 ALTER TABLE `operazione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preferiti`
--

DROP TABLE IF EXISTS `preferiti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preferiti` (
  `id_session` int(11) NOT NULL,
  `id_preferito` int(11) NOT NULL,
  PRIMARY KEY (`id_session`,`id_preferito`),
  KEY `sessione` (`id_session`),
  CONSTRAINT `preferiti_ibfk_1` FOREIGN KEY (`id_session`) REFERENCES `dati_login` (`id_session`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preferiti`
--

LOCK TABLES `preferiti` WRITE;
/*!40000 ALTER TABLE `preferiti` DISABLE KEYS */;
INSERT INTO `preferiti` VALUES (2,777);
/*!40000 ALTER TABLE `preferiti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prelievo`
--

DROP TABLE IF EXISTS `prelievo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prelievo` (
  `numero_operazione` int(11) NOT NULL,
  `id_conto` int(11) NOT NULL,
  `importo` int(11) DEFAULT NULL,
  `banca_destinataria` int(11) DEFAULT NULL,
  PRIMARY KEY (`numero_operazione`,`id_conto`),
  KEY `numero` (`numero_operazione`),
  KEY `conto` (`id_conto`),
  KEY `banca` (`banca_destinataria`),
  CONSTRAINT `prelievo_ibfk_1` FOREIGN KEY (`numero_operazione`) REFERENCES `operazione` (`numero`),
  CONSTRAINT `prelievo_ibfk_2` FOREIGN KEY (`id_conto`) REFERENCES `conto` (`id`),
  CONSTRAINT `prelievo_ibfk_3` FOREIGN KEY (`banca_destinataria`) REFERENCES `banca` (`codice_abi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prelievo`
--

LOCK TABLES `prelievo` WRITE;
/*!40000 ALTER TABLE `prelievo` DISABLE KEYS */;
INSERT INTO `prelievo` VALUES (7,123,200,777),(8,789,80,333),(9,321,10,555),(10,987,50,777),(11,123,50,666),(12,248,5,333),(13,987,150,333),(14,123,500,333);
/*!40000 ALTER TABLE `prelievo` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER aggiungi_operazione_prelievo
BEFORE INSERT ON PRELIEVO
FOR EACH ROW 
BEGIN 
	INSERT INTO OPERAZIONE VALUES (NEW.numero_operazione, NEW.id_conto);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `registro`
--

DROP TABLE IF EXISTS `registro`;
/*!50001 DROP VIEW IF EXISTS `registro`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `registro` (
  `id` tinyint NOT NULL,
  `nome` tinyint NOT NULL,
  `stipendio` tinyint NOT NULL,
  `filiale` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sede`
--

DROP TABLE IF EXISTS `sede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sede` (
  `banca` int(11) NOT NULL,
  `citta` varchar(2) NOT NULL,
  PRIMARY KEY (`banca`,`citta`),
  KEY `nome_banca` (`banca`),
  KEY `nome_citta` (`citta`),
  CONSTRAINT `sede_ibfk_1` FOREIGN KEY (`banca`) REFERENCES `banca` (`codice_abi`),
  CONSTRAINT `sede_ibfk_2` FOREIGN KEY (`citta`) REFERENCES `citta` (`codice_citta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sede`
--

LOCK TABLES `sede` WRITE;
/*!40000 ALTER TABLE `sede` DISABLE KEYS */;
INSERT INTO `sede` VALUES (111,'MI'),(222,'MO'),(333,'TO'),(444,'NA'),(555,'VE'),(666,'MI'),(777,'RO'),(888,'PA'),(999,'SR');
/*!40000 ALTER TABLE `sede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versamento`
--

DROP TABLE IF EXISTS `versamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `versamento` (
  `numero_operazione` int(11) NOT NULL AUTO_INCREMENT,
  `id_conto` int(11) NOT NULL,
  `importo` int(11) DEFAULT NULL,
  PRIMARY KEY (`numero_operazione`,`id_conto`),
  KEY `numero` (`numero_operazione`),
  KEY `conto` (`id_conto`),
  CONSTRAINT `versamento_ibfk_1` FOREIGN KEY (`numero_operazione`) REFERENCES `operazione` (`numero`),
  CONSTRAINT `versamento_ibfk_2` FOREIGN KEY (`id_conto`) REFERENCES `conto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=928 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versamento`
--

LOCK TABLES `versamento` WRITE;
/*!40000 ALTER TABLE `versamento` DISABLE KEYS */;
INSERT INTO `versamento` VALUES (130,347,10),(343,347,1),(362,347,1),(430,347,1),(559,347,5),(560,347,2),(568,347,6),(586,347,10),(656,715,150),(659,597,50),(689,347,1),(738,347,5),(749,347,50),(855,347,2),(876,347,5),(888,632,250),(927,347,5);
/*!40000 ALTER TABLE `versamento` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER aggiungi_operazione_versamento
BEFORE INSERT ON VERSAMENTO
FOR EACH ROW
BEGIN
	INSERT INTO OPERAZIONE VALUES (NEW.numero_operazione, NEW.id_conto);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER aggiorna_saldo_post_versamento
AFTER INSERT ON VERSAMENTO
FOR EACH ROW
BEGIN
	UPDATE CONTO set saldo = saldo + NEW.importo
    WHERE NEW.id_conto = id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'esame'
--

--
-- Dumping routines for database 'esame'
--
/*!50003 DROP PROCEDURE IF EXISTS `P1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `P1`(IN anno YEAR)
BEGIN
DROP TEMPORARY TABLE IF EXISTS nummutui;
CREATE TEMPORARY TABLE nummutui
(
	conta INTEGER,
	anno YEAR,
    num_rate INTEGER
);
INSERT INTO nummutui
	SELECT COUNT(*), YEAR(data), SUM(num_rate) 
    FROM MUTUO
    WHERE YEAR(data) >= anno AND num_rate >= 18
    GROUP BY YEAR(data);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `P2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `P2`(IN filiale INTEGER)
BEGIN
select *
from registro R
where EXISTS (select *
			from registro R1
            where R1.stipendio=R.stipendio and R1.id<>R.id and filiale = R1.filiale and filiale = R.filiale );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `P3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `P3`(IN bonus_anziani INTEGER, IN bonus_giovani INTEGER)
BEGIN
	UPDATE CONTO CO JOIN CLIENTE C on CO.id = C.id_conto SET CO.saldo = 
    CASE
		WHEN (C.eta < 60)
			THEN CO.saldo + bonus_giovani
		ELSE
			CO.saldo + bonus_anziani
	END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `P4` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `P4`(IN regione VARCHAR(16))
BEGIN
SELECT COUNT(*) AS numero_clienti, CI.codice_citta AS provincia_citta
FROM CLIENTE C JOIN CITTA CI on C.citta = CI.codice_citta
WHERE regione = CI.regione
GROUP BY CI.codice_citta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `banca_piu_quotata`
--

/*!50001 DROP TABLE IF EXISTS `banca_piu_quotata`*/;
/*!50001 DROP VIEW IF EXISTS `banca_piu_quotata`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `banca_piu_quotata` AS select `prelievo`.`banca_destinataria` AS `banca_destinataria`,count(`prelievo`.`banca_destinataria`) AS `num_prelievi` from `prelievo` group by `prelievo`.`banca_destinataria` having `num_prelievi` >= all (select count(`prelievo`.`banca_destinataria`) from `prelievo` group by `prelievo`.`banca_destinataria`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `max_prelievo`
--

/*!50001 DROP TABLE IF EXISTS `max_prelievo`*/;
/*!50001 DROP VIEW IF EXISTS `max_prelievo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `max_prelievo` AS select `p`.`banca_destinataria` AS `banca_destinataria`,sum(`p`.`importo`) AS `somma` from (`prelievo` `p` join `banca` `b` on(`p`.`banca_destinataria` = `b`.`codice_abi`)) group by `p`.`banca_destinataria` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `media`
--

/*!50001 DROP TABLE IF EXISTS `media`*/;
/*!50001 DROP VIEW IF EXISTS `media`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `media` AS select count(0) AS `num`,year(`mutuo`.`data`) AS `anno` from `mutuo` group by year(`mutuo`.`data`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `registro`
--

/*!50001 DROP TABLE IF EXISTS `registro`*/;
/*!50001 DROP VIEW IF EXISTS `registro`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `registro` AS select `i`.`id` AS `id`,`i`.`nome` AS `nome`,`i`.`stipendio` AS `stipendio`,`l`.`filiale` AS `filiale` from (`impiegato` `i` join `lavora` `l` on(`i`.`id` = `l`.`impiegato`)) */;
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

-- Dump completed on 2021-05-24 17:55:54
