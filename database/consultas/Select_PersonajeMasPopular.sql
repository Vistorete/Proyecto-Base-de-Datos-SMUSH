select a.nombre 
from ((select count(*) n , personajes.nombre
	  from personajes,juegos,partidas,users
	  where (users.id = partidas.id_jugador1 or users.id = partidas.id_jugador2)
	  and juegos.id_partida = partidas.id
	  and (personajes.id = juegos.pj1 or personajes.id = juegos.pj2)
      group by (personajes.nombre))as a)  
where a.n = (select max(a.n) from ((select count(*) n , personajes.nombre
	  from personajes,juegos,partidas,users
	  where (users.id = partidas.id_jugador1 or users.id = partidas.id_jugador2)
	  and juegos.id_partida = partidas.id
	  and (personajes.id = juegos.pj1 or personajes.id = juegos.pj2)
      group by (personajes.nombre))as a)) 
	
	
    
select users.fullname, count(partidas.id) from partidas,users where (users.id=partidas.id_jugador1 or users.id=partidas.id_jugador2) ;