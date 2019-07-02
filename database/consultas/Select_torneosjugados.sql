select torneos.nombre
from torneos
where torneos.id=(select a.id_torneo from(select partidas.id_torneo from partidas where (partidas.id_jugador1="177" or partidas.id_jugador2="177"))as a)