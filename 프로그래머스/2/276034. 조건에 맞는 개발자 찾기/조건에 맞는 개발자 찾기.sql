# python or c# 이진
SELECT ID, EMAIL, FIRST_NAME, LAST_NAME
FROM DEVELOPERS
WHERE SKILL_CODE & (SELECT sum(code) ## 비트 연산을 십진수에서 바로 진행할 수 있다.
                    FROM skillcodes
                    WHERE name IN ('Python', 'C#'))
ORDER BY ID