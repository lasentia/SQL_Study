SELECT 
    ao.ANIMAL_ID, 
    ao.NAME
FROM 
    ANIMAL_INS ai
LEFT JOIN
    ANIMAL_OUTS ao
ON 
    ai.ANIMAL_ID = ao.ANIMAL_ID
WHERE 
    ai.ANIMAL_ID IS NULL
    
UNION

SELECT 
    ao.ANIMAL_ID, 
    ao.NAME
FROM 
    ANIMAL_INS ai
RIGHT JOIN
    ANIMAL_OUTS ao
ON 
    ai.ANIMAL_ID = ao.ANIMAL_ID
WHERE 
    ai.ANIMAL_ID IS NULL