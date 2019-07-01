select personajes.nombre from 
   (select count(personajes.nombre) contador, personajes.nombre personaje
	from personajes,juegos,partidas,users
	where users.username = "NN"
	and (users.id = partidas.id_jugador1 or users.id = partidas.id_jugador2)
	and juegos.id_partida = partidas.id
	and (personajes.id = juegos.pj1 or personajes.id = juegos.pj2)
    group by (personajes.nombre)
    order by count(personajes.nombre) DESC)
where max(contador)    
    
    
	