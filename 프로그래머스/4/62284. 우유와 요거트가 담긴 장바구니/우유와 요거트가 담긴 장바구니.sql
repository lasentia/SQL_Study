WITH cart AS (
    SELECT *
    FROM CART_PRODUCTS
    WHERE NAME IN ('Yogurt', 'Milk')
    GROUP BY CART_ID, NAME -- 중복되는 제품을 통일
)

SELECT CART_ID
FROM cart
GROUP BY CART_ID
HAVING COUNT(*) >= 2    
-- WITH절에서 이미 그룹화를 통해서 각각 다른 제품으로 분류하여 2이상이라면 2개의 제품을 동시에 구매한 카드로 판단할 수 있음