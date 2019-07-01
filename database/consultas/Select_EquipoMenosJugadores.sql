select equipos.nombre
from equipos
where equipos.id = (select E.id_equipo  
					from (select users.id_equipo , count(users.id) C 
						  from users group by users.id_equipo) as E
					where E.C= (select min(f.contador) 
								 from (select users.id_equipo , count(users.id) contador 
									   from users group by users.id_equipo)as f))