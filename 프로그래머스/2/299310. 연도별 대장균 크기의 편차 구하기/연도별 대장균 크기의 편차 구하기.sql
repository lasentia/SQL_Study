SELECT s.YEAR, (s.max_size - e.SIZE_OF_COLONY) AS YEAR_DEV, e.ID
FROM ECOLI_DATA e
INNER JOIN (
    ## 연도별 최고 대장균 크기
    SELECT MAX(SIZE_OF_COLONY) AS max_size, YEAR(DIFFERENTIATION_DATE) AS YEAR
    FROM ECOLI_DATA
    GROUP BY YEAR(DIFFERENTIATION_DATE)
) s
ON YEAR(e.DIFFERENTIATION_DATE) = s.YEAR
ORDER BY YEAR, YEAR_DEV