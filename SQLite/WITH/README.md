## Uso de WITH

Imagina que una compañía tienes dos tablas donde guarda eventos que suceden a lo largo del tiempo:
- `events`: aquí se guardan eventos que están sucediendo durante el mes actual
- `events_old`: una vez terminado el mes actual, los eventos de la tabla `events` se mueven a esta tabla para no *sobrecargar* la otra si en algún momento se quisieran hacer consultas del mes actual y por ende, no es necesario recurrir a eventos antiguos que son innecesarios y ralentizan la consulta.

Por tanto, si fusionamos las tablas tendremos una lista de **todos los eventos**:
```sql
SELECT id, name, createAt FROM events
UNION ALL
SELECT id, name, createAt FROM events_old;
```

En ocasiones, la compañía quiere generar informes. Por tanto, es necesario crear una consulta que a su vez, realiza subconsultas, generando así un informe con la siguiente estructura:
```
╭────────────────────────┬──────────╮
│      descripcion       │ cantidad │
╞════════════════════════╪══════════╡
│ Nº de eventos en total │       25 │
│ Nº de eventos únicos   │       20 │
╰────────────────────────┴──────────╯
```
> El nº de eventos en total conlleva consultar en las dos tablas, y para eventos únicos lo mismo.

Por intuición, la consulta que genera el informe se puede suponer que será algo como esto:
```sql
    SELECT 'Nº de eventos en total' AS descripcion,
    COUNT(id) AS cantidad
    FROM <unión de tablas>
UNION ALL
    SELECT 'Nº de eventos únicos' AS descripcion,
    COUNT(DISTINCT name) AS cantidad
    FROM <unión de tablas>;
```

Es decir, dado que hay dos filas, en cada consulta hago una unión de ambas tablas y realizo el conteo. Sin embargo, esa operación repetida (unir dos veces esas tablas) puede afectar al rendimiento si hay muchos registros.

La recomendación será generar una única consulta antes de unir las dos filas de cantidades para que el cálculo se haga sobre esa consulta, esto es:
```sql
--- 1. Fusiono "events" y "events_old" y lo guardo en una variable "all_events"
... AS all_events

--- 2. Calculo las cantidades a partir de la tabla con los eventos fusionados
SELECT ... FROM all_events
UNION ALL
SELECT ... FROM all_events;
```
> Aquí no pasa nada por utilizar `ALL` en el `UNION` porque definimos nosotros los campos y no habrá filas repetidas

Pero ¿cómo puedo hacer la fusión de ambas tablas y guardarla en `all_events` para que luego se reutilice? Por medio del comando `WITH`:
```sql
WITH all_events AS (...)
```
> Importante: `WITH` no crea realmente una tabla, de hecho, al terminar la consulta final, si en otro momento intentas seleccionar todo de esa tabla (`SELECT * FROM all_events`) verás que no existe.

La fusión de ambas tablas la tenemos al principio del documento:
```sql
SELECT id, name, createAt FROM events
UNION ALL
SELECT id, name, createAt FROM events_old;
```

Esta fusión guarda un problema: dado que se mueven registros de un sitio a otro, puede existir el riesgo que durante la transacción algún evento se copie a la tabla destino pero no se borre de la emisora, así que estaría repetido en las dos tablas. Entonces, utilizamos `UNION` a secas para evitar registros repetidos:
```sql
SELECT id, name, createAt FROM events
UNION -- Elimina el ALL de aquí
SELECT id, name, createAt FROM events_old;
```

Esa unión se pega dentro de los paréntesis del `WITH`, de modo que ahora la palabra `all_events` guarda una fusión de tablas, y que funciona como una sola durante la ejecución de la secuencia:
```sql
WITH all_events AS (
    SELECT id, name, createAt FROM events
    UNION
    SELECT id, name, createAt FROM events_old
)
```
> Recuerda eliminar el punto y coma al final de `events_old`

La estructura del informe era:
```sql
    SELECT 'Nº de eventos en total' AS descripcion,
    COUNT(id) AS cantidad
    FROM <unión de tablas> -- Sustitúyelo por all_events
UNION ALL
    SELECT 'Nº de eventos únicos' AS descripcion,
    COUNT(DISTINCT name) AS cantidad
    FROM <unión de tablas>; -- Sustitúyelo por all_events
```

El resultado final es:
```sql
-- 1. Una sola tabla con las dos fusionadas
WITH all_events AS (
    SELECT id, name, createAt FROM events
    UNION
    SELECT id, name, createAt FROM events_old
)
    -- 2. Calcular eventos en total
    SELECT 'Nº de eventos en total' AS descripcion,
    COUNT(id) AS cantidad
    FROM all_events -- Se llama a "all_events"

-- 3. El registro anterior se combina con el siguiente
UNION ALL

    -- 4. Calcular eventos distintos
    SELECT 'Nº de eventos únicos' AS descripcion,
    COUNT(DISTINCT name) AS cantidad
    FROM all_events; -- Date cuenta que utiliza ; porque es el último comando
```