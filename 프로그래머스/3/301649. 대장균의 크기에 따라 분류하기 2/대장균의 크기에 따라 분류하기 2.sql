-- 크기를 내름차순으로 정렬 후 순위로 분류
-- 

SELECT
    ID,
    CASE 
        WHEN 등급 = 1 THEN 'CRITICAL'
        WHEN 등급 = 2 THEN 'HIGH'
        WHEN 등급 = 3 THEN 'MEDIUM'
        ELSE 'LOW'
    END 'COLONY_NAME'
FROM(
SELECT 
    ID,
    NTILE(4) OVER (ORDER BY SIZE_OF_COLONY DESC) '등급'
FROM ECOLI_DATA
) a
ORDER BY ID