CREATE DATABASE  IF NOT EXISTS `swp391` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `swp391`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: swp391
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `feedback_id` int NOT NULL AUTO_INCREMENT,
  `menteeID` int DEFAULT NULL,
  `mentorID` int DEFAULT NULL,
  `rate` float DEFAULT NULL,
  `cmt` varchar(3000) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`feedback_id`),
  KEY `menteeID_idx` (`menteeID`),
  KEY `mentorID_idx` (`mentorID`),
  CONSTRAINT `menteeID` FOREIGN KEY (`menteeID`) REFERENCES `user` (`u_id`),
  CONSTRAINT `mentorID` FOREIGN KEY (`mentorID`) REFERENCES `user` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,2,3,5,'cuc ki de hieu','2023-06-19 00:00:00',1),(2,5,10,4.5,'day kha de hieu va tot','2023-05-30 00:00:00',1),(3,17,3,3.3,'can phai truyen dat de hoc sinh de dang hieu hon','2023-04-02 00:00:00',1),(4,19,11,4.5,'cuc ki de hieu nhung can them nhieu bai tap cu the','2023-05-24 00:00:00',1);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `request` (
  `request_id` int NOT NULL AUTO_INCREMENT,
  `RmenteeID` int NOT NULL,
  `RmentorID` int NOT NULL,
  `skill_id` int DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  `title` varchar(1000) DEFAULT NULL,
  `deadline_date` date DEFAULT NULL,
  `deadline_hour` time DEFAULT NULL,
  `content` varchar(3000) DEFAULT NULL,
  PRIMARY KEY (`request_id`),
  KEY `RmenteeID_idx` (`RmenteeID`),
  KEY `RmentorID_idx` (`RmentorID`),
  KEY `skill_id_idx` (`skill_id`),
  KEY `status_id_idx` (`status_id`),
  CONSTRAINT `RmenteeID` FOREIGN KEY (`RmenteeID`) REFERENCES `user` (`u_id`),
  CONSTRAINT `RmentorID` FOREIGN KEY (`RmentorID`) REFERENCES `user` (`u_id`),
  CONSTRAINT `skill_id` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`skill_id`),
  CONSTRAINT `status_id` FOREIGN KEY (`status_id`) REFERENCES `requeststatus` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `request`
--
LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` VALUES (1,1,3,1,1,'lam the nao de hoc tot java ','2023-07-30','12:00:00','tai lieu de hoc java la gi');
INSERT INTO `request` VALUES (2,4,6,8,1,'Học C#','2023-07-30','12:00:00','tai lieu de hoc C# la gi');
INSERT INTO `request` VALUES (3,4,10,2,1,'Học Java','2023-07-30','12:00:00','tai lieu de hoc java la gi');
INSERT INTO `request` VALUES (4,4,11,3,1,'Học Python','2023-07-30','12:00:00','Học ngôn ngữ Python');
INSERT INTO `swp391`.`request` (`RmenteeID`, `RmentorID`, `skill_id`, `status_id`, `title`, `deadline_date`, `deadline_hour`, `content`) 
VALUES ('4', '3', '8', '1', 'hoc framework', '2023-07-1', '3:00', 'muon hoc them framework');
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requeststatus`
--

DROP TABLE IF EXISTS `requeststatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requeststatus` (
  `status_id` int NOT NULL AUTO_INCREMENT,
  `status_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requeststatus`
--

LOCK TABLES `requeststatus` WRITE;
/*!40000 ALTER TABLE `requeststatus` DISABLE KEYS */;
INSERT INTO `requeststatus` VALUES (1,'Open'),(2,'Processing'),(3,'Cancel'),(4,'Closed');
/*!40000 ALTER TABLE `requeststatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` int NOT NULL,
  `role_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Guest'),(2,'Mentee'),(3,'Mentor'),(4,'Admin');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skillofcv`
--

DROP TABLE IF EXISTS `skillofcv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skillofcv` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Sofcv_id` int NOT NULL,
  `Sofskill_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Sofcv_id_idx` (`Sofcv_id`),
  KEY `Sofskill_id_idx` (`Sofskill_id`),
  CONSTRAINT `Sofcv_id` FOREIGN KEY (`Sofcv_id`) REFERENCES `view_cv` (`viewcv_id`),
  CONSTRAINT `Sofskill_id` FOREIGN KEY (`Sofskill_id`) REFERENCES `skills` (`skill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skillofcv`
--

LOCK TABLES `skillofcv` WRITE;
/*!40000 ALTER TABLE `skillofcv` DISABLE KEYS */;
INSERT INTO `skillofcv` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,1),(5,5,2),(6,11,1),(7,12,2),(10,13,3),(13,14,5);
/*!40000 ALTER TABLE `skillofcv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skillofrequest`
--

DROP TABLE IF EXISTS `skillofrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skillofrequest` (
  `idskillofrequest` int NOT NULL AUTO_INCREMENT,
  `idrequest` int NOT NULL,
  `idskill` int NOT NULL,
  PRIMARY KEY (`idskillofrequest`),
  KEY `idrequest_idx` (`idrequest`),
  KEY `idskill_idx` (`idskill`),
  CONSTRAINT `idrequest` FOREIGN KEY (`idrequest`) REFERENCES `request` (`request_id`),
  CONSTRAINT `idskill` FOREIGN KEY (`idskill`) REFERENCES `skills` (`skill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skillofrequest`
--

LOCK TABLES `skillofrequest` WRITE;
/*!40000 ALTER TABLE `skillofrequest` DISABLE KEYS */;
INSERT INTO `skillofrequest` VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,1),(5,2,2);
/*!40000 ALTER TABLE `skillofrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skills` (
  `skill_id` int NOT NULL AUTO_INCREMENT,
  `skill_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`skill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` VALUES (1,'C',1),(2,'Java',1),(3,'Python',1),(4,'C#',1),(5,'HTML',1);
UPDATE `swp391`.`skills` SET `skill_name` = 'Spring Framework' WHERE (`skill_id` = '4');
UPDATE `swp391`.`skills` SET `skill_name` = '.NET Framework' WHERE (`skill_id` = '5');
INSERT INTO `swp391`.`skills` VALUES ('6', 'React',1);
INSERT INTO `swp391`.`skills` VALUES ('7', 'PHP',1);
INSERT INTO `swp391`.`skills` VALUES ('8', 'C#',1);
INSERT INTO `swp391`.`skills` VALUES ('9', 'Angular',0);
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `u_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` int DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phoneNumber` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `role` int DEFAULT NULL,
  `user_status` int DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `avatar` varchar(3000) DEFAULT NULL,
  `key` varchar(10),
  PRIMARY KEY (`u_id`),
  KEY `role_idx` (`role`),
  CONSTRAINT `role` FOREIGN KEY (`role`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES 
(1,'viethoang','1234','Hắc Việt Hoàng','2002-07-23',1,'hoanghv@gmail.com','0339687507','thanhhoa',1,1,'2020-10-21 00:00:00',NULL,NULL),
(2,'thanhtung','123456789','Thanh Tùng','2002-09-12',0,'tungbeo@gmail.com','0968757507','haiduongcity',4,1,'2021-11-10 00:00:00',NULL,NULL),
(3,'datnd','12345','Đức Đạt','2002-09-21',0,'datnd@gmail.com','0946858578','gialoc',3,1,'2022-09-21 00:00:00',NULL,NULL),
(4,'quanlh','12345','Lê Hồng Quân','2002-10-10',1,'hongquan101002@gmail.com','0973379997','Phú Thọ',2,1,'2023-01-05 00:00:00',NULL,NULL),
(5,'vietanh','12345','Việt Anh','1999-05-05',1,'vietanh','0916185178','hainoi',1,1,'2018-05-06 00:00:00',NULL,NULL),
(6,'hoangdeptrai','123456','John','2004-12-15',1,'hacviethoang162002@gmail.com','0765248600','thanhhoa',3,1,'2017-04-03 00:00:00',NULL,NULL),
(7,'tung12','FycyH','Michel','2004-12-05',0,'hoanghv@gmail.com','0994512780','thanhhoa',3,1,'2016-07-05 00:00:00',NULL,NULL),
(8,'hoangne','TGs0k','hoangday','2003-12-05',1,'hoanghvhe163990@fpt.edu.vn','0146795220','thanhhoa',1,1,'2019-04-07 00:00:00',NULL,NULL),
(9,'admin','admin','admin','2004-12-12',1,'hoanghvhe163990@fpt.edu.vn','0339687507','vietnam',4,2,'2015-12-12 00:00:00',NULL,NULL),
(10,'huyenmai','1234','Nguyễn Huyền Mai','2003-12-14',0,'tunghthe162281@fpt.edu.vn','0147856487','vietnam',3,2,'2018-12-09 00:00:00',NULL,NULL),
(11,'ngocdung','123456789','Ngọc Dung','1999-11-13',1,'ngocdung345@gmail.com','0146785441','hagiang',3,2,'2016-10-08 00:00:00',NULL,NULL),
(12,'tatthanh','456789','nguyen tat thanh','1998-10-12',0,'nguyentatthanh345@gmail.com','0146858578','nghe an',3,1,'2018-08-09 00:00:00',NULL,NULL),
(13,'duchuy','123456','nguyenduchuy','2000-08-06',1,'nguyenduchuy123@gmail.com','0337514546','hai duong',3,1,'2017-06-05 00:00:00',NULL,NULL),
(14,'myhoa','456789','truong my hoa','2002-06-07',0,'truongmyhoa2002@gmail.com','0337845762','thanh hoa',3,1,'2016-05-04 00:00:00',NULL,NULL),
(15,'mytam','456789','le thi my tam','2001-04-02',0,'lethimytam2001@gmail.com','0124598754','bac ninh',3,1,'2017-06-05 00:00:00',NULL,NULL),
(16,'chuthihang','159753','chu thi thu hang','2001-04-03',0,'chuthithuhang2004@gmail.com','0364587923','thanh hoa',3,1,'2020-04-06 00:00:00','',NULL),
(17,'levanmanh','147369258','le van manh','2002-09-04',1,'lavanmanh0304@gmail.com','0425986753','nghe an',2,1,'2020-05-05 00:00:00',NULL,NULL),
(18,'admin2','123456','admin2','1999-10-01',1,'admin2@gmail.com','0365417423','ha nam',4,1,'2015-01-01 00:00:00',NULL,NULL),
(19,'ducthang','246813579','nguyen duc thang','1998-06-01',1,'nguyenducthang123@gmail.com','0197858578','ha noi',2,1,'2016-02-02 00:00:00',NULL,NULL),
(20,'vananh','150246','le van anh','2000-04-02',0,'lavananh2306@gmail.com','0378454596','ha noi',2,1,'2017-04-01 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `view_cv`
--

DROP TABLE IF EXISTS `view_cv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `view_cv` (	
  `viewcv_id` int NOT NULL AUTO_INCREMENT,	
  `user_id` int DEFAULT NULL,	
  `profession` mediumtext,	
  `profession introduction` mediumtext,	
  `service descreption` mediumtext,	
  `achivement` mediumtext,	
  `framework` mediumtext,	
  `createDate` datetime DEFAULT NULL,	
  PRIMARY KEY (`viewcv_id`),	
  KEY `user_id_idx` (`user_id`),	
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`u_id`)	
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;	
/*!40101 SET character_set_client = @saved_cs_client */;	
--	
-- Dumping data for table `view_cv`	
--	
LOCK TABLES `view_cv` WRITE;	
/*!40000 ALTER TABLE `view_cv` DISABLE KEYS */;	
INSERT INTO `view_cv` VALUES (1,3,'favicon_icon','FPTU','An open-minded, diversified and thriving to success person and looking forward to challenges. Interested in cloud technology, digital innovation & adaptation and how we can utilize those to improve the society and solve problems.','Dean\'s Scholarship 2012','Career Development','2022-10-06 00:00:00'),(2,10,'favicon_icon','DBH','I\'m a programming teacher with over 10 years of experience teaching languages such as Java, Python, and HTML/CSS. I\'ve worked with students of all ages and skill levels, and I love seeing them progress and achieve their goals','Many of my former students have gone on to work at prestigious tech companies','Career Development','2022-10-06 00:00:00'),(3,11,'favicon_icon','BKA','Hello, my name is [Name] and I am a coding instructor with a strong background in software development. I have taught courses on data structures, algorithms, and web development frameworks. My passion is helping students gain the skills they need to succeed in the tech industry','My achievements include creating a unique coding bootcamp that has helped dozens of students launch successful careers in the tech industry.','Career Development','2022-10-06 00:00:00'),(4,12,'favicon_icon','QHI','As a programming teacher with a PhD in Computer Science, I have dedicated my career to educating the next generation of programmers. With a focus on applied learning and real-world projects, my classes challenge students to think critically and creatively.','My recent achievement includes publishing a research paper on the effectiveness of project-based learning in programming education.','Career Development','2022-10-06 00:00:00'),(5,13,'favicon_icon','BKA','With over 15 years of experience in software engineering and programming education, I bring a wealth of knowledge to my role as a coding instructor. I specialize in working with beginners, and I take pride in making complex concepts easy to understand.','My achievement includes receiving a teaching award for outstanding contributions to student learning and academic success.','Career Development','2022-10-06 00:00:00'),(6,14,'favicon_icon','FPTU','My background in both education and software development allows me to approach programming instruction from a unique perspective. I believe that learning to code should be fun and engaging, and I work hard to create an environment where students can thrive.','My recent achievement includes spearheading a program to teach coding to underprivileged youth in my local community.','Career Development','2022-10-06 00:00:00'),(7,15,'favicon_icon','FPTU','I\'m a programming teacher with a passion for open-source technology and collaboration. By fostering a community of learners, I help students develop the skills they need to contribute to the wider tech community and build amazing projects.','My achievement includes completing advanced coursework in machine learning and data science, and integrating these concepts into my programming curriculum.','Career Development','2022-10-06 00:00:00'),(8,16,'favicon_icon','QHI','Having worked in the tech industry for over a decade, I know what it takes to succeed as a programmer. As a teacher, I strive to instill those same skills in my students. From problem-solving to project management, my classes cover all aspects of modern programming.','My achievement includes coaching students through rigorous technical interviews and securing job offers from top tech companies.','Career Development','2022-10-06 00:00:00'),(9,17,'FPTU','ky nang java la cuc tot ben canh do','xin trao toi la nguoi day cho ban khi ma toi da co 15 nam kinh nghiem','FPTU','CareerDavelopment','2022-10-06 00:00:00'),(10,2,'gsgsgs','gsgsgs','gsgsgs','sgsgs','gsgsg','2023-07-18 00:00:00'),(11,2,'sgsgsgs','sgsgsgs','sfsfs','gsgsgs','fsfsfs','2023-07-18 00:00:00'),(12,2,'FPTU','FPTU','FPTU','FPTU','FPTU','2023-07-18 00:00:00'),(13,2,'FPTU','FPTU','sfsfs','sfsfs','sfsfs','2023-07-18 00:00:00'),(14,2,'FPTU','FPTU','FPTU','FPTU','FPTU','2023-07-18 00:00:00');/*!40000 ALTER TABLE `view_cv` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-21  1:04:18
