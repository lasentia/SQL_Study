## 월별, ID 별로 그룹화
WITH five AS (
    SELECT MONTH(START_DATE) as MONTH, CAR_ID, COUNT(CAR_ID) as RECORDS
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY 
### 2022-8 ~ 10월까지 
    WHERE START_DATE BETWEEN '2022-08-01' AND '2022-10-31'
## 월별, car_id 그룹화
    GROUP BY MONTH(START_DATE), CAR_ID
)

SELECT MONTH, f.CAR_ID, RECORDS
FROM( -- 대여 횟수가 5 이상 ID 추출하여 셀프 조인으로 월별 id records를 출력
    SELECT CAR_ID
    FROM five
    GROUP BY CAR_ID
    HAVING SUM(RECORDS) >= 5
    ) aa
INNER JOIN five f
ON aa.car_id = f.car_id
ORDER BY MONTH, f.CAR_ID DESC