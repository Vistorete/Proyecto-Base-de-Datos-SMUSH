--Popularidad de personaje
SELECT personajes.nombre, count(case WHEN juegos.pj1=personajes.id THEN 1 END) + count(case WHEN juegos.pj2=personajes.id THEN 1 END) as total from personajes, juegos GROUP BY personajes.id ORDER BY total DESC;

select a.nombre 
from ((select count(*) n , personajes.nombre
	  from personajes,juegos,partidas,users
	  where users.id = ?
	  and (users.id = partidas.id_jugador1 or users.id = partidas.id_jugador2)
	  and juegos.id_partida = partidas.id
	  and (personajes.id = juegos.pj1 or personajes.id = juegos.pj2)
      group by (personajes.nombre))as a)  
where a.n = (select max(a.n) from ((select count(*) n , personajes.nombre
	  from personajes,juegos,partidas,users
	  where users.id = ?
	  and (users.id = partidas.id_jugador1 or users.id = partidas.id_jugador2)
	  and juegos.id_partida = partidas.id
	  and (personajes.id = juegos.pj1 or personajes.id = juegos.pj2)
      group by (personajes.nombre))as a))