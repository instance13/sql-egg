-- [!] Ejercicios de mis notas [!]

-- * Primer ejercicio *
-- Queremos encontrar:  
-- todos los *productos* que tienen un descuento superior al 20%, y además aquellos que han sido etiquetados como "Oferta Especial" *sin importar el porcentaje de descuento.*
-- Este ejercicio está pensado para practicar con: WHERE, JOIN y UNION.

select p.nombre, p.precio, d.id_producto, d.descuento
from productos p 
join descuentos d
on p.id = d.id_producto
where d.descuento > 20
UNION
select p.nombre, p.precio, d.id_producto, d.descuento
from productos p 
join descuentos d
on p.id = d.id_producto
where d.etiqueta = "Oferta Especial";

/* problemas enfrentados en este ejercicio:
1. no sabía cuál debería ser una condición de where y cuál debería ser una condición de on.
- respuesta: diferenciar filtrado de condición lógica. "d.descuento > 20" es un filtrado, mientras que "d.id_producto = p.id" corresponde más al tipo de condición lógica que se hace para unir dos tablas.
2. escribir cláusula where antes de join.
*/

-- * Segundo ejercicio *
-- Queremos encontrar los departamentos donde la media de salarios sea superior a 4500, y dentro de esos departamentos, listar los empleados que ganan más que la media de su departamento.
-- Este ejercicio está pensado para practicar con: HAVING, GROUP BY y JOIN.
select d.nombre, e.nombre, e.salario, e.departamento_id 
from departamentos d
join empleados e 
on d.id = e.departamento_id
group by e.nombre, e.salario, d.nombre
having avg(e.salario) > 4500 and e.salario > avg(e.salario);

/* problemas enfrentados en este ejercicio:
1. ¿cómo debería agrupar los datos? cómo saber qué columnas seleccionar.
2. condición del having.
*/

-- * tercer ejercicio *
-- Queremos encontrar todos los empleados que trabajan en un departamento cuyo nombre contiene la palabra "Ventas" y cuyo salario es mayor a 3000.
-- Este ejercicio está pensado para practicar con: WHERE, JOIN y LIKE.
select e.id, e.nombre, d.id, d.nombre
from empleados e
join departamentos d
on e.departamento_id = d.id
where d.nombre like "%Ventas%" AND e.salario > 3000;