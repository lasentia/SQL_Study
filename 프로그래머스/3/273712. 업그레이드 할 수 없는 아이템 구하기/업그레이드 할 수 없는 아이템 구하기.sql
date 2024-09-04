-- 아이템의 부모가 있다면 그 부모는 업그레이드를 할 수 있음
WITH no_upgrade AS(
    SELECT i1.ITEM_ID
    FROM ITEM_TREE i1
    LEFT JOIN ITEM_TREE i2 
    ON i1.ITEM_ID = i2.PARENT_ITEM_ID -- 아이템의 부모를 매칭하여 부모 ID가 없는 아이템 식별
    WHERE i2.PARENT_ITEM_ID IS NULL -- 부모 아이디가 NULL이라면 업그레이드 불가.
)

SELECT i.ITEM_ID, i.ITEM_NAME, i.RARITY
FROM no_upgrade n
INNER JOIN ITEM_INFO i
ON n.ITEM_ID = i.ITEM_ID
ORDER BY i.ITEM_ID DESC