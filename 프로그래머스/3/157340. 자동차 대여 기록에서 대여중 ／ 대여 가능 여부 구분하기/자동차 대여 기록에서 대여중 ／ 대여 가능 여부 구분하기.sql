SELECT 
    CAR_ID,
    CASE
        ## ID별 기간 중 특정 날짜가 있으면 1 없으면 0에서 MAX로 인해 동일한 ID 결과 중 최고 값으로만 값이 반환
        WHEN MAX('2022-10-16' BETWEEN START_DATE AND END_DATE) THEN '대여중'
        ELSE '대여 가능' -- 아니라면 대여 가능
    END 'AVAILABILITY'
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY 
GROUP BY CAR_ID -- CAR_ID로 그룹화를 해서 날짜 기간을 한 번에 확인
ORDER BY CAR_ID DESC