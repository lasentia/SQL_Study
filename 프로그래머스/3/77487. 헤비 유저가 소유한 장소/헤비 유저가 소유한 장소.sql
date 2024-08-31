-- 호스트 아이디 그룹화를 해서 2이상인 아이디만 추출하면 끝, HAVING으로 한 번에 됨
WITH host AS(
    SELECT *
    FROM PLACES
    GROUP BY HOST_ID
    HAVING COUNT(HOST_ID) > 1
)

SELECT p.ID, p.NAME, p.HOST_ID
FROM host s
INNER JOIN PLACES p
ON s.HOST_ID = p.HOST_ID