-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: 127.0.0.1    Database: pttk
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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'admin','A6xnQhbz4Vx2HuGl4lXwZ5U2I8iziLRFnhP5eNfIRvQ='),(2,'mabe','A6xnQhbz4Vx2HuGl4lXwZ5U2I8iziLRFnhP5eNfIRvQ=');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `city` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `houseno` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'Hà Nội','Hà Đông','Số 1 Nguyễn Trãi'),(2,'Hà Nội','Hà Đông','Số 1 Nguyễn Trãi');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `square` float DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (1,100.8,'HN');
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `employeeID` int NOT NULL,
  `orderID` int NOT NULL,
  `totalPrice` float DEFAULT NULL,
  `dateCreated` varchar(255) DEFAULT NULL,
  `totalDiscount` float DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKBill221421` (`employeeID`),
  KEY `FKBill584975` (`orderID`),
  CONSTRAINT `FKBill221421` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`ID`),
  CONSTRAINT `FKBill584975` FOREIGN KEY (`orderID`) REFERENCES `order` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `birth`
--

DROP TABLE IF EXISTS `birth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `birth` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `day` varchar(255) DEFAULT NULL,
  `month` varchar(255) DEFAULT NULL,
  `years` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `birth`
--

LOCK TABLES `birth` WRITE;
/*!40000 ALTER TABLE `birth` DISABLE KEYS */;
INSERT INTO `birth` VALUES (1,'1','1','2002'),(2,'1','1','2002');
/*!40000 ALTER TABLE `birth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `numWorkers` int DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (1,'CS1',30,'MB');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `customerID` int NOT NULL,
  `createdAt` varchar(255) DEFAULT NULL,
  `updatedAt` varchar(255) DEFAULT NULL,
  `totalQuantity` int DEFAULT NULL,
  `totalPrice` float DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKCart271034` (`customerID`),
  CONSTRAINT `FKCart271034` FOREIGN KEY (`customerID`) REFERENCES `customer` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,1,'21/12/2023','21/12/2023',1,153999),(2,1,'21/12/2023','21/12/2023',1,34999),(3,1,'21/12/2023','21/12/2023',0,0),(4,2,'21/12/2023','21/12/2023',1,5005000),(5,2,'21/12/2023','21/12/2023',7,35791),(6,2,'21/12/2023','21/12/2023',0,0);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `userID` int NOT NULL,
  `accountNum` varchar(255) DEFAULT NULL,
  `unveriID` int DEFAULT NULL,
  `IP` varchar(255) DEFAULT NULL,
  `veriID` int DEFAULT NULL,
  `memberID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKCustomer563448` (`userID`),
  CONSTRAINT `FKCustomer563448` FOREIGN KEY (`userID`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,1,'1510',NULL,NULL,1,2),(2,2,'9999',NULL,NULL,2,2);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `timesheetID` int NOT NULL,
  `branchID` int NOT NULL,
  `salaryGradeID` int NOT NULL,
  `areaID` int NOT NULL,
  `userID` int NOT NULL,
  `salaries` float DEFAULT NULL,
  `startedDate` varchar(255) DEFAULT NULL,
  `CEOID` int DEFAULT NULL,
  `profession` varchar(255) DEFAULT NULL,
  `accID` int DEFAULT NULL,
  `expYears` int DEFAULT NULL,
  `stoID` int DEFAULT NULL,
  `experience` varchar(255) DEFAULT NULL,
  `sysID` int DEFAULT NULL,
  `workDays` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKEmployee562366` (`timesheetID`),
  KEY `FKEmployee456256` (`branchID`),
  KEY `FKEmployee53117` (`salaryGradeID`),
  KEY `FKEmployee388695` (`areaID`),
  KEY `FKEmployee731554` (`userID`),
  CONSTRAINT `FKEmployee388695` FOREIGN KEY (`areaID`) REFERENCES `area` (`ID`),
  CONSTRAINT `FKEmployee456256` FOREIGN KEY (`branchID`) REFERENCES `branch` (`ID`),
  CONSTRAINT `FKEmployee53117` FOREIGN KEY (`salaryGradeID`) REFERENCES `salarygrade` (`ID`),
  CONSTRAINT `FKEmployee562366` FOREIGN KEY (`timesheetID`) REFERENCES `timesheet` (`ID`),
  CONSTRAINT `FKEmployee731554` FOREIGN KEY (`userID`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,1,1,1,1,2,2000,'1/1/2021',1,'TS',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favourite`
--

DROP TABLE IF EXISTS `favourite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favourite` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `customerID` int NOT NULL,
  `productName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKFavourite606101` (`customerID`),
  CONSTRAINT `FKFavourite606101` FOREIGN KEY (`customerID`) REFERENCES `customer` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favourite`
--

LOCK TABLES `favourite` WRITE;
/*!40000 ALTER TABLE `favourite` DISABLE KEYS */;
/*!40000 ALTER TABLE `favourite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fullname`
--

DROP TABLE IF EXISTS `fullname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fullname` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fullname`
--

LOCK TABLES `fullname` WRITE;
/*!40000 ALTER TABLE `fullname` DISABLE KEYS */;
INSERT INTO `fullname` VALUES (1,'Minh Hiếu','Đặng'),(2,'Hiếu','Admin');
/*!40000 ALTER TABLE `fullname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `employeeID` int NOT NULL,
  `customerID` int NOT NULL,
  `context` varchar(255) DEFAULT NULL,
  `timeStamp` varchar(255) DEFAULT NULL,
  `from` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKNotificati266688` (`employeeID`),
  KEY `FKNotificati809849` (`customerID`),
  CONSTRAINT `FKNotificati266688` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`ID`),
  CONSTRAINT `FKNotificati809849` FOREIGN KEY (`customerID`) REFERENCES `customer` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `cartID` int NOT NULL,
  `paymentID` int NOT NULL,
  `shipmentID` int NOT NULL,
  `voucherID` int NOT NULL,
  `employeeID` int NOT NULL,
  `date` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKOrder42245` (`cartID`),
  KEY `FKOrder909427` (`paymentID`),
  KEY `FKOrder752808` (`shipmentID`),
  KEY `FKOrder308485` (`voucherID`),
  KEY `FKOrder604606` (`employeeID`),
  CONSTRAINT `FKOrder308485` FOREIGN KEY (`voucherID`) REFERENCES `voucher` (`ID`),
  CONSTRAINT `FKOrder42245` FOREIGN KEY (`cartID`) REFERENCES `cart` (`ID`),
  CONSTRAINT `FKOrder604606` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`ID`),
  CONSTRAINT `FKOrder752808` FOREIGN KEY (`shipmentID`) REFERENCES `shipment` (`ID`),
  CONSTRAINT `FKOrder909427` FOREIGN KEY (`paymentID`) REFERENCES `payment` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,1,2,3,2,1,'21/12/2023'),(2,2,1,1,1,1,'21/12/2023'),(3,4,1,1,1,1,'21/12/2023'),(4,5,1,3,1,1,'21/12/2023');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `fees` float DEFAULT NULL,
  `names` varchar(255) DEFAULT NULL,
  `CODID` int DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `credID` int DEFAULT NULL,
  `cardNum` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `interID` int DEFAULT NULL,
  `accountNum` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,10000,'Hand by hand',1,'VND',NULL,NULL,NULL,NULL,NULL,NULL),(2,100000,'WESTERN UNION',NULL,NULL,NULL,NULL,NULL,1,'1234567','8888'),(3,25000,'VISA',NULL,NULL,1,'123123321','visa',NULL,NULL,NULL);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone`
--

DROP TABLE IF EXISTS `phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phone` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `phoneNum` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone`
--

LOCK TABLES `phone` WRITE;
/*!40000 ALTER TABLE `phone` DISABLE KEYS */;
INSERT INTO `phone` VALUES (1,'0120120112','Cellphone'),(2,'0120110112','Cellphone');
/*!40000 ALTER TABLE `phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `employeeID` int NOT NULL,
  `providerID` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `releaseDate` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `bookID` int DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `bookCategory` varchar(255) DEFAULT NULL,
  `pageNum` int DEFAULT NULL,
  `volume` int DEFAULT NULL,
  `phoneID` int DEFAULT NULL,
  `phoneType` varchar(255) DEFAULT NULL,
  `phoneBrand` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `spec` varchar(255) DEFAULT NULL,
  `clothesID` int DEFAULT NULL,
  `clothesType` varchar(255) DEFAULT NULL,
  `clothesBrand` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKProduct481284` (`providerID`),
  KEY `FKProduct640168` (`employeeID`),
  CONSTRAINT `FKProduct481284` FOREIGN KEY (`providerID`) REFERENCES `provider` (`ID`),
  CONSTRAINT `FKProduct640168` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,1,1,'Vo nhat','Truyen vo nhat','1-1-1999','B',1,'Vu Trong Phung','B',100,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,1,2,'Khong gia dinh','truyen ve cau be khong gia dinh','1-1-2000','B',2,'Victor Hugo','B',300,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,1,3,'Khong gia dinh','truyen ve cau be khong gia dinh','1-1-2000','B',3,'Victor Hugo','B',300,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,1,4,'Khong tet','khong co tet','1-1-2000','B',4,'Tet','B',123,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,1,5,'Tuoi tho du doi','Sach ve chien tranh phap thuoc','10-10-2010','Truyen chu',5,'Ten tac gia','B',300,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,1,6,'iPhone 15 Pro Max','Rich ppl phone','10-10-2010','P',NULL,NULL,NULL,NULL,NULL,1,'Smartphone','Apple','Pro Max','Very String',NULL,NULL,NULL,NULL,NULL),(7,1,7,'iPhone 15 Pro Max','Rich ppl phone','10-10-2010','P',NULL,NULL,NULL,NULL,NULL,2,'Smartphone','Apple','Pro Max','Very String',NULL,NULL,NULL,NULL,NULL),(8,1,8,'Conan','Truyen tranh trinh tham','1-1-2003','Tre em',6,'Edogawa','B',80,55,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,1,9,'Doremon','Truyen tranh chu meo may','1-1-1999','Tre em',9,'Fujiko','B',80,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,1,10,'Ao ngu pyjama','Ao am giu nhiet thoai mai','10-2-2021','C',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,'Ao dong','UNIQLO','Den','Unisex');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productitem`
--

DROP TABLE IF EXISTS `productitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productitem` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `productID` int NOT NULL,
  `employeeID` int NOT NULL,
  `price` float DEFAULT NULL,
  `addedDate` varchar(255) DEFAULT NULL,
  `inStock` int DEFAULT NULL,
  `discount` float DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKProductIte271573` (`productID`),
  KEY `FKProductIte71286` (`employeeID`),
  CONSTRAINT `FKProductIte271573` FOREIGN KEY (`productID`) REFERENCES `product` (`ID`),
  CONSTRAINT `FKProductIte71286` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productitem`
--

LOCK TABLES `productitem` WRITE;
/*!40000 ALTER TABLE `productitem` DISABLE KEYS */;
INSERT INTO `productitem` VALUES (1,1,1,123,'21/12/2023',544,10),(4,2,1,20000,'21/12/2023',21,1),(5,5,1,88100,'21/12/2023',44,10000),(6,6,1,5000000,'21/12/2023',22,10000),(7,10,1,400000,'21/12/2023',30,25000);
/*!40000 ALTER TABLE `productitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productitem_cart`
--

DROP TABLE IF EXISTS `productitem_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productitem_cart` (
  `ProductItemID` int NOT NULL,
  `CartID` int NOT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`ProductItemID`,`CartID`),
  KEY `FKProductIte574009` (`CartID`),
  CONSTRAINT `FKProductIte345807` FOREIGN KEY (`ProductItemID`) REFERENCES `productitem` (`ID`),
  CONSTRAINT `FKProductIte574009` FOREIGN KEY (`CartID`) REFERENCES `cart` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productitem_cart`
--

LOCK TABLES `productitem_cart` WRITE;
/*!40000 ALTER TABLE `productitem_cart` DISABLE KEYS */;
INSERT INTO `productitem_cart` VALUES (1,5,7),(4,1,1),(4,2,1),(5,1,1),(6,4,1);
/*!40000 ALTER TABLE `productitem_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provider` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider`
--

LOCK TABLES `provider` WRITE;
/*!40000 ALTER TABLE `provider` DISABLE KEYS */;
INSERT INTO `provider` VALUES (1,'Hanoi','Kim Dong'),(2,'Hanoi','Kim Dong'),(3,'Hanoi','Kim Dong'),(4,'Hanoi','Kim Dong'),(5,'Hanoi','Kim Dong'),(6,'NY','Apple'),(7,'NY','Apple'),(8,'Hanoi','Kim Dong'),(9,'Hanoi','Kim Dong'),(10,'Hanoi','Vietwear');
/*!40000 ALTER TABLE `provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `customerID` int NOT NULL,
  `employeeID` int NOT NULL,
  `timeStamp` varchar(255) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `reasons` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKReport951459` (`customerID`),
  KEY `FKReport505378` (`employeeID`),
  CONSTRAINT `FKReport505378` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`ID`),
  CONSTRAINT `FKReport951459` FOREIGN KEY (`customerID`) REFERENCES `customer` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salarygrade`
--

DROP TABLE IF EXISTS `salarygrade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salarygrade` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `multiplier` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salarygrade`
--

LOCK TABLES `salarygrade` WRITE;
/*!40000 ALTER TABLE `salarygrade` DISABLE KEYS */;
INSERT INTO `salarygrade` VALUES (1,'CEO','10.2');
/*!40000 ALTER TABLE `salarygrade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searchhistory`
--

DROP TABLE IF EXISTS `searchhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchhistory` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `customerID` int NOT NULL,
  `timestamp` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKSearchHist23442` (`customerID`),
  CONSTRAINT `FKSearchHist23442` FOREIGN KEY (`customerID`) REFERENCES `customer` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searchhistory`
--

LOCK TABLES `searchhistory` WRITE;
/*!40000 ALTER TABLE `searchhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `searchhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipment`
--

DROP TABLE IF EXISTS `shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipment` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `fees` float DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `names` varchar(255) DEFAULT NULL,
  `ecoID` int DEFAULT NULL,
  `maxTime` varchar(255) DEFAULT NULL,
  `fastID` int DEFAULT NULL,
  `tax` float DEFAULT NULL,
  `safeID` int DEFAULT NULL,
  `insurance` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipment`
--

LOCK TABLES `shipment` WRITE;
/*!40000 ALTER TABLE `shipment` DISABLE KEYS */;
INSERT INTO `shipment` VALUES (1,15000,'HN','GHTK',1,'7 days',NULL,NULL,NULL,NULL),(2,25000,'HN','ViettelPost',NULL,NULL,NULL,NULL,1,'BIDV'),(3,35000,'HN','Shopee',NULL,NULL,1,10000,NULL,NULL);
/*!40000 ALTER TABLE `shipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timesheet`
--

DROP TABLE IF EXISTS `timesheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timesheet` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `date` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timesheet`
--

LOCK TABLES `timesheet` WRITE;
/*!40000 ALTER TABLE `timesheet` DISABLE KEYS */;
INSERT INTO `timesheet` VALUES (1,'20','1');
/*!40000 ALTER TABLE `timesheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `accountID` int NOT NULL,
  `fullnameID` int NOT NULL,
  `phoneID` int NOT NULL,
  `birthID` int NOT NULL,
  `addressID` int NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKUser48606` (`accountID`),
  KEY `FKUser154075` (`addressID`),
  KEY `FKUser23369` (`fullnameID`),
  KEY `FKUser210214` (`birthID`),
  KEY `FKUser745958` (`phoneID`),
  CONSTRAINT `FKUser154075` FOREIGN KEY (`addressID`) REFERENCES `address` (`ID`),
  CONSTRAINT `FKUser210214` FOREIGN KEY (`birthID`) REFERENCES `birth` (`ID`),
  CONSTRAINT `FKUser23369` FOREIGN KEY (`fullnameID`) REFERENCES `fullname` (`ID`),
  CONSTRAINT `FKUser48606` FOREIGN KEY (`accountID`) REFERENCES `account` (`ID`),
  CONSTRAINT `FKUser745958` FOREIGN KEY (`phoneID`) REFERENCES `phone` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,1,1,1,1,'Nam'),(2,2,2,2,2,2,'Nam');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voucher`
--

DROP TABLE IF EXISTS `voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voucher` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `names` varchar(255) DEFAULT NULL,
  `expireDate` varchar(255) DEFAULT NULL,
  `consID` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `value` float DEFAULT NULL,
  `percID` int DEFAULT NULL,
  `percentage` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voucher`
--

LOCK TABLES `voucher` WRITE;
/*!40000 ALTER TABLE `voucher` DISABLE KEYS */;
INSERT INTO `voucher` VALUES (1,'KM Thang 10','29-10-2023',1,10000,NULL,NULL,NULL),(2,'KM Dac biet','31-12-2023',NULL,NULL,NULL,1,5);
/*!40000 ALTER TABLE `voucher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-21  2:41:11
