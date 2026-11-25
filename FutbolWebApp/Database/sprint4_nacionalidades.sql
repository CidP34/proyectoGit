-- =====================================================================
-- FutbolWebApp - Sprint 4 - Tablas de validación (CodeType / CodeMast)
-- Nacionalidades que tienen actualmente jugadores y entrenadores (19).
-- Ejecutar en MySQL sobre la base de datos futbol, con las tablas
-- del framework ya migradas a MySQL (Sprint 1).
-- =====================================================================
USE futbol;

-- CodeMast.Code mide 10 caracteres y 'Mozambiqueño' tiene 12.
-- Se amplía a 20. (También se puede hacer desde el Table Editor del
-- Studio, que además actualiza el .int de la tabla.)
ALTER TABLE codemast MODIFY COLUMN Code VARCHAR(20) NOT NULL DEFAULT '';

-- Tipo de código
INSERT INTO codetype (Type, Description, Comment)
VALUES ('NACIONAL', 'Nacionalidades', 'Nacionalidad de jugadores y entrenadores');

-- Valores: el código es la propia nacionalidad, así coinciden con los
-- datos que ya hay en jugador.Nacionalidad y entrenador.Nacionalidad
INSERT INTO codemast (Type, Code, Description) VALUES
  ('NACIONAL', 'Alemán', 'Alemán'),
  ('NACIONAL', 'Argentino', 'Argentino'),
  ('NACIONAL', 'Belga', 'Belga'),
  ('NACIONAL', 'Brasileño', 'Brasileño'),
  ('NACIONAL', 'Colombiano', 'Colombiano'),
  ('NACIONAL', 'Egipcio', 'Egipcio'),
  ('NACIONAL', 'Escocés', 'Escocés'),
  ('NACIONAL', 'Esloveno', 'Esloveno'),
  ('NACIONAL', 'Español', 'Español'),
  ('NACIONAL', 'Francés', 'Francés'),
  ('NACIONAL', 'Húngaro', 'Húngaro'),
  ('NACIONAL', 'Inglés', 'Inglés'),
  ('NACIONAL', 'Italiano', 'Italiano'),
  ('NACIONAL', 'Mozambiqueño', 'Mozambiqueño'),
  ('NACIONAL', 'Neerlandés', 'Neerlandés'),
  ('NACIONAL', 'Noruego', 'Noruego'),
  ('NACIONAL', 'Polaco', 'Polaco'),
  ('NACIONAL', 'Portugués', 'Portugués'),
  ('NACIONAL', 'Uruguayo', 'Uruguayo');

-- Comprobación: ninguna nacionalidad de la BD debe quedar fuera de la lista
SELECT DISTINCT Nacionalidad FROM jugador
WHERE Nacionalidad IS NOT NULL
  AND Nacionalidad NOT IN (SELECT Code FROM codemast WHERE Type = 'NACIONAL')
UNION
SELECT DISTINCT Nacionalidad FROM entrenador
WHERE Nacionalidad IS NOT NULL
  AND Nacionalidad NOT IN (SELECT Code FROM codemast WHERE Type = 'NACIONAL');
