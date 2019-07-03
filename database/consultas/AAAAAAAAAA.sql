SELECT * FROM resultados WHERE resultados.id_torneo=1 order by resultados.id_users;
SELECT * FROM resultados WHERE resultados.id_torneo=1 order by resultados.posicion;
SELECT MAX(partidas.num_ronda) AS rondas FROM partidas WHERE partidas.id_torneo = 1 ;