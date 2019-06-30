--Base de prueba

--Crea una base de datos
CREATE DATABASE database_links; 

--Sirve para comenzar a usar la base
USE database_links; 

--Tabla de usuarios
CREATE TABLE users(
    id INT(11) NOT NULL,
    username VARCHAR(16) NOT NULL,
    password VARCHAR(60) NOT NULL,
    fullname VARCHAR(100) NOT NULL 
);

--Modifica la tabla usuarios para identificar la llave primaria
ALTER TABLE users 
    ADD PRIMARY KEY (id);

--Modifica la tabla usuarios para que se auto incremente
ALTER TABLE users 
    MODIFY id INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT = 2;
    
DESCRIBE users;        

--Tabla de enlaces 
CREATE TABLE links(
    id INT(11) NOT NULL,
    title VARCHAR(150) NOT NULL,
    url VARCHAR(255) NOT NULL,
    description TEXT,
    user_id INT(11), 
    created_at timestamp NOT NULL DEFAULT current_timestamp, 
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id) 
);

--Define la llave primaria
ALTER TABLE links 
    ADD PRIMARY KEY (id);

--Modifica la tabla usuarios para que se auto incremente
ALTER TABLE links 
    MODIFY id INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT = 2;    

DESCRIBE links;    
