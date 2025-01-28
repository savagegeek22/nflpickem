-- MySQL dump 10.13  Distrib 5.6.51, for Linux (x86_64)
--
-- Host: localhost    Database: nflfamily
-- ------------------------------------------------------
-- Server version	5.6.51

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
-- Table structure for table `nflp_comments`
--

DROP TABLE IF EXISTS `nflp_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nflp_comments` (
  `commentID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `comment` longtext NOT NULL,
  `postDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`commentID`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nflp_comments`
--

LOCK TABLES `nflp_comments` WRITE;
/*!40000 ALTER TABLE `nflp_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `nflp_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nflp_divisions`
--

DROP TABLE IF EXISTS `nflp_divisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nflp_divisions` (
  `divisionID` int(11) NOT NULL AUTO_INCREMENT,
  `conference` varchar(10) NOT NULL,
  `division` varchar(32) NOT NULL,
  PRIMARY KEY (`divisionID`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nflp_divisions`
--

LOCK TABLES `nflp_divisions` WRITE;
/*!40000 ALTER TABLE `nflp_divisions` DISABLE KEYS */;
INSERT INTO `nflp_divisions` VALUES (1,'AFC','North'),(2,'AFC','South'),(3,'AFC','East'),(4,'AFC','West'),(5,'NFC','North'),(6,'NFC','South'),(7,'NFC','East'),(8,'NFC','West');
/*!40000 ALTER TABLE `nflp_divisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nflp_email_templates`
--

DROP TABLE IF EXISTS `nflp_email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nflp_email_templates` (
  `email_template_key` varchar(255) NOT NULL,
  `email_template_title` varchar(255) NOT NULL,
  `default_subject` varchar(255) DEFAULT NULL,
  `default_message` text,
  `subject` varchar(255) DEFAULT NULL,
  `message` text,
  PRIMARY KEY (`email_template_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nflp_email_templates`
--

LOCK TABLES `nflp_email_templates` WRITE;
/*!40000 ALTER TABLE `nflp_email_templates` DISABLE KEYS */;
INSERT INTO `nflp_email_templates` VALUES ('WEEKLY_PICKS_REMINDER','Weekly Picks Reminder','NFL Pick \'Em Week {week} Reminder','Hello {player},<br /><br />You are receiving this email because you do not yet have all of your picks in for week {week}.&nbsp; This is your reminder.&nbsp; The first game is {first_game} (Eastern), so to receive credit for that game, you\'ll have to make your pick before then.<br /><br />Links:<br />&nbsp;- NFL Pick \'Em URL: {site_url}<br />&nbsp;- Help/Rules: {rules_url}<br /><br />Good Luck!<br />','SavageGeek NFL Pick \'Em Week {week} Reminder','\n    Hello {player},<br /><br />You are receiving this email because you do not yet have all of your picks in for week {week}. This is your reminder. The first game is {first_game} (Eastern), so to receive credit for that game, you\'ll have to make your pick before then.<br /><br />Links:<br />- SavageGeek NFL Pick \'Em URL: {site_url}<br />- Help/Rules: http://nfl.savagegeek.com/rules.php<br /><br />********\n<div><br />NOTE:  Did you know that SavageGeek has radio stations!\n<div>Check them out at:</div>\n<div><br /></div>\n<div>Home Page:</div>\n<div>https://music.savagegeek.com/</div>\n<div><br /></div>\n<div>Streams:</div>\n<div>https://music.savagegeek.com/alt</div>\n<div>https://music.savagegeek.com/chill</div>\n<div>https://music.savagegeek.com/classical</div>\n<div>\n<div>https://music.savagegeek.com/dance01</div>\n<div>https://music.savagegeek.com/dance02</div>\n<div>https://music.savagegeek.com/dance03</div></div>\n<div>https://music.savagegeek.com/groovy</div>\n<div>https://music.savagegeek.com/jazz</div>\n<div>https://music.savagegeek.com/rock</div>\n<div><br /></div>\n<div>Please let me know your experience :-) </div>\n\n</div>'),('WEEKLY_RESULTS_REMINDER','Last Week Results/Reminder','NFL Pick \'Em Week {previousWeek} Standings/Reminder','Congratulations this week go to {winners} for winning week {previousWeek}.  The winner(s) had {winningScore} out of {possibleScore} picks correct.<br /><br />The current leaders are:<br />{currentLeaders}<br /><br />The most accurate players are:<br />{bestPickRatios}<br /><br />*Reminder* - Please make your picks for week {week} before {first_game} (Eastern).<br /><br />Links:<br />&nbsp;- NFL Pick \'Em URL: {site_url}<br />&nbsp;- Help/Rules: {rules_url}<br /><br />Good Luck!<br />','SavageGeek NFL Pick \'Em Week {previousWeek} Standings/Reminder Week {week}','\n           Congratulations this week go to {winners} <br /> for winning week {previousWeek}. <br /> The winner(s) had {winningScore} out of {possibleScore} picks correct.<br /><br />The current leaders are:<br />{currentLeaders}<br /><br />The most accurate players are:<br />{bestPickRatios}<br /><br />NOTE: Did you know that SavageGeek has radio stations!  \n<div>Check them out at:</div>  \n<div><br /></div>  \n<div>Home Page:</div>  \n<div>https://music.savagegeek.com/</div>  \n<div><br /></div>  \n<div>Streams:</div>  \n<div>https://music.savagegeek.com/alt</div>  \n<div>https://music.savagegeek.com/chill</div>  \n<div>https://music.savagegeek.com/classical</div>  \n<div>  \n<div>https://music.savagegeek.com/dance01</div>  \n<div>https://music.savagegeek.com/dance02</div>  \n<div>https://music.savagegeek.com/dance03</div>  \n<div>https://music.savagegeek.com/groovy</div>  \n<div>https://music.savagegeek.com/jazz</div>  \n<div>https://music.savagegeek.com/rock</div>  \n<div><br /></div>  \n<div>Please let me know your experience.</div>  \n<div><br /></div>**Reminder** - Please make your picks for week {week} before {first_game} (Eastern).<br /><br />Links:<br />- SavageGeek NFL Pick \'Em URL:<br />https://nfl.savagegeek.com<br /><br />Good Luck!  \n<div>  \n<div>   \n<div><br /><br /></div></div></div>    </div>\n\n'),('FINAL_RESULTS','Final Results','NFL Pick \'Em 2016 Final Results','Congratulations this week go to {winners} for winning week\r\n{previousWeek}. The winner(s) had {winningScore} out of {possibleScore}\r\npicks correct.<br /><br /><span style=\"font-weight: bold;\">Congratulations to {final_winner}</span> for winning NFL Pick \'Em 2016!&nbsp; {final_winner} had {final_winningScore} wins and had a pick ratio of {picks}/{possible} ({pickpercent}%).<br /><br />Top Wins:<br />{currentLeaders}<br /><br />The most accurate players are:<br />{bestPickRatios}<br /><br />Thanks for playing, and I hope to see you all again for NFL Pick \'Em 2017!','SavageGeek NFL Pick \'Em 2016 Final Results','\n Congratulations this week go to {winners} for winning week  {previousWeek}. The winner(s) had {winningScore} out of {possibleScore}  picks correct.<br /><br /><span style=\"font-weight:bold;\">Congratulations to {final_winner}</span> for winning  \n<div>SavageGeek NFL Pick \'Em 2016!  {final_winner} had {final_winningScore} wins and had a pick ratio </div> \n<div>of {picks}/{possible} ({pickpercent}%).<br /><br />Top Wins:<br />{currentLeaders}<br /><br />The most accurate players are:<br />{bestPickRatios}<br /><br />Thanks for playing, and I hope to see you all again for </div> \n<div>SavageGeek NFL Pick \'Em 2022 !  </div>\n\n');
/*!40000 ALTER TABLE `nflp_email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nflp_picks`
--

DROP TABLE IF EXISTS `nflp_picks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nflp_picks` (
  `userID` int(11) NOT NULL,
  `gameID` int(11) NOT NULL,
  `pickID` varchar(10) NOT NULL,
  `points` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`userID`,`gameID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nflp_picks`
--

LOCK TABLES `nflp_picks` WRITE;
/*!40000 ALTER TABLE `nflp_picks` DISABLE KEYS */;
INSERT INTO `nflp_picks` VALUES (2,401671789,'KC',1),(2,401671805,'PHI',1),(2,401671744,'ATL',1),(2,401671617,'BUF',1),(2,401671719,'CHI',1),(2,401671628,'CIN',1),(2,401671861,'IND',1),(2,401671849,'MIA',1),(2,401671734,'CAR',1),(2,401671712,'NYG',1),(2,401671659,'LV',1),(2,401671664,'SEA',1),(2,401671761,'CLE',1),(2,401671770,'TB',1),(2,401671792,'DET',1),(2,401671696,'SF',1),(43,401671789,'KC',1),(43,401671805,'PHI',1),(43,401671744,'ATL',1),(43,401671617,'BUF',1),(43,401671719,'TEN',1),(43,401671628,'NE',1),(43,401671861,'IND',1),(43,401671849,'JAX',1),(43,401671734,'CAR',1),(43,401671712,'MIN',1),(43,401671659,'LV',1),(43,401671664,'SEA',1),(43,401671761,'CLE',1),(43,401671770,'TB',1),(43,401671792,'DET',1),(43,401671696,'NYJ',1),(43,401671807,'BUF',1),(43,401671709,'DAL',1),(43,401671721,'DET',1),(43,401671723,'IND',1),(43,401671636,'TEN',1),(43,401671645,'SF',1),(43,401671702,'NE',1),(43,401671716,'WAS',1),(43,401671652,'CAR',1),(43,401671635,'CLE',1),(43,401671624,'LV',1),(43,401671754,'LAR',1),(43,401671668,'PIT',1),(43,401671670,'KC',1),(43,401671786,'CHI',1),(43,401671691,'PHI',1),(43,401671808,'NE',1),(43,401671855,'CLE',1),(43,401671823,'GB',1),(43,401671865,'IND',1),(43,401671646,'MIN',1),(43,401671736,'PHI',1),(43,401671632,'PIT',1),(43,401671741,'DEN',1),(43,401671658,'CAR',1),(43,401671662,'SEA',1),(43,401671763,'DAL',1),(43,401671772,'SF',1),(43,401671771,'DET',1),(43,401671793,'KC',1),(43,401671682,'BUF',1),(43,401671490,'WAS',1),(44,401671789,'BAL',1),(44,401671805,'PHI',1),(44,401671744,'ATL',1),(44,401671617,'BUF',1),(44,401671719,'CHI',1),(44,401671628,'CIN',1),(44,401671861,'HOU',1),(44,401671849,'MIA',1),(44,401671734,'NO',1),(44,401671712,'MIN',1),(44,401671659,'LAC',1),(44,401671664,'DEN',1),(44,401671761,'DAL',1),(44,401671770,'WAS',1),(44,401671792,'DET',1),(44,401671696,'SF',1);
/*!40000 ALTER TABLE `nflp_picks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nflp_picksummary`
--

DROP TABLE IF EXISTS `nflp_picksummary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nflp_picksummary` (
  `weekNum` int(11) NOT NULL DEFAULT '0',
  `userID` int(11) NOT NULL DEFAULT '0',
  `tieBreakerPoints` int(11) NOT NULL DEFAULT '0',
  `showPicks` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`weekNum`,`userID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nflp_picksummary`
--

LOCK TABLES `nflp_picksummary` WRITE;
/*!40000 ALTER TABLE `nflp_picksummary` DISABLE KEYS */;
INSERT INTO `nflp_picksummary` VALUES (4,31,0,0),(14,41,0,0),(3,31,0,1),(13,41,0,0),(2,31,0,0),(12,41,0,0),(11,41,0,0),(1,31,0,0),(13,31,0,1),(17,2,0,0),(17,4,0,0),(17,13,0,0),(17,3,0,0),(16,4,0,0),(16,3,0,0),(16,13,0,0),(16,2,0,0),(15,4,0,0),(15,3,0,0),(15,13,0,0),(15,2,0,0),(12,31,0,0),(14,3,0,0),(14,13,0,0),(10,41,0,0),(14,2,0,0),(13,3,0,0),(13,13,0,0),(9,41,0,0),(13,4,0,0),(13,2,0,0),(18,31,0,0),(12,4,0,0),(12,3,0,0),(10,3,0,0),(18,13,0,0),(12,2,0,0),(12,13,0,0),(11,4,0,0),(10,13,0,0),(11,2,0,0),(11,3,0,0),(11,13,0,0),(10,4,0,0),(18,2,0,0),(10,31,0,0),(10,2,0,0),(9,4,0,0),(9,13,0,0),(9,3,0,0),(9,2,0,0),(8,3,0,0),(8,13,0,0),(1,44,0,1),(8,2,0,0),(19,13,0,0),(1,41,0,0),(8,41,0,0),(7,3,0,0),(7,13,0,0),(3,43,0,0),(1,40,0,0),(7,4,0,0),(9,31,0,0),(7,2,0,0),(14,4,0,0),(6,4,0,0),(6,3,0,0),(6,13,0,0),(17,31,0,0),(6,2,0,0),(2,43,0,0),(14,31,0,0),(1,39,0,0),(7,41,0,0),(6,40,0,1),(6,31,0,0),(5,3,0,0),(5,2,0,0),(5,13,0,0),(8,4,0,0),(5,4,0,0),(6,41,0,0),(1,43,0,1),(5,40,0,0),(4,13,0,0),(4,3,0,0),(4,4,0,0),(18,41,0,0),(16,31,0,0),(4,2,0,0),(3,4,0,0),(5,41,0,0),(3,3,0,0),(3,13,0,0),(17,41,0,0),(8,31,0,0),(3,2,0,0),(18,3,0,0),(4,41,0,0),(4,40,0,1),(16,41,0,0),(2,4,0,0),(2,13,0,0),(2,3,0,0),(2,2,0,0),(7,31,0,0),(3,39,0,0),(2,40,0,0),(2,41,0,0),(5,31,0,0),(3,40,0,1),(11,31,0,0),(1,3,0,0),(1,13,0,0),(2,39,0,0),(1,2,0,0),(15,41,0,0),(1,4,0,0),(3,41,0,0),(15,31,0,0);
/*!40000 ALTER TABLE `nflp_picksummary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nflp_schedule`
--

DROP TABLE IF EXISTS `nflp_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nflp_schedule` (
  `gameID` int(11) NOT NULL,
  `weekNum` int(11) NOT NULL,
  `gameTimeEastern` datetime DEFAULT NULL,
  `homeID` varchar(10) NOT NULL,
  `homeScore` int(11) DEFAULT NULL,
  `visitorID` varchar(10) NOT NULL,
  `visitorScore` int(11) DEFAULT NULL,
  `overtime` tinyint(1) NOT NULL DEFAULT '0',
  `scores_timeStamp` datetime DEFAULT NULL,
  `final` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nflp_schedule`
--

LOCK TABLES `nflp_schedule` WRITE;
/*!40000 ALTER TABLE `nflp_schedule` DISABLE KEYS */;
INSERT INTO `nflp_schedule` VALUES (401671789,1,'2024-09-05 20:20:00','KC',NULL,'BAL',NULL,0,NULL,0),(401671805,1,'2024-09-06 20:15:00','PHI',NULL,'GB',NULL,0,NULL,0),(401671744,1,'2024-09-08 13:00:00','ATL',NULL,'PIT',NULL,0,NULL,0),(401671617,1,'2024-09-08 13:00:00','BUF',NULL,'ARI',NULL,0,NULL,0),(401671719,1,'2024-09-08 13:00:00','CHI',NULL,'TEN',NULL,0,NULL,0),(401671628,1,'2024-09-08 13:00:00','CIN',NULL,'NE',NULL,0,NULL,0),(401671861,1,'2024-09-08 13:00:00','IND',NULL,'HOU',NULL,0,NULL,0),(401671849,1,'2024-09-08 13:00:00','MIA',NULL,'JAX',NULL,0,NULL,0),(401671734,1,'2024-09-08 13:00:00','NO',NULL,'CAR',NULL,0,NULL,0),(401671712,1,'2024-09-08 13:00:00','NYG',NULL,'MIN',NULL,0,NULL,0),(401671659,1,'2024-09-08 16:05:00','LAC',NULL,'LV',NULL,0,NULL,0),(401671664,1,'2024-09-08 16:05:00','SEA',NULL,'DEN',NULL,0,NULL,0),(401671761,1,'2024-09-08 16:25:00','CLE',NULL,'DAL',NULL,0,NULL,0),(401671770,1,'2024-09-08 16:25:00','TB',NULL,'WAS',NULL,0,NULL,0),(401671792,1,'2024-09-08 20:20:00','DET',NULL,'LAR',NULL,0,NULL,0),(401671696,1,'2024-09-09 20:20:00','SF',NULL,'NYJ',NULL,0,NULL,0),(401671807,2,'2024-09-12 20:15:00','MIA',NULL,'BUF',NULL,0,NULL,0),(401671709,2,'2024-09-15 13:00:00','DAL',NULL,'NO',NULL,0,NULL,0),(401671721,2,'2024-09-15 13:00:00','DET',NULL,'TB',NULL,0,NULL,0),(401671723,2,'2024-09-15 13:00:00','GB',NULL,'IND',NULL,0,NULL,0),(401671636,2,'2024-09-15 13:00:00','TEN',NULL,'NYJ',NULL,0,NULL,0),(401671645,2,'2024-09-15 13:00:00','MIN',NULL,'SF',NULL,0,NULL,0),(401671702,2,'2024-09-15 13:00:00','NE',NULL,'SEA',NULL,0,NULL,0),(401671716,2,'2024-09-15 13:00:00','WAS',NULL,'NYG',NULL,0,NULL,0),(401671652,2,'2024-09-15 13:00:00','CAR',NULL,'LAC',NULL,0,NULL,0),(401671635,2,'2024-09-15 13:00:00','JAX',NULL,'CLE',NULL,0,NULL,0),(401671624,2,'2024-09-15 13:00:00','BAL',NULL,'LV',NULL,0,NULL,0),(401671754,2,'2024-09-15 16:05:00','ARI',NULL,'LAR',NULL,0,NULL,0),(401671668,2,'2024-09-15 16:25:00','DEN',NULL,'PIT',NULL,0,NULL,0),(401671670,2,'2024-09-15 16:25:00','KC',NULL,'CIN',NULL,0,NULL,0),(401671786,2,'2024-09-15 20:20:00','HOU',NULL,'CHI',NULL,0,NULL,0),(401671691,2,'2024-09-16 20:15:00','PHI',NULL,'ATL',NULL,0,NULL,0),(401671808,3,'2024-09-19 20:15:00','NYJ',NULL,'NE',NULL,0,NULL,0),(401671855,3,'2024-09-22 13:00:00','CLE',NULL,'NYG',NULL,0,NULL,0),(401671823,3,'2024-09-22 13:00:00','TEN',NULL,'GB',NULL,0,NULL,0),(401671865,3,'2024-09-22 13:00:00','IND',NULL,'CHI',NULL,0,NULL,0),(401671646,3,'2024-09-22 13:00:00','MIN',NULL,'HOU',NULL,0,NULL,0),(401671736,3,'2024-09-22 13:00:00','NO',NULL,'PHI',NULL,0,NULL,0),(401671632,3,'2024-09-22 13:00:00','PIT',NULL,'LAC',NULL,0,NULL,0),(401671741,3,'2024-09-22 13:00:00','TB',NULL,'DEN',NULL,0,NULL,0),(401671658,3,'2024-09-22 16:05:00','LV',NULL,'CAR',NULL,0,NULL,0),(401671662,3,'2024-09-22 16:05:00','SEA',NULL,'MIA',NULL,0,NULL,0),(401671763,3,'2024-09-22 16:25:00','DAL',NULL,'BAL',NULL,0,NULL,0),(401671772,3,'2024-09-22 16:25:00','LAR',NULL,'SF',NULL,0,NULL,0),(401671771,3,'2024-09-22 16:25:00','ARI',NULL,'DET',NULL,0,NULL,0),(401671793,3,'2024-09-22 20:20:00','ATL',NULL,'KC',NULL,0,NULL,0),(401671682,3,'2024-09-23 19:30:00','BUF',NULL,'JAX',NULL,0,NULL,0),(401671490,3,'2024-09-23 20:15:00','CIN',NULL,'WAS',NULL,0,NULL,0),(401671812,4,'2024-09-26 20:15:00','NYG',NULL,'DAL',NULL,0,NULL,0),(401671727,4,'2024-09-29 13:00:00','ATL',NULL,'NO',NULL,0,NULL,0),(401671871,4,'2024-09-29 13:00:00','CHI',NULL,'LAR',NULL,0,NULL,0),(401671643,4,'2024-09-29 13:00:00','GB',NULL,'MIN',NULL,0,NULL,0),(401671867,4,'2024-09-29 13:00:00','IND',NULL,'PIT',NULL,0,NULL,0),(401671622,4,'2024-09-29 13:00:00','NYJ',NULL,'DEN',NULL,0,NULL,0),(401671740,4,'2024-09-29 13:00:00','TB',NULL,'PHI',NULL,0,NULL,0),(401671745,4,'2024-09-29 13:00:00','CAR',NULL,'CIN',NULL,0,NULL,0),(401671857,4,'2024-09-29 13:00:00','HOU',NULL,'JAX',NULL,0,NULL,0),(401671755,4,'2024-09-29 16:05:00','ARI',NULL,'WAS',NULL,0,NULL,0),(401671758,4,'2024-09-29 16:05:00','SF',NULL,'NE',NULL,0,NULL,0),(401671672,4,'2024-09-29 16:25:00','LV',NULL,'CLE',NULL,0,NULL,0),(401671674,4,'2024-09-29 16:25:00','LAC',NULL,'KC',NULL,0,NULL,0),(401671783,4,'2024-09-29 20:20:00','BAL',NULL,'BUF',NULL,0,NULL,0),(401671683,4,'2024-09-30 19:30:00','MIA',NULL,'TEN',NULL,0,NULL,0),(401671491,4,'2024-09-30 20:15:00','DET',NULL,'SEA',NULL,0,NULL,0),(401671815,5,'2024-10-03 20:15:00','ATL',NULL,'TB',NULL,0,NULL,0),(401671804,5,'2024-10-06 09:30:00','MIN',NULL,'NYJ',NULL,0,NULL,0),(401671872,5,'2024-10-06 13:00:00','CHI',NULL,'CAR',NULL,0,NULL,0),(401671626,5,'2024-10-06 13:00:00','CIN',NULL,'BAL',NULL,0,NULL,0),(401671700,5,'2024-10-06 13:00:00','NE',NULL,'MIA',NULL,0,NULL,0),(401671718,5,'2024-10-06 13:00:00','WAS',NULL,'CLE',NULL,0,NULL,0),(401671633,5,'2024-10-06 13:00:00','JAX',NULL,'IND',NULL,0,NULL,0),(401671859,5,'2024-10-06 13:00:00','HOU',NULL,'BUF',NULL,0,NULL,0),(401671747,5,'2024-10-06 16:05:00','DEN',NULL,'LV',NULL,0,NULL,0),(401671756,5,'2024-10-06 16:05:00','SF',NULL,'ARI',NULL,0,NULL,0),(401671679,5,'2024-10-06 16:25:00','LAR',NULL,'GB',NULL,0,NULL,0),(401671680,5,'2024-10-06 16:25:00','SEA',NULL,'NYG',NULL,0,NULL,0),(401671784,5,'2024-10-06 20:20:00','PIT',NULL,'DAL',NULL,0,NULL,0),(401671687,5,'2024-10-07 20:15:00','KC',NULL,'NO',NULL,0,NULL,0),(401671819,6,'2024-10-10 20:15:00','SEA',NULL,'SF',NULL,0,NULL,0),(401671802,6,'2024-10-13 09:30:00','CHI',NULL,'JAX',NULL,0,NULL,0),(401671722,6,'2024-10-13 13:00:00','GB',NULL,'ARI',NULL,0,NULL,0),(401671820,6,'2024-10-13 13:00:00','TEN',NULL,'IND',NULL,0,NULL,0),(401671619,6,'2024-10-13 13:00:00','NE',NULL,'HOU',NULL,0,NULL,0),(401671735,6,'2024-10-13 13:00:00','NO',NULL,'TB',NULL,0,NULL,0),(401671714,6,'2024-10-13 13:00:00','PHI',NULL,'CLE',NULL,0,NULL,0),(401671625,6,'2024-10-13 13:00:00','BAL',NULL,'WAS',NULL,0,NULL,0),(401671655,6,'2024-10-13 16:05:00','DEN',NULL,'LAC',NULL,0,NULL,0),(401671657,6,'2024-10-13 16:05:00','LV',NULL,'PIT',NULL,0,NULL,0),(401671764,6,'2024-10-13 16:25:00','DAL',NULL,'DET',NULL,0,NULL,0),(401671769,6,'2024-10-13 16:25:00','CAR',NULL,'ATL',NULL,0,NULL,0),(401671791,6,'2024-10-13 20:20:00','NYG',NULL,'CIN',NULL,0,NULL,0),(401671684,6,'2024-10-14 20:15:00','NYJ',NULL,'BUF',NULL,0,NULL,0),(401671816,7,'2024-10-17 20:15:00','NO',NULL,'DEN',NULL,0,NULL,0),(401671801,7,'2024-10-20 09:30:00','JAX',NULL,'NE',NULL,0,NULL,0),(401671730,7,'2024-10-20 13:00:00','ATL',NULL,'SEA',NULL,0,NULL,0),(401671616,7,'2024-10-20 13:00:00','BUF',NULL,'TEN',NULL,0,NULL,0),(401671853,7,'2024-10-20 13:00:00','CLE',NULL,'CIN',NULL,0,NULL,0),(401671644,7,'2024-10-20 13:00:00','GB',NULL,'HOU',NULL,0,NULL,0),(401671864,7,'2024-10-20 13:00:00','IND',NULL,'MIA',NULL,0,NULL,0),(401671724,7,'2024-10-20 13:00:00','MIN',NULL,'DET',NULL,0,NULL,0),(401671710,7,'2024-10-20 13:00:00','NYG',NULL,'PHI',NULL,0,NULL,0),(401671663,7,'2024-10-20 16:05:00','LAR',NULL,'LV',NULL,0,NULL,0),(401671640,7,'2024-10-20 16:05:00','WAS',NULL,'CAR',NULL,0,NULL,0),(401671777,7,'2024-10-20 16:25:00','SF',NULL,'KC',NULL,0,NULL,0),(401671785,7,'2024-10-20 20:20:00','PIT',NULL,'NYJ',NULL,0,NULL,0),(401671695,7,'2024-10-21 20:15:00','TB',NULL,'BAL',NULL,0,NULL,0),(401671699,7,'2024-10-21 21:00:00','ARI',NULL,'LAC',NULL,0,NULL,0),(401671817,8,'2024-10-24 20:15:00','LAR',NULL,'MIN',NULL,0,NULL,0),(401671852,8,'2024-10-27 13:00:00','CLE',NULL,'BAL',NULL,0,NULL,0),(401671720,8,'2024-10-27 13:00:00','DET',NULL,'TEN',NULL,0,NULL,0),(401671850,8,'2024-10-27 13:00:00','MIA',NULL,'ARI',NULL,0,NULL,0),(401671618,8,'2024-10-27 13:00:00','NE',NULL,'NYJ',NULL,0,NULL,0),(401671739,8,'2024-10-27 13:00:00','TB',NULL,'ATL',NULL,0,NULL,0),(401671599,8,'2024-10-27 13:00:00','WSWASH',NULL,'CHI',NULL,0,NULL,0),(401671707,8,'2024-10-27 13:00:00','JAX',NULL,'GB',NULL,0,NULL,0),(401671856,8,'2024-10-27 13:00:00','HOU',NULL,'IND',NULL,0,NULL,0),(401671750,8,'2024-10-27 16:05:00','LAC',NULL,'NO',NULL,0,NULL,0),(401671760,8,'2024-10-27 16:05:00','SEA',NULL,'BUF',NULL,0,NULL,0),(401671667,8,'2024-10-27 16:25:00','CIN',NULL,'PHI',NULL,0,NULL,0),(401671600,8,'2024-10-27 16:25:00','DEN',NULL,'CAR',NULL,0,NULL,0),(401671671,8,'2024-10-27 16:25:00','LV',NULL,'KC',NULL,0,NULL,0),(401671795,8,'2024-10-27 20:20:00','SF',NULL,'DAL',NULL,0,NULL,0),(401671685,8,'2024-10-28 20:15:00','PIT',NULL,'NYG',NULL,0,NULL,0),(401671809,9,'2024-10-31 20:15:00','NYJ',NULL,'HOU',NULL,0,NULL,0),(401671728,9,'2024-11-03 13:00:00','ATL',NULL,'DAL',NULL,0,NULL,0),(401671493,9,'2024-11-03 13:00:00','BUF',NULL,'MIA',NULL,0,NULL,0),(401671704,9,'2024-11-03 13:00:00','CIN',NULL,'LV',NULL,0,NULL,0),(401671629,9,'2024-11-03 13:00:00','CLE',NULL,'LAC',NULL,0,NULL,0),(401671822,9,'2024-11-03 13:00:00','TEN',NULL,'NE',NULL,0,NULL,0),(401671647,9,'2024-11-03 13:00:00','MIN',NULL,'IND',NULL,0,NULL,0),(401671711,9,'2024-11-03 13:00:00','NYG',NULL,'WAS',NULL,0,NULL,0),(401671650,9,'2024-11-03 13:00:00','CAR',NULL,'NO',NULL,0,NULL,0),(401671623,9,'2024-11-03 13:00:00','BAL',NULL,'DEN',NULL,0,NULL,0),(401671661,9,'2024-11-03 16:05:00','ARI',NULL,'CHI',NULL,0,NULL,0),(401671767,9,'2024-11-03 16:25:00','GB',NULL,'DET',NULL,0,NULL,0),(401671776,9,'2024-11-03 16:25:00','SEA',NULL,'LAR',NULL,0,NULL,0),(401671797,9,'2024-11-03 20:20:00','PHI',NULL,'JAX',NULL,0,NULL,0),(401671688,9,'2024-11-04 20:15:00','KC',NULL,'TB',NULL,0,NULL,0),(401671810,10,'2024-11-07 20:15:00','BAL',NULL,'CIN',NULL,0,NULL,0),(401671803,10,'2024-11-10 09:30:00','CAR',NULL,'NYG',NULL,0,NULL,0),(401671873,10,'2024-11-10 13:00:00','CHI',NULL,'NE',NULL,0,NULL,0),(401671863,10,'2024-11-10 13:00:00','IND',NULL,'BUF',NULL,0,NULL,0),(401671637,10,'2024-11-10 13:00:00','KC',NULL,'DEN',NULL,0,NULL,0),(401671733,10,'2024-11-10 13:00:00','NO',NULL,'ATL',NULL,0,NULL,0),(401671742,10,'2024-11-10 13:00:00','TB',NULL,'SF',NULL,0,NULL,0),(401671641,10,'2024-11-10 13:00:00','WAS',NULL,'PIT',NULL,0,NULL,0),(401671708,10,'2024-11-10 13:00:00','JAX',NULL,'MIN',NULL,0,NULL,0),(401671751,10,'2024-11-10 16:05:00','LAC',NULL,'TEN',NULL,0,NULL,0),(401671676,10,'2024-11-10 16:25:00','DAL',NULL,'PHI',NULL,0,NULL,0),(401671678,10,'2024-11-10 16:25:00','ARI',NULL,'NYJ',NULL,0,NULL,0),(401671787,10,'2024-11-10 20:20:00','HOU',NULL,'DET',NULL,0,NULL,0),(401671693,10,'2024-11-11 20:15:00','LAR',NULL,'MIA',NULL,0,NULL,0),(401671813,11,'2024-11-14 20:15:00','PHI',NULL,'WAS',NULL,0,NULL,0),(401671869,11,'2024-11-17 13:00:00','CHI',NULL,'GB',NULL,0,NULL,0),(401671642,11,'2024-11-17 13:00:00','DET',NULL,'JAX',NULL,0,NULL,0),(401671824,11,'2024-11-17 13:00:00','TEN',NULL,'MIN',NULL,0,NULL,0),(401671851,11,'2024-11-17 13:00:00','MIA',NULL,'LV',NULL,0,NULL,0),(401671701,11,'2024-11-17 13:00:00','NE',NULL,'LAR',NULL,0,NULL,0),(401671746,11,'2024-11-17 13:00:00','NO',NULL,'CLE',NULL,0,NULL,0),(401671630,11,'2024-11-17 13:00:00','PIT',NULL,'BAL',NULL,0,NULL,0),(401671748,11,'2024-11-17 16:05:00','DEN',NULL,'ATL',NULL,0,NULL,0),(401671757,11,'2024-11-17 16:05:00','SF',NULL,'SEA',NULL,0,NULL,0),(401671665,11,'2024-11-17 16:25:00','BUF',NULL,'KC',NULL,0,NULL,0),(401671675,11,'2024-11-17 16:25:00','LAC',NULL,'CIN',NULL,0,NULL,0),(401671782,11,'2024-11-17 20:20:00','NYJ',NULL,'IND',NULL,0,NULL,0),(401671694,11,'2024-11-18 20:15:00','DAL',NULL,'HOU',NULL,0,NULL,0),(401671875,12,'2024-11-21 20:15:00','CLE',NULL,'PIT',NULL,0,NULL,0),(401671870,12,'2024-11-24 13:00:00','CHI',NULL,'MIN',NULL,0,NULL,0),(401671866,12,'2024-11-24 13:00:00','IND',NULL,'DET',NULL,0,NULL,0),(401671847,12,'2024-11-24 13:00:00','MIA',NULL,'NE',NULL,0,NULL,0),(401671638,12,'2024-11-24 13:00:00','NYG',NULL,'TB',NULL,0,NULL,0),(401671715,12,'2024-11-24 13:00:00','WAS',NULL,'DAL',NULL,0,NULL,0),(401671651,12,'2024-11-24 13:00:00','CAR',NULL,'KC',NULL,0,NULL,0),(401671858,12,'2024-11-24 13:00:00','HOU',NULL,'TEN',NULL,0,NULL,0),(401671656,12,'2024-11-24 16:05:00','LV',NULL,'DEN',NULL,0,NULL,0),(401671768,12,'2024-11-24 16:25:00','GB',NULL,'SF',NULL,0,NULL,0),(401671775,12,'2024-11-24 16:25:00','SEA',NULL,'ARI',NULL,0,NULL,0),(401671794,12,'2024-11-24 20:20:00','LAR',NULL,'PHI',NULL,0,NULL,0),(401671689,12,'2024-11-25 20:15:00','LAC',NULL,'BAL',NULL,0,NULL,0),(401671492,13,'2024-11-28 12:30:00','DET',NULL,'CHI',NULL,0,NULL,0),(401671779,13,'2024-11-28 16:30:00','DAL',NULL,'NYG',NULL,0,NULL,0),(401671798,13,'2024-11-28 20:20:00','GB',NULL,'MIA',NULL,0,NULL,0),(401671806,13,'2024-11-29 15:00:00','KC',NULL,'LV',NULL,0,NULL,0),(401671649,13,'2024-12-01 13:00:00','ATL',NULL,'LAC',NULL,0,NULL,0),(401671627,13,'2024-12-01 13:00:00','CIN',NULL,'PIT',NULL,0,NULL,0),(401671726,13,'2024-12-01 13:00:00','MIN',NULL,'ARI',NULL,0,NULL,0),(401671620,13,'2024-12-01 13:00:00','NE',NULL,'IND',NULL,0,NULL,0),(401671703,13,'2024-12-01 13:00:00','NYJ',NULL,'SEA',NULL,0,NULL,0),(401671743,13,'2024-12-01 13:00:00','WAS',NULL,'TEN',NULL,0,NULL,0),(401671705,13,'2024-12-01 13:00:00','JAX',NULL,'HOU',NULL,0,NULL,0),(401671753,13,'2024-12-01 16:05:00','NO',NULL,'LAR',NULL,0,NULL,0),(401671752,13,'2024-12-01 16:05:00','CAR',NULL,'TB',NULL,0,NULL,0),(401671666,13,'2024-12-01 16:25:00','BAL',NULL,'PHI',NULL,0,NULL,0),(401671781,13,'2024-12-01 20:20:00','BUF',NULL,'SF',NULL,0,NULL,0),(401671686,13,'2024-12-02 20:15:00','DEN',NULL,'CLE',NULL,0,NULL,0),(401671814,14,'2024-12-05 20:15:00','DET',NULL,'GB',NULL,0,NULL,0),(401671821,14,'2024-12-08 13:00:00','TEN',NULL,'JAX',NULL,0,NULL,0),(401671848,14,'2024-12-08 13:00:00','MIA',NULL,'NYJ',NULL,0,NULL,0),(401671648,14,'2024-12-08 13:00:00','MIN',NULL,'ATL',NULL,0,NULL,0),(401671601,14,'2024-12-08 13:00:00','NYG',NULL,'NO',NULL,0,NULL,0),(401671713,14,'2024-12-08 13:00:00','PHI',NULL,'CAR',NULL,0,NULL,0),(401671631,14,'2024-12-08 13:00:00','PIT',NULL,'CLE',NULL,0,NULL,0),(401671654,14,'2024-12-08 13:00:00','TB',NULL,'LV',NULL,0,NULL,0),(401671660,14,'2024-12-08 16:05:00','ARI',NULL,'SEA',NULL,0,NULL,0),(401671773,14,'2024-12-08 16:25:00','LAR',NULL,'BUF',NULL,0,NULL,0),(401671774,14,'2024-12-08 16:25:00','SF',NULL,'CHI',NULL,0,NULL,0),(401671788,14,'2024-12-08 20:20:00','KC',NULL,'LAC',NULL,0,NULL,0),(401671690,14,'2024-12-09 20:15:00','DAL',NULL,'CIN',NULL,0,NULL,0),(401671818,15,'2024-12-12 20:15:00','SF',NULL,'LAR',NULL,0,NULL,0),(401671854,15,'2024-12-15 13:00:00','CLE',NULL,'KC',NULL,0,NULL,0),(401671825,15,'2024-12-15 13:00:00','TEN',NULL,'CIN',NULL,0,NULL,0),(401671737,15,'2024-12-15 13:00:00','NO',NULL,'WAS',NULL,0,NULL,0),(401671639,15,'2024-12-15 13:00:00','NYG',NULL,'BAL',NULL,0,NULL,0),(401671731,15,'2024-12-15 13:00:00','CAR',NULL,'DAL',NULL,0,NULL,0),(401671706,15,'2024-12-15 13:00:00','JAX',NULL,'NYJ',NULL,0,NULL,0),(401671860,15,'2024-12-15 13:00:00','HOU',NULL,'MIA',NULL,0,NULL,0),(401671669,15,'2024-12-15 16:25:00','DEN',NULL,'IND',NULL,0,NULL,0),(401671681,15,'2024-12-15 16:25:00','DET',NULL,'BUF',NULL,0,NULL,0),(401671766,15,'2024-12-15 16:25:00','PHI',NULL,'PIT',NULL,0,NULL,0),(401671677,15,'2024-12-15 16:25:00','ARI',NULL,'NE',NULL,0,NULL,0),(401671762,15,'2024-12-15 16:25:00','LAC',NULL,'TB',NULL,0,NULL,0),(401671796,15,'2024-12-15 20:20:00','SEA',NULL,'GB',NULL,0,NULL,0),(401671489,15,'2024-12-16 20:00:00','MIN',NULL,'CHI',NULL,0,NULL,0),(401671697,15,'2024-12-16 20:30:00','LV',NULL,'ATL',NULL,0,NULL,0),(401671811,16,'2024-12-19 20:15:00','CIN',NULL,'CLE',NULL,0,NULL,0),(401671780,16,'2024-12-21 13:00:00','KC',NULL,'HOU',NULL,0,NULL,0),(401671778,16,'2024-12-21 16:30:00','BAL',NULL,'PIT',NULL,0,NULL,0),(401671729,16,'2024-12-22 13:00:00','ATL',NULL,'NYG',NULL,0,NULL,0),(401671494,16,'2024-12-22 13:00:00','BUF',NULL,'NE',NULL,0,NULL,0),(401671868,16,'2024-12-22 13:00:00','CHI',NULL,'DET',NULL,0,NULL,0),(401671862,16,'2024-12-22 13:00:00','IND',NULL,'TEN',NULL,0,NULL,0),(401671621,16,'2024-12-22 13:00:00','NYJ',NULL,'LAR',NULL,0,NULL,0),(401671717,16,'2024-12-22 13:00:00','WAS',NULL,'PHI',NULL,0,NULL,0),(401671732,16,'2024-12-22 13:00:00','CAR',NULL,'ARI',NULL,0,NULL,0),(401671749,16,'2024-12-22 16:05:00','LAC',NULL,'DEN',NULL,0,NULL,0),(401671759,16,'2024-12-22 16:05:00','SEA',NULL,'MIN',NULL,0,NULL,0),(401671673,16,'2024-12-22 16:25:00','LV',NULL,'JAX',NULL,0,NULL,0),(401671874,16,'2024-12-22 16:25:00','MIA',NULL,'SF',NULL,0,NULL,0),(401671790,16,'2024-12-22 20:20:00','DAL',NULL,'TB',NULL,0,NULL,0),(401671692,16,'2024-12-23 20:15:00','GB',NULL,'NO',NULL,0,NULL,0),(401671799,17,'2024-12-25 13:00:00','PIT',NULL,'KC',NULL,0,NULL,0),(401671800,17,'2024-12-25 16:30:00','HOU',NULL,'BAL',NULL,0,NULL,0),(401671876,17,'2024-12-26 20:15:00','CHI',NULL,'SEA',NULL,0,NULL,0),(401671835,17,'2024-12-29 00:00:00','CIN',NULL,'DEN',NULL,0,NULL,0),(401671829,17,'2024-12-29 00:00:00','LAR',NULL,'ARI',NULL,0,NULL,0),(401671832,17,'2024-12-29 00:00:00','NE',NULL,'LAC',NULL,0,NULL,0),(401671846,17,'2024-12-29 00:00:00','NYG',NULL,'IND',NULL,0,NULL,0),(401671842,17,'2024-12-29 00:00:00','WAS',NULL,'ATL',NULL,0,NULL,0),(401671495,17,'2024-12-29 13:00:00','BUF',NULL,'NYJ',NULL,0,NULL,0),(401671725,17,'2024-12-29 13:00:00','MIN',NULL,'GB',NULL,0,NULL,0),(401671738,17,'2024-12-29 13:00:00','NO',NULL,'LV',NULL,0,NULL,0),(401671653,17,'2024-12-29 13:00:00','TB',NULL,'CAR',NULL,0,NULL,0),(401671634,17,'2024-12-29 13:00:00','JAX',NULL,'TEN',NULL,0,NULL,0),(401671765,17,'2024-12-29 16:25:00','PHI',NULL,'DAL',NULL,0,NULL,0),(401671877,17,'2024-12-29 20:20:00','CLE',NULL,'MIA',NULL,0,NULL,0),(401671698,17,'2024-12-30 20:15:00','SF',NULL,'DET',NULL,0,NULL,0),(401671827,18,'2025-01-05 00:00:00','ATL',NULL,'CAR',NULL,0,NULL,0),(401671840,18,'2025-01-05 00:00:00','DAL',NULL,'WAS',NULL,0,NULL,0),(401671838,18,'2025-01-05 00:00:00','DEN',NULL,'KC',NULL,0,NULL,0),(401671843,18,'2025-01-05 00:00:00','DET',NULL,'MIN',NULL,0,NULL,0),(401671844,18,'2025-01-05 00:00:00','GB',NULL,'CHI',NULL,0,NULL,0),(401671826,18,'2025-01-05 00:00:00','TEN',NULL,'HOU',NULL,0,NULL,0),(401671837,18,'2025-01-05 00:00:00','IND',NULL,'JAX',NULL,0,NULL,0),(401671839,18,'2025-01-05 00:00:00','LV',NULL,'LAC',NULL,0,NULL,0),(401671830,18,'2025-01-05 00:00:00','LAR',NULL,'SEA',NULL,0,NULL,0),(401671831,18,'2025-01-05 00:00:00','NE',NULL,'BUF',NULL,0,NULL,0),(401671833,18,'2025-01-05 00:00:00','NYJ',NULL,'MIA',NULL,0,NULL,0),(401671841,18,'2025-01-05 00:00:00','PHI',NULL,'NYG',NULL,0,NULL,0),(401671845,18,'2025-01-05 00:00:00','ARI',NULL,'SF',NULL,0,NULL,0),(401671836,18,'2025-01-05 00:00:00','PIT',NULL,'CIN',NULL,0,NULL,0),(401671828,18,'2025-01-05 00:00:00','TB',NULL,'NO',NULL,0,NULL,0),(401671834,18,'2025-01-05 00:00:00','BAL',NULL,'CLE',NULL,0,NULL,0);
/*!40000 ALTER TABLE `nflp_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nflp_teams`
--

DROP TABLE IF EXISTS `nflp_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nflp_teams` (
  `teamID` varchar(10) NOT NULL,
  `divisionID` int(11) NOT NULL,
  `city` varchar(50) DEFAULT NULL,
  `team` varchar(50) DEFAULT NULL,
  `displayName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`teamID`),
  KEY `ID` (`teamID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nflp_teams`
--

LOCK TABLES `nflp_teams` WRITE;
/*!40000 ALTER TABLE `nflp_teams` DISABLE KEYS */;
INSERT INTO `nflp_teams` VALUES ('ARI',8,'Arizona','Cardinals',NULL),('ATL',6,'Atlanta','Falcons',NULL),('BAL',1,'Baltimore','Ravens',NULL),('BUF',3,'Buffalo','Bills',NULL),('CAR',6,'Carolina','Panthers',NULL),('CHI',5,'Chicago','Bears',NULL),('CIN',1,'Cincinnati','Bengals',NULL),('CLE',1,'Cleveland','Browns',NULL),('DAL',7,'Dallas','Cowboys',NULL),('DEN',4,'Denver','Broncos',NULL),('DET',5,'Detroit','Lions',NULL),('GB',5,'Green Bay','Packers',NULL),('HOU',2,'Houston','Texans',NULL),('IND',2,'Indianapolis','Colts',NULL),('JAX',2,'Jacksonville','Jaguars',NULL),('KC',4,'Kansas City','Chiefs',NULL),('MIA',3,'Miami','Dolphins',NULL),('MIN',5,'Minnesota','Vikings',NULL),('NE',3,'New England','Patriots',NULL),('NO',6,'New Orleans','Saints',NULL),('NYG',7,'New York','Giants','NY Giants'),('NYJ',3,'New York','Jets','NY Jets'),('LV',4,'Las Vegas','Raiders',NULL),('PHI',7,'Philadelphia','Eagles',NULL),('PIT',1,'Pittsburgh','Steelers',NULL),('LAC',4,'Los Angeles','Chargers','LA Chargers'),('SEA',8,'Seattle','Seahawks',NULL),('SF',8,'San Francisco','49ers',NULL),('LAR',8,'Los Angeles','Rams','LA Rams'),('TB',6,'Tampa Bay','Buccaneers',NULL),('TEN',2,'Tennessee','Titans',NULL),('WAS',7,'Washington','Commanders',NULL);
/*!40000 ALTER TABLE `nflp_teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nflp_users`
--

DROP TABLE IF EXISTS `nflp_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nflp_users` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(32) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userID`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nflp_users`
--

LOCK TABLES `nflp_users` WRITE;
/*!40000 ALTER TABLE `nflp_users` DISABLE KEYS */;
INSERT INTO `nflp_users` VALUES (1,'admin','Kj7NAVRgSB/PqkaTY9ZGAjmOG++ks95P','voWQR/Q1H6','Admin','Admin','sgadmin@savagegeek.com',1,1),(2,'jd','0VT2LTyvLZ6UnCYUlfa+0IfmNw4zQMehz8lH1f9UX7FAVu9BawsSYA==','4nml9VA0OM','JD','Henderson','jdhenderson@savagegeek.net',1,0),(43,'Xavier','5whMQLtzcjzlBxWH9uyinxpF3JrpbxiykUcFwWDMwGxfql1kd0MUM6xzQnQvjevo','WBPLD4l06g','Xavier ','Henderson','xavierghenderson10@icloud.com',1,0),(44,'Dee','qd+aCHOlkwgrRCD4fiiZTQiKUTO0uLHRRZ2NQVIjSEtAVu9BawsSYA==','I42Biba59R','DeAngelo','Hawkins','deangelo.hawkins@open-xchange.com',1,0);
/*!40000 ALTER TABLE `nflp_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-13 18:19:39
