SELECT COUNT(*) USERS
FROM USER_INFO 
WHERE JOINED LIKE '2021%' -- 2021년 가입
AND 20 <= AGE
AND AGE <=29