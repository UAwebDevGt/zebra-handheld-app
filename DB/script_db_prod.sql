CREATE DATABASE IF NOT EXISTS PVOperadora CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE PVOperadora;

CREATE TABLE Tbl_Articulo (
  SKU VARCHAR(100) NOT NULL PRIMARY KEY,
  Nombre VARCHAR(255),
  TipoArt CHAR(1),
  SKUSustituto VARCHAR(100),
  ValidoCompra CHAR(1),
  TrasladadoSAP DATETIME
);

CREATE TABLE Tbl_Barras (
  Id INT AUTO_INCREMENT PRIMARY KEY,
  SKU VARCHAR(100),
  Barras VARCHAR(100),
  Principal CHAR(1),
  TrasladadoSAP DATETIME,
  INDEX idx_sku_barras (SKU, Barras)
);

CREATE TABLE TblDet_ListaPrecios (
  Id INT AUTO_INCREMENT PRIMARY KEY,
  SKU VARCHAR(100),
  Cod_Lista INT,
  Precio DECIMAL(18,4),
  INDEX idx_lista_sku (Cod_Lista, SKU)
);

CREATE TABLE Tbl_Existencia (
  Id INT AUTO_INCREMENT PRIMARY KEY,
  SKU VARCHAR(100),
  Cod_Warehouse VARCHAR(50),
  Existencia DECIMAL(18,4),
  INDEX idx_existencia_sku_wh (SKU, Cod_Warehouse)
);

CREATE TABLE Tbl_OfertaDef (
  Id INT AUTO_INCREMENT PRIMARY KEY,
  SKU VARCHAR(100),
  Precio DECIMAL(18,4),
  Desde DATETIME,
  Hasta DATETIME
);

CREATE TABLE Tbl_ProductoRotacion (
  Id INT AUTO_INCREMENT PRIMARY KEY,
  SKU VARCHAR(100),
  Cod_Tienda VARCHAR(50),
  Minimo DECIMAL(18,4),
  Maximo DECIMAL(18,4)
);

CREATE TABLE TblZ_Tienda (
  Id INT AUTO_INCREMENT PRIMARY KEY,
  Cod_Tienda VARCHAR(50),
  Cod_Warehouse VARCHAR(50),
  Cod_WarehouseC VARCHAR(50),
  Cod_WarehouseT VARCHAR(50),
  Cod_WarehouseCT VARCHAR(50)
);

CREATE TABLE Tbl_Inventario (
  Id INT AUTO_INCREMENT PRIMARY KEY,
  SKU VARCHAR(100),
  Cod_Warehouse VARCHAR(50),
  Cantidad DECIMAL(18,4)
);

CREATE TABLE Tbl_SKUConversion (
  Id INT AUTO_INCREMENT PRIMARY KEY,
  SKU VARCHAR(100),
  SKUBase VARCHAR(100),
  Conversion DECIMAL(18,8)
);

CREATE TABLE Tbl_OrdenCompra (
  Num_OrdenCompra VARCHAR(50) PRIMARY KEY,
  Cod_Tienda VARCHAR(50),
  Cod_Tipo VARCHAR(10),
  Status VARCHAR(10),
  ReqRecepcion CHAR(1)
);

CREATE TABLE TblDet_OrdenCompra (
  Id INT AUTO_INCREMENT PRIMARY KEY,
  Num_OrdenCompra VARCHAR(50),
  Cod_Material VARCHAR(100),
  Cantidad DECIMAL(18,4),
  RecibidoBodega DECIMAL(18,4)
);

CREATE TABLE Tbl_ArticuloProv (
  Id INT AUTO_INCREMENT PRIMARY KEY,
  SKU VARCHAR(100),
  Primario CHAR(1),
  Costo DECIMAL(18,4),
  Multiplo DECIMAL(18,4),
  ModoCosto CHAR(1),
  Cod_Proveedor VARCHAR(50)
);

CREATE TABLE Tbl_Proveedor (
  Cod_Proveedor VARCHAR(50) PRIMARY KEY,
  Nombre VARCHAR(255)
);

