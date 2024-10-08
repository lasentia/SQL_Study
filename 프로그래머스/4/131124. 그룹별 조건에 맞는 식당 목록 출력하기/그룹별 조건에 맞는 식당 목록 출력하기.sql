## 리뷰 카운트, ID, NAME 추출 쿼리
WITH maxreview AS (
    SELECT COUNT(r.MEMBER_ID) AS cnt, r.MEMBER_ID, m.MEMBER_NAME
    FROM REST_REVIEW r
    INNER JOIN MEMBER_PROFILE m
    ON r.MEMBER_ID = m.MEMBER_ID
    GROUP BY MEMBER_ID
)

SELECT m.MEMBER_NAME, r.REVIEW_TEXT, DATE_FORMAT(r.REVIEW_DATE,'%Y-%m-%d') REVIEW_DATE
FROM maxreview m
INNER JOIN REST_REVIEW r
ON r.MEMBER_ID = m.MEMBER_ID
WHERE cnt = (SELECT MAX(cnt) ## 제일 리뷰를 많이 남긴 조건
            FROM maxreview)
ORDER BY REVIEW_DATE, REVIEW_TEXT
