select users.fullname, users.username
from users, equipos
where equipos.id=users.id_equipo
and equipos.nombre="Alpha"