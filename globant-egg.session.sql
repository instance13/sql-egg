/*
 -> Crea una tabla llamada "estudiantes" con cinco columnas: 
 - "id" de tipo INT como clave primaria, 
 - "nombre" de tipo VARCHAR(50), "apellido" de tipo VARCHAR(50), 
 - "edad" de tipo INT y "promedio" de tipo FLOAT. 
 -> Luego, inserta cinco filas en la tabla "estudiantes" con los siguientes datos:
 ID: 1, Nombre: Juan, Apellido: Pérez, Edad: 22, Promedio: 85.5
 ID: 2, Nombre: María, Apellido: Gómez, Edad: 21, Promedio: 90.0
 ID: 3, Nombre: Luis, Apellido: Rodríguez, Edad: 20, Promedio: 88.5
 ID: 4, Nombre: Ana, Apellido: Martínez, Edad: 23, Promedio: 92.0
 ID: 5, Nombre: Carlos, Apellido: López, Edad: 22, Promedio: 86.5
 
 Encuentra la longitud del nombre del estudiante con el nombre "Luis" y apellido "Rodríguez".
 - length: devuelve bytes
 - char_length: devuelve número de caracteres
 */
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(50),
  apellido VARCHAR(50),
  edad INT,
  promedio FLOAT
);
INSERT INTO estudiantes (id, nombre, apellido, edad, promedio)
VALUES (1, 'Juan', 'Pérez', 22, 85.5),
  (2, 'María', 'Gómez', 21, 90.0),
  (3, 'Luis', 'Rodríguez', 20, 88.5),
  (4, 'Ana', 'Martínez', 23, 92.0),
  (5, 'Carlos', 'López', 22, 86.5);
select char_length(nombre) longitud_nombre,
  char_length(apellido) longitud_apellido
from estudiantes
where nombre = "Luis"
  AND apellido = "Rodríguez";
/*
 Concatena el nombre y el apellido del estudiante con el nombre "María" y apellido "Gómez" con un espacio en el medio. 
 */
select concat(nombre, " ", apellido) nombreYApellido
from estudiantes
where nombre = "María"
  AND apellido = "Gómez";
/*
 Encuentra la posición de la primera 'e' en el apellido del estudiante con el nombre "Juan" y apellido "Pérez".
 
 Inserta la cadena ' García' en la posición 3 del nombre del estudiante con el nombre "Ana" y apellido "Martínez".
 */
select locate("e", apellido)
from estudiantes
where nombre = "Juan"
  AND apellido = "Pérez";
-- INSERT(str, pos, len, newstr)
select
insert(nombre, 3, 6, " García")
from estudiantes
where nombre = "Ana"
  AND apellido = "Martínez";
/*
 Convierte el nombre del estudiante con el nombre "Luis" y apellido "Rodríguez" a minúsculas. (LOWER)
 
 Convierte el apellido del estudiante con el nombre "Juan" y apellido "Pérez" a mayúsculas. (UPPER)
 
 Obtiene los primeros 4 caracteres del apellido del estudiante con el nombre "María" y apellido "Gómez". (LEFT)
 
 Obtiene los últimos 3 caracteres del apellido del estudiante con el nombre "Ana" y apellido "Martínez". (RIGHT)
 */
/*
 UPDATE empleados
 SET salario = (
 SELECT nuevo_salario
 FROM ajustes_salario
 WHERE ajustes_salario.id_empleado = empleados.id_empleado
 )*/
-- update con funciones de texto !
select lower(nombre),
  lower(apellido)
from estudiantes
where nombre = "Luis"
  AND apellido = "Rodríguez";
update estudiantes
set nombre = lower (nombre);
select nombre
from estudiantes
where nombre = "luis";
update estudiantes
set apellido = lower(apellido);
select apellido
from estudiantes
where apellido = "rodríguez";
select left(apellido, 4)
from estudiantes
where nombre = "María"
  AND apellido = "Gómez";
select right(apellido, 3)
from estudiantes
where nombre = "Ana"
  AND apellido = "Martínez";
/*
 Encuentra la posición de la primera 'o' en el nombre del estudiante con el nombre "Carlos" y apellido "López". (LOCATE)
 
 Encuentra la posición de la primera aparición de la letra 'a' en el nombre de la estudiante con el nombre "María" y apellido "Gómez".
 
 Reemplaza 'a' con 'X' en el nombre del estudiante con el nombre "Ana" y apellido "Martínez". 
 */
select locate("o", nombre)
from estudiantes
where nombre = "Carlos"
  AND apellido = "López";
select replace(nombre, "a", "X")
from estudiantes
where nombre = "Ana"
  AND apellido = "Martínez";
/*
 Encuentra la subcadena de 3 caracteres de longitud de la columna 'nombre' del estudiante con el nombre "María" y apellido "Gómez", comenzando en la posición 2.
 
 Combina los nombres de todos los estudiantes en una única cadena separada por guiones.
 
 Combina los nombres y apellidos de todos los estudiantes en una única cadena separada por un guion vertical (|). 
 
 Elimina los espacios en blanco iniciales del texto "    … usé muchos espacios    ".
 
 Elimina los espacios en blanco finales del texto "    … usé muchos espacios    ".
 
 Cita el resultado de los dos ejercicios anteriores utilizando la función QUOTE.
 */
select mid(nombre, 2, 3)
from estudiantes
where nombre = "María"
  AND apellido = "Gómez";
select group_concat(nombre separator " - ")
from estudiantes;
select group_concat(nombre, " ", apellido separator " | ")
from estudiantes;
select rtrim("    … usé muchos espacios    ");
select ltrim("    … usé muchos espacios    ");
select quote(" … usé muchos espacios    ");
/*Repite el nombre y apellido del estudiante con el nombre "Juan" y apellido "Pérez" tres veces. 
 
 Invierte el nombre del estudiante con el nombre "Ana" y apellido "Martínez". 
 
 Devuelve una cadena que contenga 8 caracteres de espacio usando la función SPACE y muéstrala con la función QUOTE.
 
 Extrae una subcadena que contiene el nombre del estudiante con el nombre "María" y apellido "Gómez" antes de la segunda a utilizando SUBSTRING_INDEX.*/
select repeat(nombre, 3),
  repeat(apellido, 3)
from estudiantes
where nombre = "Juan"
  AND apellido = "Pérez";
select reverse(nombre)
from estudiantes
where nombre = "Luis"
  AND apellido = "Rodríguez";
select quote(space(8));
-- resultado inesperado
select substring_index(nombre, "a", 2)
from estudiantes
where nombre = "María"
  AND apellido = "Gómez";
/*
 Combina las edades de todos los estudiantes en una única cadena separada por comas y orden descendente.
 
 Elimina las ‘a’ del nombre' del estudiante con el nombre "Ana" y apellido "Martínez" usando la función REPLACE. 
 
 Rellena a la derecha el promedio del estudiante con el nombre "Luis" y apellido "Rodríguez" con asteriscos hasta una longitud total de 10 caracteres. 
 
 Obtén el promedio del estudiante con nombre 'Carlos' y apellido 'López', formateado con dos decimales y utilizando la configuración regional 'es_AR'.
 */
select group_concat(
    edad
    order by edad desc separator ", "
  )
from estudiantes;
desc estudiantes;
select rpad(promedio, 10, "*")
from estudiantes
where nombre "Luis"
  AND apellido = "Rodríguez";
SELECT FORMAT(promedio, 2, 'es_AR')
FROM estudiantes
WHERE nombre = 'Carlos'
  and apellido = "López";
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
desc estudiantes;
select nombre,
  apellido
from estudiantes;
select *
from estudiantes,
  empleados;
select distinct nombre
from empleados
order by nombre desc;
desc productos;
-- [!] select clauses [!]
-- * group by *
-- Exercise: Agrupa las ventas por empleado y muestra la cantidad total de ventas realizadas por cada empleado.
desc empleados;
desc ventas;
select empleados.nombre,
  ventas.empleado_id
from empleados,
  ventas
group by empleado_id;
SELECT empleados.nombre,
  ventas.empleado_id,
  COUNT(ventas.id) AS total_ventas
FROM empleados,
  ventas
WHERE empleados.id = ventas.empleado_id
GROUP BY empleados.nombre,
  ventas.empleado_id;
-- Exercise: Agrupa los productos por precio y muestra la cantidad de productos con el mismo precio.
select precio -- -> counting would go in here because filtering goes later. 
from productos -- where -> where is not neccessary here. group by will handle the logic of product with the same prices naturally.
GROUP BY precio;
desc productos;
SELECT precio,
  COUNT(*) AS cantidad_productos
FROM productos
GROUP BY precio;
-- Exercise: Agrupa los empleados por departamento y muestra la cantidad de empleados en cada departamento.
select *
from empleados;
select departamento_id,
  count(*)
from empleados
group by departamento_id;
-- * in *
-- Busca los empleados que trabajan en los departamentos 2 o 3.
select nombre,
  apellido
from empleados
where departamento_id in(2, 3);
-- Trae a los clientes que no tengan los IDs 2, 4 o 6.
select nombre
from clientes
where id not in(2, 4, 6);
-- Busca los productos cuyos precios son 350.00, 480.00 o 800.00.
select nombre
from productos
where precio in(350.00, 480.00, 800.00);
-- * having *
-- Encuentra los departamentos con un salario promedio de sus empleados superior a $3,000.
select avg(salario) salario_promedio_departamento
from empleados
group by departamento_id
having avg(salario) > 3000;
-- Encuentra los productos que se han vendido al menos 5 veces.
-- tablas: ventas.
desc ventas;
-- ejercicio original
select producto_id,
  cantidad
from ventas
group by id
having cantidad >= 5;
-- ejercicio con aporte personal que hace que en mi opinión sea más interesante y retador: subconsulta.
select (
    select nombre
    from productos
    where productos.id = ventas.producto_id
  ) as nombre_producto,
  producto_id,
  sum(cantidad) as cantidad_total
from ventas
group by producto_id
having cantidad_total >= 5;
-- Selecciona los empleados que tengan una “o” en su nombre o apellido y agrúpalos por departamento y muestra los que tengan el salario máximo.
select nombre,
  salario
from empleados
where nombre like "%o%"
  or apellido like "%o%"
group by departamento_id
having salario = max(salario);
-- [!] Funciones de fecha y hora [!]
CREATE TABLE envios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  fecha_envio DATETIME,
  fecha_entrega DATETIME,
  codigo_producto VARCHAR(10)
);
INSERT INTO envios (fecha_envio, fecha_entrega, codigo_producto)
VALUES (
    '2022-01-15 08:00:00',
    '2022-01-20 12:30:00',
    'ABC123'
  ),
  (
    '2022-02-10 10:15:00',
    '2022-02-15 14:45:00',
    'XYZ789'
  ),
  (
    '2022-03-05 09:30:00',
    '2022-03-10 13:20:00',
    'PQR456'
  ),
  (
    '2022-04-20 11:45:00',
    '2022-04-25 15:10:00',
    'LMN001'
  ),
  (
    '2022-05-12 07:55:00',
    '2022-05-17 10:25:00',
    'DEF777'
  ),
  (
    '2022-06-08 08:20:00',
    '2022-06-13 12:40:00',
    'GHI888'
  ),
  (
    '2022-07-03 10:05:00',
    '2022-07-08 14:15:00',
    'JKL999'
  );
-- Utilizando la función DATE_ADD, 
-- * calcula la fecha de entrega programada para un envío cuando se le añaden 5 días a la fecha de envío.
-- * envío con código de producto 'ABC123' 
-- date_add(date, interval)
select fecha_envio,
  date_add(fecha_envio, INTERVAL 5 DAY)
from envios
where codigo_producto = "ABC123";
-- Utilizando la función ADDTIME, encuentra la hora estimada de entrega para un envío con código de producto 'XYZ789' si se suma 4 horas y 30 minutos a la hora de entrega. 
SELECT codigo_producto,
  fecha_entrega,
  ADDTIME(fecha_entrega, '04:30:00') AS hora_entrega_estimada
FROM envios
WHERE codigo_producto = 'XYZ789';
-- Utilizando la función CONVERT_TZ, convierte la fecha de envío de un envío con código de producto 'PQR456' de la zona horaria 'UTC' (+00:00) a la zona horaria de Argentina GMT-3 (-03:00).
SELECT CONVERT_TZ(fecha_envio, '+00:00', '-03:00') AS fecha_envio_argentina
FROM envios
WHERE codigo_producto = 'PQR456';
-- Calcula la diferencia en días entre la fecha de entrega y la fecha de envío para el envío con código de producto 'LMN001' utilizando la función DATEDIFF.
select fecha_entrega,
  fecha_envio,
  datediff(fecha_entrega, fecha_envio)
from envios
where codigo_producto = "LMN001";
-- Utiliza la función CURDATE para obtener la fecha actual y, a continuación, obtener la diferencia en días entre la fecha de entrega con código de producto 'DEF777' y la fecha actual.
select datediff(fecha_entrega, curdate())
from envios
where codigo_producto = "DEF777";
-- Utiliza la función DATE para extraer la fecha de envío del envío con ID 3.
SELECT DATE(fecha_envio) AS fecha_envio_solo
FROM envios
WHERE id = 3;
-- Utilizando la función CURTIME, obtén la hora actual del sistema.
SELECT CURTIME() AS hora_actual;
-- Utiliza la función DATE_ADD para calcular la fecha de entrega programada para el envío con código de producto 'XYZ789' si se le agregan 3 días a la fecha de envío.
select fecha_entrega,
  date_add(fecha_entrega, INTERVAL 3 DAY)
from envios
where codigo_producto = "XYZ789";
-- Utiliza la función DATE_FORMAT para mostrar la fecha de envío del envío con ID 6 en el formato 'DD-MM-YYYY'.
select date_format(fecha_envio, "%d-%m-%Y")
from envios
where id = 6;
-- Utiliza la función DATE_SUB para calcular la fecha de envío del envío con ID 4 si se le restan 2 días.
select fecha_envio,
  date_sub(fecha_envio, INTERVAL 2 DAY)
from envios
where id = 4;
-- Utiliza la función DAY para obtener el día del mes en que se realizó el envío con ID 2.
select day(fecha_envio)
from envios
where id = 2;
-- Utiliza la función DAYNAME para obtener el nombre del día de la semana en que se entregará el envío con código de producto 'DEF777'.
SELECT DAYNAME(fecha_entrega) AS dia_de_la_semana
FROM envios
WHERE codigo_producto = 'DEF777';
-- Utiliza la función DAYOFMONTH para obtener el día del mes en que se entregará el envío con código de producto 'GHI888'.
SELECT DAYOFMONTH(fecha_entrega) AS dia_del_mes
FROM envios
WHERE codigo_producto = 'GHI888';
-- Utiliza la función PERIOD_ADD para agregar un período de 3 meses al año-mes '2022-07'.
SELECT DATE_FORMAT(
    STR_TO_DATE(CONCAT(PERIOD_ADD(202207, 3), '01'), '%Y%m%d'),
    '%Y - %b'
  ) AS nuevo_periodo;
select date_format((period_add(202207, 6)), "%y-%m");
-- Utiliza la función PERIOD_DIFF para calcular el número de meses entre los períodos '2022-03' y '2022-12'.
select period_diff(202212, 202203);
-- Utiliza la función QUARTER para obtener el trimestre de la fecha de entrega del envío con código de producto 'PQR456'.
select fecha_entrega,
  quarter(fecha_entrega)
from envios
where codigo_producto = "PQR456";
-- Utiliza la función SEC_TO_TIME para convertir 3665 segundos en formato 'hh:mm:ss'.
select sec_to_time(3665);
-- Utiliza la función SECOND para obtener los segundos de la hora de envío del envío con ID 2.
desc envios;
select second(fecha_envio)
from envios
where id = 2;
-- Utiliza la función STR_TO_DATE para convertir la cadena '2022()08()15' en una fecha.
select str_to_date('2022()08()15', "%Y()%m()%d");
-- Utiliza la función SUBTIME para restar 2 horas y 15 minutos a la hora de envío del envío con ID 7.
SELECT fecha_envio,
  SUBTIME(TIME(fecha_envio), '02:15:00') AS hora_modificada
FROM envios
WHERE id = 7;
-- Utiliza la función TIME para extraer la porción de tiempo de la fecha de envío del envío con ID 1.
SELECT fecha_envio,
  TIME(fecha_envio) AS hora_de_envio
FROM envios
WHERE id = 1;
-- Utiliza la función TIME_FORMAT para formatear la hora de envío del envío con ID 2 en 'hh:mm:ss'.
select time_format(fecha_envio, "%H:%i:%s")
from envios
where id = 2;
-- Utiliza la función TIME_TO_SEC para convertir la hora de envío del envío con ID 3 en segundos.
select time_to_sec(fecha_envio)
from envios
where id = 3;
-- Utiliza la función TIMEDIFF para calcular la diferencia de horas entre las fechas de envío y entrega del envío con ID 4.
select timediff(fecha_entrega, fecha_envio)
from envios
where id = 4;
-- Utiliza la función SYSDATE para obtener la hora exacta en la que se ejecuta la función en la consulta. Para comprobar esto invoca SYSDATE, luego la función SLEEP durante 5 segundos y luego vuelve a invocar la función SYSDATE, y verifica la diferencia entre ambas invocaciones con TIMEDIFF.
CREATE TEMPORARY TABLE test AS
SELECT SYSDATE() AS hora_inicial,
  SLEEP(5),
  SYSDATE() AS hora_final;
select TIMEDIFF(hora_inicial, hora_final) AS diferencia
from test;
SELECT SYSDATE() AS hora_inicial,
  SLEEP(5),
  SYSDATE() AS hora_final,
  TIMEDIFF(
    SYSDATE(),
    (
      SELECT SYSDATE()
      LIMIT 1
    )
  ) AS diferencia;
SELECT SYSDATE() AS tiempo_inicio;
SELECT SLEEP(5);
SELECT SYSDATE() AS tiempo_final;
SELECT TIMEDIFF(
    SYSDATE(),
    (
      SELECT SYSDATE()
      FROM DUAL
    )
  ) AS diferencia_tiempo;
-- Crea una consulta que utilice la función TIMESTAMP para obtener todos los valores de fecha_envio sumandole 12 horas.
select fecha_envio fecha_original,
  timestamp(fecha_envio, 12)
from envios;
-- Utiliza la función TIMESTAMPADD para agregar 3 horas a la fecha de entrega del envío con código de producto 'XYZ789'.
select timestampadd(HOUR, 3, fecha_entrega)
from envios
where codigo_producto = "XYZ789";
-- 
SELECT EXTRACT(
    YEAR
    FROM fecha_envio
  ) AS anio_envio
FROM envios
WHERE codigo_producto = 'LMN001';
-- 
SELECT FROM_DAYS(737402) AS fecha_correspondiente;
-- [!] funciones matemáticas y vistas [!]
create table triangulos_rectangulos (
  longitud_lado_adyacente int,
  longitud_lado_opuesto int
);
desc triangulos_rectangulos;
insert into triangulos_rectangulos
values(
    FLOOR(1 + (RAND() * 100)),
    FLOOR(1 + (RAND() * 100))
  ),
  (
    FLOOR(1 + (RAND() * 100)),
    FLOOR(1 + (RAND() * 100))
  ),
  (
    FLOOR(1 + (RAND() * 100)),
    FLOOR(1 + (RAND() * 100))
  ),
  (
    FLOOR(1 + (RAND() * 100)),
    FLOOR(1 + (RAND() * 100))
  ),
  (
    FLOOR(1 + (RAND() * 100)),
    FLOOR(1 + (RAND() * 100))
  ),
  (
    FLOOR(1 + (RAND() * 100)),
    FLOOR(1 + (RAND() * 100))
  ),
  (
    FLOOR(1 + (RAND() * 100)),
    FLOOR(1 + (RAND() * 100))
  ),
  (
    FLOOR(1 + (RAND() * 100)),
    FLOOR(1 + (RAND() * 100))
  ),
  (
    FLOOR(1 + (RAND() * 100)),
    FLOOR(1 + (RAND() * 100))
  ),
  (
    FLOOR(1 + (RAND() * 100)),
    FLOOR(1 + (RAND() * 100))
  );
CREATE PROCEDURE insertar_triangulos_rectangulos() BEGIN
DECLARE i INT DEFAULT 1;
WHILE i <= 10 DO
INSERT INTO triangulos_rectangulos (longitud_lado_adyacente, longitud_lado_opuesto)
VALUES (
    FLOOR(1 + (RAND() * 100)),
    FLOOR(1 + (RAND() * 100))
  );
SET i = i + 1;
END WHILE;
END;
call insertar_triangulos_rectangulos();
select *
from triangulos_rectangulos;


CREATE or replace VIEW pitagoras AS
SELECT longitud_lado_adyacente,
  longitud_lado_opuesto,
  SQRT(
    POW(longitud_lado_adyacente, 2) + POW(longitud_lado_opuesto, 2)
  ) AS hipotenusa
FROM triangulos_rectangulos;

-- Reemplaza la vista y ahora agrégale dos columnas para calcular el ángulo α en radianes y grados. Aquí tienes dos fórmulas:
-- En radianes: =arcsen(BC) =arccos(AC) = arctan(BA)
-- create or replace view pitagoras as
-- select longitud_lado_adyacente,
--   longitud_lado_opuesto from triangulos_rectangulos
--   hipotenusa,
--   atan(longitud_lado_opuesto/longitud_lado_adyacente) as angulo_radianes,
--   degrees(angulo_radianes) as angulo_grados
-- from pitagoras;

-- * varios enfoques para el mismo ejercicio *
create or replace view angulo as
select longitud_lado_adyacente,
longitud_lado_opuesto,
hipotenusa,
atan(longitud_lado_opuesto/longitud_lado_adyacente) as angulo_radianes,
degrees(atan(longitud_lado_opuesto/longitud_lado_adyacente)) as angulo_grados
from pitagoras;

create or replace view hipotenusa as
select *, format(sqrt(pow(longitud_lado_opuesto,2)+ pow(longitud_lado_adyacente,2)),2) as hipotenusa
from triangulos_rectangulos;

select * from hipotenusa

create or replace VIEW angulos AS
SELECT
longitud_lado_opuesto,
longitud_lado_adyacente,
DEGREES(ATAN(longitud_lado_opuesto / longitud_lado_adyacente)) AS alpha_angle,
90 - DEGREES(ATAN(longitud_lado_opuesto / longitud_lado_adyacente)) AS beta_angle
FROM
hipotenusa;

select * from angulos;

select * from angulo;

CREATE or replace VIEW pitagoras AS
SELECT longitud_lado_adyacente,
longitud_lado_opuesto,
SQRT(
POW(longitud_lado_adyacente, 2) + POW(longitud_lado_opuesto, 2)
) AS hipotenusa
FROM triangulos_rectangulos;

SELECT *
from pitagoras;

create or replace view pitagoras as
select longitud_lado_adyacente,
longitud_lado_opuesto,
SQRT(
POW(longitud_lado_adyacente, 2) + POW(longitud_lado_opuesto, 2)
) AS hipotenusa,
atan(longitud_lado_adyacente / longitud_lado_opuesto) as angulo_radianes,
DEGREES(
ATAN(longitud_lado_adyacente / longitud_lado_opuesto)
) AS angulo_grados
from triangulos_rectangulos;

SELECT * from pitagoras;

-- Crear la tabla triangulos_2
CREATE TABLE triangulos_rectangulos_2 (
angulo_alfa INT,
hipotenusa INT
);

-- Insertar 10 registros con valores aleatorios
INSERT INTO triangulos_rectangulos_2 (angulo_alfa, hipotenusa)
VALUES
(30, 10),
(45, 15),
(60, 20),
(35, 25),
(50, 30),
(40, 35),
(55, 40),
(70, 45),
(65, 50),
(75, 55);

-- Verificar los datos insertados
SELECT * FROM triangulos_rectangulos_2;

-- (angulo_radianes*pi())/180

CREATE VIEW tabla_lados as
SELECT *,
cos(radians(angulo_alfa)) * hipotenusa as lado_adyacente,
sin (radians(angulo_alfa)) * hipotenusa as lado_opuesto
from triangulos_rectangulos_2;

SELECT *
from tabla_lados;

-- 

CREATE OR REPLACE VIEW tabla_lados as
SELECT *,
FORMAT(cos(radians(angulo_alfa)) * hipotenusa, 2) as lado_adyacente,
FORMAT(sin (radians(angulo_alfa)) * hipotenusa, 2) as lado_opuesto,
90 - angulo_alfa AS angulo_beta,
180 - (90 - angulo_alfa) - angulo_alfa AS angulo_gamma
from triangulos_rectangulos_2;
table tabla_lados;

CREATE OR REPLACE VIEW tabla_lados as
SELECT *,
FORMAT(cos(radians(angulo_alfa)) * hipotenusa, 2) as lado_adyacente,
FORMAT(sin (radians(angulo_alfa)) * hipotenusa, 2) as lado_opuesto,
90 - angulo_alfa AS angulo_beta,
180 - (90 - angulo_alfa) - angulo_alfa AS angulo_gamma
from triangulos_rectangulos_2;
table tabla_lados;

CREATE TABLE mensajes (
datos VARCHAR(255),
valor_crc BIGINT
);

INSERT INTO mensajes (datos, valor_crc)
VALUES
('Hola, ¿cómo estás? Espero que tengas un buen día.', 3221685809),
('Ayer fui al cine a ver una película genial.', 951196167),
('Estoy emocionado por el próximo fin de semana.', 3275166159),
('Mi reunión se pospuso para el martes que viene.', 169741145),
('He estado trabajando en un proyecto importante.', 6480112535),
('Esta receta de pastel de manzana es deliciosa.', 2524836786),
('Planeo hacer un viaje a la playa este verano.', 5107635050),
('Mi gato se divierte jugando con su pelota.', 3578632817),
('Hoy es un día soleado y agradable.', 3675102258),
('El libro que estoy leyendo es muy interesante.', 854938277);

create or replace view analisis_crc as
select *,
case
when crc32(datos) = valor_crc
then "CORRECTO"
else "ADULTERADO"
end as analisis
from mensajes m

select * from analisis_crc;