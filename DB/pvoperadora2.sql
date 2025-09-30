-- MariaDB dump 10.19  Distrib 10.6.17-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: pvoperadora
-- ------------------------------------------------------
-- Server version	10.6.17-MariaDB-1:10.6.17+maria~ubu2004

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `TblDet_ListaPrecios`
--

DROP TABLE IF EXISTS `TblDet_ListaPrecios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TblDet_ListaPrecios` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `SKU` varchar(100) DEFAULT NULL,
  `Cod_Lista` int(11) DEFAULT NULL,
  `Precio` decimal(18,4) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_lista_sku` (`Cod_Lista`,`SKU`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TblDet_ListaPrecios`
--

LOCK TABLES `TblDet_ListaPrecios` WRITE;
/*!40000 ALTER TABLE `TblDet_ListaPrecios` DISABLE KEYS */;
INSERT INTO `TblDet_ListaPrecios` VALUES (1,'SKU001',12,10.5000),(2,'SKU002',12,5.7500),(3,'SKU003',12,3.2000),(4,'SKU001',3,9.9000),(5,'SKU002',3,5.5000);
/*!40000 ALTER TABLE `TblDet_ListaPrecios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TblDet_OrdenCompra`
--

DROP TABLE IF EXISTS `TblDet_OrdenCompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TblDet_OrdenCompra` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Num_OrdenCompra` varchar(50) DEFAULT NULL,
  `Cod_Material` varchar(100) DEFAULT NULL,
  `Cantidad` decimal(18,4) DEFAULT NULL,
  `RecibidoBodega` decimal(18,4) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TblDet_OrdenCompra`
--

LOCK TABLES `TblDet_OrdenCompra` WRITE;
/*!40000 ALTER TABLE `TblDet_OrdenCompra` DISABLE KEYS */;
/*!40000 ALTER TABLE `TblDet_OrdenCompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TblZ_Tienda`
--

DROP TABLE IF EXISTS `TblZ_Tienda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TblZ_Tienda` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Cod_Tienda` varchar(50) DEFAULT NULL,
  `Cod_Warehouse` varchar(50) DEFAULT NULL,
  `Cod_WarehouseC` varchar(50) DEFAULT NULL,
  `Cod_WarehouseT` varchar(50) DEFAULT NULL,
  `Cod_WarehouseCT` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Cod_Tienda` (`Cod_Tienda`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TblZ_Tienda`
--

LOCK TABLES `TblZ_Tienda` WRITE;
/*!40000 ALTER TABLE `TblZ_Tienda` DISABLE KEYS */;
INSERT INTO `TblZ_Tienda` VALUES (1,'OPT038','W91','W91C','W91T','W91CT'),(2,'OPT008','W08','W08C','W08T','W08CT'),(3,'OPT001','W01','W01C','W01T','W01CT');
/*!40000 ALTER TABLE `TblZ_Tienda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tbl_Articulo`
--

DROP TABLE IF EXISTS `Tbl_Articulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tbl_Articulo` (
  `SKU` varchar(100) NOT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `TipoArt` char(1) DEFAULT NULL,
  `SKUSustituto` varchar(100) DEFAULT NULL,
  `ValidoCompra` char(1) DEFAULT NULL,
  `TrasladadoSAP` datetime DEFAULT NULL,
  PRIMARY KEY (`SKU`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tbl_Articulo`
--

LOCK TABLES `Tbl_Articulo` WRITE;
/*!40000 ALTER TABLE `Tbl_Articulo` DISABLE KEYS */;
INSERT INTO `Tbl_Articulo` VALUES ('SKU001','Producto A','P',NULL,'V',NULL),('SKU002','Producto B','M',NULL,'V',NULL),('SKU003','Producto C','P',NULL,'V',NULL);
/*!40000 ALTER TABLE `Tbl_Articulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tbl_ArticuloProv`
--

DROP TABLE IF EXISTS `Tbl_ArticuloProv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tbl_ArticuloProv` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `SKU` varchar(100) DEFAULT NULL,
  `Primario` char(1) DEFAULT NULL,
  `Costo` decimal(18,4) DEFAULT NULL,
  `Multiplo` decimal(18,4) DEFAULT NULL,
  `ModoCosto` char(1) DEFAULT NULL,
  `Cod_Proveedor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tbl_ArticuloProv`
--

LOCK TABLES `Tbl_ArticuloProv` WRITE;
/*!40000 ALTER TABLE `Tbl_ArticuloProv` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tbl_ArticuloProv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tbl_Barras`
--

DROP TABLE IF EXISTS `Tbl_Barras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tbl_Barras` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `SKU` varchar(100) DEFAULT NULL,
  `Barras` varchar(100) DEFAULT NULL,
  `Principal` char(1) DEFAULT NULL,
  `TrasladadoSAP` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_sku_barras` (`SKU`,`Barras`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tbl_Barras`
--

LOCK TABLES `Tbl_Barras` WRITE;
/*!40000 ALTER TABLE `Tbl_Barras` DISABLE KEYS */;
INSERT INTO `Tbl_Barras` VALUES (1,'SKU001','1234567890123','S',NULL),(2,'SKU002','9876543210987','S',NULL),(3,'SKU003','5556667778888','S',NULL);
/*!40000 ALTER TABLE `Tbl_Barras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tbl_Existencia`
--

DROP TABLE IF EXISTS `Tbl_Existencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tbl_Existencia` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `SKU` varchar(100) DEFAULT NULL,
  `Cod_Warehouse` varchar(50) DEFAULT NULL,
  `Existencia` decimal(18,4) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_existencia_sku_wh` (`SKU`,`Cod_Warehouse`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tbl_Existencia`
--

LOCK TABLES `Tbl_Existencia` WRITE;
/*!40000 ALTER TABLE `Tbl_Existencia` DISABLE KEYS */;
INSERT INTO `Tbl_Existencia` VALUES (1,'SKU001','91',20.0000),(2,'SKU002','91',3.0000),(3,'SKU003','91',0.0000);
/*!40000 ALTER TABLE `Tbl_Existencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tbl_Inventario`
--

DROP TABLE IF EXISTS `Tbl_Inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tbl_Inventario` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `SKU` varchar(100) DEFAULT NULL,
  `Cod_Warehouse` varchar(50) DEFAULT NULL,
  `Cantidad` decimal(18,4) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tbl_Inventario`
--

LOCK TABLES `Tbl_Inventario` WRITE;
/*!40000 ALTER TABLE `Tbl_Inventario` DISABLE KEYS */;
INSERT INTO `Tbl_Inventario` VALUES (1,'SKU001','W91',10.0000),(2,'SKU001','W91C',5.0000),(3,'SKU001','W91T',2.0000),(4,'SKU002','W91',3.0000),(5,'SKU003','W91',0.0000);
/*!40000 ALTER TABLE `Tbl_Inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tbl_OfertaDef`
--

DROP TABLE IF EXISTS `Tbl_OfertaDef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tbl_OfertaDef` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `SKU` varchar(100) DEFAULT NULL,
  `Precio` decimal(18,4) DEFAULT NULL,
  `Desde` datetime DEFAULT NULL,
  `Hasta` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tbl_OfertaDef`
--

LOCK TABLES `Tbl_OfertaDef` WRITE;
/*!40000 ALTER TABLE `Tbl_OfertaDef` DISABLE KEYS */;
INSERT INTO `Tbl_OfertaDef` VALUES (1,'SKU001',9.0000,'2025-09-24 07:01:53','2025-10-04 07:01:53');
/*!40000 ALTER TABLE `Tbl_OfertaDef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tbl_OrdenCompra`
--

DROP TABLE IF EXISTS `Tbl_OrdenCompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tbl_OrdenCompra` (
  `Num_OrdenCompra` varchar(50) NOT NULL,
  `Cod_Tienda` varchar(50) DEFAULT NULL,
  `Cod_Tipo` varchar(10) DEFAULT NULL,
  `Status` varchar(10) DEFAULT NULL,
  `ReqRecepcion` char(1) DEFAULT NULL,
  PRIMARY KEY (`Num_OrdenCompra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tbl_OrdenCompra`
--

LOCK TABLES `Tbl_OrdenCompra` WRITE;
/*!40000 ALTER TABLE `Tbl_OrdenCompra` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tbl_OrdenCompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tbl_ProductoRotacion`
--

DROP TABLE IF EXISTS `Tbl_ProductoRotacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tbl_ProductoRotacion` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `SKU` varchar(100) DEFAULT NULL,
  `Cod_Tienda` varchar(50) DEFAULT NULL,
  `Minimo` decimal(18,4) DEFAULT NULL,
  `Maximo` decimal(18,4) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tbl_ProductoRotacion`
--

LOCK TABLES `Tbl_ProductoRotacion` WRITE;
/*!40000 ALTER TABLE `Tbl_ProductoRotacion` DISABLE KEYS */;
INSERT INTO `Tbl_ProductoRotacion` VALUES (1,'SKU001','OPT038',5.0000,100.0000),(2,'SKU002','OPT038',2.0000,50.0000);
/*!40000 ALTER TABLE `Tbl_ProductoRotacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tbl_Proveedor`
--

DROP TABLE IF EXISTS `Tbl_Proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tbl_Proveedor` (
  `Cod_Proveedor` varchar(50) NOT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Cod_Proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tbl_Proveedor`
--

LOCK TABLES `Tbl_Proveedor` WRITE;
/*!40000 ALTER TABLE `Tbl_Proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tbl_Proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tbl_SKUConversion`
--

DROP TABLE IF EXISTS `Tbl_SKUConversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tbl_SKUConversion` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `SKU` varchar(100) DEFAULT NULL,
  `SKUBase` varchar(100) DEFAULT NULL,
  `Conversion` decimal(18,8) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tbl_SKUConversion`
--

LOCK TABLES `Tbl_SKUConversion` WRITE;
/*!40000 ALTER TABLE `Tbl_SKUConversion` DISABLE KEYS */;
INSERT INTO `Tbl_SKUConversion` VALUES (1,'SKU002','SKU002_BASE',1.00000000);
/*!40000 ALTER TABLE `Tbl_SKUConversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cod_tienda` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cod_tienda` (`cod_tienda`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores`
--

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
INSERT INTO `stores` VALUES (1,'OPT038','Tienda OPT038'),(2,'OPT008','Tienda OPT008'),(3,'OPT001','Tienda Central');
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_stores`
--

DROP TABLE IF EXISTS `user_stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_stores` (
  `user_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`store_id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `user_stores_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `user_stores_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_stores`
--

LOCK TABLES `user_stores` WRITE;
/*!40000 ALTER TABLE `user_stores` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','$2a$10$2s8Wz0R7s2q3O8a9X0QfQOfg5gFjJg8VQvQnP3yD9wCw1NxeQ6c9O','Administrator',1),(2,'prueba','123','Administrator',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vw_product_detail_example`
--

DROP TABLE IF EXISTS `vw_product_detail_example`;
/*!50001 DROP VIEW IF EXISTS `vw_product_detail_example`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_product_detail_example` AS SELECT
 1 AS `Cod_Material`,
  1 AS `Descripcion`,
  1 AS `Minimo`,
  1 AS `Maximo`,
  1 AS `Existencia`,
  1 AS `Transito`,
  1 AS `Precio_OfertaDef`,
  1 AS `Precio_Lista`,
  1 AS `Costo_Proveedor`,
  1 AS `PrecioFinal`,
  1 AS `MultiploCompra` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_product_list`
--

DROP TABLE IF EXISTS `vw_product_list`;
/*!50001 DROP VIEW IF EXISTS `vw_product_list`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_product_list` AS SELECT
 1 AS `SKU`,
  1 AS `Barras`,
  1 AS `Nombre`,
  1 AS `Precio`,
  1 AS `Existencia`,
  1 AS `PrecioOferta`,
  1 AS `OfertaHasta`,
  1 AS `Minimo`,
  1 AS `Maximo`,
  1 AS `PrecioMinimo` */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_product_detail_example`
--

/*!50001 DROP VIEW IF EXISTS `vw_product_detail_example`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_product_detail_example` AS select `A`.`SKU` AS `Cod_Material`,`A`.`Nombre` AS `Descripcion`,`R`.`Minimo` AS `Minimo`,`R`.`Maximo` AS `Maximo`,0 AS `Existencia`,0 AS `Transito`,0 AS `Precio_OfertaDef`,0 AS `Precio_Lista`,0 AS `Costo_Proveedor`,0 AS `PrecioFinal`,1 AS `MultiploCompra` from (`Tbl_Articulo` `A` join `Tbl_ProductoRotacion` `R` on(`A`.`SKU` = `R`.`SKU`)) limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_product_list`
--

/*!50001 DROP VIEW IF EXISTS `vw_product_list`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_product_list` AS with base as (select `a`.`SKU` AS `SKU`,`b`.`Barras` AS `Barras`,`a`.`Nombre` AS `Nombre`,`lp`.`Precio` AS `Precio` from ((`Tbl_Barras` `b` join `Tbl_Articulo` `a` on(`b`.`SKU` = `a`.`SKU`)) join `TblDet_ListaPrecios` `lp` on(`a`.`SKU` = `lp`.`SKU`)) where `lp`.`Cod_Lista` = 12 and `a`.`SKU` is not null and `b`.`Barras` is not null and trim(`b`.`Barras`) <> '' and `a`.`Nombre` is not null and trim(`a`.`Nombre`) <> '' and `lp`.`Precio` is not null), one_per_sku as (select `base`.`SKU` AS `SKU`,`base`.`Barras` AS `Barras`,`base`.`Nombre` AS `Nombre`,`base`.`Precio` AS `Precio`,row_number() over ( partition by `base`.`SKU` order by `base`.`Precio` desc,`base`.`Barras`) AS `rn_sku` from `base`), picked_per_sku as (select `one_per_sku`.`SKU` AS `SKU`,`one_per_sku`.`Barras` AS `Barras`,`one_per_sku`.`Nombre` AS `Nombre`,`one_per_sku`.`Precio` AS `Precio` from `one_per_sku` where `one_per_sku`.`rn_sku` = 1), one_per_bar as (select `picked_per_sku`.`SKU` AS `SKU`,`picked_per_sku`.`Barras` AS `Barras`,`picked_per_sku`.`Nombre` AS `Nombre`,`picked_per_sku`.`Precio` AS `Precio`,row_number() over ( partition by `picked_per_sku`.`Barras` order by `picked_per_sku`.`SKU`) AS `rn_bar` from `picked_per_sku`)select `opb`.`SKU` AS `SKU`,`opb`.`Barras` AS `Barras`,`opb`.`Nombre` AS `Nombre`,`opb`.`Precio` AS `Precio`,ifnull(`e`.`Existencia`,0) AS `Existencia`,ifnull(`o`.`Precio`,0) AS `PrecioOferta`,ifnull(`o`.`Hasta`,'1900-01-01') AS `OfertaHasta`,ifnull(`r`.`Minimo`,0) AS `Minimo`,ifnull(`r`.`Maximo`,0) AS `Maximo`,ifnull(`lp3`.`Precio`,0) AS `PrecioMinimo` from ((((`one_per_bar` `opb` left join (select `Tbl_Existencia`.`SKU` AS `SKU`,sum(`Tbl_Existencia`.`Existencia`) AS `Existencia` from `Tbl_Existencia` where `Tbl_Existencia`.`Cod_Warehouse` = '91' group by `Tbl_Existencia`.`SKU`) `e` on(`e`.`SKU` = `opb`.`SKU`)) left join (select `Tbl_OfertaDef`.`SKU` AS `SKU`,max(`Tbl_OfertaDef`.`Precio`) AS `Precio`,max(`Tbl_OfertaDef`.`Hasta`) AS `Hasta` from `Tbl_OfertaDef` group by `Tbl_OfertaDef`.`SKU`) `o` on(`o`.`SKU` = `opb`.`SKU`)) left join (select `Tbl_ProductoRotacion`.`SKU` AS `SKU`,min(`Tbl_ProductoRotacion`.`Minimo`) AS `Minimo`,max(`Tbl_ProductoRotacion`.`Maximo`) AS `Maximo` from `Tbl_ProductoRotacion` group by `Tbl_ProductoRotacion`.`SKU`) `r` on(`r`.`SKU` = `opb`.`SKU`)) left join (select `TblDet_ListaPrecios`.`SKU` AS `SKU`,min(`TblDet_ListaPrecios`.`Precio`) AS `Precio` from `TblDet_ListaPrecios` where `TblDet_ListaPrecios`.`Cod_Lista` = 3 group by `TblDet_ListaPrecios`.`SKU`) `lp3` on(`lp3`.`SKU` = `opb`.`SKU`)) where `opb`.`rn_bar` = 1 order by `opb`.`SKU` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-29 15:55:23
