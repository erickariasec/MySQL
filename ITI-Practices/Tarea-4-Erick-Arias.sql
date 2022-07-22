-- Script para crear base de datos de la Tarea 4
-- Erick Arias

-- Crear base de datos

CREATE DATABASE tarea4;

-- Seleccionar Base de Datos
USE tarea4;

-- Crear tabla clientes

CREATE TABLE clientes (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nombre	VARCHAR(20) NOT NULL,
	apellido VARCHAR(20) NOT NULL,
	email VARCHAR(50) NOT NULL,
	telefono VARCHAR(15),
	direccion VARCHAR(50) NOT NULL,
	nacionalidad VARCHAR(20)
);

-- Crear tabla vendedores

CREATE TABLE vendedores (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nombre	VARCHAR(20) NOT NULL,
	apellido VARCHAR(20) NOT NULL,
	email VARCHAR(50) NOT NULL,
	telefono VARCHAR(15),
	direccion VARCHAR(50) NOT NULL,
	salario DECIMAL,
	departamento VARCHAR(50)
);

-- Crear tabla productos
CREATE TABLE productos(
	id INT PRIMARY KEY AUTO_INCREMENT, 
	nombre	VARCHAR(30) NOT NULL,
	descripcion	VARCHAR(60)
);

-- Crear tabla pedidos
CREATE TABLE pedidos(
	id INT PRIMARY KEY AUTO_INCREMENT,
	descripcion VARCHAR(50) NOT NULL,
	fecha DATE NOT NULL,
	vendedor_id INT,
	cliente_id INT
);

-- Crear tabla de relación entre pedidos y productos
CREATE TABLE pedidos_productos (
	producto_id INT,
	pedido_id INT
);

-- Relación entre Pedidos y Clientes
ALTER TABLE tarea4.pedidos
	ADD CONSTRAINT FK_pedidos_cliente 
    foreign key (cliente_id) 
    REFERENCES tarea4.clientes(id);
    
-- Relación entre pedidos y vendedores
ALTER TABLE tarea4.pedidos
	ADD foreign key (vendedor_id) 
    REFERENCES tarea4.vendedores(id);

-- Relación entre pedidos_productos y pedidos
ALTER TABLE tarea4.pedidos_productos
	ADD CONSTRAINT FK_pedidos_pedidos_productos 
    foreign key (pedido_id) 
    REFERENCES pedidos(id);

-- Relación entre pedidos_productos y productos
ALTER TABLE tarea4.pedidos_productos
	ADD CONSTRAINT FK_productos_pedidos_productos 
    foreign key (producto_id) 
    REFERENCES productos(id);
	
-- Insertar 10 registros en la tabla clientes
INSERT INTO clientes(nombre, apellido, email, telefono, direccion, nacionalidad)
VALUES
	('Hernan', 'Jurado', 'hernan.jurado@iti.edu.ec', '0987654301', 'Guapulo', 'Ecuatoriana'),
	('Camila', 'Aigaje', 'camila.aigaje@iti.edu.ec', '0987654302', 'La Mariscal', 'Ecuatoriana'),
	('Mayerli', 'Amaya', 'mayerli.amaya@iti.edu.ec', '0987654303', 'Iñaquito', 'Venezonala'),
	('Liseth', 'Pilicita', 'liseth.pilicita@iti.edu.ec', '0987654304', 'La Floresta', 'Ecuatoriana'),
	('Andres', 'Crespo', 'andres.crespo@iti.edu.ec', '0987654305', 'Mitad del Mundo', 'Ecuatoriana'),
	('Anderson', 'Machado', 'anderson.machado@iti.edu.ec', '0987654306', 'Quitumbe', 'Ecuatoriana'),
	('Nayeli', 'Mantilla', 'nayeli.mantilla@iti.edu.ec', '0987654307', 'El Recreo', 'Colombiana'),
	('Abigail', 'Reinoso', 'abigail.reinoso@iti.edu.ec', '0987654308', 'Monjas', 'Ecuatoriana'),
	('Eddy', 'Vivanco', 'eddy.vivanco@iti.edu.ec', '0987654309', 'La Marin', 'Ecuatoriana'),
	('Adriana', 'Romero', 'adriana.romero@iti.edu.ec', '0987654310', 'Cotocollao', 'Ecuatoriana');

-- Insertar 10 registros en la tabla vendedores
INSERT INTO vendedores(nombre, apellido, email, telefono, direccion, salario, departamento)
VALUES
	('Ligia', 'Oquendo', 'ligia.oquendo@ventas.com', '0948693201', 'Kennedy', 425, 'Legumbres'),
	('Joaquin', 'Galvan', 'joaquin.galvan@ventas.com', '0948693202', 'San Bartolo', 600, 'Vehiculos'),
	('Rene', 'Salcedo', 'rene.salcedo@ventas.com', '0948693203', 'Solanda', 1200, 'Software'),
	('Domenica', 'Nuñez', 'domenica.nuñez@ventas.com', '0948693204', 'El Batan', 500, 'Hogar'),
	('Astrid', 'Sanchez', 'astrid.sanchez@ventas.com', '0948693205', 'Bellavista', 800, 'Joyeria'),
	('Juan', 'Mercedes', 'juan.mercedes@ventas.com', '0948693206', 'Villaflora', 500, 'Hogar'),
	('Roberto', 'Salgado', 'roberto.salgado@ventas.com', '0948693207', 'Puengasi', 425, 'Legumbres'),
	('Maria', 'Quiñonez', 'maria.quiñonez@ventas.com', '0948693208', 'Guamani', 1200, 'Software'),
	('Paul', 'Proaño', 'paul.proaño@ventas.com', '0948693209', 'Tumbaco', 600, 'Vehiculos'),
	('Paola', 'Jerez', 'paola.jerez@ventas.com', '0948693210', 'El Tingo', 600, 'Vehiculos');
	
-- Insertar 10 registros en la tabla productos
INSERT INTO productos(nombre, descripcion)
VALUES
	('Manzana', 'Verde'),
	('Ford', 'F-150'),
	('Web App', 'Pedidos'),
	('Comedor', '4 sillas'),
	('Aretes', 'Oro Golfi'),
	('Muebles', 'Juego Completo'),
	('Pera', 'Ambateña'),
	('App Movil', 'Red Social'),
	('Toyota', 'Fortuner'),
	('Chevrolet', 'Captiva');
	
-- Insertar 10 registros en la tabla pedidos
INSERT INTO pedidos(descripcion, fecha, vendedor_id, cliente_id)
VALUES
	('Pedido-1 Manzana', '2022-01-22', 1, 1),
	('Pedido-1 Ford', '2022-03-16', 2, 2),
	('Pedido-1 Web App', '2022-05-14', 3, 3),
	('Pedido-1 Comedor', '2022-01-05', 4, 4),
	('Pedido-1 Aretes', '2022-04-26', 5, 5),
	('Pedido-1 Muebles', '2022-02-27', 6, 6),
	('Pedido-1 Pera', '2022-03-01', 7, 7),
	('Pedido-1 App Movil', '2022-05-05', 8, 8),
	('Pedido-1 Toyota', '2022-07-12', 9, 9),
	('Pedido-1 Chevrolet', '2022-07-11', 10, 10);
	
-- Insertar 10 registros en la tabla pedidos_productos
INSERT INTO pedidos_productos(producto_id, pedido_id)
VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5),
	(6, 6),
	(7, 7),
	(8, 8),
	(9, 9),
	(10, 10);