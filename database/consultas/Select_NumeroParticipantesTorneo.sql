select count(resultados.id_user)
from resultados,torneos
where torneos.nombre="DREAM HACK 2019"
and torneos.id=resultados.id_torneo	