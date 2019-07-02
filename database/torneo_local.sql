--  local de la evo
INSERT INTO locales (nombre, direccion, capacidad) values ('Mandalay Bay Resort','3150 Paradise Rd, Las Vegas, NV 89109, EE. UU',5000);
-- reglas
-- torneo
INSERT INTO torneos(id_organizador,nombre,id_local,fecha) values (1001,'EVOLUTION 2019',1,'2019-08-02');
-- partidas

-- Ronda 1
--  Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (1,500,1001,0,3,1);
-- Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (1,175,18,3,2,1);
-- Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (1,2,56,1,3,1);
-- Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (1,15,1002,0,3,1);


-- Ronda 2

-- Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (1,1001,175,3,2,2);
-- Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (1,56,1002,3,2,2);






-- Ronda 1

-- Pool 1

Insert into partidas(id,id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (1,1,1004,512,2,1,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (1,1,02,18,11);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (1,2,02,18,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (1,3,02,18,11);

Insert into partidas(id,id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (2,1,314,1000,2,0,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (2,1,80,61,2);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (2,2,80,01,3);

Insert into partidas(id,id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (3,1,1002,201,1,2,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (3,1,11,71,10);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (3,2,11,71,6);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (3,3,11,71,10);

Insert into partidas(id,id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (4,1,666,77,2,0,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (4,1,85,81,4);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (4,2,85,81,8);



-- Pool 2

Insert into partidas(id,id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (5,1,1005,12,2,1,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (5,1,75,63,3);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (5,2,75,63,8);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (5,3,75,63,3);


Insert into partidas(id,id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (6,1,177,7,2,1,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (6,1,21,20,9);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (6,2,21,20,9);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (6,3,21,20,9);

Insert into partidas(id,id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (7,1,777,1003,1,2,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (7,1,40,47,4);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (7,2,42,47,7);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (7,3,40,47,9);

Insert into partidas(id,id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (8,1,1001,818,2,0,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (8,1,44,08,8);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (8,2,44,08,1);

--  Ronda 2

-- Pool 1
Insert into partidas(id,id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (9,1,1004,314,2,1,2);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (9,1,02,80,6);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (9,2,02,80,2);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (9,3,02,80,1);

Insert into partidas(id,id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (10,1,201,666,0,2,2);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (10,1,74,86,8);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (10,2,74,86,7);
-- Pool 2
Insert into partidas(id,id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (11,1,1005,177,1,2,2);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (11,1,75,18,8);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (11,2,75,15,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (11,3,75,18,7);

Insert into partidas(id,id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (12,1,1003,1001,0,2,2);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (12,1,47,44,10);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (12,2,47,44,7);

-- Ronda 3

-- Pool 1
Insert into partidas(id,id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (13,1,1004,666,0,3,3);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (13,1,12,9,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (13,2,15,4,7);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (13,3,24,75,3);



-- Pool 2
Insert into partidas(id,id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (14,1,177,1001,3,2,3);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (14,1,4,44,6);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (14,2,4,44,2);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (14,3,8,44,6);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (14,4,8,44,7);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (14,5,7,44,5);

-- Ronda 4 grand final
Insert into partidas(id,id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (15,1,666,177,0,3,4);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (15,1,7,74,11);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (15,2,7,74,11);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (15,3,7,6,11);
INSERT INTO resultados(id_torneo, id_user, posicion) values (1,177,1);
INSERT INTO resultados(id_torneo, id_user, posicion) values (1,666,2);
INSERT INTO resultados(id_torneo, id_user, posicion) values (1,1004,3);
INSERT INTO resultados(id_torneo, id_user, posicion) values (1,1001,3);
INSERT INTO resultados(id_torneo, id_user, posicion) values (1,314,5);
INSERT INTO resultados(id_torneo, id_user, posicion) values (1,201,5);
INSERT INTO resultados(id_torneo, id_user, posicion) values (1,1005,5);
INSERT INTO resultados(id_torneo, id_user, posicion) values (1,1003,5);
INSERT INTO resultados(id_torneo, id_user, posicion) values (1,512,9);
INSERT INTO resultados(id_torneo, id_user, posicion) values (1,1000,9);
INSERT INTO resultados(id_torneo, id_user, posicion) values (1,1002,9);
INSERT INTO resultados(id_torneo, id_user, posicion) values (1,77,9);
INSERT INTO resultados(id_torneo, id_user, posicion) values (1,12,9);
INSERT INTO resultados(id_torneo, id_user, posicion) values (1,777,9);
INSERT INTO resultados(id_torneo, id_user, posicion) values (1,818,9);














-- TORNEO 2
INSERT INTO locales (nombre, direccion, capacidad) values ('Elmia exhibition centre','Elmiavägen 15, 554 54 Jönköping, Suecia',20000);
-- torneo
INSERT INTO torneos(id_organizador,nombre,id_local,fecha) values (1004,'DREAM HACK 2019',2,'2019-09-11');

-- Pool 1
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (2,80,1,1,0,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (16,1,63,15,9);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (2,777,23,0,1,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (17,1,15,57,14);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (2,514,69,0,1,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (18,1,50,3,4);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (2,325,5,1,0,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (19,1,19,60,2);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (2,123,177,0,1,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (20,1,59,64,4);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (2,456,12,0,1,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (21,1,71,64,7);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (2,789,11,1,0,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (22,1,40,34,8);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (2,100,13,1,0,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (23,1,62,81,13);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (2,85,420,1,0,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (24,1,13,9,2);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (2,14,194,0,1,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (25,1,74,58,9);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (2,704,2,0,1,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (26,1,26,60,6);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (2,455,81,0,1,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (27,1,76,37,13);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (2,366,84,1,0,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (28,1,22,3,10);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (2,800,32,1,0,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (29,1,15,81,3);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (2,350,27,1,0,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (30,1,9,11,14);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (2,620,351,0,1,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (31,1,61,83,4);


-- Pool 2

Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (2,80,23,1,0,2);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (32,1,19,24,9);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (2,69,325,1,0,2);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (33,1,81,26,1);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (2,177,456,1,0,2);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (34,1,31,44,6);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (2,784,100,0,1,2);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (35,1,70,1,9);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (2,85,194,1,0,2);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (36,1,70,65,8);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (2,2,81,1,0,2);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (37,1,47,73,4);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (2,366,800,0,1,2);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (38,1,2,8,3);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (2,350,351,1,0,2);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (39,1,7,72,11);

-- Pool 3
 
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (2,80,69,0,1,3);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (40,1,64,12,10);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (2,177,100,1,0,3);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (41,1,69,66,1);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (2,85,2,1,0,3);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (42,1,60,86,11);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (2,800,350,1,0,3);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (43,1,34,14,5);

-- Pool 4

Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (2,69,177,0,1,4);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (44,1,74,69,1);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (2,85,800,1,0,4);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (45,1,8,74,9);

-- Pool 5 

Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (2,177,85,1,0,5);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (46,1,69,15,1);


-- TORNEO 3
INSERT INTO torneos(id_organizador,nombre,id_local,fecha) values (180,'ULTIMATE CUP TOURNEY',3,'2020-09-11');
INSERT INTO locales (nombre, direccion, capacidad) values ('N-House','Santiago,Macul,Gabriela Mistral 3025',20);

-- Pool 1
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (4,100,177,0,3,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (47,1,74,69,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (48,2,74,69,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (49,3,74,69,1);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (4,1000,1001,2,1,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (50,1,72,68,12);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (51,2,71,67,13);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (52,3,70,66,2);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (4,1005,1004,1,2,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (53,1,69,65,3);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (54,2,68,64,6);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (55,3,67,63,2);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (4,1003,1002,2,1,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (56,1,76,12,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (57,2,72,13,2);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (58,3,72,14,8);


-- Pool 2

Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (4,177,1000,3,0,2);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (59,1,69,65,3);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (60,2,69,52,6);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (61,3,69,50,2);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (4,1004,1003,2,1,2);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (62,1,33,12,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (63,2,32,13,9);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (64,3,31,14,8);

-- Pool 3

Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (4,177,1004,3,0,3);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (65,1,69,12,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (66,2,69,20,2);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (67,3,20,21,1);


-- TORNEO 4
INSERT INTO locales (nombre, direccion, capacidad) values ('ESTACION MAPOCHO','Chile, Santiago, Presidente Balmaceda 104',2000);
INSERT INTO torneos(id_organizador,nombre,id_local,fecha) values (1001,'ULTIMATE SANTIAGO TOURNAMENT 2021',4,'2021-05-01');

-- Pool 1

Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (5,717,1,1,2,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (68,1,22,12,8);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (69,2,21,20,3);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (70,3,30,41,1);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (5,99,1002,1,2,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (71,1,21,12,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (72,2,39,20,2);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (73,3,20,21,3);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (5,418,177,2,0,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (74,1,29,12,11);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (75,2,49,20,12);

Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (5,57,920,2,1,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (77,1,69,12,5);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (78,2,69,20,4);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (79,3,20,21,2);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (5,7,1004,2,1,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (80,1,28,12,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (81,2,49,20,3);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (82,3,20,21,6);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (5,14,121,2,1,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (83,1,18,12,5);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (84,2,17,20,9);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (85,3,16,21,8);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (5,88,181,1,2,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (86,1,15,12,10);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (87,2,14,20,12);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (88,3,13,21,11);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (5,420,1000,0,2,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (89,1,12,12,12);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (90,2,1,20,12);

Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (5,66,74,0,2,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (92,1,50,12,10);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (93,2,51,20,9);

Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (5,317,89,0,2,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (95,1,54,12,7);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (96,2,55,20,6);

Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (5,101,807,1,2,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (98,1,73,12,7);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (99,2,74,20,2);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (100,3,75,21,1);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (5,357,44,2,1,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (101,1,5,12,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (102,2,6,20,2);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (103,3,7,21,11);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (5,18,98,2,0,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (104,1,8,12,13);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (105,2,9,20,13);

Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (5,547,70,2,1,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (107,1,69,12,12);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (108,2,69,20,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (109,3,20,21,11);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (5,777,666,0,2,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (110,1,25,12,10);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (111,2,29,20,3);

Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (5,376,24,2,0,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (113,1,39,12,5);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (114,2,36,20,2);

-- Pool 2 

Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (5,1,1002,2,1,2);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (115,1,18,73,8);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (116,2,22,72,3);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (117,3,23,71,1);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (5,418,57,2,1,2);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (118,1,24,54,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (119,2,55,53,2);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (120,3,56,52,3);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (5,7,14,2,1,2);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (121,1,57,51,11);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (122,2,41,42,8);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (123,3,42,41,12);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (5,181,1000,0,2,2);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (124,1,43,50,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (125,2,24,40,2);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (5,74,89,2,0,2);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (126,1,41,33,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (127,2,40,30,3);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (5,807,357,2,1,2);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (128,1,29,31,5);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (129,2,28,22,2);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (130,3,27,21,8);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (5,18,547,1,2,2);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (131,1,1,12,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (132,2,2,12,6);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (133,3,3,11,4);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (5,666,376,2,1,2);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (134,1,4,5,8);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (135,2,4,5,3);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (136,3,4,5,1);



-- Pool 3 
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (5,1,418,0,2,3);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (137,1,2,5,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (138,2,3,22,7);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (5,7,1000,0,2,3);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (139,1,33,60,11);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (140,2,34,61,5);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (5,74,807,0,2,3);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (141,1,67,62,2);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (142,2,60,33,4);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (5,666,547,2,1,3);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (144,1,22,12,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (145,2,21,15,2);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (146,3,2,16,7);

-- Pool 4
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (5,418,1000,3,1,4);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (147,1,50,52,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (148,2,60,55,2);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (149,3,70,66,9);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (150,4,72,32,8);
Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (5,807,666,2,3,4);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (151,1,80,15,3);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (152,2,79,12,12);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (153,3,78,1,11);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (154,4,77,2,9);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (155,5,76,11,8);

-- Pool 5 (Final)

Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (5,418,666,1,3,5);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (156,1,12,55,2);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (157,2,1,50,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (158,3,18,11,12);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (159,4,17,67,10);

