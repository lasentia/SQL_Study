WITH id AS(
    SELECT 
        IFNULL(PARENT_ID, 0) PARENT, -- 그룹화 후 NULL은 출력되지 않음
        COUNT(PARENT_ID) cnt
    FROM ECOLI_DATA 
    GROUP BY PARENT_ID -- 그룹화를 해야 COUNT를 할 수 있다. 
)

SELECT 
    ID,
    IFNULL(cnt, 0) CHILD_COUNT -- 자식이 없는 NULL은 0으로 변환
FROM id i
RIGHT JOIN ECOLI_DATA e
ON i.PARENT = e.ID -- ID와 PARENT를 조인해서 자식의 수를 맵핑한다.
ORDER BY ID