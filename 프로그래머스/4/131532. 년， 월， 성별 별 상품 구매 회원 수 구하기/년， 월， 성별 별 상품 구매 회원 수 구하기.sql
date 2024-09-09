SELECT 
    YEAR(SALES_DATE) YEAR, 
    MONTH(SALES_DATE) MONTH, 
    GENDER, 
    COUNT(DISTINCT os.USER_ID) USERS    -- ID가 중복인 값이 존재한다. 대신 동일한 날짜는 아니라서 카운트가 된다.
FROM 
    USER_INFO ui
INNER JOIN 
    ONLINE_SALE os
ON 
    ui.USER_ID = os.USER_ID
WHERE 
    GENDER IS NOT NULL    -- 성별 정보 없는 경우 제외
GROUP BY 
    -- 문제에서 요구한 년, 월, 성별 그룹화
    YEAR(SALES_DATE), MONTH(SALES_DATE), GENDER
ORDER BY 
    YEAR(SALES_DATE), MONTH(SALES_DATE), GENDER