select users.fullname
	from users,torneos
	where torneos.nombre="DREAM HACK 2019"
	and torneos.id_organizador=users.id