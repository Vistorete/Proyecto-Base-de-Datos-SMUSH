--Tabla de partidas

SELECT p1.id_torneo, p1.id, p1.username,p1.score_jugador1,p2.score_jugador2,  p2.username, p1.num_ronda
FROM
    (SELECT partidas.id, partidas.id_torneo, users.username, partidas.id_jugador1, partidas.score_jugador1, partidas.num_ronda
    FROM users, partidas
    WHERE users.id=partidas.id_jugador1) as p1,
    (SELECT partidas.id, partidas.id_torneo, users.username, partidas.id_jugador2, partidas.score_jugador2
    FROM users, partidas
    WHERE users.id=partidas.id_jugador2) as p2
WHERE p1.id=p2.id; --AND p1.num_ronda=2;