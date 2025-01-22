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

INSERT INTO estudiantes (id, nombre, apellido, edad, promedio) VALUES
(1, 'Juan', 'Pérez', 22, 85.5),
(2, 'María', 'Gómez', 21, 90.0),
(3, 'Luis', 'Rodríguez', 20, 88.5),
(4, 'Ana', 'Martínez', 23, 92.0),
(5, 'Carlos', 'López', 22, 86.5);

select char_length(nombre) longitud_nombre, char_length(apellido) longitud_apellido from estudiantes where nombre = "Luis" AND apellido = "Rodríguez";

/*
Concatena el nombre y el apellido del estudiante con el nombre "María" y apellido "Gómez" con un espacio en el medio. 
*/

select concat(nombre, " ", apellido) nombreYApellido from estudiantes where nombre = "María" AND apellido = "Gómez";

/*
Encuentra la posición de la primera 'e' en el apellido del estudiante con el nombre "Juan" y apellido "Pérez".

Inserta la cadena ' García' en la posición 3 del nombre del estudiante con el nombre "Ana" y apellido "Martínez".
*/
select locate("e", apellido) from estudiantes where nombre = "Juan" AND apellido = "Pérez"; 

-- INSERT(str, pos, len, newstr)
select insert(nombre, 3, 6, " García") from estudiantes where nombre = "Ana" AND apellido = "Martínez";

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
select lower(nombre), lower(apellido) from estudiantes where nombre = "Luis" AND apellido = "Rodríguez";
update estudiantes set nombre = lower (nombre);
select nombre from estudiantes where nombre = "luis";
update estudiantes set apellido = lower(apellido);
select apellido from estudiantes where apellido = "rodríguez";

select left(apellido, 4) from estudiantes where nombre = "María" AND apellido = "Gómez";

select right(apellido, 3) from estudiantes where nombre = "Ana" AND apellido = "Martínez";

/*
Encuentra la posición de la primera 'o' en el nombre del estudiante con el nombre "Carlos" y apellido "López". (LOCATE)

Encuentra la posición de la primera aparición de la letra 'a' en el nombre de la estudiante con el nombre "María" y apellido "Gómez".

Reemplaza 'a' con 'X' en el nombre del estudiante con el nombre "Ana" y apellido "Martínez". 
*/

select locate("o", nombre) from estudiantes where nombre = "Carlos" AND apellido = "López";

select replace(nombre, "a", "X") from estudiantes where nombre = "Ana" AND apellido = "Martínez";

/*
Encuentra la subcadena de 3 caracteres de longitud de la columna 'nombre' del estudiante con el nombre "María" y apellido "Gómez", comenzando en la posición 2.

Combina los nombres de todos los estudiantes en una única cadena separada por guiones.

Combina los nombres y apellidos de todos los estudiantes en una única cadena separada por un guion vertical (|). 

Elimina los espacios en blanco iniciales del texto "    … usé muchos espacios    ".

Elimina los espacios en blanco finales del texto "    … usé muchos espacios    ".

Cita el resultado de los dos ejercicios anteriores utilizando la función QUOTE.
*/

select mid(nombre, 2, 3) from estudiantes where nombre = "María" AND apellido = "Gómez";

select group_concat(nombre separator " - ") from estudiantes;
select group_concat(nombre, " ", apellido separator " | ") from estudiantes;

select rtrim("    … usé muchos espacios    ");
select ltrim("    … usé muchos espacios    ");

select quote(" … usé muchos espacios    ");

/*Repite el nombre y apellido del estudiante con el nombre "Juan" y apellido "Pérez" tres veces. 

Invierte el nombre del estudiante con el nombre "Ana" y apellido "Martínez". 

Devuelve una cadena que contenga 8 caracteres de espacio usando la función SPACE y muéstrala con la función QUOTE.

Extrae una subcadena que contiene el nombre del estudiante con el nombre "María" y apellido "Gómez" antes de la segunda a utilizando SUBSTRING_INDEX.*/

select repeat(nombre, 3), repeat(apellido, 3) from estudiantes where nombre = "Juan" AND apellido="Pérez";

select reverse(nombre) from estudiantes where nombre = "Luis" AND apellido = "Rodríguez";

select quote(space(8)); -- resultado inesperado

select substring_index(nombre, "a", 2) from estudiantes where nombre = "María" AND apellido = "Gómez"; 

/*
Combina las edades de todos los estudiantes en una única cadena separada por comas y orden descendente.

Elimina las ‘a’ del nombre' del estudiante con el nombre "Ana" y apellido "Martínez" usando la función REPLACE. 

Rellena a la derecha el promedio del estudiante con el nombre "Luis" y apellido "Rodríguez" con asteriscos hasta una longitud total de 10 caracteres. 

Obtén el promedio del estudiante con nombre 'Carlos' y apellido 'López', formateado con dos decimales y utilizando la configuración regional 'es_AR'.
*/

select group_concat(edad order by edad desc separator ", ") from estudiantes;

desc estudiantes;
select rpad(promedio, 10, "*") from estudiantes where nombre "Luis" AND apellido = "Rodríguez";
SELECT FORMAT(promedio,2,'es_AR')
FROM estudiantes
WHERE nombre = 'Carlos' and apellido = "López";

