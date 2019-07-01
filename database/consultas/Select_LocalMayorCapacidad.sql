select locales.nombre, locales.capacidad
from locales
where locales.capacidad=(select max(locales.capacidad) from locales)