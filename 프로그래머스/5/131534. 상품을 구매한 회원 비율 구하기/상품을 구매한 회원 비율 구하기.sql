WITH users AS ( -- 2021에 가입한 회원 추출
    SELECT 
        *,
        (SELECT COUNT(*)
         FROM USER_INFO 
        WHERE JOINED LIKE '2021%') as cnt	
    FROM USER_INFO 
    WHERE JOINED LIKE '2021%'
)

SELECT 
    YEAR(os.sales_date) AS YEAR, -- 구매한 년도
    MONTH(os.sales_date) AS MONTH, -- 구매한 월
    count(DISTINCT os.USER_ID) AS PURCHASED_USERS, -- 월별 상품을 구매한 회원 수 (중복X) 월별
    --  2021년에 가입한 회원 중 상품을 구매한 회원수 / 2021년에 가입한 전체 회원 수
    ROUND((count(DISTINCT os.USER_ID) / u.cnt), 1) AS PUCHASED_RATIO 
FROM ONLINE_SALE os
INNER JOIN users u
ON 
    os.USER_ID = u.USER_ID
GROUP BY 
    MONTH(os.sales_date)
ORDER BY 
    YEAR(os.sales_date), MONTH(os.sales_date)