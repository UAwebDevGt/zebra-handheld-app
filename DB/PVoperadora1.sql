-- MariaDB dump 10.19  Distrib 10.6.17-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: PVOperadora
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TblDet_ListaPrecios`
--

LOCK TABLES `TblDet_ListaPrecios` WRITE;
/*!40000 ALTER TABLE `TblDet_ListaPrecios` DISABLE KEYS */;
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
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TblZ_Tienda`
--

LOCK TABLES `TblZ_Tienda` WRITE;
/*!40000 ALTER TABLE `TblZ_Tienda` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tbl_Barras`
--

LOCK TABLES `Tbl_Barras` WRITE;
/*!40000 ALTER TABLE `Tbl_Barras` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tbl_Existencia`
--

LOCK TABLES `Tbl_Existencia` WRITE;
/*!40000 ALTER TABLE `Tbl_Existencia` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tbl_Inventario`
--

LOCK TABLES `Tbl_Inventario` WRITE;
/*!40000 ALTER TABLE `Tbl_Inventario` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tbl_OfertaDef`
--

LOCK TABLES `Tbl_OfertaDef` WRITE;
/*!40000 ALTER TABLE `Tbl_OfertaDef` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tbl_ProductoRotacion`
--

LOCK TABLES `Tbl_ProductoRotacion` WRITE;
/*!40000 ALTER TABLE `Tbl_ProductoRotacion` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tbl_SKUConversion`
--

LOCK TABLES `Tbl_SKUConversion` WRITE;
/*!40000 ALTER TABLE `Tbl_SKUConversion` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tbl_SKUConversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scan_history`
--

DROP TABLE IF EXISTS `scan_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scan_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(200) NOT NULL,
  `sku` varchar(100) DEFAULT NULL,
  `result_json` text DEFAULT NULL,
  `scanned_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_scan_history_barcode` (`barcode`),
  KEY `idx_scan_history_scanned_at` (`scanned_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scan_history`
--

LOCK TABLES `scan_history` WRITE;
/*!40000 ALTER TABLE `scan_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `scan_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_articulo`
--

DROP TABLE IF EXISTS `tbl_articulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_articulo` (
  `sku` varchar(255) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `skusustituto` varchar(255) DEFAULT NULL,
  `tipo_art` varchar(255) DEFAULT NULL,
  `trasladadosap` datetime(6) DEFAULT NULL,
  `valido_compra` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_articulo`
--

LOCK TABLES `tbl_articulo` WRITE;
/*!40000 ALTER TABLE `tbl_articulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_articulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_det_lista_precios`
--

DROP TABLE IF EXISTS `tbl_det_lista_precios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_det_lista_precios` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cod_lista` int(11) DEFAULT NULL,
  `precio` decimal(38,2) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_det_lista_precios`
--

LOCK TABLES `tbl_det_lista_precios` WRITE;
/*!40000 ALTER TABLE `tbl_det_lista_precios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_det_lista_precios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_existencia`
--

DROP TABLE IF EXISTS `tbl_existencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_existencia` (
  `sku` varchar(255) NOT NULL,
  `cod_warehouse` varchar(255) DEFAULT NULL,
  `existencia` decimal(38,2) DEFAULT NULL,
  PRIMARY KEY (`sku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_existencia`
--

LOCK TABLES `tbl_existencia` WRITE;
/*!40000 ALTER TABLE `tbl_existencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_existencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_producto_rotacion`
--

DROP TABLE IF EXISTS `tbl_producto_rotacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_producto_rotacion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cod_tienda` varchar(255) NOT NULL,
  `maximo` decimal(38,2) DEFAULT NULL,
  `minimo` decimal(38,2) DEFAULT NULL,
  `sku` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_producto_rotacion`
--

LOCK TABLES `tbl_producto_rotacion` WRITE;
/*!40000 ALTER TABLE `tbl_producto_rotacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_producto_rotacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_users`
--

DROP TABLE IF EXISTS `tbl_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cod_warehouse` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_c190nfu2w5xwvexf9dv08grsq` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_users`
--

LOCK TABLES `tbl_users` WRITE;
/*!40000 ALTER TABLE `tbl_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-29 15:55:04
