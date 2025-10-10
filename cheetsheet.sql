--Comandos MySQL

-- Conectar a MySQL
mysql -u root -p;

--Ver todas las bases de datos
SHOW DATABASES;

-- Seleccionar una base de datos
USE nombre_base_datos;

-- Ver todas las tablas en la base de datos
SHOW TABLES;

-- Ver la estructura de una tabla

DESCRIBE nombre_tabla;

-- Otra forma de ver columnas
SHOW COLUMNS FROM nombre_tabla;

-- Ver todos los registros
SELECT * FROM nombre_tabla;

-- Ver solo las primera filas
SELECT * FROM nombre_tabla LIMIT 5;

-- Crear una nueva base de datos
CREATE DATABASE nombre_base;

-- Eliminar una base de datos
DROP DATABASE nombre_base;

-- Crear un usuario
CREATE USER 'usuario'@'localhost' IDENTIFIED BY 'contraseña';

-- Dar permisos a un usuario
GRANT ALL PRIVILEGES ON nombre_base * TO 'usuario'@'localhost';

-- Actalizar priviegios
FLUSH PRIVILEGES;

-- Salir de MySQL
exit;