# 2022년 5월에 `예약`한 환자 수 
# 진료과코드 별로 조회
SELECT 
    MCDP_CD '진료과코드',
    COUNT(MCDP_CD) '5월예약건수'
FROM 
    APPOINTMENT
WHERE 
    APNT_YMD LIKE '2022-05%'
GROUP BY 
    MCDP_CD 
ORDER BY 
    COUNT(MCDP_CD), MCDP_CD