SELECT torneos.id, users.username, torneos.nombre, torneos.fecha, locales.direccion
FROM users, torneos, locales
WHERE users.id=torneos.id_organizador
and locales.id=torneos.id_local;