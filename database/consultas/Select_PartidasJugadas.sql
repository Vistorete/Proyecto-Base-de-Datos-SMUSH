    select count(partidas.id)
	from partidas, users
	where users.fullname = "Victor Sanchez"
	and users.id = partidas.id_jugador1
or users.id = partidas.id_jugador2