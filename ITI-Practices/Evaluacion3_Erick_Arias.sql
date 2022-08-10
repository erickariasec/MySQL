-- Nombre: Erick Roberto Arias Sánchez
-- Script para crear base de datos de la evaluacion 3

-- Crear Base de Datos
CREATE DATABASE evaluacion3;

-- Seleccionar Base de Datos
USE evaluacion3;

-- Crear tabla cliente
CREATE TABLE cliente (
	id_cliente INT PRIMARY KEY AUTO_INCREMENT,
	cedula VARCHAR(10) NOT NULL,
	nombre	VARCHAR(30) NOT NULL,
	apellido VARCHAR(30) NOT NULL,
	direccion VARCHAR(100),
	fecha_nac DATE NOT NULL,
	telefono VARCHAR(15),
	email VARCHAR(60)
);

-- Crear tabla factura
CREATE TABLE factura (
	id_factura INT PRIMARY KEY AUTO_INCREMENT,
	id_cliente INT,
	fecha_factura TIMESTAMP
);

-- Crear tabla detalle_factura
CREATE TABLE detalle_factura (
	id_detalle_factura INT PRIMARY KEY AUTO_INCREMENT,
	id_factura INT,
	id_producto INT,
	cantidad INT NOT NULL,
	precio FLOAT NOT NULL
);

-- Crear tabla producto
CREATE TABLE producto (
	id_producto INT PRIMARY KEY AUTO_INCREMENT,
	id_categoria INT,
	nombre VARCHAR(20) NOT NULL,
	precio FLOAT NOT NULL,
	existencia INT
);

-- Crear tabla categoria
CREATE TABLE categoria (
	id_categoria INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(20) NOT NULL,
	descripcion VARCHAR(50)
);

-- Relación entre factura y cliente
ALTER TABLE evaluacion3.factura
	ADD CONSTRAINT FK_factura_cliente
    FOREIGN KEY (id_cliente) 
    REFERENCES evaluacion3.cliente(id_cliente);
	
-- Relación entre detalle_factura y factura
ALTER TABLE evaluacion3.detalle_factura
	ADD CONSTRAINT FK_detalle_factura_cliente
	FOREIGN KEY (id_factura)
	REFERENCES evaluacion3.factura(id_factura);
	
-- Relación entre detalle_factura y producto
ALTER TABLE evaluacion3.detalle_factura
	ADD CONSTRAINT FK_detalle_factura_producto
	FOREIGN KEY (id_producto)
	REFERENCES evaluacion3.producto(id_producto);
	
-- Relación entre producto y categoria
ALTER TABLE evaluacion3.producto
	ADD CONSTRAINT FK_producto_categoria
	FOREIGN KEY (id_categoria)
	REFERENCES evaluacion3.categoria(id_categoria);
	
-- Insertar registros en tabla cliente
INSERT INTO cliente(cedula, nombre, apellido, direccion, fecha_nac, telefono, email)
VALUES
	('1710509764', 'Mary', 'Escobar', 'El Recreo', '1984-06-22', '0987654321', 'mary.escobar@iti.edu.ec'),
	('1710609773', 'Juan', 'Landa', 'Guamaní', '1985-05-21', '0987654422', 'juan.landa@iti.edu.ec'),
	('1710509765', 'Lety', 'Estrada', 'San Bartolo', '1983-02-15', '0987654523', 'lety.estrada@iti.edu.ec'),
	('1710609774', 'Erick', 'Santamaria', 'Carapungo', '1963-03-01', '0987654624', 'erick.santamaria@iti.edu.ec'),
	('1710609766', 'Juan', 'Armas', 'San Roque', '1969-07-07', '0987654725', 'juan.armas@iti.edu.ec'),
	('1710609775', 'Abigail', 'Rivera', 'El Calzado', '1945-08-12', '0987654826', 'abigail.rivera@iti.edu.ec'),
	('1710609767', 'Lisseth', 'Navarrete', 'La Tola', '1975-09-19', '0987654927', 'lisseth.navarrete@iti.edu.ec'),
	('1710609796', 'Karen', 'Cartagena', 'Guajalo', '1995-08-12', '0987654108', 'karen.cartagena@iti.edu.ec'),
	('1710509768', 'Mary', 'Lilipunga', 'La Gasca', '1988-05-25', '0987654119', 'mary.lilipunga@iti.edu.ec'),
	('1710609778', 'Carla', 'Proaño', 'El Condado', '1970-03-23', '0987654120', 'carla.proano@iti.edu.ec');
	
-- Insertar registros en tabla factura
INSERT INTO factura(id_cliente, fecha_factura)
VALUES
	(1, '2021-01-19 11:58:01'),
	(2, '2022-03-04 03:15:16'),
	(3, '2022-04-22 01:10:12'),
	(4, '2021-05-25 02:11:13'),
	(5, '2021-06-26 03:12:14'),
	(6, '2022-07-12 04:13:15'),
	(7, '2021-08-11 05:14:16'),
	(8, '2021-09-01 06:15:17'),
	(9, '2022-01-15 07:16:18'),
	(10, '2022-02-20 08:17:19');
	
-- Insertar registros en tabla categoria
INSERT INTO categoria(nombre, descripcion)
VALUES
	('Automotriz', 'Todo para tu auto'),
	('Bebé', 'Todo para tu bebé'),
	('Belleza', 'Todo para tu apariencia'),
	('Electrónicos', 'Todo en aparatos electrónicos'),
	('Equipaje', 'Todo para tu viaje'),
	('Hogar', 'Todo para tu casa'),
	('Cocina', 'Todo para tu cocina'),
	('Juguetes', 'Todo para tus pequeños'),
	('Libros', 'Todo para tu lectura diaria'),
	('Videojuegos', 'Todo para tu distracción');
	
-- Insertar registros en tabla producto
INSERT INTO producto(id_categoria, nombre, precio, existencia)
VALUES
	(1, 'Asiento VW', 49.99, 1200),
	(2, 'Biberón', 5.45, 80),
	(3, 'Perfume VS', 589.49, 20),
	(4, 'Pizarra Virtual', 30.12, 800),
	(5, 'Maleta', 84.15, 45),
	(6, 'Obra de Arte VG', 1200.99, 10),
	(7, 'Cuchillo', 12.99, 1400),
	(8, 'Carro CR', 249.99, 100),
	(9, 'Vendes o Vendes', 12.49, 400),
	(10, 'GTA Vice City', 48.59, 5000);
	
-- Insertar registros en tabla detalle_factura
INSERT INTO detalle_factura(id_factura, id_producto, cantidad, precio)
VALUES
	(1, 1, 2, 99.98),
	(2, 2, 10, 54.50),
	(3, 3, 1, 589.49),
	(4, 4, 4, 120.48),
	(5, 5, 3, 252.45),
	(6, 6, 1, 1200.99),
	(7, 7, 2, 25.98),
	(8, 8, 1, 249.99),
	(9, 9, 6, 74.94),
	(10, 10, 3, 145.77);