-- 날짜형 함수

SELECT CURDATE(),CURRENT_DATE; 
SELECT CURTIME(),CURRENT_TIME; 
SELECT NOW(),SYSDATE(),CURRENT_TIMESTAMP;

-- 두 개 차이점 알아보기
select now(), sleep(2), now();			-- 쿼리가 실행되기 전에 고정
select sysdate(), sleep(2), sysdate();	-- 실행되면서 계속 바뀐다

SELECT DATE_FORMAT(now(),'%W %M %Y');
SELECT DATE_FORMAT(CURDATE(),'%W %M %Y');

SELECT DATE_FORMAT(now(),'%Y년 %m월 %d일 %hh시 %mi분 %s초');
SELECT DATE_FORMAT(CURDATE(),'%Y년 %m월 %d일 %hh시 %mi분 %s초');

SELECT concat(first_name, ' ', last_name) AS name,               
       PERIOD_DIFF( DATE_FORMAT(CURDATE(), '%Y%m'),  
                    DATE_FORMAT(hire_date, '%Y%m') )
FROM employees;
