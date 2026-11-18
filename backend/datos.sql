-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: zelda_botw_db
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `zelda_categorias`
--

DROP TABLE IF EXISTS `zelda_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zelda_categorias` (
  `categoria_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  PRIMARY KEY (`categoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zelda_categorias`
--

LOCK TABLES `zelda_categorias` WRITE;
/*!40000 ALTER TABLE `zelda_categorias` DISABLE KEYS */;
INSERT INTO `zelda_categorias` VALUES (1,'Criaturas'),(2,'Monstruos'),(3,'Materiales'),(4,'Armas'),(5,'Tesoros');
/*!40000 ALTER TABLE `zelda_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zelda_elementos`
--

DROP TABLE IF EXISTS `zelda_elementos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zelda_elementos` (
  `elemento_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(120) NOT NULL,
  `descripcion` text,
  `imagen` varchar(255) DEFAULT NULL,
  `categoria_id` int NOT NULL,
  PRIMARY KEY (`elemento_id`),
  KEY `fk_zelda_categoria` (`categoria_id`),
  CONSTRAINT `fk_zelda_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `zelda_categorias` (`categoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zelda_elementos`
--

LOCK TABLES `zelda_elementos` WRITE;
/*!40000 ALTER TABLE `zelda_elementos` DISABLE KEYS */;
INSERT INTO `zelda_elementos` VALUES (1,'Horse','These can most often be found on plains...','https://botw-compendium.herokuapp.com/api/v3/compendium/image/horse',1),(2,'Giant Horse','This giant horse is the last of its kind...','https://botw-compendium.herokuapp.com/api/v3/compendium/image/giant_horse',1),(3,'Apple','Common fruit found in Hyrule...','https://botw-compendium.herokuapp.com/api/v3/compendium/image/apple',3);
/*!40000 ALTER TABLE `zelda_elementos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-17 20:04:47
