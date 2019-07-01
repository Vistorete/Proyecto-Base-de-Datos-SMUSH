select a.nombre
from ((select count(*) n , mapas.nombre
	  from mapas,juegos,partidas,users
	  where juegos.id_partida = partidas.id
	  and (mapas.id = juegos.mapa)
      group by (mapas.nombre))as a)  
where a.n = (select max(a.n) from ((select count(*) n , mapas.nombre
	  from mapas,juegos,partidas,users
	  where juegos.id_partida = partidas.id
	  and (mapas.id = juegos.mapa)
      group by (mapas.nombre))as a)) 
	
	
    
	