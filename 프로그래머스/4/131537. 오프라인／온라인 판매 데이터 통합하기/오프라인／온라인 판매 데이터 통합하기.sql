## 22년 3월 온라인 판매 데이터
SELECT DATE_FORMAT(o.SALES_DATE, '%Y-%m-%d') AS SALES_DATE, 
       o.PRODUCT_ID, 
       o.USER_ID, 
       o.SALES_AMOUNT
FROM ONLINE_SALE o 
LEFT JOIN OFFLINE_SALE off
ON o.PRODUCT_ID = off.PRODUCT_ID
WHERE o.SALES_DATE LIKE '2022-03-%'

UNION 

## 22년 3월 오프라인 판매 데이터
SELECT DATE_FORMAT(off.SALES_DATE, '%Y-%m-%d') AS SALES_DATE, 
       off.PRODUCT_ID, 
       NULL AS USER_ID,  -- 오프라인 판매에는 사용자 ID가 없으므로 NULL을 반환
       off.SALES_AMOUNT
FROM ONLINE_SALE o
RIGHT JOIN OFFLINE_SALE off
ON off.PRODUCT_ID = o.PRODUCT_ID 
WHERE off.SALES_DATE LIKE '2022-03-%'

## 결과 정렬
ORDER BY SALES_DATE, PRODUCT_ID, USER_ID
