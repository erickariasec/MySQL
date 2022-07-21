-- Script para crear base de datos de la tarea 3

-- Crear Base de Datos
CREATE DATABASE erick_arias_base_datos;

-- Seleccionar Base de Datos
USE erick_arias_base_datos;

-- Crear tabla clientes
CREATE TABLE libro (
	id_libro INT PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(45) NOT NULL,
	fecha_publicacion DATE NOT NULL
);


-- Crear tabla autor
CREATE TABLE autor (
	id_autor INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(45) NOT NULL,
	fecha_nacimiento DATE NOT NULL,
	email VARCHAR(45) NOT NULL,
	celular VARCHAR(45) NOT NULL,
	direccion VARCHAR(45) NOT NULL
);


-- Crear tabla de relacion autores_libro
CREATE TABLE autores_libro (
	id_libro INT NOT NULL,
	id_autor INT NOT NULL
);
