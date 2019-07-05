SELECT * FROM resultados WHERE resultados.id_torneo=1 order by resultados.id_users;
SELECT * FROM resultados WHERE resultados.id_torneo=1 order by resultados.posicion;
SELECT partidas.num_ronda AS rondas FROM partidas WHERE partidas.id_torneo = 1 GROUP BY partidas.num_ronda ORDER BY partidas.num_ronda;

SELECT users.id, users.username FROM resultados,users WHERE resultados.id_torneo= 1 and users.id=resultados.id_user;








--partidas que ha perdido
SELECT perdidas.id, perdidas.id_torneo, perdidas.perdedor, perdidas.num_ronda, users.username FROM (SELECT partidas.id, partidas.id_torneo,partidas.num_ronda, IF(partidas.score_jugador1 < partidas.score_jugador2, partidas.id_jugador1,partidas.id_jugador2) as perdedor  FROM partidas) AS perdidas, users WHERE perdidas.id_torneo = 1 and users.id = perdidas.perdedor; 
WHERE (partidas.id_jugador1 =1001 and partidas.score_jugador1<partidas.score_jugador2) or (partidas.id_jugador2 =1001 and partidas.score_jugador1>partidas.score_jugador2);
--###################################################################

SELECT maximo.id_torneo, IF(partidas.score_jugador1>partidas.score_jugador2,partidas.id_jugador1,partidas.id_jugador2) as ganador, 1 AS pos FROM partidas, (SELECT MAX(partidas.num_ronda) AS rondas, partidas.id_torneo FROM partidas WHERE partidas.id_torneo = 5) maximo WHERE partidas.id_torneo = maximo.id_torneo and maximo.rondas = partidas.num_ronda;
--#########################
(POWER(2,(maximo.rondas - res.num_ronda)) + 1) AS pos,res.id_jugador1,res.id_jugador2
SELECT * FROM



partidas.id, partidas.id_torneo, IF(partidas.score_jugador1 < partidas.score_jugador2, "1","2")




--Resultdados individuales
SELECT res.id_torneo, res.perdedor as id_user ,(POWER(2,(maximo.rondas - res.num_ronda)) + 1) AS pos FROM (SELECT MAX(partidas.num_ronda) AS rondas FROM partidas WHERE partidas.id_torneo = 1) as maximo, (SELECT partidas.id, partidas.id_torneo,partidas.num_ronda, IF(partidas.score_jugador1 < partidas.score_jugador2, partidas.id_jugador1,partidas.id_jugador2) as perdedor FROM partidas WHERE (partidas.id_jugador1 =1001 and partidas.score_jugador1<partidas.score_jugador2) or (partidas.id_jugador2 =1001 and partidas.score_jugador1>partidas.score_jugador2)) as res;
--Resultados grupales




(POWER(2,(maximo.rondas - res.num_ronda)) + 1)


--se actualizan todos menos la posicion 1
INSERT INTO resultados SET 
SELECT * FROM (SELECT partidas.id_torneo, MAX(partidas.num_ronda) AS rondas FROM partidas GROUP BY partidas.id_torneo) as maximo, (SELECT partidas.id, partidas.id_torneo,partidas.num_ronda, IF(partidas.score_jugador1 < partidas.score_jugador2, partidas.id_jugador1,partidas.id_jugador2) as perdedor FROM partidas) as res WHERE res.id_torneo = maximo.id_torneo and res.id_torneo = 5;

--acutualizacion lugar 1 forma unga
res.id_torneo, res.perdedor AS id_user  , 0 AS posicion

SELECT resultados.id_torneo, resultados.id_user, 1 AS posicion FROM resultados WHERE resultados.posicion = 1 AND resultados.id_torneo = 1;


UPDATE resultados SET (id_torneo, id_user, posicion) = (SELECT res.id_torneo, res.perdedor , 0 FROM (SELECT partidas.id_torneo, MAX(partidas.num_ronda) AS rondas FROM partidas GROUP BY partidas.id_torneo) as maximo, (SELECT partidas.id, partidas.id_torneo,partidas.num_ronda, IF(partidas.score_jugador1 < partidas.score_jugador2, partidas.id_jugador1,partidas.id_jugador2) as perdedor FROM partidas) as res WHERE res.id_torneo = maximo.id_torneo and res.id_torneo = 5)



SELECT actualizar.id_torneo, actualizar.perdedor FROM (SELECT res.id_torneo, res.perdedor, (POWER(2,(maximo.rondas - res.num_ronda)) + 1) as pos FROM (SELECT partidas.id_torneo AS id_torneo1, MAX(partidas.num_ronda) AS rondas FROM partidas GROUP BY partidas.id_torneo) as maximo, (SELECT partidas.id, partidas.id_torneo,partidas.num_ronda, IF(partidas.score_jugador1 < partidas.score_jugador2, partidas.id_jugador1,partidas.id_jugador2) as perdedor FROM partidas) as res WHERE res.id_torneo = maximo.id_torneo1) AS actualizar;













----------------------------------------------------------------------




--ACTUALIZA RESULTADOS DE LOS INSCRITOS  cambiar 5 por ? 


UPDATE    resultados,(SELECT res.id_torneo, res.perdedor, (POWER(2,(maximo.rondas - res.num_ronda)) + 1) as pos FROM (SELECT partidas.id_torneo AS id_torneo1, MAX(partidas.num_ronda) AS rondas FROM partidas GROUP BY partidas.id_torneo) as maximo, (SELECT partidas.id, partidas.id_torneo,partidas.num_ronda, IF(partidas.score_jugador1 < partidas.score_jugador2, partidas.id_jugador1,partidas.id_jugador2) as perdedor FROM partidas) as res WHERE res.id_torneo = maximo.id_torneo1) AS actualizar
SET       resultados.posicion = actualizar.pos
WHERE     resultados.id_torneo = actualizar.id_torneo
AND       resultados.id_user = actualizar.perdedor;

UPDATE    resultados,(SELECT maximo.id_torneo, IF(partidas.score_jugador1>partidas.score_jugador2,partidas.id_jugador1,partidas.id_jugador2) as ganador, 1 AS pos FROM partidas, (SELECT MAX(partidas.num_ronda) AS rondas, partidas.id_torneo FROM partidas WHERE partidas.id_torneo = 5) maximo WHERE partidas.id_torneo = maximo.id_torneo and maximo.rondas = partidas.num_ronda) AS actualizar
SET       resultados.posicion = actualizar.pos
WHERE     resultados.id_torneo = actualizar.id_torneo
AND       resultados.id_user = actualizar.ganador;


--INSERTA LA TABLA DE RESULTADOS A PARTIR DE PARTIDAS QUE SE JUEGAN -- cambiar 5 por ?

INSERT INTO resultados SELECT res.id_torneo, res.perdedor, (POWER(2,(maximo.rondas - res.num_ronda)) + 1) as pos FROM (SELECT partidas.id_torneo AS id_torneo1, MAX(partidas.num_ronda) AS rondas FROM partidas GROUP BY partidas.id_torneo) as maximo, (SELECT partidas.id, partidas.id_torneo,partidas.num_ronda, IF(partidas.score_jugador1 < partidas.score_jugador2, partidas.id_jugador1,partidas.id_jugador2) as perdedor FROM partidas) as res WHERE res.id_torneo = maximo.id_torneo1 and res.id_torneo = 5;

INSERT INTO resultados SELECT maximo.id_torneo, IF(partidas.score_jugador1>partidas.score_jugador2,partidas.id_jugador1,partidas.id_jugador2) as ganador, 1 AS pos FROM partidas, (SELECT MAX(partidas.num_ronda) AS rondas, partidas.id_torneo FROM partidas WHERE partidas.id_torneo = 5) maximo WHERE partidas.id_torneo = maximo.id_torneo and maximo.rondas = partidas.num_ronda;
