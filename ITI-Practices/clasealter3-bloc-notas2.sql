-- Crear base de datos
-- CREATE DATABASE claseAlter3;

-- Seleccionar base de datos
-- USE claseAlter3;

-- CREATE TABLE datos_persona (
	-- id int PRIMARY KEY,
	-- cedula varchar(10) NOT NULL,
    -- nombre varchar(20) NOT NULL,
    -- apellido varchar(30)
-- );

-- Agregar columna direccion despues de columna cedula
-- ALTER TABLE datos_persona
	-- ADD direccion varchar(50) NOT NULL after cedula;

-- Cambiar el nombre y tipo de dato de una columna    
-- ALTER TABLE datos_persona
	-- CHANGE nombre nombres varchar(30);
    
-- Eliminar una columna
-- ALTER TABLE datos_persona
	-- DROP direccion;
    
-- RENAME TABLE datos_persona to persona_datos;

-- CREATE TABLE usuarios (
	-- id int PRIMARY KEY auto_increment,
    -- username varchar(20) NOT NULL,
    -- password varchar(20) NOT NULL,
    -- email varchar(50) NOT NULL
-- )

-- Eliminar tabla usuarios
-- DROP TABLE usuarios

-- Volver a crear tabla usuarios
CREATE TABLE usuarios (
	id int PRIMARY KEY auto_increment,
    username varchar(20) NOT NULL,
    password varchar(20) NOT NULL,
    email varchar(50) NOT NULL
)