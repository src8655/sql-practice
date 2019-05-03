-- 집계 함수

SELECT emp_no, AVG(salary) , SUM(salary)
FROM salaries
group by emp_no;

SELECT to_date, salary
FROM salaries
WHERE emp_no = '10060'

having max(salary);
