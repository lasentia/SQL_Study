## 생물 종 - 개 이면서 이름에 el이 포함
SELECT 
    ANIMAL_ID, NAME
FROM 
    ANIMAL_INS
WHERE 
    ANIMAL_TYPE = 'Dog'
AND 
    NAME LIKE '%el%'
ORDER BY 
    NAME