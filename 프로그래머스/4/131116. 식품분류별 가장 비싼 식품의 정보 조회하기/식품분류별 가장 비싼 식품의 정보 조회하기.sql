SELECT 
    fp.CATEGORY,
    MAX_PRICE,
    fp.PRODUCT_NAME
FROM(
    SELECT  
    f.CATEGORY,
    MAX(f.PRICE) AS MAX_PRICE,
    f.PRODUCT_NAME
    FROM
        FOOD_PRODUCT f
    WHERE
        f.CATEGORY = '과자'
    OR
        f.CATEGORY = '국'
    OR
        f.CATEGORY = '김치'
    OR 
        f.CATEGORY = '식용유'
    GROUP BY 
        f.CATEGORY) t1
INNER JOIN 
    FOOD_PRODUCT fp 
ON 
    t1.CATEGORY = fp.CATEGORY
AND 
    t1.MAX_PRICE = fp.PRICE 
ORDER BY 
        MAX_PRICE DESC