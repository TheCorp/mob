-- MySQL dump 10.11
--
-- Host: localhost    Database: mob
-- ------------------------------------------------------
-- Server version	5.0.75-0ubuntu10.2

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
-- Table structure for table `briefcase`
--

DROP TABLE IF EXISTS `briefcase`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `briefcase` (
  `created` datetime default NULL,
  `lastupdated` datetime default NULL,
  `user_id` bigint(20) default '0',
  `id` bigint(20) NOT NULL auto_increment,
  `viewcount` bigint(20) default '0',
  PRIMARY KEY  (`id`),
  KEY `briefcase_fk_user` (`user_id`),
  CONSTRAINT `briefcase_fk_user` FOREIGN KEY (`user_id`) REFERENCES `profile` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=368 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `briefcase`
--

LOCK TABLES `briefcase` WRITE;
/*!40000 ALTER TABLE `briefcase` DISABLE KEYS */;
INSERT INTO `briefcase` VALUES (NULL,NULL,513,301,0),(NULL,NULL,514,302,0),(NULL,NULL,518,303,0),(NULL,NULL,519,304,0),(NULL,NULL,520,305,0),(NULL,NULL,521,306,0),(NULL,NULL,523,307,0),(NULL,NULL,525,308,0),(NULL,NULL,526,309,0),('1969-12-31 00:00:00',NULL,528,310,0),(NULL,NULL,530,311,0),(NULL,NULL,531,312,0),(NULL,NULL,536,313,0),(NULL,NULL,537,314,0),(NULL,NULL,540,317,0),(NULL,NULL,541,318,0),(NULL,NULL,542,319,0),(NULL,NULL,543,320,0),(NULL,NULL,544,321,0),(NULL,NULL,546,323,0),(NULL,NULL,551,328,0),(NULL,NULL,554,331,0),(NULL,NULL,555,332,0),('1969-12-31 00:00:00',NULL,533,333,0),(NULL,NULL,559,334,0),(NULL,NULL,560,335,0),(NULL,NULL,561,336,0),(NULL,NULL,563,337,0),('1969-12-31 00:00:00',NULL,564,338,0),(NULL,NULL,565,339,0),(NULL,NULL,566,340,0),(NULL,NULL,569,341,0),(NULL,NULL,571,342,0),(NULL,NULL,572,343,0),(NULL,NULL,574,344,0),(NULL,NULL,575,345,0),(NULL,NULL,576,346,0),('1969-12-31 00:00:00',NULL,573,347,0),(NULL,NULL,580,348,0),(NULL,NULL,581,349,0),(NULL,NULL,582,350,0),(NULL,NULL,583,351,0),(NULL,NULL,584,352,0),(NULL,NULL,585,353,0),(NULL,NULL,586,354,0),(NULL,NULL,587,355,0),(NULL,NULL,588,356,0),('1969-12-31 00:00:00',NULL,590,357,0),(NULL,NULL,591,358,0),(NULL,NULL,592,359,0),(NULL,NULL,593,360,0),('1969-12-31 00:00:00',NULL,594,361,0),(NULL,NULL,595,362,0),(NULL,NULL,596,363,0),(NULL,NULL,597,364,0),(NULL,NULL,598,365,0),(NULL,NULL,599,366,0),(NULL,NULL,600,367,0);
/*!40000 ALTER TABLE `briefcase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `briefcase_item`
--

DROP TABLE IF EXISTS `briefcase_item`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `briefcase_item` (
  `item_id` bigint(20) NOT NULL,
  `briefcase_id` bigint(20) NOT NULL,
  PRIMARY KEY  USING BTREE (`item_id`,`briefcase_id`),
  KEY `fk_briefcase_item_item` (`item_id`),
  KEY `fk_briefcase_briefcaseid` (`briefcase_id`),
  CONSTRAINT `fk_briefcase_briefcaseid` FOREIGN KEY (`briefcase_id`) REFERENCES `briefcase` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_briefcase_item_item` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `briefcase_item`
--

LOCK TABLES `briefcase_item` WRITE;
/*!40000 ALTER TABLE `briefcase_item` DISABLE KEYS */;
INSERT INTO `briefcase_item` VALUES (81,518),(84,518),(85,518),(87,513),(88,518),(91,513),(92,518),(93,518),(94,528),(95,518),(96,518),(97,530),(98,514),(99,514),(100,514),(101,514),(102,514),(103,514),(104,540),(105,540),(106,540),(107,514),(108,514),(109,514),(110,514),(111,518),(112,554),(118,554),(119,554),(120,554),(122,533),(123,518),(124,554),(127,563),(128,563),(129,563),(130,563),(131,563),(132,563),(133,563),(134,563),(135,564),(138,564),(139,564),(140,518),(141,518),(142,518),(143,573),(144,573),(146,590),(147,590),(148,590),(149,590),(150,565),(151,565),(152,513),(153,513),(154,513),(155,513),(156,513),(157,513),(158,513),(159,513),(160,594);
/*!40000 ALTER TABLE `briefcase_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `briefcasecategory`
--

DROP TABLE IF EXISTS `briefcasecategory`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `briefcasecategory` (
  `id` int(11) NOT NULL auto_increment,
  `category` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `briefcasecategory`
--

LOCK TABLES `briefcasecategory` WRITE;
/*!40000 ALTER TABLE `briefcasecategory` DISABLE KEYS */;
INSERT INTO `briefcasecategory` VALUES (1,'TV Show '),(2,'Audio Recording '),(3,'Document '),(4,'Other');
/*!40000 ALTER TABLE `briefcasecategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `category` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Doctor'),(2,'Engineer'),(3,'Musician'),(4,'Tester');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `criteria`
--

DROP TABLE IF EXISTS `criteria`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `criteria` (
  `id` bigint(20) NOT NULL auto_increment,
  `value` varchar(45) default NULL,
  `daterangestart` datetime default NULL,
  `daterangeend` datetime default NULL,
  `criteriatype_id` bigint(20) default NULL,
  `searchcriteria_id` bigint(20) default NULL,
  `resultcriteria_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_criteria_criteriatype` (`criteriatype_id`),
  KEY `fk_criteria_searchcriteria` (`searchcriteria_id`),
  KEY `fk_criteria_resultcriteria` (`resultcriteria_id`),
  CONSTRAINT `fk_criteria_criteriatype` FOREIGN KEY (`criteriatype_id`) REFERENCES `criteriatype` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_criteria_resultcriteria` FOREIGN KEY (`resultcriteria_id`) REFERENCES `resultcriteria` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_criteria_searchcriteria` FOREIGN KEY (`searchcriteria_id`) REFERENCES `searchcriteria` (`opportunity_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `criteria`
--

LOCK TABLES `criteria` WRITE;
/*!40000 ALTER TABLE `criteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `criteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `criteriatype`
--

DROP TABLE IF EXISTS `criteriatype`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `criteriatype` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(45) default NULL,
  `isdaterange` tinyint(1) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `criteriatype`
--

LOCK TABLES `criteriatype` WRITE;
/*!40000 ALTER TABLE `criteriatype` DISABLE KEYS */;
/*!40000 ALTER TABLE `criteriatype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `days`
--

DROP TABLE IF EXISTS `days`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `days` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `name` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `days`
--

LOCK TABLES `days` WRITE;
/*!40000 ALTER TABLE `days` DISABLE KEYS */;
INSERT INTO `days` VALUES (1,'Su'),(2,'M'),(3,'Tu'),(4,'W'),(5,'Th'),(6,'F'),(7,'Sa');
/*!40000 ALTER TABLE `days` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `education`
--

DROP TABLE IF EXISTS `education`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `education` (
  `id` bigint(20) NOT NULL auto_increment,
  `schoolname` varchar(45) default NULL,
  `startdate` date default NULL,
  `enddate` date default NULL,
  `concentration` varchar(45) default NULL,
  `profile_id` bigint(20) default NULL,
  `honors` varchar(45) default NULL,
  `gpa` varchar(45) default NULL,
  `degree` varchar(45) default NULL,
  `year` bigint(10) default NULL,
  `major` varchar(45) default NULL,
  `minor` varchar(45) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_education_profileid` (`profile_id`),
  CONSTRAINT `fk_education_profileid` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `education`
--

LOCK TABLES `education` WRITE;
/*!40000 ALTER TABLE `education` DISABLE KEYS */;
INSERT INTO `education` VALUES (1,'USC',NULL,NULL,NULL,518,NULL,'3.7','B.A.',2005,'Computer Science',NULL),(2,'USC',NULL,NULL,NULL,518,NULL,'3.9','B.A.',2005,'Economics',NULL),(3,'asd',NULL,NULL,NULL,525,NULL,'78','B.A.',2007,'sa','as'),(4,'qq',NULL,NULL,NULL,526,NULL,'65','B.A.',2007,'qq','qq'),(5,'JNTU',NULL,NULL,NULL,514,NULL,'79','B.A.',2007,'Business',''),(6,'University of Washington',NULL,NULL,NULL,530,NULL,'4.0','B.A.',2007,'Business Administration',''),(7,'University of Washington',NULL,NULL,NULL,531,NULL,'4.0','B.A.',2000,'Business Administration',''),(9,'Mira Costa',NULL,NULL,NULL,540,NULL,'4.0','B.A.',2007,'Music Producing','Business Management'),(10,'IIT',NULL,NULL,NULL,551,NULL,'6','B.S.',1999,'CS',NULL),(11,'Los Angeles School of Recording',NULL,NULL,NULL,563,NULL,'4.0','B.A.',2007,'Science of Recording','Audio Engineering'),(12,'USC',NULL,NULL,NULL,518,NULL,'3.5','B.A.',2007,'Physics',NULL),(13,'sd',NULL,NULL,NULL,565,NULL,'fsdfsd','B.A.',2007,'sdfs','sdfds'),(14,'dsf',NULL,NULL,NULL,565,NULL,'s','B.A.',2007,'sd','s'),(15,'sd',NULL,NULL,NULL,565,NULL,'s','B.S.',1995,'sd','sd'),(16,'s',NULL,NULL,NULL,565,NULL,'s','B.A.',2000,'s','s'),(17,'fg',NULL,NULL,NULL,565,NULL,'','M.S.',2005,'fgfgf','gfg'),(20,'sdfsdf',NULL,NULL,NULL,513,NULL,'7','M.B.A.',2002,'dfgfdg',NULL),(21,'ass',NULL,NULL,NULL,575,NULL,'44','M.S.',2002,'ssss','sss'),(22,'MIT',NULL,NULL,NULL,597,NULL,'','B.S.',2002,'Comp Sci',''),(23,'sdfsdf',NULL,NULL,NULL,598,NULL,'sadas','M.B.A.',2006,'zcfdsafasasfd','sfdasas'),(24,'asdas',NULL,NULL,NULL,598,NULL,'a','B.A.',2004,'asfdas','asdas'),(25,'asdfas',NULL,NULL,NULL,598,NULL,'d','M.B.A.',2005,'sacfafd','sadasaaasafda'),(26,'wewr',NULL,NULL,NULL,598,NULL,'de','M.B.A.',2004,'sdfds','erwewe'),(27,'GCOE ',NULL,NULL,NULL,599,NULL,'','M.S.',2007,'Comp Sci','');
/*!40000 ALTER TABLE `education` ENABLE KEYS */;
UNLOCK TABLES;

/*!50003 SET @SAVE_SQL_MODE=@@SQL_MODE*/;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_VALUE_ON_ZERO" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`mob`@`localhost` */ /*!50003 TRIGGER `emp_education_insert` BEFORE INSERT ON `education` FOR EACH ROW BEGIN
		DECLARE keyrows INTEGER;
		IF NEW.degree != '' THEN
			SELECT count(*) INTO keyrows FROM itemcount i WHERE i.searchTerm like NEW.degree  and i.itemType=1;
			IF keyrows>0 THEN
				UPDATE itemcount i SET i.count=i.count+1 WHERE  i.searchTerm like NEW.degree  and i.itemType=1;
			ELSE
				INSERT INTO itemcount (itemType, searchTerm, count) VALUES (1,NEW.degree,1);
			END IF;
		END IF;
	END */;;

/*!50003 SET SESSION SQL_MODE="NO_AUTO_VALUE_ON_ZERO" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`mob`@`localhost` */ /*!50003 TRIGGER `emp_education_update` AFTER UPDATE ON `education` FOR EACH ROW BEGIN
		DECLARE keyrows INTEGER;
		DECLARE itemrows INTEGER;

		IF OLD.degree!=NEW.degree THEN
			UPDATE itemcount i SET i.count=i.count-1 WHERE  i.searchTerm like OLD.degree;
			SELECT count(*) INTO keyrows FROM itemcount i WHERE i.searchTerm like NEW.degree  and i.itemType=1;
			IF keyrows>0 THEN
				UPDATE itemcount i SET i.count=i.count+1 WHERE  i.searchTerm like NEW.degree  and i.itemType=1;
			ELSE
				IF NEW.degree != '' THEN
					INSERT INTO itemcount (itemType, searchTerm, count) VALUES (1,NEW.degree,1);
				END IF;
			END IF;
		END IF;
	END */;;

/*!50003 SET SESSION SQL_MODE="NO_AUTO_VALUE_ON_ZERO" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`mob`@`localhost` */ /*!50003 TRIGGER `emp_education_delete` AFTER DELETE ON `education` FOR EACH ROW BEGIN
		DECLARE itemrows INTEGER;
		UPDATE itemcount i SET i.count=i.count-1 WHERE  i.searchTerm like OLD.degree  and i.itemType=1;
	END */;;

DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@SAVE_SQL_MODE*/;

--
-- Table structure for table `educationdetails`
--

DROP TABLE IF EXISTS `educationdetails`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `educationdetails` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `educationname` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `educationdetails`
--

LOCK TABLES `educationdetails` WRITE;
/*!40000 ALTER TABLE `educationdetails` DISABLE KEYS */;
INSERT INTO `educationdetails` VALUES (1,'MCA'),(2,'BCA'),(3,'ME'),(4,'EEE'),(5,'ECE');
/*!40000 ALTER TABLE `educationdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `educationrequired`
--

DROP TABLE IF EXISTS `educationrequired`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `educationrequired` (
  `id` bigint(20) NOT NULL auto_increment,
  `education` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `educationrequired`
--

LOCK TABLES `educationrequired` WRITE;
/*!40000 ALTER TABLE `educationrequired` DISABLE KEYS */;
INSERT INTO `educationrequired` VALUES (1,'B.A'),(2,'B.Arch'),(3,'BCA'),(4,'B.B.A'),(5,'B.Com'),(6,'B.Ed'),(7,'BDS'),(8,'BHM'),(9,'B.Pharma'),(10,'B.Sc'),(11,'B.Tech/B.E'),(12,'CA '),(13,'CS'),(14,'ICWA'),(15,'Integrated PG'),(16,'LLB'),(17,'LLM'),(18,'M.A'),(19,'M.Arch'),(20,'MBBS'),(21,'MBBS'),(22,'M.Ed'),(23,'M.Pharma'),(24,'M.Sc'),(25,'M.Tech'),(26,'MBA/PGDM'),(27,'MCA'),(29,'MS'),(30,'PG Diploma'),(31,'MCM'),(32,'Other');
/*!40000 ALTER TABLE `educationrequired` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employer`
--

DROP TABLE IF EXISTS `employer`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `employer` (
  `organizationname` varchar(20) NOT NULL,
  `noofemployees` varchar(45) default NULL,
  `location` varchar(45) default NULL,
  `user_id` bigint(20) NOT NULL default '0',
  `orginfo` varchar(250) default NULL,
  `culture` varchar(100) default NULL,
  `additionalinfo` varchar(100) default NULL,
  `address1` varchar(45) default NULL,
  `address2` varchar(45) default NULL,
  `missionstatement` varchar(200) default NULL,
  `website` varchar(45) default NULL,
  `phonenumber` varchar(45) default NULL,
  `emplrorgnfo` text,
  `emplrorgculture` text,
  `whychooseus` text,
  `resizedMidPicture` varchar(256) default NULL,
  `industry_id` bigint(20) default NULL,
  `resizedMinPicture` varchar(256) default NULL,
  `picture` varchar(256) default NULL,
  PRIMARY KEY  (`user_id`),
  KEY `fk_employer_user` (`user_id`),
  KEY `fk_employer_industry_id` (`industry_id`),
  CONSTRAINT `fk_employer_industry_id` FOREIGN KEY (`industry_id`) REFERENCES `industry` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_employer_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `employer`
--

LOCK TABLES `employer` WRITE;
/*!40000 ALTER TABLE `employer` DISABLE KEYS */;
INSERT INTO `employer` VALUES ('endeavour',NULL,NULL,199,NULL,NULL,NULL,'','','','www.endeavour',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('IBM',NULL,NULL,200,NULL,NULL,NULL,'','','','www.ibm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('Employer16',NULL,NULL,201,NULL,NULL,NULL,'','','','www.abc.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('endeavour1',NULL,NULL,208,NULL,NULL,NULL,'asd','asd','asd','endeavour1',NULL,'asd','asd','asd',NULL,NULL,NULL,NULL),('e3',NULL,NULL,210,NULL,NULL,NULL,'','','','e3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('eq',NULL,NULL,212,NULL,NULL,NULL,'','','','eq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('te',NULL,NULL,215,NULL,NULL,NULL,'','','','te',NULL,'','','',NULL,NULL,NULL,NULL),('IBM',NULL,NULL,216,NULL,NULL,NULL,'','','','IBM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('OPENLANE',NULL,NULL,219,NULL,NULL,NULL,'2200 Bridge Parkway ','','','www.openlane.com',NULL,'Buying and selling with OPENLANE isn\'t just a trend. It\'s here to stay.\r\nFor close to a decade, we\'ve been leading a new era of wholesale vehicle transactions. And our concept is growing every day.\r\n<br><Br>\r\nOPENLANE has leveraged the inherent powers of the Internet, bringing buyers and sellers together virtually, eliminating the time and overhead associated with physical auctions. Now, with a computer and an Internet connection, you can conduct business from your desk, 24 hours, 7 days a week, 365 days a year.\r\n\r\nUsing the Internet for remarketing makes buying and selling vehicles easier, faster and more cost efficient for all our customers. And we offer a range of services and options that make doing business with us your smartest wholesale option.\r\n\r\nOPENLANE is committed to instilling confidence in every transaction, with reliability, convenience, low cost, and a dedication to excellence. ','','',NULL,NULL,NULL,NULL),('VIPbooker',NULL,NULL,220,NULL,NULL,NULL,'138 N. Beaudry Ave.','138 N. Beaudry Ave.','Testing issue! Testing issue!Testing issue!Testing issue!','www.vipbooker.com',NULL,'New Test','Testing issue!Testing issue! Testing issue!','Testing issue! Testing issue! Testing Issue!','mid_Koala_220.jpg',61,'min_Koala_220.jpg','Koala_220.jpg'),('asdf',NULL,NULL,221,NULL,NULL,NULL,'','','','asd',NULL,'','','','mid_1234_221.jpg',16,NULL,NULL),('emplr@m.com',NULL,NULL,222,NULL,NULL,NULL,'','','asdsdfsdf sdfsddddddddddd','emplr@m.com',NULL,'sadasfsdf sdf sdfsdfdddddddddddddddd','dasdasdsdfs dfsdf sdfdddddddddddddd','sadass dfsdfsdfdsfddddddddddddddd','mid_Frangipani Flowers_222.jpg',11,NULL,NULL),('TARR INC.',NULL,NULL,229,NULL,NULL,NULL,'2683 Via de la Valle #G516','','','www.tntdiet.com',NULL,NULL,NULL,NULL,NULL,68,NULL,NULL),('TARR INC.',NULL,NULL,230,NULL,NULL,NULL,'2683 Via de la Valle #G516','','','www.tntdiet.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('satya',NULL,NULL,231,NULL,NULL,NULL,'as','','as asdasd asda asda aaa aaaa dasd as asd asd asdasas a asa sdasdasd asdasdasdasd asd asd asdas','satya',NULL,'','','','mid_Dock_231.jpg',1,NULL,NULL),('sa',NULL,NULL,232,NULL,NULL,NULL,'sdfas','asda','sdf sdfsdfsd f sdfas asd asd gjhghj gjkghj jhg s sdasd','sa',NULL,'asda sd','asdas das','asdasdasd ','mid_Frangipani Flowers_232.jpg',5,NULL,NULL),('RJ Model Ships',NULL,NULL,235,NULL,NULL,NULL,'7949 Silverton Ave #906','','We provide museum quality model ships!','www.rjmodelships.com',NULL,NULL,NULL,NULL,'mid_wholeeggs_235.jpg',52,NULL,NULL),('asdf',NULL,NULL,236,NULL,NULL,NULL,'','','','asdf',NULL,NULL,NULL,NULL,'mid_Desert Landscape_236.jpg',3,NULL,NULL),('sat',NULL,NULL,237,NULL,NULL,NULL,'','','','sat',NULL,'','','','mid_Humpback Whale_237.jpg',1,'min_Humpback Whale_237.jpg','Humpback Whale_237.jpg'),('test1',NULL,NULL,238,NULL,NULL,NULL,'','','','test1',NULL,NULL,NULL,NULL,'mid_Green Sea Turtle_238.jpg',13,'min_Green Sea Turtle_238.jpg','Green Sea Turtle_238.jpg'),('as',NULL,NULL,239,NULL,NULL,NULL,'','','','as',NULL,NULL,NULL,NULL,'mid_Waterfall_239.jpg',14,'min_Waterfall_239.jpg','Waterfall_239.jpg'),('zz',NULL,NULL,240,NULL,NULL,NULL,'asdasda','asdasdasd','asdasd','zz',NULL,NULL,NULL,NULL,'mid_Green Sea Turtle_240.jpg',5,'min_Green Sea Turtle_240.jpg','Green Sea Turtle_240.jpg'),('satya',NULL,NULL,242,NULL,NULL,NULL,'','','aa','saty',NULL,'aa','aaaa','aa','mid_Green Sea Turtle_242.jpg',15,'min_Green Sea Turtle_242.jpg','Green Sea Turtle_242.jpg'),('satya',NULL,NULL,243,NULL,NULL,NULL,'','','','satya',NULL,NULL,NULL,NULL,'mid_Waterfall_243.jpg',15,'min_Waterfall_243.jpg','Waterfall_243.jpg'),('saty',NULL,NULL,244,NULL,NULL,NULL,'','','','satya',NULL,NULL,NULL,NULL,'mid_Waterfall_244.jpg',15,'min_Waterfall_244.jpg','Waterfall_244.jpg'),('ggg',NULL,NULL,245,NULL,NULL,NULL,'asdas','asdas','','ggg',NULL,NULL,NULL,NULL,'mid_Winter Leaves_245.jpg',14,'min_Winter Leaves_245.jpg','Winter Leaves_245.jpg'),('satya',NULL,NULL,246,NULL,NULL,NULL,'12','123','','saty',NULL,'','','','mid_Waterfall_246.jpg',16,'min_Waterfall_246.jpg','Waterfall_246.jpg'),('satya',NULL,NULL,247,NULL,NULL,NULL,'','','pulkam@mob.com','saty',NULL,'pulkam@mob.com','pulkam@mob.com','pulkam@mob.com','mid_Dock_247.jpg',17,'min_Dock_247.jpg','Dock_247.jpg'),('pulkam1@mob.com',NULL,NULL,248,NULL,NULL,NULL,'','','','pulkam1@mob.com',NULL,'','','dfsd','mid_Waterfall_248.jpg',12,'min_Waterfall_248.jpg','Waterfall_248.jpg'),('asd',NULL,NULL,255,NULL,NULL,NULL,'','','','asd',NULL,NULL,NULL,NULL,'mid_Green Sea Turtle_255.jpg',17,'min_Green Sea Turtle_255.jpg','Green Sea Turtle_255.jpg'),('TARR INC',NULL,NULL,256,NULL,NULL,NULL,'2683 Via de la Valle #G516','','E-Book Bossing','www.tntdiet.com',NULL,'','','','mid_Diet-and-Fitness_256.png',1,'min_Diet-and-Fitness_256.png','Diet-and-Fitness_256.png'),('Jus Inc',NULL,NULL,259,NULL,NULL,NULL,'','','','www.jus.com',NULL,'','','',NULL,15,NULL,NULL),('end',NULL,NULL,261,NULL,NULL,NULL,'','','dfsd sdf sdfsdfsdfsd','end',NULL,'saty','dadasd asdas das','asdasdasd','mid_Frangipani Flowers_261.jpg',18,'min_Frangipani Flowers_261.jpg','Frangipani Flowers_261.jpg'),('DecisionLink',NULL,NULL,267,NULL,NULL,NULL,'po box 266','','','Decisionlink.com',NULL,NULL,NULL,NULL,NULL,25,NULL,NULL);
/*!40000 ALTER TABLE `employer` ENABLE KEYS */;
UNLOCK TABLES;

/*!50003 SET @SAVE_SQL_MODE=@@SQL_MODE*/;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_VALUE_ON_ZERO" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`mob`@`localhost` */ /*!50003 TRIGGER `empr_industry_update` AFTER UPDATE ON `employer` FOR EACH ROW BEGIN
		DECLARE keyrows INTEGER;
		DECLARE ind VARCHAR(250);
		DECLARE oldind VARCHAR(250);

		IF NEW.industry_id!=OLD.industry_id THEN
			SELECT i.name INTO oldind FROM industry i WHERE i.id=OLD.industry_id;
			UPDATE itemcount i SET i.count=i.count-1 WHERE i.searchTerm like oldind and itemType=4;
			
			SELECT i.name INTO ind FROM industry i WHERE i.id=NEW.industry_id;
			
			SELECT count(*) INTO keyrows FROM itemcount i WHERE i.searchTerm like ind  and i.itemType=4;

			IF keyrows>0 THEN
				UPDATE itemcount i SET i.count=i.count+1 WHERE  i.searchTerm like ind and i.itemType=4;
			ELSE
				INSERT INTO itemcount (itemType, searchTerm, count) VALUES (4,ind,1);
			END IF;
		END IF;
	END */;;

/*!50003 SET SESSION SQL_MODE="NO_AUTO_VALUE_ON_ZERO" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`mob`@`localhost` */ /*!50003 TRIGGER `empr_industry_delete` AFTER DELETE ON `employer` FOR EACH ROW BEGIN
		DECLARE ind VARCHAR(250);
		SELECT i.name INTO ind FROM industry i WHERE i.id=OLD.industry_id;

		UPDATE itemcount i SET i.count=i.count-1 WHERE  i.searchTerm like ind  and i.itemType=4;
	END */;;

DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@SAVE_SQL_MODE*/;

--
-- Table structure for table `employerprofile`
--

DROP TABLE IF EXISTS `employerprofile`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `employerprofile` (
  `companyname` varchar(50) default NULL,
  `biography` varchar(250) default NULL,
  `culture` varchar(200) default NULL,
  `opportunity` varchar(200) default NULL,
  `others` varchar(200) default NULL,
  `name` varchar(45) default NULL,
  `profile_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `website` varchar(100) default NULL,
  `phonenumber` varchar(45) default NULL,
  `emplrorganizationInfo` text,
  `whyChooseUs` text,
  PRIMARY KEY  USING BTREE (`profile_id`),
  KEY `fk_profile_id` USING BTREE (`profile_id`),
  KEY `fk_user_id` (`user_id`),
  CONSTRAINT `fk_profile_id` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `employerprofile`
--

LOCK TABLES `employerprofile` WRITE;
/*!40000 ALTER TABLE `employerprofile` DISABLE KEYS */;
INSERT INTO `employerprofile` VALUES (NULL,NULL,NULL,NULL,NULL,NULL,515,199,NULL,NULL,NULL,NULL),(NULL,NULL,NULL,NULL,NULL,NULL,516,200,NULL,NULL,NULL,NULL),(NULL,NULL,NULL,NULL,NULL,NULL,517,201,NULL,NULL,NULL,NULL),(NULL,NULL,NULL,NULL,NULL,NULL,522,210,NULL,NULL,NULL,NULL),(NULL,NULL,NULL,NULL,NULL,NULL,524,212,NULL,NULL,NULL,NULL),(NULL,NULL,NULL,NULL,NULL,NULL,527,208,NULL,NULL,NULL,NULL),(NULL,NULL,NULL,NULL,NULL,NULL,528,215,NULL,NULL,NULL,NULL),(NULL,NULL,NULL,NULL,NULL,NULL,529,216,NULL,NULL,NULL,NULL),(NULL,NULL,NULL,NULL,NULL,NULL,532,219,NULL,NULL,NULL,NULL),(NULL,NULL,NULL,NULL,NULL,NULL,533,220,NULL,NULL,NULL,NULL),(NULL,NULL,NULL,NULL,NULL,NULL,534,221,NULL,NULL,NULL,NULL),(NULL,NULL,NULL,NULL,NULL,NULL,535,222,NULL,NULL,NULL,NULL),(NULL,NULL,NULL,NULL,NULL,NULL,556,229,NULL,NULL,NULL,NULL),(NULL,NULL,NULL,NULL,NULL,NULL,557,229,NULL,NULL,NULL,NULL),(NULL,NULL,NULL,NULL,NULL,NULL,558,232,NULL,NULL,NULL,NULL),(NULL,NULL,NULL,NULL,NULL,NULL,562,229,NULL,NULL,NULL,NULL),(NULL,NULL,NULL,NULL,NULL,NULL,564,235,NULL,NULL,NULL,NULL),(NULL,NULL,NULL,NULL,NULL,NULL,567,237,NULL,NULL,NULL,NULL),(NULL,NULL,NULL,NULL,NULL,NULL,568,238,NULL,NULL,NULL,NULL),(NULL,NULL,NULL,NULL,NULL,NULL,570,239,NULL,NULL,NULL,NULL),(NULL,NULL,NULL,NULL,NULL,NULL,573,242,NULL,NULL,NULL,NULL),(NULL,NULL,NULL,NULL,NULL,NULL,577,246,NULL,NULL,NULL,NULL),(NULL,NULL,NULL,NULL,NULL,NULL,578,247,NULL,NULL,NULL,NULL),(NULL,NULL,NULL,NULL,NULL,NULL,579,248,NULL,NULL,NULL,NULL),(NULL,NULL,NULL,NULL,NULL,NULL,589,255,NULL,NULL,NULL,NULL),(NULL,NULL,NULL,NULL,NULL,NULL,590,256,NULL,NULL,NULL,NULL),(NULL,NULL,NULL,NULL,NULL,NULL,594,261,NULL,NULL,NULL,NULL),(NULL,NULL,NULL,NULL,NULL,NULL,601,267,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `employerprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employmenthistory`
--

DROP TABLE IF EXISTS `employmenthistory`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `employmenthistory` (
  `id` bigint(20) NOT NULL auto_increment,
  `organizationname` varchar(45) default NULL,
  `position` varchar(45) default NULL,
  `startdate` date default NULL,
  `enddate` date default NULL,
  `profile_id` bigint(20) default NULL,
  `current` tinyint(1) default NULL,
  `jobtype` varchar(45) default NULL,
  `description` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_employmenthistory_profile` (`profile_id`),
  CONSTRAINT `fk_employmenthistory_profile` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `employmenthistory`
--

LOCK TABLES `employmenthistory` WRITE;
/*!40000 ALTER TABLE `employmenthistory` DISABLE KEYS */;
INSERT INTO `employmenthistory` VALUES (1,'Hitachi',NULL,'2006-06-01','2009-06-01',518,0,NULL,'Senior'),(2,'Hitachi',NULL,'2006-06-01','2007-06-01',518,0,NULL,'Consultant'),(3,'a',NULL,'2010-07-01','2010-07-13',525,0,NULL,'a'),(4,'qq',NULL,'2010-07-12','2010-07-23',526,0,NULL,'qq'),(5,'IBM',NULL,'2007-06-04','2010-07-30',514,0,NULL,'Developer'),(7,'Dirito',NULL,'2007-08-01','2009-06-01',530,0,NULL,'Used'),(8,'AT&T Wireless',NULL,'2000-08-01','2007-08-01',531,0,NULL,'Project Manager'),(9,'IBM',NULL,'2005-09-05','2008-08-20',551,0,NULL,'SA'),(10,'My Own Briefcase',NULL,'2007-09-28','2010-09-27',554,0,NULL,'CEO'),(11,'r3ganomic',NULL,'1990-09-10','2009-09-10',563,0,NULL,'Founder/Chairman'),(12,'as',NULL,'2010-11-02','2010-11-30',566,0,NULL,'as'),(13,'IBM',NULL,'2005-02-01','2011-02-01',597,0,NULL,'Tech Lead'),(14,'DecisionLink ',NULL,'2011-04-11','2011-04-13',600,0,NULL,'CTO'),(15,'Oracle',NULL,'2006-04-13','2011-04-08',600,0,NULL,'SE Mgr');
/*!40000 ALTER TABLE `employmenthistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `feedback` (
  `id` bigint(20) NOT NULL auto_increment,
  `description` varchar(250) default NULL,
  `feedbackproviderid` bigint(20) default NULL,
  `user_id` bigint(20) default NULL,
  `profile_id` bigint(20) default NULL,
  `feedbacktype` varchar(45) default NULL,
  `feedbackprovidername` varchar(45) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_feedback_user` (`feedbackproviderid`),
  KEY `fk_feedback_user1` (`user_id`),
  KEY `fk_feedback_profile` (`profile_id`),
  CONSTRAINT `fk_feedback_profile` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_feedback_user` FOREIGN KEY (`feedbackproviderid`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_feedback_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feturedprofile`
--

DROP TABLE IF EXISTS `feturedprofile`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `feturedprofile` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `profileId` bigint(20) unsigned default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `feturedprofile`
--

LOCK TABLES `feturedprofile` WRITE;
/*!40000 ALTER TABLE `feturedprofile` DISABLE KEYS */;
INSERT INTO `feturedprofile` VALUES (1,514),(2,2),(3,3);
/*!40000 ALTER TABLE `feturedprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flagged`
--

DROP TABLE IF EXISTS `flagged`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `flagged` (
  `id` bigint(20) NOT NULL auto_increment,
  `flaggeddate` datetime default NULL,
  `flagedid` bigint(20) default NULL,
  `type` varchar(45) default NULL,
  `flaggedcomment` varchar(500) default NULL,
  `flagtype` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=267 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `flagged`
--

LOCK TABLES `flagged` WRITE;
/*!40000 ALTER TABLE `flagged` DISABLE KEYS */;
INSERT INTO `flagged` VALUES (1,'2010-02-26 18:24:42',3,'Threads','Satyan testing on flagging ','bad profile'),(2,'2010-02-26 18:25:04',1,'Threads','Hi i am flagging u','Spam '),(3,'2010-02-26 18:27:14',51,'item','hi i am flagging u','File Error '),(4,'2010-02-26 18:27:20',51,'item','hi i am flagging udsfsdfsdf','Inappropriate Material'),(5,'2010-02-26 18:32:39',23,'profile',NULL,NULL),(6,'2010-02-26 18:32:39',17,'profile',NULL,NULL),(7,'2010-02-26 18:32:39',71,'profile',NULL,NULL),(8,'2010-02-26 18:32:39',35,'profile',NULL,NULL),(9,'2010-02-26 18:32:39',34,'profile',NULL,NULL),(10,'2010-03-01 12:01:20',11,'Threads',NULL,NULL),(11,'2010-03-01 15:10:34',16,'Groups',NULL,NULL),(12,'2010-03-01 15:10:34',1,'Groups',NULL,NULL),(13,'2010-03-01 15:56:34',78,'Groups',NULL,NULL),(14,'2010-03-01 15:56:34',73,'Groups',NULL,NULL),(15,'2010-03-01 15:56:34',72,'Groups',NULL,NULL),(16,'2010-03-01 15:56:34',71,'Groups',NULL,NULL),(17,'2010-03-01 15:56:34',70,'Groups',NULL,NULL),(18,'2010-03-02 12:54:18',55,'item','','1'),(19,'2010-03-02 12:54:18',55,'item','','1'),(20,'2010-03-02 12:54:23',55,'item','','1'),(21,'2010-03-02 12:54:27',55,'item','','1'),(22,'2010-06-23 13:12:32',81,'item','bad!','Inappropriate Material'),(23,'2010-06-24 08:39:37',518,'profile',NULL,NULL),(24,'2010-06-29 03:05:05',5,'Threads','saaaaaaaaaaaaaaa','Spam '),(25,'2010-06-29 03:05:07',5,'Threads','saaaaaaaaaaaaaaa','Spam '),(26,'2010-06-29 03:05:07',5,'Threads','saaaaaaaaaaaaaaa','Spam '),(27,'2010-07-23 02:03:25',197,'user','Satya','sa'),(28,'2010-07-23 02:03:25',198,'user','Satya','sa'),(29,'2010-07-23 02:03:26',197,'user','Satya','sa'),(30,'2010-07-23 02:03:26',198,'user','Satya','sa'),(31,'2010-07-23 02:03:26',197,'user','Satya','sa'),(32,'2010-07-23 02:03:26',198,'user','Satya','sa'),(33,'2010-07-23 02:03:27',197,'user','Satya','sa'),(34,'2010-07-23 02:03:27',198,'user','Satya','sa'),(35,'2010-07-23 02:03:27',197,'user','Satya','sa'),(36,'2010-07-23 02:03:27',198,'user','Satya','sa'),(37,'2010-07-23 02:03:27',197,'user','Satya','sa'),(38,'2010-07-23 02:03:27',198,'user','Satya','sa'),(39,'2010-07-23 02:03:27',197,'user','Satya','sa'),(40,'2010-07-23 02:03:27',198,'user','Satya','sa'),(41,'2010-07-23 02:03:27',197,'user','Satya','sa'),(42,'2010-07-23 02:03:27',198,'user','Satya','sa'),(43,'2010-07-23 02:03:27',197,'user','Satya','sa'),(44,'2010-07-23 02:03:27',198,'user','Satya','sa'),(45,'2010-07-23 02:03:27',197,'user','Satya','sa'),(46,'2010-07-23 02:03:27',198,'user','Satya','sa'),(47,'2010-07-23 02:03:27',197,'user','Satya','sa'),(48,'2010-07-23 02:03:27',198,'user','Satya','sa'),(49,'2010-07-23 02:03:27',197,'user','Satya','sa'),(50,'2010-07-23 02:03:27',198,'user','Satya','sa'),(51,'2010-07-23 02:03:27',197,'user','Satya','sa'),(52,'2010-07-23 02:03:27',198,'user','Satya','sa'),(53,'2010-07-23 02:03:27',197,'user','Satya','sa'),(54,'2010-07-23 02:03:27',198,'user','Satya','sa'),(55,'2010-07-23 02:03:27',197,'user','Satya','sa'),(56,'2010-07-23 02:03:27',198,'user','Satya','sa'),(57,'2010-07-23 02:03:30',197,'user','Satya','sa'),(58,'2010-07-23 02:03:31',198,'user','Satya','sa'),(59,'2010-07-23 02:03:31',197,'user','Satya','sa'),(60,'2010-07-23 02:03:31',197,'user','Satya','sa'),(61,'2010-07-23 02:03:31',198,'user','Satya','sa'),(62,'2010-07-23 02:03:31',198,'user','Satya','sa'),(63,'2010-07-23 02:03:31',197,'user','Satya','sa'),(64,'2010-07-23 02:03:31',197,'user','Satya','sa'),(65,'2010-07-23 02:03:31',198,'user','Satya','sa'),(66,'2010-07-23 02:03:31',198,'user','Satya','sa'),(67,'2010-07-23 02:03:31',197,'user','Satya','sa'),(68,'2010-07-23 02:03:31',197,'user','Satya','sa'),(69,'2010-07-23 02:03:31',198,'user','Satya','sa'),(70,'2010-07-23 02:03:31',198,'user','Satya','sa'),(71,'2010-07-23 02:03:31',197,'user','Satya','sa'),(72,'2010-07-23 02:03:31',197,'user','Satya','sa'),(73,'2010-07-23 02:03:31',198,'user','Satya','sa'),(74,'2010-07-23 02:03:31',198,'user','Satya','sa'),(75,'2010-07-23 02:03:31',197,'user','Satya','sa'),(76,'2010-07-23 02:03:31',197,'user','Satya','sa'),(77,'2010-07-23 02:03:31',198,'user','Satya','sa'),(78,'2010-07-23 02:03:31',198,'user','Satya','sa'),(79,'2010-07-23 02:03:31',197,'user','Satya','sa'),(80,'2010-07-23 02:03:31',198,'user','Satya','sa'),(81,'2010-07-23 02:03:31',197,'user','Satya','sa'),(82,'2010-07-23 02:03:31',198,'user','Satya','sa'),(83,'2010-07-23 02:03:31',197,'user','Satya','sa'),(84,'2010-07-23 02:03:31',198,'user','Satya','sa'),(85,'2010-07-23 02:03:31',197,'user','Satya','sa'),(86,'2010-07-23 02:03:31',198,'user','Satya','sa'),(87,'2010-07-23 02:03:31',197,'user','Satya','sa'),(88,'2010-07-23 02:03:31',198,'user','Satya','sa'),(89,'2010-07-23 02:03:31',197,'user','Satya','sa'),(90,'2010-07-23 02:03:31',198,'user','Satya','sa'),(91,'2010-07-23 02:03:31',197,'user','Satya','sa'),(92,'2010-07-23 02:03:31',198,'user','Satya','sa'),(93,'2010-07-23 02:03:31',197,'user','Satya','sa'),(94,'2010-07-23 02:03:31',198,'user','Satya','sa'),(95,'2010-07-23 02:03:31',197,'user','Satya','sa'),(96,'2010-07-23 02:03:31',198,'user','Satya','sa'),(97,'2010-07-23 02:03:31',197,'user','Satya','sa'),(98,'2010-07-23 02:03:31',198,'user','Satya','sa'),(99,'2010-07-23 02:03:32',197,'user','Satya','sa'),(100,'2010-07-23 02:03:32',198,'user','Satya','sa'),(101,'2010-07-23 02:03:32',197,'user','Satya','sa'),(102,'2010-07-23 02:03:32',198,'user','Satya','sa'),(103,'2010-07-23 02:03:32',197,'user','Satya','sa'),(104,'2010-07-23 02:03:32',198,'user','Satya','sa'),(105,'2010-07-23 02:03:32',197,'user','Satya','sa'),(106,'2010-07-23 02:03:32',198,'user','Satya','sa'),(107,'2010-07-23 02:03:32',197,'user','Satya','sa'),(108,'2010-07-23 02:03:32',198,'user','Satya','sa'),(109,'2010-07-23 02:03:32',197,'user','Satya','sa'),(110,'2010-07-23 02:03:32',198,'user','Satya','sa'),(111,'2010-07-23 02:03:32',197,'user','Satya','sa'),(112,'2010-07-23 02:03:32',198,'user','Satya','sa'),(113,'2010-07-23 02:03:32',197,'user','Satya','sa'),(114,'2010-07-23 02:03:32',198,'user','Satya','sa'),(115,'2010-07-23 02:03:32',197,'user','Satya','sa'),(116,'2010-07-23 02:03:32',198,'user','Satya','sa'),(117,'2010-07-23 02:03:32',197,'user','Satya','sa'),(118,'2010-07-23 02:03:32',198,'user','Satya','sa'),(119,'2010-07-23 02:03:32',197,'user','Satya','sa'),(120,'2010-07-23 02:03:32',198,'user','Satya','sa'),(121,'2010-07-23 02:03:32',197,'user','Satya','sa'),(122,'2010-07-23 02:03:32',198,'user','Satya','sa'),(123,'2010-07-23 02:03:32',197,'user','Satya','sa'),(124,'2010-07-23 02:03:32',198,'user','Satya','sa'),(125,'2010-07-23 02:03:32',197,'user','Satya','sa'),(126,'2010-07-23 02:03:32',198,'user','Satya','sa'),(127,'2010-07-23 02:03:32',197,'user','Satya','sa'),(128,'2010-07-23 02:03:32',198,'user','Satya','sa'),(129,'2010-07-23 02:03:32',197,'user','Satya','sa'),(130,'2010-07-23 02:03:32',198,'user','Satya','sa'),(131,'2010-07-23 02:03:32',197,'user','Satya','sa'),(132,'2010-07-23 02:03:32',198,'user','Satya','sa'),(133,'2010-07-23 02:03:32',197,'user','Satya','sa'),(134,'2010-07-23 02:03:32',198,'user','Satya','sa'),(135,'2010-07-23 02:03:32',197,'user','Satya','sa'),(136,'2010-07-23 02:03:32',198,'user','Satya','sa'),(137,'2010-07-23 02:03:32',197,'user','Satya','sa'),(138,'2010-07-23 02:03:32',198,'user','Satya','sa'),(139,'2010-07-23 02:03:32',197,'user','Satya','sa'),(140,'2010-07-23 02:03:32',198,'user','Satya','sa'),(141,'2010-07-23 02:03:32',197,'user','Satya','sa'),(142,'2010-07-23 02:03:32',198,'user','Satya','sa'),(143,'2010-07-23 02:03:32',197,'user','Satya','sa'),(144,'2010-07-23 02:03:32',198,'user','Satya','sa'),(145,'2010-07-23 02:03:32',197,'user','Satya','sa'),(146,'2010-07-23 02:03:32',198,'user','Satya','sa'),(147,'2010-07-23 02:03:32',197,'user','Satya','sa'),(148,'2010-07-23 02:03:32',198,'user','Satya','sa'),(149,'2010-07-23 02:03:32',197,'user','Satya','sa'),(150,'2010-07-23 02:03:32',198,'user','Satya','sa'),(151,'2010-07-23 02:03:32',197,'user','Satya','sa'),(152,'2010-07-23 02:03:32',198,'user','Satya','sa'),(153,'2010-07-23 02:03:32',197,'user','Satya','sa'),(154,'2010-07-23 02:03:32',198,'user','Satya','sa'),(155,'2010-07-23 02:03:32',197,'user','Satya','sa'),(156,'2010-07-23 02:03:32',198,'user','Satya','sa'),(157,'2010-07-23 02:03:32',197,'user','Satya','sa'),(158,'2010-07-23 02:03:32',198,'user','Satya','sa'),(159,'2010-07-23 02:03:33',197,'user','Satya','sa'),(160,'2010-07-23 02:03:33',198,'user','Satya','sa'),(161,'2010-07-23 02:03:33',197,'user','Satya','sa'),(162,'2010-07-23 02:03:33',198,'user','Satya','sa'),(163,'2010-07-23 02:03:33',197,'user','Satya','sa'),(164,'2010-07-23 02:03:33',198,'user','Satya','sa'),(165,'2010-07-23 02:03:33',197,'user','Satya','sa'),(166,'2010-07-23 02:03:33',198,'user','Satya','sa'),(167,'2010-07-23 02:03:33',197,'user','Satya','sa'),(168,'2010-07-23 02:03:33',198,'user','Satya','sa'),(169,'2010-07-23 02:03:33',197,'user','Satya','sa'),(170,'2010-07-23 02:03:33',198,'user','Satya','sa'),(171,'2010-07-23 02:03:33',197,'user','Satya','sa'),(172,'2010-07-23 02:03:33',198,'user','Satya','sa'),(173,'2010-07-23 02:03:33',197,'user','Satya','sa'),(174,'2010-07-23 02:03:33',198,'user','Satya','sa'),(175,'2010-07-23 02:03:33',197,'user','Satya','sa'),(176,'2010-07-23 02:03:33',198,'user','Satya','sa'),(177,'2010-07-23 02:03:34',197,'user','Satya','sa'),(178,'2010-07-23 02:03:34',198,'user','Satya','sa'),(179,'2010-07-23 02:03:34',197,'user','Satya','sa'),(180,'2010-07-23 02:03:34',198,'user','Satya','sa'),(181,'2010-07-23 02:03:34',197,'user','Satya','sa'),(182,'2010-07-23 02:03:34',198,'user','Satya','sa'),(183,'2010-07-23 02:03:34',197,'user','Satya','sa'),(184,'2010-07-23 02:03:34',198,'user','Satya','sa'),(185,'2010-07-23 02:03:34',197,'user','Satya','sa'),(186,'2010-07-23 02:03:34',198,'user','Satya','sa'),(187,'2010-07-23 02:03:34',197,'user','Satya','sa'),(188,'2010-07-23 02:03:34',198,'user','Satya','sa'),(189,'2010-07-23 02:03:34',197,'user','Satya','sa'),(190,'2010-07-23 02:03:34',198,'user','Satya','sa'),(191,'2010-07-23 02:03:34',197,'user','Satya','sa'),(192,'2010-07-23 02:03:34',198,'user','Satya','sa'),(193,'2010-07-23 02:03:34',197,'user','Satya','sa'),(194,'2010-07-23 02:03:34',198,'user','Satya','sa'),(195,'2010-07-23 02:03:34',197,'user','Satya','sa'),(196,'2010-07-23 02:03:34',198,'user','Satya','sa'),(197,'2010-07-23 02:03:34',197,'user','Satya','sa'),(198,'2010-07-23 02:03:34',198,'user','Satya','sa'),(199,'2010-07-23 02:03:34',197,'user','Satya','sa'),(200,'2010-07-23 02:03:34',198,'user','Satya','sa'),(201,'2010-07-23 02:03:34',197,'user','Satya','sa'),(202,'2010-07-23 02:03:34',198,'user','Satya','sa'),(203,'2010-07-23 02:03:34',197,'user','Satya','sa'),(204,'2010-07-23 02:03:34',197,'user','Satya','sa'),(205,'2010-07-23 02:03:34',198,'user','Satya','sa'),(206,'2010-07-23 02:03:34',198,'user','Satya','sa'),(207,'2010-07-23 02:03:34',197,'user','Satya','sa'),(208,'2010-07-23 02:03:34',197,'user','Satya','sa'),(209,'2010-07-23 02:03:34',198,'user','Satya','sa'),(210,'2010-07-23 02:03:34',198,'user','Satya','sa'),(211,'2010-07-23 02:03:34',197,'user','Satya','sa'),(212,'2010-07-23 02:03:34',197,'user','Satya','sa'),(213,'2010-07-23 02:03:34',198,'user','Satya','sa'),(214,'2010-07-23 02:03:34',198,'user','Satya','sa'),(215,'2010-07-23 02:03:34',197,'user','Satya','sa'),(216,'2010-07-23 02:03:34',198,'user','Satya','sa'),(217,'2010-07-23 02:03:34',197,'user','Satya','sa'),(218,'2010-07-23 02:03:34',198,'user','Satya','sa'),(219,'2010-07-23 02:03:34',197,'user','Satya','sa'),(220,'2010-07-23 02:03:34',197,'user','Satya','sa'),(221,'2010-07-23 02:03:34',198,'user','Satya','sa'),(222,'2010-07-23 02:03:34',198,'user','Satya','sa'),(223,'2010-07-23 02:03:34',197,'user','Satya','sa'),(224,'2010-07-23 02:03:34',197,'user','Satya','sa'),(225,'2010-07-23 02:03:34',198,'user','Satya','sa'),(226,'2010-07-23 02:03:34',198,'user','Satya','sa'),(227,'2010-07-23 02:03:34',197,'user','Satya','sa'),(228,'2010-07-23 02:03:34',197,'user','Satya','sa'),(229,'2010-07-23 02:03:34',198,'user','Satya','sa'),(230,'2010-07-23 02:03:34',198,'user','Satya','sa'),(231,'2010-07-23 02:03:34',197,'user','Satya','sa'),(232,'2010-07-23 02:03:35',197,'user','Satya','sa'),(233,'2010-07-23 02:03:35',198,'user','Satya','sa'),(234,'2010-07-23 02:03:35',198,'user','Satya','sa'),(235,'2010-07-23 02:03:35',197,'user','Satya','sa'),(236,'2010-07-23 02:03:35',197,'user','Satya','sa'),(237,'2010-07-23 02:03:35',198,'user','Satya','sa'),(238,'2010-07-23 02:03:35',198,'user','Satya','sa'),(239,'2010-07-23 02:03:35',197,'user','Satya','sa'),(240,'2010-07-23 02:03:35',197,'user','Satya','sa'),(241,'2010-07-23 02:03:35',198,'user','Satya','sa'),(242,'2010-07-23 02:03:35',197,'user','Satya','sa'),(243,'2010-07-23 02:03:35',198,'user','Satya','sa'),(244,'2010-07-23 02:03:35',198,'user','Satya','sa'),(245,'2010-07-23 02:03:35',197,'user','Satya','sa'),(246,'2010-07-23 02:03:35',197,'user','Satya','sa'),(247,'2010-07-23 02:03:35',198,'user','Satya','sa'),(248,'2010-07-23 02:03:35',198,'user','Satya','sa'),(249,'2010-07-23 02:03:35',197,'user','Satya','sa'),(250,'2010-07-23 02:03:35',197,'user','Satya','sa'),(251,'2010-07-23 02:03:35',198,'user','Satya','sa'),(252,'2010-07-23 02:03:35',198,'user','Satya','sa'),(253,'2010-07-23 02:03:35',197,'user','Satya','sa'),(254,'2010-07-23 02:03:35',198,'user','Satya','sa'),(255,'2010-07-23 02:03:35',197,'user','Satya','sa'),(256,'2010-07-23 02:03:35',198,'user','Satya','sa'),(257,'2010-07-23 02:03:35',197,'user','Satya','sa'),(258,'2010-07-23 02:03:35',198,'user','Satya','sa'),(259,'2010-07-23 02:03:35',197,'user','Satya','sa'),(260,'2010-07-23 02:03:35',198,'user','Satya','sa'),(261,'2010-07-23 02:03:35',197,'user','Satya','sa'),(262,'2010-07-23 02:03:35',198,'user','Satya','sa'),(263,'2010-07-23 02:03:35',197,'user','Satya','sa'),(264,'2010-07-23 02:03:35',198,'user','Satya','sa'),(265,'2010-07-23 02:03:35',197,'user','Satya','sa'),(266,'2010-07-23 02:03:35',198,'user','Satya','sa');
/*!40000 ALTER TABLE `flagged` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flaggedtype`
--

DROP TABLE IF EXISTS `flaggedtype`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `flaggedtype` (
  `id` bigint(20) unsigned NOT NULL default '0',
  `typeflag` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `flaggedtype`
--

LOCK TABLES `flaggedtype` WRITE;
/*!40000 ALTER TABLE `flaggedtype` DISABLE KEYS */;
INSERT INTO `flaggedtype` VALUES (1,'Inappropriate Material\r\n'),(2,'Spam '),(3,'bad profile'),(4,'Virus '),(5,'File Error '),(6,'');
/*!40000 ALTER TABLE `flaggedtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend`
--

DROP TABLE IF EXISTS `friend`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `friend` (
  `id` bigint(20) NOT NULL auto_increment,
  `nickname` varchar(45) default NULL,
  `friendid` bigint(20) default NULL,
  `mobid` bigint(20) NOT NULL,
  `friendname` varchar(55) default NULL,
  `createdDate` date default NULL,
  `modifiedDate` date default NULL,
  `associatedprofileid` bigint(20) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_friend_user1` (`mobid`),
  KEY `fk_friend_profile` (`associatedprofileid`),
  KEY `fk_friend_user` (`friendid`),
  CONSTRAINT `fk_friend_profile` FOREIGN KEY (`associatedprofileid`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_friend_user` FOREIGN KEY (`friendid`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_friend_user1` FOREIGN KEY (`mobid`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `friend`
--

LOCK TABLES `friend` WRITE;
/*!40000 ALTER TABLE `friend` DISABLE KEYS */;
INSERT INTO `friend` VALUES (1,'JasonsProfile',518,202,'Public','2010-06-23','2010-06-23',518),(2,'JasonsProfile',518,203,'Public','2010-06-25','2010-06-25',519),(3,'endeavour',515,215,'Public','2010-07-15','2010-07-15',528),(5,'JasonsProfile',518,198,'Public','2010-07-22','2010-07-22',514),(6,'satya',519,198,'Public','2010-07-22','2010-07-22',514),(7,'Rakesh profile',514,234,'Public','2010-10-26','2010-10-26',563),(8,'JasonsProfile',518,234,'Public','2010-10-26','2010-10-26',563),(9,'DJ r3gan',563,234,'Public','2010-10-27','2010-10-27',563),(10,'VIPbooker',533,202,'Public','2010-11-10','2010-11-10',518),(11,'DJ r3gan',563,202,'Public','2010-11-18','2010-11-18',518),(12,'asdf',534,197,'Contact','2010-11-18','2010-11-18',566),(13,'endeavour',515,197,'Contact','2010-11-18','2010-11-18',566),(14,'TARR INC.',562,197,'Contact','2010-11-18','2010-11-18',513),(15,'TARR INC.',557,197,'Contact','2010-11-18','2010-11-18',513),(16,'asdf',534,237,'Public','2010-11-23','2010-11-23',567),(17,'endeavour',515,237,'Public','2010-11-23','2010-11-23',567),(18,'endeavour1',527,237,'Public','2010-11-23','2010-11-23',567),(19,'OPENLANE',532,237,'Employee','2010-11-23','2010-11-23',567),(20,'aq',523,222,'Public','2010-11-23','2010-11-23',535),(21,'asd',521,222,'Public','2010-11-23','2010-11-23',535),(22,'aug25@mob.com',536,222,'Contact','2010-11-23','2010-11-23',535),(23,'dfsdf',565,222,'Public','2010-11-23','2010-11-23',535),(24,'DJ r3gan',563,222,'Public','2010-11-23','2010-11-23',535),(25,'aaaaaaaa',569,220,'Contact','2011-02-23','2011-02-23',533),(26,'House Music',540,256,'Contact','2011-03-09','2011-03-09',590),(27,'aaaaaaaa',569,227,'Contact','2011-03-17','2011-03-17',551),(28,'endeavour',515,220,'Contact','2011-03-17','2011-03-17',533),(29,'Spring Developer',599,220,'Potential','2011-03-18','2011-03-18',533),(30,'Spring Developer',599,227,'Contact','2011-03-18','2011-03-18',551),(31,'John',600,266,'Contact','2011-04-13','2011-04-13',600);
/*!40000 ALTER TABLE `friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friendtype`
--

DROP TABLE IF EXISTS `friendtype`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `friendtype` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `friendtype`
--

LOCK TABLES `friendtype` WRITE;
/*!40000 ALTER TABLE `friendtype` DISABLE KEYS */;
INSERT INTO `friendtype` VALUES (1,'colleague'),(2,'friend'),(3,'Partner'),(4,'Associate'),(5,'Superior'),(6,'Contact');
/*!40000 ALTER TABLE `friendtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `group` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(45) default NULL,
  `title` varchar(45) default NULL,
  `description` varchar(45) default NULL,
  `icon` blob,
  `group_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_group_user` (`group_id`),
  CONSTRAINT `fk_group_user` FOREIGN KEY (`group_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_members`
--

DROP TABLE IF EXISTS `group_members`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `group_members` (
  `member_id` bigint(20) NOT NULL default '0',
  `group_id` bigint(20) NOT NULL default '0',
  PRIMARY KEY  (`member_id`,`group_id`),
  KEY `fk_user_has_group_user` (`member_id`),
  KEY `fk_user_has_group_group` (`group_id`),
  CONSTRAINT `fk_user_has_group_group` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_group_user` FOREIGN KEY (`member_id`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `group_members`
--

LOCK TABLES `group_members` WRITE;
/*!40000 ALTER TABLE `group_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_users`
--

DROP TABLE IF EXISTS `group_users`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `group_users` (
  `user_id` bigint(20) NOT NULL default '0',
  `group_id` bigint(20) NOT NULL default '0',
  PRIMARY KEY  USING BTREE (`user_id`,`group_id`),
  KEY `fk_group_users_user_id` (`user_id`),
  KEY `fk_group_users_group_id` (`group_id`),
  CONSTRAINT `fk_group_users_group_id` FOREIGN KEY (`group_id`) REFERENCES `mobgroup` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_group_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `group_users`
--

LOCK TABLES `group_users` WRITE;
/*!40000 ALTER TABLE `group_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupcreator`
--

DROP TABLE IF EXISTS `groupcreator`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `groupcreator` (
  `id` bigint(20) NOT NULL auto_increment,
  `groupid` bigint(20) NOT NULL,
  `profileid` bigint(20) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_groupcreator_groupid` (`groupid`),
  KEY `fk_groupcreator_profileid` (`profileid`),
  CONSTRAINT `fk_groupcreator_groupid` FOREIGN KEY (`groupid`) REFERENCES `mobgroup` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_groupcreator_profileid` FOREIGN KEY (`profileid`) REFERENCES `profile` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `groupcreator`
--

LOCK TABLES `groupcreator` WRITE;
/*!40000 ALTER TABLE `groupcreator` DISABLE KEYS */;
/*!40000 ALTER TABLE `groupcreator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupdiscussions`
--

DROP TABLE IF EXISTS `groupdiscussions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `groupdiscussions` (
  `id` bigint(20) NOT NULL auto_increment,
  `message` text,
  `createddate` datetime default NULL,
  `profileid` bigint(20) default NULL,
  `topicid` bigint(20) default NULL,
  `flagged` tinyint(4) default '0',
  `flagdelete` tinyint(4) default '0',
  PRIMARY KEY  (`id`),
  KEY `FK_groupdiscussions_1` (`profileid`),
  CONSTRAINT `FK_groupdiscussions_1` FOREIGN KEY (`profileid`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `groupdiscussions`
--

LOCK TABLES `groupdiscussions` WRITE;
/*!40000 ALTER TABLE `groupdiscussions` DISABLE KEYS */;
INSERT INTO `groupdiscussions` VALUES (1,'testing!!','2010-06-24 09:20:51',518,1,0,0),(2,'fghgfhgf','2010-06-25 06:38:39',520,2,0,0),(3,'rttttttt','2010-06-25 06:39:26',520,4,0,0),(4,'new reply!','2010-06-25 12:02:02',518,1,0,0),(5,'assssssssssssssssssssss','2010-06-29 03:04:57',520,4,1,0),(6,'erer','2010-07-22 23:31:15',518,6,0,0),(7,'sdfsdfs f','2010-07-23 01:32:51',518,8,0,0),(8,'dfsdfd','2010-07-23 01:32:55',518,8,0,0),(9,'fsfsfsdf','2010-07-23 01:33:00',518,8,0,0),(10,'fsfsfsdffsdfsf','2010-07-23 01:33:01',518,8,0,0),(11,'fsfsfsdffsdfsf','2010-07-23 01:33:02',518,8,0,0),(12,'fsfsfsdffsdfsf','2010-07-23 01:33:02',518,8,0,0),(13,'fsfsfsdffsdfsf','2010-07-23 01:33:03',518,8,0,0),(14,'dfsdf','2010-07-23 01:33:24',518,8,0,0),(15,'dsff','2010-07-23 01:34:15',518,7,0,0),(16,'dsfssf','2010-08-16 04:24:48',514,14,0,0),(17,'test','2010-11-10 15:48:52',518,14,0,0);
/*!40000 ALTER TABLE `groupdiscussions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupinvitation`
--

DROP TABLE IF EXISTS `groupinvitation`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `groupinvitation` (
  `profileid` bigint(20) NOT NULL,
  `groupid` bigint(20) NOT NULL,
  PRIMARY KEY  (`profileid`,`groupid`),
  KEY `fk_groupinvitation_groupid` (`groupid`),
  CONSTRAINT `fk_groupinvitation_groupid` FOREIGN KEY (`groupid`) REFERENCES `mobgroup` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_groupinvitation_profileid` FOREIGN KEY (`profileid`) REFERENCES `profile` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `groupinvitation`
--

LOCK TABLES `groupinvitation` WRITE;
/*!40000 ALTER TABLE `groupinvitation` DISABLE KEYS */;
/*!40000 ALTER TABLE `groupinvitation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupjoinusers`
--

DROP TABLE IF EXISTS `groupjoinusers`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `groupjoinusers` (
  `id` bigint(20) NOT NULL auto_increment,
  `groupid` bigint(20) NOT NULL,
  `profileid` bigint(20) NOT NULL,
  `groupType` tinyint(1) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_groupjoinusers_groupid` USING BTREE (`id`),
  KEY `fkgroupjoinusers_groupid` (`groupid`),
  KEY `fk_groupjoinusers_profileid` (`profileid`),
  CONSTRAINT `fkgroupjoinusers_groupid` FOREIGN KEY (`groupid`) REFERENCES `mobgroup` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_groupjoinusers_profileid` FOREIGN KEY (`profileid`) REFERENCES `profile` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `groupjoinusers`
--

LOCK TABLES `groupjoinusers` WRITE;
/*!40000 ALTER TABLE `groupjoinusers` DISABLE KEYS */;
/*!40000 ALTER TABLE `groupjoinusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `groups` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(45) default NULL,
  `title` varchar(45) default NULL,
  `description` varchar(45) default NULL,
  `icon` blob,
  `creator_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_groups_creatorid` (`creator_id`),
  CONSTRAINT `fk_groups_creatorid` FOREIGN KEY (`creator_id`) REFERENCES `profile` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grouptopics`
--

DROP TABLE IF EXISTS `grouptopics`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `grouptopics` (
  `id` bigint(20) NOT NULL auto_increment,
  `topic` varchar(100) default NULL,
  `description` varchar(500) default NULL,
  `groupid` bigint(20) default NULL,
  `createddate` datetime default NULL,
  `profileid` bigint(20) default NULL,
  `flagged` tinyint(4) default NULL,
  `flagdelete` tinyint(4) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_grouptopics_1` (`groupid`),
  CONSTRAINT `FK_grouptopics_1` FOREIGN KEY (`groupid`) REFERENCES `mobgroup` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `grouptopics`
--

LOCK TABLES `grouptopics` WRITE;
/*!40000 ALTER TABLE `grouptopics` DISABLE KEYS */;
INSERT INTO `grouptopics` VALUES (2,'asdas','dasdasdasd',2,'2010-06-25 06:38:22',519,NULL,NULL),(3,'gfhgfh','gfhgfhgfhgfh',2,'2010-06-25 06:38:57',519,NULL,NULL),(4,'gggggggggggggggg','ggggggggggggggggggggggggg',2,'2010-06-25 06:39:09',519,NULL,NULL),(9,'fgh','fhf',13,'2010-08-16 04:24:08',514,0,0),(10,'fgh','fhf',13,'2010-08-16 04:24:09',514,0,0),(11,'fffffffff','ffffffffffffffffffffffff',13,'2010-08-16 04:24:15',514,0,0),(12,'fffffffff','ffffffffffffffffffffffff',13,'2010-08-16 04:24:15',514,0,0),(13,'fffffff','ffffffffffffff',13,'2010-08-16 04:24:20',514,0,0),(14,'hhhhhhhhh','hhhhhhhhhhhh',13,'2010-08-16 04:24:27',514,0,0),(15,'Interesting','What do you think???',13,'2010-11-10 15:49:17',518,0,0),(16,'asdas','dasdas',4,'2011-01-10 03:57:41',513,0,0),(17,'asdas','dasdas',4,'2011-01-10 03:57:42',513,0,0),(18,'sdfsd','fsdfsdf',14,'2011-01-10 21:52:49',513,0,0),(19,'ASDF','ASD',19,'2011-01-10 21:55:30',513,0,0),(20,'xcdvd','',13,'2011-03-01 09:51:50',513,0,0),(21,'xcdvd','',13,'2011-03-01 09:51:51',513,0,0),(22,'xcdvd','',13,'2011-03-01 09:51:52',513,0,0);
/*!40000 ALTER TABLE `grouptopics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupusers`
--

DROP TABLE IF EXISTS `groupusers`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `groupusers` (
  `profileid` bigint(20) NOT NULL default '0',
  `groupid` bigint(20) NOT NULL default '0',
  PRIMARY KEY  USING BTREE (`profileid`,`groupid`),
  KEY `fk_groupusers_groupid` (`groupid`),
  CONSTRAINT `fk_groupusers_groupid` FOREIGN KEY (`groupid`) REFERENCES `mobgroup` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_groupusers_profileid` FOREIGN KEY (`profileid`) REFERENCES `profile` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `groupusers`
--

LOCK TABLES `groupusers` WRITE;
/*!40000 ALTER TABLE `groupusers` DISABLE KEYS */;
INSERT INTO `groupusers` VALUES (533,1),(513,4),(513,13),(514,13);
/*!40000 ALTER TABLE `groupusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `helpcenter`
--

DROP TABLE IF EXISTS `helpcenter`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `helpcenter` (
  `id` int(11) NOT NULL auto_increment,
  `helpkey` varchar(100) NOT NULL,
  `helpvalue` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `helpcenter`
--

LOCK TABLES `helpcenter` WRITE;
/*!40000 ALTER TABLE `helpcenter` DISABLE KEYS */;
INSERT INTO `helpcenter` VALUES (1,'start looking. ','Welcome to your profile! From here you can see all of the information you listed during the sign up process as well as recent added list of contacts and briefcase items.\r\n\r\nIf you haven\'t uploaded anything to your briefcase yet go ahead and click on \"MyBriefcase\" to start adding files! Looking for a job or something else? Just type your search into the search bar at the top of the page at any time to start looking. '),(2,'EmplrProfile','\r\nWelcome to your Briefcase! Here you can upload a variety of different files to start building your online personal Documents, Photos, Music/Videos and Links. What do you want people to see when they view your profile?\r\nOnce you have made some contacts you can head to the Contacts tab to see all of your friends or head to the Chat tab to pick a contact to chat with. Remember, both you and your contact must have Skype to use the Chat feature. Start searching and start networking!'),(3,'sasdadasd','<p>asdasdasda</p>'),(4,'uuuuuu','<p>asdasdasdauuuuuuuuuuuuuuuuuuuuuu1231231231</p>'),(5,'gfdgfdgh','<p>fghjgjhgj jhgkj</p>'),(6,'erterter','<p>fghjgjhgj jhgkjtertert</p>'),(7,'qweqwe','<p>fghjgjhgj jhgkjtertertqweqwewq</p>'),(8,'satya Testing the application','<p>Satya Testingt he application12345</p>'),(9,'dasdasda','<p>Satya Testingt he applisdasdasdasdasdcation12345</p>'),(10,'satya Testing the application','<p>Hi this is Satya</p>'),(11,'fgdfgdfgdf','<p>gdfgdfgdfgdfgdfgdfgd</p>');
/*!40000 ALTER TABLE `helpcenter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inbox`
--

DROP TABLE IF EXISTS `inbox`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `inbox` (
  `id` bigint(20) NOT NULL auto_increment,
  `owner_id` bigint(20) NOT NULL,
  `message` varchar(250) default NULL,
  `recieveddate` datetime default NULL,
  `replieddate` datetime default NULL,
  `replied` tinyint(1) default NULL,
  `threadid` bigint(20) default NULL,
  `subject` varchar(45) default NULL,
  `sender_id` bigint(20) NOT NULL,
  `readunreadmsgid` tinyint(1) default NULL,
  `profile_id` bigint(20) default NULL,
  `associatedprofileid` bigint(20) default NULL,
  `messageType` int(11) default '0',
  `messageStsus` varchar(45) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_inbox_user` (`owner_id`),
  KEY `fk_inbox_user1` (`sender_id`),
  KEY `fk_inbox_profile` (`profile_id`),
  KEY `fk_inbox_associatedprofile` (`associatedprofileid`),
  CONSTRAINT `fk_inbox_associatedprofile` FOREIGN KEY (`associatedprofileid`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_inbox_profile` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_inbox_user` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_inbox_user1` FOREIGN KEY (`sender_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `inbox`
--

LOCK TABLES `inbox` WRITE;
/*!40000 ALTER TABLE `inbox` DISABLE KEYS */;
INSERT INTO `inbox` VALUES (1,202,'test!','2010-06-23 13:14:57',NULL,NULL,NULL,'Test',202,1,518,518,0,NULL),(2,202,'test! TESTTTT','2010-06-23 13:15:26',NULL,NULL,NULL,'RE:Test',202,1,518,518,0,NULL),(3,214,'hi','2010-07-14 04:47:42',NULL,NULL,NULL,'hi',213,0,526,525,0,NULL),(4,213,'hi from endeavour','2010-07-15 02:33:10',NULL,NULL,NULL,'hi from endeavour',199,0,525,515,0,NULL),(5,213,'hello testing msg 19-july','2010-07-19 03:33:31',NULL,NULL,NULL,'hello',197,1,525,513,0,NULL),(6,222,'Rakesh profile has shown interest in the opportunity trytrytr','2010-08-23 00:08:23',NULL,NULL,NULL,'Interest in opportunity',198,0,535,514,0,NULL),(7,202,'test! again!','2010-11-10 16:14:04',NULL,NULL,NULL,'RE:Test',202,1,518,518,0,NULL),(8,221,'as','2010-11-24 03:35:32',NULL,NULL,NULL,'as',197,0,534,513,0,NULL),(9,213,'ssssssssssssssssss','2010-11-24 03:36:15',NULL,NULL,NULL,'sssss',197,0,525,513,0,NULL),(10,229,'dddddd','2010-11-24 03:45:36',NULL,NULL,NULL,'ddd',197,0,562,513,0,NULL),(11,199,'sssssssssssssssss','2010-11-24 03:46:18',NULL,NULL,NULL,'sss',197,0,515,565,0,NULL),(12,198,'asdasda','2010-11-25 03:42:08',NULL,NULL,NULL,'asdas',234,0,514,563,0,NULL),(13,234,'dfgdfgfdgdf','2010-11-25 04:14:11',NULL,NULL,NULL,'dfgdfg',234,1,563,563,0,NULL),(14,202,'test','2010-12-08 23:30:42',NULL,NULL,NULL,'test!',234,1,518,563,0,NULL),(15,219,'suresh profile has marked the opportunity Administrative Assistant as a favorite.','2011-01-11 22:32:41',NULL,NULL,NULL,'Opportunity marked as favorite',197,0,532,513,0,NULL),(16,219,'suresh profile has shown interest in the opportunity Administrative Assistant','2011-01-11 22:32:48',NULL,NULL,NULL,'Interest in opportunity',197,0,532,513,0,NULL),(17,219,'suresh profile has marked the opportunity Administrative Assistant as a favorite.','2011-01-11 22:33:06',NULL,NULL,NULL,'Opportunity marked as favorite',197,0,532,513,0,NULL),(18,222,'suresh profile has shown interest in the opportunity asdasdasd','2011-01-11 22:33:23',NULL,NULL,NULL,'Interest in opportunity',197,0,535,513,0,NULL),(19,222,'suresh profile has marked the opportunity asdasdasd as a favorite.','2011-01-11 22:33:29',NULL,NULL,NULL,'Opportunity marked as favorite',197,0,535,513,0,NULL),(20,220,'VIPbooker has marked the opportunity C++ Developer as a favorite.','2011-03-01 07:50:43',NULL,NULL,NULL,'Opportunity marked as favorite',220,1,533,533,0,NULL),(21,224,'TEST','2011-03-16 13:43:17',NULL,NULL,NULL,'Hello',256,0,540,590,0,NULL);
/*!40000 ALTER TABLE `inbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `industry`
--

DROP TABLE IF EXISTS `industry`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `industry` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(250) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `industry`
--

LOCK TABLES `industry` WRITE;
/*!40000 ALTER TABLE `industry` DISABLE KEYS */;
INSERT INTO `industry` VALUES (1,'Accounting'),(2,'Agriculture'),(3,'Airlines/Aviation'),(4,'Alternative Dispute Resolution'),(5,'Alternative Medicine'),(6,'Animation'),(7,'Apparel & Fashion'),(8,'Architecture & Planning'),(9,'Arts and Crafts'),(10,'Automotive'),(11,'Aviation & Aerospace'),(12,'Banking'),(13,'Biotechnology'),(14,'Broadcast Media'),(15,'Building Materials'),(16,'Business Supplies and Equipment'),(17,'Chemicals'),(18,'Civic & Social Organization'),(19,'Civil Engineering'),(20,'Commercial Real Estate'),(21,'Computer & Network Security'),(22,'Computer Games'),(23,'Computer Hardware'),(24,'Computer Networking'),(25,'Computer Software'),(26,'Construction'),(27,'Consumer Electronics'),(28,'Consumer Services'),(29,'Cosmetics'),(30,'Dairy'),(31,'Defense & Space'),(32,'Design'),(33,'Education Management'),(34,'Education K-12'),(35,'E-Learning'),(36,'Electrical/Electronic Manufacturing'),(37,'Entertainment'),(38,'Environmental Services'),(39,'Event Management'),(40,'Food & Beverages'),(41,'Food Production'),(42,'Fund Raising'),(43,'Furniture'),(44,'Government Administration'),(45,'Glass, Ceramics & Concrete'),(46,'Graphic Design'),(47,'Health,Wellness & Fitness'),(48,'Higher Education'),(49,'Hospital & Health Care'),(50,'Hospitality'),(51,'Human Resources'),(52,'Import & Export'),(53,'Industrial Automation'),(54,'Information Services'),(55,'Information Technology & Services'),(56,'Insurance'),(57,'International Affairs'),(58,'International Trade & Development'),(59,'Investment Banking'),(60,'Investment Management'),(61,'Judiciary'),(62,'Law Enforcement'),(63,'Law Practice'),(64,'Legal Services'),(65,'Leisure, Travel  & Tourism'),(66,'Library'),(67,'Maritime'),(68,'Marketing & Advertising'),(69,'Market Research'),(70,'Mechanical & Industrial Engineering'),(71,'Media Production'),(72,'Medical Devices'),(73,'Medical Practice'),(74,'Mental Health Care'),(75,'Motion Pictures'),(76,'Music'),(77,'Nanotechnology'),(78,'Newspapers'),(79,'NPO Management'),(80,'Online Media'),(81,'Performing Arts'),(82,'Pharmaceuticals'),(83,'Philanthropy'),(84,'Photography'),(85,'Plastics'),(86,'Primary/Secondary Education'),(87,'Printing'),(88,'Public Relations and Communications'),(89,'Publishing'),(90,'Professional Training and Coaching'),(91,'Real Estate'),(92,'Renewable Energy'),(93,'Religious'),(94,'Restaurants'),(95,'Retail'),(96,'Security & Investigation Services'),(97,'Semi Conductors'),(98,'Sporting Goods'),(99,'Sports'),(100,'Staffing and Recruiting'),(101,'Telecommunications'),(102,'Textiles'),(103,'Think Tanks'),(104,'Venture Capital & Private Equity'),(105,'Veterinary'),(106,'Wholesale'),(107,'Wireless'),(108,'Writing & Editing');
/*!40000 ALTER TABLE `industry` ENABLE KEYS */;
UNLOCK TABLES;

/*!50003 SET @SAVE_SQL_MODE=@@SQL_MODE*/;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_VALUE_ON_ZERO" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`mob`@`localhost` */ /*!50003 TRIGGER `empr_industry_insert` AFTER INSERT ON `industry` FOR EACH ROW BEGIN
		DECLARE keyrows INTEGER;
		DECLARE indrows INTEGER;
		SELECT count(*) INTO indrows FROM employer e WHERE e.industry_id=NEW.id;
		IF indrows>0 THEN
			IF NEW.name != '' THEN
				SELECT count(*) INTO keyrows FROM itemcount i WHERE i.searchTerm like NEW.name  and i.itemType=4;
	
				IF keyrows>0 THEN
					INSERT INTO triglog (trigType) VALUES ('empr_industry_insert- UPDATE');
					UPDATE itemcount i SET i.count=i.count+1 WHERE  i.searchTerm like NEW.name and i.itemType=4;
				ELSE
					INSERT INTO triglog (trigType) VALUES ('empr_industry_insert- INSERT');
					INSERT INTO itemcount (itemType, searchTerm, count) VALUES (4,NEW.name,1);
				END IF;
			END IF;
		END IF;
	END */;;

DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@SAVE_SQL_MODE*/;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `item` (
  `id` bigint(20) NOT NULL auto_increment,
  `videourl` varchar(500) default NULL,
  `audiourl` varchar(500) default NULL,
  `textfileurl` varchar(500) default NULL,
  `description` varchar(45) default NULL,
  `title` varchar(45) default NULL,
  `name` varchar(45) default NULL,
  `privacysetting` varchar(45) default NULL,
  `category` varchar(45) default NULL,
  `locationofitem` varchar(500) default NULL,
  `createdDate` date default NULL,
  `modifiedDate` date default NULL,
  `imageurl` varchar(500) default NULL,
  `flagged` tinyint(4) default '0',
  `flagdelete` tinyint(4) default '0',
  `flagcomment` varchar(500) default NULL,
  `resizedimageurl` varchar(500) default NULL,
  `url` varchar(500) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,NULL,NULL,'doc1_1_1247206589485.doc',NULL,'title1','sdfsdf','Public',NULL,NULL,'2009-07-10','2009-07-10',NULL,1,1,NULL,NULL,NULL),(2,NULL,NULL,NULL,NULL,'title2','sureshtitile','Public',NULL,NULL,'2009-07-10','2009-11-11','suresh_1_1247206613070.jpg',1,0,NULL,NULL,NULL),(3,NULL,'440Hz-5sec_1_1247206629655.mp3',NULL,NULL,'title3','sfsdf','Public','Audio',NULL,'2009-07-10','2009-07-10',NULL,1,0,NULL,NULL,NULL),(4,NULL,NULL,'doc1_2_1247206877894.doc',NULL,'title4','sdafsadf','Public',NULL,NULL,'2009-07-10','2009-07-10',NULL,0,0,NULL,NULL,NULL),(5,NULL,NULL,NULL,NULL,'title4','sdfsdaf','Public',NULL,NULL,'2009-07-10','2009-07-10','sunitha_2_1247206895176.jpg',1,0,NULL,NULL,NULL),(6,NULL,'440Hz-5sec_2_1247206908189.mp3',NULL,NULL,'title4','sdfsdaf','Public','Audio',NULL,'2009-07-10','2009-07-10',NULL,0,0,NULL,NULL,NULL),(7,NULL,NULL,'doc1_3_1247207091133.doc',NULL,'title4','sdfsdaf','Public',NULL,NULL,'2009-07-10','2009-07-10',NULL,0,0,NULL,NULL,NULL),(8,NULL,NULL,NULL,NULL,'title4','sdfsdaf','Public',NULL,NULL,'2009-07-10','2009-07-10','endeavour_3_1247207105194.jpg',0,0,NULL,NULL,NULL),(9,NULL,'440Hz-5sec_3_1247207119145.mp3',NULL,NULL,'title4','sfsdfsd','Public','Audio',NULL,'2009-07-10','2009-07-10',NULL,0,0,NULL,NULL,NULL),(10,NULL,NULL,'doc1_4_1247208688275.doc',NULL,'title4','fsda','Public',NULL,NULL,'2009-07-10','2009-07-10',NULL,0,0,NULL,NULL,NULL),(11,NULL,NULL,NULL,NULL,'title4','sdfsdaf','Public',NULL,NULL,'2009-07-10','2009-07-10','patni_4_1247208703730.jpg',0,0,NULL,NULL,NULL),(12,NULL,'440Hz-5sec_4_1247208719060.mp3',NULL,NULL,'title4','sfsdf','Public','Audio',NULL,'2009-07-10','2009-07-10',NULL,0,0,NULL,NULL,NULL),(13,NULL,NULL,'doc1_17_1248755838489.doc',NULL,'title4','sdfsdf','Public',NULL,NULL,'2009-07-28','2009-07-28',NULL,0,0,NULL,NULL,NULL),(14,NULL,NULL,NULL,NULL,'title4','ssdf','Public',NULL,NULL,'2009-07-28','2009-07-28','suresh_17_1248755858547.jpg',1,0,'',NULL,NULL),(15,NULL,NULL,'doc1_24_1251191296113.doc',NULL,'title4','sdfsd','Public',NULL,NULL,'2009-08-25','2009-08-25',NULL,1,0,NULL,NULL,NULL),(16,NULL,NULL,'CH01_24_1251191326989.PDF',NULL,'title4','pdf','Public',NULL,NULL,'2009-08-25','2009-08-25',NULL,1,0,NULL,NULL,NULL),(17,NULL,NULL,'New Microsoft Word Document_1_1252647995986.doc',NULL,'title4','ssfsdf','Public',NULL,NULL,'2009-09-11','2009-09-11',NULL,1,0,NULL,NULL,NULL),(18,NULL,NULL,'New Microsoft Word Document_1_1252648007752.doc',NULL,'title4','dgf','Public',NULL,NULL,'2009-09-11','2009-09-11',NULL,1,0,NULL,NULL,NULL),(19,NULL,NULL,'New Microsoft Word Document_1_1252648017190.doc',NULL,'title4','sdfsd','Public',NULL,NULL,'2009-09-11','2009-09-11',NULL,1,0,NULL,NULL,NULL),(20,NULL,NULL,'New Microsoft Word Document_1_1252648027440.doc',NULL,'title4','sadf','Public',NULL,NULL,'2009-09-11','2009-09-11',NULL,1,0,NULL,NULL,NULL),(21,NULL,NULL,'New Microsoft Word Document_1_1252648037362.doc',NULL,'title4','sdfsd','Public',NULL,NULL,'2009-09-11','2009-09-11',NULL,1,0,NULL,NULL,NULL),(22,NULL,NULL,NULL,NULL,NULL,'sfsdaf','Public',NULL,NULL,'2009-11-10','2009-11-10','suresh_81_1257830921825.jpg',1,0,'huuu',NULL,NULL),(23,NULL,NULL,NULL,NULL,NULL,'Admin','Contact',NULL,NULL,'2009-11-13','2009-11-13','DiskUsage_81_1258097048503.JPG',1,1,NULL,NULL,NULL),(24,NULL,NULL,NULL,NULL,NULL,'ddsf','Superior',NULL,NULL,'2009-11-13','2009-11-13','CPU_84_1258098091500.jpg',1,1,NULL,NULL,NULL),(25,NULL,NULL,NULL,NULL,NULL,'abc Profile','Contact',NULL,NULL,'2009-11-13','2009-11-13','CPU_84_1258098124179.jpg',1,0,NULL,NULL,NULL),(26,NULL,NULL,NULL,NULL,NULL,'abc','Public',NULL,NULL,'2009-11-13','2009-11-13','Capture_84_1258098143672.JPG',1,0,NULL,NULL,NULL),(27,NULL,NULL,NULL,NULL,NULL,'aaaa','Public',NULL,NULL,'2009-11-13','2009-11-13','Mobadmin_84_1258098170076.jpg',1,0,NULL,NULL,NULL),(28,NULL,NULL,NULL,NULL,NULL,'aaaa','Public',NULL,NULL,'2009-11-13','2009-11-13','Mobadmin_84_1258098175561.jpg',1,0,NULL,NULL,NULL),(29,NULL,NULL,NULL,NULL,NULL,'dfgdf','Public',NULL,NULL,'2009-11-20','2009-11-20','Garden_89_1258699134020.jpg',1,0,NULL,NULL,NULL),(30,NULL,NULL,NULL,NULL,NULL,'aaaa','Public',NULL,NULL,'2009-11-27','2009-11-27','Green Sea Turtle_103_1259324719884.jpg',0,0,NULL,NULL,NULL),(31,NULL,NULL,NULL,NULL,NULL,'aaaa','Public',NULL,NULL,'2009-11-27','2009-11-27','Green Sea Turtle_104_1259327865994.jpg',0,0,NULL,NULL,NULL),(32,NULL,NULL,'Hibernate%20Tutorial%2009_104_1259328772620.pdf',NULL,NULL,'docccccccccccccc','Public',NULL,NULL,'2009-11-27','2009-11-27',NULL,0,0,NULL,NULL,NULL),(33,NULL,NULL,'hibernate_reference_104_1259328820245.pdf',NULL,NULL,' xc xcvzxcv','Public',NULL,NULL,'2009-11-27','2009-11-27',NULL,0,0,NULL,NULL,NULL),(34,NULL,NULL,NULL,NULL,NULL,'aaaaaa','Public',NULL,NULL,'2009-11-27','2009-11-27','Desert Landscape_91_1259331601627.jpg',0,0,NULL,NULL,NULL),(35,NULL,NULL,'Hibernate%20Tutorial%2009_91_1259393844217.pdf',NULL,NULL,'aaaaaa','Public',NULL,NULL,'2009-11-28','2009-11-28',NULL,0,0,NULL,NULL,NULL),(36,NULL,NULL,NULL,NULL,NULL,'Profile11','Public',NULL,NULL,'2009-12-02','2009-12-02','Green Sea Turtle_87_1259730710792.jpg',1,0,NULL,NULL,NULL),(37,NULL,NULL,NULL,NULL,NULL,'a','Public',NULL,NULL,'2009-12-02','2009-12-02','Tree_88_1259731256520.jpg',0,0,NULL,NULL,NULL),(38,NULL,NULL,'new issue_88_1259731669494.doc',NULL,NULL,'aa','Public',NULL,NULL,'2009-12-02','2009-12-02',NULL,0,0,NULL,NULL,NULL),(39,NULL,NULL,'new issue (3)_88_1259733702531.doc',NULL,NULL,'TestSrc','Public',NULL,NULL,'2009-12-02','2009-12-02',NULL,0,0,NULL,NULL,NULL),(40,NULL,NULL,NULL,NULL,NULL,'TestNew Photo','Public',NULL,NULL,'2009-12-02','2009-12-02','Tree_88_1259733859023.jpg',0,0,NULL,NULL,NULL),(41,NULL,NULL,'Parjanya_TextonScreens_108_1259737071656.xls',NULL,NULL,'Chandrika_Profile','Public',NULL,NULL,'2009-12-02','2009-12-02',NULL,0,0,NULL,NULL,NULL),(42,NULL,NULL,'UN_PWD_112_1260334602786.txt',NULL,NULL,'bb','Superior',NULL,NULL,'2009-12-09','2009-12-09',NULL,0,0,NULL,NULL,NULL),(43,NULL,NULL,NULL,NULL,NULL,'aaaa','Public',NULL,NULL,'2009-12-24','2009-12-24','Green Sea Turtle_91_1261647467299.jpg',0,0,NULL,NULL,NULL),(44,NULL,NULL,NULL,NULL,NULL,NULL,'Public',NULL,NULL,'2010-01-15','2010-01-15',NULL,0,0,NULL,NULL,'www.myOwnBriefcase.com'),(45,NULL,NULL,NULL,NULL,NULL,NULL,'Contact',NULL,NULL,'2010-01-15','2010-01-15',NULL,0,0,NULL,NULL,'www.myOwnBriefcase.com'),(46,NULL,NULL,NULL,NULL,NULL,NULL,'Contact',NULL,NULL,'2010-01-15','2010-01-15',NULL,0,0,NULL,NULL,'www.myOwnBriefcase.com'),(47,NULL,NULL,NULL,NULL,NULL,NULL,'Contact',NULL,NULL,'2010-02-01','2010-02-01',NULL,0,0,NULL,NULL,'http://www.myOwnBriefcase.com'),(48,NULL,NULL,NULL,NULL,NULL,'mob server','Public',NULL,NULL,'2010-02-01','2010-02-01',NULL,0,0,NULL,NULL,'http://www.myownbriefcase.com:8080/WebApp_ID/employee/myGroup.action'),(49,NULL,NULL,'Business Scope & IT Landscape Analysis_173_1267003529705.pdf',NULL,NULL,'fg','Public',NULL,NULL,'2010-02-24','2010-02-24',NULL,1,0,NULL,NULL,NULL),(51,NULL,NULL,'User_Guide_TradeWorkSheets_169_1267028583134.doc',NULL,NULL,'hi','Contact',NULL,NULL,'2010-02-24','2010-02-24',NULL,1,0,NULL,NULL,NULL),(52,NULL,NULL,'New Microsoft Word Document_169_1267100002013.doc',NULL,NULL,'dfgd','Public',NULL,NULL,'2010-02-25','2010-02-25',NULL,0,0,NULL,NULL,NULL),(53,NULL,NULL,'New Microsoft Word Document (2)_173_1267453142321.doc',NULL,NULL,'a3@a.com','Trusted Potential Employer',NULL,NULL,'2010-03-01','2010-03-01',NULL,0,0,NULL,NULL,NULL),(54,NULL,NULL,'doc1_1_1242814877264_175_1267505460837.doc',NULL,NULL,'XML Profile','Public',NULL,NULL,'2010-03-02','2010-03-02',NULL,0,0,NULL,NULL,NULL),(55,NULL,NULL,'Basic-Swing_176_1267507981155.pdf',NULL,NULL,'newDocumentItem','Public',NULL,NULL,'2010-03-02','2010-03-02',NULL,1,0,NULL,NULL,NULL),(56,NULL,NULL,NULL,NULL,NULL,'NewItemPhoto','Public',NULL,NULL,'2010-03-02','2010-03-02','Desert Landscape_175_1267508044858.jpg',0,0,NULL,NULL,NULL),(57,NULL,NULL,NULL,NULL,NULL,'newLink','Public',NULL,NULL,'2010-03-02','2010-03-02',NULL,0,0,NULL,NULL,'http://www.myOwnBriefcase.com'),(58,NULL,NULL,NULL,NULL,NULL,'New Profilea','Public',NULL,NULL,'2010-03-09','2010-03-09',NULL,0,0,NULL,NULL,'http://www.myOwnBriefcase.com'),(59,NULL,NULL,NULL,NULL,NULL,'myOwnBriefcase.com','Public',NULL,NULL,'2010-03-15','2010-03-15',NULL,0,0,NULL,NULL,'http://www.myOwnBriefcase.com'),(60,NULL,NULL,NULL,NULL,NULL,'Java_Profile','Public',NULL,NULL,'2010-04-06','2010-04-06',NULL,0,0,NULL,NULL,'http://www.myOwnBriefcase.com'),(61,NULL,NULL,'Search_220_1270553883139.txt',NULL,NULL,'New_Text_Item','Public',NULL,NULL,'2010-04-06','2010-04-06',NULL,0,0,NULL,NULL,NULL),(62,NULL,NULL,NULL,NULL,NULL,'Vidya_Profile','Public',NULL,NULL,'2010-04-19','2010-04-19','Winter Leaves_233_1271685961375.jpg',0,0,NULL,NULL,NULL),(63,NULL,NULL,NULL,NULL,NULL,'New_Profile','Public',NULL,NULL,'2010-04-19','2010-04-19','Frangipani Flowers_236_1271686205542.jpg',0,0,NULL,NULL,NULL),(64,NULL,NULL,'user_242_1271915892207.xls',NULL,NULL,'New_JAva_Item','Contact',NULL,NULL,'2010-04-22','2010-04-22',NULL,0,0,NULL,NULL,NULL),(65,NULL,NULL,NULL,NULL,NULL,'Photo','Public',NULL,NULL,'2010-04-22','2010-04-22','Winter Leaves_242_1271917385188.jpg',0,0,NULL,NULL,NULL),(66,NULL,NULL,'dbquerySample_245_1271920457979.doc',NULL,NULL,'Java_New','Public',NULL,NULL,'2010-04-22','2010-04-22',NULL,0,0,NULL,NULL,NULL),(67,NULL,NULL,'user_184_1271947780795.xls',NULL,NULL,'Item_name','Public',NULL,NULL,'2010-04-22','2010-04-22',NULL,0,0,NULL,NULL,NULL),(69,NULL,NULL,NULL,NULL,NULL,'aadfddd','Public',NULL,NULL,'2010-04-22','2010-06-03','Frangipani Flowers_184_1271951184798.jpg',0,0,NULL,NULL,NULL),(70,NULL,NULL,'user_309_1272518091845.xls',NULL,NULL,'Java','Contact',NULL,NULL,'2010-04-29','2010-04-29',NULL,0,0,NULL,NULL,NULL),(71,NULL,NULL,'user_108_1272608715959.xls',NULL,NULL,'Endevour_Profile1','Public',NULL,NULL,'2010-04-30','2010-04-30',NULL,0,0,NULL,NULL,NULL),(72,NULL,NULL,NULL,NULL,NULL,'TestImage','Public',NULL,NULL,'2010-04-30','2010-04-30','Desert Landscape_108_1272621349265.jpg',0,0,NULL,NULL,NULL),(73,NULL,NULL,'New Text Document (3)_184_1274961420846.txt',NULL,NULL,'asdasdasd','Public',NULL,NULL,'2010-05-27','2010-05-27',NULL,0,0,NULL,NULL,NULL),(74,NULL,NULL,NULL,NULL,NULL,'asd','Public',NULL,NULL,'2010-05-27','2010-05-27','choose_184_1274961436630.jpg',0,0,NULL,NULL,NULL),(75,'asdasda&feature=channel',NULL,NULL,NULL,NULL,'asdasdasd','Public','Video',NULL,'2010-05-27','2010-05-27',NULL,0,0,NULL,NULL,NULL),(76,NULL,NULL,NULL,NULL,NULL,'sdfasfas','Public',NULL,NULL,'2010-05-27','2010-05-27',NULL,0,0,NULL,NULL,'http://www.gogole.com/'),(77,NULL,NULL,NULL,NULL,NULL,'sdfs','Contact',NULL,NULL,'2010-06-03','2010-06-03','Forest Flowers_380_1275547389497.jpg',0,0,NULL,NULL,NULL),(78,NULL,NULL,NULL,NULL,NULL,'asdsa','Contact',NULL,NULL,'2010-06-03','2010-06-03','Desert Landscape_184_1275547745370.jpg',0,0,NULL,NULL,NULL),(79,NULL,NULL,NULL,NULL,NULL,'asaS','Public',NULL,NULL,'2010-06-03','2010-06-03','Garden_237_1275548441777.jpg',0,0,NULL,NULL,NULL),(80,NULL,NULL,NULL,NULL,NULL,'dsfsdf','Public',NULL,NULL,'2010-06-03','2010-06-03','Frangipani Flowers_237_1275548746035.jpg',0,0,NULL,NULL,NULL),(81,NULL,NULL,'JasonResume-102107_518_1276907128448.pdf',NULL,NULL,'MyResume','Public',NULL,NULL,'2010-06-18','2010-06-18',NULL,1,0,NULL,NULL,NULL),(84,NULL,NULL,NULL,NULL,NULL,'VIPbooker','Public',NULL,NULL,'2010-06-18','2010-06-18',NULL,0,0,NULL,NULL,'http://www.vipbooker.com'),(85,'http://www.youtube.com/watch?v=Bjl7WBVlYdo&feature=channel',NULL,NULL,NULL,NULL,'iPad Funny','Public','Video',NULL,'2010-06-18','2010-06-18',NULL,0,1,NULL,NULL,NULL),(87,NULL,'06 - My Name Is Billa - Ranjith, Naveen_513_1278925739442.mp3',NULL,NULL,NULL,'song','Public','Audio',NULL,'2010-07-12','2010-07-12',NULL,0,0,NULL,NULL,NULL),(88,NULL,NULL,NULL,NULL,NULL,'Drumming','Public',NULL,NULL,'2010-07-12','2010-07-12','drum-pic_518_1278950999409.jpg',0,0,NULL,'min_drum-pic_518_1278950999409.jpg',NULL),(91,NULL,'Bryan Adams-Back To You_513_1279018519273.mp3',NULL,NULL,NULL,'album','Public','Audio',NULL,'2010-07-13','2010-07-13',NULL,0,0,NULL,NULL,NULL),(92,NULL,'11-zion_i-coastin_(feat_kflay)_518_1279033218620.mp3',NULL,NULL,NULL,'Zion - Coastin','Public','Audio',NULL,'2010-07-13','2010-07-13',NULL,0,0,NULL,NULL,NULL),(93,NULL,'06 Swimming In the Flood_518_1279033859741.mp3',NULL,NULL,NULL,'Swimming In The Flood','Public','Audio',NULL,'2010-07-13','2010-07-13',NULL,0,0,NULL,NULL,NULL),(94,NULL,'Bryan Adams-Summer Of \'69_528_1279274719508.mp3',NULL,NULL,NULL,'new1','Public','Audio',NULL,'2010-07-16','2010-07-16',NULL,0,0,NULL,NULL,NULL),(95,NULL,NULL,NULL,NULL,NULL,'FailTrain','Public',NULL,NULL,'2010-07-22','2010-07-22','epic-fail-train_518_1279782197629.jpg',0,0,NULL,'min_epic-fail-train_518_1279782197629.jpg',NULL),(96,NULL,NULL,NULL,NULL,NULL,'Jumping','Public',NULL,NULL,'2010-07-22','2010-07-22','jason_jumps_518_1279782219206.jpg',0,0,NULL,'min_jason_jumps_518_1279782219206.jpg',NULL),(97,NULL,NULL,NULL,NULL,NULL,'Lambo','Public',NULL,NULL,'2010-08-02','2010-08-02','lambo_530_1280792421609.jpg',0,0,NULL,'min_lambo_530_1280792421609.jpg',NULL),(98,NULL,'OKKASARI_CHEPPALEVA___NUVVU_514_1281456289776.MP3',NULL,NULL,NULL,'asdf','Public','Audio',NULL,'2010-08-10','2010-08-10',NULL,0,0,NULL,NULL,NULL),(99,NULL,NULL,NULL,NULL,NULL,'asd','Public','Audio',NULL,'2010-08-10','2010-08-10',NULL,0,0,NULL,NULL,NULL),(100,NULL,NULL,NULL,NULL,NULL,'zxzczxc','Public','Audio',NULL,'2010-08-10','2010-08-10',NULL,0,0,NULL,NULL,NULL),(101,NULL,NULL,NULL,NULL,NULL,'asssssssssssss','Contact','Audio',NULL,'2010-08-10','2010-08-10',NULL,0,0,NULL,NULL,NULL),(102,NULL,'EeNaadeYedo_514_1281457442301.mp3',NULL,NULL,NULL,'sssssssssssssss','Friend','Audio',NULL,'2010-08-10','2010-08-10',NULL,0,0,NULL,NULL,NULL),(103,NULL,NULL,NULL,NULL,NULL,'vedham','Public','Audio',NULL,'2010-08-10','2010-08-10',NULL,0,0,NULL,NULL,NULL),(104,NULL,NULL,NULL,NULL,NULL,'Mysto and Pizzi true inspirations!','Public',NULL,NULL,'2010-09-03','2010-09-03',NULL,0,0,NULL,NULL,'http://www.mystoandpizzi.com/'),(105,NULL,'somebodyswatchingme_540_1283556574732.mp3',NULL,NULL,NULL,'somebodys watching me','Public','Audio',NULL,'2010-09-03','2010-09-03',NULL,0,0,NULL,NULL,NULL),(106,NULL,NULL,NULL,NULL,NULL,'Me at Fluxx','Friend',NULL,NULL,'2010-09-03','2010-09-03','22340_4023961_540_1283556812269.jpg',0,0,NULL,'min_22340_4023961_540_1283556812269.jpg',NULL),(107,NULL,'(Muita Bobeira)_514_1283873937501.wma',NULL,NULL,NULL,'sdasd','Contact','Audio',NULL,'2010-09-07','2010-09-07',NULL,0,0,NULL,NULL,NULL),(108,NULL,'01 Khuda Jaane_514_1283874221554.mp3',NULL,NULL,NULL,'asad','Contact','Audio',NULL,'2010-09-07','2010-09-07',NULL,0,0,NULL,NULL,NULL),(109,NULL,'(Khuda Jaane)_514_1283874380819.mp3',NULL,NULL,NULL,'sdfs','Superior','Audio',NULL,'2010-09-07','2010-09-07',NULL,0,0,NULL,NULL,NULL),(110,NULL,'(Khuda Jaane)_514_1283874519090.mP3',NULL,NULL,NULL,'dfgdfg','Friend','Audio',NULL,'2010-09-07','2010-09-07',NULL,0,0,NULL,NULL,NULL),(111,NULL,'01 - mstrkrft - two more years (bloc party remix)_518_1283876112889.mp3',NULL,NULL,NULL,'Testttt','Public','Audio',NULL,'2010-09-07','2010-09-07',NULL,0,0,NULL,NULL,NULL),(112,NULL,NULL,NULL,NULL,NULL,'Sample','Public',NULL,NULL,'2010-09-24','2010-09-24','carrie_feature_50_554_1285366171525.jpg',0,0,NULL,'min_carrie_feature_50_554_1285366171525.jpg',NULL),(118,'http://vimeo.com/9775543&feature=channel',NULL,NULL,NULL,NULL,'Hapa Haoli','Public','Video',NULL,'2010-09-24','2010-09-24',NULL,0,0,NULL,NULL,NULL),(119,'http://www.facebook.com/video/video.php?v=1275801388297&feature=channel',NULL,NULL,NULL,NULL,'Sweetheart Event','Public','Video',NULL,'2010-09-24','2010-09-24',NULL,0,0,NULL,NULL,NULL),(120,NULL,NULL,NULL,NULL,NULL,'Hapa Haoli Group on Facebook','Public',NULL,NULL,'2010-09-24','2010-09-24',NULL,0,0,NULL,NULL,'http://www.facebook.com/hapahaoli'),(122,'http://www.youtube.com/watch?v=sYta3_HRkXY&feature=popular',NULL,NULL,NULL,NULL,'Testing','Public','Video',NULL,'2010-09-25','2010-09-25',NULL,0,0,NULL,NULL,NULL),(123,'http://www.youtube.com/watch?v=gujB7A5ycew&feature=channel',NULL,NULL,NULL,NULL,'Tiesto','Private','Video',NULL,'2010-09-27','2010-09-27',NULL,0,0,NULL,NULL,NULL),(124,'http://www.youtube.com/watch?v=m0yq--xZYBw&feature=channel',NULL,NULL,NULL,NULL,'Hapa Test','Public','Video',NULL,'2010-09-27','2010-09-27',NULL,0,0,NULL,NULL,NULL),(127,NULL,NULL,NULL,NULL,NULL,'EDC 09','Public',NULL,NULL,'2010-10-19','2010-10-19','deadmau5_563_1287538032712.jpg',0,0,NULL,'min_deadmau5_563_1287538032712.jpg',NULL),(128,NULL,NULL,NULL,NULL,NULL,'Fluxx 10','Public',NULL,NULL,'2010-10-26','2010-10-26','22340_4023961_563_1288146763482.jpg',0,0,NULL,'min_22340_4023961_563_1288146763482.jpg',NULL),(129,NULL,NULL,NULL,NULL,NULL,'Fluxx 10 \"2\"','Public',NULL,NULL,'2010-10-26','2010-10-26','fluxx18_t620_563_1288146803620.jpg',0,0,NULL,'min_fluxx18_t620_563_1288146803620.jpg',NULL),(130,NULL,'Jgizz_563_1288146897365.mp3',NULL,NULL,NULL,'Jordan n0thing Gilbert Feat. DJ r3gan','Public','Audio',NULL,'2010-10-26','2010-10-26',NULL,0,0,NULL,NULL,NULL),(131,'http://www.youtube.com/watch?v=ulKtbvzkqY4&feature=channel',NULL,NULL,NULL,NULL,'Mysto and Pizzi Beatmaking Wed! 9.08.10','Public','Video',NULL,'2010-10-26','2010-10-26',NULL,0,0,NULL,NULL,NULL),(132,NULL,NULL,NULL,NULL,NULL,'Deadmau5','Public',NULL,NULL,'2010-10-26','2010-10-26',NULL,0,0,NULL,NULL,'http://www.deadmau5.com/'),(133,NULL,NULL,NULL,NULL,NULL,'Mysto and Pizzi','Public',NULL,NULL,'2010-10-26','2010-10-26',NULL,0,0,NULL,NULL,'http://www.mystoandpizzi.com/'),(134,'http://www.wimp.com/russianbeatboxer/&feature=channel',NULL,NULL,NULL,NULL,'Russian BeatBoxer','Public','Video',NULL,'2010-10-27','2010-10-27',NULL,0,0,NULL,NULL,NULL),(135,NULL,NULL,NULL,NULL,NULL,'Bentley','Public',NULL,NULL,'2010-11-07','2010-11-07','Bentley 002_564_1289169287972.jpg',0,0,NULL,'min_Bentley 002_564_1289169287972.jpg',NULL),(138,NULL,NULL,'JRTEMP1_564_1289169528658.docx',NULL,NULL,'test doc 1','Public',NULL,NULL,'2010-11-07','2010-11-07',NULL,0,0,NULL,NULL,NULL),(139,'http://www.youtube.com/watch?v=8y24aLSNEYA&feature=channel',NULL,NULL,NULL,NULL,'Rivers','Public','Video',NULL,'2010-11-07','2010-11-07',NULL,0,0,NULL,NULL,NULL),(140,'http://www.youtube.com/watch?v=Bjl7WBVlYdo&feature=channel',NULL,NULL,NULL,NULL,'TEST','Public','Video',NULL,'2010-11-07','2010-11-07',NULL,0,0,NULL,NULL,NULL),(141,NULL,NULL,NULL,NULL,NULL,'Test','Public',NULL,NULL,'2010-11-10','2010-11-10',NULL,0,0,NULL,NULL,'http://vipbooker.com'),(142,NULL,NULL,NULL,NULL,NULL,'test','Private',NULL,NULL,'2010-12-09','2010-12-09',NULL,0,0,NULL,NULL,'google.com'),(143,NULL,NULL,'pl_emical_573_1291889763963.xls',NULL,NULL,'zxzx','Public',NULL,NULL,'2010-12-09','2010-12-09',NULL,0,0,NULL,NULL,NULL),(144,NULL,NULL,'servlets_573_1291889809542.docx',NULL,NULL,'ewrwe','Public',NULL,NULL,'2010-12-09','2010-12-09',NULL,0,0,NULL,NULL,NULL),(146,NULL,NULL,'Tried N True_590_1292217280563.pdf',NULL,NULL,'Tried N True','Public',NULL,NULL,'2010-12-12','2010-12-12',NULL,0,0,NULL,NULL,NULL),(147,NULL,NULL,NULL,NULL,NULL,'Workout','Public',NULL,NULL,'2010-12-12','2010-12-12','_DSC1569-1b-1-4_15_590_1292217326454.jpg',0,0,NULL,'min__DSC1569-1b-1-4_15_590_1292217326454.jpg',NULL),(148,'http://www.youtube.com/watch?v=cuSftZWpsIM&feature=channel',NULL,NULL,NULL,NULL,'LT','Public','Video',NULL,'2010-12-12','2010-12-12',NULL,0,0,NULL,NULL,NULL),(149,'http://www.youtube.com/watch?v=43sYSMHYf-Q&feature=channel',NULL,NULL,NULL,NULL,'Kobe','Public','Video',NULL,'2010-12-13','2010-12-13',NULL,0,0,NULL,NULL,NULL),(150,NULL,NULL,'servlets_565_1292495494742.docx',NULL,NULL,'A','Public',NULL,NULL,'2010-12-16','2010-12-16',NULL,0,0,NULL,NULL,NULL),(151,NULL,NULL,'servlets_565_1292495498634.docx',NULL,NULL,'A','Public',NULL,NULL,'2010-12-16','2010-12-16',NULL,0,0,NULL,NULL,NULL),(152,NULL,NULL,'Integrated Design Document_MyOwnBriefcase_513_1294227417646.doc',NULL,NULL,'doc1','Private',NULL,NULL,'2011-01-05','2011-01-05',NULL,0,0,NULL,NULL,NULL),(153,NULL,NULL,'MOB-SDD-fifthdraft_513_1294227445168.doc',NULL,NULL,'doc2','Private',NULL,NULL,'2011-01-05','2011-01-05',NULL,0,0,NULL,NULL,NULL),(154,NULL,NULL,'MOB-SDD-FirstDraft_513_1294227543529.doc',NULL,NULL,'doc3','Private',NULL,NULL,'2011-01-05','2011-01-05',NULL,0,0,NULL,NULL,NULL),(155,NULL,NULL,'MOB-SDD-FourthDraft_513_1294227810905.doc',NULL,NULL,'doc4','Private',NULL,NULL,'2011-01-05','2011-01-05',NULL,0,0,NULL,NULL,NULL),(156,NULL,NULL,'MOB-SDD-SecondDraft_513_1294227838414.doc',NULL,NULL,'doc5','Private',NULL,NULL,'2011-01-05','2011-01-05',NULL,0,0,NULL,NULL,NULL),(157,NULL,NULL,'MOB-SDD-ThirdDraft_513_1294227868540.doc',NULL,NULL,'doc6','Private',NULL,NULL,'2011-01-05','2011-01-05',NULL,0,0,NULL,NULL,NULL),(158,NULL,NULL,'MOB1 5-SDD-091509_513_1294228012976.docx',NULL,NULL,'ddd','Private',NULL,NULL,'2011-01-05','2011-01-05',NULL,0,0,NULL,NULL,NULL),(159,NULL,NULL,'MOB2 0-SDD-021510_513_1294228029441.docx',NULL,NULL,'dddd','Private',NULL,NULL,'2011-01-05','2011-01-05',NULL,0,0,NULL,NULL,NULL),(160,NULL,NULL,'Javamob_594_1294750990159.docx',NULL,NULL,'mob','Public',NULL,NULL,'2011-01-11','2011-01-11',NULL,0,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemcount`
--

DROP TABLE IF EXISTS `itemcount`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `itemcount` (
  `id` bigint(20) NOT NULL auto_increment,
  `itemType` varchar(45) default NULL,
  `searchTerm` varchar(45) default NULL,
  `count` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=137 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `itemcount`
--

LOCK TABLES `itemcount` WRITE;
/*!40000 ALTER TABLE `itemcount` DISABLE KEYS */;
INSERT INTO `itemcount` VALUES (61,'1','B.A.',14),(62,'1','B.S.',3),(63,'1','M.S.',3),(64,'1','M.B.A.',4),(65,'4','Accounting',1),(66,'4','Airlines/Aviation',1),(67,'4','Alternative Medicine',1),(68,'4','Aviation & Aerospace',1),(69,'4','Banking',1),(70,'4','Biotechnology',1),(71,'4','Broadcast Media',1),(72,'4','Building Materials',1),(73,'4','Business Supplies and Equipment',1),(74,'4','Chemicals',1),(75,'4','Civic & Social Organization',1),(76,'4','Import & Export',1),(77,'4','Judiciary',1),(78,'4','Marketing & Advertising',1),(79,'7','a',3),(80,'7','e',1),(81,'7','Los Angeles',5),(82,'7','Bangalore',3),(83,'11','1',6),(84,'10','Redwood City',2),(85,'11','75k-100k',3),(86,'11','Under 30k',1),(87,'9','Business Supplies and Equipment',1),(88,'11','40k-50k',1),(89,'9','Aviation & Aerospace',3),(90,'9','Judiciary',2),(91,'10','Los Angeles',2),(92,'9','Building Materials',2),(93,'9','Civic & Social Organization',1),(94,'11','30k-40k',1),(95,'12','Corel Draw',1),(96,'12','CNC Machine Composite',1),(97,'12','C++',1),(98,'12','Brake Alignments',1),(99,'12','C++ Programming',2),(100,'12','ssss',1),(101,'12','dfdfgf',1),(102,'12','Java and j2ee',1),(103,'12','Cooking',1),(104,'12','Brake',1),(105,'12','Hammering',1),(106,'2','a',9),(107,'2','Bangalore',8),(108,'2','Los Angeles',10),(109,'2','Del Mar',2),(110,'5','e',1),(111,'5','i',1),(112,'5','Redwood City',1),(113,'5','Los Angeles',1),(114,'5','Del Mar',3),(115,'5','as',1),(116,'5','asdas',1),(117,'5','San Diego',1),(118,'5','qedasd',1),(119,'3','Java',1),(120,'3','J2EE',1),(121,'3','Python',1),(122,'3','sdf',1),(123,'3','er',1),(124,'3','Java/J2ee',1),(125,'3','CNC Machine Composite',2),(126,'3','undefined',4),(127,'3','saty',1),(128,'3','C++ Programming',2),(129,'3','Java and mob',1),(130,'3','SATYA',2),(131,'3','sdfdsf',1),(132,'3','Cleaning',1),(133,'3','java and satya',1),(134,'3','test',1),(135,'3','Testing custom skills',1),(136,'5','Round Hill',1);
/*!40000 ALTER TABLE `itemcount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_api`
--

DROP TABLE IF EXISTS `jforum_api`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_api` (
  `api_id` int(11) NOT NULL auto_increment,
  `api_key` varchar(32) NOT NULL,
  `api_validity` datetime NOT NULL,
  PRIMARY KEY  (`api_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_api`
--

LOCK TABLES `jforum_api` WRITE;
/*!40000 ALTER TABLE `jforum_api` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_api` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_attach`
--

DROP TABLE IF EXISTS `jforum_attach`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_attach` (
  `attach_id` int(11) NOT NULL auto_increment,
  `post_id` int(11) default NULL,
  `privmsgs_id` int(11) default NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY  (`attach_id`),
  KEY `idx_att_post` (`post_id`),
  KEY `idx_att_priv` (`privmsgs_id`),
  KEY `idx_att_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_attach`
--

LOCK TABLES `jforum_attach` WRITE;
/*!40000 ALTER TABLE `jforum_attach` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_attach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_attach_desc`
--

DROP TABLE IF EXISTS `jforum_attach_desc`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_attach_desc` (
  `attach_desc_id` int(11) NOT NULL auto_increment,
  `attach_id` int(11) NOT NULL,
  `physical_filename` varchar(255) NOT NULL,
  `real_filename` varchar(255) NOT NULL,
  `download_count` int(11) default NULL,
  `description` varchar(255) default NULL,
  `mimetype` varchar(50) default NULL,
  `filesize` int(11) default NULL,
  `upload_time` datetime default NULL,
  `thumb` tinyint(1) default '0',
  `extension_id` int(11) default NULL,
  PRIMARY KEY  (`attach_desc_id`),
  KEY `idx_att_d_att` (`attach_id`),
  KEY `idx_att_d_ext` (`extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_attach_desc`
--

LOCK TABLES `jforum_attach_desc` WRITE;
/*!40000 ALTER TABLE `jforum_attach_desc` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_attach_desc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_attach_quota`
--

DROP TABLE IF EXISTS `jforum_attach_quota`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_attach_quota` (
  `attach_quota_id` int(11) NOT NULL auto_increment,
  `group_id` int(11) NOT NULL,
  `quota_limit_id` int(11) NOT NULL,
  PRIMARY KEY  (`attach_quota_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_attach_quota`
--

LOCK TABLES `jforum_attach_quota` WRITE;
/*!40000 ALTER TABLE `jforum_attach_quota` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_attach_quota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_banlist`
--

DROP TABLE IF EXISTS `jforum_banlist`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_banlist` (
  `banlist_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `banlist_ip` varchar(15) default NULL,
  `banlist_email` varchar(255) default NULL,
  PRIMARY KEY  (`banlist_id`),
  KEY `idx_user` (`user_id`),
  KEY `banlist_ip` (`banlist_ip`),
  KEY `banlist_email` (`banlist_email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_banlist`
--

LOCK TABLES `jforum_banlist` WRITE;
/*!40000 ALTER TABLE `jforum_banlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_banlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_banner`
--

DROP TABLE IF EXISTS `jforum_banner`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_banner` (
  `banner_id` int(11) NOT NULL auto_increment,
  `banner_name` varchar(90) default NULL,
  `banner_placement` int(11) NOT NULL default '0',
  `banner_description` varchar(250) default NULL,
  `banner_clicks` int(11) NOT NULL default '0',
  `banner_views` int(11) NOT NULL default '0',
  `banner_url` varchar(250) default NULL,
  `banner_weight` tinyint(1) NOT NULL default '50',
  `banner_active` tinyint(1) NOT NULL default '0',
  `banner_comment` varchar(250) default NULL,
  `banner_type` int(11) NOT NULL default '0',
  `banner_width` int(11) NOT NULL default '0',
  `banner_height` int(11) NOT NULL default '0',
  PRIMARY KEY  (`banner_id`),
  KEY `banner_id` (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_banner`
--

LOCK TABLES `jforum_banner` WRITE;
/*!40000 ALTER TABLE `jforum_banner` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_bookmarks`
--

DROP TABLE IF EXISTS `jforum_bookmarks`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_bookmarks` (
  `bookmark_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `relation_id` int(11) NOT NULL,
  `relation_type` int(11) NOT NULL,
  `public_visible` int(11) default '1',
  `title` varchar(255) default NULL,
  `description` varchar(255) default NULL,
  PRIMARY KEY  (`bookmark_id`),
  KEY `book_idx_relation` (`relation_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_bookmarks`
--

LOCK TABLES `jforum_bookmarks` WRITE;
/*!40000 ALTER TABLE `jforum_bookmarks` DISABLE KEYS */;
INSERT INTO `jforum_bookmarks` VALUES (2,98,31,2,1,'XXXXxxxxxxxxxxxxx','satyaddfsdfsdf'),(3,98,37,2,1,'fdgdf','satya');
/*!40000 ALTER TABLE `jforum_bookmarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_categories`
--

DROP TABLE IF EXISTS `jforum_categories`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_categories` (
  `categories_id` int(11) NOT NULL auto_increment,
  `title` varchar(100) NOT NULL default '',
  `display_order` int(11) NOT NULL default '0',
  `moderated` tinyint(1) default '0',
  PRIMARY KEY  (`categories_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_categories`
--

LOCK TABLES `jforum_categories` WRITE;
/*!40000 ALTER TABLE `jforum_categories` DISABLE KEYS */;
INSERT INTO `jforum_categories` VALUES (4,'Employees',1,0),(6,'Employers',5,0),(7,'Just For Fun',6,0);
/*!40000 ALTER TABLE `jforum_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_config`
--

DROP TABLE IF EXISTS `jforum_config`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_config` (
  `config_name` varchar(255) NOT NULL default '',
  `config_value` varchar(255) NOT NULL default '',
  `config_id` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_config`
--

LOCK TABLES `jforum_config` WRITE;
/*!40000 ALTER TABLE `jforum_config` DISABLE KEYS */;
INSERT INTO `jforum_config` VALUES ('most.users.ever.online','5',1),('most.users.ever.online.date','1265779148393',2);
/*!40000 ALTER TABLE `jforum_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_extension_groups`
--

DROP TABLE IF EXISTS `jforum_extension_groups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_extension_groups` (
  `extension_group_id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `allow` tinyint(1) default '1',
  `upload_icon` varchar(100) default NULL,
  `download_mode` tinyint(1) default '1',
  PRIMARY KEY  (`extension_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_extension_groups`
--

LOCK TABLES `jforum_extension_groups` WRITE;
/*!40000 ALTER TABLE `jforum_extension_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_extension_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_extensions`
--

DROP TABLE IF EXISTS `jforum_extensions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_extensions` (
  `extension_id` int(11) NOT NULL auto_increment,
  `extension_group_id` int(11) NOT NULL,
  `description` varchar(100) default NULL,
  `upload_icon` varchar(100) default NULL,
  `extension` varchar(10) default NULL,
  `allow` tinyint(1) default '1',
  PRIMARY KEY  (`extension_id`),
  KEY `extension_group_id` (`extension_group_id`),
  KEY `extension` (`extension`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_extensions`
--

LOCK TABLES `jforum_extensions` WRITE;
/*!40000 ALTER TABLE `jforum_extensions` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_forums`
--

DROP TABLE IF EXISTS `jforum_forums`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_forums` (
  `forum_id` int(11) NOT NULL auto_increment,
  `categories_id` int(11) NOT NULL default '1',
  `forum_name` varchar(150) NOT NULL default '',
  `forum_desc` varchar(255) default NULL,
  `forum_order` int(11) default '1',
  `forum_topics` int(11) NOT NULL default '0',
  `forum_last_post_id` int(11) NOT NULL default '0',
  `moderated` tinyint(1) default '0',
  PRIMARY KEY  (`forum_id`),
  KEY `categories_id` (`categories_id`),
  KEY `idx_forums_cats` (`categories_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_forums`
--

LOCK TABLES `jforum_forums` WRITE;
/*!40000 ALTER TABLE `jforum_forums` DISABLE KEYS */;
INSERT INTO `jforum_forums` VALUES (7,4,'Interviews Tips & Tricks','How to dress, what to say, what to know ahead of time. Tell us all your best secrets for how to nail an interview!',2,3,148,0),(8,6,'How To Find The Best Employees','Finding the right employee is incredibly important to the well being of your business. How do you go about finding the best candidates?\'',3,2,149,0),(10,6,'Money Saving Tricks','Its a tough market, tell us your tips and tricks for how you save money running your business!',4,3,142,0),(11,4,'Networking','Networking networking networking. Its all about who you know. How do you build a good network?\'',5,2,146,0),(12,4,'Resources','Links and resources for the job application process.',6,1,144,0),(13,4,'How To Get Started','Don\'t know what you want kind of career you want? Discuss your future with others and find your calling.',7,4,140,0),(14,6,'Employer Networking','Networking is important for employers too. Strategic partnerships, cross promotion, don\'t miss out on forging relationships with other companies.',8,0,0,0),(15,7,'Jokes','Sometimes the job market can just be too stressful, cool off here with some funny jokes.',9,1,136,0),(16,4,'Horror Stories','Do you have a hilarious story about being interviewed? Tell us the worst thing that has happened to you whether you are an employer or an employee!',10,3,135,0);
/*!40000 ALTER TABLE `jforum_forums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_forums_watch`
--

DROP TABLE IF EXISTS `jforum_forums_watch`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_forums_watch` (
  `forum_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  KEY `idx_fw_forum` (`forum_id`),
  KEY `idx_fw_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_forums_watch`
--

LOCK TABLES `jforum_forums_watch` WRITE;
/*!40000 ALTER TABLE `jforum_forums_watch` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_forums_watch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_groups`
--

DROP TABLE IF EXISTS `jforum_groups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_groups` (
  `group_id` int(11) NOT NULL auto_increment,
  `group_name` varchar(40) NOT NULL default '',
  `group_description` varchar(255) default NULL,
  `parent_id` int(11) default '0',
  PRIMARY KEY  (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_groups`
--

LOCK TABLES `jforum_groups` WRITE;
/*!40000 ALTER TABLE `jforum_groups` DISABLE KEYS */;
INSERT INTO `jforum_groups` VALUES (1,'General','General Users',0),(2,'Administration','Admin Users',0);
/*!40000 ALTER TABLE `jforum_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_karma`
--

DROP TABLE IF EXISTS `jforum_karma`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_karma` (
  `karma_id` int(11) NOT NULL auto_increment,
  `post_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `post_user_id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  `rate_date` datetime default NULL,
  PRIMARY KEY  (`karma_id`),
  KEY `post_id` (`post_id`),
  KEY `topic_id` (`topic_id`),
  KEY `post_user_id` (`post_user_id`),
  KEY `from_user_id` (`from_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_karma`
--

LOCK TABLES `jforum_karma` WRITE;
/*!40000 ALTER TABLE `jforum_karma` DISABLE KEYS */;
INSERT INTO `jforum_karma` VALUES (1,43,32,1,98,5,'2010-02-10 17:09:25'),(2,69,42,1,98,5,'2010-02-11 17:51:01'),(3,80,32,1,98,5,'2010-02-11 17:55:51'),(4,48,34,98,101,5,'2010-02-12 09:52:27'),(5,77,34,98,101,5,'2010-02-12 09:52:39'),(6,73,36,98,101,5,'2010-02-12 09:55:39'),(7,62,36,98,101,4,'2010-02-12 09:55:44'),(8,84,34,101,98,5,'2010-02-12 10:12:39'),(9,99,46,98,101,3,'2010-02-15 16:10:10'),(10,121,57,203,198,5,'2010-07-26 03:07:51'),(11,132,65,198,2,3,'2010-07-26 04:25:49'),(12,124,60,198,2,5,'2010-07-26 04:29:34');
/*!40000 ALTER TABLE `jforum_karma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_mail_integration`
--

DROP TABLE IF EXISTS `jforum_mail_integration`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_mail_integration` (
  `forum_id` int(11) NOT NULL,
  `forum_email` varchar(100) NOT NULL,
  `pop_username` varchar(100) NOT NULL,
  `pop_password` varchar(100) NOT NULL,
  `pop_host` varchar(100) NOT NULL,
  `pop_port` int(11) default '110',
  `pop_ssl` tinyint(4) default '0',
  KEY `forum_id` (`forum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_mail_integration`
--

LOCK TABLES `jforum_mail_integration` WRITE;
/*!40000 ALTER TABLE `jforum_mail_integration` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_mail_integration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_moderation_log`
--

DROP TABLE IF EXISTS `jforum_moderation_log`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_moderation_log` (
  `log_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `log_description` text NOT NULL,
  `log_original_message` text,
  `log_date` datetime NOT NULL,
  `log_type` tinyint(4) default '0',
  `post_id` int(11) default '0',
  `topic_id` int(11) default '0',
  `post_user_id` int(11) default '0',
  PRIMARY KEY  (`log_id`),
  KEY `user_id` (`user_id`),
  KEY `post_user_id` (`post_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_moderation_log`
--

LOCK TABLES `jforum_moderation_log` WRITE;
/*!40000 ALTER TABLE `jforum_moderation_log` DISABLE KEYS */;
INSERT INTO `jforum_moderation_log` VALUES (1,98,'dfdf','gggggggggggggggggggggggggggfdddddddddddddd','2010-02-10 12:03:04',1,56,0,98),(2,98,'dffff','hjghj','2010-02-10 12:03:08',1,57,0,98),(3,98,'asaS','dfgfgsdf dfg df','2010-02-10 19:21:57',1,21,0,98),(4,98,'asASa','dfgdfgdfg dg dfg dfg dfgdfg dfgsdfg','2010-02-10 19:22:04',1,22,0,98),(5,98,'asa','kkkkkkkkkkkkkkk','2010-02-10 19:22:11',1,23,0,98),(6,101,'sdddddddddddd','hi i want to learn html so\\\\\\\\','2010-02-12 09:52:18',2,48,34,98),(7,101,'sd','fgggggggggggggggggggg','2010-02-12 09:52:34',2,77,34,98),(8,98,'rttttttt','[quote=SQL Profile ]sdfffffffffffffffff[/quote]sdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsd','2010-02-12 10:12:59',2,84,34,101),(9,101,'asdasd','dfgdfgdfs sfddsadfasdfasdfasdfasdfsadffsdaf sdfasdfasdfsadfsd sdaf sdf sadfsdaffsda sdfsadfasdf asdfasdfasdfasd fasdfsdf sdsdf sdfdfghjghjghjghj ghj gfjhjghGJGHJ\nghjghjghjjg\nhjkkgfp \nfghf\nhdfghfghf\nghgf\nhgf\nhfghfghfghfghgfh','2010-02-12 15:03:32',2,62,36,98),(10,101,'saty','satya','2010-02-12 15:09:55',2,67,36,98),(11,101,'satya','sdsdfsdf','2010-02-12 15:10:16',2,73,36,98);
/*!40000 ALTER TABLE `jforum_moderation_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_posts`
--

DROP TABLE IF EXISTS `jforum_posts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_posts` (
  `post_id` int(11) NOT NULL auto_increment,
  `topic_id` int(11) NOT NULL default '0',
  `forum_id` int(11) NOT NULL default '0',
  `user_id` int(11) NOT NULL default '0',
  `post_time` datetime default NULL,
  `poster_ip` varchar(15) default NULL,
  `enable_bbcode` tinyint(1) NOT NULL default '1',
  `enable_html` tinyint(1) NOT NULL default '1',
  `enable_smilies` tinyint(1) NOT NULL default '1',
  `enable_sig` tinyint(1) NOT NULL default '1',
  `post_edit_time` datetime default NULL,
  `post_edit_count` int(11) NOT NULL default '0',
  `status` tinyint(1) default '1',
  `attach` tinyint(1) default '0',
  `need_moderate` tinyint(1) default '0',
  `profile_id` int(11) NOT NULL,
  PRIMARY KEY  (`post_id`),
  KEY `user_id` (`user_id`),
  KEY `topic_id` (`topic_id`),
  KEY `forum_id` (`forum_id`),
  KEY `post_time` (`post_time`),
  KEY `need_moderate` (`need_moderate`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_posts`
--

LOCK TABLES `jforum_posts` WRITE;
/*!40000 ALTER TABLE `jforum_posts` DISABLE KEYS */;
INSERT INTO `jforum_posts` VALUES (1,1,1,2,'2005-01-04 16:59:54','127.0.0.1',1,0,1,1,NULL,0,1,0,0,0),(2,1,1,1,'2010-01-13 14:34:48','0:0:0:0:0:0:0:1',1,0,1,1,'2010-01-13 14:34:48',0,1,0,0,0),(3,1,1,1,'2010-02-03 14:29:13','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-03 14:29:13',0,1,0,0,0),(4,2,1,1,'2010-02-03 15:05:50','0:0:0:0:0:0:0:1',1,0,1,0,'2010-02-03 15:05:50',0,1,0,0,0),(5,3,2,20,'2010-02-03 15:15:35','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-03 15:15:35',0,1,0,0,0),(6,4,2,20,'2010-02-03 15:16:14','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-05 20:49:25',1,1,0,0,0),(7,5,1,95,'2010-02-03 15:30:39','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-03 15:30:39',0,1,0,0,0),(8,4,2,20,'2010-02-03 16:31:24','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-03 16:31:24',0,1,0,0,0),(9,6,1,100,'2010-02-03 18:10:15','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-03 18:10:15',0,1,0,0,0),(10,7,1,98,'2010-02-03 19:43:22','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-03 19:43:22',0,1,0,0,0),(11,8,1,98,'2010-02-04 10:36:13','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-04 10:36:13',0,1,0,0,0),(12,8,1,98,'2010-02-05 15:36:52','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-05 15:36:52',0,1,0,0,0),(13,9,1,98,'2010-02-05 18:10:09','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-05 18:10:09',0,1,0,0,0),(14,10,1,98,'2010-02-05 18:57:12','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-05 18:57:13',0,1,0,0,0),(15,10,1,98,'2010-02-05 18:57:31','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-05 18:57:31',0,1,0,0,0),(16,11,1,98,'2010-02-05 18:58:32','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-05 18:58:33',0,1,0,0,0),(17,12,1,98,'2010-02-08 11:31:36','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-08 11:31:36',0,1,0,0,0),(18,12,1,98,'2010-02-08 11:31:59','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-08 11:31:59',0,1,0,0,0),(19,12,1,98,'2010-02-08 11:32:26','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-08 11:32:26',0,1,0,0,0),(20,12,1,98,'2010-02-08 11:35:46','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-08 11:35:46',0,1,0,0,0),(24,13,1,98,'2010-02-08 16:00:57','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-08 16:00:57',0,1,0,0,175),(25,24,1,98,'2010-02-08 16:01:31','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-08 16:01:31',0,1,0,0,175),(26,25,1,98,'2010-02-08 16:06:39','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-08 16:06:39',0,1,0,0,175),(27,13,1,98,'2010-02-08 16:09:03','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-08 16:09:03',0,1,0,0,175),(28,13,1,98,'2010-02-08 17:03:26','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-08 17:03:27',0,1,0,0,175),(29,13,1,98,'2010-02-08 17:04:06','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-08 17:04:07',0,1,0,0,176),(30,13,1,98,'2010-02-08 17:06:46','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-08 17:06:46',0,1,0,0,175),(31,26,1,98,'2010-02-08 17:08:38','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-08 17:08:38',0,1,0,0,175),(32,26,1,98,'2010-02-08 17:13:25','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-08 17:13:25',0,1,0,0,175),(33,27,1,98,'2010-02-08 18:41:16','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-08 18:41:16',0,1,0,0,176),(34,27,1,98,'2010-02-09 14:10:27','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-09 14:10:27',0,1,0,0,177),(35,27,1,98,'2010-02-09 14:12:07','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-09 14:12:07',0,1,0,0,177),(36,27,1,98,'2010-02-09 14:13:03','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-09 14:13:03',0,1,0,0,174),(37,27,1,98,'2010-02-09 14:25:48','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-09 14:25:48',0,1,0,0,178),(38,28,1,98,'2010-02-09 14:45:57','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-09 14:45:57',0,1,0,0,176),(39,29,1,98,'2010-02-09 15:01:42','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-09 15:01:42',0,1,0,0,177),(40,30,1,98,'2010-02-09 15:10:38','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-09 15:10:38',0,1,0,0,175),(41,29,1,98,'2010-02-09 15:14:08','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-09 15:14:08',0,1,0,0,173),(42,31,1,98,'2010-02-09 15:16:06','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-09 15:16:06',0,1,0,0,174),(43,32,1,1,'2010-02-09 16:08:28','0:0:0:0:0:0:0:1',1,0,1,0,'2010-02-09 16:08:28',0,1,0,0,1),(44,32,1,98,'2010-02-09 16:20:20','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-10 17:09:38',1,1,0,0,175),(45,29,1,98,'2010-02-09 16:21:06','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-09 16:21:06',0,1,0,0,175),(46,29,1,98,'2010-02-09 16:21:26','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-09 16:21:26',0,1,0,0,173),(47,33,1,98,'2010-02-09 16:50:27','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-09 16:50:27',0,1,0,0,174),(48,34,1,98,'2010-02-09 16:51:51','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-12 10:12:12',2,1,0,0,176),(49,35,1,98,'2010-02-09 17:05:49','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-09 17:06:25',0,1,0,0,177),(50,36,1,98,'2010-02-09 17:08:20','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-11 13:12:10',3,1,0,0,176),(51,37,1,98,'2010-02-09 17:17:59','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-09 17:17:59',0,1,0,0,175),(52,38,1,1,'2010-02-09 17:47:58','0:0:0:0:0:0:0:1',1,0,1,0,'2010-02-09 17:47:58',0,1,0,0,1),(53,39,1,98,'2010-02-09 17:48:34','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-10 17:17:22',2,1,0,0,177),(54,39,1,98,'2010-02-09 17:49:42','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-10 12:33:57',1,1,0,0,177),(55,35,1,98,'2010-02-09 17:50:24','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-09 17:50:24',0,1,0,0,177),(58,41,1,98,'2010-02-09 18:05:43','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-10 12:34:12',1,1,0,0,175),(60,40,1,98,'2010-02-10 11:35:38','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-10 12:04:50',1,1,0,0,173),(61,40,1,98,'2010-02-10 11:45:37','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-10 12:05:34',2,1,0,0,176),(62,36,1,98,'2010-02-10 12:34:32','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-12 15:03:31',2,1,0,0,175),(63,39,1,98,'2010-02-10 12:47:29','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-10 12:47:29',0,1,0,0,177),(64,39,1,98,'2010-02-10 12:47:48','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-10 12:47:48',0,1,0,0,173),(65,31,1,98,'2010-02-10 17:07:57','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-10 17:08:14',1,1,0,0,176),(66,39,1,98,'2010-02-10 17:17:35','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-10 17:17:35',0,1,0,0,176),(67,36,1,98,'2010-02-11 13:09:15','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-12 15:09:54',1,1,0,0,176),(68,39,1,1,'2010-02-11 14:41:28','0:0:0:0:0:0:0:1',1,0,1,0,'2010-02-11 14:41:28',0,1,0,0,71),(69,42,1,1,'2010-02-11 14:47:24','0:0:0:0:0:0:0:1',1,0,1,0,'2010-02-11 14:47:24',0,1,0,0,75),(70,42,1,98,'2010-02-11 15:02:05','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-11 15:02:05',0,1,0,0,177),(71,42,1,98,'2010-02-11 15:02:24','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-11 15:02:24',0,1,0,0,178),(72,39,1,98,'2010-02-11 15:03:20','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-11 15:03:20',0,1,0,0,173),(73,36,1,98,'2010-02-11 15:03:53','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-12 15:10:15',1,1,0,0,178),(74,32,1,98,'2010-02-11 15:04:20','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-11 15:04:20',0,1,0,0,174),(75,33,1,98,'2010-02-11 15:09:13','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-11 15:09:13',0,1,0,0,175),(76,33,1,98,'2010-02-11 15:09:44','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-11 15:09:44',0,1,0,0,173),(77,34,1,98,'2010-02-11 15:10:00','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-12 09:52:34',1,1,0,0,175),(78,32,1,98,'2010-02-11 15:10:42','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-11 15:10:42',0,1,0,0,177),(79,42,1,98,'2010-02-11 15:15:07','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-11 15:15:07',0,1,0,0,174),(80,32,1,1,'2010-02-11 16:45:11','0:0:0:0:0:0:0:1',1,0,1,0,'2010-02-11 16:45:11',0,1,0,0,1),(81,32,1,98,'2010-02-11 17:39:17','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-11 17:39:17',0,1,0,0,173),(82,34,1,98,'2010-02-11 19:02:10','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-11 19:02:10',0,1,0,0,177),(83,42,1,98,'2010-02-11 19:02:47','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-11 19:02:47',0,1,0,0,175),(84,34,1,101,'2010-02-12 09:53:03','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-12 10:12:58',2,1,0,0,179),(85,43,1,101,'2010-02-12 14:56:35','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-12 14:56:35',0,1,0,0,180),(86,44,1,101,'2010-02-12 14:57:24','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-12 14:57:24',0,1,0,0,181),(87,36,1,101,'2010-02-12 15:02:02','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-12 15:02:02',0,1,0,0,181),(88,36,1,101,'2010-02-12 15:10:59','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-12 15:10:59',0,1,0,0,179),(89,29,1,101,'2010-02-12 15:11:25','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-12 15:11:25',0,1,0,0,179),(90,34,1,101,'2010-02-12 15:11:52','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-12 15:11:52',0,1,0,0,180),(91,34,1,98,'2010-02-15 10:38:43','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-15 10:38:43',0,1,0,0,173),(92,44,1,98,'2010-02-15 10:42:57','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-15 10:42:57',0,1,0,0,176),(93,44,1,98,'2010-02-15 10:52:37','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-15 10:52:37',0,1,0,0,175),(94,44,1,98,'2010-02-15 10:56:50','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-15 10:56:50',0,1,0,0,177),(95,44,1,98,'2010-02-15 10:57:17','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-15 10:57:17',0,1,0,0,175),(96,45,1,98,'2010-02-15 13:17:27','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-15 13:17:27',0,1,0,0,176),(104,51,5,98,'2010-02-15 18:53:36','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-15 18:53:36',0,1,0,0,173),(105,51,5,98,'2010-02-15 18:54:13','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-15 18:54:13',0,1,0,0,175),(106,51,5,98,'2010-02-16 11:41:25','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-16 11:41:25',0,1,0,0,177),(107,52,5,98,'2010-02-17 11:12:23','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-17 11:12:23',0,1,0,0,176),(108,52,5,98,'2010-02-17 11:15:17','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-17 11:15:17',0,1,0,0,173),(109,52,5,98,'2010-02-17 12:11:50','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-17 12:11:50',0,1,0,0,176),(110,52,5,1,'2010-02-17 12:21:46','0:0:0:0:0:0:0:1',1,0,1,0,'2010-02-17 12:21:46',0,1,0,0,75),(111,51,5,98,'2010-02-17 12:24:58','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-17 12:24:58',0,1,0,0,173),(112,51,5,98,'2010-02-17 12:25:16','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-17 12:25:16',0,1,0,0,173),(113,51,5,98,'2010-02-17 12:25:35','0:0:0:0:0:0:0:1',1,0,1,1,'2010-02-17 12:26:08',1,1,0,0,173),(114,53,5,1,'2010-02-18 16:52:26','0:0:0:0:0:0:0:1',1,0,1,0,'2010-02-18 16:52:26',0,1,0,0,1),(115,53,5,1,'2010-02-18 16:53:54','0:0:0:0:0:0:0:1',1,0,1,0,'2010-02-18 16:53:54',0,1,0,0,1),(116,54,6,203,'2010-06-21 22:48:38','122.181.9.130',1,0,1,1,'2010-06-21 22:48:39',0,1,0,0,519),(117,55,6,203,'2010-06-21 22:50:06','122.181.9.130',1,0,1,1,'2010-06-21 22:50:06',0,1,0,0,519),(118,55,6,203,'2010-06-21 22:50:33','122.181.9.130',1,0,1,1,'2010-06-21 22:50:33',0,1,0,0,519),(121,57,7,203,'2010-06-22 02:08:13','122.181.9.130',1,0,1,1,'2010-06-22 02:08:13',0,1,0,0,519),(122,58,15,203,'2010-06-22 02:12:40','122.181.9.130',1,0,1,1,'2010-06-22 02:14:03',1,1,0,0,519),(123,59,16,198,'2010-07-25 23:42:57','122.181.9.130',1,0,1,1,'2010-07-25 23:42:57',0,1,0,0,514),(124,60,8,198,'2010-07-26 02:03:56','122.181.9.130',1,0,1,1,'2010-07-26 02:03:56',0,1,0,0,514),(125,61,13,198,'2010-07-26 02:05:09','122.181.9.130',1,0,1,1,'2010-07-26 02:05:09',0,1,0,0,514),(126,61,13,198,'2010-07-26 02:15:14','122.181.9.130',1,0,1,1,'2010-07-26 02:15:14',0,1,0,0,514),(127,62,13,198,'2010-07-26 02:15:37','122.181.9.130',1,0,1,1,'2010-07-26 02:15:37',0,1,0,0,514),(128,63,13,198,'2010-07-26 02:31:25','122.181.9.130',1,0,1,1,'2010-07-26 02:31:25',0,1,0,0,514),(129,63,13,198,'2010-07-26 02:31:56','122.181.9.130',1,0,1,1,'2010-07-26 02:31:56',0,1,0,0,514),(130,64,16,198,'2010-07-26 03:08:08','122.181.9.130',1,0,1,1,'2010-07-26 03:08:08',0,1,0,0,514),(131,64,16,198,'2010-07-26 03:08:27','122.181.9.130',1,0,1,1,'2010-07-26 03:08:27',0,1,0,0,514),(132,65,11,198,'2010-07-26 03:27:25','122.181.9.130',1,0,1,1,'2010-07-26 03:27:25',0,1,0,0,514),(133,66,11,198,'2010-07-27 02:59:27','122.181.9.130',1,0,1,1,'2010-07-27 02:59:28',0,1,0,0,514),(134,66,11,198,'2010-07-27 02:59:54','122.181.9.130',1,0,1,1,'2010-07-27 02:59:54',0,1,0,0,514),(135,67,16,217,'2010-08-02 16:14:26','66.238.115.109',1,0,1,1,'2010-08-02 16:14:26',0,1,0,0,530),(136,58,15,217,'2010-08-02 16:15:24','66.238.115.109',1,0,1,1,'2010-08-02 16:15:24',0,1,0,0,530),(137,68,13,217,'2010-08-02 16:24:03','66.238.115.109',1,0,1,1,'2010-08-02 16:24:03',0,1,0,0,530),(138,69,8,217,'2010-08-02 16:52:24','66.238.115.109',1,0,1,1,'2010-08-02 16:52:24',0,1,0,0,530),(139,70,10,217,'2010-08-02 16:53:55','66.238.115.109',1,0,1,1,'2010-08-02 16:53:55',0,1,0,0,530),(140,68,13,198,'2010-08-04 03:05:40','122.181.9.130',1,0,1,1,'2010-08-04 03:05:40',0,1,0,0,514),(141,71,10,198,'2010-08-04 03:06:09','122.181.9.130',1,0,1,1,'2010-08-04 03:06:09',0,1,0,0,514),(142,72,10,198,'2010-08-04 04:53:50','122.181.9.130',1,0,1,1,'2010-08-04 04:53:50',0,1,0,0,514),(143,73,12,198,'2010-08-04 04:56:04','122.181.9.130',1,0,1,1,'2010-08-04 04:56:04',0,1,0,0,514),(144,73,12,198,'2010-08-04 04:56:21','122.181.9.130',1,0,1,1,'2010-08-04 04:56:21',0,1,0,0,514),(145,65,11,234,'2010-10-26 19:52:08','72.199.220.242',1,0,1,1,'2010-10-26 19:52:08',0,1,0,0,563),(146,65,11,197,'2010-11-18 04:35:50','122.181.9.130',1,0,1,1,'2010-11-18 04:35:50',0,1,0,0,565),(147,74,7,248,'2010-12-06 23:28:16','122.181.9.130',1,0,1,1,'2010-12-06 23:28:16',0,1,0,0,579),(148,75,7,197,'2011-03-01 09:58:37','122.169.130.169',1,0,1,1,'2011-03-01 09:58:37',0,1,0,0,569),(149,69,8,197,'2011-03-01 10:56:55','122.169.130.169',1,0,1,1,'2011-03-01 10:56:55',0,1,0,0,580);
/*!40000 ALTER TABLE `jforum_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_posts_text`
--

DROP TABLE IF EXISTS `jforum_posts_text`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_posts_text` (
  `post_id` int(11) NOT NULL,
  `post_text` text,
  `post_subject` varchar(100) default NULL,
  PRIMARY KEY  (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_posts_text`
--

LOCK TABLES `jforum_posts_text` WRITE;
/*!40000 ALTER TABLE `jforum_posts_text` DISABLE KEYS */;
INSERT INTO `jforum_posts_text` VALUES (1,'[b][color=blue][size=18] :!: [/size][/color][/b]\n  There you will be able to create Categories, Forums and much more    \n\nFor more information and support, please refer to the following pages:\n\n:arrow: Community forum: http://www.myownbriefcase.com\n:arrow: Documentation: http://www.myownbriefcase.com/doc\n\nThank you for choosing myownbriefcase.\n\n[url=http://www.myownbriefcase.com/doc/Team]The mob Team[/url]\n\n','Welcome to myownbriefcase'),(2,'Hi this is satya','Welcome to MyOwnBriefcase '),(3,'sdffsdas sdfsda fsafd','Welcome to MyOwnBriefcase '),(4,'sdfffffffffff','satya'),(5,'fgggggggggggggggggggggg','fsd'),(6,'HI','what is swing'),(7,'ree','eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee'),(8,'rewtwtwtwtwtwtwtwtwtwtwtwtwtwtwtwtwtwtwtwtwtwtwtwtwtwtwtwtwt','what is swing'),(9,'ggggggggggggggggggggggggggggg','gggggggggggggggggggggggg'),(10,'mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm','mmmmmmmmmmmmm'),(11,'sads','sadasd'),(12,'satyam satyam satyma satyam satym satym s','sadasd'),(13,' Disable HTML in this message\r\noDisable BB Code in this message','eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee'),(14,'fuf fhgfghf hjfhfjh hgfhjfjhgf','hdghh hjhjhjfh'),(15,'[u][i][b][/b][/i][/u][i][u][/i][b][i][/i][/u]','Re:hdghh hjhjhjfh'),(16,'[i][b][quote][cod[list][img][url][google]e]','dgdfgdfg'),(17,'sdfsdfsdfsdf','cxvzzzdfsdfsfsdf'),(18,'gfdfgdfgdfgsdfg','Re:cxvzzzdfsdfsfsdf'),(19,'sdfasdasd','Re:cxvzzzdfsdfsfsdf'),(20,'Satya Satya Satya','cxvzzzdfsdfsfsdf'),(24,'fsdfsdfsdfs','Re:cxvzzzdfsdfsfsdfdfsdfsd'),(25,'dasdasdasdasdasdas asd asd','sdasd'),(26,'sdfsdfsdfsdaf','dfsdf'),(27,'dfgdfgdfgdf','Re:cxvzzzdfsdfsfsdfdfgdfg'),(28,'sdfsdfsdf','cxvzzzdfsdfsfsdf'),(29,'  \r\nGo to:  Test Forum  \r\nAdmin Control Panel  \r\nGo to:  Test Forum  \r\nAdmin Control Panel  \r\nGo to:  Test Forum  \r\nAdmin Control Panel','cxvzzzdfsdfsfsdf'),(30,'dsdsad','cxvzzzdfsdfsfsdf'),(31,'fgdfgdfgd','gdgdfg'),(32,'sdasdaasd asd','gdgdfg'),(33,'[u]jhgjhg lhgljkgljkg lkjglkjgkljg kljghkljgh lkjghkl jhlkjhkl','cxvzzzdfsdfsfsdf'),(34,'HI this is Web servises profiles HI this is Web servises profiles HI this is Web servises profiles HI this is Web servises profiles ','HI this is Web servises profiles '),(35,'d sdfsdf sdfsdf sdf sdf','cxvzzzdfsdfsfsdf'),(36,'satya','cxvzzzdfsdfsfsdf'),(37,'123123','cxvzzzdfsdfsfsdf'),(38,'sdfsdfsdfsdfsdfsdfsdf','dsfsdfsdf'),(39,'What is Webservises What is Webservises What is Webservises ','What is Webservises '),(40,'dfgdfgdfgd','dfgdgfd'),(41,'dfsdfsdf','Re:What is Webservises '),(42,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx','XXXXxxxxxxxxxxxxx'),(43,'Satya sending message to Suresh Profile\r\nSatya sending message to Suresh Profile\r\nSatya sending message to Suresh Profile\r\nSatya sending message to Suresh ProfileSatya sending message to Suresh Profile\r\nSatya sending message to Suresh Profile\r\nSatya sending message to Suresh Profile\r\n','Satya sending message to Suresh Profile'),(44,'dfsdfsdfsdfffffffffff','Satya sending message to Suresh Profile'),(45,'sdadadadadd','What is Webservises '),(46,'sdasdada','What is Webservises '),(47,' editing the profiles editing the profiles editing the profiles editing the profiles editing the profiles editing the profiles \r\nediting the profiles editing the profiles editing the profiles editing the profiles editing the profiles editing the profiles ','edting the profile s'),(48,'dsdffffffftttttttttttttttttttttttttt','What is HTML'),(49,'dfgdfgdfgdfgdfgdfgdfgdfgdfg','gdfgdf'),(50,'MyOwnBriefcase Forum - your board description\n  [Search] Search   [Recent Topics] Recent Topics   [Hottest Topics] Hottest Topics   [Members]  Member Listing   [Groups]  Back to home page \n[Moderation Log] Moderation Log   [Profile] My Profile  [Post]My Bookmarks  [Message] Private Messages   ','how to Java script form HTML'),(51,'gdfgdfgdf','fdgdf'),(52,'dasdasd','sa'),(53,'fffffffffffffffffffffffffffff fgdfgdfg gfdfgdfgdfg sdf','dffffffffffffffffffff'),(54,'fgdfgsdfdfgdfgdfgsdfgdsfgdfgdfs','dffffffffffffffffffff'),(55,'ttttttttttttttttttttttttttttttttttttttt','Re:gdfgdfyt'),(58,'        [quote]fsdfsdfdfgdfgdf gdfg dfgdfgdf','           sdfsd'),(60,'dfdfdfdfdfdfdfdfdfdfdfdfdfdfdf','Re:gggggggggggggggggggggg'),(61,'[quote=SQL Profile ]gdasdasdasdasdggggggggggggggggggsdasdaggggggggfdddddddddddddd[/quote]sdfsdfasdfasdfasdf','gggggggggggggggggggggg'),(62,'dfgdfgdfs sfddsadfasdfasdfasdfasdfsadffsdaf sdfasdfasdfsadfsd sdaf sdf sadfsdaffsda sdfsadfasdf asdfasdfasdfasd fasdfsdf sdsdf sdfdfghjghjghjghj ghj gfjhjghGJGHJ\nghjghjghjjg\nhjkkgfp \nfghf\nhdfghfghf\nghgf\nhgfdfgdfgdfs sfddsadfasdfasdfasdfasdfsadffsdaf sdfasdfasdfsadfsd sdaf sdf sadfsdaffsda sdfsadfasdf asdfasdfasdfasd fasdfsdf sdsdf sdfdfghjghjghjghj ghj gfjhjghGJGHJ\nghjghjghjjg\nhjkkgfp \nfghf\nhdfghfghf\nghgf\nhgf\nhfghfghfghfghgfhdfgdfgdfs sfddsadfasdfasdfasdfasdfsadffsdaf sdfasdfasdfsadfsd sdaf sdf sadfsdaffsda sdfsadfasdf asdfasdfasdfasd fasdfsdf sdsdf sdfdfghjghjghjghj ghj gfjhjghGJGHJ\nghjghjghjjg\nhjkkgfp \nfghf\nhdfghfghf\nghgf\nhgf\nhfghfghfghfghgfh\nhfghfghfghfghgfh','how to Java script form HTML'),(63,'gfdfgds','dffffffffffffffffffff'),(64,'dfgdfgd','dffffffffffffffffffff'),(65,'dddddddddddddddddddddddddffffffffffddd','Re:XXXXxxxxxxxxxxdddd'),(66,'Satya','dffffffffffffffffffff'),(67,'satyanarayana pulkam ','how to Java script form HTML'),(68,'tyyyyyyyyyyyyyyyyyyyy','dffffffffffffffffffff'),(69,'Topics created','aaaaaaaaaaaaaaaaaaaaaaaaa'),(70,'sdfsfsdfsdfsdf','Re:aaaaaaaaaaaaaaaaaaaaaaaaa'),(71,'dgdfgdfgdsfgsdfg','Re:aaaaaaaaaaaaaaaaaaaaaaaaa'),(72,'satya','dffffffffffffffffffff'),(73,'Satyanarayana.pulkam ','how to Java script form HTML'),(74,'fsdfsdfsdf','Satya sending message to Suresh Profile'),(75,'hi','edting the profile s'),(76,'ghhh','edting the profile s'),(77,'fggggggggggggggggggggsddddddddddd','What is HTML'),(78,'try','Satya sending message to Suresh Profile'),(79,'df','aaaaaaaaaaaaaaaaaaaaaaaaa'),(80,'fggggg','Satya sending message to Suresh Profile'),(81,'ilhihjl','Satya sending message to Suresh Profile'),(82,'sdfffffffffffffffff','What is HTML'),(83,'dfgdfs','aaaaaaaaaaaaaaaaaaaaaaaaa'),(84,'[quote=SQL Profile ]sdfffffffffffffffff[/quote]sdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdtttttttttt','What is HTML'),(85,'qqqqqqqqqqqqqqqqqq','QQQQQQQQQQQQQ'),(86,'fsdfsdfsdf','What is the Jforum'),(87,'hih ihiiii ihihiihi','how to Java script form HTML'),(88,'frsdfgsdfgsdfds','how to Java script form HTML'),(89,'ggfhgfhgfh','What is Webservises '),(90,'ghfhfg','What is HTML'),(91,'HI','What is HTML'),(92,'ghghgh','What is the Jforum'),(93,'retertertertertert','Re:What is the Jforumertert'),(94,'ghgfhf','Re:What is the Jforum'),(95,'sfsdfsdf','What is the Jforum'),(96,'dfgdfsgsdf','gdfghdf'),(104,'dfsdfsdf','What is Jsp?'),(105,'sdfsf','What is Jsp?'),(106,'reeter','What is Jsp?'),(107,'hi','What is HTML?'),(108,'yutyutyu','What is HTML?'),(109,'yuytutu','What is HTML?'),(110,'fgfghfghf gfh fghgfhgfhgfh fgh fghgf','What is HTML?'),(111,' :shock:  :D  :-)  :mrgreen:  :cry:  :evil:  :twisted:  :?  :!:  :roll:  :oops:  :cry:  :evil:  :twisted:  :P  :(  :D  :shock: ','What is Jsp?'),(112,' :x  :x  :x  :x  :x  :x  :x  :lol:  :lol:  :lol:  :lol:  :lol:  :lol:  :lol:  :lol:  :cry:  :cry:  :cry:  :!:  :!: ','What is Jsp?'),(113,' :shock:  :D  :mrgreen:  :mrgreen:  :mrgreen:  :mrgreen:  :mrgreen:  :mrgreen:  :mrgreen:  :mrgreen: ','asdf'),(114,'terterter','eerterter'),(115,'erterte et er','eerterter'),(116,'dasdasdasd','sa'),(117,'what is jsp','waht is Jsp'),(118,'jsp is java server pages','waht is Jsp'),(121,'Interview discussions can be boring and meaningless.  A candidate can experience a live, regurgitation of the job description listed in the local paper rather than a meaningful conversation of what is expected of him or her.  Take this opportunity (or any other) to discuss new procedures you wish to implement to increase the company\'s bottom line and productivity.  Use dollars, percentages, and cents (sense).  In today\'s age, nearly anyone can do a job, but can they produce results?','Interview discussion'),(122,'hixsasad','asd'),(123,'hi','hi'),(124,'HI','HI'),(125,'we','we'),(126,'dfddfg','we'),(127,'fd','dfg'),(128,'test','test'),(129,'sdas','test'),(130,'Interview discussions can be boring and meaningless. A candidate can experience a live, regurgitation of the job description listed in the local paper rather than a meaningful conversation of what is expected of him or her. Take this opportunity (or any other) to discuss new procedures you wish to implement to increase the company\'s bottom line and productivity. Use dollars, percentages, and cents (sense). In today\'s age, nearly anyone can do a job, but can they produce results?','hi'),(131,'Interview discussions can be boring and meaningless. A candidate can experience a live, regurgitation of the job description listed in the local paper rather than a meaningful conversation of what is expected of him or her. Take this opportunity (or any other) to discuss new procedures you wish to implement to increase the company\'s bottom line and productivity. Use dollars, percentages, and cents (sense). In today\'s age, nearly anyone can do a job, but can they produce results?','hi'),(132,'what is networkingwhat is networkingwhat is networkingwhat is networkingwhat is networkingwhat is networking','what is networking'),(133,'sdfsdfsdf','Linins iossues'),(134,'gfhgf','Linins iossues'),(135,'hello?','blah blah blah'),(136,'hello!','asd'),(137,'Hello?','So what do I do next?'),(138,'Please!','I am the best employee! Hire me!'),(139,'Groupon has great deals, check them out!','Groupon.com!'),(140,'dfgdfgfdg','So what do I do next?'),(141,'ggggggggggggggggggggggggggd','dfg'),(142,'HI HI','How to save money ..'),(143,'HI HI','I need java resource '),(144,'sdsddssd','I need java resource '),(145,'Network ALL day','what is networking'),(146,'cvxcvzx zxzsfsdfsdf','what is networking'),(147,'d','d'),(148,'dfsgddfdfdsfgdgfd :D ','szdfsd'),(149,'xczx','I am the best employee! Hire me!');
/*!40000 ALTER TABLE `jforum_posts_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_privmsgs`
--

DROP TABLE IF EXISTS `jforum_privmsgs`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_privmsgs` (
  `privmsgs_id` int(11) NOT NULL auto_increment,
  `privmsgs_type` tinyint(4) NOT NULL default '0',
  `privmsgs_subject` varchar(255) NOT NULL default '',
  `privmsgs_from_userid` int(11) NOT NULL default '0',
  `privmsgs_to_userid` int(11) NOT NULL default '0',
  `privmsgs_date` datetime default NULL,
  `privmsgs_ip` varchar(15) NOT NULL default '',
  `privmsgs_enable_bbcode` tinyint(1) NOT NULL default '1',
  `privmsgs_enable_html` tinyint(1) NOT NULL default '0',
  `privmsgs_enable_smilies` tinyint(1) NOT NULL default '1',
  `privmsgs_attach_sig` tinyint(1) NOT NULL default '1',
  `privmsgs_from_profileid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`privmsgs_id`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_privmsgs`
--

LOCK TABLES `jforum_privmsgs` WRITE;
/*!40000 ALTER TABLE `jforum_privmsgs` DISABLE KEYS */;
INSERT INTO `jforum_privmsgs` VALUES (157,2,'ret',198,198,'2010-07-26 08:39:10','',1,0,1,1,514),(158,0,'ret',198,198,'2010-07-26 08:39:10','',1,0,1,1,514),(159,2,'HI',198,202,'2010-07-26 08:46:23','',1,0,1,1,518),(160,0,'HI',198,202,'2010-07-26 08:46:23','',1,0,1,1,518),(161,2,'zxx',198,213,'2010-07-27 03:00:25','',1,0,1,1,525),(162,1,'zxx',198,213,'2010-07-27 03:00:25','',1,0,1,1,525);
/*!40000 ALTER TABLE `jforum_privmsgs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_privmsgs_text`
--

DROP TABLE IF EXISTS `jforum_privmsgs_text`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_privmsgs_text` (
  `privmsgs_id` int(11) NOT NULL,
  `privmsgs_text` text,
  PRIMARY KEY  (`privmsgs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_privmsgs_text`
--

LOCK TABLES `jforum_privmsgs_text` WRITE;
/*!40000 ALTER TABLE `jforum_privmsgs_text` DISABLE KEYS */;
INSERT INTO `jforum_privmsgs_text` VALUES (153,'as'),(154,'as'),(155,'r'),(156,'r'),(157,'asdadada'),(158,'asdadada'),(159,'HI'),(160,'HI'),(161,'xxxxxxxxxxxxxxxxxxxxxxxx'),(162,'xxxxxxxxxxxxxxxxxxxxxxxx');
/*!40000 ALTER TABLE `jforum_privmsgs_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_quota_limit`
--

DROP TABLE IF EXISTS `jforum_quota_limit`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_quota_limit` (
  `quota_limit_id` int(11) NOT NULL auto_increment,
  `quota_desc` varchar(50) NOT NULL,
  `quota_limit` int(11) NOT NULL,
  `quota_type` tinyint(1) default '1',
  PRIMARY KEY  (`quota_limit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_quota_limit`
--

LOCK TABLES `jforum_quota_limit` WRITE;
/*!40000 ALTER TABLE `jforum_quota_limit` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_quota_limit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_ranks`
--

DROP TABLE IF EXISTS `jforum_ranks`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_ranks` (
  `rank_id` int(11) NOT NULL auto_increment,
  `rank_title` varchar(50) NOT NULL default '',
  `rank_min` int(11) NOT NULL default '0',
  `rank_special` tinyint(1) default NULL,
  `rank_image` varchar(255) default NULL,
  PRIMARY KEY  (`rank_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_ranks`
--

LOCK TABLES `jforum_ranks` WRITE;
/*!40000 ALTER TABLE `jforum_ranks` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_ranks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_role_values`
--

DROP TABLE IF EXISTS `jforum_role_values`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_role_values` (
  `role_id` int(11) NOT NULL,
  `role_value` varchar(255) default NULL,
  KEY `idx_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_role_values`
--

LOCK TABLES `jforum_role_values` WRITE;
/*!40000 ALTER TABLE `jforum_role_values` DISABLE KEYS */;
INSERT INTO `jforum_role_values` VALUES (57,'2'),(57,'1'),(58,'2'),(60,'2'),(60,'1'),(62,'2'),(63,'2'),(63,'3'),(63,'4'),(63,'5'),(63,'7'),(57,'7'),(55,'7'),(62,'7'),(58,'7'),(57,'8'),(55,'8'),(62,'8'),(58,'8'),(57,'10'),(55,'10'),(62,'10'),(58,'10'),(57,'11'),(55,'11'),(62,'11'),(58,'11'),(57,'12'),(55,'12'),(62,'12'),(58,'12'),(57,'13'),(55,'13'),(62,'13'),(58,'13'),(57,'14'),(55,'14'),(62,'14'),(58,'14'),(57,'15'),(55,'15'),(62,'15'),(58,'15'),(57,'16'),(55,'16'),(62,'16'),(58,'16'),(41,'14'),(41,'16'),(41,'8'),(41,'13'),(41,'7'),(41,'15'),(41,'10'),(41,'11'),(41,'12'),(50,'14'),(50,'16'),(50,'8'),(50,'13'),(50,'7'),(50,'15'),(50,'10'),(50,'11'),(50,'12'),(52,'14'),(52,'16'),(52,'8'),(52,'13'),(52,'7'),(52,'15'),(52,'10'),(52,'11'),(52,'12'),(54,'14'),(54,'16'),(54,'8'),(54,'13'),(54,'7'),(54,'15'),(54,'10'),(54,'11'),(54,'12'),(59,'14'),(59,'16'),(59,'8'),(59,'13'),(59,'7'),(59,'15'),(59,'10'),(59,'11'),(59,'12'),(62,'14'),(62,'16'),(62,'8'),(62,'13'),(62,'7'),(62,'15'),(62,'10'),(62,'11'),(62,'12'),(63,'14'),(63,'16'),(63,'8'),(63,'13'),(63,'7'),(63,'15'),(63,'10'),(63,'11'),(63,'12'),(64,'4'),(64,'2'),(64,'3'),(64,'5'),(64,'6'),(64,'7'),(64,'1'),(65,'14'),(65,'16'),(65,'8'),(65,'13'),(65,'7'),(65,'15'),(65,'10'),(65,'11'),(65,'12'),(69,'14'),(69,'16'),(69,'8'),(69,'13'),(69,'7'),(69,'15'),(69,'10'),(69,'11'),(69,'12'),(70,'14'),(70,'16'),(70,'8'),(70,'13'),(70,'7'),(70,'15'),(70,'10'),(70,'11'),(70,'12'),(71,'14'),(71,'16'),(71,'8'),(71,'13'),(71,'7'),(71,'15'),(71,'10'),(71,'11'),(71,'12'),(72,'7'),(76,'14'),(76,'16'),(76,'8'),(76,'13'),(76,'7'),(76,'15'),(76,'10'),(76,'11'),(76,'12'),(79,'14'),(79,'16'),(79,'8'),(79,'13'),(79,'7'),(79,'15'),(79,'10'),(79,'11'),(79,'12'),(80,'4'),(80,'6'),(80,'7'),(80,'1');
/*!40000 ALTER TABLE `jforum_role_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_roles`
--

DROP TABLE IF EXISTS `jforum_roles`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_roles` (
  `role_id` int(11) NOT NULL auto_increment,
  `group_id` int(11) default '0',
  `name` varchar(255) NOT NULL,
  PRIMARY KEY  (`role_id`),
  KEY `idx_group` (`group_id`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_roles`
--

LOCK TABLES `jforum_roles` WRITE;
/*!40000 ALTER TABLE `jforum_roles` DISABLE KEYS */;
INSERT INTO `jforum_roles` VALUES (41,2,'perm_attachments_enabled'),(42,2,'perm_create_poll'),(43,2,'perm_moderation_post_edit'),(44,2,'perm_create_sticky_announcement_topics'),(45,2,'perm_full_moderation_log'),(46,2,'perm_moderation'),(47,2,'perm_moderation_topic_lockUnlock'),(48,2,'perm_bookmarks_enabled'),(49,2,'perm_administration'),(50,2,'perm_anonymous_post'),(51,2,'perm_moderation_forums'),(52,2,'perm_forum'),(53,2,'perm_moderation_post_remove'),(54,2,'perm_html_disabled'),(55,2,'perm_vote'),(56,2,'perm_attachments_download'),(57,2,'perm_karma_enabled'),(58,2,'perm_moderation_approve_messages'),(59,2,'perm_reply_only'),(60,2,'perm_moderation_log'),(61,2,'perm_moderation_topic_move'),(62,2,'perm_reply_without_moderation'),(63,2,'perm_read_only_forums'),(64,2,'perm_category'),(65,1,'perm_attachments_enabled'),(66,1,'perm_create_poll'),(67,1,'perm_create_sticky_announcement_topics'),(68,1,'perm_bookmarks_enabled'),(69,1,'perm_anonymous_post'),(70,1,'perm_moderation_forums'),(71,1,'perm_forum'),(72,1,'perm_html_disabled'),(73,1,'perm_vote'),(74,1,'perm_attachments_download'),(75,1,'perm_karma_enabled'),(76,1,'perm_reply_only'),(77,1,'perm_moderation_log'),(78,1,'perm_reply_without_moderation'),(79,1,'perm_read_only_forums'),(80,1,'perm_category');
/*!40000 ALTER TABLE `jforum_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_sessions`
--

DROP TABLE IF EXISTS `jforum_sessions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_sessions` (
  `session_id` varchar(150) NOT NULL default '',
  `session_user_id` int(11) NOT NULL default '0',
  `session_start` datetime default NULL,
  `session_time` bigint(20) default '0',
  `session_ip` varchar(15) NOT NULL default '',
  `session_page` int(11) NOT NULL default '0',
  `session_logged_int` tinyint(1) default NULL,
  KEY `idx_sessions_users` (`session_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_sessions`
--

LOCK TABLES `jforum_sessions` WRITE;
/*!40000 ALTER TABLE `jforum_sessions` DISABLE KEYS */;
INSERT INTO `jforum_sessions` VALUES ('8C62DEEAD17FB1EF5B45A2B9D255BC62',4,'2009-07-10 12:15:19',0,'',0,NULL),('236E0483F76584EC18B90BC05A83106E',9,'2009-06-18 16:55:03',0,'',0,NULL),('5CC8376A7E601357EDF53346AC52FA95',12,'2010-03-12 12:13:41',0,'',0,NULL),('2A31D5876F50689C5995D4FA7F31B507',11,'2009-11-13 12:46:05',0,'',0,NULL),('98E1F56593026012228384740925A47B',13,'2009-05-25 10:46:50',0,'',0,NULL),('8ECB0C7A1CF6BFCDE15E94E73708542C',14,'2009-11-12 11:40:17',0,'',0,NULL),('881984CA55A0F59C5115CC1B706F36C0',15,'2009-11-13 13:09:57',0,'',0,NULL),('E011D5CF9021C8A4930F6591663D3665',16,'2009-11-17 14:35:17',0,'',0,NULL),('8FA27E1917F45669FDBB923B679B4307',17,'2009-11-17 13:24:30',0,'',0,NULL),('979DC84FE89D702F83867309996B0D62',18,'2009-12-02 12:31:11',0,'',0,NULL),('6D9006A7B7B2ABF7B87F79E760FA7C31',19,'2009-11-20 15:14:58',0,'',0,NULL),('4FDF6B4D152DF18EE33CC5CF72109123',20,'2010-03-17 17:00:27',0,'',0,NULL),('EFA73361D074E77607B26229752F7793',21,'2010-02-01 18:06:13',0,'',0,NULL),('5F2A9A285F50E8D7261B1DA4872AAE44',22,'2010-06-23 15:30:25',5924,'',0,NULL),('33341DE44B2DE2B4AE31DB0C26889BBD',25,'2010-02-01 17:04:00',0,'',0,NULL),('C59BFD95DD5E6E9CFFA931CD23BA43AF',26,'2010-01-29 12:53:27',0,'',0,NULL),('CC1480DC2DFEBF8C3329CD27F1F5DE94',27,'2010-01-29 11:46:33',0,'',0,NULL),('1A5DC65A68A27B56AF5B29430A54F7B3',28,'2009-06-09 17:24:54',0,'',0,NULL),('638D480EA508D1B8C88522AC5ED7EE02',30,'2009-11-28 11:40:46',0,'',0,NULL),('05F04176CF1E5C1F7EEB9A67E2499D76',32,'2009-06-01 17:48:01',0,'',0,NULL),('76BFE0EA9D00A9D074A9DB6F0FE7A8F7',53,'2009-06-08 16:27:56',0,'',0,NULL),('118D5524B4480F2A75B861A5BAAFE90E',54,'2009-03-12 12:43:18',0,'',0,NULL),('5FFDE4FACFD83E94F3ACF803A9A8CB84',63,'2009-03-15 18:32:18',0,'',0,NULL),('5D5725DF5558FDC8EE2BC1F7E8782DA5',64,'2009-03-15 18:17:54',0,'',0,NULL),('A6A8529FC500C522B0B24E5BDC86C76B',65,'2009-03-15 17:32:28',0,'',0,NULL),('A08065E2A222D428D77AB6E2936AE99B',66,'2009-03-15 19:30:56',0,'',0,NULL),('F9D65BECD5FC9FC71E5C16A10E89336C',67,'2009-03-15 18:51:35',0,'',0,NULL),('A0A9FCA2EADE69B39CB5C1004602C6AD',68,'2009-03-15 20:46:02',0,'',0,NULL),('602CED920374B4CF1552B05D9BD3B408',69,'2009-03-15 20:52:00',0,'',0,NULL),('79E70357B2285BFDECFD2FE49A66A29E',70,'2009-03-15 20:59:06',0,'',0,NULL),('9D9372C5D8DDA8079908226D002CB756',71,'2009-03-15 21:08:07',0,'',0,NULL),('7920B9C8EC6961BA9264F59B98278B46',73,'2009-03-15 21:20:25',0,'',0,NULL),('69F3F816DD5B2548F282874D32EEE5BD',74,'2009-03-15 21:24:57',0,'',0,NULL),('88D7CC30AB60E86758496454CA72C201',75,'2009-03-15 21:34:59',0,'',0,NULL),('3AF4C27DA5A77D15246A2F59FFC6D66C',76,'2009-03-15 21:38:45',0,'',0,NULL),('7070D20FC0F36012A53A66153311CA41',78,'2009-03-15 22:27:45',0,'',0,NULL),('EA8EA3B64938D6B0D62C9E1D47B7C0E7',79,'2009-03-15 22:29:59',0,'',0,NULL),('2B69AE209929C148B7BEFD0060990BEE',83,'2009-03-30 12:57:42',0,'',0,NULL),('9C533B849DAC6706FCD6490A62943A34',84,'2009-03-30 12:31:50',0,'',0,NULL),('C95E7C3D36115684C772BF67694056AB',85,'2009-03-23 16:43:39',0,'',0,NULL),('F5605997FB4A8CDB5D41DC26C37300D3',86,'2009-03-23 17:21:44',0,'',0,NULL),('7634C8787D770BBC2C9911D79DDA2A4A',87,'2009-03-23 18:58:06',0,'',0,NULL),('A03A4BEEB699F7F7C56E7D7E4384B649',89,'2009-03-23 17:27:44',0,'',0,NULL),('31E58F756542546AD849D2D2CBD842E6',90,'2009-03-21 11:05:21',0,'',0,NULL),('294FA54FE432BA374DA95622A4BFFA98',91,'2009-03-23 14:33:44',0,'',0,NULL),('569BFC919D1BA8508498274CE36D2A5C',92,'2009-03-25 20:37:11',0,'',0,NULL),('46E4E5C4B9B5374829B365A9F65FC019',88,'2009-03-23 16:50:38',0,'',0,NULL),('487B00AC5012AEBD87AA8F1B74C6662D',101,'2010-05-21 12:55:19',0,'',0,NULL),('FBE57F4662D14B77F53DE5522A822A20',103,'2009-03-30 13:58:39',0,'',0,NULL),('CCE596C1D9E774CDFE7AE62E603CB5EB',105,'2010-06-07 14:31:50',0,'',0,NULL),('6DB4B168AB41B3DE3ADCAB8317538CA8',109,'2010-03-23 15:02:49',0,'',0,NULL),('C6DEAB5B89CCF90F6E806C9BAB842091',110,'2010-03-23 15:04:57',0,'',0,NULL),('3C56FCF29C22DF12836242362E543A5D',115,'2010-04-08 14:42:26',0,'',0,NULL),('BBDABBE5F6E39899D9A77574B81AAE3F',117,'2010-04-16 18:04:31',0,'',0,NULL),('4913F3D4B6A27FFBC6891B4CF38C15D7',119,'2010-04-16 18:42:45',0,'',0,NULL),('E2563B10EB15B7CFDC638F7C4A1B2E7D',128,'2010-05-12 16:06:43',0,'',0,NULL),('92386BEB7B5BB90D90F94257F93010E2',136,'2009-03-31 11:50:53',0,'',0,NULL),('FA0DE5CD832762BF439802E2C13385D6',148,'2009-03-31 14:14:42',0,'',0,NULL),('726143FFDF57DA7CC9230A48F6B5159A',155,'2009-03-31 15:12:37',0,'',0,NULL),('B602AF0B379D0B974389407AA1B52D2E',157,'2010-06-02 15:24:13',0,'',0,NULL),('615A8B960E9B8FB8FB57DAD8B8E7FF87',159,'2010-05-20 14:32:50',0,'',0,NULL),('813A493CB4E3003F4A45C461F3FE4EB5',163,'2010-05-21 10:56:50',0,'',0,NULL),('74DFFC09ED0467773CD577FD65050451',165,'2009-03-31 15:49:05',0,'',0,NULL),('8D1664779106D31D74848734CBEB08CF',168,'2010-05-21 12:21:01',0,'',0,NULL),('077E5871165EB0CA6ACD7A4DB2E3F852',172,'2009-03-31 17:43:51',0,'',0,NULL),('1E04C04547773C7BB06B69BE525128A9',188,'2009-03-31 19:09:45',0,'',0,NULL),('004ED6C0EEBAE82B02DFFD57B501805D',194,'2010-06-02 18:03:17',0,'',0,NULL),('E639E8BA6AD983A0F2D5C8A49E73EE5E',198,'2010-10-10 23:26:51',0,'',0,NULL),('2A9B29E99CC6B2491E9C082575EA494E',202,'2011-01-20 22:35:05',0,'',0,NULL),('8B99A31A014895DD5F1C9A1A85AF650B',210,'2010-07-09 04:11:08',0,'',0,NULL),('9D04BEEAECEC364CD828EBD568A474C6',211,'2010-07-09 04:56:11',0,'',0,NULL),('AAF073DE212DF5D3B3AAD378014CCD88',213,'2010-07-20 03:23:41',0,'',0,NULL),('6511E5C41251DAF6157E3D0A613EF845',216,'2010-07-15 02:53:33',0,'',0,NULL),('B55AFDE364AA820CA94C84EBDDA0D8C0',218,'2010-08-06 23:00:48',0,'',0,NULL),('650BA3105D9DFE95ACF1FACFB9C473B9',227,'2011-03-18 03:05:14',0,'',0,NULL),('0BA970F2B20D58B8D46ED71293C3BF26',229,'2010-12-13 17:02:21',0,'',0,NULL),('9798AB4D2D2B08C842A70F0EE9A7A63B',230,'2010-09-24 17:24:57',0,'',0,NULL),('C2D326529EEC31693BD92A415D491A60',228,'2010-09-27 14:08:37',0,'',0,NULL),('A3081E97EFC9D0CE7F91C0860ADAF7A4',231,'2010-09-27 01:17:54',0,'',0,NULL),('35EE3EDCDD6DC6575B596BB6A24448B0',232,'2010-09-27 02:19:48',0,'',0,NULL),('0C058C869FEE76FEAAFC7377106C9739',234,'2010-12-10 01:32:19',0,'',0,NULL),('C869FD740DBFCC8346A2734879AD3480',235,'2010-11-07 20:43:42',0,'',0,NULL),('6353E7F5666A388E46F4E2FAA8753CCD',236,'2010-11-23 01:46:58',0,'',0,NULL),('D7E3552101ABBC39B3A50F43E5883CE1',237,'2010-11-23 04:47:37',0,'',0,NULL),('44588F8A423EFFD2485D0E02655F5ACF',239,'2010-11-24 05:28:58',0,'',0,NULL),('EFD73C54B261E27C76C6AD154371EA85',240,'2010-11-24 20:02:52',0,'',0,NULL),('CFFA99B7DBB34F988EAB9E76FA3CDC53',241,'2010-11-25 02:29:07',0,'',0,NULL),('E83A7910B079F2D8CD6C5A3E388825D2',242,'2010-12-13 22:25:42',0,'',0,NULL),('923B56AE3288A4532094C6AD1D037268',244,'2010-11-25 05:31:52',0,'',0,NULL),('B10A261148B2286E07D866D759FAFC8E',245,'2010-12-01 04:04:09',0,'',0,NULL),('ECA9432D92B3CE121FD627E754C3E392',246,'2010-12-03 04:37:36',0,'',0,NULL),('064EB2AD862D582E3F25FE9EE360AAFC',247,'2010-12-10 01:34:34',0,'',0,NULL),('E2D2C04F179E2AA8710A115F7225B612',248,'2010-12-06 23:25:06',191367,'',0,NULL),('A583CD5E177B199E81376BD53D1BD23C',249,'2010-12-09 02:45:59',0,'',0,NULL),('5B60252F18CAF261A391A560A0C5BBA3',250,'2010-12-09 03:27:51',0,'',0,NULL),('BF23F1E9D93D0A8EC54C733CBA15399D',251,'2009-04-23 17:23:25',0,'',0,NULL),('D7042ADC420DCF532BB54F71DB2111DE',252,'2010-12-20 23:40:08',0,'',0,NULL),('81664416741EDF128A4D165CB3EB413A',254,'2010-12-10 01:27:01',0,'',0,NULL),('8BBCEE8A9CE0E5DB74F1541550665D18',255,'2010-12-10 02:09:08',0,'',0,NULL),('32C776D142F44BD40D0AB96ECB195C42',256,'2011-04-06 10:29:15',0,'',0,NULL),('4A1240C2E1DF6E0CA4E26B8BE6CC1001',257,'2010-12-15 09:42:56',0,'',0,NULL),('C66F11DB904B9C3BAEC7EFED89118546',258,'2010-12-19 09:09:28',0,'',0,NULL),('95E1C911C89BB2217DAA033433B5F314',259,'2010-12-19 11:00:55',0,'',0,NULL),('70EDA41C80E67A30EFC88BD1C09B2131',260,'2010-12-15 09:40:36',0,'',0,NULL),('D468948CEFF95200549B5AA42E3DAFB9',261,'2011-01-11 21:49:07',0,'',0,NULL),('FA7EC60E9C1729285CD4A11C55D475C4',264,'2011-02-09 10:36:27',0,'',0,NULL),('185052742BABDDB0808DA5BEEB6B4B06',265,'2011-03-18 00:06:22',0,'',0,NULL),('873AF4E313BEFA777CA0F2AE7386869A',266,'2011-04-13 18:00:21',400447,'',0,NULL),('DA1658FA8701CA582AAD620FFF9B5298',268,'2009-05-06 17:51:06',0,'',0,NULL),('EF671C6DADEF044BB362126ADCD5FAFB',269,'2009-05-05 17:44:42',0,'',0,NULL),('B98EA374F351E4E241A259DBBB2E3C08',271,'2009-05-06 12:20:37',0,'',0,NULL),('6F3CE9E7FA9C0B44826E7F98DDC5CAEF',273,'2009-05-06 20:55:17',0,'',0,NULL),('92E979B6FA0E16ED66908E6C6812BB6B',275,'2009-05-06 20:59:24',0,'',0,NULL),('0E794D9A695A31F9AC060835BB9BEC42',277,'2009-05-08 19:53:38',0,'',0,NULL),('37416626C3F2A9A096194BE43AB5ECAE',5,'2009-07-28 10:06:56',0,'',0,NULL),('93EAF5E4211BF8AF132C1664B5DA55B8',6,'2009-07-15 15:10:35',0,'',0,NULL),('4FEF302BF53F7E1AF64528D82518559C',7,'2009-11-02 20:43:36',0,'',0,NULL),('F32392AC9455C845A73921A55DA264B0',8,'2009-08-07 12:14:45',0,'',0,NULL),('75E507C71D78BCC9081824F875E0D602',10,'2009-05-11 15:46:37',0,'',0,NULL),('DA88C9DF832298F9747B2FBA441F6250',2,'2011-03-01 10:06:17',384,'',0,NULL),('30D820C772FD4B1B4F6D4AA39C2315EF',3,'2010-06-18 05:55:14',0,'',0,NULL),('BF2D797E3C0BF790E05ADB24D2A5C0E5',0,'2010-05-28 10:45:18',0,'',0,NULL),('B2AACA583E25195597EEC8A8685434CC',23,'2010-01-12 15:21:59',0,'',0,NULL),('231E86E6515D2746EA9F1BA75C68657E',24,'2009-05-27 14:34:05',0,'',0,NULL),('41CEBE525999145ED320DD4BCA849922',29,'2009-11-26 18:56:42',0,'',0,NULL),('226738FF980D7F606A884D227D9EB60E',31,'2009-06-01 12:03:26',0,'',0,NULL),('DDFC1B6E2BC6A92BC8995CEC99D50341',33,'2009-11-27 17:52:50',0,'',0,NULL),('4F817B8A9048CD750E0157E9F565C126',34,'2009-06-02 11:15:08',0,'',0,NULL),('8699CD320253952041EE11F7234858DB',35,'2010-06-18 10:54:45',0,'',0,NULL),('0CA4FCF75D8700A76CE8C5A66C28149E',38,'2009-12-07 17:45:15',0,'',0,NULL),('4FCDD8FD7F3A814931357C0D6C52355E',39,'2009-06-08 14:53:35',0,'',0,NULL),('11AA0CD5F101AA2FA751F0E46D3BD51B',46,'2009-06-08 15:58:56',0,'',0,NULL),('2F3C883AD239F038F68F992F27F50213',57,'2009-06-08 16:52:59',0,'',0,NULL),('13E5D25A74CD88A4C82B02F1F11FE870',59,'2009-06-08 17:19:18',0,'',0,NULL),('8A5DD3AB685A107A8FCCE8230ACBE431',36,'2010-05-28 15:27:24',0,'',0,NULL),('3D5EE19DAC87364738744E16F736DBAB',37,'2010-05-04 15:30:02',0,'',0,NULL),('0FADAC03795211C061FBC3786FB36939',41,'2010-02-01 17:04:16',0,'',0,NULL),('3152365709AECFCE4A1076A850C3C483',43,'2009-12-23 15:11:25',0,'',0,NULL),('AEC39C2F35A0DE9D118D163AF3DD42C3',44,'2009-12-24 14:43:43',0,'',0,NULL),('DDC48BD8ADF575C9EF3848EA9F8760D9',45,'2009-12-29 11:19:07',0,'',0,NULL),('75CFA80A51B8B5E8CD3E507DB260B886',47,'2010-01-07 19:36:32',0,'',0,NULL),('89EAB7FADD82EB24EEBBE7491A2FA578',49,'2010-01-12 19:23:32',0,'',0,NULL),('5EC9AB066FF90461213115A1A607F2DC',95,'2010-02-03 15:20:06',0,'',0,NULL),('0C2808CB63CD5666BC3042DAB6D7CAA9',97,'2010-02-03 17:42:45',0,'',0,NULL),('9911D5028636FFB7D13D500376FB3CDF',99,'2010-02-03 17:49:02',0,'',0,NULL),('47E92988EA076882BCACC7C602463FC4',98,'2010-03-15 15:27:07',113215,'',0,NULL),('A6FFC1FFFBC550C68725E0CE7C298D6B',102,'2010-03-15 17:59:13',0,'',0,NULL),('9F8CD2044E28A22D1ED5635C446FAEF2',104,'2010-04-29 10:43:57',0,'',0,NULL),('2BABC59C33A3B29FC52370622228D40D',107,'2010-03-23 10:02:58',0,'',0,NULL),('029D268CD92A69C8AC6844435E5D4A3E',108,'2010-03-23 13:56:45',0,'',0,NULL),('153F647DD3507C1403DE3A7C37C3A68B',111,'2010-03-23 15:53:37',0,'',0,NULL),('DC85737959FB6402EB2AFC00199FE7A3',112,'2010-03-24 10:45:17',0,'',0,NULL),('6EA57973BA0155BE37DD90CED562FD26',113,'2010-03-24 10:47:26',0,'',0,NULL),('D45A0E9BD9E5D616845B58EA4A74FD41',114,'2010-03-24 15:01:34',0,'',0,NULL),('6C5F62D4E884CE72EEEE09BDB0F1B9BC',116,'2010-04-15 10:35:17',0,'',0,NULL),('D32D45F3EA5C369CDFDEC5E58435817C',118,'2010-04-16 18:28:36',0,'',0,NULL),('59499D922A5D868263C8AFE74A2F5600',120,'2010-04-19 16:22:17',0,'',0,NULL),('F4CD5168E46DFC12550FF88FA16F7D16',42,'2010-04-30 19:06:08',0,'',0,NULL),('8F3E48D84BBB573C9ABCDF7C98900DAD',121,'2010-05-03 14:20:58',0,'',0,NULL),('7F940AA8B0CCFE43EA74AF85D911684D',122,'2010-05-11 16:55:40',0,'',0,NULL),('E4B8D4C4B42F49E8EDEE31281A12D2C9',123,'2010-05-11 17:05:42',0,'',0,NULL),('B20E46A7E58D1B22E13C7517FFE4E8FB',124,'2010-06-02 19:00:20',0,'',0,NULL),('D89BCC5AFECD9238F267F95E38511B3B',125,'2010-05-11 17:23:13',0,'',0,NULL),('5CE6E5D383A1791EEA42DFED77842D00',126,'2010-05-12 10:37:41',0,'',0,NULL),('2E23468A527CBAC23B14E0C5E8109540',127,'2010-05-12 16:00:23',0,'',0,NULL),('5566798D47E176BDB4378B70A8D67C37',129,'2010-05-16 15:21:53',0,'',0,NULL),('986DA8A1320AB9EF2ECFE1298D913E7E',130,'2010-05-17 09:26:49',0,'',0,NULL),('6B856F2AE68A2CFF2EAEF8E18FA6DE7F',131,'2010-05-17 09:59:49',0,'',0,NULL),('16ECB3B3D138EFB69E8F012BB6D62D7D',132,'2010-05-17 10:04:01',0,'',0,NULL),('281C137F31A772CB0A9D914E81E92B36',133,'2010-05-17 10:17:05',0,'',0,NULL),('895453C25D07A50DD941D24B868C33F6',138,'2010-05-18 15:06:47',0,'',0,NULL),('40C313426118B56C56A3575D5113B0C8',140,'2010-05-18 15:20:59',0,'',0,NULL),('0C87B83A872ABCB24C19B10A77F9C942',137,'2010-05-19 12:43:12',0,'',0,NULL),('4CF92046F57133B5DC8F90DD6626A05E',142,'2010-05-19 12:50:20',0,'',0,NULL),('BB12ED5E38E4D496F81857D07A7685DE',143,'2010-05-19 12:57:32',0,'',0,NULL),('F2EC543A89AE03FE886465463AE2CD3C',144,'2010-05-19 14:24:10',0,'',0,NULL),('012A7FE3E65F37D37FA528C0B74D1027',151,'2010-05-19 15:05:57',0,'',0,NULL),('97FB4672B94F855111D9733FA629DA16',156,'2010-05-19 17:31:57',0,'',0,NULL),('A87BFAAACE11E35B8710E6F4E3979BF6',158,'2010-05-20 12:59:48',0,'',0,NULL),('F082A0DB99B5862A0889D4893233FFC2',160,'2010-05-20 14:39:11',0,'',0,NULL),('D705BFFB11B00D965A51F95D8DACB9C9',161,'2010-05-21 10:53:51',0,'',0,NULL),('233E7066CAB7EA6999B995A7159D45CA',162,'2010-05-21 10:55:40',0,'',0,NULL),('4D5AF19FDF6B060DBEA1C3D23C00FA45',164,'2010-05-21 12:07:08',0,'',0,NULL),('E0A43DB230B3956B015D856D5D390BF1',167,'2010-05-21 12:19:21',0,'',0,NULL),('3226AB2FBCE4FB177DC1C8C63D983485',177,'2010-05-21 12:47:00',0,'',0,NULL),('4DC870BC7C8EF598F01F5C08FF847096',184,'2010-05-21 16:47:52',0,'',0,NULL),('E23E5ACF51E9A5BF7FE0186A08F63EDC',186,'2010-05-28 10:46:32',0,'',0,NULL),('AD05456493E68B2B2449A218C6E8CB92',191,'2010-06-02 15:17:14',0,'',0,NULL),('29E2364BE5CBD3BF27154A441DCFA6B6',193,'2010-06-02 17:01:30',0,'',0,NULL),('6A014672C0EF11888430E2EB0223B33B',195,'2010-06-02 18:05:47',0,'',0,NULL),('DAD9DF68173FE503D8C71FDE10DDFEFC',196,'2010-06-02 18:10:16',0,'',0,NULL),('66E7E0E89900429DBCE01D4A40E26816',189,'2010-06-02 20:08:22',0,'',0,NULL),('97A885F0A57826464733828AB6CC44E7',197,'2011-03-07 10:26:05',257967,'',0,NULL),('F5C14BBE87E44730C73CBD444EBBDC86',199,'2010-12-20 00:07:22',0,'',0,NULL),('2792C87F477B9C6BEC3DF29357A9DF59',201,'2010-06-18 06:36:01',0,'',0,NULL),('2F7A4C9E7CB192A7BD21833802A5462D',203,'2010-07-26 03:21:01',0,'',0,NULL),('F9C1E13D55C351C126DE1E626DED3788',206,'2010-06-24 02:50:10',0,'',0,NULL),('7672DFD3B9515DD19EA1AB75689BA0C0',207,'2011-01-18 05:18:07',0,'',0,NULL),('A59CAC7A6E3780413EEA8D2E99C8BDE3',208,'2010-07-15 02:36:17',0,'',0,NULL),('228932FDFE69515FA3E1C7131D2A3EE9',209,'2010-07-09 03:24:58',0,'',0,NULL),('F5518DD8C52D46D0B18399A2EF354D09',212,'2010-07-09 05:08:40',0,'',0,NULL),('F8DA5C67912467C620A00D87DBE10E82',214,'2010-07-20 03:22:21',0,'',0,NULL),('0655C099A7648F73F376491C8E4416CE',215,'2010-07-16 03:04:17',0,'',0,NULL),('919F923D02B81BF1E06269B6D24F1D17',217,'2010-08-02 16:03:02',0,'',0,NULL),('D08B4FB03061C126CB1614204F8E43DF',219,'2010-08-10 17:42:58',0,'',0,NULL),('1E4FDD794C17498A58D8ED449F6AED56',220,'2011-04-15 07:15:21',0,'',0,NULL),('3ED7D6EB5F4BDA0CE4EFF6C8C68B3FC8',221,'2010-08-20 05:31:27',0,'',0,NULL),('4718FE4FFB134B4CC08A9A1B04087CD9',222,'2010-11-23 21:16:55',0,'',0,NULL),('0AC18B1A210978865F48B39D94166458',223,'2010-08-24 23:27:39',0,'',0,NULL),('AA611C3760ADE1E94766432D8BC4089E',224,'2010-09-03 15:40:36',0,'',0,NULL),('473A2A262B8DD1178D9144A479B54EA2',226,'2010-09-08 22:57:13',0,'',0,NULL),('127200AC1B946B882730C78D6285A1D4',233,'2010-09-27 03:30:41',0,'',0,NULL),('92B6D93FDD7DE26CFDC6FF666EA8A071',238,'2010-11-24 03:49:13',0,'',0,NULL),('D48AEDBAB30A51CEE1A7A060AF20D4DD',243,'2010-11-25 03:26:44',0,'',0,NULL),('A3E3F0577E040E27D20E7D5EF83A5D0B',253,'2010-12-09 08:24:13',0,'',0,NULL),('3E5CD183031B98FFCFB0ADDDC406AD99',262,'2011-01-13 00:13:03',0,'',0,NULL),('DA118C5E27A3BA6E998E7846B69850DE',263,'2011-01-28 01:31:52',0,'',0,NULL),('83E6AE54288674D3FAADE4AEA2728502',267,'2011-04-13 18:13:38',0,'',0,NULL);
/*!40000 ALTER TABLE `jforum_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_smilies`
--

DROP TABLE IF EXISTS `jforum_smilies`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_smilies` (
  `smilie_id` int(11) NOT NULL auto_increment,
  `code` varchar(50) NOT NULL default '',
  `url` varchar(100) default NULL,
  `disk_name` varchar(255) default NULL,
  PRIMARY KEY  (`smilie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_smilies`
--

LOCK TABLES `jforum_smilies` WRITE;
/*!40000 ALTER TABLE `jforum_smilies` DISABLE KEYS */;
INSERT INTO `jforum_smilies` VALUES (1,':)','<img src=\"#CONTEXT#/images/smilies/3b63d1616c5dfcf29f8a7a031aaa7cad.gif\" />','3b63d1616c5dfcf29f8a7a031aaa7cad.gif'),(2,':-)','<img src=\"#CONTEXT#/images/smilies/3b63d1616c5dfcf29f8a7a031aaa7cad.gif\"/>','3b63d1616c5dfcf29f8a7a031aaa7cad.gif'),(3,':D','<img src=\"#CONTEXT#/images/smilies/283a16da79f3aa23fe1025c96295f04f.gif\" />','283a16da79f3aa23fe1025c96295f04f.gif'),(4,':-D','<img src=\"#CONTEXT#/images/smilies/283a16da79f3aa23fe1025c96295f04f.gif\" />','283a16da79f3aa23fe1025c96295f04f.gif'),(5,':(','<img src=\"#CONTEXT#/images/smilies/9d71f0541cff0a302a0309c5079e8dee.gif\" />','9d71f0541cff0a302a0309c5079e8dee.gif'),(6,':mrgreen:','<img src=\"#CONTEXT#/images/smilies/ed515dbff23a0ee3241dcc0a601c9ed6.gif\" />','ed515dbff23a0ee3241dcc0a601c9ed6.gif'),(7,':-o','<img src=\"#CONTEXT#/images/smilies/47941865eb7bbc2a777305b46cc059a2.gif\"  />','47941865eb7bbc2a777305b46cc059a2.gif'),(8,':shock:','<img src=\"#CONTEXT#/images/smilies/385970365b8ed7503b4294502a458efa.gif\" />','385970365b8ed7503b4294502a458efa.gif'),(9,':?:','<img src=\"#CONTEXT#/images/smilies/0a4d7238daa496a758252d0a2b1a1384.gif\" />','0a4d7238daa496a758252d0a2b1a1384.gif'),(10,'8)','<img src=\"#CONTEXT#/images/smilies/b2eb59423fbf5fa39342041237025880.gif\"  />','b2eb59423fbf5fa39342041237025880.gif'),(11,':lol:','<img src=\"#CONTEXT#/images/smilies/97ada74b88049a6d50a6ed40898a03d7.gif\" />','97ada74b88049a6d50a6ed40898a03d7.gif'),(12,':x','<img src=\"#CONTEXT#/images/smilies/1069449046bcd664c21db15b1dfedaee.gif\"  />','1069449046bcd664c21db15b1dfedaee.gif'),(13,':P','<img src=\"#CONTEXT#/images/smilies/69934afc394145350659cd7add244ca9.gif\" />','69934afc394145350659cd7add244ca9.gif'),(14,':-P','<img src=\"#CONTEXT#/images/smilies/69934afc394145350659cd7add244ca9.gif\" />','69934afc394145350659cd7add244ca9.gif'),(15,':oops:','<img src=\"#CONTEXT#/images/smilies/499fd50bc713bfcdf2ab5a23c00c2d62.gif\" />','499fd50bc713bfcdf2ab5a23c00c2d62.gif'),(16,':cry:','<img src=\"#CONTEXT#/images/smilies/c30b4198e0907b23b8246bdd52aa1c3c.gif\" />','c30b4198e0907b23b8246bdd52aa1c3c.gif'),(17,':evil:','<img src=\"#CONTEXT#/images/smilies/2e207fad049d4d292f60607f80f05768.gif\" />','2e207fad049d4d292f60607f80f05768.gif'),(18,':twisted:','<img src=\"#CONTEXT#/images/smilies/908627bbe5e9f6a080977db8c365caff.gif\" />','908627bbe5e9f6a080977db8c365caff.gif'),(19,':roll:','<img src=\"#CONTEXT#/images/smilies/2786c5c8e1a8be796fb2f726cca5a0fe.gif\" />','2786c5c8e1a8be796fb2f726cca5a0fe.gif'),(20,':wink:','<img src=\"#CONTEXT#/images/smilies/8a80c6485cd926be453217d59a84a888.gif\" />','8a80c6485cd926be453217d59a84a888.gif'),(21,';)','<img src=\"#CONTEXT#/images/smilies/8a80c6485cd926be453217d59a84a888.gif\" />','8a80c6485cd926be453217d59a84a888.gif'),(22,';-)','<img src=\"#CONTEXT#/images/smilies/8a80c6485cd926be453217d59a84a888.gif\" />','8a80c6485cd926be453217d59a84a888.gif'),(23,':!:','<img src=\"#CONTEXT#/images/smilies/9293feeb0183c67ea1ea8c52f0dbaf8c.gif\" />','9293feeb0183c67ea1ea8c52f0dbaf8c.gif'),(24,':?','<img src=\"#CONTEXT#/images/smilies/136dd33cba83140c7ce38db096d05aed.gif\" />','136dd33cba83140c7ce38db096d05aed.gif'),(25,':idea:','<img src=\"#CONTEXT#/images/smilies/8f7fb9dd46fb8ef86f81154a4feaada9.gif\" />','8f7fb9dd46fb8ef86f81154a4feaada9.gif'),(26,':arrow:','<img src=\"#CONTEXT#/images/smilies/d6741711aa045b812616853b5507fd2a.gif\" />','d6741711aa045b812616853b5507fd2a.gif'),(27,':hunf:','<img src=\"#CONTEXT#/images/smilies/0320a00cb4bb5629ab9fc2bc1fcc4e9e.gif\" />','0320a00cb4bb5629ab9fc2bc1fcc4e9e.gif'),(28,':-(','<img src=\"#CONTEXT#/images/smilies/9d71f0541cff0a302a0309c5079e8dee.gif\"  />','9d71f0541cff0a302a0309c5079e8dee.gif'),(29,':XD:','<img src=\"#CONTEXT#/images/smilies/49869fe8223507d7223db3451e5321aa.gif\" />','49869fe8223507d7223db3451e5321aa.gif'),(30,':thumbup:','<img src=\"#CONTEXT#/images/smilies/e8a506dc4ad763aca51bec4ca7dc8560.gif\" />','e8a506dc4ad763aca51bec4ca7dc8560.gif'),(31,':thumbdown:','<img src=\"#CONTEXT#/images/smilies/e78feac27fa924c4d0ad6cf5819f3554.gif\" />','e78feac27fa924c4d0ad6cf5819f3554.gif'),(32,':|','<img src=\"#CONTEXT#/images/smilies/1cfd6e2a9a2c0cf8e74b49b35e2e46c7.gif\" />','1cfd6e2a9a2c0cf8e74b49b35e2e46c7.gif');
/*!40000 ALTER TABLE `jforum_smilies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_themes`
--

DROP TABLE IF EXISTS `jforum_themes`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_themes` (
  `themes_id` int(11) NOT NULL auto_increment,
  `template_name` varchar(30) NOT NULL default '',
  `style_name` varchar(30) NOT NULL default '',
  PRIMARY KEY  (`themes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_themes`
--

LOCK TABLES `jforum_themes` WRITE;
/*!40000 ALTER TABLE `jforum_themes` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_themes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_topics`
--

DROP TABLE IF EXISTS `jforum_topics`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_topics` (
  `topic_id` int(11) NOT NULL auto_increment,
  `forum_id` int(11) NOT NULL default '0',
  `topic_title` varchar(100) NOT NULL default '',
  `user_id` int(11) NOT NULL default '0',
  `topic_time` datetime default NULL,
  `topic_views` int(11) default '1',
  `topic_replies` int(11) default '0',
  `topic_status` tinyint(3) default '0',
  `topic_vote_id` int(11) NOT NULL default '0',
  `topic_type` tinyint(3) default '0',
  `topic_first_post_id` int(11) default '0',
  `topic_last_post_id` int(11) NOT NULL default '0',
  `topic_moved_id` int(11) default '0',
  `moderated` tinyint(1) default '0',
  `profile_id` int(11) NOT NULL,
  PRIMARY KEY  (`topic_id`),
  KEY `forum_id` (`forum_id`),
  KEY `user_id` (`user_id`),
  KEY `topic_first_post_id` (`topic_first_post_id`),
  KEY `topic_last_post_id` (`topic_last_post_id`),
  KEY `topic_moved_id` (`topic_moved_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_topics`
--

LOCK TABLES `jforum_topics` WRITE;
/*!40000 ALTER TABLE `jforum_topics` DISABLE KEYS */;
INSERT INTO `jforum_topics` VALUES (57,7,'Interview discussion',203,'2010-06-22 02:08:13',25,0,0,0,0,121,121,0,0,519),(58,15,'asd',203,'2010-06-22 02:12:40',11,1,0,0,0,122,136,0,0,519),(59,16,'hi',198,'2010-07-25 23:42:57',9,0,0,0,0,123,123,0,0,514),(60,8,'HI',198,'2010-07-26 02:03:56',9,0,0,0,0,124,124,0,0,514),(61,13,'we',198,'2010-07-26 02:05:09',7,1,0,0,0,125,126,0,0,514),(62,13,'dfg',198,'2010-07-26 02:15:37',4,0,0,0,0,127,127,0,0,514),(63,13,'test',198,'2010-07-26 02:31:25',17,1,0,0,0,128,129,0,0,514),(64,16,'hi',198,'2010-07-26 03:08:08',10,1,0,0,0,130,131,0,0,514),(65,11,'what is networking',198,'2010-07-26 03:27:25',22,2,0,0,0,132,146,0,0,514),(66,11,'Linins iossues',198,'2010-07-27 02:59:27',9,1,0,0,0,133,134,0,0,514),(67,16,'blah blah blah',217,'2010-08-02 16:14:26',7,0,0,0,0,135,135,0,0,530),(68,13,'So what do I do next?',217,'2010-08-02 16:24:03',9,1,0,0,0,137,140,0,0,530),(69,8,'I am the best employee! Hire me!',217,'2010-08-02 16:52:24',7,1,0,0,0,138,149,0,0,530),(70,10,'Groupon.com!',217,'2010-08-02 16:53:55',5,0,0,0,0,139,139,0,0,530),(71,10,'dfg',198,'2010-08-04 03:06:09',4,0,0,0,0,141,141,0,0,514),(72,10,'How to save money ..',198,'2010-08-04 04:53:50',4,0,0,0,0,142,142,0,0,514),(73,12,'I need java resource ',198,'2010-08-04 04:56:04',6,1,0,0,0,143,144,0,0,514),(74,7,'d',248,'2010-12-06 23:28:16',4,0,0,0,0,147,147,0,0,579),(75,7,'szdfsd',197,'2011-03-01 09:58:37',4,0,0,0,0,148,148,0,0,569);
/*!40000 ALTER TABLE `jforum_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_topics_watch`
--

DROP TABLE IF EXISTS `jforum_topics_watch`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_topics_watch` (
  `topic_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_read` tinyint(1) default '1',
  KEY `idx_topic` (`topic_id`),
  KEY `idx_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_topics_watch`
--

LOCK TABLES `jforum_topics_watch` WRITE;
/*!40000 ALTER TABLE `jforum_topics_watch` DISABLE KEYS */;
INSERT INTO `jforum_topics_watch` VALUES (57,203,1),(58,203,0),(59,198,1),(60,198,1),(61,198,1),(62,198,1),(63,198,1),(64,198,1),(65,198,0),(66,198,1),(67,217,1),(58,217,1),(68,217,0),(69,217,0),(70,217,1),(68,198,1),(71,198,1),(72,198,1),(73,198,1),(65,234,0),(65,197,1),(74,248,1),(75,197,1),(69,197,1);
/*!40000 ALTER TABLE `jforum_topics_watch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_user_groups`
--

DROP TABLE IF EXISTS `jforum_user_groups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_user_groups` (
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  KEY `idx_group` (`group_id`),
  KEY `idx_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_user_groups`
--

LOCK TABLES `jforum_user_groups` WRITE;
/*!40000 ALTER TABLE `jforum_user_groups` DISABLE KEYS */;
INSERT INTO `jforum_user_groups` VALUES (2,2),(5,22),(1,1),(1,1),(1,56),(1,55),(1,57),(1,58),(1,59),(1,60),(1,61),(1,62),(1,63),(1,64),(1,65),(1,66),(1,67),(1,68),(1,69),(1,70),(1,71),(1,72),(1,73),(1,74),(1,75),(1,76),(1,77),(1,78),(1,79),(1,80),(1,81),(1,82),(1,83),(1,84),(1,85),(1,86),(1,87),(1,88),(1,89),(1,90),(1,91),(1,92),(1,94),(1,93),(2,49),(2,11),(2,12),(2,17),(2,29),(2,40),(2,20),(1,95),(1,97),(1,98),(1,99),(1,100),(1,101),(1,102),(1,103),(1,104),(1,105),(1,106),(1,107),(1,108),(1,109),(1,110),(1,111),(1,112),(1,113),(1,114),(1,115),(1,116),(1,117),(1,118),(1,119),(1,120),(1,121),(1,122),(1,123),(1,124),(1,125),(1,126),(1,127),(1,128),(1,129),(1,130),(1,131),(1,132),(1,133),(1,134),(1,135),(1,136),(1,137),(1,138),(1,139),(1,140),(1,141),(1,142),(1,143),(1,144),(1,145),(1,146),(1,147),(1,148),(1,149),(1,150),(1,151),(1,152),(1,153),(1,154),(1,155),(1,156),(1,157),(1,158),(1,159),(1,160),(1,161),(1,162),(1,163),(1,164),(1,165),(1,166),(1,167),(1,168),(1,169),(1,170),(1,171),(1,172),(1,173),(1,174),(1,175),(1,176),(1,177),(1,178),(1,179),(1,180),(1,181),(1,182),(1,183),(1,184),(1,185),(1,186),(1,187),(1,188),(1,189),(1,190),(1,191),(1,192),(1,193),(1,194),(1,195),(1,196),(1,197),(1,198),(1,199),(1,200),(1,201),(1,202),(1,203),(1,204),(1,206),(1,207),(1,208),(1,209),(1,210),(1,211),(1,212),(1,213),(1,214),(1,215),(1,216),(1,217),(1,218),(1,219),(1,220),(1,221),(1,222),(1,223),(1,224),(1,225),(1,226),(1,227),(1,228),(1,229),(1,230),(1,231),(1,232),(1,233),(1,234),(1,235),(1,236),(1,237),(1,238),(1,239),(1,240),(1,241),(1,242),(1,243),(1,244),(1,245),(1,246),(1,247),(1,248),(1,249),(1,250),(1,251),(1,252),(1,253),(1,254),(1,255),(1,256),(1,257),(1,258),(1,259),(1,260),(1,261),(1,262),(1,263),(1,264),(1,265),(1,266),(1,267);
/*!40000 ALTER TABLE `jforum_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_users`
--

DROP TABLE IF EXISTS `jforum_users`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_users` (
  `user_id` int(11) NOT NULL auto_increment,
  `user_active` tinyint(1) default NULL,
  `username` varchar(50) NOT NULL default '',
  `user_password` varchar(32) NOT NULL default '',
  `user_session_time` bigint(20) default '0',
  `user_session_page` int(11) NOT NULL default '0',
  `user_lastvisit` datetime default NULL,
  `user_regdate` datetime default NULL,
  `user_level` tinyint(4) default NULL,
  `user_posts` int(11) NOT NULL default '0',
  `user_timezone` varchar(5) NOT NULL default '',
  `user_style` tinyint(4) default NULL,
  `user_lang` varchar(255) NOT NULL default '',
  `user_dateformat` varchar(20) NOT NULL default '%d/%M/%Y %H:%i',
  `user_new_privmsg` int(11) NOT NULL default '0',
  `user_unread_privmsg` int(11) NOT NULL default '0',
  `user_last_privmsg` datetime default NULL,
  `user_emailtime` datetime default NULL,
  `user_viewemail` tinyint(1) default '0',
  `user_attachsig` tinyint(1) default '1',
  `user_allowhtml` tinyint(1) default '0',
  `user_allowbbcode` tinyint(1) default '1',
  `user_allowsmilies` tinyint(1) default '1',
  `user_allowavatar` tinyint(1) default '1',
  `user_allow_pm` tinyint(1) default '1',
  `user_allow_viewonline` tinyint(1) default '1',
  `user_notify` tinyint(1) default '1',
  `user_notify_always` tinyint(1) default '0',
  `user_notify_text` tinyint(1) default '0',
  `user_notify_pm` tinyint(1) default '1',
  `user_popup_pm` tinyint(1) default '1',
  `rank_id` int(11) default '0',
  `user_avatar` varchar(100) default NULL,
  `user_avatar_type` tinyint(4) NOT NULL default '0',
  `user_email` varchar(255) NOT NULL default '',
  `user_icq` varchar(15) default NULL,
  `user_website` varchar(255) default NULL,
  `user_from` varchar(100) default NULL,
  `user_sig` text,
  `user_sig_bbcode_uid` varchar(10) default NULL,
  `user_aim` varchar(255) default NULL,
  `user_yim` varchar(255) default NULL,
  `user_msnm` varchar(255) default NULL,
  `user_occ` varchar(100) default NULL,
  `user_interests` varchar(255) default NULL,
  `user_biography` text,
  `user_actkey` varchar(32) default NULL,
  `gender` char(1) default NULL,
  `themes_id` int(11) default NULL,
  `deleted` tinyint(1) default NULL,
  `user_viewonline` tinyint(1) default '1',
  `security_hash` varchar(32) default NULL,
  `user_karma` double default NULL,
  `user_authhash` varchar(32) default NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=268 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_users`
--

LOCK TABLES `jforum_users` WRITE;
/*!40000 ALTER TABLE `jforum_users` DISABLE KEYS */;
INSERT INTO `jforum_users` VALUES (2,NULL,'Admin','21232f297a57a5a743894a0e4a801fc3',0,0,NULL,'2010-06-24 02:42:16',NULL,1,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(3,1,'Endeavour','ba3241797209b44fb851906fe0963d93',0,0,NULL,'2009-07-10 11:53:24',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'e@e.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(4,1,'Patni','6975d6db088ccbf5cd363fe8748c4541',0,0,NULL,'2009-07-10 12:15:19',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'p@p.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(5,1,'shwethaprofile1','a57531df3f5db00cd2b6210a2d60db4b',0,0,'2009-07-14 16:49:31','2009-07-14 16:49:09',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'c@c.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(6,1,'ravichandrikaProfile','f0fd8629c5b095a711f078bb3ecd637a',0,0,'2009-07-15 15:11:13','2009-07-15 15:10:35',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'d@d.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(7,1,'jj','ec96fc13fd206e863d56bf6bb1ae6a60',0,0,'2009-07-15 15:12:37','2009-07-15 15:12:20',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'s@s.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(8,1,'8','d7d1ba5c737dbc467890a14fd6f4dc73',0,0,NULL,'2009-08-07 12:14:45',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'f@f.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(9,1,'9','f0fd8629c5b095a711f078bb3ecd637a',0,0,NULL,'2009-08-10 18:46:26',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'dd@dd.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(11,1,' xc xcvzxcv','ec96fc13fd206e863d56bf6bb1ae6a60',0,0,'2009-11-04 10:27:01','2009-11-03 10:08:09',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'ss@ss.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(12,1,'12','2e28987855a79bd5c2225db901c39965',0,0,NULL,'2009-11-03 12:30:51',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'mob@admin.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(14,1,'asdasdasd','e14bd6ed13e908495ab52be3648fa2b0',0,0,'2009-11-12 11:40:26','2009-11-12 11:40:17',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'rr@rr.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(15,1,'abc Profile','e14bd6ed13e908495ab52be3648fa2b0',0,0,'2009-11-13 13:10:40','2009-11-13 13:09:57',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'abc@mob.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(16,1,'aaaaaaaaaaaaaa','e14bd6ed13e908495ab52be3648fa2b0',0,0,'2009-11-13 18:26:32','2009-11-13 18:26:23',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'aa1@mob.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(17,1,'17','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2009-11-17 13:24:30',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'aa@mob.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(18,1,'Chandrika_Profile','e14bd6ed13e908495ab52be3648fa2b0',0,0,'2009-11-17 20:30:34','2009-11-17 14:46:38',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'asd@asd.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(19,1,'asasasasasasas','e363ba16c5bdebd8e4c457cc7ad08ead',0,0,'2009-11-20 11:54:17','2009-11-20 11:53:43',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'asas@as.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(20,1,'sat2@mob.com','e14bd6ed13e908495ab52be3648fa2b0',0,0,'2009-11-26 10:47:26','2009-11-26 10:35:57',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'sat2@mob.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(21,1,'fg','e14bd6ed13e908495ab52be3648fa2b0',0,0,'2009-11-26 10:56:18','2009-11-26 10:55:14',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'sat3@mob.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(23,1,'aaaa','e14bd6ed13e908495ab52be3648fa2b0',0,0,'2009-11-26 11:54:59','2009-11-26 11:54:35',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'sat4@mob.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(24,1,'24','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2009-11-26 11:54:35',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'sat4@mob.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(25,1,' xc xcvzxcv','e14bd6ed13e908495ab52be3648fa2b0',0,0,'2009-11-26 12:00:49','2009-11-26 11:59:59',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'sat5@mob.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(26,1,' xc xcvzxcv','e14bd6ed13e908495ab52be3648fa2b0',0,0,'2009-11-26 13:29:38','2009-11-26 13:29:02',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'sat6@mob.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(27,1,'sddddddddddd','e14bd6ed13e908495ab52be3648fa2b0',0,0,'2009-11-26 14:45:06','2009-11-26 14:44:34',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'sat7@mob.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(28,1,'sat12@mob.com','b291b93c94334c7eb7f49b364b960c97',0,0,'2009-11-26 14:57:38','2009-11-26 14:57:27',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'sat12@mob.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(29,1,'29','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2009-11-26 18:56:42',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'sat7@mob.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(30,1,'satyaaaaaaaa','e14bd6ed13e908495ab52be3648fa2b0',0,0,'2009-11-27 18:47:01','2009-11-27 16:27:51',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'sat11@mob.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(31,1,'31','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2009-11-27 17:35:47',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'sat13@mob.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(32,1,'32','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2009-11-27 17:44:02',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'sat14@mob.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(33,1,'sat15@mob.com','e14bd6ed13e908495ab52be3648fa2b0',0,0,'2009-11-27 17:53:40','2009-11-27 17:52:50',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'sat15@mob.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(34,1,'sat21@mob.com','e14bd6ed13e908495ab52be3648fa2b0',0,0,'2009-11-28 14:47:57','2009-11-28 14:47:23',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'sat21@mob.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(35,1,'satyam@mob.com','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2009-11-28 15:02:16',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'satyam@mob.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(36,1,'satyam1@mob.com','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2009-11-28 15:38:35',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'satyam1@mob.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(37,1,'Endeavour','a48f8cabd17d08eda85e0e875fda190e',0,0,NULL,'2009-12-02 12:25:53',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'est@est.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(38,1,'Profile22','11745dc3746fe06f279e6a58ef306a48',0,0,'2009-12-07 16:22:09','2009-12-02 13:01:30',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'ravichandrika@techendeavour.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(39,1,'Abc','4b483f4697bfd0f026f28b2b30602ddf',0,0,'2009-12-07 17:09:44','2009-12-07 17:09:23',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'a@c.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(40,1,'40','4b483f4697bfd0f026f28b2b30602ddf',0,0,NULL,'2009-12-07 17:09:27',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'a@c.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(41,1,'Profile_New','7874dceadcc0d0423aef32d14d8fd7ae',0,0,'2009-12-08 10:11:36','2009-12-08 10:10:45',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'aa@aa.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(42,1,'IBM','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2009-12-08 16:41:32',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'ibm@mob.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(98,1,'SQL Profile ','e14bd6ed13e908495ab52be3648fa2b0',0,0,'2010-02-03 17:50:54','2010-02-03 17:49:02',NULL,82,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'ww@ww.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,4.4,NULL),(99,1,'99','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-02-03 17:49:02',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'ww@ww.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(100,1,'100','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-02-03 17:52:18',NULL,1,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'eee@ee.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(101,1,'asdasdasd','e14bd6ed13e908495ab52be3648fa2b0',0,0,'2010-02-10 19:19:43','2010-02-10 19:19:32',NULL,10,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'qq@qq.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,5,NULL),(102,1,'102','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-03-15 16:35:04',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'cc@cc.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(103,1,'103','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-03-15 18:53:24',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'cc@c.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(104,1,'New_S3Profile','e14bd6ed13e908495ab52be3648fa2b0',0,0,'2010-03-17 12:11:53','2010-03-17 11:01:04',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'v@v.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(105,1,'sdsd','e14bd6ed13e908495ab52be3648fa2b0',0,0,'2010-03-17 12:24:10','2010-03-17 12:23:32',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'u@u.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(106,1,'106','32dbd4f4a103d763c3d775d6f46effd9',0,0,NULL,'2010-03-23 10:02:55',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'k1@k.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(107,1,'107','32dbd4f4a103d763c3d775d6f46effd9',0,0,NULL,'2010-03-23 10:02:58',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'k1@k.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(108,1,'MyNewProfile','7874dceadcc0d0423aef32d14d8fd7ae',0,0,'2010-03-23 13:57:20','2010-03-23 13:56:45',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'aa@b.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(109,1,'109','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-03-23 15:02:49',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'g@g1.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(110,1,'New_GProfile','e14bd6ed13e908495ab52be3648fa2b0',0,0,'2010-03-23 15:10:14','2010-03-23 15:04:57',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'kk@k.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(111,1,'J2Ee_Profile','9e90baa563056f13803750618c2394c5',0,0,'2010-03-23 15:54:12','2010-03-23 15:53:37',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'h@h.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(112,1,'Java_J_Profile','e14bd6ed13e908495ab52be3648fa2b0',0,0,'2010-03-24 10:45:45','2010-03-24 10:45:17',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'j@j1.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(113,1,'Ab_Profile','e14bd6ed13e908495ab52be3648fa2b0',0,0,'2010-03-24 10:47:43','2010-03-24 10:47:26',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'ab@ab.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(114,1,'114','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-03-24 15:01:34',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'aa@c.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(115,1,'Chandrika_Endeavour','11745dc3746fe06f279e6a58ef306a48',0,0,'2010-04-08 14:42:54','2010-04-08 14:42:26',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'chandrika@endeavour.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(116,1,'HCL','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-04-15 10:35:17',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'hcl@hcl.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(117,1,'Java_Profile','e14bd6ed13e908495ab52be3648fa2b0',0,0,'2010-04-16 18:04:47','2010-04-16 18:04:31',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'rchandrika@est.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(118,1,'118','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-04-16 18:28:36',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'archana@est.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(119,1,'119','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-04-16 18:42:45',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'anu@est.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(120,1,'Hp','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-04-19 16:22:17',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'hp@hp.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(121,1,'TCS','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-04-29 20:45:24',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'tcs@tcs.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(122,1,'122','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-05-11 16:55:40',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'a11@a.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(123,1,'123','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-05-11 17:05:42',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'m@m.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(124,1,'124','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-05-11 17:16:32',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'k@k.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(125,1,'125','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-05-11 17:23:13',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'p1@p.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(126,1,'zxczxczxc','22465bfa8893e81d57ca6a7fb3d93e41',0,0,'2010-05-21 12:47:10','2010-05-12 10:37:41',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(127,1,'127','22465bfa8893e81d57ca6a7fb3d93e41',0,0,NULL,'2010-05-12 16:00:23',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(128,1,'128','22465bfa8893e81d57ca6a7fb3d93e41',0,0,NULL,'2010-05-12 16:06:43',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(129,1,'129','22465bfa8893e81d57ca6a7fb3d93e41',0,0,NULL,'2010-05-16 15:21:53',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(130,1,'zdsdasas','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-05-17 09:26:49',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'sat@mob1.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(131,1,'sa','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-05-17 09:59:49',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'sat@mob2.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(132,1,'asdf','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-05-17 10:04:01',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'sat@mob3.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(133,1,'zdsdasas','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-05-17 10:17:05',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'sat@mob4.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(134,1,'saasdas','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-05-17 10:26:03',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'sat@mob5.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(135,1,'satyaOrg','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-05-17 11:31:48',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'sat@mob6.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(136,1,'asdfsds','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-05-17 11:37:10',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'sat@mob7.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(137,1,'sadsdas','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-05-18 11:45:02',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'sat@mob8.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(138,1,'Satya Pulkam ORG','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-05-18 15:06:47',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'sat55@mob.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(139,1,'sdsadasdasdasd','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-05-18 15:12:32',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'sat@mob9.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(140,1,'sdsadasdasdasd','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-05-18 15:20:59',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'sat@mob10.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(141,1,'141','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-05-18 16:12:58',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'ss11@ss.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(142,1,'sdasd','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-05-19 12:50:20',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'test1@mob.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(143,1,'asdf','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-05-19 12:57:11',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'asdf@1.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(144,1,'xxzxz','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-05-19 14:24:10',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'vv@vv.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(145,1,'145','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-05-19 14:27:19',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'mm@m.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(146,1,'LLLLLLLLL','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-05-19 14:35:52',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'q1@q.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(147,1,'sasd','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-05-19 14:37:49',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'j@j.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(148,1,'sa','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-05-19 14:42:17',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'t@t.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(149,1,'sada','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-05-19 14:48:54',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'a2@aa.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(150,1,'werwe','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-05-19 14:52:05',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'a3@aa.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(151,1,'sada','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-05-19 15:05:57',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'a2@aa.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(152,1,'asdf','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-05-19 16:16:57',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'k12@k.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(153,1,'asdf','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-05-19 17:06:51',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'satya@m.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(154,1,'satya','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-05-19 17:11:07',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'q12@q.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(155,1,'asdf','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-05-19 17:13:04',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'satya@m.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(156,1,'pulkam@mob.com','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-05-19 17:31:57',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'pulkam@mob.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(157,1,'pulkam','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-05-20 12:48:04',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'pp@pp.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(158,1,'satya','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-05-20 12:59:48',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'ggg@gg.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(159,1,'159','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-05-20 14:32:50',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'s1@s.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(160,1,'test@test.com','22465bfa8893e81d57ca6a7fb3d93e41',0,0,NULL,'2010-05-20 14:39:11',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'test1@test.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(161,1,'161','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-05-21 10:53:51',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'p@pp.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(162,1,'162','22465bfa8893e81d57ca6a7fb3d93e41',0,0,NULL,'2010-05-21 10:55:40',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(163,1,'163','22465bfa8893e81d57ca6a7fb3d93e41',0,0,NULL,'2010-05-21 10:56:50',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(164,1,'164','22465bfa8893e81d57ca6a7fb3d93e41',0,0,NULL,'2010-05-21 12:07:08',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(165,1,'165','22465bfa8893e81d57ca6a7fb3d93e41',0,0,NULL,'2010-05-21 12:08:23',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(166,1,'166','22465bfa8893e81d57ca6a7fb3d93e41',0,0,NULL,'2010-05-21 12:14:27',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(167,1,'asd','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-05-21 12:19:21',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'bb@bb.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(168,1,'168','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-05-21 12:21:01',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'dd123@dd.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(169,1,'169','22465bfa8893e81d57ca6a7fb3d93e41',0,0,NULL,'2010-05-21 12:36:07',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(170,1,'170','22465bfa8893e81d57ca6a7fb3d93e41',0,0,NULL,'2010-05-21 12:38:37',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(171,1,'171','22465bfa8893e81d57ca6a7fb3d93e41',0,0,NULL,'2010-05-21 12:41:29',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(172,1,'172','22465bfa8893e81d57ca6a7fb3d93e41',0,0,NULL,'2010-05-21 12:41:57',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(173,1,'173','22465bfa8893e81d57ca6a7fb3d93e41',0,0,NULL,'2010-05-21 12:42:11',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(174,1,'174','22465bfa8893e81d57ca6a7fb3d93e41',0,0,NULL,'2010-05-21 12:42:28',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(175,1,'175','22465bfa8893e81d57ca6a7fb3d93e41',0,0,NULL,'2010-05-21 12:42:56',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(176,1,'176','22465bfa8893e81d57ca6a7fb3d93e41',0,0,NULL,'2010-05-21 12:44:12',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(177,1,'177','22465bfa8893e81d57ca6a7fb3d93e41',0,0,NULL,'2010-05-21 12:47:00',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(178,1,'178','22465bfa8893e81d57ca6a7fb3d93e41',0,0,NULL,'2010-05-21 16:41:39',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(179,1,'179','22465bfa8893e81d57ca6a7fb3d93e41',0,0,NULL,'2010-05-21 16:45:26',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(180,1,'180','22465bfa8893e81d57ca6a7fb3d93e41',0,0,NULL,'2010-05-21 16:46:18',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(181,1,'181','22465bfa8893e81d57ca6a7fb3d93e41',0,0,NULL,'2010-05-21 16:46:34',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(182,1,'182','22465bfa8893e81d57ca6a7fb3d93e41',0,0,NULL,'2010-05-21 16:47:21',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(183,1,'183','22465bfa8893e81d57ca6a7fb3d93e41',0,0,NULL,'2010-05-21 16:47:25',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(184,1,'184','22465bfa8893e81d57ca6a7fb3d93e41',0,0,NULL,'2010-05-21 16:47:52',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(185,1,'pulkam','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-05-24 19:50:34',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'pulkam1@mob.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(186,1,'186','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-05-28 10:46:32',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'k1@mob.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(187,1,'187','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-05-28 11:09:36',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'ddd@d.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(188,1,'188','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-05-28 11:09:38',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'ddd@d.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(189,1,'','22465bfa8893e81d57ca6a7fb3d93e41',0,0,NULL,'2010-06-02 11:27:47',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(190,1,'sa','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-06-02 14:59:49',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'sat1@mob.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(191,1,'asdfg','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-06-02 15:17:14',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'sat112@mob.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(192,1,'ww','8735d625917cae27f24a4ea2575a4fdc',0,0,NULL,'2010-06-02 15:27:26',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'www@www.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(193,1,'Pulkam','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-06-02 17:01:30',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'sat111@mob.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(194,1,'asdasdasd','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-06-02 18:03:17',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'test@m.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(195,1,'ggggggggggggg','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-06-02 18:05:47',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'gg@gg.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(196,1,'erewr','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-06-02 18:10:16',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'ee@ee.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(197,1,'dsfsd','7874dceadcc0d0423aef32d14d8fd7ae',0,0,'2010-06-18 13:07:05','2010-06-18 13:06:19',NULL,3,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'a@a.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(198,1,'Rakesh profile','7874dceadcc0d0423aef32d14d8fd7ae',0,0,'2010-06-18 13:40:58','2010-06-18 13:40:36',NULL,17,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'b@b.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,4,NULL),(199,1,'endeavour','ba3241797209b44fb851906fe0963d93',0,0,NULL,'2010-06-18 14:58:42',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'e@e.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(200,1,'IBM','5dadf5ae61831f61acdb31dc1c712eb0',0,0,NULL,'2010-06-18 15:00:45',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'i@i.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(201,1,'Employer16','116d607d1354e05c3ae296d45b439e01',0,0,NULL,'2010-06-18 06:17:15',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'employer16@techendeavour.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(202,1,'JasonsProfile','1f0e25929eac428f72cef6af7d7a056d',0,0,'2010-06-18 17:22:49','2010-06-18 17:21:40',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'jjoseph@keystreams.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(203,1,'pulkam','e14bd6ed13e908495ab52be3648fa2b0',0,0,'2010-06-21 22:47:58','2010-06-21 22:18:09',NULL,7,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'emp@mob.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,5,NULL),(204,1,'204','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-06-21 22:37:21',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'emp@mob.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(205,NULL,'admin','admin',0,0,NULL,NULL,NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(206,1,'206','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-06-24 02:50:10',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'forum@mob.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(207,1,'207','2e28987855a79bd5c2225db901c39965',0,0,NULL,'2010-06-24 02:57:36',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'admin@mob.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(208,1,'endeavour1','7874dceadcc0d0423aef32d14d8fd7ae',0,0,NULL,'2010-07-09 03:20:43',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'e1@e1.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(209,1,'asd','7874dceadcc0d0423aef32d14d8fd7ae',0,0,'2010-07-09 03:25:19','2010-07-09 03:24:58',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'s@s.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(210,1,'e3','7874dceadcc0d0423aef32d14d8fd7ae',0,0,NULL,'2010-07-09 04:11:08',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'e3@e3.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(211,1,'aq','7874dceadcc0d0423aef32d14d8fd7ae',0,0,'2010-07-09 04:56:37','2010-07-09 04:56:11',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'aq@aq.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(212,1,'eq','7874dceadcc0d0423aef32d14d8fd7ae',0,0,NULL,'2010-07-09 05:08:40',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'eq@eq.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(213,1,'sunitha.s profile','7874dceadcc0d0423aef32d14d8fd7ae',0,0,'2010-07-14 00:09:57','2010-07-14 00:09:16',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'sunitha.s@techendeavour.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(214,1,'qq','7874dceadcc0d0423aef32d14d8fd7ae',0,0,'2010-07-14 00:12:52','2010-07-14 00:12:20',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'suresh.siddi@techendeavour.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(215,1,'te','7874dceadcc0d0423aef32d14d8fd7ae',0,0,NULL,'2010-07-15 02:38:25',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'te@te.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(216,1,'IBM','7874dceadcc0d0423aef32d14d8fd7ae',0,0,NULL,'2010-07-15 02:53:33',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'ibm@ibm.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(217,1,'Project Manager','ec72d3f1b16991e81cd0ceefe2900834',0,0,'2010-08-02 16:06:06','2010-08-02 16:03:02',NULL,5,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'chammond99@yahoo.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(218,1,'218','1f0e25929eac428f72cef6af7d7a056d',0,0,NULL,'2010-08-06 23:00:48',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'joseph@keystreams.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(219,1,'OPENLANE','7d54f92acb92612d4e171016279c0d0f',0,0,NULL,'2010-08-10 17:38:33',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'clark@openlane.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(220,1,'VIPbooker','1f0e25929eac428f72cef6af7d7a056d',0,0,NULL,'2010-08-18 00:50:52',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'jason@vipbooker.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(221,1,'asdf','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-08-19 22:21:39',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'test@emplr.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(222,1,'emplr@m.com','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-08-22 23:43:12',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'emplr@m.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(223,1,'aug25@mob.com','e14bd6ed13e908495ab52be3648fa2b0',0,0,'2010-08-24 23:28:02','2010-08-24 23:27:39',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'aug25@mob.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(224,1,'House Music','3aef328979da230cea420aa8dd36c590',0,0,'2010-09-03 15:41:33','2010-09-03 15:40:35',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'rfowler14@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(225,1,'JasonsProf','1f0e25929eac428f72cef6af7d7a056d',0,0,'2010-09-05 07:00:49','2010-09-05 06:56:43',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'jjoseph@myownbriefcase.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(226,1,'226','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-09-08 22:57:13',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'vikram.report@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(227,1,'Java','055fb0f5f0b370cd5f0cb262edeec9be',0,0,'2010-09-10 08:03:08','2010-09-10 08:02:08',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'jerrykurian@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(228,1,'L - Photography','1f786f2bd9e656f69b9d5bfd261b45dc',0,0,'2010-09-24 15:06:52','2010-09-24 14:43:05',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'sales@hapahaolistore.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(229,1,'TARR INC.','0c109347e293b86040f638816a9e5c8c',0,0,NULL,'2010-09-24 17:24:55',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'rfowlerm3@yahoo.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(230,1,'TARR INC.','0c109347e293b86040f638816a9e5c8c',0,0,NULL,'2010-09-24 17:24:57',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'rfowlerm3@yahoo.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(231,1,'satya','64d6515bda1cd4e330b533546bfd9de9',0,0,NULL,'2010-09-27 01:17:54',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'satya@mob.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(232,1,'sa','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-09-27 02:19:20',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'satya1@mob.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(233,1,'sddsfsd','e14bd6ed13e908495ab52be3648fa2b0',0,0,'2010-09-27 03:31:04','2010-09-27 03:30:41',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'sa@m.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(234,1,'satyaTest','3aef328979da230cea420aa8dd36c590',0,0,'2010-10-04 15:14:13','2010-10-04 14:57:06',NULL,1,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'ross.fowler30@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(235,1,'RJ Model Ships','0c109347e293b86040f638816a9e5c8c',0,0,NULL,'2010-11-07 14:32:53',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'sales@rjmodelships.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(236,1,'asdf','7874dceadcc0d0423aef32d14d8fd7ae',0,0,NULL,'2010-11-23 01:46:57',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'asdf@a.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(237,1,'sat','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-11-23 02:17:43',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'sat@a.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(238,1,'test1','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-11-24 03:49:13',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'test1@m.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(239,1,'as','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-11-24 05:28:57',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'test2@m.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(240,1,'zz','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-11-24 20:02:52',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'zz@zz.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(241,1,'saty','e14bd6ed13e908495ab52be3648fa2b0',0,0,'2010-11-25 02:32:50','2010-11-25 02:29:07',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'satyanarayana.pulkam@techendeavour.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(242,1,'satya','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-11-25 03:13:16',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'satyam.pulkam@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(243,1,'satya','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-11-25 03:26:44',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'pulkam.satyam@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(244,1,'saty','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-11-25 05:29:39',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'satyanarayana.pulkam@techendeavour.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(245,1,'ggg','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-12-01 04:04:09',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'gsscharan@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(246,1,'satya','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-12-03 04:37:36',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'satya@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(247,1,'satya','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-12-06 22:42:00',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'pulkam@mob.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(248,1,'pulkam1@mob.com','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2010-12-06 23:25:06',NULL,1,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'pulkam1@mob.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(249,1,'test','7874dceadcc0d0423aef32d14d8fd7ae',0,0,'2010-12-09 02:46:09','2010-12-09 02:45:59',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'aa@a.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(250,1,'test','7874dceadcc0d0423aef32d14d8fd7ae',0,0,'2010-12-09 03:28:11','2010-12-09 03:27:51',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'aaa@a.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(251,1,'test','e14bd6ed13e908495ab52be3648fa2b0',0,0,'2010-12-09 04:08:09','2010-12-09 04:08:00',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'aaaa@a.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(252,1,'ggg','e14bd6ed13e908495ab52be3648fa2b0',0,0,'2010-12-09 04:20:50','2010-12-09 04:20:40',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'bb@b.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(253,1,'JasonRoozt','1f0e25929eac428f72cef6af7d7a056d',0,0,'2010-12-09 08:24:49','2010-12-09 08:24:13',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'jason@roozt.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(254,1,'Testing','e14bd6ed13e908495ab52be3648fa2b0',0,0,'2010-12-10 01:27:11','2010-12-10 01:27:01',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'qq@q.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(255,1,'asd','c27a75c3a0058247c87f0a8972c67b11',0,0,NULL,'2010-12-10 02:09:08',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'qqq@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(256,1,'TARR INC','537067dc23c001a99660469e1c1a4258',0,0,NULL,'2010-12-12 17:19:42',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'rfowlerm3@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(257,1,'MoBJason','1f0e25929eac428f72cef6af7d7a056d',0,0,'2010-12-15 09:17:37','2010-12-15 09:17:10',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'jason@myownbriefcase.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(258,1,'Java','368ff4f31287bd2ad1f795f9cb4ea3f7',0,0,'2010-12-15 09:25:58','2010-12-15 09:24:50',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'jerrykurian@yahoo.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(259,1,'Jus Inc','368ff4f31287bd2ad1f795f9cb4ea3f7',0,0,NULL,'2010-12-15 09:38:24',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'admin@jus.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(260,1,'Music','368ff4f31287bd2ad1f795f9cb4ea3f7',0,0,'2010-12-15 09:41:03','2010-12-15 09:40:36',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'resume@te.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(261,1,'end','e14bd6ed13e908495ab52be3648fa2b0',0,0,NULL,'2011-01-10 04:17:35',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'end@mob.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(262,1,'Software Engineer ( Java Apps)','490dc070db269d72f7fad938582564a6',0,0,'2011-01-13 00:14:08','2011-01-13 00:13:03',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'anji.swe@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(263,1,'pppp','6975d6db088ccbf5cd363fe8748c4541',0,0,'2011-01-28 01:32:05','2011-01-28 01:31:52',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'pp@pp.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(264,1,'Programmer','368ff4f31287bd2ad1f795f9cb4ea3f7',0,0,'2011-02-09 10:37:27','2011-02-09 10:36:27',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'gopaln@test.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(265,1,'Spring Developer','368ff4f31287bd2ad1f795f9cb4ea3f7',0,0,'2011-03-18 00:02:55','2011-03-18 00:02:20',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'rachel@test.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(266,1,'John','6d642a4733526e02b089919349adec54',0,0,'2011-04-13 18:03:04','2011-04-13 18:00:21',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'john@decisionlink.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL),(267,1,'DecisionLink','6d642a4733526e02b089919349adec54',0,0,NULL,'2011-04-13 18:13:38',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'jr@decisionlink.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `jforum_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_vote_desc`
--

DROP TABLE IF EXISTS `jforum_vote_desc`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_vote_desc` (
  `vote_id` int(11) NOT NULL auto_increment,
  `topic_id` int(11) NOT NULL default '0',
  `vote_text` varchar(255) NOT NULL default '',
  `vote_start` datetime NOT NULL,
  `vote_length` int(11) NOT NULL default '0',
  PRIMARY KEY  (`vote_id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_vote_desc`
--

LOCK TABLES `jforum_vote_desc` WRITE;
/*!40000 ALTER TABLE `jforum_vote_desc` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_vote_desc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_vote_results`
--

DROP TABLE IF EXISTS `jforum_vote_results`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_vote_results` (
  `vote_id` int(11) NOT NULL default '0',
  `vote_option_id` tinyint(4) NOT NULL default '0',
  `vote_option_text` varchar(255) NOT NULL default '',
  `vote_result` int(11) NOT NULL default '0',
  KEY `vote_id` (`vote_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_vote_results`
--

LOCK TABLES `jforum_vote_results` WRITE;
/*!40000 ALTER TABLE `jforum_vote_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_vote_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_vote_voters`
--

DROP TABLE IF EXISTS `jforum_vote_voters`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_vote_voters` (
  `vote_id` int(11) NOT NULL default '0',
  `vote_user_id` int(11) NOT NULL default '0',
  `vote_user_ip` varchar(15) NOT NULL default '',
  KEY `vote_id` (`vote_id`),
  KEY `vote_user_id` (`vote_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_vote_voters`
--

LOCK TABLES `jforum_vote_voters` WRITE;
/*!40000 ALTER TABLE `jforum_vote_voters` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_vote_voters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_words`
--

DROP TABLE IF EXISTS `jforum_words`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_words` (
  `word_id` int(11) NOT NULL auto_increment,
  `word` varchar(100) NOT NULL default '',
  `replacement` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`word_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_words`
--

LOCK TABLES `jforum_words` WRITE;
/*!40000 ALTER TABLE `jforum_words` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_words` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobtype`
--

DROP TABLE IF EXISTS `jobtype`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jobtype` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `jobtypename` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jobtype`
--

LOCK TABLES `jobtype` WRITE;
/*!40000 ALTER TABLE `jobtype` DISABLE KEYS */;
INSERT INTO `jobtype` VALUES (1,'PERMANENT'),(2,'CONTRACT');
/*!40000 ALTER TABLE `jobtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobtype_opportunity`
--

DROP TABLE IF EXISTS `jobtype_opportunity`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jobtype_opportunity` (
  `id` bigint(20) NOT NULL auto_increment,
  `jobtypename` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jobtype_opportunity`
--

LOCK TABLES `jobtype_opportunity` WRITE;
/*!40000 ALTER TABLE `jobtype_opportunity` DISABLE KEYS */;
INSERT INTO `jobtype_opportunity` VALUES (1,'Hourly'),(2,'Salary'),(3,'Contract');
/*!40000 ALTER TABLE `jobtype_opportunity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `level`
--

DROP TABLE IF EXISTS `level`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `level` (
  `id` bigint(20) NOT NULL auto_increment,
  `skill_level` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `level`
--

LOCK TABLES `level` WRITE;
/*!40000 ALTER TABLE `level` DISABLE KEYS */;
/*!40000 ALTER TABLE `level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_reciever`
--

DROP TABLE IF EXISTS `message_reciever`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `message_reciever` (
  `sentbox_id` bigint(20) NOT NULL,
  `reciever_id` bigint(20) NOT NULL,
  PRIMARY KEY  (`sentbox_id`,`reciever_id`),
  KEY `fk_sentbox_has_user_sentbox` (`sentbox_id`),
  KEY `fk_sentbox_has_user_user` (`reciever_id`),
  CONSTRAINT `fk_sentbox_has_user_sentbox` FOREIGN KEY (`sentbox_id`) REFERENCES `sentbox` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sentbox_has_user_user` FOREIGN KEY (`reciever_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `message_reciever`
--

LOCK TABLES `message_reciever` WRITE;
/*!40000 ALTER TABLE `message_reciever` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_reciever` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mobgroup`
--

DROP TABLE IF EXISTS `mobgroup`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mobgroup` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(45) default NULL,
  `grouptype` varchar(45) NOT NULL,
  `description` text,
  `icon` varchar(500) default NULL,
  `createddate` datetime default NULL,
  `profile_id` bigint(20) NOT NULL,
  `resizedpicture` varchar(256) default NULL,
  `flagged` tinyint(4) default '0',
  `flagdelete` tinyint(4) default '0',
  PRIMARY KEY  (`id`),
  KEY `fk_mobgroup_profile_id` USING BTREE (`profile_id`),
  CONSTRAINT `fk_mobgroup_profile_id` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mobgroup`
--

LOCK TABLES `mobgroup` WRITE;
/*!40000 ALTER TABLE `mobgroup` DISABLE KEYS */;
INSERT INTO `mobgroup` VALUES (1,'group','Public','dsfsdfsdf','/profile/group/max_1/Forest Flowers.jpg','2010-06-18 06:20:39',517,NULL,1,0),(2,'asdf','Public','asdasdasd','/profile/group/max_2/choose.jpg','2010-06-23 00:32:34',519,NULL,0,0),(4,'g1','Public','g1','DSC00116_4.JPG','2010-07-09 02:37:08',513,'mid_DSC00116_4.JPG',0,0),(6,'g1','Public','ge','Dock_6.jpg','2010-07-09 03:19:18',515,'mid_Dock_6.jpg',0,0),(7,'g1','Public','','Forest Flowers_7.jpg','2010-07-09 03:25:57',521,'mid_Forest Flowers_7.jpg',0,0),(8,'g2','Public','g','Tree_8.jpg','2010-07-09 04:11:44',522,'mid_Tree_8.jpg',0,0),(9,'aq','Public','aq','Forest Flowers_9.jpg','2010-07-09 05:03:09',523,'mid_Forest Flowers_9.jpg',0,0),(11,'eq','Public','eq','Creek_11.jpg','2010-07-09 05:09:58',524,'mid_Creek_11.jpg',0,0),(13,'LA Drummers','Public','Do you love drumming? Do you live in LA? Now is the time to expand your network and meet other drummers!','drum-pic_13.jpg','2010-07-21 08:48:08',518,'mid_drum-pic_13.jpg',0,0),(14,'asdasd','Public','asdasda','Sbicard_14.jpg','2010-07-21 23:27:19',513,'mid_Sbicard_14.jpg',0,0),(19,'Satya','Public','hi','Toco Toucan_19.jpg','2010-07-22 00:24:24',513,'mid_Toco Toucan_19.jpg',0,0),(20,'Satya','Public','satya satya satya satya satya satya satya satya satya satya satya satya satya satya satya satya satya satya ','Forest_20.jpg','2010-07-22 02:59:10',514,'mid_Forest_20.jpg',0,0),(23,'bbbbbb','Public','bbbbbbbbbbbbbb  bbbbbbbbbbbbbbbbbbbbbbb bbbbbbbbbb','Dock_23.jpg','2010-07-22 03:02:16',514,'mid_Dock_23.jpg',0,0),(24,'test12','Public','sat sat\r\n \r\nsat\r\nsat\r\nsat\r\nsat\r\nsat\r\nsatsatsat\r\n\r\nsat\r\nsat\r\n\r\nsat\r\nsat\r\nsat\r\nsat\r\n\r\n\r\n','Dock_24.jpg','2010-07-22 03:29:51',514,'mid_Dock_24.jpg',0,0),(29,'Deadmau5','Public','Enjoy the Electro House Sensation!','deadmau5_29.jpg','2010-10-26 18:33:26',563,'mid_deadmau5_29.jpg',0,0),(30,'ee','Public','eee','Garden_30.jpg','2010-12-02 22:36:25',563,'mid_Garden_30.jpg',0,0),(31,'Satya','Public','satya','Garden_31.jpg','2010-12-03 03:23:07',533,'mid_Garden_31.jpg',0,0),(32,'Java Users Group','Public','For all Java junkies','Penguins_32.jpg','2011-03-03 04:11:52',533,'mid_Penguins_32.jpg',0,0),(33,'Johns Group','Private','',NULL,'2011-04-13 18:08:06',600,NULL,0,0);
/*!40000 ALTER TABLE `mobgroup` ENABLE KEYS */;
UNLOCK TABLES;

/*!50003 SET @SAVE_SQL_MODE=@@SQL_MODE*/;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_VALUE_ON_ZERO" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`mob`@`localhost` */ /*!50003 TRIGGER `group_location_insert` AFTER INSERT ON `mobgroup` FOR EACH ROW BEGIN
		DECLARE keyrows INTEGER;
		DECLARE city VARCHAR(250);

		SELECT u.city INTO city FROM mobgroup g, profile p, user u WHERE g.id=NEW.id and p.id=g.profile_id and p.user_id=u.id;

		IF city != '' THEN
			SELECT count(*) INTO keyrows FROM itemcount i WHERE i.searchTerm like city  and i.itemType=7;

			IF keyrows>0 THEN
				UPDATE itemcount i SET i.count=i.count+1 WHERE  i.searchTerm like city and i.itemType=7;
			ELSE
				INSERT INTO itemcount (itemType, searchTerm, count) VALUES (7,city,1);
			END IF;
		END IF;
	END */;;

/*!50003 SET SESSION SQL_MODE="NO_AUTO_VALUE_ON_ZERO" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`mob`@`localhost` */ /*!50003 TRIGGER `group_location_update` AFTER UPDATE ON `mobgroup` FOR EACH ROW BEGIN
		DECLARE keyrows INTEGER;
		DECLARE city VARCHAR(250);
		DECLARE oldcity VARCHAR(250);

		IF NEW.profile_id!=OLD.profile_id THEN

			SELECT u.city INTO oldcity FROM mobgroup g, profile p, user u WHERE g.id=OLD.id and p.id=g.profile_id and p.user_id=u.id;

			IF city != '' THEN
				SELECT count(*) INTO keyrows FROM itemcount i WHERE i.searchTerm like city  and i.itemType=7;
				UPDATE itemcount i SET i.count=i.count-1 WHERE  i.searchTerm like oldcity and i.itemType=7;

				SELECT u.city INTO city FROM mobgroup g, profile p, user u WHERE g.id=NEW.id and p.id=g.profile_id and p.user_id=u.id;
				IF keyrows>0 THEN
					UPDATE itemcount i SET i.count=i.count+1 WHERE  i.searchTerm like city and i.itemType=7;
				ELSE
					INSERT INTO itemcount (itemType, searchTerm, count) VALUES (7,city,1);
				END IF;
			END IF;
		END IF;
	END */;;

/*!50003 SET SESSION SQL_MODE="NO_AUTO_VALUE_ON_ZERO" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`mob`@`localhost` */ /*!50003 TRIGGER `group_location_delete` AFTER DELETE ON `mobgroup` FOR EACH ROW BEGIN
		DECLARE oldcity VARCHAR(250);

		SELECT u.city INTO oldcity FROM mobgroup g, profile p, user u WHERE g.id=OLD.id and p.id=g.profile_id and p.user_id=u.id;
		UPDATE itemcount i SET i.count=i.count-1 WHERE  i.searchTerm like oldcity and i.itemType=7;
	END */;;

DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@SAVE_SQL_MODE*/;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `news` (
  `id` bigint(20) NOT NULL auto_increment,
  `news` varchar(250) default NULL,
  `news_owner_id` bigint(20) NOT NULL,
  `createddate` date default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_news_user` (`news_owner_id`),
  CONSTRAINT `fk_news_user` FOREIGN KEY (`news_owner_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,'Jason has viewed your profile JasonsProfile',202,'2010-06-23'),(2,'Jason has viewed your profile JasonsProfile',202,'2010-06-23'),(3,'Jason has viewed your profile JasonsProfile',202,'2010-06-25'),(4,'Jason has viewed your profile JasonsProfile',202,'2010-07-14'),(5,'suresh has viewed your profile sunitha.s profile',213,'2010-07-14'),(6,'sunitha has viewed your profile asd',209,'2010-07-14'),(7,'sunitha has viewed your profile qq',214,'2010-07-14'),(8,'sunitha has viewed your profile JasonsProfile',202,'2010-07-14'),(9,'sunitha has viewed your profile JasonsProfile',202,'2010-07-14'),(10,'Jason has viewed your profile JasonsProfile',202,'2010-07-14'),(11,'Jason has viewed your profile JasonsProfile',202,'2010-07-14'),(12,'Jason has viewed your profile JasonsProfile',202,'2010-07-14'),(13,'sunitha has viewed your profile JasonsProfile',202,'2010-07-14'),(14,'suresh has viewed your profile sunitha.s profile',213,'2010-07-14'),(15,'employee has viewed your profile JasonsProfile',202,'2010-07-14'),(16,'suresh has viewed your profile sunitha.s profile',213,'2010-07-14'),(17,'sunitha has viewed your profile qq',214,'2010-07-14'),(18,'suresh has viewed your profile sunitha.s profile',213,'2010-07-14'),(19,'endeavour has viewed your profile sunitha.s profile',213,'2010-07-15'),(20,'sunitha has viewed your profile suni profile',197,'2010-07-19'),(21,'sunitha has viewed your profile qq',214,'2010-07-19'),(22,'bb has viewed your profile qq',214,'2010-07-19'),(23,'Rakesh has viewed your profile suni profile',197,'2010-07-23'),(24,'Rakesh has viewed your profile suni profile',197,'2010-07-23'),(25,'Rakesh has viewed your profile suni profile',197,'2010-07-23'),(26,'sunitha has viewed your profile suni profile',197,'2010-07-25'),(27,'sunitha has viewed your profile Rakesh profile',198,'2010-07-25'),(28,'sunitha has viewed your profile Rakesh profile',198,'2010-07-25'),(29,'employee has viewed your profile Rakesh profile',198,'2010-07-26'),(30,'employee has viewed your profile Rakesh profile',198,'2010-07-26'),(31,'employee has viewed your profile Rakesh profile',198,'2010-07-26'),(32,'employee has viewed your profile Rakesh profile',198,'2010-07-26'),(33,'employee has viewed your profile Rakesh profile',198,'2010-07-26'),(34,'sunitha has viewed your profile suni profile',197,'2010-07-26'),(35,'Rakesh profile has applied for the opportunity trytrytr',222,'2010-08-23'),(36,'Ross has viewed your profile JasonsProf',225,'2010-10-26'),(37,'Ross has viewed your profile JasonsProfile',202,'2010-10-26'),(38,'Ross has viewed your profile JasonsProfile',202,'2010-10-26'),(39,'Ross has viewed your profile JasonsProf',225,'2010-10-26'),(40,'Ross has viewed your profile Rakesh profile',198,'2010-10-26'),(41,'Ross has viewed your profile Rakesh profile',198,'2010-10-26'),(42,'Ross has viewed your profile DJ r3gan',234,'2010-10-27'),(43,'Ross has viewed your profile House Music',224,'2010-10-27'),(44,'Ross has viewed your profile House Music',224,'2010-10-27'),(45,'Ross has viewed your profile DJ r3gan',234,'2010-10-27'),(46,'Ross has viewed your profile DJ r3gan',234,'2010-10-27'),(47,'Ross has viewed your profile DJ r3gan',234,'2010-10-27'),(48,'Ross has viewed your profile House Music',224,'2010-10-27'),(49,'Jason has viewed your profile DJ r3gan',234,'2010-11-07'),(50,'RJ Model Ships has viewed your profile House Music',224,'2010-11-07'),(51,'Jason has viewed your profile House Music',224,'2010-11-07'),(52,'RJ Model Ships has viewed your profile DJ r3gan',234,'2010-11-07'),(53,'Jason has viewed your profile DJ r3gan',234,'2010-11-07'),(54,'Jason has viewed your profile JasonsProfile',202,'2010-11-10'),(55,'Jason has viewed your profile DJ r3gan',234,'2010-11-18'),(56,'sunitha has viewed your profile DJ r3gan',234,'2010-11-18'),(57,'sunitha has viewed your profile DJ r3gan',234,'2010-11-18'),(58,'sunitha has viewed your profile DJ r3gan',234,'2010-11-18'),(59,'sunitha has viewed your profile Experienced Car Buyer',217,'2010-11-18'),(60,'Jason has viewed your profile DJ r3gan',234,'2010-11-18'),(61,'emplr@m.com has viewed your profile asd',209,'2010-11-23'),(62,'Ross has viewed your profile dfg',198,'2010-11-25'),(63,'Ross has viewed your profile dfg',198,'2010-11-25'),(64,'Ross has sent you a message',202,'2010-12-08'),(65,'Jason has viewed your profile Jason',234,'2010-12-13'),(66,'Jason has viewed your profile JasonRoozt',253,'2010-12-13'),(67,'Jason has viewed your profile JasonRoozt',253,'2010-12-13'),(68,'Jason has viewed your profile JasonsProf',225,'2010-12-13'),(69,'suresh has viewed your profile sunitha.s profile',213,'2010-12-17'),(70,'suresh has viewed your profile sunitha.s profile',213,'2010-12-17'),(71,'Jus Inc has viewed your profile Java Jerry',258,'2010-12-19'),(72,'suresh has viewed your profile asd',209,'2010-12-19'),(73,'suresh profile has marked as favorite the opportunity Administrative Assistant',219,'2011-01-11'),(74,'suresh has sent you a message',219,'2011-01-11'),(75,'suresh profile has applied for the opportunity Administrative Assistant',219,'2011-01-11'),(76,'suresh has sent you a message',219,'2011-01-11'),(77,'suresh profile has marked as favorite the opportunity Administrative Assistant',219,'2011-01-11'),(78,'suresh has sent you a message',219,'2011-01-11'),(79,'suresh profile has applied for the opportunity asdasdasd',222,'2011-01-11'),(80,'suresh has sent you a message',222,'2011-01-11'),(81,'suresh profile has marked as favorite the opportunity asdasdasd',222,'2011-01-11'),(82,'suresh has sent you a message',222,'2011-01-11'),(83,'suresh has viewed your profile aaaaaaaa',197,'2011-01-12'),(84,'VIPbooker has marked as favorite the opportunity C++ Developer',220,'2011-03-01'),(85,'TARR INC has viewed your profile DJ r3gan',234,'2011-03-02'),(86,'TARR INC has viewed your profile dfg',198,'2011-03-09'),(87,'TARR INC has viewed your profile dfg',198,'2011-03-09'),(88,'TARR INC has viewed your profile aaaaaaaa',197,'2011-03-09'),(89,'TARR INC has viewed your profile House Music',224,'2011-03-09'),(90,'TARR INC has viewed your profile House Music',224,'2011-03-09'),(91,'VIPbooker has viewed your profile DJ r3gan',234,'2011-03-09'),(92,'VIPbooker has viewed your profile aaaaaaaa',197,'2011-03-10'),(93,'VIPbooker has viewed your profile asd',209,'2011-03-10'),(94,'VIPbooker has viewed your profile asd',209,'2011-03-10'),(95,'VIPbooker has viewed your profile asd',209,'2011-03-10'),(96,'VIPbooker has viewed your profile aaaaaaaa',197,'2011-03-17'),(97,'VIPbooker has viewed your profile endeavour',199,'2011-03-17'),(98,'VIPbooker has viewed your profile endeavour',199,'2011-03-18'),(99,'TARR INC has viewed your profile House Music',224,'2011-03-21');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `notification` (
  `id` bigint(20) NOT NULL auto_increment,
  `user_id` bigint(20) default NULL,
  `notificationdate` datetime NOT NULL,
  `validdate` datetime default NULL,
  `notificationtype_id` bigint(20) NOT NULL,
  `notificationitem_id` bigint(20) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_notification_user` (`user_id`),
  KEY `fk_notification_notificationtype` (`notificationtype_id`),
  CONSTRAINT `fk_notification_notificationtype` FOREIGN KEY (`notificationtype_id`) REFERENCES `notificationtype` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_notification_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificationtype`
--

DROP TABLE IF EXISTS `notificationtype`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `notificationtype` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `notificationtype`
--

LOCK TABLES `notificationtype` WRITE;
/*!40000 ALTER TABLE `notificationtype` DISABLE KEYS */;
/*!40000 ALTER TABLE `notificationtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `occupation`
--

DROP TABLE IF EXISTS `occupation`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `occupation` (
  `id` bigint(20) NOT NULL default '0',
  `occupationname` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `occupation`
--

LOCK TABLES `occupation` WRITE;
/*!40000 ALTER TABLE `occupation` DISABLE KEYS */;
INSERT INTO `occupation` VALUES (1,'Accounting'),(2,'software'),(3,'Tester');
/*!40000 ALTER TABLE `occupation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opportunity`
--

DROP TABLE IF EXISTS `opportunity`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `opportunity` (
  `id` bigint(20) NOT NULL auto_increment,
  `job_name` varchar(45) default NULL,
  `position_title` varchar(250) default NULL,
  `start_date` datetime default NULL,
  `location` varchar(50) default NULL,
  `category_id` bigint(20) default NULL,
  `employer_profileid` bigint(20) NOT NULL,
  `type_of_work` varchar(45) default NULL,
  `education_requirment` varchar(45) default NULL,
  `salary_range` varchar(45) default NULL,
  `benefits` varchar(200) default NULL,
  `working_hours` varchar(45) default NULL,
  `employer_jobType` varchar(45) default NULL,
  `employer_skill` varchar(45) default NULL,
  `no_of_years` varchar(45) default NULL,
  `job_application_criteria` varchar(250) default NULL,
  `description` varchar(500) default NULL,
  `skillNeeded` varchar(45) default NULL,
  `interestcount` bigint(20) default '0',
  `bookmarkcount` bigint(20) default '0',
  `viewoppcount` bigint(45) default '0',
  `contactperson` varchar(45) default NULL,
  `category` varchar(45) default NULL,
  `notes` varchar(100) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_opportunity_category` (`category_id`),
  KEY `fk_employer_profileid` (`employer_profileid`),
  CONSTRAINT `fk_employer_profileid` FOREIGN KEY (`employer_profileid`) REFERENCES `employerprofile` (`profile_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_opportunity_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `opportunity`
--

LOCK TABLES `opportunity` WRITE;
/*!40000 ALTER TABLE `opportunity` DISABLE KEYS */;
INSERT INTO `opportunity` VALUES (1,'Job1','dfgfdg','2010-06-18 00:00:00',NULL,NULL,517,NULL,'dfgdfg','1','','','1',NULL,'0','','fdgdfgdfgdfg',NULL,0,0,0,'',NULL,NULL),(2,'Administrative Assistant','Administrative Assistant','2010-08-10 00:00:00',NULL,NULL,532,NULL,'','75k-100k','None!','9-5','Salary',NULL,'0','Must be pretty. ','Hey now!',NULL,1,2,4,'Clark Hammond',NULL,NULL),(3,'Car Washer','Auto Detailer','2010-08-10 00:00:00',NULL,NULL,532,NULL,'','Under 30k','None.','On Demand','Hourly',NULL,'0','Must be able to drive a car with a manual transmission.','Wash, wax, detail my beautiful cars.',NULL,0,0,1,'Clark Hammond',NULL,NULL),(4,'sfsdf','sdfsdfsdfsdfsd','2010-08-19 00:00:00',NULL,NULL,534,NULL,'BHM','40k-50k','sdfsdf','sdfsd','Salary',NULL,'0','fsdfsdfsdd','sdfsdfsd','Corel Draw',0,0,0,'sdfsdfs',NULL,NULL),(5,'trytry','trytrytr','2010-08-22 00:00:00',NULL,NULL,535,NULL,'1','1','trytr','rtytry','Salary',NULL,'0','ytrytry','ytrytr','CNC Machine Composite',1,0,2,NULL,NULL,NULL),(6,'http://www.emuvr3.com/index.php?show_aux_page','asdasdasd','2010-08-26 00:00:00',NULL,NULL,535,NULL,'B.Com','75k-100k','http://www.emuvr3.com/index.php?show_aux_page=10',NULL,'Salary',NULL,'0','http://www.emuvr3.com/index.php?show_aux_page=10','http://www.emuvr3.com/index.php?show_aux_page=10',NULL,1,1,2,NULL,NULL,NULL),(7,'C++ Developer','C++ Developer','2010-08-24 00:00:00',NULL,NULL,533,NULL,'BCA','75k-100k','Pretty awesome pay and amazing benefits!',NULL,'Salary',NULL,'0','Please send us your resume','Love what you do and code all day','C++',0,1,16,NULL,NULL,NULL),(8,'','','2010-08-26 00:00:00',NULL,NULL,535,NULL,'1','1','','1','1',NULL,'0','','','Brake Alignments,C++ Programming',0,0,0,NULL,NULL,NULL),(9,'ddf','','2010-11-25 00:00:00',NULL,NULL,573,NULL,'B.Com','1','sdfsdfsdf',NULL,'1',NULL,'0','','sdfsdfs','ssss',0,0,0,NULL,NULL,NULL),(10,'','','2010-12-09 00:00:00',NULL,NULL,573,NULL,'1','1','','1','1',NULL,'0','','','Java and j2ee,Cooking',0,0,0,NULL,NULL,NULL),(11,'e','rwerwer','2011-01-11 00:00:00',NULL,NULL,594,NULL,'BCA','1','wer','Mon-Fri (Night)','Salary',NULL,'0','wrwe','werwer',NULL,0,0,0,NULL,NULL,NULL),(12,'Handiman','GM','2011-02-09 00:00:00',NULL,NULL,533,NULL,'BDS','30k-40k','',NULL,'Hourly',NULL,'0','','Good one','Brake',0,0,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `opportunity` ENABLE KEYS */;
UNLOCK TABLES;

/*!50003 SET @SAVE_SQL_MODE=@@SQL_MODE*/;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_VALUE_ON_ZERO" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`mob`@`localhost` */ /*!50003 TRIGGER `opp_industryloc_delete` AFTER DELETE ON `opportunity` FOR EACH ROW BEGIN
		DECLARE keyrows INTEGER;
		DECLARE ind VARCHAR(250);
		DECLARE city VARCHAR(50);

		SELECT i.name INTO ind FROM opportunity o, employerprofile p, employer e, industry i WHERE o.id=OLD.id and o.employer_profileid=p.profile_id and p.user_id=e.user_id and e.industry_id=i.id;

		IF ind != '' THEN
			SELECT count(*) INTO keyrows FROM itemcount i WHERE i.searchTerm like ind  and i.itemType=9;

			IF keyrows>0 THEN
				UPDATE itemcount i SET i.count=i.count-1 WHERE  i.searchTerm like ind and i.itemType=9;
			END IF;
		END IF;

		SELECT u.city INTO city FROM opportunity o, employerprofile p, user u WHERE o.id=OLD.id and o.employer_profileid=p.profile_id and p.user_id=u.id;

		IF city != '' THEN
			SELECT count(*) INTO keyrows FROM itemcount i WHERE i.searchTerm like city  and i.itemType=10;

			IF keyrows>0 THEN
				UPDATE itemcount i SET i.count=i.count-1 WHERE  i.searchTerm like v and i.itemType=10;
			END IF;
		END IF;

		UPDATE itemcount i SET i.count=i.count-1 WHERE  i.searchTerm like  OLD.salary_range and i.itemType=11;

	END */;;

DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@SAVE_SQL_MODE*/;

--
-- Table structure for table `opportunity_skills`
--

DROP TABLE IF EXISTS `opportunity_skills`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `opportunity_skills` (
  `id` bigint(20) NOT NULL auto_increment,
  `skillNeeded` varchar(45) default NULL,
  `level` varchar(45) default NULL,
  `jobType` varchar(45) default NULL,
  `noOfYears` varchar(250) default NULL,
  `opportunity_id` bigint(20) default NULL,
  `category` varchar(45) default NULL,
  `notes` varchar(100) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_opportunity_id` (`opportunity_id`),
  CONSTRAINT `fk_opportunity_id` FOREIGN KEY (`opportunity_id`) REFERENCES `opportunity` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `opportunity_skills`
--

LOCK TABLES `opportunity_skills` WRITE;
/*!40000 ALTER TABLE `opportunity_skills` DISABLE KEYS */;
INSERT INTO `opportunity_skills` VALUES (4,'Corel Draw','Intermediate',NULL,'5',4,'fsdf','s'),(5,'CNC Machine Composite','Intermediate',NULL,'6',5,'rty','tytr'),(6,'C++','Expert',NULL,'5',7,NULL,NULL),(7,'Brake Alignments','Intermediate',NULL,'6',8,'as','sadsad asdas'),(8,'C++ Programming','Expert',NULL,'12',8,'asdsa','s'),(10,'ssss','Expert',NULL,'66',9,NULL,NULL),(11,'dfdfgf','Intermediate',NULL,'3',9,'dfgdfgd','dfgdfgd'),(12,'C++ Programming','Expert',NULL,'9',9,'sdfs','xzcxzc'),(13,'Java and j2ee','Expert',NULL,'6',10,'Java','satya'),(14,'Cooking','Mastered It!',NULL,'5',10,'HIIII','satya'),(16,'Brake','Expert',NULL,'10',12,NULL,NULL),(17,'Hammering','Beginner',NULL,'10',12,'HR','');
/*!40000 ALTER TABLE `opportunity_skills` ENABLE KEYS */;
UNLOCK TABLES;

/*!50003 SET @SAVE_SQL_MODE=@@SQL_MODE*/;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_VALUE_ON_ZERO" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`mob`@`localhost` */ /*!50003 TRIGGER `opp_industryloc_insert` AFTER INSERT ON `opportunity_skills` FOR EACH ROW BEGIN
		DECLARE keyrows INTEGER;
		SELECT count(*) INTO keyrows FROM itemcount i WHERE i.searchTerm like NEW.skillNeeded  and i.itemType=12;

		IF keyrows>0 THEN
			UPDATE itemcount i SET i.count=i.count+1 WHERE  i.searchTerm like  NEW.skillNeeded and i.itemType=12;
		ELSE
			INSERT INTO itemcount (itemType, searchTerm, count) VALUES (12, NEW.skillNeeded,1);
		END IF;
		
	END */;;

/*!50003 SET SESSION SQL_MODE="NO_AUTO_VALUE_ON_ZERO" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`mob`@`localhost` */ /*!50003 TRIGGER `opp_sal_update` AFTER UPDATE ON `opportunity_skills` FOR EACH ROW BEGIN
		DECLARE keyrows INTEGER;
		IF NEW.skillNeeded != OLD.skillNeeded THEN
			UPDATE itemcount i SET i.count=i.count-1 WHERE  i.searchTerm like  OLD.skillNeeded and i.itemType=12;

			SELECT count(*) INTO keyrows FROM itemcount i WHERE i.searchTerm like NEW.skillNeeded  and i.itemType=12;

			IF keyrows>0 THEN
				UPDATE itemcount i SET i.count=i.count+1 WHERE  i.searchTerm like  NEW.skillNeeded and i.itemType=12;
			ELSE
				INSERT INTO itemcount (itemType, searchTerm, count) VALUES (12, NEW.skillNeeded,1);
			END IF;
		END IF;		
	END */;;

/*!50003 SET SESSION SQL_MODE="NO_AUTO_VALUE_ON_ZERO" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`mob`@`localhost` */ /*!50003 TRIGGER `opp_sal_delete` AFTER DELETE ON `opportunity_skills` FOR EACH ROW BEGIN
		UPDATE itemcount i SET i.count=i.count-1 WHERE  i.searchTerm like  OLD.skillNeeded and i.itemType=12;
	END */;;

DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@SAVE_SQL_MODE*/;

--
-- Table structure for table `physicaltraits`
--

DROP TABLE IF EXISTS `physicaltraits`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `physicaltraits` (
  `id` bigint(20) NOT NULL auto_increment,
  `height` varchar(45) default NULL,
  `measurements` varchar(45) default NULL,
  `weight` int(11) default NULL,
  `shoesize` int(11) default NULL,
  `build` varchar(45) default NULL,
  `haircolor` varchar(45) default NULL,
  `eyecolor` varchar(45) default NULL,
  `breastcupsize` varchar(45) default NULL,
  `ethnicity` varchar(45) default NULL,
  `others` varchar(45) default NULL,
  `additionalnotes` varchar(200) default NULL,
  `profile_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_physicaltraits_profileid_1` (`profile_id`),
  CONSTRAINT `FK_physicaltraits_profileid_1` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `physicaltraits`
--

LOCK TABLES `physicaltraits` WRITE;
/*!40000 ALTER TABLE `physicaltraits` DISABLE KEYS */;
INSERT INTO `physicaltraits` VALUES (19,'12, 12','12, 12, 12',12,12,'Normal','','12',NULL,'Black','12','12122122121121212212112',513),(20,', ',', , ',0,0,NULL,'','',NULL,'Select','','',514),(21,'5, 10','32, 36, 32',165,10,'Thin','Black','Brown',NULL,'Asian','','',518),(22,', ',', , ',0,0,'Select','','',NULL,'Select','','',519),(23,', ',', , ',0,0,'Select','','',NULL,'Select','','',525),(24,', ',', , ',0,0,'Select','','',NULL,'Select','','',526),(25,', ',', , ',0,0,NULL,'','',NULL,'Select','','',530),(26,', ',', , ',0,0,'Select','','',NULL,'Select','','',531),(27,', ',', , ',0,0,'Select','','',NULL,'Select','','',536),(28,'5, 10',', , ',180,12,NULL,'Dark Brown','Brown',NULL,'Select','','',540),(29,', ',', , ',0,0,'Select','','',NULL,'Select','','',551),(30,', ',', , ',128,6,'1','Auburn','Brown',NULL,'1','Eurasian','',554),(31,'5, 5',', , ',128,0,'1','','Brown',NULL,'1','Eurasian','',555),(32,'23, 23','45, 45, 45',23,23,'Obese','red','bbb',NULL,'Black','bbb','red',559),(33,'12, 12','12, 12, 12',12,21,'Select','2','2',NULL,'Select','','222222222222222222222',569),(34,'12, 12','12, 12, 12',0,0,'Select','','',NULL,'Select','','',572),(35,'65, 65','65, 65, 65',65,65,'Thin','red','dfgdfg',NULL,'Other','dfgdfg','redfgdfgdfgdfgdfgfdgdfg dfg df',563),(36,', ',', , ',0,0,'Select','','',NULL,'Select','','',574),(37,', ',', , ',0,0,'Select','','',NULL,'Select','','',580),(38,', ',', , ',0,0,'Select','','',NULL,'Select','','',581),(39,', ',', , ',0,0,'Select','','',NULL,'Select','','',586),(40,', ',', , ',0,0,'Select','','',NULL,'Select','','',587),(41,', ',', , ',0,0,'1','','',NULL,'1','','',591),(42,'5, 5',', , ',0,0,'Select','','',NULL,'Select','','',593),(43,', ',', , ',0,0,'Select','','',NULL,'Select','','',595),(44,'5, 10',', , ',0,0,'Select','','',NULL,'Select','','',597),(45,'5, 11',', , ',215,11,'Obese','Brown','Brown',NULL,'White','','',600);
/*!40000 ALTER TABLE `physicaltraits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privacygroup`
--

DROP TABLE IF EXISTS `privacygroup`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `privacygroup` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(250) default NULL,
  `profile_id` bigint(20) default NULL,
  `createddate` date default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_privacygroup_user` USING BTREE (`profile_id`),
  CONSTRAINT `fk_privacygroup_user` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4592 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `privacygroup`
--

LOCK TABLES `privacygroup` WRITE;
/*!40000 ALTER TABLE `privacygroup` DISABLE KEYS */;
INSERT INTO `privacygroup` VALUES (3928,'Private',513,'2010-06-18'),(3929,'Contact',513,'2010-06-18'),(3930,'Public',513,'2010-06-18'),(3931,'Friend',513,'2010-06-18'),(3932,'Colleague',513,'2010-06-18'),(3933,'Superior',513,'2010-06-18'),(3934,'Potential Employer',513,'2010-06-18'),(3935,'Trusted Potential Employer',513,'2010-06-18'),(3936,'Private',514,'2010-06-18'),(3937,'Contact',514,'2010-06-18'),(3938,'Public',514,'2010-06-18'),(3939,'Friend',514,'2010-06-18'),(3940,'Colleague',514,'2010-06-18'),(3941,'Superior',514,'2010-06-18'),(3942,'Potential Employer',514,'2010-06-18'),(3943,'Trusted Potential Employer',514,'2010-06-18'),(3944,'Private',518,'2010-06-18'),(3945,'Contact',518,'2010-06-18'),(3946,'Public',518,'2010-06-18'),(3947,'Friend',518,'2010-06-18'),(3948,'Colleague',518,'2010-06-18'),(3949,'Superior',518,'2010-06-18'),(3950,'Potential Employer',518,'2010-06-18'),(3951,'Trusted Potential Employer',518,'2010-06-18'),(3952,'Private',519,'2010-06-21'),(3953,'Contact',519,'2010-06-21'),(3954,'Public',519,'2010-06-21'),(3955,'Friend',519,'2010-06-21'),(3956,'Colleague',519,'2010-06-21'),(3957,'Superior',519,'2010-06-21'),(3958,'Potential Employer',519,'2010-06-21'),(3959,'Trusted Potential Employer',519,'2010-06-21'),(3960,'Private',520,'2010-06-23'),(3961,'Contact',520,'2010-06-23'),(3962,'Public',520,'2010-06-23'),(3963,'Friend',520,'2010-06-23'),(3964,'Colleague',520,'2010-06-23'),(3965,'Superior',520,'2010-06-23'),(3966,'Potential Employer',520,'2010-06-23'),(3967,'Trusted Potential Employer',520,'2010-06-23'),(3968,'Private',521,'2010-07-09'),(3969,'Contact',521,'2010-07-09'),(3970,'Public',521,'2010-07-09'),(3971,'Friend',521,'2010-07-09'),(3972,'Colleague',521,'2010-07-09'),(3973,'Superior',521,'2010-07-09'),(3974,'Potential Employer',521,'2010-07-09'),(3975,'Trusted Potential Employer',521,'2010-07-09'),(3976,'Public',522,'2010-07-09'),(3977,'Contact',522,'2010-07-09'),(3978,'Employee',522,'2010-07-09'),(3979,'Manager',522,'2010-07-09'),(3980,'Executive',522,'2010-07-09'),(3981,'Potential Employee',522,'2010-07-09'),(3982,'Trusted Potential Employee',522,'2010-07-09'),(3983,'Private',523,'2010-07-09'),(3984,'Contact',523,'2010-07-09'),(3985,'Public',523,'2010-07-09'),(3986,'Friend',523,'2010-07-09'),(3987,'Colleague',523,'2010-07-09'),(3988,'Superior',523,'2010-07-09'),(3989,'Potential Employer',523,'2010-07-09'),(3990,'Trusted Potential Employer',523,'2010-07-09'),(3991,'Public',524,'2010-07-09'),(3992,'Contact',524,'2010-07-09'),(3993,'Employee',524,'2010-07-09'),(3994,'Manager',524,'2010-07-09'),(3995,'Executive',524,'2010-07-09'),(3996,'Potential Employee',524,'2010-07-09'),(3997,'Trusted Potential Employee',524,'2010-07-09'),(3998,'Private',525,'2010-07-14'),(3999,'Contact',525,'2010-07-14'),(4000,'Public',525,'2010-07-14'),(4001,'Friend',525,'2010-07-14'),(4002,'Colleague',525,'2010-07-14'),(4003,'Superior',525,'2010-07-14'),(4004,'Potential Employer',525,'2010-07-14'),(4005,'Trusted Potential Employer',525,'2010-07-14'),(4006,'Private',526,'2010-07-14'),(4007,'Contact',526,'2010-07-14'),(4008,'Public',526,'2010-07-14'),(4009,'Friend',526,'2010-07-14'),(4010,'Colleague',526,'2010-07-14'),(4011,'Superior',526,'2010-07-14'),(4012,'Potential Employer',526,'2010-07-14'),(4013,'Trusted Potential Employer',526,'2010-07-14'),(4014,'Public',527,'2010-07-15'),(4015,'Contact',527,'2010-07-15'),(4016,'Employee',527,'2010-07-15'),(4017,'Manager',527,'2010-07-15'),(4018,'Executive',527,'2010-07-15'),(4019,'Potential Employee',527,'2010-07-15'),(4020,'Trusted Potential Employee',527,'2010-07-15'),(4021,'Public',528,'2010-07-15'),(4022,'Contact',528,'2010-07-15'),(4023,'Employee',528,'2010-07-15'),(4024,'Manager',528,'2010-07-15'),(4025,'Executive',528,'2010-07-15'),(4026,'Potential Employee',528,'2010-07-15'),(4027,'Trusted Potential Employee',528,'2010-07-15'),(4028,'Public',529,'2010-07-15'),(4029,'Contact',529,'2010-07-15'),(4030,'Employee',529,'2010-07-15'),(4031,'Manager',529,'2010-07-15'),(4032,'Executive',529,'2010-07-15'),(4033,'Potential Employee',529,'2010-07-15'),(4034,'Trusted Potential Employee',529,'2010-07-15'),(4035,'Private',530,'2010-08-02'),(4036,'Contact',530,'2010-08-02'),(4037,'Public',530,'2010-08-02'),(4038,'Friend',530,'2010-08-02'),(4039,'Colleague',530,'2010-08-02'),(4040,'Superior',530,'2010-08-02'),(4041,'Potential Employer',530,'2010-08-02'),(4042,'Trusted Potential Employer',530,'2010-08-02'),(4043,'Private',531,'2010-08-02'),(4044,'Contact',531,'2010-08-02'),(4045,'Public',531,'2010-08-02'),(4046,'Friend',531,'2010-08-02'),(4047,'Colleague',531,'2010-08-02'),(4048,'Superior',531,'2010-08-02'),(4049,'Potential Employer',531,'2010-08-02'),(4050,'Trusted Potential Employer',531,'2010-08-02'),(4051,'Test',530,'2010-08-02'),(4052,'Public',532,'2010-08-10'),(4053,'Contact',532,'2010-08-10'),(4054,'Employee',532,'2010-08-10'),(4055,'Manager',532,'2010-08-10'),(4056,'Executive',532,'2010-08-10'),(4057,'Potential Employee',532,'2010-08-10'),(4058,'Trusted Potential Employee',532,'2010-08-10'),(4059,'Public',533,'2010-08-18'),(4060,'Contact',533,'2010-08-18'),(4061,'Employee',533,'2010-08-18'),(4062,'Manager',533,'2010-08-18'),(4063,'Executive',533,'2010-08-18'),(4064,'Potential Employee',533,'2010-08-18'),(4065,'Trusted Potential Employee',533,'2010-08-18'),(4066,'Public',534,'2010-08-19'),(4067,'Contact',534,'2010-08-19'),(4068,'Employee',534,'2010-08-19'),(4069,'Manager',534,'2010-08-19'),(4070,'Executive',534,'2010-08-19'),(4071,'Potential Employee',534,'2010-08-19'),(4072,'Trusted Potential Employee',534,'2010-08-19'),(4073,'Public',535,'2010-08-22'),(4074,'Contact',535,'2010-08-22'),(4075,'Employee',535,'2010-08-22'),(4076,'Manager',535,'2010-08-22'),(4077,'Executive',535,'2010-08-22'),(4078,'Potential Employee',535,'2010-08-22'),(4079,'Trusted Potential Employee',535,'2010-08-22'),(4080,'Private',536,'2010-08-24'),(4081,'Contact',536,'2010-08-24'),(4082,'Public',536,'2010-08-24'),(4083,'Friend',536,'2010-08-24'),(4084,'Colleague',536,'2010-08-24'),(4085,'Superior',536,'2010-08-24'),(4086,'Potential Employer',536,'2010-08-24'),(4087,'Trusted Potential Employer',536,'2010-08-24'),(4088,'Private',537,'2010-08-30'),(4089,'Contact',537,'2010-08-30'),(4090,'Public',537,'2010-08-30'),(4091,'Friend',537,'2010-08-30'),(4092,'Colleague',537,'2010-08-30'),(4093,'Superior',537,'2010-08-30'),(4094,'Potential Employer',537,'2010-08-30'),(4095,'Trusted Potential Employer',537,'2010-08-30'),(4096,'Private',NULL,'2010-08-30'),(4097,'Contact',NULL,'2010-08-30'),(4098,'Public',NULL,'2010-08-30'),(4099,'Friend',NULL,'2010-08-30'),(4100,'Colleague',NULL,'2010-08-30'),(4101,'Superior',NULL,'2010-08-30'),(4102,'Potential Employer',NULL,'2010-08-30'),(4103,'Trusted Potential Employer',NULL,'2010-08-30'),(4104,'Private',NULL,'2010-08-30'),(4105,'Contact',NULL,'2010-08-30'),(4106,'Public',NULL,'2010-08-30'),(4107,'Friend',NULL,'2010-08-30'),(4108,'Colleague',NULL,'2010-08-30'),(4109,'Superior',NULL,'2010-08-30'),(4110,'Potential Employer',NULL,'2010-08-30'),(4111,'Trusted Potential Employer',NULL,'2010-08-30'),(4112,'Private',540,'2010-09-03'),(4113,'Contact',540,'2010-09-03'),(4114,'Public',540,'2010-09-03'),(4115,'Friend',540,'2010-09-03'),(4116,'Colleague',540,'2010-09-03'),(4117,'Superior',540,'2010-09-03'),(4118,'Potential Employer',540,'2010-09-03'),(4119,'Trusted Potential Employer',540,'2010-09-03'),(4120,'Private',541,'2010-09-05'),(4121,'Contact',541,'2010-09-05'),(4122,'Public',541,'2010-09-05'),(4123,'Friend',541,'2010-09-05'),(4124,'Colleague',541,'2010-09-05'),(4125,'Superior',541,'2010-09-05'),(4126,'Potential Employer',541,'2010-09-05'),(4127,'Trusted Potential Employer',541,'2010-09-05'),(4128,'Private',542,'2010-09-05'),(4129,'Contact',542,'2010-09-05'),(4130,'Public',542,'2010-09-05'),(4131,'Friend',542,'2010-09-05'),(4132,'Colleague',542,'2010-09-05'),(4133,'Superior',542,'2010-09-05'),(4134,'Potential Employer',542,'2010-09-05'),(4135,'Trusted Potential Employer',542,'2010-09-05'),(4136,'Private',543,'2010-09-07'),(4137,'Contact',543,'2010-09-07'),(4138,'Public',543,'2010-09-07'),(4139,'Friend',543,'2010-09-07'),(4140,'Colleague',543,'2010-09-07'),(4141,'Superior',543,'2010-09-07'),(4142,'Potential Employer',543,'2010-09-07'),(4143,'Trusted Potential Employer',543,'2010-09-07'),(4144,'Private',544,'2010-09-07'),(4145,'Contact',544,'2010-09-07'),(4146,'Public',544,'2010-09-07'),(4147,'Friend',544,'2010-09-07'),(4148,'Colleague',544,'2010-09-07'),(4149,'Superior',544,'2010-09-07'),(4150,'Potential Employer',544,'2010-09-07'),(4151,'Trusted Potential Employer',544,'2010-09-07'),(4152,'Private',NULL,'2010-09-07'),(4153,'Contact',NULL,'2010-09-07'),(4154,'Public',NULL,'2010-09-07'),(4155,'Friend',NULL,'2010-09-07'),(4156,'Colleague',NULL,'2010-09-07'),(4157,'Superior',NULL,'2010-09-07'),(4158,'Potential Employer',NULL,'2010-09-07'),(4159,'Trusted Potential Employer',NULL,'2010-09-07'),(4160,'Private',546,'2010-09-07'),(4161,'Contact',546,'2010-09-07'),(4162,'Public',546,'2010-09-07'),(4163,'Friend',546,'2010-09-07'),(4164,'Colleague',546,'2010-09-07'),(4165,'Superior',546,'2010-09-07'),(4166,'Potential Employer',546,'2010-09-07'),(4167,'Trusted Potential Employer',546,'2010-09-07'),(4168,'Private',NULL,'2010-09-07'),(4169,'Contact',NULL,'2010-09-07'),(4170,'Public',NULL,'2010-09-07'),(4171,'Friend',NULL,'2010-09-07'),(4172,'Colleague',NULL,'2010-09-07'),(4173,'Superior',NULL,'2010-09-07'),(4174,'Potential Employer',NULL,'2010-09-07'),(4175,'Trusted Potential Employer',NULL,'2010-09-07'),(4176,'Private',NULL,'2010-09-08'),(4177,'Contact',NULL,'2010-09-08'),(4178,'Public',NULL,'2010-09-08'),(4179,'Friend',NULL,'2010-09-08'),(4180,'Colleague',NULL,'2010-09-08'),(4181,'Superior',NULL,'2010-09-08'),(4182,'Potential Employer',NULL,'2010-09-08'),(4183,'Trusted Potential Employer',NULL,'2010-09-08'),(4184,'Private',NULL,'2010-09-08'),(4185,'Contact',NULL,'2010-09-08'),(4186,'Public',NULL,'2010-09-08'),(4187,'Friend',NULL,'2010-09-08'),(4188,'Colleague',NULL,'2010-09-08'),(4189,'Superior',NULL,'2010-09-08'),(4190,'Potential Employer',NULL,'2010-09-08'),(4191,'Trusted Potential Employer',NULL,'2010-09-08'),(4192,'Private',NULL,'2010-09-08'),(4193,'Contact',NULL,'2010-09-08'),(4194,'Public',NULL,'2010-09-08'),(4195,'Friend',NULL,'2010-09-08'),(4196,'Colleague',NULL,'2010-09-08'),(4197,'Superior',NULL,'2010-09-08'),(4198,'Potential Employer',NULL,'2010-09-08'),(4199,'Trusted Potential Employer',NULL,'2010-09-08'),(4200,'Private',551,'2010-09-10'),(4201,'Contact',551,'2010-09-10'),(4202,'Public',551,'2010-09-10'),(4203,'Friend',551,'2010-09-10'),(4204,'Colleague',551,'2010-09-10'),(4205,'Superior',551,'2010-09-10'),(4206,'Potential Employer',551,'2010-09-10'),(4207,'Trusted Potential Employer',551,'2010-09-10'),(4208,'Private',NULL,'2010-09-14'),(4209,'Contact',NULL,'2010-09-14'),(4210,'Public',NULL,'2010-09-14'),(4211,'Friend',NULL,'2010-09-14'),(4212,'Colleague',NULL,'2010-09-14'),(4213,'Superior',NULL,'2010-09-14'),(4214,'Potential Employer',NULL,'2010-09-14'),(4215,'Trusted Potential Employer',NULL,'2010-09-14'),(4216,'Private',NULL,'2010-09-14'),(4217,'Contact',NULL,'2010-09-14'),(4218,'Public',NULL,'2010-09-14'),(4219,'Friend',NULL,'2010-09-14'),(4220,'Colleague',NULL,'2010-09-14'),(4221,'Superior',NULL,'2010-09-14'),(4222,'Potential Employer',NULL,'2010-09-14'),(4223,'Trusted Potential Employer',NULL,'2010-09-14'),(4224,'Private',554,'2010-09-24'),(4225,'Contact',554,'2010-09-24'),(4226,'Public',554,'2010-09-24'),(4227,'Friend',554,'2010-09-24'),(4228,'Colleague',554,'2010-09-24'),(4229,'Superior',554,'2010-09-24'),(4230,'Potential Employer',554,'2010-09-24'),(4231,'Trusted Potential Employer',554,'2010-09-24'),(4232,'Private',555,'2010-09-24'),(4233,'Contact',555,'2010-09-24'),(4234,'Public',555,'2010-09-24'),(4235,'Friend',555,'2010-09-24'),(4236,'Colleague',555,'2010-09-24'),(4237,'Superior',555,'2010-09-24'),(4238,'Potential Employer',555,'2010-09-24'),(4239,'Trusted Potential Employer',555,'2010-09-24'),(4240,'Public',556,'2010-09-24'),(4241,'Contact',556,'2010-09-24'),(4242,'Employee',556,'2010-09-24'),(4243,'Manager',556,'2010-09-24'),(4244,'Executive',556,'2010-09-24'),(4245,'Potential Employee',556,'2010-09-24'),(4246,'Trusted Potential Employee',556,'2010-09-24'),(4247,'Public',557,'2010-09-24'),(4248,'Contact',557,'2010-09-24'),(4249,'Employee',557,'2010-09-24'),(4250,'Manager',557,'2010-09-24'),(4251,'Executive',557,'2010-09-24'),(4252,'Potential Employee',557,'2010-09-24'),(4253,'Trusted Potential Employee',557,'2010-09-24'),(4254,'Public',558,'2010-09-27'),(4255,'Contact',558,'2010-09-27'),(4256,'Employee',558,'2010-09-27'),(4257,'Manager',558,'2010-09-27'),(4258,'Executive',558,'2010-09-27'),(4259,'Potential Employee',558,'2010-09-27'),(4260,'Trusted Potential Employee',558,'2010-09-27'),(4261,'Private',559,'2010-09-27'),(4262,'Contact',559,'2010-09-27'),(4263,'Public',559,'2010-09-27'),(4264,'Friend',559,'2010-09-27'),(4265,'Colleague',559,'2010-09-27'),(4266,'Superior',559,'2010-09-27'),(4267,'Potential Employer',559,'2010-09-27'),(4268,'Trusted Potential Employer',559,'2010-09-27'),(4269,'Private',560,'2010-09-28'),(4270,'Contact',560,'2010-09-28'),(4271,'Public',560,'2010-09-28'),(4272,'Friend',560,'2010-09-28'),(4273,'Colleague',560,'2010-09-28'),(4274,'Superior',560,'2010-09-28'),(4275,'Potential Employer',560,'2010-09-28'),(4276,'Trusted Potential Employer',560,'2010-09-28'),(4277,'Private',561,'2010-09-28'),(4278,'Contact',561,'2010-09-28'),(4279,'Public',561,'2010-09-28'),(4280,'Friend',561,'2010-09-28'),(4281,'Colleague',561,'2010-09-28'),(4282,'Superior',561,'2010-09-28'),(4283,'Potential Employer',561,'2010-09-28'),(4284,'Trusted Potential Employer',561,'2010-09-28'),(4285,'Public',562,'2010-09-30'),(4286,'Contact',562,'2010-09-30'),(4287,'Employee',562,'2010-09-30'),(4288,'Manager',562,'2010-09-30'),(4289,'Executive',562,'2010-09-30'),(4290,'Potential Employee',562,'2010-09-30'),(4291,'Trusted Potential Employee',562,'2010-09-30'),(4292,'Private',563,'2010-10-04'),(4293,'Contact',563,'2010-10-04'),(4294,'Public',563,'2010-10-04'),(4295,'Friend',563,'2010-10-04'),(4296,'Colleague',563,'2010-10-04'),(4297,'Superior',563,'2010-10-04'),(4298,'Potential Employer',563,'2010-10-04'),(4299,'Trusted Potential Employer',563,'2010-10-04'),(4300,'Public',564,'2010-11-07'),(4301,'Contact',564,'2010-11-07'),(4302,'Employee',564,'2010-11-07'),(4303,'Manager',564,'2010-11-07'),(4304,'Executive',564,'2010-11-07'),(4305,'Potential Employee',564,'2010-11-07'),(4306,'Trusted Potential Employee',564,'2010-11-07'),(4307,'Private',565,'2010-11-15'),(4308,'Contact',565,'2010-11-15'),(4309,'Public',565,'2010-11-15'),(4310,'Friend',565,'2010-11-15'),(4311,'Colleague',565,'2010-11-15'),(4312,'Superior',565,'2010-11-15'),(4313,'Potential Employer',565,'2010-11-15'),(4314,'Trusted Potential Employer',565,'2010-11-15'),(4315,'Private',566,'2010-11-18'),(4316,'Contact',566,'2010-11-18'),(4317,'Public',566,'2010-11-18'),(4318,'Friend',566,'2010-11-18'),(4319,'Colleague',566,'2010-11-18'),(4320,'Superior',566,'2010-11-18'),(4321,'Potential Employer',566,'2010-11-18'),(4322,'Trusted Potential Employer',566,'2010-11-18'),(4323,'Public',567,'2010-11-23'),(4324,'Contact',567,'2010-11-23'),(4325,'Employee',567,'2010-11-23'),(4326,'Manager',567,'2010-11-23'),(4327,'Executive',567,'2010-11-23'),(4328,'Potential Employee',567,'2010-11-23'),(4329,'Trusted Potential Employee',567,'2010-11-23'),(4330,'Public',568,'2010-11-24'),(4331,'Contact',568,'2010-11-24'),(4332,'Employee',568,'2010-11-24'),(4333,'Manager',568,'2010-11-24'),(4334,'Executive',568,'2010-11-24'),(4335,'Potential Employee',568,'2010-11-24'),(4336,'Trusted Potential Employee',568,'2010-11-24'),(4337,'Private',569,'2010-11-24'),(4338,'Contact',569,'2010-11-24'),(4339,'Public',569,'2010-11-24'),(4340,'Friend',569,'2010-11-24'),(4341,'Colleague',569,'2010-11-24'),(4342,'Superior',569,'2010-11-24'),(4343,'Potential Employer',569,'2010-11-24'),(4344,'Trusted Potential Employer',569,'2010-11-24'),(4345,'Public',570,'2010-11-24'),(4346,'Contact',570,'2010-11-24'),(4347,'Employee',570,'2010-11-24'),(4348,'Manager',570,'2010-11-24'),(4349,'Executive',570,'2010-11-24'),(4350,'Potential Employee',570,'2010-11-24'),(4351,'Trusted Potential Employee',570,'2010-11-24'),(4352,'Private',571,'2010-11-24'),(4353,'Contact',571,'2010-11-24'),(4354,'Public',571,'2010-11-24'),(4355,'Friend',571,'2010-11-24'),(4356,'Colleague',571,'2010-11-24'),(4357,'Superior',571,'2010-11-24'),(4358,'Potential Employer',571,'2010-11-24'),(4359,'Trusted Potential Employer',571,'2010-11-24'),(4360,'Private',572,'2010-11-25'),(4361,'Contact',572,'2010-11-25'),(4362,'Public',572,'2010-11-25'),(4363,'Friend',572,'2010-11-25'),(4364,'Colleague',572,'2010-11-25'),(4365,'Superior',572,'2010-11-25'),(4366,'Potential Employer',572,'2010-11-25'),(4367,'Trusted Potential Employer',572,'2010-11-25'),(4368,'Public',573,'2010-11-25'),(4369,'Contact',573,'2010-11-25'),(4370,'Employee',573,'2010-11-25'),(4371,'Manager',573,'2010-11-25'),(4372,'Executive',573,'2010-11-25'),(4373,'Potential Employee',573,'2010-11-25'),(4374,'Trusted Potential Employee',573,'2010-11-25'),(4375,'Private',574,'2010-12-02'),(4376,'Contact',574,'2010-12-02'),(4377,'Public',574,'2010-12-02'),(4378,'Friend',574,'2010-12-02'),(4379,'Colleague',574,'2010-12-02'),(4380,'Superior',574,'2010-12-02'),(4381,'Potential Employer',574,'2010-12-02'),(4382,'Trusted Potential Employer',574,'2010-12-02'),(4383,'Private',575,'2010-12-03'),(4384,'Contact',575,'2010-12-03'),(4385,'Public',575,'2010-12-03'),(4386,'Friend',575,'2010-12-03'),(4387,'Colleague',575,'2010-12-03'),(4388,'Superior',575,'2010-12-03'),(4389,'Potential Employer',575,'2010-12-03'),(4390,'Trusted Potential Employer',575,'2010-12-03'),(4391,'Private',576,'2010-12-03'),(4392,'Contact',576,'2010-12-03'),(4393,'Public',576,'2010-12-03'),(4394,'Friend',576,'2010-12-03'),(4395,'Colleague',576,'2010-12-03'),(4396,'Superior',576,'2010-12-03'),(4397,'Potential Employer',576,'2010-12-03'),(4398,'Trusted Potential Employer',576,'2010-12-03'),(4399,'Public',577,'2010-12-03'),(4400,'Contact',577,'2010-12-03'),(4401,'Employee',577,'2010-12-03'),(4402,'Manager',577,'2010-12-03'),(4403,'Executive',577,'2010-12-03'),(4404,'Potential Employee',577,'2010-12-03'),(4405,'Trusted Potential Employee',577,'2010-12-03'),(4406,'Public',578,'2010-12-06'),(4407,'Contact',578,'2010-12-06'),(4408,'Employee',578,'2010-12-06'),(4409,'Manager',578,'2010-12-06'),(4410,'Executive',578,'2010-12-06'),(4411,'Potential Employee',578,'2010-12-06'),(4412,'Trusted Potential Employee',578,'2010-12-06'),(4413,'Public',579,'2010-12-06'),(4414,'Contact',579,'2010-12-06'),(4415,'Employee',579,'2010-12-06'),(4416,'Manager',579,'2010-12-06'),(4417,'Executive',579,'2010-12-06'),(4418,'Potential Employee',579,'2010-12-06'),(4419,'Trusted Potential Employee',579,'2010-12-06'),(4420,'Private',580,'2010-12-09'),(4421,'Contact',580,'2010-12-09'),(4422,'Public',580,'2010-12-09'),(4423,'Friend',580,'2010-12-09'),(4424,'Colleague',580,'2010-12-09'),(4425,'Superior',580,'2010-12-09'),(4426,'Potential Employer',580,'2010-12-09'),(4427,'Trusted Potential Employer',580,'2010-12-09'),(4428,'Private',581,'2010-12-09'),(4429,'Contact',581,'2010-12-09'),(4430,'Public',581,'2010-12-09'),(4431,'Friend',581,'2010-12-09'),(4432,'Colleague',581,'2010-12-09'),(4433,'Superior',581,'2010-12-09'),(4434,'Potential Employer',581,'2010-12-09'),(4435,'Trusted Potential Employer',581,'2010-12-09'),(4436,'Private',582,'2010-12-09'),(4437,'Contact',582,'2010-12-09'),(4438,'Public',582,'2010-12-09'),(4439,'Friend',582,'2010-12-09'),(4440,'Colleague',582,'2010-12-09'),(4441,'Superior',582,'2010-12-09'),(4442,'Potential Employer',582,'2010-12-09'),(4443,'Trusted Potential Employer',582,'2010-12-09'),(4444,'Private',583,'2010-12-09'),(4445,'Contact',583,'2010-12-09'),(4446,'Public',583,'2010-12-09'),(4447,'Friend',583,'2010-12-09'),(4448,'Colleague',583,'2010-12-09'),(4449,'Superior',583,'2010-12-09'),(4450,'Potential Employer',583,'2010-12-09'),(4451,'Trusted Potential Employer',583,'2010-12-09'),(4452,'Private',584,'2010-12-09'),(4453,'Contact',584,'2010-12-09'),(4454,'Friend',584,'2010-12-09'),(4455,'Colleague',584,'2010-12-09'),(4456,'Superior',584,'2010-12-09'),(4457,'Potential Employer',584,'2010-12-09'),(4458,'Trusted Potential Employer',584,'2010-12-09'),(4459,'Public',585,'2010-12-09'),(4460,'Private',585,'2010-12-09'),(4461,'Contact',585,'2010-12-09'),(4462,'Friend',585,'2010-12-09'),(4463,'Colleague',585,'2010-12-09'),(4464,'Superior',585,'2010-12-09'),(4465,'Potential Employer',585,'2010-12-09'),(4466,'Trusted Potential Employer',585,'2010-12-09'),(4467,'Public',586,'2010-12-09'),(4468,'Private',586,'2010-12-09'),(4469,'Contact',586,'2010-12-09'),(4470,'Friend',586,'2010-12-09'),(4471,'Colleague',586,'2010-12-09'),(4472,'Superior',586,'2010-12-09'),(4473,'Potential Employer',586,'2010-12-09'),(4474,'Trusted Potential Employer',586,'2010-12-09'),(4475,'Public',587,'2010-12-09'),(4476,'Private',587,'2010-12-09'),(4477,'Contact',587,'2010-12-09'),(4478,'Friend',587,'2010-12-09'),(4479,'Colleague',587,'2010-12-09'),(4480,'Superior',587,'2010-12-09'),(4481,'Potential Employer',587,'2010-12-09'),(4482,'Trusted Potential Employer',587,'2010-12-09'),(4483,'Public',588,'2010-12-10'),(4484,'Private',588,'2010-12-10'),(4485,'Contact',588,'2010-12-10'),(4486,'Friend',588,'2010-12-10'),(4487,'Colleague',588,'2010-12-10'),(4488,'Superior',588,'2010-12-10'),(4489,'Potential Employer',588,'2010-12-10'),(4490,'Trusted Potential Employer',588,'2010-12-10'),(4491,'Public',589,'2010-12-10'),(4492,'Contact',589,'2010-12-10'),(4493,'Employee',589,'2010-12-10'),(4494,'Manager',589,'2010-12-10'),(4495,'Executive',589,'2010-12-10'),(4496,'Potential Employee',589,'2010-12-10'),(4497,'Trusted Potential Employee',589,'2010-12-10'),(4498,'Public',590,'2010-12-12'),(4499,'Contact',590,'2010-12-12'),(4500,'Employee',590,'2010-12-12'),(4501,'Manager',590,'2010-12-12'),(4502,'Executive',590,'2010-12-12'),(4503,'Potential Employee',590,'2010-12-12'),(4504,'Trusted Potential Employee',590,'2010-12-12'),(4505,'Public',591,'2010-12-15'),(4506,'Private',591,'2010-12-15'),(4507,'Contact',591,'2010-12-15'),(4508,'Friend',591,'2010-12-15'),(4509,'Colleague',591,'2010-12-15'),(4510,'Superior',591,'2010-12-15'),(4511,'Potential Employer',591,'2010-12-15'),(4512,'Trusted Potential Employer',591,'2010-12-15'),(4513,'Public',592,'2010-12-15'),(4514,'Private',592,'2010-12-15'),(4515,'Contact',592,'2010-12-15'),(4516,'Friend',592,'2010-12-15'),(4517,'Colleague',592,'2010-12-15'),(4518,'Superior',592,'2010-12-15'),(4519,'Potential Employer',592,'2010-12-15'),(4520,'Trusted Potential Employer',592,'2010-12-15'),(4521,'Public',593,'2010-12-15'),(4522,'Private',593,'2010-12-15'),(4523,'Contact',593,'2010-12-15'),(4524,'Friend',593,'2010-12-15'),(4525,'Colleague',593,'2010-12-15'),(4526,'Superior',593,'2010-12-15'),(4527,'Potential Employer',593,'2010-12-15'),(4528,'Trusted Potential Employer',593,'2010-12-15'),(4529,'New group',513,'2010-12-31'),(4530,'Public',594,'2011-01-11'),(4531,'Contact',594,'2011-01-11'),(4532,'Employee',594,'2011-01-11'),(4533,'Manager',594,'2011-01-11'),(4534,'Executive',594,'2011-01-11'),(4535,'Potential Employee',594,'2011-01-11'),(4536,'Trusted Potential Employee',594,'2011-01-11'),(4537,'Public',595,'2011-01-13'),(4538,'Private',595,'2011-01-13'),(4539,'Contact',595,'2011-01-13'),(4540,'Friend',595,'2011-01-13'),(4541,'Colleague',595,'2011-01-13'),(4542,'Superior',595,'2011-01-13'),(4543,'Potential Employer',595,'2011-01-13'),(4544,'Trusted Potential Employer',595,'2011-01-13'),(4545,'Public',596,'2011-01-28'),(4546,'Private',596,'2011-01-28'),(4547,'Contact',596,'2011-01-28'),(4548,'Friend',596,'2011-01-28'),(4549,'Colleague',596,'2011-01-28'),(4550,'Superior',596,'2011-01-28'),(4551,'Potential Employer',596,'2011-01-28'),(4552,'Trusted Potential Employer',596,'2011-01-28'),(4553,'Public',597,'2011-02-09'),(4554,'Private',597,'2011-02-09'),(4555,'Contact',597,'2011-02-09'),(4556,'Friend',597,'2011-02-09'),(4557,'Colleague',597,'2011-02-09'),(4558,'Superior',597,'2011-02-09'),(4559,'Potential Employer',597,'2011-02-09'),(4560,'Trusted Potential Employer',597,'2011-02-09'),(4561,'Private',598,'2011-03-01'),(4562,'Contact',598,'2011-03-01'),(4563,'Public',598,'2011-03-01'),(4564,'Friend',598,'2011-03-01'),(4565,'Colleague',598,'2011-03-01'),(4566,'Superior',598,'2011-03-01'),(4567,'Potential Employer',598,'2011-03-01'),(4568,'Trusted Potential Employer',598,'2011-03-01'),(4569,'Private',599,'2011-03-18'),(4570,'Contact',599,'2011-03-18'),(4571,'Public',599,'2011-03-18'),(4572,'Friend',599,'2011-03-18'),(4573,'Colleague',599,'2011-03-18'),(4574,'Superior',599,'2011-03-18'),(4575,'Potential Employer',599,'2011-03-18'),(4576,'Trusted Potential Employer',599,'2011-03-18'),(4577,'Private',600,'2011-04-13'),(4578,'Contact',600,'2011-04-13'),(4579,'Public',600,'2011-04-13'),(4580,'Friend',600,'2011-04-13'),(4581,'Colleague',600,'2011-04-13'),(4582,'Superior',600,'2011-04-13'),(4583,'Potential Employer',600,'2011-04-13'),(4584,'Trusted Potential Employer',600,'2011-04-13'),(4585,'Public',601,'2011-04-13'),(4586,'Contact',601,'2011-04-13'),(4587,'Employee',601,'2011-04-13'),(4588,'Manager',601,'2011-04-13'),(4589,'Executive',601,'2011-04-13'),(4590,'Potential Employee',601,'2011-04-13'),(4591,'Trusted Potential Employee',601,'2011-04-13');
/*!40000 ALTER TABLE `privacygroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privateitems`
--

DROP TABLE IF EXISTS `privateitems`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `privateitems` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `privateitems`
--

LOCK TABLES `privateitems` WRITE;
/*!40000 ALTER TABLE `privateitems` DISABLE KEYS */;
INSERT INTO `privateitems` VALUES (1,'Personal Information'),(2,'Desired Work'),(3,'Work Experience'),(4,'Education Experience'),(5,'Profile Picture'),(6,'Friend List');
/*!40000 ALTER TABLE `privateitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privateitems_has_privacygroup`
--

DROP TABLE IF EXISTS `privateitems_has_privacygroup`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `privateitems_has_privacygroup` (
  `privateItems_id` bigint(20) NOT NULL,
  `privacygroup_id` bigint(20) NOT NULL,
  PRIMARY KEY  (`privateItems_id`,`privacygroup_id`),
  KEY `fk_privateitems_has_privacygroup_privateitems` (`privateItems_id`),
  KEY `fk_privateitems_has_privacygroup_privacygroup` (`privacygroup_id`),
  CONSTRAINT `fk_privateitems_has_privacygroup_privacygroup` FOREIGN KEY (`privacygroup_id`) REFERENCES `privacygroup` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_privateitems_has_privacygroup_privateitems` FOREIGN KEY (`privateItems_id`) REFERENCES `privateitems` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `privateitems_has_privacygroup`
--

LOCK TABLES `privateitems_has_privacygroup` WRITE;
/*!40000 ALTER TABLE `privateitems_has_privacygroup` DISABLE KEYS */;
INSERT INTO `privateitems_has_privacygroup` VALUES (1,3930),(1,3938),(1,3946),(1,3954),(1,3962),(1,3970),(1,3977),(1,3985),(1,3992),(1,4000),(1,4008),(1,4015),(1,4022),(1,4029),(1,4037),(1,4045),(1,4053),(1,4060),(1,4067),(1,4074),(1,4082),(1,4090),(1,4098),(1,4106),(1,4114),(1,4122),(1,4130),(1,4138),(1,4146),(1,4154),(1,4162),(1,4170),(1,4178),(1,4186),(1,4194),(1,4202),(1,4210),(1,4218),(1,4226),(1,4234),(1,4241),(1,4248),(1,4255),(1,4263),(1,4271),(1,4279),(1,4286),(1,4294),(1,4301),(1,4309),(1,4317),(1,4324),(1,4331),(1,4339),(1,4346),(1,4354),(1,4362),(1,4369),(1,4377),(1,4385),(1,4393),(1,4400),(1,4407),(1,4414),(1,4422),(1,4430),(1,4438),(1,4446),(1,4452),(1,4459),(1,4467),(1,4475),(1,4483),(1,4492),(1,4499),(1,4505),(1,4513),(1,4521),(1,4531),(1,4537),(1,4545),(1,4553),(1,4563),(1,4571),(1,4579),(1,4586),(2,3930),(2,3938),(2,3946),(2,3954),(2,3962),(2,3970),(2,3977),(2,3985),(2,3992),(2,4000),(2,4008),(2,4015),(2,4022),(2,4029),(2,4037),(2,4038),(2,4039),(2,4045),(2,4053),(2,4060),(2,4067),(2,4074),(2,4082),(2,4090),(2,4098),(2,4106),(2,4114),(2,4122),(2,4130),(2,4138),(2,4146),(2,4154),(2,4162),(2,4170),(2,4178),(2,4186),(2,4194),(2,4202),(2,4210),(2,4218),(2,4226),(2,4234),(2,4241),(2,4248),(2,4255),(2,4263),(2,4271),(2,4279),(2,4286),(2,4294),(2,4301),(2,4309),(2,4317),(2,4324),(2,4331),(2,4339),(2,4346),(2,4354),(2,4362),(2,4369),(2,4377),(2,4385),(2,4393),(2,4400),(2,4407),(2,4414),(2,4422),(2,4430),(2,4438),(2,4446),(2,4452),(2,4459),(2,4467),(2,4475),(2,4483),(2,4492),(2,4499),(2,4505),(2,4513),(2,4521),(2,4531),(2,4537),(2,4545),(2,4553),(2,4563),(2,4571),(2,4579),(2,4586),(3,3930),(3,3938),(3,3946),(3,3954),(3,3962),(3,3970),(3,3977),(3,3985),(3,3992),(3,4000),(3,4008),(3,4015),(3,4022),(3,4029),(3,4037),(3,4045),(3,4053),(3,4060),(3,4067),(3,4074),(3,4082),(3,4090),(3,4098),(3,4106),(3,4114),(3,4122),(3,4130),(3,4138),(3,4146),(3,4154),(3,4162),(3,4170),(3,4178),(3,4186),(3,4194),(3,4202),(3,4210),(3,4218),(3,4226),(3,4234),(3,4241),(3,4248),(3,4255),(3,4263),(3,4271),(3,4279),(3,4286),(3,4294),(3,4301),(3,4309),(3,4317),(3,4324),(3,4331),(3,4339),(3,4346),(3,4354),(3,4362),(3,4369),(3,4377),(3,4385),(3,4393),(3,4400),(3,4407),(3,4414),(3,4422),(3,4430),(3,4438),(3,4446),(3,4452),(3,4459),(3,4467),(3,4475),(3,4483),(3,4492),(3,4499),(3,4505),(3,4513),(3,4521),(3,4531),(3,4537),(3,4545),(3,4553),(3,4563),(3,4571),(3,4579),(3,4586),(4,3930),(4,3938),(4,3946),(4,3954),(4,3962),(4,3970),(4,3977),(4,3985),(4,3992),(4,4000),(4,4008),(4,4015),(4,4022),(4,4029),(4,4037),(4,4045),(4,4053),(4,4060),(4,4067),(4,4074),(4,4082),(4,4090),(4,4098),(4,4106),(4,4114),(4,4122),(4,4130),(4,4138),(4,4146),(4,4154),(4,4162),(4,4170),(4,4178),(4,4186),(4,4194),(4,4202),(4,4210),(4,4218),(4,4226),(4,4234),(4,4241),(4,4248),(4,4255),(4,4263),(4,4271),(4,4279),(4,4286),(4,4294),(4,4301),(4,4309),(4,4317),(4,4324),(4,4331),(4,4339),(4,4346),(4,4354),(4,4362),(4,4369),(4,4377),(4,4385),(4,4393),(4,4400),(4,4407),(4,4414),(4,4422),(4,4430),(4,4438),(4,4446),(4,4452),(4,4459),(4,4467),(4,4475),(4,4483),(4,4492),(4,4499),(4,4505),(4,4513),(4,4521),(4,4531),(4,4537),(4,4545),(4,4553),(4,4563),(4,4571),(4,4579),(4,4586),(5,3930),(5,3938),(5,3946),(5,3954),(5,3962),(5,3970),(5,3977),(5,3985),(5,3992),(5,4000),(5,4008),(5,4015),(5,4022),(5,4029),(5,4037),(5,4045),(5,4053),(5,4060),(5,4067),(5,4074),(5,4082),(5,4090),(5,4098),(5,4106),(5,4114),(5,4122),(5,4130),(5,4138),(5,4146),(5,4154),(5,4162),(5,4170),(5,4178),(5,4186),(5,4194),(5,4202),(5,4210),(5,4218),(5,4226),(5,4234),(5,4241),(5,4248),(5,4255),(5,4263),(5,4271),(5,4279),(5,4286),(5,4294),(5,4301),(5,4309),(5,4317),(5,4324),(5,4331),(5,4339),(5,4346),(5,4354),(5,4362),(5,4369),(5,4377),(5,4385),(5,4393),(5,4400),(5,4407),(5,4414),(5,4422),(5,4430),(5,4438),(5,4446),(5,4452),(5,4459),(5,4467),(5,4475),(5,4483),(5,4492),(5,4499),(5,4505),(5,4513),(5,4521),(5,4531),(5,4537),(5,4545),(5,4553),(5,4563),(5,4571),(5,4579),(5,4586),(6,3930),(6,3938),(6,3946),(6,3954),(6,3962),(6,3970),(6,3977),(6,3985),(6,3992),(6,4000),(6,4008),(6,4015),(6,4022),(6,4029),(6,4037),(6,4045),(6,4053),(6,4060),(6,4067),(6,4074),(6,4082),(6,4090),(6,4098),(6,4106),(6,4114),(6,4122),(6,4130),(6,4138),(6,4146),(6,4154),(6,4162),(6,4170),(6,4178),(6,4186),(6,4194),(6,4202),(6,4210),(6,4218),(6,4226),(6,4234),(6,4241),(6,4248),(6,4255),(6,4263),(6,4271),(6,4279),(6,4286),(6,4294),(6,4301),(6,4309),(6,4317),(6,4324),(6,4331),(6,4339),(6,4346),(6,4354),(6,4362),(6,4369),(6,4377),(6,4385),(6,4393),(6,4400),(6,4407),(6,4414),(6,4422),(6,4430),(6,4438),(6,4446),(6,4452),(6,4459),(6,4467),(6,4475),(6,4483),(6,4492),(6,4499),(6,4505),(6,4513),(6,4521),(6,4531),(6,4537),(6,4545),(6,4553),(6,4563),(6,4571),(6,4579),(6,4586);
/*!40000 ALTER TABLE `privateitems_has_privacygroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `profile` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(45) default NULL,
  `occupation` varchar(100) default NULL,
  `interests` varchar(45) default NULL,
  `user_id` bigint(20) NOT NULL,
  `worktimeframe` varchar(45) default NULL,
  `daysavailable` varchar(45) default NULL,
  `hoursavailable` varchar(45) default NULL,
  `skills` varchar(256) default NULL,
  `picture` varchar(256) default NULL,
  `trainings` varchar(45) default NULL,
  `phonenumber` varchar(45) default NULL,
  `location` varchar(100) default NULL,
  `category` varchar(45) default NULL,
  `salarytype` varchar(45) default NULL,
  `days` varchar(45) default NULL,
  `nickname` varchar(45) default NULL,
  `viewcount` bigint(45) default '0',
  `status` varchar(45) default 'NOTDEFAULT',
  `flagged` tinyint(4) default '0',
  `flagdelete` tinyint(4) default '0',
  `personalstatement` text,
  `resizedpicture` varchar(256) default NULL,
  `resizedminpicture` varchar(256) default NULL,
  `industry_id` bigint(20) default NULL,
  `aboutus` text,
  `workculture` text,
  `whyworkfromhere` text,
  `achievements` varchar(100) default NULL,
  `salrange` varchar(45) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_profile_user` (`user_id`),
  KEY `fk_profile_industry_id` (`industry_id`),
  CONSTRAINT `fk_profile_industry_id` FOREIGN KEY (`industry_id`) REFERENCES `industry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_profile_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=602 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (513,'suresh profile',NULL,NULL,197,'false',NULL,NULL,NULL,'Tree_513.jpg',NULL,NULL,NULL,NULL,'Annual','false',NULL,6,'default',0,0,'','mid_Tree_513.jpg','min_Tree_513.jpg',1,NULL,NULL,NULL,'sf',''),(514,'Rakesh profile',NULL,NULL,198,'false',NULL,NULL,NULL,'Forest Flowers_514.jpg',NULL,NULL,NULL,NULL,'Annual','false',NULL,90,'default',0,0,'','mid_Forest Flowers_514.jpg','min_Forest Flowers_514.jpg',16,NULL,NULL,NULL,'',NULL),(515,'endeavour',NULL,NULL,199,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,'default',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(516,'IBM',NULL,NULL,200,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'default',1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(517,'Employer16',NULL,NULL,201,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'default',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(518,'JasonsProfile',NULL,NULL,202,'Yearly',NULL,NULL,NULL,'logo_black_518.jpg',NULL,NULL,NULL,NULL,'Annual','false',NULL,16,'default',1,0,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed porta tincidunt tempor. Nunc non elit augue, sed lacinia tortor. Quisque laoreet auctor sollicitudin. Vivamus non massa et massa tempus semper. Donec sit amet risus felis. Sed aliquam malesuada tempus. Etiam fermentum, neque at tempor malesuada, purus arcu venenatis lacus, eu auctor enim nisl quis purus. Suspendisse malesuada nisl ac lacus dapibus id dictum tortor mattis. Nulla convallis, sapien sed scelerisque iaculis, ante est accumsan dui, a porta ligula odio imperdiet lectus. Duis eget diam vulputate elit pharetra viverra. \"TEST\"','mid_logo_black_518.jpg','min_logo_black_518.jpg',25,NULL,NULL,NULL,'USC Honor Roll',NULL),(519,'satya',NULL,NULL,203,'false',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','false',NULL,0,'default',0,0,'',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL),(520,'pulkam',NULL,NULL,203,'false',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','false',NULL,0,'notdefault',0,0,'',NULL,NULL,32,NULL,NULL,NULL,'',NULL),(521,'asd',NULL,NULL,209,'false',NULL,NULL,NULL,'Creek_521.jpg',NULL,NULL,NULL,NULL,'1','false',NULL,6,'default',0,0,'','mid_Creek_521.jpg','min_Creek_521.jpg',NULL,NULL,NULL,NULL,NULL,NULL),(522,'e3',NULL,NULL,210,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'default',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(523,'aq',NULL,NULL,211,'false',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','false',NULL,0,'default',0,0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(524,'eq',NULL,NULL,212,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'default',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(525,'sunitha.s profile',NULL,NULL,213,'false',NULL,NULL,NULL,'Winter Leaves_525.jpg',NULL,NULL,NULL,NULL,'Annually','false',NULL,8,'default',0,0,'','mid_Winter Leaves_525.jpg','min_Winter Leaves_525.jpg',2,NULL,NULL,NULL,'',NULL),(526,'qq',NULL,NULL,214,'false',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','false',NULL,4,'default',0,0,'',NULL,NULL,1,NULL,NULL,NULL,'',NULL),(527,'endeavour1',NULL,NULL,208,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'default',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(528,'te',NULL,NULL,215,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,'default',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(529,'IBM',NULL,NULL,216,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'default',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(530,'Experienced Car Buyer',NULL,NULL,217,'Part Time',NULL,NULL,NULL,'41477_657971128_5557_n_530.jpg',NULL,NULL,NULL,NULL,'Hourly','Su, Sa',NULL,1,'default',0,0,'I am the greatest buyer in the world!','mid_41477_657971128_5557_n_530.jpg','min_41477_657971128_5557_n_530.jpg',10,NULL,NULL,NULL,'',NULL),(531,'Project Manager',NULL,NULL,217,'Yearly',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Annually','M, Tu, W, Th, F',NULL,0,'notdefault',0,0,'',NULL,NULL,55,NULL,NULL,NULL,'',NULL),(532,'OPENLANE',NULL,NULL,219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12,'default',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(533,'VIPbooker',NULL,NULL,220,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,'default',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(534,'asdf',NULL,NULL,221,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,'default',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(535,'emplr@m.com',NULL,NULL,222,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'default',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(536,'aug25@mob.com',NULL,NULL,223,'false',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','false',NULL,0,'default',0,0,'',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL),(537,'sdfsdf',NULL,NULL,198,'false',NULL,NULL,NULL,'Waterfall_537.jpg',NULL,NULL,NULL,NULL,'Annual','false',NULL,0,'notdefault',0,0,'','mid_Waterfall_537.jpg','min_Waterfall_537.jpg',NULL,NULL,NULL,NULL,'',NULL),(540,'House Music',NULL,NULL,224,'Yearly',NULL,NULL,NULL,'deadmau5_540.jpg',NULL,NULL,NULL,NULL,'Hourly','Su, M, Tu, W, Th, F, Sa',NULL,8,'default',0,0,'I want the opportunity to feed music to the soul.','mid_deadmau5_540.jpg','min_deadmau5_540.jpg',76,NULL,NULL,NULL,'Expert Piano player, Mastered Fruitloops Studio, Protools, Abletonlive, Traktor S4 Soundboard',NULL),(541,'JasonsProf',NULL,NULL,225,'Yearly',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Annual','false',NULL,1,'default',0,0,'I love working hard!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(542,'JasonsProf',NULL,NULL,225,'Yearly',NULL,NULL,NULL,'drum-pic_542.jpg',NULL,NULL,NULL,NULL,'Annual','false',NULL,2,'notdefault',0,0,'I love working hard!','mid_drum-pic_542.jpg','min_drum-pic_542.jpg',1,NULL,NULL,NULL,'',NULL),(543,'fsdfsdfs',NULL,NULL,198,'false',NULL,NULL,NULL,'Dock_543.jpg',NULL,NULL,NULL,NULL,'Annual','false',NULL,0,'notdefault',0,0,'','mid_Dock_543.jpg','min_Dock_543.jpg',NULL,NULL,NULL,NULL,'',NULL),(544,'sdfsdf',NULL,NULL,198,'false',NULL,NULL,NULL,'Autumn Leaves_544.jpg',NULL,NULL,NULL,NULL,'Annual','false',NULL,0,'notdefault',0,0,'','mid_Autumn Leaves_544.jpg','min_Autumn Leaves_544.jpg',NULL,NULL,NULL,NULL,'',NULL),(546,'ramsd333',NULL,NULL,198,'false',NULL,NULL,NULL,'Tree_546.jpg',NULL,NULL,NULL,NULL,'Annual','false',NULL,0,'notdefault',0,0,'','mid_Tree_546.jpg','min_Tree_546.jpg',NULL,NULL,NULL,NULL,'',NULL),(551,'Java',NULL,NULL,227,'Part Time',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Hourly','Th, F',NULL,0,'default',0,0,'Love coding and solving problems',NULL,NULL,21,NULL,NULL,NULL,'Merit',''),(554,'louvette_fowler',NULL,NULL,228,'false',NULL,NULL,NULL,'HH_main2_554.jpg',NULL,NULL,NULL,NULL,'Annual','false',NULL,0,'default',0,0,'','mid_HH_main2_554.jpg','min_HH_main2_554.jpg',NULL,NULL,NULL,NULL,'',NULL),(555,'L - Photography',NULL,NULL,228,'false',NULL,NULL,NULL,'2010-06-04_555.jpg',NULL,NULL,NULL,NULL,'Hourly','Su, F, Sa',NULL,0,'notdefault',0,0,'Art is subjective. Its only reason is to tell a story and make you feel \"something\".\r\nIt does not seek to impress, but to express. It does not perform for judgment but to resonate a love.  If it touches you, it is a gift-- for art is simply time given to that place called truth.','mid_2010-06-04_555.jpg','min_2010-06-04_555.jpg',84,NULL,NULL,NULL,'',NULL),(556,'TARR INC.',NULL,NULL,229,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'notdefault',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(557,'TARR INC.',NULL,NULL,229,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'notdefault',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(558,'sa',NULL,NULL,232,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'default',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(559,'sddsfsd',NULL,NULL,233,'false',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Annual','false',NULL,0,'default',0,0,'',NULL,NULL,2,NULL,NULL,NULL,'sdfdsaf sdfsdf',NULL),(560,'sdasd',NULL,NULL,198,'false',NULL,NULL,NULL,'Untitle0999d_560.jpg',NULL,NULL,NULL,NULL,'1','false',NULL,0,'notdefault',0,0,'','mid_Untitle0999d_560.jpg','min_Untitle0999d_560.jpg',NULL,NULL,NULL,NULL,NULL,NULL),(561,'dfg',NULL,NULL,198,'false',NULL,NULL,NULL,'HH_main2_554_561.jpg',NULL,NULL,NULL,NULL,'1','false',NULL,4,'notdefault',0,0,'','mid_HH_main2_554_561.jpg','min_HH_main2_554_561.jpg',NULL,NULL,NULL,NULL,NULL,NULL),(562,'TARR INC.',NULL,NULL,229,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'default',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(563,'DJ r3gan',NULL,NULL,234,'Yearly, Part Time, Hourly, Contract',NULL,NULL,NULL,'deadmau5_563.jpg',NULL,NULL,NULL,NULL,'Hourly','Su, M, Tu, W, Th, F, Sa',NULL,14,'default',0,0,'I have graduated from the L.A. school of recording and have a degree in audio engineering and music productions.','mid_deadmau5_563.jpg','min_deadmau5_563.jpg',3,NULL,NULL,NULL,'',NULL),(564,'RJ Model Ships',NULL,NULL,235,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'default',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(565,'dfsdf',NULL,NULL,197,'false',NULL,NULL,NULL,'Tree_565.jpg',NULL,NULL,NULL,NULL,'Annual','false',NULL,0,'notdefault',0,0,'','mid_Tree_565.jpg','min_Tree_565.jpg',3,NULL,NULL,NULL,'',NULL),(566,'sda',NULL,NULL,197,'Hourly, Contract',NULL,NULL,NULL,'Waterfall_566.jpg',NULL,NULL,NULL,NULL,'Commission','Tu, W, Th',NULL,0,'notdefault',0,0,'sasa a s asasa','mid_Waterfall_566.jpg','min_Waterfall_566.jpg',4,NULL,NULL,NULL,'sadasdsad',NULL),(567,'sat',NULL,NULL,237,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,'default',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(568,'test1',NULL,NULL,238,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,'default',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(569,'aaaaaaaa',NULL,NULL,197,'false',NULL,NULL,NULL,'Tree_569.jpg',NULL,NULL,NULL,NULL,'Annual','false',NULL,4,'notdefault',0,0,'','mid_Tree_569.jpg','min_Tree_569.jpg',2,NULL,NULL,NULL,'',NULL),(570,'as',NULL,NULL,239,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'default',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(571,'xxxxxx',NULL,NULL,197,'false',NULL,NULL,NULL,'Tree_571.jpg',NULL,NULL,NULL,NULL,'Annual','false',NULL,0,'notdefault',0,0,'','mid_Tree_571.jpg','min_Tree_571.jpg',3,NULL,NULL,NULL,'',NULL),(572,'saty',NULL,NULL,241,'false',NULL,NULL,NULL,'Garden_572.jpg',NULL,NULL,NULL,NULL,'1','false',NULL,0,'default',0,0,'','mid_Garden_572.jpg','min_Garden_572.jpg',3,NULL,NULL,NULL,'',NULL),(573,'satya',NULL,NULL,242,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'default',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(574,'Jason',NULL,NULL,234,'false',NULL,NULL,NULL,'Green Sea Turtle_574.jpg',NULL,NULL,NULL,NULL,'1','false',NULL,2,'notdefault',0,0,'','mid_Green Sea Turtle_574.jpg','min_Green Sea Turtle_574.jpg',NULL,NULL,NULL,NULL,'',NULL),(575,'satya',NULL,NULL,234,'false',NULL,NULL,NULL,'Garden_575.jpg',NULL,NULL,NULL,NULL,'Annual','false',NULL,0,'notdefault',0,0,'aaa','mid_Garden_575.jpg','min_Garden_575.jpg',3,NULL,NULL,NULL,NULL,NULL),(576,'satyaTest',NULL,NULL,234,'false',NULL,NULL,NULL,'Waterfall_576.jpg',NULL,NULL,NULL,NULL,'1','false',NULL,0,'notdefault',0,0,'','mid_Waterfall_576.jpg','min_Waterfall_576.jpg',NULL,NULL,NULL,NULL,NULL,NULL),(577,'satya',NULL,NULL,246,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'default',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(578,'satya',NULL,NULL,247,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'default',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(579,'pulkam1@mob.com',NULL,NULL,248,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'default',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(580,'satya',NULL,NULL,197,'false',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','false',NULL,0,'notdefault',0,0,'',NULL,NULL,4,NULL,NULL,NULL,'',NULL),(581,'ss',NULL,NULL,197,'false',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','false',NULL,0,'notdefault',0,0,'',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL),(582,'test',NULL,NULL,249,'false',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','false',NULL,0,'default',0,0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(583,'test',NULL,NULL,250,'false',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','false',NULL,0,'default',0,0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(584,'test',NULL,NULL,251,'false',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','false',NULL,0,'default',0,0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(585,'ggg',NULL,NULL,252,'false',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','false',NULL,0,'default',0,0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(586,'sss',NULL,NULL,197,'false',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','false',NULL,0,'notdefault',0,0,'',NULL,NULL,4,NULL,NULL,NULL,'',NULL),(587,'JasonRoozt',NULL,NULL,253,'false',NULL,NULL,NULL,'failure-secret-to-success_587.jpg',NULL,NULL,NULL,NULL,'1','false',NULL,2,'default',0,0,'','mid_failure-secret-to-success_587.jpg','min_failure-secret-to-success_587.jpg',NULL,NULL,NULL,NULL,'',NULL),(588,'Testing',NULL,NULL,254,'false',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','false',NULL,0,'default',0,0,'',NULL,NULL,3,NULL,NULL,NULL,'',NULL),(589,'asd',NULL,NULL,255,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'default',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(590,'TARR INC',NULL,NULL,256,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'default',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(591,'MoBJason',NULL,NULL,257,'false',NULL,NULL,NULL,'There\'s_a_bug_in_your_ear_dude_591.jpg',NULL,NULL,NULL,NULL,'Annual','false',NULL,0,'default',0,0,'','mid_There\'s_a_bug_in_your_ear_dude_591.jpg','min_There\'s_a_bug_in_your_ear_dude_591.jpg',1,NULL,NULL,NULL,'',NULL),(592,'Java Jerry',NULL,NULL,258,'Yearly',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Hourly','M, Tu',NULL,1,'default',0,0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(593,'Music',NULL,NULL,260,'Hourly',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Hourly','F, Sa',NULL,0,'default',0,0,'',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL),(594,'end',NULL,NULL,261,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'default',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(595,'Software Engineer ( Java Apps)',NULL,NULL,262,'Yearly, Part Time, Hourly, Contract',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','Su, Sa',NULL,0,'default',0,0,'',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL),(596,'pppp',NULL,NULL,263,'false',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','false',NULL,0,'default',0,0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(597,'Programmer',NULL,NULL,264,'Yearly',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Annual','M, Tu, W, Th, F',NULL,0,'default',0,0,'',NULL,NULL,21,NULL,NULL,NULL,'',NULL),(598,'dsfsd',NULL,NULL,197,'false',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','false',NULL,0,'notdefault',0,0,'',NULL,NULL,3,NULL,NULL,NULL,'',''),(599,'Spring Developer',NULL,NULL,265,'Yearly',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Annual','M, Tu, W, Th, F',NULL,0,'default',0,0,'',NULL,NULL,25,NULL,NULL,NULL,NULL,''),(600,'John',NULL,NULL,266,'Yearly, Contract',NULL,NULL,NULL,'playoffs_600.jpg',NULL,NULL,NULL,NULL,'Annual','M, Tu, W, Th, F',NULL,0,'default',0,0,'Test test','mid_playoffs_600.jpg','min_playoffs_600.jpg',25,NULL,NULL,NULL,'','200000 / year'),(601,'DecisionLink',NULL,NULL,267,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'default',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

/*!50003 SET @SAVE_SQL_MODE=@@SQL_MODE*/;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_VALUE_ON_ZERO" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`mob`@`localhost` */ /*!50003 TRIGGER `empprofile_insert` AFTER INSERT ON `profile` FOR EACH ROW BEGIN
		DECLARE roleid INTEGER;
		DECLARE city VARCHAR(100);
		DECLARE keyrows INTEGER;
		INSERT INTO triglog (trigType) VALUES ('empprofile_insert');
		SELECT count(*) INTO roleid FROM user_role r WHERE r.user_id=NEW.user_id and r.role_id=2;
		IF roleid>0 THEN
			SELECT u.city INTO city FROM user u, profile p where p.user_id=u.id and p.id=NEW.id;
			SELECT count(*) INTO keyrows FROM itemcount i WHERE i.searchTerm like city  and i.itemType=2;
			IF keyrows>0 THEN
				UPDATE itemcount i SET i.count=i.count+1 WHERE  i.searchTerm like city  and i.itemType=2;
			ELSE
				IF city != '' THEN
					INSERT INTO itemcount (itemType, searchTerm, count) VALUES (2,city,1);
				END IF;
			END IF;
		END IF;
	END */;;

DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@SAVE_SQL_MODE*/;

--
-- Table structure for table `profile_group_role`
--

DROP TABLE IF EXISTS `profile_group_role`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `profile_group_role` (
  `id` bigint(20) NOT NULL auto_increment,
  `groupid` bigint(20) default '0',
  `roleid` bigint(20) NOT NULL,
  `profileid` bigint(20) NOT NULL,
  PRIMARY KEY  USING BTREE (`id`),
  KEY `fk_profile_group_role_groupid` (`groupid`),
  KEY `fk_profile_group_role_roleid` (`roleid`),
  KEY `fk_profile_group_role_profileid` (`profileid`),
  CONSTRAINT `fk_profile_group_role_profileid` FOREIGN KEY (`profileid`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_profile_group_role_roleid` FOREIGN KEY (`roleid`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `profile_group_role`
--

LOCK TABLES `profile_group_role` WRITE;
/*!40000 ALTER TABLE `profile_group_role` DISABLE KEYS */;
INSERT INTO `profile_group_role` VALUES (1,1,5,517),(2,2,5,519),(3,19,5,518),(4,11,5,513),(6,NULL,5,515),(7,NULL,5,521),(8,NULL,5,522),(9,11,5,523),(11,11,5,524),(13,13,5,518),(14,14,5,513),(16,NULL,5,513),(17,19,5,513),(19,19,5,513),(20,NULL,5,514),(22,NULL,5,514),(23,NULL,5,514),(24,NULL,5,514),(25,NULL,5,514),(26,NULL,5,518),(27,NULL,5,518),(32,13,5,513),(33,13,5,513),(34,13,5,513),(35,13,5,513),(36,13,4,514),(37,NULL,5,518),(38,29,5,563),(39,30,5,563),(40,31,5,533),(41,32,5,533),(42,33,5,600);
/*!40000 ALTER TABLE `profile_group_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qualification`
--

DROP TABLE IF EXISTS `qualification`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `qualification` (
  `id` int(10) unsigned NOT NULL,
  `names` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `qualification`
--

LOCK TABLES `qualification` WRITE;
/*!40000 ALTER TABLE `qualification` DISABLE KEYS */;
INSERT INTO `qualification` VALUES (1,'Bachelor of Engineering'),(2,'BCA'),(3,'MCA'),(4,'Phd'),(5,'M.E');
/*!40000 ALTER TABLE `qualification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reminders`
--

DROP TABLE IF EXISTS `reminders`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `reminders` (
  `id` bigint(20) NOT NULL auto_increment,
  `description` varchar(45) default NULL,
  `time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `user_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_reminders_user` (`user_id`),
  CONSTRAINT `fk_reminders_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `reminders`
--

LOCK TABLES `reminders` WRITE;
/*!40000 ALTER TABLE `reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resultcriteria`
--

DROP TABLE IF EXISTS `resultcriteria`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `resultcriteria` (
  `id` bigint(20) NOT NULL auto_increment,
  `allmatch` tinyint(1) default NULL,
  `searchcriteria_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_resultcriteria_searchcriteria` (`searchcriteria_id`),
  CONSTRAINT `fk_resultcriteria_searchcriteria` FOREIGN KEY (`searchcriteria_id`) REFERENCES `searchcriteria` (`opportunity_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `resultcriteria`
--

LOCK TABLES `resultcriteria` WRITE;
/*!40000 ALTER TABLE `resultcriteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `resultcriteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ROLE_EMPLOYER'),(2,'ROLE_EMPLOYEE'),(3,'ROLE_ADMIN'),(4,'ROLE_GROUPADMIN'),(5,'ROLE_GROUPOWNER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `salary` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `range` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `salary`
--

LOCK TABLES `salary` WRITE;
/*!40000 ALTER TABLE `salary` DISABLE KEYS */;
INSERT INTO `salary` VALUES (1,'Under 30k'),(2,'30k-40k'),(3,'40k-50k'),(4,'50k-75k'),(5,'75k-100k'),(6,'100k-150k'),(7,'150k+'),(8,'DOE');
/*!40000 ALTER TABLE `salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salarytype`
--

DROP TABLE IF EXISTS `salarytype`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `salarytype` (
  `id` bigint(20) NOT NULL auto_increment,
  `type` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `salarytype`
--

LOCK TABLES `salarytype` WRITE;
/*!40000 ALTER TABLE `salarytype` DISABLE KEYS */;
INSERT INTO `salarytype` VALUES (1,'Annual'),(2,'Hourly'),(3,'Commission');
/*!40000 ALTER TABLE `salarytype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searchcriteria`
--

DROP TABLE IF EXISTS `searchcriteria`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `searchcriteria` (
  `allmatch` tinyint(1) default NULL,
  `opportunity_id` bigint(20) NOT NULL,
  PRIMARY KEY  (`opportunity_id`),
  KEY `fk_criteria_opportunity` (`opportunity_id`),
  CONSTRAINT `fk_criteria_opportunity` FOREIGN KEY (`opportunity_id`) REFERENCES `opportunity` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `searchcriteria`
--

LOCK TABLES `searchcriteria` WRITE;
/*!40000 ALTER TABLE `searchcriteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `searchcriteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sentbox`
--

DROP TABLE IF EXISTS `sentbox`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `sentbox` (
  `id` bigint(20) NOT NULL auto_increment,
  `message` varchar(250) NOT NULL,
  `subject` varchar(45) default NULL,
  `sender_id` bigint(20) NOT NULL,
  `sentdate` datetime default NULL,
  `threadid` bigint(20) default NULL,
  `senderEmailid` varchar(75) default NULL,
  `profile_name` varchar(75) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_sentbox_user` (`sender_id`),
  CONSTRAINT `fk_sentbox_user` FOREIGN KEY (`sender_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `sentbox`
--

LOCK TABLES `sentbox` WRITE;
/*!40000 ALTER TABLE `sentbox` DISABLE KEYS */;
INSERT INTO `sentbox` VALUES (1,'test!','Test',202,'2010-06-23 13:14:57',NULL,NULL,'JasonsProfile'),(2,'test! TESTTTT','RE:Test',202,'2010-06-23 13:15:26',NULL,NULL,'JasonsProfile'),(3,'hi','hi',213,'2010-07-14 04:47:42',NULL,'suresh','qq'),(4,'hi from endeavour','hi from endeavour',199,'2010-07-15 02:33:10',NULL,'sunitha','sunitha.s profile'),(6,'Rakesh profile has shown interest in the opportunity trytrytr','Interest in opportunity',198,'2010-08-23 00:08:23',NULL,'emplr@m.com','emplr@m.com'),(7,'test! again!','RE:Test',202,'2010-11-10 16:14:04',NULL,NULL,'JasonsProfile'),(8,'as','as',197,'2010-11-24 03:35:32',NULL,NULL,'asdf'),(9,'ssssssssssssssssss','sssss',197,'2010-11-24 03:36:15',NULL,NULL,'sunitha.s profile'),(10,'dddddd','ddd',197,'2010-11-24 03:45:36',NULL,NULL,'TARR INC.'),(11,'sssssssssssssssss','sss',197,'2010-11-24 03:46:18',NULL,NULL,'endeavour'),(12,'asdasda','asdas',234,'2010-11-25 03:42:08',NULL,NULL,'Rakesh profile'),(13,'dfgdfgfdgdf','dfgdfg',234,'2010-11-25 04:14:11',NULL,NULL,'DJ r3gan'),(14,'test','test!',234,'2010-12-08 23:30:42',NULL,NULL,'JasonsProfile'),(15,'suresh profile has marked the opportunity Administrative Assistant as a favorite.','Opportunity marked as favorite',197,'2011-01-11 22:32:41',NULL,'OPENLANE','OPENLANE'),(16,'suresh profile has shown interest in the opportunity Administrative Assistant','Interest in opportunity',197,'2011-01-11 22:32:48',NULL,'OPENLANE','OPENLANE'),(17,'suresh profile has marked the opportunity Administrative Assistant as a favorite.','Opportunity marked as favorite',197,'2011-01-11 22:33:06',NULL,'OPENLANE','OPENLANE'),(18,'suresh profile has shown interest in the opportunity asdasdasd','Interest in opportunity',197,'2011-01-11 22:33:23',NULL,'emplr@m.com','emplr@m.com'),(19,'suresh profile has marked the opportunity asdasdasd as a favorite.','Opportunity marked as favorite',197,'2011-01-11 22:33:29',NULL,'emplr@m.com','emplr@m.com'),(20,'VIPbooker has marked the opportunity C++ Developer as a favorite.','Opportunity marked as favorite',220,'2011-03-01 07:50:43',NULL,'VIPbooker','VIPbooker'),(21,'TEST','Hello',256,'2011-03-16 13:43:17',NULL,'Timothy','House Music');
/*!40000 ALTER TABLE `sentbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `skills` (
  `id` bigint(20) NOT NULL auto_increment,
  `skillname` varchar(45) default NULL,
  `category_id` bigint(20) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `skills_fk_category_id` (`category_id`),
  CONSTRAINT `skills_fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `skillscategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` VALUES (1,'Java',2);
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skillscategory`
--

DROP TABLE IF EXISTS `skillscategory`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `skillscategory` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(250) default NULL,
  `industry_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `skillscategory_fk_industry_id` (`industry_id`),
  CONSTRAINT `skillscategory_fk_industry_id` FOREIGN KEY (`industry_id`) REFERENCES `industry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `skillscategory`
--

LOCK TABLES `skillscategory` WRITE;
/*!40000 ALTER TABLE `skillscategory` DISABLE KEYS */;
INSERT INTO `skillscategory` VALUES (1,'sdfsdfafd',12),(2,'Abc',12),(3,'aa',9),(4,'s',8),(5,'Java_category',1),(6,'c',26),(7,'New_java_Category',3),(8,'a',4),(9,'New_category',1),(10,'aa',12),(11,'Java_Category',1),(12,'New_JavaCategory',3),(13,'Java_Category12',97),(14,'Hibernate_Category',97),(15,'java_J2ee',1),(16,'Java',1),(17,'aa',2),(18,'New_cat',1),(19,'java',35),(20,'s',1),(21,'java',2),(22,'Java',3),(23,'',3),(24,'',3),(25,'',3),(26,'',3),(27,'',3),(28,'',3),(29,'',3),(30,'',3),(31,'',3),(32,'Javaaaa',3),(33,'s',2),(34,'Java',94),(35,'Hibernate',92),(36,'java',88),(37,'s',86),(38,'javajava',3),(39,'Java',2),(40,'X',NULL),(41,'df',NULL),(42,'fsd',NULL),(43,'fsdf',NULL),(44,'sdfsd',NULL),(45,'asdas',NULL),(46,'fsdf',NULL),(47,'sdfsdf',NULL),(48,'sdfsdf',NULL),(49,'dfg',NULL),(50,'dsfds',NULL),(51,'sd',NULL),(52,'sadas',NULL),(53,'SADAS',NULL),(54,'WERWE',NULL),(55,'fsdf',NULL),(56,'sdfsdf',NULL),(57,'dsf',NULL),(58,'dfsdf',NULL),(59,'sd',NULL),(60,'as',NULL),(61,'asdasd',NULL),(62,'asdasd',NULL),(63,'czxc',NULL),(64,'Java',NULL),(65,'Java',NULL),(66,'Web Development',NULL),(67,'sdf',NULL),(68,'er',NULL),(69,'IT',NULL),(70,'Computer',NULL),(71,'Musix',NULL),(72,'Music',NULL),(73,'aw',NULL),(74,'asdas',NULL),(75,'sadasdas',NULL),(76,'aaa',NULL),(77,'Satya',NULL),(78,'Satya',NULL),(79,'sdfs',NULL),(80,'sasd',NULL),(81,'asd',NULL),(82,'test',NULL),(83,'test',NULL),(84,'sa',NULL),(85,'hi',NULL),(86,'Programming',NULL),(87,'DB',NULL);
/*!40000 ALTER TABLE `skillscategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skillsneeded_opportunity`
--

DROP TABLE IF EXISTS `skillsneeded_opportunity`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `skillsneeded_opportunity` (
  `id` bigint(20) NOT NULL auto_increment,
  `skillname` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `skillsneeded_opportunity`
--

LOCK TABLES `skillsneeded_opportunity` WRITE;
/*!40000 ALTER TABLE `skillsneeded_opportunity` DISABLE KEYS */;
INSERT INTO `skillsneeded_opportunity` VALUES (1,'Auditing'),(2,'Brake Alignments'),(3,'Building Maintenance'),(4,'C++ Programming'),(5,'Carpet Laying'),(6,'Cleaning'),(7,'CNC Machine Composite'),(8,'Cooking'),(9,'Counseling'),(10,'Customer Service'),(11,'Desk Top Publishing'),(12,'Drill Press Operation'),(13,'Driving'),(14,'Editing'),(15,'Electronic Repair'),(16,'Engineering'),(17,'Filing'),(18,'Hammering'),(19,'Interviewing'),(20,'LAN Administration'),(21,'Management'),(22,'Mechanical Drafting'),(23,'Metal Fabrication'),(24,'Microsoft'),(25,'Word Operation'),(26,'Payroll Accounting'),(27,'Public Speaking'),(28,'Scheduling'),(29,'Soldering'),(30,'Surgery'),(31,'Teaching'),(32,'Technical Writing'),(33,'Telemarketing'),(34,'Total Quality'),(35,'Typing'),(36,'Welding'),(37,'WordPerfect');
/*!40000 ALTER TABLE `skillsneeded_opportunity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topics`
--

DROP TABLE IF EXISTS `topics`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `topics` (
  `id` bigint(20) unsigned NOT NULL,
  `topic` text,
  `topicdate` datetime default NULL,
  `group_id` bigint(20) unsigned default NULL,
  `details` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `topics`
--

LOCK TABLES `topics` WRITE;
/*!40000 ALTER TABLE `topics` DISABLE KEYS */;
INSERT INTO `topics` VALUES (1,'java_topics',NULL,54,'Details'),(2,'HibernateTopics',NULL,54,'GG'),(3,'sssssssssssssssss',NULL,53,'dddddddddddd'),(4,'dddddddddddd',NULL,53,'ttttttttttttttttttt');
/*!40000 ALTER TABLE `topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topicsusers`
--

DROP TABLE IF EXISTS `topicsusers`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `topicsusers` (
  `id` bigint(20) NOT NULL auto_increment,
  `topicsid` bigint(20) NOT NULL,
  `userid` bigint(20) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_topics_topicsId` (`topicsid`),
  KEY `fk_topics_users_userid` (`userid`),
  CONSTRAINT `fk_topics_topicsId` FOREIGN KEY (`topicsid`) REFERENCES `grouptopics` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_topics_users_userid` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `topicsusers`
--

LOCK TABLES `topicsusers` WRITE;
/*!40000 ALTER TABLE `topicsusers` DISABLE KEYS */;
INSERT INTO `topicsusers` VALUES (2,2,203),(3,3,203),(4,4,203),(9,9,198),(10,10,198),(11,11,198),(12,12,198),(13,13,198),(14,14,198),(15,15,202),(16,16,197),(17,17,197),(18,18,197),(19,19,197),(20,20,197),(21,21,197),(22,22,197);
/*!40000 ALTER TABLE `topicsusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training`
--

DROP TABLE IF EXISTS `training`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `training` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(45) default NULL,
  `profile_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_training_profileid` (`profile_id`),
  CONSTRAINT `fk_training_profileid` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `training`
--

LOCK TABLES `training` WRITE;
/*!40000 ALTER TABLE `training` DISABLE KEYS */;
INSERT INTO `training` VALUES (1,'CPR',518),(2,'as',519),(3,'Butterfly Productions Training Program',540),(4,'Worked and Studied with Michael Hartman',555),(5,'Internship at Mau5trap studios',563),(6,'ff',565),(7,'f',565),(8,'aaa',575),(9,'safsassa',598),(10,'asdas',598),(11,'dfdedfsdfsdf',598),(12,'sdfsd',598),(13,'dfsd',598),(14,'sdfsd',598),(15,'sdfsdf',598),(16,'sdfsdf',598),(17,'sdfsdf',598),(18,'sdfsdf',598);
/*!40000 ALTER TABLE `training` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `triglog`
--

DROP TABLE IF EXISTS `triglog`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `triglog` (
  `id` bigint(20) NOT NULL auto_increment,
  `trigType` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=95 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `triglog`
--

LOCK TABLES `triglog` WRITE;
/*!40000 ALTER TABLE `triglog` DISABLE KEYS */;
INSERT INTO `triglog` VALUES (1,'empr_industry_insert- INSERT'),(2,'empr_industry_insert- INSERT'),(3,'empr_industry_insert- INSERT'),(4,'empr_industry_insert- INSERT'),(5,'empr_industry_insert- INSERT'),(6,'empr_industry_insert- INSERT'),(7,'empr_industry_insert- INSERT'),(8,'empr_industry_insert- INSERT'),(9,'empr_industry_insert- INSERT'),(10,'empr_industry_insert- INSERT'),(11,'empr_industry_insert- INSERT'),(12,'empr_industry_insert- INSERT'),(13,'empr_industry_insert- INSERT'),(14,'empr_industry_insert- INSERT'),(15,'empprofile_insert'),(16,'empprofile_insert'),(17,'empprofile_insert'),(18,'empprofile_insert'),(19,'empprofile_insert'),(20,'empprofile_insert'),(21,'empprofile_insert'),(22,'empprofile_insert'),(23,'empprofile_insert'),(24,'empprofile_insert'),(25,'empprofile_insert'),(26,'empprofile_insert'),(27,'empprofile_insert'),(28,'empprofile_insert'),(29,'empprofile_insert'),(30,'empprofile_insert'),(31,'empprofile_insert'),(32,'empprofile_insert'),(33,'empprofile_insert'),(34,'empprofile_insert'),(35,'empprofile_insert'),(36,'empprofile_insert'),(37,'empprofile_insert'),(38,'empprofile_insert'),(39,'empprofile_insert'),(40,'empprofile_insert'),(41,'empprofile_insert'),(42,'empprofile_insert'),(43,'empprofile_insert'),(44,'empprofile_insert'),(45,'empprofile_insert'),(46,'empprofile_insert'),(47,'empprofile_insert'),(48,'empprofile_insert'),(49,'empprofile_insert'),(50,'empprofile_insert'),(51,'empprofile_insert'),(52,'empprofile_insert'),(53,'empprofile_insert'),(54,'empprofile_insert'),(55,'empprofile_insert'),(56,'empprofile_insert'),(57,'empprofile_insert'),(58,'empprofile_insert'),(59,'empprofile_insert'),(60,'empprofile_insert'),(61,'empprofile_insert'),(62,'empprofile_insert'),(63,'empprofile_insert'),(64,'empprofile_insert'),(65,'empprofile_insert'),(66,'empprofile_insert'),(67,'empprofile_insert'),(68,'empprofile_insert'),(69,'empprofile_insert'),(70,'empprofile_insert'),(71,'empprofile_insert'),(72,'empprofile_insert'),(73,'empprofile_insert'),(74,'empprofile_insert'),(75,'empprofile_insert'),(76,'empprofile_insert'),(77,'empprofile_insert'),(78,'empprofile_insert'),(79,'empprofile_insert'),(80,'empprofile_insert'),(81,'empprofile_insert'),(82,'empprofile_insert'),(83,'empprofile_insert'),(84,'empprofile_insert'),(85,'empprofile_insert'),(86,'empprofile_insert'),(87,'empprofile_insert'),(88,'empprofile_insert'),(89,'empprofile_insert'),(90,'empprofile_insert'),(91,'empprofile_insert'),(92,'empprofile_insert'),(93,'empprofile_insert'),(94,'empprofile_insert');
/*!40000 ALTER TABLE `triglog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL auto_increment,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) default NULL,
  `firstname` varchar(45) default NULL,
  `lastname` varchar(45) default NULL,
  `address` varchar(45) default NULL,
  `city` varchar(45) default NULL,
  `sex` varchar(45) default NULL,
  `state` varchar(45) default NULL,
  `email` varchar(45) default NULL,
  `dob` date default NULL,
  `age` int(11) default '0',
  `zipcode` varchar(45) default NULL,
  `skypeid` varchar(100) default NULL,
  `picture` varchar(250) default NULL,
  `phonenumber` varchar(45) default NULL,
  `flagged` tinyint(4) default '0',
  `flagdelete` tinyint(4) default '0',
  `flagcomment` varchar(500) default NULL,
  `dob1` varchar(45) default NULL,
  `dobCheck` tinyint(1) default '0',
  `address1` varchar(45) default NULL,
  `address2` varchar(45) default NULL,
  `missionstatement` varchar(200) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=268 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (197,'a@a.com','96niR3fsIyEsVNejULxb6lR3/bs=','suresh','s',NULL,'a','Female','1',NULL,'2010-06-09',0,'','',NULL,'',0,0,NULL,NULL,0,'','',NULL),(198,'b@b.com','96niR3fsIyEsVNejULxb6lR3/bs=','Rakesh','Sharma',NULL,'Bangalore','Male','1',NULL,NULL,0,'','',NULL,'',1,0,NULL,NULL,0,'','',NULL),(199,'e@e.com','59DcbTbOo2exycyXrYG0KeQ0dEw=',NULL,NULL,NULL,'e',NULL,'1',NULL,NULL,0,'','',NULL,'',0,0,NULL,NULL,0,'','',''),(200,'i@i.com','5u4/1cL1P0+qs/PD0H+vcvIyie0=',NULL,NULL,NULL,'i',NULL,'1',NULL,NULL,0,'','',NULL,'',0,0,NULL,NULL,0,'','',''),(201,'employer16@techendeavour.com','ybtvycaQK/fw2YLKbMqalFFm/7g=',NULL,NULL,NULL,'',NULL,'1',NULL,NULL,0,'','',NULL,'',0,0,NULL,NULL,0,'','',''),(202,'jjoseph@keystreams.com','ZBlQhi7fIMXa4K/kDg6lgHYa6/8=','Jason','Joseph',NULL,'Los Angeles','Male','CA',NULL,'1985-02-01',0,'90012','Musicalmindz',NULL,'858-583-6281',0,0,NULL,NULL,0,'138 N. Beaudry Ave.','',NULL),(203,'emp@mob.com','fEqNCco3Yq9h5ZUglD3CZJT4lBs=','employee','employee',NULL,'','Male','1',NULL,NULL,0,'','',NULL,'',0,0,NULL,NULL,0,'','',NULL),(204,'emp@mob.com','fEqNCco3Yq9h5ZUglD3CZJT4lBs=','employee','employee',NULL,'','Male','1',NULL,NULL,0,'','',NULL,'',0,0,NULL,NULL,0,'','',NULL),(206,'forum@mob.com','fEqNCco3Yq9h5ZUglD3CZJT4lBs=','forum','foru',NULL,'','Male','1',NULL,NULL,0,'','',NULL,'',0,0,NULL,NULL,0,'','',NULL),(207,'admin@mob.com','3ZRwlSi7HIPQjzCI1AQ/R0KJH08=','admin','admin',NULL,'admin','Male','1',NULL,NULL,0,'','admin',NULL,'',0,0,NULL,NULL,0,'admin','admin',NULL),(208,'e1@e1.com','96niR3fsIyEsVNejULxb6lR3/bs=',NULL,NULL,NULL,'',NULL,'1',NULL,NULL,0,'','asd',NULL,'',0,0,NULL,NULL,0,'asd','asd','asd'),(209,'s@s.com','96niR3fsIyEsVNejULxb6lR3/bs=','s','s',NULL,'','Male','1',NULL,NULL,0,'','',NULL,'',0,0,NULL,NULL,0,'','',NULL),(210,'e3@e3.com','96niR3fsIyEsVNejULxb6lR3/bs=',NULL,NULL,NULL,'',NULL,'1',NULL,NULL,0,'','',NULL,'',0,0,NULL,NULL,0,'','',''),(211,'aq@aq.com','96niR3fsIyEsVNejULxb6lR3/bs=','aq','aq',NULL,'','Male','1',NULL,NULL,0,'','',NULL,'',0,0,NULL,NULL,0,'','',NULL),(212,'eq@eq.com','96niR3fsIyEsVNejULxb6lR3/bs=',NULL,NULL,NULL,'',NULL,'1',NULL,NULL,0,'','',NULL,'',0,0,NULL,NULL,0,'','',''),(213,'sunitha.s@techendeavour.com','96niR3fsIyEsVNejULxb6lR3/bs=','sunitha','s',NULL,'','Male','1',NULL,NULL,0,'','',NULL,'',0,0,NULL,NULL,0,'','',NULL),(214,'suresh.siddi@techendeavour.com','96niR3fsIyEsVNejULxb6lR3/bs=','suresh','siddi',NULL,'','Male','1',NULL,NULL,0,'','',NULL,'',0,0,NULL,NULL,0,'','',NULL),(215,'te@te.com','96niR3fsIyEsVNejULxb6lR3/bs=',NULL,NULL,NULL,'',NULL,'1',NULL,NULL,0,'','',NULL,'',0,0,NULL,NULL,0,'','',''),(216,'ibm@ibm.com','96niR3fsIyEsVNejULxb6lR3/bs=',NULL,NULL,NULL,'',NULL,'1',NULL,NULL,0,'','',NULL,'',0,0,NULL,NULL,0,'','',''),(217,'chammond99@yahoo.com','2iT1SgKawuYYfTl7V61O0yvhhw0=','Clark','Hammond',NULL,'','Male','1',NULL,NULL,0,'','',NULL,'',0,0,NULL,NULL,0,'','',NULL),(218,'joseph@keystreams.com','7ns76leBLqfwZfrr+MkNIwZRaxk=','Jason','Joseph',NULL,'Los Angeles','Male','CA',NULL,'1985-02-01',0,'90012','Musicalmindz',NULL,'858-583-6281',0,0,NULL,NULL,0,'138 N. Beaudry Ave.','',NULL),(219,'clark@openlane.com','hn37LD3hFWvxrZExBFc11d+qU04=',NULL,NULL,NULL,'Redwood City',NULL,'CA',NULL,NULL,0,'94538','',NULL,'',0,0,NULL,NULL,0,'2200 Bridge Parkway ','',''),(220,'jason@vipbooker.com','7ns76leBLqfwZfrr+MkNIwZRaxk=',NULL,NULL,NULL,'Los Angeles',NULL,'CA',NULL,NULL,0,'90012','Musicalmindz','Koala_220.jpg','858-583-6281',0,0,NULL,NULL,0,'138 N. Beaudry Ave.','138 N. Beaudry Ave.','Testing issue! Testing issue!Testing issue!Testing issue!'),(221,'test@emplr.com','fEqNCco3Yq9h5ZUglD3CZJT4lBs=',NULL,NULL,NULL,'',NULL,'1',NULL,NULL,0,'','',NULL,'',0,0,NULL,NULL,0,'','',''),(222,'emplr@m.com','fEqNCco3Yq9h5ZUglD3CZJT4lBs=',NULL,NULL,NULL,'',NULL,'1',NULL,NULL,0,'','',NULL,'',0,0,NULL,NULL,0,'','','asdsdfsdf sdfsddddddddddd'),(223,'aug25@mob.com','fEqNCco3Yq9h5ZUglD3CZJT4lBs=','aug25@mob.com','aug25@mob.com',NULL,'','Male','1',NULL,NULL,0,'','',NULL,'',0,0,NULL,NULL,0,'aug25@mob.com','',NULL),(224,'rfowler14@gmail.com','Vx6Enh0sAVjorL/Y1Vw92yYe2Ao=','Timothy','House',NULL,'Los Angeles','Male','CA',NULL,'1990-09-10',0,'92010','',NULL,'858-344-2478',0,0,NULL,NULL,0,'4982 Rodeo Dr','',NULL),(225,'jjoseph@myownbriefcase.com','7ns76leBLqfwZfrr+MkNIwZRaxk=','Jason','Joseph',NULL,'Los Angeles','Male','CA',NULL,'1985-02-01',0,'90012','Musicalmindz',NULL,'858-583-6281',0,0,NULL,NULL,0,'138 N. Beaudry Ave.','',NULL),(226,'vikram.report@gmail.com','fEqNCco3Yq9h5ZUglD3CZJT4lBs=','vikram','m',NULL,'','Male','1',NULL,NULL,0,'','',NULL,'',0,0,NULL,NULL,0,'','',NULL),(227,'jerrykurian@gmail.com','7ns76leBLqfwZfrr+MkNIwZRaxk=','Jerry','Kurian',NULL,'','Male','1',NULL,NULL,0,'','',NULL,'',0,0,NULL,NULL,0,'','',NULL),(228,'sales@hapahaolistore.com','i7H8zDu8dFj/vJ7Rq24GHhFjbqs=','Louvette','Fowler',NULL,'Del Mar','Female','CA',NULL,'1900-04-02',0,'92014','',NULL,'(858) 759-9173',0,0,NULL,NULL,0,'2683 Via de la Valle','Suite G112',NULL),(229,'rfowlerm3@yahoo.com','3rZpnk0bpMDCBQqxm6E0RJBFEnI=',NULL,NULL,NULL,'Del Mar',NULL,'CA',NULL,NULL,0,'92067','rfowlerm3',NULL,'858-354-7363',0,0,NULL,NULL,0,'2683 Via de la Valle #G516','',''),(230,'rfowlerm4@yahoo.com','3rZpnk0bpMDCBQqxm6E0RJBFEnI=',NULL,NULL,NULL,'Del Mar',NULL,'CA',NULL,NULL,0,'92067','rfowlerm3',NULL,'858-354-7363',0,0,NULL,NULL,0,'2683 Via de la Valle #G516','',''),(231,'satya@mob.com','gD3s3X7hQGpyxc8mWpRsDTIo9qM=',NULL,NULL,NULL,'as',NULL,'1',NULL,NULL,0,'','','Dock_231.jpg','',0,0,NULL,NULL,0,'as','','as asdasd asda asda aaa aaaa dasd as asd asd asdasas a asa sdasdasd asdasdasdasd asd asd asdas'),(232,'satya1@mob.com','XdTr2sYmCcg093aPAihreYvYKjg=',NULL,NULL,NULL,'asdas',NULL,'1',NULL,NULL,0,'','','Frangipani Flowers_232.jpg','',0,0,NULL,NULL,0,'sdfas','asda','sdf sdfsdfsd f sdfas asd asd gjhghj gjkghj jhg s sdasd'),(233,'sa@m.com','fEqNCco3Yq9h5ZUglD3CZJT4lBs=','as','dasd',NULL,'','Male','1',NULL,NULL,0,'','',NULL,'',0,0,NULL,NULL,0,'','',NULL),(234,'ross.fowler30@gmail.com','Vx6Enh0sAVjorL/Y1Vw92yYe2Ao=','Ross','Fowler',NULL,'Los Angeles','Male','CA',NULL,'1990-09-10',0,'92067','',NULL,'858-344-2478',0,0,NULL,NULL,0,'5962 Rancho Diegueno Road','P.O. Box 675273',NULL),(235,'sales@rjmodelships.com','3rZpnk0bpMDCBQqxm6E0RJBFEnI=',NULL,NULL,NULL,'San Diego',NULL,'CA',NULL,NULL,0,'92126','rfowlerm3','wholeeggs_235.jpg','858-354-7363',0,0,NULL,NULL,0,'7949 Silverton Ave #906','','We provide museum quality model ships!'),(236,'asdf@a.com','96niR3fsIyEsVNejULxb6lR3/bs=',NULL,NULL,NULL,'',NULL,'1',NULL,NULL,0,'','','Desert Landscape_236.jpg','',0,0,NULL,NULL,0,'','',''),(237,'sat@a.com','fEqNCco3Yq9h5ZUglD3CZJT4lBs=',NULL,NULL,NULL,'',NULL,'1',NULL,NULL,0,'','','Humpback Whale_237.jpg','',0,0,NULL,NULL,0,'','',''),(238,'test1@m.com','fEqNCco3Yq9h5ZUglD3CZJT4lBs=',NULL,NULL,NULL,'',NULL,'1',NULL,NULL,0,'','','Green Sea Turtle_238.jpg','',0,0,NULL,NULL,0,'','',''),(239,'test2@m.com','fEqNCco3Yq9h5ZUglD3CZJT4lBs=',NULL,NULL,NULL,'',NULL,'1',NULL,NULL,0,'','','Waterfall_239.jpg','',0,0,NULL,NULL,0,'','',''),(240,'zz@zz.com','fEqNCco3Yq9h5ZUglD3CZJT4lBs=',NULL,NULL,NULL,'',NULL,'1',NULL,NULL,0,'','','Green Sea Turtle_240.jpg','',0,0,NULL,NULL,0,'asdasda','asdasdasd','asdasd'),(241,'satyam.pulkam@gmail.com','IQXzmm/YoB+d8bRqgZBSOkFlfPc=','saty','satya',NULL,'','Male','1',NULL,NULL,0,'','',NULL,'',0,0,NULL,NULL,0,'','',NULL),(242,'satyam.pulkam@gmail.com','fEqNCco3Yq9h5ZUglD3CZJT4lBs=',NULL,NULL,NULL,'',NULL,'1',NULL,NULL,0,'','','Green Sea Turtle_242.jpg','',0,0,NULL,NULL,0,'','','aa'),(243,'pulkam.satyam@gmail.com','fEqNCco3Yq9h5ZUglD3CZJT4lBs=',NULL,NULL,NULL,'',NULL,'1',NULL,NULL,0,'','','Waterfall_243.jpg','',0,0,NULL,NULL,0,'','',''),(244,'satyanarayana.pulkam@techendeavour.com','fEqNCco3Yq9h5ZUglD3CZJT4lBs=',NULL,NULL,NULL,'',NULL,'1',NULL,NULL,0,'','','Waterfall_244.jpg','',0,0,NULL,NULL,0,'','',''),(245,'gsscharan@gmail.com','0JuQLNDHN0taSRnCzZ0DecTOvck=',NULL,NULL,NULL,'',NULL,'AR',NULL,NULL,0,'','','Winter Leaves_245.jpg','',0,0,NULL,NULL,0,'asdas','asdas',''),(246,'satya@gmail.com','fEqNCco3Yq9h5ZUglD3CZJT4lBs=',NULL,NULL,NULL,'qedasd',NULL,'1',NULL,NULL,0,'','','Waterfall_246.jpg','',0,0,NULL,NULL,0,'12','123',''),(247,'pulkam@mob.com','fEqNCco3Yq9h5ZUglD3CZJT4lBs=',NULL,NULL,NULL,'',NULL,'1',NULL,NULL,0,'','','Dock_247.jpg','',0,0,NULL,NULL,0,'','','pulkam@mob.com'),(248,'pulkam1@mob.com','fEqNCco3Yq9h5ZUglD3CZJT4lBs=',NULL,NULL,NULL,'',NULL,'1',NULL,NULL,0,'','','Waterfall_248.jpg','',0,0,NULL,NULL,0,'','',''),(249,'aa@a.com','96niR3fsIyEsVNejULxb6lR3/bs=','a','a',NULL,'','Male','1',NULL,NULL,0,'','',NULL,'',0,0,NULL,NULL,0,'','',NULL),(250,'aaa@a.com','96niR3fsIyEsVNejULxb6lR3/bs=','aa','aa',NULL,'','Male','1',NULL,NULL,0,'','',NULL,'',0,0,NULL,NULL,0,'','',NULL),(251,'aaaa@a.com','fEqNCco3Yq9h5ZUglD3CZJT4lBs=','as','as',NULL,'','Male','1',NULL,NULL,0,'','',NULL,'',0,0,NULL,NULL,0,'','',NULL),(252,'bb@b.com','fEqNCco3Yq9h5ZUglD3CZJT4lBs=','b','b',NULL,'','Male','1',NULL,NULL,0,'','',NULL,'',0,0,NULL,NULL,0,'','',NULL),(253,'jason@roozt.com','7ns76leBLqfwZfrr+MkNIwZRaxk=','Jason','Joseph',NULL,'Los Angeles','Male','CA',NULL,'1982-12-09',0,'90012','Musicalmindz',NULL,'858-583-6281',0,0,NULL,NULL,0,'','',NULL),(254,'qq@q.com','fEqNCco3Yq9h5ZUglD3CZJT4lBs=','qq','qq',NULL,'','Male','1',NULL,NULL,0,'','',NULL,'',0,0,NULL,NULL,0,'asdf','asdf',NULL),(255,'qqq@gmail.com','+ml3yZuAnbaOHFaIjsOL0ARxmzk=',NULL,NULL,NULL,'',NULL,'1',NULL,NULL,0,'','','Green Sea Turtle_255.jpg','',0,0,NULL,NULL,0,'','',''),(256,'rfowlerm3@gmail.com','vyNr988NnTfOPWXhLlfs89p1OCc=',NULL,NULL,NULL,'Del Mar',NULL,'CA',NULL,NULL,0,'92014','rfowlerm3','Diet-and-Fitness_256.png','858-354-7363',0,0,NULL,NULL,0,'2683 Via de la Valle #G516','','E-Book Bossing'),(257,'jason@myownbriefcase.com','7ns76leBLqfwZfrr+MkNIwZRaxk=','Jason','Joseph',NULL,'Los Angeles','Male','CA',NULL,'1982-12-09',0,'90012','Musicalmindz',NULL,'858-583-6281',0,0,NULL,NULL,0,'','',NULL),(258,'jerrykurian@yahoo.com','7QX6GHCGW5xmFWR4626cB1oyYT0=','Jerry','Kurian',NULL,'','Male','1',NULL,NULL,0,'','',NULL,'',0,0,NULL,NULL,0,'','',NULL),(259,'admin@jus.com','W6ph5Mm5Pz8GgiULbPgzG37mj9g=',NULL,NULL,NULL,'',NULL,'AZ',NULL,NULL,0,'','',NULL,'',0,0,NULL,NULL,0,'','',''),(260,'resume@te.com','W6ph5Mm5Pz8GgiULbPgzG37mj9g=','Resume','Guy',NULL,'','Male','1',NULL,NULL,0,'','',NULL,'',0,0,NULL,NULL,0,'','',NULL),(261,'end@mob.com','fEqNCco3Yq9h5ZUglD3CZJT4lBs=',NULL,NULL,NULL,'',NULL,'LA',NULL,NULL,0,'','','Frangipani Flowers_261.jpg','',0,0,NULL,NULL,0,'','','dfsd sdf sdfsdfsdfsd'),(262,'anji.swe@gmail.com','WWYnw2Nd6tWau49gbVcU3MajntE=','Anjaiah','Pulla',NULL,'','Male','1',NULL,NULL,0,'','',NULL,'',0,0,NULL,NULL,0,'','',NULL),(263,'pp@pp.com','tXLce7fg/34oh/MuG3M8/9yVT60=','pp@pp.com','asd',NULL,'','Male','1',NULL,NULL,0,'','',NULL,'',0,0,NULL,NULL,0,'','',NULL),(264,'gopaln@test.com','W6ph5Mm5Pz8GgiULbPgzG37mj9g=','Gopal','Nath',NULL,'Bangalore','Male','1',NULL,NULL,0,'','',NULL,'',0,0,NULL,NULL,0,'','',NULL),(265,'rachel@test.com','W6ph5Mm5Pz8GgiULbPgzG37mj9g=','Rachel','Banks',NULL,'','Female','1',NULL,NULL,0,'','rachel',NULL,'',0,0,NULL,NULL,0,'','',NULL),(266,'john@decisionlink.com','Df0/944t+rmdmYYbCJJTyessKDA=','John','Porter',NULL,'','Male','1',NULL,NULL,0,'','',NULL,'',0,0,NULL,NULL,0,'','',NULL),(267,'jr@decisionlink.com','Df0/944t+rmdmYYbCJJTyessKDA=',NULL,NULL,NULL,'Round Hill',NULL,'VA',NULL,NULL,0,'20104','',NULL,'',0,0,NULL,NULL,0,'po box 266','','');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

/*!50003 SET @SAVE_SQL_MODE=@@SQL_MODE*/;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_VALUE_ON_ZERO" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`mob`@`localhost` */ /*!50003 TRIGGER `emp_location_update` BEFORE UPDATE ON `user` FOR EACH ROW BEGIN
		DECLARE keyrows INTEGER;
		DECLARE itemrows INTEGER;
		DECLARE emprows INTEGER;
		DECLARE roleid BIGINT;
		DECLARE procount INTEGER;
		SELECT count(*) INTO roleid FROM user_role r WHERE r.user_id=NEW.id and r.role_id=2;
		IF roleid>0 THEN
			IF OLD.city!=NEW.city THEN
				SELECT count(*) INTO procount FROM profile WHERE user_id=OLD.id;
				UPDATE itemcount i SET i.count=i.count-procount WHERE  i.searchTerm like OLD.city and i.itemType=2;

				SELECT count(*) INTO keyrows FROM itemcount i WHERE i.searchTerm like NEW.city  and i.itemType=2;
				SELECT count(*) INTO procount FROM profile WHERE user_id=OLD.id;
				IF keyrows>0 THEN
					UPDATE itemcount i SET i.count=i.count+procount WHERE  i.searchTerm like NEW.city  and i.itemType=2;
				ELSE
					IF NEW.city != '' THEN
						INSERT INTO itemcount (itemType, searchTerm, count) VALUES (2,NEW.city,procount);
					END IF;
				END IF;
			END IF;
		END IF;

		IF roleid<=0 THEN
			IF OLD.city!=NEW.city THEN
				UPDATE itemcount i SET i.count=i.count-1 WHERE  i.searchTerm like OLD.city and i.itemType=5;
				SELECT count(*) INTO keyrows FROM itemcount i WHERE i.searchTerm like NEW.city  and i.itemType=5;
				IF keyrows>0 THEN
					UPDATE itemcount i SET i.count=i.count+1 WHERE  i.searchTerm like NEW.city  and i.itemType=5;
				ELSE
					SELECT count(*) INTO emprows FROM user_role r WHERE r.user_id=NEW.id and r.role_id=1;
					IF emprows=0 THEN
						IF NEW.city != '' THEN
							INSERT INTO itemcount (itemType, searchTerm, count) VALUES (5,NEW.city,1);
						END IF;
					END IF;
				END IF;
			END IF;
		END IF;
	END */;;

/*!50003 SET SESSION SQL_MODE="NO_AUTO_VALUE_ON_ZERO" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`mob`@`localhost` */ /*!50003 TRIGGER `emp_location_delete` BEFORE DELETE ON `user` FOR EACH ROW BEGIN
		DECLARE itemrows INTEGER;
		DECLARE roleid BIGINT;
		DECLARE procount INTEGER;
		SELECT count(*) INTO roleid FROM user_role r WHERE r.user_id=OLD.id and r.role_id=2;
		IF roleid>0 THEN
			SELECT count(*) INTO procount FROM profile WHERE user_id=OLD.id;
			UPDATE itemcount i SET i.count=i.count-procount WHERE  i.searchTerm like OLD.city and i.itemType=2;
		END IF;
		
		IF roleid<=0 THEN
			UPDATE itemcount i SET i.count=i.count-1 WHERE  i.searchTerm like OLD.city and i.itemType=5;
		END IF;
	END */;;

DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@SAVE_SQL_MODE*/;

--
-- Table structure for table `user_bookmark`
--

DROP TABLE IF EXISTS `user_bookmark`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `user_bookmark` (
  `profile_id` bigint(20) NOT NULL default '0',
  `opportunity_id` bigint(20) NOT NULL,
  PRIMARY KEY  (`profile_id`,`opportunity_id`),
  KEY `fk_profile_bookmark_id` (`profile_id`),
  KEY `fk_opportunity_bookmark_id` (`opportunity_id`),
  CONSTRAINT `fk_opportunity_bookmark_id` FOREIGN KEY (`opportunity_id`) REFERENCES `opportunity` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_profile_bookmark_id` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `user_bookmark`
--

LOCK TABLES `user_bookmark` WRITE;
/*!40000 ALTER TABLE `user_bookmark` DISABLE KEYS */;
INSERT INTO `user_bookmark` VALUES (513,2),(513,6),(533,7);
/*!40000 ALTER TABLE `user_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_interest`
--

DROP TABLE IF EXISTS `user_interest`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `user_interest` (
  `profile_id` bigint(20) NOT NULL,
  `opportunity_id` bigint(20) NOT NULL,
  PRIMARY KEY  USING BTREE (`profile_id`,`opportunity_id`),
  KEY `fk_user_has_opportunity_opportunity` (`opportunity_id`),
  KEY `fk_profile_has_opportunity_user` USING BTREE (`profile_id`),
  CONSTRAINT `fk_profile_has_opportunity_user` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_opportunity_opportunity` FOREIGN KEY (`opportunity_id`) REFERENCES `opportunity` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `user_interest`
--

LOCK TABLES `user_interest` WRITE;
/*!40000 ALTER TABLE `user_interest` DISABLE KEYS */;
INSERT INTO `user_interest` VALUES (513,2),(514,5),(513,6);
/*!40000 ALTER TABLE `user_interest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY  (`user_id`,`role_id`),
  KEY `fk_user_role_user` (`user_id`),
  KEY `fk_user_role_role` (`role_id`),
  CONSTRAINT `fk_user_role_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_role_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (197,2),(198,2),(199,1),(200,1),(201,1),(202,2),(203,2),(204,2),(206,2),(207,3),(208,1),(209,2),(210,1),(211,2),(212,1),(213,2),(214,2),(215,1),(216,1),(217,2),(218,2),(219,1),(220,1),(221,1),(222,1),(223,2),(224,2),(225,2),(226,2),(227,2),(228,2),(229,1),(230,1),(231,1),(232,1),(233,2),(234,2),(235,1),(236,1),(237,1),(238,1),(239,1),(240,1),(241,2),(242,1),(243,1),(244,1),(245,1),(246,1),(247,1),(248,1),(249,2),(250,2),(251,2),(252,2),(253,2),(254,2),(255,1),(256,1),(257,2),(258,2),(259,1),(260,2),(261,1),(262,2),(263,2),(264,2),(265,2),(266,2),(267,1);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

/*!50003 SET @SAVE_SQL_MODE=@@SQL_MODE*/;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_VALUE_ON_ZERO" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`mob`@`localhost` */ /*!50003 TRIGGER `empr_location_insert` AFTER INSERT ON `user_role` FOR EACH ROW BEGIN
		DECLARE keyrows INTEGER;
		DECLARE city VARCHAR(50);
		DECLARE procount INTEGER;
		
		IF NEW.role_id=1 THEN
			SELECT u.city INTO city FROM user u WHERE u.id=NEW.user_id;
			IF city!='' THEN
				SELECT count(*) INTO keyrows FROM itemcount i WHERE i.searchTerm like city  and i.itemType=5;

				IF keyrows>0 THEN
					UPDATE itemcount i SET i.count=i.count+1 WHERE  i.searchTerm like city and i.itemType=5;
				ELSE
					INSERT INTO itemcount (itemType, searchTerm, count) VALUES (5,city,1);
				END IF;
			END IF;
		END IF;
	END */;;

DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@SAVE_SQL_MODE*/;

--
-- Table structure for table `userskills`
--

DROP TABLE IF EXISTS `userskills`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `userskills` (
  `id` bigint(20) NOT NULL auto_increment,
  `level` varchar(45) default NULL,
  `notes` varchar(250) default NULL,
  `profile_id` bigint(20) default NULL,
  `experience` varchar(45) default NULL,
  `skillname` varchar(45) default NULL,
  `categoryId` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_userskills_profid` (`profile_id`),
  KEY `fk_userskills_categoryid` (`categoryId`),
  CONSTRAINT `fk_userskills_categoryid` FOREIGN KEY (`categoryId`) REFERENCES `skillscategory` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_userskills_profid` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `userskills`
--

LOCK TABLES `userskills` WRITE;
/*!40000 ALTER TABLE `userskills` DISABLE KEYS */;
INSERT INTO `userskills` VALUES (1,'Advanced','Mastered',518,'4','Java',64),(2,'Intermediate','',518,'3','J2EE',64),(3,'Intermediate','',518,'2','Python',64),(4,'Beginner','sdf',525,'3','sdf',67),(5,'Intermediate','er',526,'4','er',68),(6,'Intermediate','',514,'3','Java/J2ee',69),(7,'Intermediate','',551,'2','CNC Machine Composite',70),(9,'Mastered','I',563,'4','undefined',72),(10,'Intermediate','as',565,'3','undefined',73),(11,'Intermediate','asdasdasd',572,'3','saty',74),(12,'Advanced','asdasd',572,'5','C++ Programming',75),(13,'Intermediate','aaa',575,'4','undefined',76),(14,'Intermediate','aqasas',580,'5','Java and mob',77),(15,'Advanced','satyaaaaaaaaaa',580,'7','SATYA',78),(16,'Advanced','sdfsd',581,'5','sdfdsf',79),(17,'Intermediate','asdasdasd',586,'6','Cleaning',80),(18,'Intermediate','asdasd',586,'5','java and satya',81),(19,'Beginner','test',518,'2','undefined',82),(20,'Beginner','test',587,'2','test',83),(21,'Expert','asdas',571,'7','satya',84),(22,'Expert','asdfg',571,'6','Testing custom skills',85),(23,'Intermediate','',597,'3','C++ Programming',86),(24,'Advanced','',597,'3','CNC Machine Composite',87);
/*!40000 ALTER TABLE `userskills` ENABLE KEYS */;
UNLOCK TABLES;

/*!50003 SET @SAVE_SQL_MODE=@@SQL_MODE*/;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_VALUE_ON_ZERO" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`mob`@`localhost` */ /*!50003 TRIGGER `emp_skills_insert` AFTER INSERT ON `userskills` FOR EACH ROW BEGIN
		DECLARE keyrows INTEGER;

		IF NEW.skillname != '' THEN
			SELECT count(*) INTO keyrows FROM itemcount i WHERE i.searchTerm like NEW.skillname  and i.itemType=3;
			IF keyrows>0 THEN
				UPDATE itemcount i SET i.count=i.count+1 WHERE  i.searchTerm like NEW.skillname  and i.itemType=3;
			ELSE
				INSERT INTO itemcount (itemType, searchTerm, count) VALUES (3,NEW.skillname,1);
			END IF;
		END IF;
	END */;;

/*!50003 SET SESSION SQL_MODE="NO_AUTO_VALUE_ON_ZERO" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`mob`@`localhost` */ /*!50003 TRIGGER `emp_skills_update` AFTER UPDATE ON `userskills` FOR EACH ROW BEGIN
		DECLARE keyrows INTEGER;
		DECLARE itemrows INTEGER;

		IF OLD.skillname!=NEW.skillname THEN
			UPDATE itemcount i SET i.count=i.count-1 WHERE  i.searchTerm like OLD.skillname;
			SELECT count(*) INTO keyrows FROM itemcount i WHERE i.searchTerm like NEW.skillname  and i.itemType=3;
			IF keyrows>0 THEN
				UPDATE itemcount i SET i.count=i.count+1 WHERE  i.searchTerm like NEW.skillname  and i.itemType=3;
			ELSE
				IF NEW.skillname != '' THEN
					INSERT INTO itemcount (itemType, searchTerm, count) VALUES (3,NEW.skillname,1);
				END IF;
			END IF;
		END IF;
	END */;;

/*!50003 SET SESSION SQL_MODE="NO_AUTO_VALUE_ON_ZERO" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`mob`@`localhost` */ /*!50003 TRIGGER `emp_skills_delete` AFTER DELETE ON `userskills` FOR EACH ROW BEGIN
		DECLARE itemrows INTEGER;
		UPDATE itemcount i SET i.count=i.count-1 WHERE  i.searchTerm like OLD.skillname  and i.itemType=3;
	END */;;

DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@SAVE_SQL_MODE*/;

--
-- Table structure for table `workhours_opportunity`
--

DROP TABLE IF EXISTS `workhours_opportunity`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `workhours_opportunity` (
  `id` bigint(26) NOT NULL auto_increment,
  `workhours` varchar(70) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `workhours_opportunity`
--

LOCK TABLES `workhours_opportunity` WRITE;
/*!40000 ALTER TABLE `workhours_opportunity` DISABLE KEYS */;
INSERT INTO `workhours_opportunity` VALUES (1,'Mon-Fri (Day)'),(2,'Mon-Fri (Night)'),(3,'Weekends'),(4,'Flexible'),(5,'Other');
/*!40000 ALTER TABLE `workhours_opportunity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worktimeframe`
--

DROP TABLE IF EXISTS `worktimeframe`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `worktimeframe` (
  `id` bigint(20) NOT NULL auto_increment,
  `worktimeframename` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `worktimeframe`
--

LOCK TABLES `worktimeframe` WRITE;
/*!40000 ALTER TABLE `worktimeframe` DISABLE KEYS */;
INSERT INTO `worktimeframe` VALUES (1,'Yearly'),(2,'Part Time'),(3,'Hourly'),(4,'Contract');
/*!40000 ALTER TABLE `worktimeframe` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-06-06  7:55:50
