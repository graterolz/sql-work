--TABLAS CON MÁS DE UN NÚMERO DETERMINADO DE ÍNDICES
SELECT
       TABLE_NAME,
       COUNT(*) 
FROM ALL_INDEXES
WHERE OWNER='SIEBEL'
GROUP BY TABLE_NAME
HAVING COUNT(*) > 5
ORDER BY 2 DESC;