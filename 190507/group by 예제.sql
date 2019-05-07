select * from salaries where emp_no = 11007;

-- 예제1 : 각 사원별로 평균연봉 출력
SELECT emp_no, AVG(salary)
FROM salaries
GROUP BY emp_no
order by avg(salary) desc;	-- 현재

-- 예제 2:  각 현재 Manager 직책 사원에 대한  평균 연봉은? -> join이 필요하다 -> 아직, 나중에
select emp_no, title
from titles
where title='Manager';

-- 예제 3:  사원별 몇 번의 직책 변경이 있었는지 조회
select emp_no, count(title)
from titles
group by emp_no;

-- 예제4 : 각 사원별로 평균연봉 출력하되 50,000불 이상인 직원만 출력
select emp_no, avg(salary) as avg_salary
from salaries
group by emp_no
having avg_salary >= 50000;

-- 예제5: 현재 직책별로 (평균 연봉과//나중에) 인원수를 구하되 직책별로 인원이 100명 이상인 직책만 출력하세요.
select title, count(emp_no)
from titles
where to_date = '9999-01-01'
group by title
having count(emp_no) >= 100;

-- 예제6: 현재 부서별로 현재 직책이 Engineer인 직원들에 대해서만 평균급여를 구하세요.
select c.dept_no, d.dept_name, avg(b.salary)
from titles a, salaries b, dept_emp c, departments d
where a.to_date = '9999-01-01'
and b.to_date = '9999-01-01'
and a.title='Engineer'
and a.emp_no = b.emp_no
and b.emp_no = c.emp_no
and c.dept_no = d.dept_no
group by c.dept_no;
 
-- 예제7: 현재 직책별로 급여의 총합을 구하되 Engineer직책은 제외하세요
--        단, 총합이 2,000,000,000이상인 직책만 나타내며 급여총합에
--        대해서 내림차순(DESC)로 정렬하세요.
select title, sum(salary)
from titles a, salaries b
where a.emp_no = b.emp_no
and a.to_date = '9999-01-01'
and b.to_date = '9999-01-01'
and a.title != 'Engineer'
group by title
having sum(salary) >= 2000000000
order by sum(salary) desc