DROP DATABASE database_smush;
CREATE DATABASE database_smush;
USE database_smush;

-- equipos
CREATE TABLE equipos(
  id INT(11) NOT NULL AUTO_INCREMENT, PRIMARY KEY (id),
  nombre VARCHAR(16) NOT NULL,
  tag VARCHAR(4) NOT NUll
);

-- usuarios

CREATE TABLE users(
  id INT(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (id),
  id_equipo INT(11),
  username VARCHAR(20) NOT NULL,
  fullname VARCHAR(100) NOT NULL,
  edad INT(2) NOT NULL,
  pais VARCHAR(32) NOT NULL
);




-- informacion de partida

CREATE TABLE partidas(
  id INT(11) NOT NULL AUTO_INCREMENT, PRIMARY KEY (id),
  id_torneo INT(11) NOT NULL,
  id_jugador1 INT(11) NOT NULL,
  id_jugador2 INT(11) Not NULL,
  score_jugador1 INT(1) NOT NULL,
  score_jugador2 INT(1) NOT NULL,
  num_ronda INT(2) NOT NULL
);

-- Locales
CREATE TABLE locales(
  id INT(11) NOT NULL AUTO_INCREMENT,   PRIMARY KEY (id),
  nombre VARCHAR(64) NOT NULL,
  direccion VARCHAR(64) NOT NULL,
  capacidad INT(5) NOT NULL

);
-- Reglas del torneo

CREATE TABLE reglas(
  id VARCHAR(4) NOT NULL,
  PRIMARY KEY (id),
  num_jugadores INT(1) NOT NULL,
  tipo_partida VARCHAR(16) NOT NUll,
  minutos INT(2) NOT NULL
);

-- informacion del torneo
CREATE TABLE torneos(
  id INT(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (id),
  id_reglas INT(11) NOT NULL,
  id_organizador INT(11) NOT NULL,
  nombre VARCHAR(25) NOT NULL,
  id_local INT(11),
  fecha DATE NOT NULL
);


-- Resultados de usuarios

CREATE TABLE resultados(
  id_torneo INT(11) NOT NULL,
  id_user INT(11) NOT NULL,     PRIMARY KEY (id_torneo,id_user),
  posicion INT(4) NOT NULL
);

--Personajes

CREATE TABLE personajes(
  id INT(3) NOT NULL, PRIMARY KEY(id),
  nombre VARCHAR(16) NOT NULL
);


-- Mapas
CREATE TABLE mapas(
  id INT(2) NOT NULL, PRIMARY KEY (id),
  nombre VARCHAR(32) NOT NULL
);

--Match

CREATE TABLE juegos(
  id_partida INT(11) NOT NULL,
  num_match INT(2) NOT NULL,
  PRIMARY KEY (id_partida,num_match),
  pj1 INT(3) NOT NULL,
  pj2 INT(3) NOT NULL,
  mapa INT(2) NOT NULL
);






-- Mostrar tablas

DESCRIBE users;
DESCRIBE partidas;
DESCRIBE torneos;
DESCRIBE resultados;
DESCRIBE reglas;
DESCRIBE locales;
DESCRIBE equipos;
DESCRIBE Personajes;
DESCRIBE mapas;
DESCRIBE juegos;
