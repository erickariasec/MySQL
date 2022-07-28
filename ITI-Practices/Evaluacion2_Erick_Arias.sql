-- Nombre: Erick Roberto Arias Sánchez
-- Script para crear base de datos de la evaluacion 2

-- Crear Base de Datos
CREATE DATABASE evaluacion2;

-- Seleccionar Base de Datos
USE evaluacion2;

-- Crear tabla empleado
CREATE TABLE empleado (
	id_empleado INT PRIMARY KEY AUTO_INCREMENT,
	id_departamento INT,
	cedula CHAR(10) NOT NULL,
	nombre	VARCHAR(100) NOT NULL,
	fecha_nac DATE NOT NULL,
	profesion VARCHAR(40),
	fecha_ingreso DATE,
	salario DECIMAL(8,2),
	comision DECIMAL(8,2)
);

-- Crear tabla departamento
CREATE TABLE departamento (
	id_departamento INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL,
	ubicacion VARCHAR(20) NOT NULL
);

-- Relación entre empleado y departamento
ALTER TABLE evaluacion2.empleado
	ADD CONSTRAINT FK_empleado_departamento
    foreign key (id_departamento) 
    REFERENCES evaluacion2.departamento(id_departamento);
	
-- Insertar registros en tabla departamento
INSERT INTO departamento(nombre, ubicacion)
VALUES
	('Tecnologia', 'Quito'),
	('Electronica', 'Cuenca'),
	('Produccion', 'Quito'),
	('Cocina', 'Quito'),
	('Contabilidad', 'Guayaquil'),
	('Logistica', 'Guayaquil'),
	('Marketing', 'Quito'),
	('Comercial', 'Cuenca'),
	('Almacen', 'Guayaquil'),
	('Ventas', 'Quito');
	
-- Insertar registros en tabla empleado
INSERT INTO empleado(id_departamento, cedula, nombre, fecha_nac, profesion, fecha_ingreso, salario, comision)
VALUES
	(1, '1710509764', 'Mary Escobar', '1984-06-22', 'Sistemas', '2017-02-17', 600, 300),
	(1, '1710609773', 'Juan Landa', '1985-05-21', 'Sistemas', '2018-03-15', 1500, 600),
	(1, '1710509765', 'Lety Estrada', '1983-02-15', 'Sistemas', '2016-01-16', 1000, 300),
	(2, '1710609774', 'Erick Santamaria', '1963-03-01', 'Ingenieria', '2015-02-02', 1300, 580),
	(2, '1710609766', 'Juan Armas', '1969-07-07', 'Ingenieria', '2015-03-03', 1500, 100),
	(2, '1710609775', 'Abigail Rivera', '1945-08-12', 'Ingenieria', '2018-04-03', 1000, 200),
	(3, '1710609767', 'Lisseth Navarrete', '1975-09-19', 'Ingenieria', '2014-02-16', 1200, 400),
	(4, '1710609796', 'Karen Cartagena', '1995-08-12', 'Chef', '2019-02-08', 1300, 200),
	(5, '1710509768', 'Mary Lilipunga', '1988-05-25', 'Contador', '2017-02-17', 100, 300),
	(5, '1710609778', 'Carla Proaño', '1970-03-23', 'Contador', '2019-04-16', 1500, 600),
	(5, '1710509769', 'Lety Estrada', '1983-02-15', 'Contador', '2013-01-17', 1800, 300),
	(6, '1710609788', 'Carla Proaño', '1970-03-26', 'Marketer', '2016-09-11', 1000, 200);
	
-- Mostrar el nombre, cedula y salario de todos los empleados
SELECT nombre, cedula, salario FROM empleado;

-- Seleccionar el nombre del empleado, la profesión y la ubicación del departamento y el nombre del departamento
-- donde trabajan los Empleados.
SELECT empleado.nombre, empleado.profesion, departamento.ubicacion, departamento.nombre AS nom_departamento
FROM empleado
INNER JOIN departamento ON empleado.id_departamento = departamento.id_departamento;

-- Listar los nombres de los empleados cuya profesión sea Sistemas.
SELECT nombre FROM empleado
WHERE profesion = 'Sistemas';

-- Seleccionar el nombre, la profesión y salario de los empleados que trabajan en Quito.
SELECT empleado.nombre, empleado.profesion, empleado.salario, departamento.ubicacion
FROM empleado
INNER JOIN departamento ON empleado.id_departamento = departamento.id_departamento
WHERE departamento.ubicacion = 'Quito';

-- Seleccionar el nombre, salario y ubicación donde trabajan de los empleados que tengan un salario de 1000 USD.
SELECT empleado.nombre, empleado.salario, departamento.ubicacion
FROM empleado
INNER JOIN departamento ON empleado.id_departamento = departamento.id_departamento
WHERE empleado.salario = 1000;

-- Mostrar los datos de los empleados que trabajan en el departamento de contabilidad y que ganen 1500 USD.
SELECT empleado.*
FROM empleado
INNER JOIN departamento ON empleado.id_departamento = departamento.id_departamento
WHERE departamento.nombre = 'Contabilidad'
AND empleado.salario = 1500;

-- Nombre de los empleados que trabajan en Quito y cuya profesión sea sistemas o electrónica.
SELECT empleado.nombre
FROM empleado
INNER JOIN departamento ON empleado.id_departamento = departamento.id_departamento
WHERE departamento.ubicacion = 'Quito'
AND (empleado.profesion = 'Sistemas' OR empleado.profesion = 'Electronica');