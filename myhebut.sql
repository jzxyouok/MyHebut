-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: 121.42.169.129    Database: examonline
-- ------------------------------------------------------
-- Server version	5.7.10-log

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
-- Table structure for table `billboard`
--

DROP TABLE IF EXISTS `billboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billboard` (
  `boardId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(88) NOT NULL,
  `detail` varchar(2000) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`boardId`),
  UNIQUE KEY `boardId_UNIQUE` (`boardId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `donate`
--

DROP TABLE IF EXISTS `donate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `donate` (
  `donateId` int(11) NOT NULL AUTO_INCREMENT,
  `donateName` varchar(45) NOT NULL,
  `donateMoney` float NOT NULL,
  `donateMessage` varchar(888) NOT NULL,
  `donateTIme` varchar(45) NOT NULL,
  PRIMARY KEY (`donateId`),
  UNIQUE KEY `donateId_UNIQUE` (`donateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `messageId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(21) NOT NULL,
  `content` varchar(400) NOT NULL,
  `reply` varchar(400) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`messageId`),
  UNIQUE KEY `id_UNIQUE` (`messageId`),
  KEY `message_idx` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `note`
--

DROP TABLE IF EXISTS `note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `note` (
  `noteId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `questionId` int(11) NOT NULL,
  `answerF` varchar(45) DEFAULT '未选择',
  PRIMARY KEY (`noteId`),
  UNIQUE KEY `id_UNIQUE` (`noteId`),
  KEY `note_idx` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `questionId` int(11) NOT NULL AUTO_INCREMENT,
  `subject` int(11) NOT NULL,
  `type` varchar(45) CHARACTER SET gbk NOT NULL,
  `section` varchar(400) CHARACTER SET gbk NOT NULL,
  `number` int(11) NOT NULL,
  `content` varchar(400) CHARACTER SET gbk NOT NULL,
  `answerA` varchar(200) CHARACTER SET gbk NOT NULL,
  `answerB` varchar(200) CHARACTER SET gbk NOT NULL,
  `answerC` varchar(200) CHARACTER SET gbk NOT NULL,
  `answerD` varchar(200) CHARACTER SET gbk NOT NULL,
  `answerE` varchar(200) CHARACTER SET gbk DEFAULT NULL,
  `answerT` varchar(45) CHARACTER SET gbk NOT NULL,
  PRIMARY KEY (`questionId`),
  UNIQUE KEY `questionId_UNIQUE` (`questionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `record`
--

DROP TABLE IF EXISTS `record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record` (
  `recordId` int(11) NOT NULL AUTO_INCREMENT,
  `subject` int(11) NOT NULL,
  `userId` int(21) NOT NULL,
  `begin_time` datetime NOT NULL,
  `last_time` varchar(45) NOT NULL,
  `score` float NOT NULL,
  `percent` varchar(45) NOT NULL,
  `seconds` int(11) NOT NULL,
  PRIMARY KEY (`recordId`),
  UNIQUE KEY `id_UNIQUE` (`recordId`),
  KEY `record_idx` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(45) NOT NULL,
  `userPass` varchar(45) NOT NULL,
  `nickName` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `avatar` varchar(88) NOT NULL DEFAULT 'default',
  `power` int(11) NOT NULL DEFAULT '0',
  `create_time` varchar(45) NOT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `id_UNIQUE` (`userId`),
  UNIQUE KEY `userName_UNIQUE` (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

