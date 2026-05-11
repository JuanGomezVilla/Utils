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