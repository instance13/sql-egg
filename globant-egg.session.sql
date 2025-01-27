/*
small review: -
medium review: --
large review: ---
1. Avanzando con el uso de la cláusula SELECT --
2. Uso de JOINs en MySQL --
2. subqueries --
Consultas multitablas ---
Uso de Tablas Temporales ---
Lenguaje DDL y DML -
Funciones de Texto -
Funciones de Fecha y Hora -
Vistas y funciones matemáticas -
Actividad Integradora (MySQL)
Evaluación y despedida (MySQL)
Primeros pasos con MySQL
Comando SELECT
*/

/* 
────୨ৎ──── 
  Practice exercises.
  Exercises where I apply the sql course adquired knowledge :D.
―୨୧⋆ ˚
*/

-- Encontrar el producto más vendido (según la cantidad vendida)
-- tablas: productos, ventas
-- cómo: probablemente deba utilizar una subconsulta para poder obtener el nombre del producto desde la tabla productos, y también deba acceder a la tabla ventas para traer el atributo de cantidad. El criterio para traer cada producto, será que el id en producto, sea igual a la llave foránea producto_id en la tabla ventas. Para encontrar el producto más vendido entre todos, podría hacer uso de una función de agregación, en este caso tiene sentido utilizar MAX();

select * from productos;
select * from ventas;

-- [!] Ejercicios de mis notas :p [!]

CREATE TABLE descuentos (
    id_descuento INT PRIMARY KEY,
    id_producto INT,
    descuento DECIMAL(5, 2),
    tienda VARCHAR(100),
    etiqueta VARCHAR(50),
    fecha_inicio DATE,
    fecha_fin DATE,
    FOREIGN KEY (id_producto) REFERENCES productos(id)
);

INSERT INTO descuentos (id_descuento, id_producto, descuento, tienda, etiqueta, fecha_inicio, fecha_fin)
VALUES
(1, 1, 15.00, 'Tienda A', 'Verano', '2024-06-01', '2024-06-30'),
(2, 2, 25.00, 'Tienda B', 'Navidad', '2024-12-01', '2024-12-25'),
(3, 3, 10.00, 'Tienda C', 'Black Friday', '2024-11-25', '2024-11-30'),
(4, 4, 30.00, 'Tienda A', 'Liquidación', '2024-08-01', '2024-08-31'),
(5, 5, 5.00, 'Tienda B', 'Oferta Especial', '2024-05-01', '2024-05-15'),
(6, 6, 20.00, 'Tienda C', 'Fin de Temporada', '2024-09-01', '2024-09-30'),
(7, 7, 50.00, 'Tienda A', 'Rebajas', '2024-07-01', '2024-07-15'),
(8, 8, 12.00, 'Tienda B', 'Otoño', '2024-10-01', '2024-10-31');

select * from descuentos;

select p.nombre, p.precio, d.descuento, d.etiqueta
from productos p 
join descuentos d ON
p.id = d.id_producto
where d.descuento > 20

union

select p.nombre, p.precio, d.descuento, d.etiqueta
from productos p 
join descuentos d ON
p.id = d.id_producto
where d.etiqueta = "Oferta especial";

