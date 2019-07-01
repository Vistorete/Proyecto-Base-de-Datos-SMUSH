select users.fullname, resultados.posicion
	from users,resultados
	 where users.id = resultados.id_user 
    and (resultados.posicion = 1 
    or resultados.posicion = 2 or resultados.posicion = 3)
    order by resultados.posicion
    