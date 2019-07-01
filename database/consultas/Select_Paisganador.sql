select users.pais
	from users,resultados
	where resultados.posicion = 1
	and users.id = resultados.id_user