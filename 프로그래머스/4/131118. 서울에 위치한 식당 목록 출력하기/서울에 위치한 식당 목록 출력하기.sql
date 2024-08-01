## 주소가 서울인 식당 출력
WITH seoul AS (
    SELECT *
    FROM REST_INFO ri
    WHERE ADDRESS LIKE '서울%')

## 서울 식당 리뷰 계산
SELECT 
    s.REST_ID, 
    s.REST_NAME, 
    s.FOOD_TYPE, 
    s.FAVORITES, 
    s.ADDRESS, 
    ROUND(AVG(rr.REVIEW_SCORE),2) AS 'SCORE'
FROM 
    seoul s
INNER JOIN 
    REST_REVIEW rr
ON 
    rr.REST_ID = s.REST_ID
GROUP BY 
    s.REST_NAME
ORDER BY 
    AVG(rr.REVIEW_SCORE) DESC, 
    s.FAVORITES DESC