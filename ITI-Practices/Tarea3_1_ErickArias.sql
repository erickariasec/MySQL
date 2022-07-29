-- Nombre: Erick Roberto Arias Sánchez
-- Script para crear base de datos de la Tarea 3.1

-- Crear Base de Datos
CREATE DATABASE tarea3_1;

-- Seleccionar Base de Datos
USE tarea3_1;

-- Dada la siguiente base de datos relacional:

-- Crear tabla EMPLEADO
CREATE TABLE EMPLEADO (
	id_empleado INT PRIMARY KEY AUTO_INCREMENT,
	codigo_c VARCHAR(25) NOT NULL,
	nombre	VARCHAR(100) NOT NULL,
	edad INT NOT NULL,
	oficio VARCHAR(40),
	dir VARCHAR(20) NOT NULL,
	fecha_alt DATE,
	salario DECIMAL NOT NULL,
	comision DECIMAL,
	depto_no INT
);

-- Crear tabla DEPARTAMENTO
CREATE TABLE DEPARTAMENTO (
	depto_no INT PRIMARY KEY,
	nombre_depto VARCHAR(50) NOT NULL,
	localizacion VARCHAR(20) NOT NULL
);

-- Relación entre EMPLEADO y DEPARTAMENTO
ALTER TABLE tarea3_1.EMPLEADO
	ADD CONSTRAINT FK_EMPLEADO_DEPARTAMENTO
    foreign key (depto_no) 
    REFERENCES tarea3_1.DEPARTAMENTO(depto_no);
	
-- Insertar registros en tabla DEPARTAMENTO
INSERT INTO DEPARTAMENTO(depto_no, nombre_depto, localizacion)
VALUES
	(10, 'Desarrollo Software', 'El Coyolar'),
	(20, 'Analisis Sistema', 'Guadalupe'),
	(30, 'Contabilidad', 'Subtiava'),
	(40, 'Ventas', 'San Felipe');
	
-- Insertar registros en tabla EMPLEADO
INSERT INTO EMPLEADO(codigo_c, nombre, edad, oficio, dir, fecha_alt, salario, comision, depto_no)
VALUES
	('281-160483-0005F', 'Rocha Vargas Hector', 27, 'Vendedor', 'Leon', '1983-05-12', 12000, 0, 40),
	('281-040483-0056P', 'López Hernandez Julio', 27, 'Analista', 'Chinandega', '1982-07-14', 13000, 1500, 20),
	('081-130678-0004S', 'Esquivel José', 31, 'Director', 'Juigalpa', '1981-06-05', 16700, 1200, 30),
	('281-160473-0009Q', 'Delgado Carmen', 37, 'Vendedor', 'Leon', '1983-03-02', 13400, 0, 40),
	('281-160493-0005F', 'Castillo Montes Luis', 17, 'Vendedor', 'Masaya', '1982-08-12', 16309, 1000, 40),
	('281-240784-0004Y', 'Esquivel Leonel Alfonso', 26, 'Presidente', 'Nagarote', '1981-09-12', 15000, 0, 30),
	('281-161277-0008R', 'Perez Luis', 32, 'Empleado', 'Managua', '1980-03-02', 16890, 0, 10);
	
-- RESUELVA LAS SIGUIENTES CONSULTAS EN SQL:
-- 1. Mostrar los nombres de los empleados ordenados alfabéticamente (Z…A)
SELECT nombre FROM EMPLEADO ORDER BY nombre desc;

-- 2. Seleccionar el nombre, el oficio y la localidad de los departamentos donde trabajan los Vendedores.
SELECT EMPLEADO.nombre, EMPLEADO.oficio, DEPARTAMENTO.localizacion
FROM EMPLEADO
INNER JOIN DEPARTAMENTO ON EMPLEADO.depto_no = DEPARTAMENTO.depto_no
WHERE EMPLEADO.oficio = 'Vendedor';

-- 3. Listar los nombres de los empleados cuyo nombre termine con la letra ‘o’.
SELECT nombre FROM EMPLEADO WHERE nombre LIKE '%o';

-- 4. Seleccionar el nombre, el oficio y salario de los empleados que trabajan en León.
SELECT nombre, oficio, salario FROM EMPLEADO
WHERE dir = 'Leon';

-- 5. Seleccionar el nombre, salario y localidad donde trabajan de los empleados que tengan un salario entre 10000 y 13000.
SELECT EMPLEADO.nombre, EMPLEADO.salario, DEPARTAMENTO.localizacion
FROM EMPLEADO
INNER JOIN DEPARTAMENTO ON EMPLEADO.depto_no = DEPARTAMENTO.depto_no
WHERE EMPLEADO.salario BETWEEN 10000 AND 13000;

-- 6. Visualizar los departamentos con más de 2 empleados.
SELECT EMPLEADO.depto_no, COUNT(*) AS num_empleados FROM EMPLEADO, DEPARTAMENTO
WHERE EMPLEADO.depto_no=DEPARTAMENTO.depto_no GROUP BY EMPLEADO.depto_no HAVING COUNT(*) > 2;

-- 7. Mostrar el nombre, salario y nombre del departamento de los empleados que tengan el mismo oficio que ‘Leonel Alfonso Esquivel’.
SELECT EMPLEADO.nombre, EMPLEADO.salario, DEPARTAMENTO.nombre_depto
FROM EMPLEADO
INNER JOIN DEPARTAMENTO ON EMPLEADO.depto_no = DEPARTAMENTO.depto_no
WHERE EMPLEADO.oficio = 'Presidente';

-- 8. Mostrar el nombre, salario y nombre del departamento de los empleados que tengan el mismo oficio que “Castillo Montes Luis” y que no tengan comisión.
SELECT EMPLEADO.nombre, EMPLEADO.salario, DEPARTAMENTO.nombre_depto
FROM EMPLEADO
INNER JOIN DEPARTAMENTO ON EMPLEADO.depto_no = DEPARTAMENTO.depto_no
WHERE EMPLEADO.oficio = 'Vendedor' AND EMPLEADO.comision = 0;

-- 9. Mostrar los datos de los empleados que trabajan en el departamento de contabilidad, ordenados por nombre.
SELECT *
FROM EMPLEADO
INNER JOIN DEPARTAMENTO ON EMPLEADO.depto_no = DEPARTAMENTO.depto_no
WHERE DEPARTAMENTO.nombre_depto = 'Contabilidad'
ORDER BY EMPLEADO.nombre ASC;

-- 10. Nombre de los empleados que trabajan en León y cuyo oficio sea analista o empleado.
SELECT nombre FROM EMPLEADO
WHERE EMPLEADO.dir = 'Leon'
AND (EMPLEADO.oficio = 'Analista' OR EMPLEADO.oficio = 'Empleado');

-- 11. ¿Cuántos empleados hay en el departamento número 10?
SELECT COUNT(*) AS num_empleados FROM EMPLEADO
WHERE depto_no = 10;

-- 12. ¿Cuántos empleados hay en el departamento de ‘VENTAS’?
SELECT COUNT(*) AS num_empleados_ventas
FROM EMPLEADO
INNER JOIN DEPARTAMENTO ON EMPLEADO.depto_no = DEPARTAMENTO.depto_no
WHERE DEPARTAMENTO.nombre_depto = 'Ventas';

-- 13. Calcula el número de empleados que no tienen comisión.
SELECT COUNT(*) AS empleados_sin_comision FROM EMPLEADO
WHERE comision = 0;

-- 14. Visualizar cuántos nombres de los empleados empiezan por la letra ‘A’.
SELECT COUNT(*) AS empleados_empiezan_letra_A FROM EMPLEADO
WHERE nombre LIKE 'A%';

-- 15. Visualizar el número de empleados de cada departamento.
SELECT EMPLEADO.depto_no, COUNT(*) AS num_empleados_by_departamento FROM EMPLEADO, DEPARTAMENTO
WHERE EMPLEADO.depto_no = DEPARTAMENTO.depto_no GROUP BY EMPLEADO.depto_no;