-- Script para crear base de datos de ventas

-- Crear Base de Datos
CREATE DATABASE ventas;

-- Seleccionar Base de Datos
USE ventas;

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