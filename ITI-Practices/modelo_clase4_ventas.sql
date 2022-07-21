-- Script para crear base de datos de ventas con relaciones

-- Crear Base de Datos
CREATE DATABASE ventas_clase4;

-- Seleccionar Base de Datos
USE ventas_clase4;

-- Crear tabla clientes
CREATE TABLE clientes (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(20) NOT NULL,
	apellido VARCHAR(20) NOT NULL,
	email VARCHAR(50) NOT NULL,
	telefono VARCHAR(15),
	direccion VARCHAR(50) NOT NULL,
	nacionalidad VARCHAR(20)
);

-- Crear tabla vendedores
CREATE TABLE vendedores (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(20) NOT NULL,
	apellido VARCHAR(20) NOT NULL,
	email VARCHAR(50) NOT NULL,
	telefono VARCHAR(15),
	direccion VARCHAR(50) NOT NULL,
	salario DECIMAL,
	departamento VARCHAR(50)
);

-- Crear tabla productos 
CREATE TABLE productos (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(30) NOT NULL,
	descripcion VARCHAR(60),
	precio DECIMAL
);

-- Crear tabla pedidos
CREATE TABLE pedidos (
	id INT PRIMARY KEY AUTO_INCREMENT,
	descripcion VARCHAR(50) NOT NULL,
	fecha DATE NOT NULL,
	vendedor_id INT,
	cliente_id INT
);

-- Crear tabla de relacion entre pedidos y productos
CREATE TABLE pedidos_productos (
	producto_id INT,
	pedido_id INT
);

-- Relación entre pedidos y clientes
ALTER TABLE pedidos
	ADD CONSTRAINT FK_pedidos_cliente
	FOREIGN KEY (cliente_id)
	REFERENCES clientes(id);
	
-- Relación entre pedidos y vendedores
ALTER TABLE pedidos
	ADD FOREIGN KEY (vendedor_id)
	REFERENCES vendedores(id);
	
-- Relación entre pedidos_productos y pedidos
ALTER TABLE pedidos_productos
	ADD CONSTRAINT FK_pedidos_productos
	FOREIGN KEY (pedido_id)
	REFERENCES pedidos(id);
	
-- Relación entre pedidos_productos y productos
ALTER TABLE pedidos_productos
	ADD CONSTRAINT FK_productos_pedidos_productos
	FOREIGN KEY (producto_id)
	REFERENCES productos(id);
	
	
	
-- Insertar registro en tabla clientes
INSERT INTO clientes(nombre, apellido, email, telefono, direccion, nacionalidad)
VALUES('Juan', 'Perez', 'juan.perez@iti.edu.ec', '0987654321', 'Cumbaya', 'Ecuatoriano');

-- No recomendable de usar de esta manera ya que toca insertar el ID
INSERT INTO clientes
VALUES(2, 'Mario', 'Arteaga', 'mario.arteaga@iti.edu.ec', '0987754331', 'La Roldos', 'Ecuatoriano');

INSERT INTO clientes(nombre, apellido, email, telefono, direccion, nacionalidad)
VALUES('Patricia', 'Espinoza', 'patty.espinoza@iti.edu.ec', '0987665421', 'Solanda', 'Ecuatoriano');


-- Insertar registro en tabla vendedores
INSERT INTO vendedores(nombre, apellido, email, telefono, direccion, salario, departamento)
VALUES('Jose', 'Salazar', 'jose.salazar@ventas.com', '0948693208', 'Quitumbe', 425, 'Legumbres');

INSERT INTO vendedores(nombre, apellido, telefono, salario, departamento)
VALUES('Maria', 'Fernandez', '0948691234', 425, 'Tecnologia');


-- Insertar registro en tabla pedidos
INSERT INTO pedidos(descripcion, fecha, vendedor_id, cliente_id)
VALUES('pedido 1', '2022-07-14', 2, 2);


-- Instrucciones SELECT
SELECT * FROM clientes; -- Trae todos los campos de la tabla clientes
SELECT nombre, apellido, email, direccion FROM clientes; -- Trae solamente los campos definidos de la tabla clientes
SELECT nombre, apellido, email, direccion FROM clientes WHERE id > 1;
SELECT nombre, apellido, email, direccion FROM clientes WHERE nombre = 'Mario';


SELECT * FROM vendedores; -- Trae todos los campos de la tabla vendedores
SELECT nombre, apellido, email, departamento FROM vendedores; -- Trae solamente los campos definidos de la tabla vendedores


-- Actualizacion de datos
UPDATE clientes SET nombre = 'Pablo', apellido = 'Solano', email = 'pablo.solano@gmail.com', telefono = '0912312312'
WHERE id = 2;

UPDATE clientes SET
direccion = 'Condado'; -- NO EJECUTAR YA QUE CAMBIARA LA DIRECCION DE TODOS LOS CLIENTES

UPDATE clientes SET
direccion = 'Condado'
WHERE id = 3;


UPDATE pedidos SET
fecha = `2022-07-13`
WHERE id = 1;



-- Eliminar registros (DELETE)
DELETE FROM clientes
WHERE id = 2;