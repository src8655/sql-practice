-- select 기본

select * from departments;

select first_name, gender, hire_date from employees;

select concat(first_name, ' ', last_name) as '이름',
			gender as '성별',
            hire_date as '입사일'
            from employees;

-- 중복제거
select DISTINCT title from titles;

-- order by
select concat(first_name, ' ', last_name) as '이름',
			gender as '성별',
            hire_date as '입사일'
            from employees
            order by hire_date;
            
-- salaries
select emp_no, salary
from salaries
where from_date like '2001%'
order by salary desc;


SELECT concat( first_name, ' ', last_name ) AS 이름,
    gender AS 성별, 
    hire_date AS 입사일
    FROM employees
    WHERE hire_date < '1991-01-01';
SELECT concat( first_name, ' ', last_name ) AS 이름,
    gender AS 성별, 
    hire_date AS 입사일
    FROM employees
    WHERE hire_date < '1991-01-01'
    and gender='f';
    
-- SQL 비교 연산자 
	SELECT emp_no, dept_no   
	FROM dept_emp
	WHERE dept_no in( 'd005', 'd009' )