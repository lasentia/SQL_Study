WITH g_table AS(
    SELECT EMP_NO,
        --    평가 점수에 따른 등급 부여
        CASE 
            WHEN AVG(SCORE) >= 96 THEN 'S'
            WHEN AVG(SCORE) >= 90 THEN 'A'
            WHEN AVG(SCORE) >= 80 THEN 'B'
            ELSE 'C'
        END 'GRADE'
    FROM HR_GRADE
    GROUP BY EMP_NO
)

SELECT g.EMP_NO, EMP_NAME, GRADE,
    --    등급에 따른 성과금 계산
    CASE 
        WHEN GRADE = 'S' THEN SAL * 0.2
        WHEN GRADE = 'A' THEN SAL * 0.15
        WHEN GRADE = 'B' THEN SAL * 0.1
        ELSE 0
    END 'BONUS'
FROM g_table g
INNER JOIN HR_EMPLOYEES he
ON g.EMP_NO = he.EMP_NO
ORDER BY g.EMP_NO