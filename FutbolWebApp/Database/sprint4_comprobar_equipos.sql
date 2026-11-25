-- =====================================================================
-- FutbolWebApp - Actualización Sprint 4 - Contador de equipos por liga
-- liga.Equipos (Num_Equipos) lo mantiene el DD de Equipo. Este script
-- sirve para comprobarlo y, si alguna vez se descuadra (por ejemplo,
-- por cambios hechos directamente en MySQL), recalcularlo.
-- =====================================================================
USE futbol;

-- 1. Comprobación: Equipos (guardado) frente a los equipos reales
SELECT l.ID, l.Nombre, l.Equipos AS Guardado, COUNT(e.ID) AS Reales,
       IF(l.Equipos = COUNT(e.ID), 'OK', 'DESCUADRADO') AS Estado
FROM liga l
LEFT JOIN equipo e ON e.LigaID = l.ID
GROUP BY l.ID, l.Nombre, l.Equipos
ORDER BY l.ID;

-- 2. Recalcular (solo si la comprobación da DESCUADRADO)
-- UPDATE liga l
-- SET l.Equipos = (SELECT COUNT(*) FROM equipo e WHERE e.LigaID = l.ID);
