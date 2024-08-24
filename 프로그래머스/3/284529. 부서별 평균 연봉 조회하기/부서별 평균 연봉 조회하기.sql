## join을 하고 난 뒤 부서별 그룹핑 후 연봉 평균
WITH dept as (
    SELECT hd.DEPT_NAME_EN, ROUND((SUM(SAL) / COUNT(SAL))) AVG_SAL
    FROM HR_DEPARTMENT hd
    INNER JOIN HR_EMPLOYEES he
    ON hd.DEPT_ID = he.DEPT_ID
    GROUP BY hd.DEPT_NAME_EN
)

## ID 출력을 위한 JOIN
SELECT hd.DEPT_ID, hd.DEPT_NAME_EN, AVG_SAL
FROM dept d
INNER JOIN HR_DEPARTMENT hd
ON d.DEPT_NAME_EN = hd.DEPT_NAME_EN
ORDER BY AVG_SAL DESC