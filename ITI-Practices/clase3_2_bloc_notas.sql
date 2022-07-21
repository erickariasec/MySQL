-- Crear base de datos
CREATE DATABASE clase3_2_bloc_notas;

-- Seleccionar base de datos
USE clase3_2_bloc_notas;

CREATE TABLE persona (
	id int PRIMARY KEY,
    cedula varchar(10) NOT NULL,
    nombre varchar(20) NOT NULL,
    apellido varchar(30)
)