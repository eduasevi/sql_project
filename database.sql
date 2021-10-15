-- MySQL dump 10.13  Distrib 8.0.26, for macos11 (x86_64)
--
-- Host: 127.0.0.1    Database: devcamp_sql_course_schema
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `Course`
--

DROP TABLE IF EXISTS `Course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Course` (
  `Cid` int NOT NULL,
  `Cname` varchar(10) NOT NULL,
  `Tid` int NOT NULL,
  `Sid` int NOT NULL,
  PRIMARY KEY (`Cid`),
  KEY `fk_teacher_idx` (`Tid`),
  KEY `fk_student_idx` (`Sid`),
  CONSTRAINT `fk_professor` FOREIGN KEY (`Tid`) REFERENCES `Teacher` (`Tid`),
  CONSTRAINT `fk_student` FOREIGN KEY (`Sid`) REFERENCES `Student` (`Sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Grades`
--

DROP TABLE IF EXISTS `Grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Grades` (
  `Gi` int NOT NULL AUTO_INCREMENT,
  `grade` int NOT NULL,
  `Sid` int DEFAULT NULL,
  `Tid` int DEFAULT NULL,
  `Cid` int DEFAULT NULL,
  PRIMARY KEY (`Gi`),
  KEY `fk_teacher_idx` (`Tid`),
  KEY `fk_student_idx` (`Sid`),
  KEY `fk_course_idx` (`Cid`),
  CONSTRAINT `fk__student` FOREIGN KEY (`Sid`) REFERENCES `Student` (`Sid`),
  CONSTRAINT `fk_course` FOREIGN KEY (`Cid`) REFERENCES `Course` (`Cid`),
  CONSTRAINT `fk_teacher` FOREIGN KEY (`Tid`) REFERENCES `Teacher` (`Tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Student`
--

DROP TABLE IF EXISTS `Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Student` (
  `Sid` int NOT NULL AUTO_INCREMENT,
  `Sname` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Sid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Teacher`
--

DROP TABLE IF EXISTS `Teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Teacher` (
  `Tid` int NOT NULL AUTO_INCREMENT,
  `Tname` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Tid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-14 20:10:17




INSERT INTO `devcamp_sql_course_schema`.`Course` (`Cname`, `Tid`, `Sid`) VALUES ('History', '3', '6');
INSERT INTO `devcamp_sql_course_schema`.`Course` (`Cname`, `Tid`, `Sid`) VALUES ('English', '2', '6');
INSERT INTO `devcamp_sql_course_schema`.`Course` (`Cname`, `Tid`) VALUES ('Biology', '1');



INSERT INTO `devcamp_sql_course_schema`.`Grades` (`grade`, `Sid`, `Tid`, `Cid`) VALUES ('10', '6', '3', '3');
INSERT INTO `devcamp_sql_course_schema`.`Grades` (`grade`, `Sid`, `Tid`, `Cid`) VALUES ('6', '6', '2', '2');
INSERT INTO `devcamp_sql_course_schema`.`Grades` (`grade`, `Sid`, `Tid`, `Cid`) VALUES ('7', '6', '1', '1');





USE devcamp_sql_course_schema;

SELECT id , Tname, avg(grade) 
FROM devcamp_sql_course_schema.Grades
INNER JOIN devcamp_sql_course_schema.Teacher
ON devcamp_sql_course_schema.Grades.teacher_id = devcamp_sql_course_schema.Teacher.id
GROUP BY devcamp_sql_course_schema.Grades.teacher_id ;

SELECT Sname, 
MAX(grade) as Max_score 
FROM Student INNER JOIN grades 
ON Student.id = grades.student_id
GROUP BY Sname;

SELECT Course.Cname, Student.Sname
FROM Student INNER JOIN Grades ON
Student_id = Grades.Gi
INNER JOIN Course ON Course.id = Grades.Gi
GROUP BY Course.Cname,
Student.Sname;

SELECT Course.Cname, AVG(Grades.grade) AS Avg_Grade
FROM Grades INNER JOIN Course ON 
Course.id = Grades.course_id
GROUP BY Course.Cname
ORDER BY AVG(Grades.grade);
