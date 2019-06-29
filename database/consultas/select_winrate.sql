--Cambiar id users.id por el de busqueda

SELECT * FROM (
SELECT users.id, users.username , (count(case WHEN partidas.score_jugador1 > partidas.score_jugador2 AND partidas.id_jugador1=users.id THEN 1 END) +
       count(case WHEN partidas.score_jugador1 < partidas.score_jugador2 AND partidas.id_jugador2=users.id THEN 1 END))/
       count(case WHEN partidas.id_jugador1=users.id or partidas.id_jugador2=users.id THEN 1 END) * 100 AS winrate
FROM partidas, users
GROUP BY users.id ORDER BY winrate DESC) AS LEADER_BOARD
WHERE LEADER_BOARD.winrate IS NOT NULL;