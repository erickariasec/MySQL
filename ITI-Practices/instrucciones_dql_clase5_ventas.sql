-- INSTRUCCIONES DQL (Linea 114) 
-- Script para crear base de datos de ventas con relaciones

-- Crear Base de Datos
CREATE DATABASE ventas_clase5_dql;

-- Seleccionar Base de Datos
USE ventas_clase5_dql;

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
ALTER TABLE ventas_clase5_dql.pedidos
	ADD CONSTRAINT FK_pedidos_cliente 
    foreign key (cliente_id) 
    REFERENCES ventas_clase5_dql.clientes(id);
    
-- Relación entre pedidos y vendedores
ALTER TABLE ventas_clase5_dql.pedidos
	ADD foreign key (vendedor_id) 
    REFERENCES ventas_clase5_dql.vendedores(id);

-- Relación entre pedidos_productos y pedidos
ALTER TABLE ventas_clase5_dql.pedidos_productos
	ADD CONSTRAINT FK_pedidos_pedidos_productos 
    foreign key (pedido_id) 
    REFERENCES pedidos(id);

-- Relación entre pedidos_productos y productos
ALTER TABLE ventas_clase5_dql.pedidos_productos
	ADD CONSTRAINT FK_productos_pedidos_productos 
    foreign key (producto_id) 
    REFERENCES productos(id);



-- Insertar registro en tabla clientes
INSERT INTO clientes(nombre, apellido, email, telefono, direccion, nacionalidad)
VALUES('Juan', 'Perez', 'juan.perez@iti.edu.ec', '0987654321', 'Cumbaya', 'Ecuatoriano');

-- No recomendable de usar de esta manera ya que toca insertar el ID
INSERT INTO clientes
VALUES(2, 'Mario', 'Arteaga', 'mario.arteaga@iti.edu.ec', '0987754331', 'La Roldos', 'Ecuatoriano');

INSERT INTO clientes(nombre, apellido, email, telefono, direccion, nacionalidad)
VALUES
	('Patricia', 'Espinoza', 'patty.espinoza@iti.edu.ec', '0987665421', 'Solanda', 'Ecuatoriano'),
	('Susana', 'Cadena', 'susana.cadena@iti.edu.ec', '0997695452', 'La Ecuatoriana', 'Colombiana'),
	('Gonzalo', 'Pineda', 'gonzalo.pineda@iti.edu.ec', '0987655323', 'Calderon', 'Ecuatoriano'),
	('Fabian', 'Valverde', 'fabian.valverde@iti.edu.ec', '0987756324', 'Calderon', 'Peruana');


-- Insertar registro en tabla vendedores
INSERT INTO vendedores(nombre, apellido, email, telefono, direccion, salario, departamento)
VALUES
	('Jose', 'Salazar', 'jose.salazar@ventas.com', '0948693208', 'Quitumbe', 425, 'Legumbres'),
	('Pedro', 'Granja', 'pedro.granja@ventas.com', '0948694509', 'La Luz', 425, 'Legal'),
	('Luis', 'Perez', 'luis.perez@ventas.com', '0998694510', 'El Panecillo', 450, 'Tecnologia'),
	('Jorge', 'Espin', 'jorge.espin@ventas.com', '0998694511', 'Solanda', 425, 'Contabilidad'),
	('Jessica', 'Alvarez', 'jessica.alvarez@ventas.com', '0998694513', 'Tumbaco', 900, 'Contabilidad'),
	('Monica', 'Aguirre', 'monica.aguirre@ventas.com', '0998694514', 'Pomasqui', 600, 'Ventas');

INSERT INTO vendedores(nombre, apellido, telefono, salario, departamento)
VALUES('Maria', 'Fernandez', '0948691234', 425, 'Tecnologia');


-- Insertar registro en tabla pedidos
INSERT INTO pedidos(descripcion, fecha, vendedor_id, cliente_id)
VALUES('pedido 1', '2022-07-14', 2, 2);





-- INSTRUCCIONES DQL (Data Query Language)
SELECT * FROM ventas_clase5_dql.pedidos;

-- Instruccion AS
SELECT id AS codigo_pedido, descripcion, fecha AS fecha_pedido FROM pedidos; -- Cambiar nombre de una fila en la tabla pedidos
SELECT id codigo_pedido, descripcion, fecha fecha_pedido FROM pedidos; -- Cambiar nombre de una fila en la tabla pedidos (sin necesidad de AS)


SELECT * FROM ventas_clase5_dql.clientes;


-- Instruccion DISTINCT
SELECT DISTINCT nacionalidad FROM clientes;


-- Instruccion COUNT
SELECT COUNT(*) FROM clientes;
SELECT COUNT(*) AS numero_registros FROM clientes
WHERE direccion = 'Calderon';


-- Instruccion ORDER BY
SELECT * FROM clientes
ORDER BY id; -- Orden Ascendente por defecto

SELECT * FROM clientes
ORDER BY id DESC; -- Orden Descendente

SELECT nombre, apellido, direccion FROM clientes
ORDER BY nombre, direccion ASC; -- Orden Ascendente por defecto (no hace falta colocar ASC)

SELECT nombre, apellido, direccion FROM clientes
ORDER BY nombre, direccion DESC; -- Orden Descendiente

SELECT nombre, apellido, direccion FROM clientes
ORDER BY 2; -- Orden Ascendente de la segunda columna seleccionada (apellido)

SELECT nombre, apellido, direccion FROM clientes
ORDER BY 2 DESC; -- Orden Descendente de la segunda columna seleccionada (apellido)
