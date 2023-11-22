-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: PCF_SCHEMA2
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.22.04.1

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
-- Table structure for table `Mensajes`
--

DROP TABLE IF EXISTS `Mensajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mensajes` (
  `idMensajes` int NOT NULL,
  `Mensaje` varchar(405) DEFAULT NULL,
  `Usuarios_idClientes` int NOT NULL,
  PRIMARY KEY (`idMensajes`),
  KEY `fk_Mensajes_Usuarios1_idx` (`Usuarios_idClientes`),
  CONSTRAINT `fk_Mensajes_Usuarios1` FOREIGN KEY (`Usuarios_idClientes`) REFERENCES `Usuarios` (`idClientes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mensajes`
--

LOCK TABLES `Mensajes` WRITE;
/*!40000 ALTER TABLE `Mensajes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Mensajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pedido`
--

DROP TABLE IF EXISTS `Pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pedido` (
  `Usuarios_idClientes` int NOT NULL,
  `Plato_idPlato` int NOT NULL,
  PRIMARY KEY (`Usuarios_idClientes`,`Plato_idPlato`),
  KEY `fk_Usuarios_has_Plato_Plato1_idx` (`Plato_idPlato`),
  KEY `fk_Usuarios_has_Plato_Usuarios1_idx` (`Usuarios_idClientes`),
  CONSTRAINT `fk_Usuarios_has_Plato_Plato1` FOREIGN KEY (`Plato_idPlato`) REFERENCES `Plato` (`idPlato`),
  CONSTRAINT `fk_Usuarios_has_Plato_Usuarios1` FOREIGN KEY (`Usuarios_idClientes`) REFERENCES `Usuarios` (`idClientes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pedido`
--

LOCK TABLES `Pedido` WRITE;
/*!40000 ALTER TABLE `Pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `Pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Plato`
--

DROP TABLE IF EXISTS `Plato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Plato` (
  `idPlato` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `Calorias` float DEFAULT NULL,
  `Proteinas` float DEFAULT NULL,
  `Carbohidratos` float DEFAULT NULL,
  `grasas` float DEFAULT NULL,
  `Precio` float DEFAULT NULL,
  `Restaurante_idRestaurante` int NOT NULL,
  `imagen` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idPlato`),
  KEY `fk_Plato_Restaurante_idx` (`Restaurante_idRestaurante`),
  CONSTRAINT `fk_Plato_Restaurante` FOREIGN KEY (`Restaurante_idRestaurante`) REFERENCES `Restaurante` (`idRestaurante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Plato`
--

LOCK TABLES `Plato` WRITE;
/*!40000 ALTER TABLE `Plato` DISABLE KEYS */;
INSERT INTO `Plato` VALUES (1,'medieoro',2000,50,100,155,50000,2,'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQPBINJa7UbPkPk9Fd9aDfCvpd3EKe-JP3tptWUnOA4Wa3ZAk2h'),(2,'sushiburger',1000,20,100,57,10000,2,'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTfwA3UK4JVBMoSZciNydusWFQjvLqB2IJCg6hSs2s1LA8uwaKD'),(3,'mediebuuurger',2000,80,100,64,5000,2,'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSdOzFqJqtcmVTHjtVoDbwnQeCKgi3nDD46NzkNB0kxsi7-EPwX'),(5,'Clasica',1112,120,25.48,56.44,2000,2,'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSMLQ9feYcpGZg8w9_mlu-D0wlFvblP5186RyTvKNniAJ-hGCcX'),(6,'La bocha',1000,60,100,50,4000,2,'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSpZ04eBC0ReoWy_A5e_awD-B_rnWcqUawyoZWwUbW-LwsEutB7'),(7,'Renoburger',450,20,30,27.7,1200,2,'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRX17Wsmzgnnh6BAGif1xx41vUByGrtfmJAdFxuaWanlvETyq6w'),(8,'Chicking',600,40,30,19,2800,2,'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTKKY8lIRkgYJP-gLqMjGTyQzO3MCrimOhbTzDe0I5MqzMFWICi'),(23,'omelette jurasico',340,23,4,25,1200,3,'https://www.circuitogastronomico.com/wp-content/uploads/2023/06/carpinteria-1.jpg'),(24,'Croissant de Triceratops',377,4,39,20,900,3,'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRpuGYfxyYs3kWEEobreJk5XQq-jrZBSCvVfr1S5G2BPOoZG2bZ'),(25,'Batido de Dino-Frutas',211,11,42,1,800,3,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZ9zU6qPTLBFkHyhSo4CUdCETDiKedrNFFxA&usqp=CAU'),(26,'T-Rex Benedict',733,30,30,55,1500,3,'https://www.allrecipes.com/thmb/QVMaPhXnj1HQ70C7Ka9WYtuipHg=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/17205-eggs-benedict-DDMFS-4x3-a0042d5ae1da485fac3f468654187db0.jpg'),(27,'Yogur de Velocirraptor',230,5,51,1,1000,3,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqv3Dyofze3QHAJrkTpk2EoDjtb5TFQbPKug&usqp=CAU'),(29,'Ensalada de Archaeopteryx',300,9,72,95,2560,3,'https://preventionrd.com/wp-content/uploads/2021/05/Dino-Nugget-Chicken-Caesar-Salad-FI.jpg'),(30,'Helado de Extinción',274,5,19,20,860,3,'https://joyfoodsunshine.com/wp-content/uploads/2020/07/homemade-vanilla-ice-cream-recipe-6.jpg'),(31,'Dino Nuggets',274,5,19,20,860,3,'https://www.thisvivaciouslife.com/wp-content/uploads/2022/02/Thanksgiving-Charcuterie-Board-160.jpg'),(32,'tallarines chinos',588,21.6,114,3.6,1200,4,'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSkkvaIFEeHlpcuNXkA-MhPSmqzCbJDogHb6yj5Isd4QZI3Eebn'),(33,'gua bao',826,32,90,36,900,4,'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTAy1TjqnvzkeLFAGBvSUVmMWjY__1INiWYv3U-jewbk9QB9jH4'),(34,'spring roll',888,22.2,114,37.2,800,4,'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQ384YOgulj0lNIXk2n0NGRqOTu-tgmSTJJ9gU1tI_EsgUOylCb'),(35,'steamed buns',1085,44,180,20.5,1500,4,'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTugvd1PRbu5iDkSzBwztJ5slWkcK_vtu0DHAvyJbpxEMLhWNjS'),(36,'chicken curry',789,78,51,29.1,1000,4,'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTJ0dzLoPF0jrxo0TPw5GaUck4-3Fk2GUU8t7_iqsnCMqrO5vrJ'),(37,'pollo naranja con arroz',800,32,138,21,1000,4,'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcT1u0TAY3lGYROS9Uwn15h6-SkKXYlNN0hULVcDgDcQVHZZG2SN'),(38,'mochi',1134,11.7,225,23.4,2560,4,'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTIVStlSC2rf0hlELyFNul3VxK7h1NXBqyWCevvUMUciuYIC0cM'),(39,'Dango',483,6,111,1.4,860,4,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-QbQJmyzpIx1_zrmYJOu_24n45kSz75W1Nsnb0IOOsQXO8g4T'),(40,'jiao zi',669,21.9,93,27.3,860,4,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQU-1VVDYJFV-gpgC30upyXgSRC_a2LSNHwQvSQHSxOkLY2-CLN'),(41,'omelette jurasico',762,19.2,135,15.9,1200,4,'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQut9OCo-kjtePs_0Q49mIHJDuscoHM8fUDRygtEwoJha0kk5L0');
/*!40000 ALTER TABLE `Plato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Restaurante`
--

DROP TABLE IF EXISTS `Restaurante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Restaurante` (
  `idRestaurante` int NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Tematica` varchar(45) DEFAULT NULL,
  `Direccion` varchar(45) DEFAULT NULL,
  `Telefono` varchar(45) DEFAULT NULL,
  `Calificacion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idRestaurante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Restaurante`
--

LOCK TABLES `Restaurante` WRITE;
/*!40000 ALTER TABLE `Restaurante` DISABLE KEYS */;
INSERT INTO `Restaurante` VALUES (2,'MedieBurger','Medieval','Vilela 4680','2222-2222','Medieburger'),(3,'Tea-Rex','Prehistorica','Bazurco 2394','3333-3333','A'),(4,'Orifu','Oriental','Consituyentes 5070','4444-4444','S'),(10,'Piazza Guacha','Gauchezca','Arribeños 3198','1111-1111','B');
/*!40000 ALTER TABLE `Restaurante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuarios`
--

DROP TABLE IF EXISTS `Usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Usuarios` (
  `idClientes` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Mail` varchar(45) DEFAULT NULL,
  `Ncontacto` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idClientes`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuarios`
--

LOCK TABLES `Usuarios` WRITE;
/*!40000 ALTER TABLE `Usuarios` DISABLE KEYS */;
INSERT INTO `Usuarios` VALUES (1,'s','as','434'),(2,'1','s','as'),(3,'1','s','as'),(4,'HUgo','Andrada','1234'),(5,'saSSASAS','SASASAS','ASASAS'),(6,'saSSASAS','SASASAS','ASASAS'),(7,'saSSASAS','SASASAS','ASASAS');
/*!40000 ALTER TABLE `Usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-22 17:35:12
