--Popularidad de personaje
SELECT personajes.nombre,
count(case WHEN juegos.pj1=personajes.id THEN 1 END) + count(case WHEN juegos.pj2=personajes.id THEN 1 END) as total
from personajes, juegos
GROUP BY personajes.id
ORDER BY total DESC;

