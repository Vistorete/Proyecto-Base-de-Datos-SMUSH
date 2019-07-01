select max(partidas.num_ronda)
	from partidas,torneos
	where torneos.nombre = "EVOLUTION 2019" 
	and partidas.id_torneo = torneos.id