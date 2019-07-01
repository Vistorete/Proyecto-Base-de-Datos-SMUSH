select equipos.tag
	from equipos,users,resultados
	where resultados.posicion = 1
	and resultados.id_user = users.id
	and equipos.id = users.id_equipo