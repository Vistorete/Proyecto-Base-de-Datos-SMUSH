select torneos.nombre
	from torneos
	where torneos.fecha > SYSDATE()
	order by torneos.fecha