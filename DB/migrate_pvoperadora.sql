-- sample minimal data
INSERT INTO stores (cod_tienda, name) VALUES ('OPT038', 'Tienda OPT038'), ('OPT008', 'Tienda OPT008'), ('OPT001', 'Tienda Central');

-- admin user (password = Admin@123)
INSERT INTO users (username, password, full_name, is_admin)
VALUES ('admin', '$2a$10$2s8Wz0R7s2q3O8a9X0QfQOfg5gFjJg8VQvQnP3yD9wCw1NxeQ6c9O', 'Administrator', 1);
-- the BCrypt hash above corresponds to "Admin@123" (example). Replace if needed.

-- Insert sample products
INSERT INTO Tbl_Articulo (SKU, Nombre, TipoArt, ValidoCompra) VALUES
('SKU001','Producto A','P','V'),
('SKU002','Producto B','M','V'),
('SKU003','Producto C','P','V');

INSERT INTO Tbl_Barras (SKU, Barras, Principal) VALUES
('SKU001','1234567890123','S'),
('SKU002','9876543210987','S'),
('SKU003','5556667778888','S');

INSERT INTO TblDet_ListaPrecios (SKU, Cod_Lista, Precio) VALUES
('SKU001', 12, 10.50),
('SKU002', 12, 5.75),
('SKU003', 12, 3.20),
('SKU001', 3, 9.90),
('SKU002', 3, 5.50);

INSERT INTO Tbl_Existencia (SKU, Cod_Warehouse, Existencia) VALUES
('SKU001','91', 20),
('SKU002','91', 3),
('SKU003','91', 0);

INSERT INTO Tbl_OfertaDef (SKU, Precio, Desde, Hasta) VALUES
('SKU001', 9.00, NOW() - INTERVAL 5 DAY, NOW() + INTERVAL 5 DAY);

INSERT INTO Tbl_ProductoRotacion (SKU, Cod_Tienda, Minimo, Maximo) VALUES
('SKU001','OPT038',5,100),
('SKU002','OPT038',2,50);

INSERT INTO TblZ_Tienda (Cod_Tienda, Cod_Warehouse, Cod_WarehouseC, Cod_WarehouseT, Cod_WarehouseCT)
VALUES ('OPT038','W91','W91C','W91T','W91CT'), ('OPT008','W08','W08C','W08T','W08CT'), ('OPT001','W01','W01C','W01T','W01CT');

INSERT INTO Tbl_Inventario (SKU, Cod_Warehouse, Cantidad) VALUES
('SKU001','W91',10), ('SKU001','W91C',5), ('SKU001','W91T',2),
('SKU002','W91',3), ('SKU003','W91',0);

INSERT INTO Tbl_SKUConversion (SKU, SKUBase, Conversion) VALUES
('SKU002','SKU002_BASE', 1.0);

-- Create Views to emulate your SQL Server queries (A and B)
DROP VIEW IF EXISTS vw_product_list;
CREATE VIEW vw_product_list AS
WITH base AS (
  SELECT a.SKU, b.Barras, a.Nombre, lp.Precio
  FROM Tbl_Barras b
  JOIN Tbl_Articulo a ON b.SKU = a.SKU
  JOIN TblDet_ListaPrecios lp ON a.SKU = lp.SKU
  WHERE lp.Cod_Lista = 12
    AND a.SKU IS NOT NULL
    AND b.Barras IS NOT NULL AND TRIM(b.Barras) <> ''
    AND a.Nombre IS NOT NULL AND TRIM(a.Nombre) <> ''
    AND lp.Precio IS NOT NULL
),
one_per_sku AS (
  SELECT *,
    ROW_NUMBER() OVER (PARTITION BY SKU ORDER BY Precio DESC, Barras) AS rn_sku
  FROM base
),
picked_per_sku AS (
  SELECT SKU, Barras, Nombre, Precio
  FROM one_per_sku WHERE rn_sku = 1
),
one_per_bar AS (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY Barras ORDER BY SKU) AS rn_bar FROM picked_per_sku
)
SELECT opb.SKU, opb.Barras, opb.Nombre, opb.Precio,
  IFNULL(e.Existencia,0) AS Existencia,
  IFNULL(o.Precio,0) AS PrecioOferta,
  IFNULL(o.Hasta,'1900-01-01') AS OfertaHasta,
  IFNULL(r.Minimo,0) AS Minimo,
  IFNULL(r.Maximo,0) AS Maximo,
  IFNULL(lp3.Precio,0) AS PrecioMinimo
FROM one_per_bar opb
LEFT JOIN (
  SELECT SKU, SUM(Existencia) AS Existencia FROM Tbl_Existencia WHERE Cod_Warehouse = '91' GROUP BY SKU
) e ON e.SKU = opb.SKU
LEFT JOIN (
  SELECT SKU, MAX(Precio) AS Precio, MAX(Hasta) AS Hasta FROM Tbl_OfertaDef GROUP BY SKU
) o ON o.SKU = opb.SKU
LEFT JOIN (
  SELECT SKU, MIN(Minimo) AS Minimo, MAX(Maximo) AS Maximo FROM Tbl_ProductoRotacion GROUP BY SKU
) r ON r.SKU = opb.SKU
LEFT JOIN (
  SELECT SKU, MIN(Precio) AS Precio FROM TblDet_ListaPrecios WHERE Cod_Lista = 3 GROUP BY SKU
) lp3 ON lp3.SKU = opb.SKU
WHERE rn_bar = 1
ORDER BY opb.SKU;

-- View for per-store detailed query (simplified and parameterization will be in backend using queries)
DROP VIEW IF EXISTS vw_product_detail_example;
CREATE VIEW vw_product_detail_example AS
SELECT A.SKU AS Cod_Material, A.Nombre AS Descripcion, R.Minimo, R.Maximo,
  0 AS Existencia,
  0 AS Transito, 0 AS Precio_OfertaDef, 0 AS Precio_Lista, 0 AS Costo_Proveedor, 0 AS PrecioFinal, 1 AS MultiploCompra
FROM Tbl_Articulo A
JOIN Tbl_ProductoRotacion R ON A.SKU = R.SKU
LIMIT 1;

-- done

