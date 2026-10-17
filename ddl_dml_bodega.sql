/*
    Alumno: Matías Ariel León
    Materia: Data Analytics
    Ejercicio: Gestión de bodega - DDL y DML
    Archivo: ddl_dml_bodega.sql
*/

-- =============================================
-- SECCIÓN DDL: CREACIÓN DE LA TABLA
-- =============================================

DROP TABLE IF EXISTS Inventario;

CREATE TABLE Inventario (
    id_producto INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    -- INT identifica cada producto con un número entero autoincremental.

    nombre_producto VARCHAR(100) NOT NULL,
    -- VARCHAR(100) permite almacenar nombres de hasta 100 caracteres.

    categoria VARCHAR(50) NOT NULL,
    -- VARCHAR(50) almacena la categoría del producto.

    precio_unitario DECIMAL(10,2) NOT NULL,
    -- DECIMAL(10,2) permite guardar precios con dos decimales.

    stock_actual INT NOT NULL,
    -- INT almacena la cantidad de unidades disponibles.

    stock_minimo INT NOT NULL,
    -- INT define el mínimo de unidades que se desea mantener.

    fecha_ingreso DATE,
    -- DATE almacena la fecha de ingreso sin incluir la hora.

    activo BIT NOT NULL DEFAULT 1
    -- BIT indica si el producto está activo (1) o inactivo (0).
);

-- =============================================
-- SECCIÓN DML: CARGA INICIAL DE PRODUCTOS
-- =============================================

INSERT INTO Inventario
    (nombre_producto, categoria, precio_unitario,
     stock_actual, stock_minimo, fecha_ingreso, activo)
VALUES
    ('Laptop Pro 15', 'Computación', 1200.00, 15, 3, '2024-01-10', 1),
    ('Mouse Inalámbrico', 'Accesorios', 28.00, 80, 10, '2024-01-10', 1),
    ('Monitor 4K 27"', 'Computación', 450.00, 12, 2, '2024-01-15', 1),
    ('Teclado Mecánico', 'Accesorios', 95.00, 40, 5, '2024-01-15', 1),
    ('Laptop Basic 14', 'Computación', 650.00, 20, 3, '2024-02-01', 1),
    ('Auriculares BT Pro', 'Audio', 120.00, 35, 5, '2024-02-01', 1),
    ('Hub USB-C 7 puertos', 'Accesorios', 45.00, 60, 10, '2024-02-10', 1),
    ('Webcam HD 1080p', 'Accesorios', 85.00, 25, 5, '2024-02-10', 1),
    ('SSD Externo 1TB', 'Almacenamiento', 130.00, 18, 3, '2024-03-01', 1),
    ('Parlante Bluetooth', 'Audio', 60.00, 45, 8, '2024-03-01', 1);

-- =============================================
-- SECCIÓN DML: ACTUALIZACIÓN DEL INVENTARIO
-- =============================================

-- Descontar 3 unidades del producto 1.
UPDATE Inventario
SET stock_actual = stock_actual - 3
WHERE id_producto = 1;

-- Descontar 12 unidades del producto 2.
UPDATE Inventario
SET stock_actual = stock_actual - 12
WHERE id_producto = 2;

-- Descontar 5 unidades del producto 6.
UPDATE Inventario
SET stock_actual = stock_actual - 5
WHERE id_producto = 6;

-- Desactivar el producto 8.
UPDATE Inventario
SET activo = 0
WHERE id_producto = 8;

-- =============================================
-- CONSULTA FINAL: VALIDACIÓN DE LOS CAMBIOS
-- =============================================

SELECT *
FROM Inventario
ORDER BY id_producto;