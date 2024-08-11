-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: dna_project
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.22.04.1

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
-- Current Database: `dna_project`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dna_project` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `dna_project`;

--
-- Table structure for table `Aftermath`
--

DROP TABLE IF EXISTS `Aftermath`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Aftermath` (
  `CountryName` varchar(255) NOT NULL,
  `No_ofRefugees` int DEFAULT NULL,
  `Expenditure` float DEFAULT NULL,
  `MilitaryDeaths` int DEFAULT NULL,
  `CivilianDeaths` int DEFAULT NULL,
  `CountryRelation` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CountryName`),
  KEY `CountryRelation` (`CountryRelation`),
  KEY `MilitaryDeaths` (`MilitaryDeaths`,`CivilianDeaths`),
  CONSTRAINT `Aftermath_ibfk_1` FOREIGN KEY (`CountryRelation`) REFERENCES `Countries` (`Name`),
  CONSTRAINT `Aftermath_ibfk_2` FOREIGN KEY (`MilitaryDeaths`, `CivilianDeaths`) REFERENCES `MilitaryDeaths` (`militarydeaths`, `civiliandeaths`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Aftermath`
--

LOCK TABLES `Aftermath` WRITE;
/*!40000 ALTER TABLE `Aftermath` DISABLE KEYS */;
INSERT INTO `Aftermath` VALUES ('France',250000,300000000,600000,400000,'France'),('Germany',500000,250000000,4000000,3000000,'Germany'),('Italy',100000,80000000,2000000,1500000,'Italy'),('Japan',20000,120000000,1500000,1000000,'Japan'),('Soviet Union',1000000,600000000,9000000,7000000,'Soviet Union'),('United Kingdom',300000,350000000,700000,500000,'United Kingdom'),('United States',700000,900000000,400000,300000,'United States');
/*!40000 ALTER TABLE `Aftermath` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BombingCampaigns`
--

DROP TABLE IF EXISTS `BombingCampaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BombingCampaigns` (
  `dateid` int NOT NULL,
  `Countrybombed` varchar(255) NOT NULL,
  `Countrydroppingthebomb` varchar(255) DEFAULT NULL,
  `Casualties` int DEFAULT NULL,
  `BombsUsed` varchar(255) DEFAULT NULL,
  `Wounded` int DEFAULT NULL,
  PRIMARY KEY (`Countrybombed`,`dateid`),
  KEY `dateid` (`dateid`),
  KEY `Countrydroppingthebomb` (`Countrydroppingthebomb`),
  CONSTRAINT `BombingCampaigns_ibfk_1` FOREIGN KEY (`dateid`) REFERENCES `date` (`dateid`),
  CONSTRAINT `BombingCampaigns_ibfk_2` FOREIGN KEY (`Countrydroppingthebomb`) REFERENCES `Countries` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BombingCampaigns`
--

LOCK TABLES `BombingCampaigns` WRITE;
/*!40000 ALTER TABLE `BombingCampaigns` DISABLE KEYS */;
INSERT INTO `BombingCampaigns` VALUES (4,'France','Germany',2000,'Explosive Bombs',800),(2,'Germany','United Kingdom',3000,'Incendiary Bombs',1500),(5,'Germany','United States',2500,'Incendiary Bombs',1200),(3,'Japan','United States',10000,'Atomic Bombs',5000),(1,'United Kingdom','Germany',5000,'Explosive Bombs',2000);
/*!40000 ALTER TABLE `BombingCampaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Casualties`
--

DROP TABLE IF EXISTS `Casualties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Casualties` (
  `NationalID` int NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Rank_position` varchar(255) DEFAULT NULL,
  `Diedon` date DEFAULT NULL,
  `PlaceofDeath` varchar(255) DEFAULT NULL,
  `Nationality` varchar(255) DEFAULT NULL,
  `DiedinBombing` tinyint(1) DEFAULT NULL,
  `CountryBombed` varchar(255) DEFAULT NULL,
  `dateID` int DEFAULT NULL,
  PRIMARY KEY (`NationalID`),
  KEY `dateID` (`dateID`),
  KEY `CountryBombed` (`CountryBombed`),
  KEY `Nationality` (`Nationality`),
  CONSTRAINT `Casualties_ibfk_1` FOREIGN KEY (`dateID`) REFERENCES `BombingCampaigns` (`dateid`),
  CONSTRAINT `Casualties_ibfk_2` FOREIGN KEY (`Nationality`) REFERENCES `Countries` (`Name`),
  CONSTRAINT `Casualties_ibfk_3` FOREIGN KEY (`CountryBombed`) REFERENCES `BombingCampaigns` (`Countrybombed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Casualties`
--

LOCK TABLES `Casualties` WRITE;
/*!40000 ALTER TABLE `Casualties` DISABLE KEYS */;
INSERT INTO `Casualties` VALUES (1,'John Doe','Private','1943-06-12','Rennes','France',1,'France',4),(2,'Jane Smith','Sergeant','1944-08-20','Pacific Ocean','United Kingdom',0,NULL,NULL),(3,'Ivan Petrov','Captain','1942-02-15','Stalingrad','Soviet Union',0,NULL,NULL),(4,'Helga Müller','Nurse','1941-09-05','London','Germany',1,'Germany',5),(5,'Yoshiko Tanaka','Lieutenant','1945-04-10','Tokyo','Japan',1,'Japan',3);
/*!40000 ALTER TABLE `Casualties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Countries`
--

DROP TABLE IF EXISTS `Countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Countries` (
  `Name` varchar(255) NOT NULL,
  `Allegiance` varchar(255) DEFAULT NULL,
  `PoliticalLeader` varchar(255) DEFAULT NULL,
  `TotalpopulationatStartofWar` int DEFAULT NULL,
  `InvadingCountry` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Name`),
  KEY `InvadingCountry` (`InvadingCountry`),
  CONSTRAINT `Countries_ibfk_1` FOREIGN KEY (`InvadingCountry`) REFERENCES `Countries` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Countries`
--

LOCK TABLES `Countries` WRITE;
/*!40000 ALTER TABLE `Countries` DISABLE KEYS */;
INSERT INTO `Countries` VALUES ('France','Allies','Édouard Daladier',41000000,'Germany'),('Germany','Axis','Adolf Hitler',79000000,'United States'),('Italy','Axis','Benito Mussolini',44000000,'United Kingdom'),('Japan','Axis','Emperor Hirohito',71000000,'Soviet Union'),('Soviet Union','Allies','Joseph Stalin',168000000,'Germany'),('United Kingdom','Allies','Neville Chamberlain',48000000,'Germany'),('United States','Allies','Franklin D. Roosevelt',131000000,NULL);
/*!40000 ALTER TABLE `Countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Countryagriculturallossgain`
--

DROP TABLE IF EXISTS `Countryagriculturallossgain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Countryagriculturallossgain` (
  `CountryName` varchar(255) NOT NULL,
  `AgriculturalLoss_Gain` int DEFAULT NULL,
  PRIMARY KEY (`CountryName`),
  CONSTRAINT `Countryagriculturallossgain_ibfk_1` FOREIGN KEY (`CountryName`) REFERENCES `Aftermath` (`CountryName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Countryagriculturallossgain`
--

LOCK TABLES `Countryagriculturallossgain` WRITE;
/*!40000 ALTER TABLE `Countryagriculturallossgain` DISABLE KEYS */;
INSERT INTO `Countryagriculturallossgain` VALUES ('France',-250000),('Germany',-200000),('Italy',-120000),('Japan',-150000),('Soviet Union',-300000),('United Kingdom',-100000),('United States',-500000);
/*!40000 ALTER TABLE `Countryagriculturallossgain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Countryindustriallossgain`
--

DROP TABLE IF EXISTS `Countryindustriallossgain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Countryindustriallossgain` (
  `CountryName` varchar(255) NOT NULL,
  `IndustrialLoss_Gain` int DEFAULT NULL,
  PRIMARY KEY (`CountryName`),
  CONSTRAINT `Countryindustriallossgain_ibfk_1` FOREIGN KEY (`CountryName`) REFERENCES `Aftermath` (`CountryName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Countryindustriallossgain`
--

LOCK TABLES `Countryindustriallossgain` WRITE;
/*!40000 ALTER TABLE `Countryindustriallossgain` DISABLE KEYS */;
INSERT INTO `Countryindustriallossgain` VALUES ('France',-2000000),('Germany',-10000000),('Italy',-4000000),('Japan',-6000000),('Soviet Union',-8000000),('United Kingdom',-3000000),('United States',-5000000);
/*!40000 ALTER TABLE `Countryindustriallossgain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Countrylandlossgain`
--

DROP TABLE IF EXISTS `Countrylandlossgain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Countrylandlossgain` (
  `CountryName` varchar(255) NOT NULL,
  `LandLost_Gained` int DEFAULT NULL,
  PRIMARY KEY (`CountryName`),
  CONSTRAINT `Countrylandlossgain_ibfk_1` FOREIGN KEY (`CountryName`) REFERENCES `Aftermath` (`CountryName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Countrylandlossgain`
--

LOCK TABLES `Countrylandlossgain` WRITE;
/*!40000 ALTER TABLE `Countrylandlossgain` DISABLE KEYS */;
INSERT INTO `Countrylandlossgain` VALUES ('France',-1500),('Germany',-5000),('Italy',-1000),('Japan',-3000),('Soviet Union',8000),('United Kingdom',-2000),('United States',10000);
/*!40000 ALTER TABLE `Countrylandlossgain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InfluentialPersonalities`
--

DROP TABLE IF EXISTS `InfluentialPersonalities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `InfluentialPersonalities` (
  `Name` varchar(255) NOT NULL,
  `DOBID` int DEFAULT NULL,
  `Gender` char(1) DEFAULT NULL,
  `Nationality` varchar(255) DEFAULT NULL,
  `Occupation` varchar(255) DEFAULT NULL,
  `RoleintheWar` varchar(255) DEFAULT NULL,
  `countryassociatedwith` varchar(255) DEFAULT NULL,
  `countryname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Name`),
  KEY `DOBID` (`DOBID`),
  KEY `countryname` (`countryname`),
  CONSTRAINT `InfluentialPersonalities_ibfk_1` FOREIGN KEY (`DOBID`) REFERENCES `personalityage` (`DOBID`) ON DELETE CASCADE,
  CONSTRAINT `InfluentialPersonalities_ibfk_2` FOREIGN KEY (`countryname`) REFERENCES `Countries` (`Name`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InfluentialPersonalities`
--

LOCK TABLES `InfluentialPersonalities` WRITE;
/*!40000 ALTER TABLE `InfluentialPersonalities` DISABLE KEYS */;
INSERT INTO `InfluentialPersonalities` VALUES ('Adolf Hitler',4,'M','German','Chancellor','Military and Political Leader','Germany','Germany'),('Albert Einstein',1,'M','German','Physicist','Scientific Advisor','United States','Germany'),('Franklin D. Roosevelt',5,'M','American','President','Political Leader','United States','United States'),('J. Robert Oppenheimer',3,'M','American','Physicist','Father of Atomic Bomb','United States','United States'),('Winston Churchill',2,'M','British','Prime Minister','Political Leader','United Kingdom','United Kingdom');
/*!40000 ALTER TABLE `InfluentialPersonalities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Lifespan`
--

DROP TABLE IF EXISTS `Lifespan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Lifespan` (
  `LifespanID` int NOT NULL,
  `DateofBirth` date DEFAULT NULL,
  `DateofDeath` date DEFAULT NULL,
  PRIMARY KEY (`LifespanID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Lifespan`
--

LOCK TABLES `Lifespan` WRITE;
/*!40000 ALTER TABLE `Lifespan` DISABLE KEYS */;
INSERT INTO `Lifespan` VALUES (1,'1920-03-15','1944-06-06'),(2,'1922-11-28','1944-12-25'),(3,'1915-09-02','1943-11-30'),(4,'1923-04-18','1945-05-08'),(5,'1920-08-05','1945-09-02');
/*!40000 ALTER TABLE `Lifespan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MilitaryDeaths`
--

DROP TABLE IF EXISTS `MilitaryDeaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MilitaryDeaths` (
  `militarydeaths` int NOT NULL,
  `civiliandeaths` int NOT NULL,
  `totaldeaths` int DEFAULT NULL,
  PRIMARY KEY (`militarydeaths`,`civiliandeaths`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MilitaryDeaths`
--

LOCK TABLES `MilitaryDeaths` WRITE;
/*!40000 ALTER TABLE `MilitaryDeaths` DISABLE KEYS */;
INSERT INTO `MilitaryDeaths` VALUES (400000,300000,700000),(600000,400000,1000000),(700000,500000,1200000),(1500000,1000000,2500000),(2000000,1500000,3500000),(4000000,3000000,7000000),(9000000,7000000,16000000);
/*!40000 ALTER TABLE `MilitaryDeaths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PrisonersofWar`
--

DROP TABLE IF EXISTS `PrisonersofWar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PrisonersofWar` (
  `Name` varchar(255) NOT NULL,
  `CapturedbyCountry` varchar(255) DEFAULT NULL,
  `CapturedinBattle` varchar(255) DEFAULT NULL,
  `Releasedon` date NOT NULL,
  `Nationality` varchar(255) DEFAULT NULL,
  `imprisonedby` varchar(255) DEFAULT NULL,
  `imprisoningcountry` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Name`,`Releasedon`),
  KEY `Nationality` (`Nationality`),
  KEY `imprisoningcountry` (`imprisoningcountry`),
  CONSTRAINT `PrisonersofWar_ibfk_1` FOREIGN KEY (`Nationality`) REFERENCES `Countries` (`Name`),
  CONSTRAINT `PrisonersofWar_ibfk_2` FOREIGN KEY (`imprisoningcountry`) REFERENCES `Countries` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PrisonersofWar`
--

LOCK TABLES `PrisonersofWar` WRITE;
/*!40000 ALTER TABLE `PrisonersofWar` DISABLE KEYS */;
INSERT INTO `PrisonersofWar` VALUES ('Elena Petrova','Soviet Union','Siege of Leningrad','1944-09-10','Soviet Union','Finnish Army','Soviet Union'),('George Smith','Germany','Battle of the Bulge','1945-05-20','United States','German Army','Germany'),('Hans Müller','United Kingdom','Operation Market Garden','1945-02-15','Germany','British Army','United Kingdom'),('Sophie Dupont','Germany','Normandy Invasion','1945-06-25','France','U.S. Army','United States'),('Yuki Tanaka','United States','Battle of Iwo Jima','1944-11-30','Japan','U.S. Marines','United States');
/*!40000 ALTER TABLE `PrisonersofWar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ServiceID`
--

DROP TABLE IF EXISTS `ServiceID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ServiceID` (
  `Servicenumber` int NOT NULL,
  `nationalcode` int DEFAULT NULL,
  `identificationnumber` int DEFAULT NULL,
  PRIMARY KEY (`Servicenumber`),
  CONSTRAINT `ServiceID_ibfk_1` FOREIGN KEY (`Servicenumber`) REFERENCES `Soldiers` (`ServiceNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ServiceID`
--

LOCK TABLES `ServiceID` WRITE;
/*!40000 ALTER TABLE `ServiceID` DISABLE KEYS */;
INSERT INTO `ServiceID` VALUES (102001,102,1),(104034,104,34),(105620,105,620),(106245,106,245),(107001,107,1);
/*!40000 ALTER TABLE `ServiceID` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Soldierage`
--

DROP TABLE IF EXISTS `Soldierage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Soldierage` (
  `LifespanID` int NOT NULL,
  `age` int DEFAULT NULL,
  PRIMARY KEY (`LifespanID`),
  CONSTRAINT `Soldierage_ibfk_1` FOREIGN KEY (`LifespanID`) REFERENCES `Soldiers` (`LifespanID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Soldierage`
--

LOCK TABLES `Soldierage` WRITE;
/*!40000 ALTER TABLE `Soldierage` DISABLE KEYS */;
INSERT INTO `Soldierage` VALUES (1,24),(2,22),(3,28),(4,22),(5,25);
/*!40000 ALTER TABLE `Soldierage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Soldiers`
--

DROP TABLE IF EXISTS `Soldiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Soldiers` (
  `ServiceNumber` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `LifespanID` int DEFAULT NULL,
  `Foughtfor` varchar(255) DEFAULT NULL,
  `CountryName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ServiceNumber`),
  KEY `LifespanID` (`LifespanID`),
  KEY `CountryName` (`CountryName`),
  CONSTRAINT `Soldiers_ibfk_1` FOREIGN KEY (`LifespanID`) REFERENCES `Lifespan` (`LifespanID`),
  CONSTRAINT `Soldiers_ibfk_2` FOREIGN KEY (`CountryName`) REFERENCES `Countries` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=107002 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Soldiers`
--

LOCK TABLES `Soldiers` WRITE;
/*!40000 ALTER TABLE `Soldiers` DISABLE KEYS */;
INSERT INTO `Soldiers` VALUES (102001,'Ivan Petrov',3,'Axis Powers','Germany'),(104034,'Takashi Tanaka',5,'Axis Powers','Japan'),(105620,'Olga Kuznetsova',4,'Allied Powers','Soviet Union'),(106245,'Alice Johnson',2,'Allied Powers','United Kingdom'),(107001,'John Doe',1,'Allied Powers','United States');
/*!40000 ALTER TABLE `Soldiers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Weapons`
--

DROP TABLE IF EXISTS `Weapons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Weapons` (
  `Name` varchar(255) NOT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `PlaceofOrigin` varchar(255) DEFAULT NULL,
  `Mass` float DEFAULT NULL,
  `DimensionID` int DEFAULT NULL,
  PRIMARY KEY (`Name`),
  KEY `DimensionID` (`DimensionID`),
  CONSTRAINT `Weapons_ibfk_1` FOREIGN KEY (`DimensionID`) REFERENCES `dimensions` (`DimensionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Weapons`
--

LOCK TABLES `Weapons` WRITE;
/*!40000 ALTER TABLE `Weapons` DISABLE KEYS */;
INSERT INTO `Weapons` VALUES ('AK-47','Assault Rifle','Russia',4.2,1),('Atomic Bombs','Nuclear Weapon','United States',10000,1),('Explosive Bombs','Conventional Explosive','Germany',500,2),('Glock 17','Handgun','Austria',0.6,5),('Incendiary Bombs','Incendiary','United Kingdom',250,3),('M16','Assault Rifle','United States',3.3,2),('M249','Light Machine Gun','United States',7.5,4),('RPG-7','Rocket Launcher','Soviet Union',6,3);
/*!40000 ALTER TABLE `Weapons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `battlesfought`
--

DROP TABLE IF EXISTS `battlesfought`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `battlesfought` (
  `Name` varchar(255) DEFAULT NULL,
  `nationalID` int DEFAULT NULL,
  `ServiceID` int DEFAULT NULL,
  `nameofbattle` varchar(255) DEFAULT NULL,
  `timeline` varchar(255) DEFAULT NULL,
  `winningparty` varchar(255) DEFAULT NULL,
  KEY `ServiceID` (`ServiceID`),
  KEY `Name` (`Name`),
  KEY `nationalID` (`nationalID`),
  CONSTRAINT `battlesfought_ibfk_1` FOREIGN KEY (`ServiceID`) REFERENCES `Soldiers` (`ServiceNumber`),
  CONSTRAINT `battlesfought_ibfk_2` FOREIGN KEY (`Name`) REFERENCES `Countries` (`Name`),
  CONSTRAINT `battlesfought_ibfk_3` FOREIGN KEY (`nationalID`) REFERENCES `Casualties` (`NationalID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `battlesfought`
--

LOCK TABLES `battlesfought` WRITE;
/*!40000 ALTER TABLE `battlesfought` DISABLE KEYS */;
INSERT INTO `battlesfought` VALUES ('Germany',3,102001,'Battle of Dunkirk','26/05/1940-04/06/1940','Germany'),('Japan',NULL,104034,'Battle of Midway','03/06/1942-07/06/1942','United States'),('Soviet Union',NULL,105620,'Siege of Leningrad','08/09/1941-27/01/1944','Soviet Union'),('United Kingdom',NULL,106245,'Battle of Britain','10/07/1940-31/10/1940','United Kingdom'),('United States',1,107001,'Attack on Pearl Harbor','07/10/1941-07/10/1941','Japan');
/*!40000 ALTER TABLE `battlesfought` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bombedby`
--

DROP TABLE IF EXISTS `bombedby`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bombedby` (
  `Name` varchar(255) DEFAULT NULL,
  `dateid` int DEFAULT NULL,
  `countrybombed` varchar(255) DEFAULT NULL,
  `weaponname` varchar(255) DEFAULT NULL,
  KEY `countrybombed` (`countrybombed`),
  KEY `weaponname` (`weaponname`),
  KEY `Name` (`Name`),
  KEY `dateid` (`dateid`,`countrybombed`),
  CONSTRAINT `bombedby_ibfk_1` FOREIGN KEY (`weaponname`) REFERENCES `Weapons` (`Name`),
  CONSTRAINT `bombedby_ibfk_2` FOREIGN KEY (`Name`) REFERENCES `Countries` (`Name`),
  CONSTRAINT `bombedby_ibfk_4` FOREIGN KEY (`dateid`, `countrybombed`) REFERENCES `BombingCampaigns` (`dateid`, `Countrybombed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bombedby`
--

LOCK TABLES `bombedby` WRITE;
/*!40000 ALTER TABLE `bombedby` DISABLE KEYS */;
INSERT INTO `bombedby` VALUES ('Germany',1,'United Kingdom','Explosive Bombs'),('United Kingdom',2,'Germany','Incendiary Bombs'),('United States',3,'Japan','Atomic Bombs'),('Germany',4,'France','Explosive Bombs'),('United States',5,'Germany','Incendiary Bombs');
/*!40000 ALTER TABLE `bombedby` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bombsused`
--

DROP TABLE IF EXISTS `bombsused`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bombsused` (
  `bombsid` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `yield` float DEFAULT NULL,
  PRIMARY KEY (`bombsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bombsused`
--

LOCK TABLES `bombsused` WRITE;
/*!40000 ALTER TABLE `bombsused` DISABLE KEYS */;
INSERT INTO `bombsused` VALUES (11,'Explosive Bombs',250),(12,'Incendiary Bombs',150),(13,'Atomic Bombs',500);
/*!40000 ALTER TABLE `bombsused` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countryfoughtagainst`
--

DROP TABLE IF EXISTS `countryfoughtagainst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countryfoughtagainst` (
  `Name` varchar(255) NOT NULL,
  `Foughtagainst` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Name`),
  KEY `Foughtagainst` (`Foughtagainst`),
  CONSTRAINT `countryfoughtagainst_ibfk_1` FOREIGN KEY (`Foughtagainst`) REFERENCES `Countries` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countryfoughtagainst`
--

LOCK TABLES `countryfoughtagainst` WRITE;
/*!40000 ALTER TABLE `countryfoughtagainst` DISABLE KEYS */;
INSERT INTO `countryfoughtagainst` VALUES ('France','Germany'),('United States','Germany'),('Soviet Union','Japan'),('United Kingdom','Japan'),('Germany','United Kingdom'),('Italy','United Kingdom'),('Japan','United States');
/*!40000 ALTER TABLE `countryfoughtagainst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `date`
--

DROP TABLE IF EXISTS `date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `date` (
  `dateid` int NOT NULL,
  `Day` float DEFAULT NULL,
  `month` float DEFAULT NULL,
  `year` float DEFAULT NULL,
  PRIMARY KEY (`dateid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `date`
--

LOCK TABLES `date` WRITE;
/*!40000 ALTER TABLE `date` DISABLE KEYS */;
INSERT INTO `date` VALUES (1,1,9,1939),(2,15,8,1940),(3,6,8,1945),(4,10,6,1940),(5,15,3,1944);
/*!40000 ALTER TABLE `date` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dateofbirth`
--

DROP TABLE IF EXISTS `dateofbirth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dateofbirth` (
  `DOBID` int NOT NULL,
  `Day` int DEFAULT NULL,
  `Month` int DEFAULT NULL,
  `Year` int DEFAULT NULL,
  PRIMARY KEY (`DOBID`),
  CONSTRAINT `dateofbirth_ibfk_1` FOREIGN KEY (`DOBID`) REFERENCES `InfluentialPersonalities` (`DOBID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dateofbirth`
--

LOCK TABLES `dateofbirth` WRITE;
/*!40000 ALTER TABLE `dateofbirth` DISABLE KEYS */;
INSERT INTO `dateofbirth` VALUES (1,14,3,1879),(2,30,9,1874),(3,22,4,1904),(4,20,4,1889),(5,30,1,1882);
/*!40000 ALTER TABLE `dateofbirth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `differentbombsused`
--

DROP TABLE IF EXISTS `differentbombsused`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `differentbombsused` (
  `bombsid` int DEFAULT NULL,
  `dateid` int NOT NULL,
  `Countrybombed` varchar(255) NOT NULL,
  PRIMARY KEY (`dateid`,`Countrybombed`),
  KEY `bombsid` (`bombsid`),
  KEY `Countrybombed` (`Countrybombed`),
  CONSTRAINT `differentbombsused_ibfk_1` FOREIGN KEY (`bombsid`) REFERENCES `bombsused` (`bombsid`),
  CONSTRAINT `differentbombsused_ibfk_2` FOREIGN KEY (`dateid`) REFERENCES `BombingCampaigns` (`dateid`),
  CONSTRAINT `differentbombsused_ibfk_3` FOREIGN KEY (`Countrybombed`) REFERENCES `BombingCampaigns` (`Countrybombed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `differentbombsused`
--

LOCK TABLES `differentbombsused` WRITE;
/*!40000 ALTER TABLE `differentbombsused` DISABLE KEYS */;
INSERT INTO `differentbombsused` VALUES (11,1,'United Kingdom'),(11,4,'France'),(12,2,'Germany'),(12,5,'Germany'),(13,3,'Japan');
/*!40000 ALTER TABLE `differentbombsused` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dimensions`
--

DROP TABLE IF EXISTS `dimensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dimensions` (
  `DimensionID` int NOT NULL,
  `Length` float DEFAULT NULL,
  `Breadth` float DEFAULT NULL,
  `Height` float DEFAULT NULL,
  PRIMARY KEY (`DimensionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dimensions`
--

LOCK TABLES `dimensions` WRITE;
/*!40000 ALTER TABLE `dimensions` DISABLE KEYS */;
INSERT INTO `dimensions` VALUES (1,0.9,0.2,0.15),(2,1,0.25,0.2),(3,1.2,0.3,0.25),(4,1.5,0.35,0.3),(5,0.2,0.15,0.05);
/*!40000 ALTER TABLE `dimensions` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `personalityage`
--

DROP TABLE IF EXISTS `personalityage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personalityage` (
  `DOBID` int NOT NULL,
  `Age` int DEFAULT NULL,
  PRIMARY KEY (`DOBID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personalityage`
--

LOCK TABLES `personalityage` WRITE;
/*!40000 ALTER TABLE `personalityage` DISABLE KEYS */;
INSERT INTO `personalityage` VALUES (1,76),(2,90),(3,62),(4,56),(5,60);
/*!40000 ALTER TABLE `personalityage` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-03  2:11:02
