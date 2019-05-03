-- 문자형 함수

select upper("Seoul"), ucase("seoul");
select lower("Seoul"), lcase("Seoul");

-- substring
SELECT concat( first_name, ' ', last_name ) AS 이름,
    gender AS 성별, 
    hire_date AS 입사일
    FROM employees
    where substring(hire_Date, 1, 4) = '1989';

-- ipad
SELECT LPAD('hi',5,'?'), LPAD('joe',7,'*');

-- trim
SELECT concat('---', LTRIM(' hello '), '---');
SELECT concat('---', RTRIM(' hello '), '---');
SELECT concat('---', TRIM(' hello '), '---');
SELECT TRIM(BOTH 'x' FROM 'xxxhixxx');