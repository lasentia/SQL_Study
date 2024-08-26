## Root ITEM
WITH null_id as(
    SELECT ITEM_ID
    FROM ITEM_TREE 
    WHERE PARENT_ITEM_ID IS NULL -- Null 값 추출
)

SELECT ii.ITEM_ID, ii.ITEM_NAME
FROM ITEM_INFO ii
INNER JOIN null_id ni
ON ii.ITEM_ID = ni.ITEM_ID
ORDER BY ii.ITEM_ID

-- 해당 쿼리는 많은 데이터가 존재할 때 조인 이후 필터링이 되기 때문에 비효율적이라고 판단.
# SELECT ii.ITEM_ID, ii.ITEM_NAME
# FROM ITEM_INFO ii
# INNER JOIN ITEM_TREE it
# ON ii.ITEM_ID = it.ITEM_ID
# WHERE it.PARENT_ITEM_ID IS NULL
# ORDER BY ii.ITEM_ID