-- ESPACIO OCUPADO POR LOS DIFERENTES SEGMENTOS (TABLAS, ÍNDICES, UNDO, ROLLBACK, CLUSTER, …)
SELECT
  SEGMENT_TYPE, SUM(BYTES)/1024/1024 
FROM DBA_EXTENTS MB
GROUP BY SEGMENT_TYPE;