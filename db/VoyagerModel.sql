-- MySQL dump 10.13  Distrib 5.7.9, for Win32 (AMD64)
--
-- Host: localhost    Database: voyager
-- ------------------------------------------------------
-- Server version	5.7.11-log

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
-- Table structure for table `bugsystem`
--

DROP TABLE IF EXISTS `bugsystem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bugsystem` (
  `idBugSystem` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `url` varchar(200) NOT NULL,
  `bugSystemType` int(11) NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idBugSystem`),
  KEY `BugSystem_BugSystemType_idx` (`bugSystemType`),
  CONSTRAINT `BugSystem_BugSystemType` FOREIGN KEY (`bugSystemType`) REFERENCES `bugsystemtype` (`idBugSystemType`) ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bugsystem`
--

LOCK TABLES `bugsystem` WRITE;
/*!40000 ALTER TABLE `bugsystem` DISABLE KEYS */;
INSERT INTO `bugsystem` VALUES (8,'Voyager Jira','https://voyagerproject.atlassian.net',3,'2016-11-28 17:35:50'),(9,'Voyager Test Jira','jira.attlassian.com',3,'2017-01-15 14:01:20');
/*!40000 ALTER TABLE `bugsystem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bugsystemtype`
--

DROP TABLE IF EXISTS `bugsystemtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bugsystemtype` (
  `idBugSystemType` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idBugSystemType`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bugsystemtype`
--

LOCK TABLES `bugsystemtype` WRITE;
/*!40000 ALTER TABLE `bugsystemtype` DISABLE KEYS */;
INSERT INTO `bugsystemtype` VALUES (3,'Jira','2016-11-28 16:58:34'),(4,'Bugzilla','2016-11-28 16:58:39');
/*!40000 ALTER TABLE `bugsystemtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission` (
  `idPermission` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idPermission`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (4,'Create','2016-11-28 16:56:00'),(5,'Update','2016-11-28 16:56:06'),(6,'Delete','2016-11-28 16:56:11');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `idProject` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `bugSystem` int(11) NOT NULL,
  `ruleManager` int(11) DEFAULT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idProject`),
  KEY `Project_BugSystem_idx` (`bugSystem`),
  KEY `Project_RuleManager_idx` (`ruleManager`),
  CONSTRAINT `Project_BugSystem` FOREIGN KEY (`bugSystem`) REFERENCES `bugsystem` (`idBugSystem`) ON UPDATE NO ACTION,
  CONSTRAINT `Project_RuleManager` FOREIGN KEY (`ruleManager`) REFERENCES `rulemanager` (`idRuleManager`) ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (7,'Main Project',8,4,'2016-11-28 17:35:57');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rulemanager`
--

DROP TABLE IF EXISTS `rulemanager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rulemanager` (
  `idRuleManager` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `ruleManagerType` int(11) NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idRuleManager`),
  KEY `RuleManager_RuleManagerType_idx` (`ruleManagerType`),
  CONSTRAINT `RuleManager_RuleManagerType` FOREIGN KEY (`ruleManagerType`) REFERENCES `rulemanagertype` (`idRuleManagerType`) ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rulemanager`
--

LOCK TABLES `rulemanager` WRITE;
/*!40000 ALTER TABLE `rulemanager` DISABLE KEYS */;
INSERT INTO `rulemanager` VALUES (4,'Main Drools','www.drools.com',3,'2016-11-28 17:35:04');
/*!40000 ALTER TABLE `rulemanager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rulemanagertype`
--

DROP TABLE IF EXISTS `rulemanagertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rulemanagertype` (
  `idRuleManagerType` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idRuleManagerType`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rulemanagertype`
--

LOCK TABLES `rulemanagertype` WRITE;
/*!40000 ALTER TABLE `rulemanagertype` DISABLE KEYS */;
INSERT INTO `rulemanagertype` VALUES (3,'Drools','2016-11-28 17:28:48');
/*!40000 ALTER TABLE `rulemanagertype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `idUser` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(100) NOT NULL,
  `name` varchar(155) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `userType` int(11) NOT NULL,
  `token` varchar(255) DEFAULT '',
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idUser`),
  UNIQUE KEY `userName_UNIQUE` (`userName`),
  KEY `User_UserType_idx` (`userType`),
  CONSTRAINT `User_UserType` FOREIGN KEY (`userType`) REFERENCES `usertype` (`idUserType`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (11,'admin','admin','admin@voyag.com','222a8637ad9292efac75f2175bb9e72fc9c82de29c1bcfde6e688bd173ebb2a955444ec808651dd4768ae154cb843eb08cc625b6e51ede05badc5042303284a2',32,'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE0ODQ1NDI5MzcsIm5hbWUiOiJhZG1pbiJ9.TuQEXCSi0muClfIIrcczV7MghHRk98TggFEHj5Tw4xo','2016-11-28 16:57:09'),(12,'developer','developer','developer@voyag.com','69a1f769bdb0c068f0ac90a306b7e86655bfeac005bdaf2f10da6e9f888cf36e7aa60e053d2dfabb5feffd722a76d9b9241e462734268cc328bb9b502b0d197a',33,NULL,'2016-11-28 16:58:03'),(13,'tester','tester','tester@voyag.com','e667d415936f2ebead7a9cc63cb53eea16bc40294a9032d35dcaacc324c94157734bb65176b135fd3406bfd539aca2577b7c291036f00fd976ddce2faa0e23f7',34,NULL,'2016-11-28 16:58:26');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userproject`
--

DROP TABLE IF EXISTS `userproject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userproject` (
  `idUserProject` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `project` int(11) NOT NULL,
  `projectUserName` varchar(100) DEFAULT NULL,
  `projectPassword` varchar(255) DEFAULT NULL,
  `ruleManagerUserName` varchar(100) DEFAULT NULL,
  `ruleManagerPassword` varchar(255) DEFAULT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(100) NOT NULL,
  PRIMARY KEY (`idUserProject`),
  KEY `UserProject_Project_idx` (`project`),
  KEY `UserProject_User_idx` (`user`),
  CONSTRAINT `UserProject_Project` FOREIGN KEY (`project`) REFERENCES `project` (`idProject`) ON UPDATE NO ACTION,
  CONSTRAINT `UserProject_User` FOREIGN KEY (`user`) REFERENCES `user` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userproject`
--

LOCK TABLES `userproject` WRITE;
/*!40000 ALTER TABLE `userproject` DISABLE KEYS */;
/*!40000 ALTER TABLE `userproject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usertype`
--

DROP TABLE IF EXISTS `usertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usertype` (
  `idUserType` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idUserType`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertype`
--

LOCK TABLES `usertype` WRITE;
/*!40000 ALTER TABLE `usertype` DISABLE KEYS */;
INSERT INTO `usertype` VALUES (32,'Admin','2016-11-28 16:56:18'),(33,'Developer','2016-11-28 16:56:24'),(34,'QA','2016-11-28 16:56:41');
/*!40000 ALTER TABLE `usertype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usertypepermission`
--

DROP TABLE IF EXISTS `usertypepermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usertypepermission` (
  `idUserTypePermission` int(11) NOT NULL AUTO_INCREMENT,
  `userType` int(11) NOT NULL,
  `permission` int(11) NOT NULL,
  `value` varchar(45) DEFAULT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(100) NOT NULL,
  PRIMARY KEY (`idUserTypePermission`),
  KEY `UserTypePermission_Permission_idx` (`permission`),
  KEY `UserTypePermission_UserType_idx` (`userType`),
  CONSTRAINT `UserTypePermission_Permission` FOREIGN KEY (`permission`) REFERENCES `permission` (`idPermission`) ON UPDATE NO ACTION,
  CONSTRAINT `UserTypePermission_UserType` FOREIGN KEY (`userType`) REFERENCES `usertype` (`idUserType`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertypepermission`
--

LOCK TABLES `usertypepermission` WRITE;
/*!40000 ALTER TABLE `usertypepermission` DISABLE KEYS */;
/*!40000 ALTER TABLE `usertypepermission` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-29 22:13:57
