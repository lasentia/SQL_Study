-- 희귀도 RARE 아이템 ID 
WITH id AS(
    SELECT *
    FROM ITEM_INFO 
    WHERE RARITY = 'RARE'
),
rare_id AS(
    SELECT it.ITEM_ID
    FROM id i
    LEFT JOIN ITEM_TREE it
    ON i.ITEM_ID = it.PARENT_ITEM_ID
)

SELECT ii.ITEM_ID, ITEM_NAME, RARITY
FROM rare_id ri
INNER JOIN ITEM_INFO ii
ON ri.ITEM_ID = ii.ITEM_ID
ORDER BY ii.ITEM_ID DESC