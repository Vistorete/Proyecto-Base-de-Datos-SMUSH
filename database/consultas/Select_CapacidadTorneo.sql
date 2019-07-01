select locales.capacidad
	from locales,torneos
	where torneos.nombre = "DREAM HACK 2019"
	and torneos.id_local = locales.id