# FutbolWebApp

Aplicación web **DataFlex (estilo Mobile/Touch)** sobre una base de datos **MySQL** de fútbol: ligas, equipos, entrenadores, jugadores y posiciones.

Proyecto de prácticas — Data Control · Pablo Arrazola Trebol

## Tecnologías

- DataFlex 2026 (Studio + WebApp Server sobre IIS)
- MySQL 8 (base de datos `futbol`) mediante conexión gestionada ODBC
- Git + GitHub con gitflow

## Estructura

| Carpeta | Contenido |
| --- | --- |
| `Database/` | `futbol.sql`: crea la base de datos `futbol` con sus tablas y datos |
| `DDSrc/` | Data Dictionaries: reglas de negocio de cada tabla |
| `AppSrc/` | Vistas web: `Dashboard.wo` y una Select y una Zoom por tabla |
| `AppHtml/CssStyle/` | `application.css`: estilos propios de la aplicación |
| `Docs/` | Memorias de entrega de cada sprint (PDF) |

## Modelo de datos

| Tabla | Relación |
| --- | --- |
| `liga` | Padre de `equipo` |
| `equipo` | Hijo de `liga`; padre de `jugador` y `entrenador` |
| `entrenador` | Hijo de `equipo` (uno por equipo) |
| `jugador` | Hijo de `equipo` |
| `posicion` | Catálogo de posiciones |
| `jugadorposicion` | Relación N:M entre `jugador` y `posicion` |

## Sprints

| Sprint | Etiqueta | Contenido |
| --- | --- | --- |
| 1 · Vistas | `v1.0-sprint1` | BD en MySQL, workspace, tablas migradas, vistas Select/Zoom de las 5 tablas y tarjetas en el Dashboard |
| 2 · Navegación | `v2.0-sprint2` | FromMain (Select → Zoom), FromChild (Zoom hijo → Select padre), FromParent (botón «Ver equipos» y lista de equipos dentro de ZoomLiga) y Undefined (asignar posición a un jugador) |
| 3 · Data Dictionary y mejora visual | `v3.0-sprint3` | Reglas de negocio en los DD y nuevo aspecto de la aplicación |

## Reglas de negocio (Data Dictionaries)

- Nombre obligatorio en todas las tablas; apellido obligatorio en jugador y entrenador.
- `Liga.Equipos` se mantiene solo: sube al crear un equipo y baja al borrarlo o cambiarlo de liga (`Update` / `Backout` en `cEquipoDataDictionary`).
- Una liga no admite más equipos que `Liga.EquiposMax` (`Validate_Save`); el máximo va de 2 a 24 y por defecto es 20.
- No se puede borrar una liga con equipos, un equipo con jugadores o entrenador, ni una posición asignada.
- Al borrar un jugador se borran sus posiciones asignadas.

## Mejora visual

- Tarjetas del Dashboard con un color por tabla, icono, sombra y efecto al pasar el ratón; toda la tarjeta es pulsable.
- Columnas numéricas alineadas a la derecha y columnas secundarias en gris.
- Asterisco en los campos obligatorios e iconos en los botones «Ver equipos» y «Asignar posición».

## Puesta en marcha

1. Ejecutar `Database/futbol.sql` en MySQL.
2. Abrir el workspace `FutbolWebApp.sws` en DataFlex Studio.
3. Ajustar la conexión gestionada (servidor, usuario y contraseña de MySQL).
4. Compilar y ejecutar con F5.

## Ramas (gitflow)

- `master`: versión entregada, con una etiqueta por sprint
- `develop`: integración
- `feature/*`: una rama por funcionalidad, integrada en `develop` con `merge --no-ff`
