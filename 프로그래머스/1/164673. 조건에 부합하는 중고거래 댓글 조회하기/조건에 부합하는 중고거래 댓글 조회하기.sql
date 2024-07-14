SELECT 
    ugb.TITLE, 
    ugb.BOARD_ID, 
    ugr.REPLY_ID, 
    ugr.WRITER_ID, 
    ugr.CONTENTS, 
    DATE_FORMAT(ugr.CREATED_DATE, '%Y-%m-%d') AS CREATED_DATE 
FROM 
    USED_GOODS_BOARD ugb 
INNER JOIN 
    USED_GOODS_REPLY ugr 
ON 
    ugb.BOARD_ID = ugr.BOARD_ID 
WHERE 
    ugb.CREATED_DATE BETWEEN '2022-10-01' AND '2022-10-31' 
ORDER BY 
    ugr.CREATED_DATE, 
    ugb.TITLE