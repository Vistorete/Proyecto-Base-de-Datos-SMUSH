--local de la evo
INSERT INTO locales (nombre, direccion, capacidad) values ('Mandalay Bay Resort','3150 Paradise Rd, Las Vegas, NV 89109, EE. UU',5000);
--reglas
INSERT INTO reglas (id, num_jugadores, tipo_partida, minutos) values ('1s8',1, 'STOCK', 8);
--torneo
INSERT INTO torneos(id_reglas,id_organizador,nombre,id_local,fecha) values ('1s8',1001,'EVOLUTION 2019',1,'2019-08-02');
--partidas

-- Ronda 1
--Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (1,500,1001,0,3,1);
--Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (1,175,18,3,2,1);
--Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (1,2,56,1,3,1);
--Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (1,15,1002,0,3,1);


-- Ronda 2

--Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (1,1001,175,3,2,2);
--Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (1,56,1002,3,2,2);






--Ronda 1

--Pool 1

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

--Ronda 2

--Pool 1
Insert into partidas(id,id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (9,1,1004,314,2,1,2);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (9,1,02,80,6);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (9,2,02,80,2);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (9,3,02,80,1);

Insert into partidas(id,id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (10,1,201,666,0,2,2);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (10,1,74,86,8);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (10,2,74,86,7);
--Pool 2
Insert into partidas(id,id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (11,1,1005,177,1,2,2);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (11,1,75,18,8);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (11,2,75,15,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (11,3,75,18,7);

Insert into partidas(id,id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (12,1,1003,1001,0,2,2);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (12,1,47,44,10);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (12,2,47,44,7);

--Ronda 3

--Pool 1
Insert into partidas(id,id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (13,1,1004,666,0,3,3);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (13,1,12,9,1);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (13,2,15,4,7);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (13,3,24,75,3);



--Pool 2
Insert into partidas(id,id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (14,1,177,1001,3,2,3);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (14,1,4,44,6);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (14,2,4,44,2);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (14,3,8,44,6);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (14,4,8,44,7);
INSERT INTO juegos (id_partida,num_match,pj1,pj2,mapa) values (14,5,7,44,5);

--Ronda 4 grand final
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














--TORNEO 2
INSERT INTO locales (nombre, direccion, capacidad) values ('Elmia exhibition centre','Elmiavägen 15, 554 54 Jönköping, Suecia',20000);
--torneo
INSERT INTO torneos(id_reglas,id_organizador,nombre,id_local,fecha) values ('1s8',1004,'DREAM HACK 2019',2,'2019-09-11');

--Pool 1
--Insert into partidas(id_torneo,id_jugador1,id_jugador2,score_jugador1,score_jugador2,num_ronda) values (2,1001,989,1,2,1);