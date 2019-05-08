-- 예제:  현재 Fai Bale이 근무하는 부서에서 근무하는 직원의 사번, 전체 이름을 
-- 		 출력해보세요.

-- 서브쿼리를 안쓰면
-- 1)
select b.dept_no
from employees a, dept_emp b
where a.emp_no = b.emp_no
and b.to_date = '9999-01-01'
and concat(a.first_name, ' ', a.last_name) = 'Fai Bale';
-- 2)
select a.emp_no, a.first_name
from employees a, dept_emp b
where a.emp_no = b.emp_no
and b.to_date = '9999-01-01'
and b.dept_no = 'd004';

-- 서브쿼리를 사용하면
select a.emp_no, a.first_name
from employees a, dept_emp b
where a.emp_no = b.emp_no
and b.to_date = '9999-01-01'
and b.dept_no = (select b.dept_no
					from employees a, dept_emp b
					where a.emp_no = b.emp_no
					and b.to_date = '9999-01-01'
					and concat(a.first_name, ' ', a.last_name) = 'Fai Bale');

-- 단일행인 경우
-- <, >, =, !=, <=, >=

-- 실습문제 1: 현재 전체사원의 평균 연봉보다 적은 급여를 받는 사원의  이름, 급여를 
-- 			 나타내세요.
select a.first_name, b.salary
from employees a, salaries b
where a.emp_no = b.emp_no
and b.to_date = '9999-01-01'
and b.salary < (
		select avg(salary)
        from salaries
        where to_date = '9999-01-01'
	) order by b.salary desc;

-- 실습문제 2: 현재 가장적은 평균 급여를 받고 있는 직책에해서  평균 급여를
-- 			 구하세요

-- 2-1) having절의 subquery
select b.title, round(avg(a.salary))
from salaries a, titles b
where a.emp_no = b.emp_no
and a.to_date = '9999-01-01'
and b.to_date = '9999-01-01'
group by b.title
having round(avg(a.salary)) = (select min(avg_salary)
from (select round(avg(a.salary)) as avg_salary
		from salaries a, titles b
		where a.emp_no = b.emp_no
		and a.to_date = '9999-01-01'
		and b.to_date = '9999-01-01'
		group by b.title) a);

-- 2-2) join, top-k
select b.title, round(avg(a.salary)) as avg_salary
from salaries a, titles b
where a.emp_no = b.emp_no
and a.to_date = '9999-01-01'
and b.to_date = '9999-01-01'
group by b.title
order by avg_salary asc
limit 0, 1;

-- 3-3) from 절의 subquery
select b.title, round(avg(a.salary)) as avg_salary
from salaries a, titles b, (select min(avg_salary) as avg_salary
from (select round(avg(a.salary)) as avg_salary
		from salaries a, titles b
		where a.emp_no = b.emp_no
		and a.to_date = '9999-01-01'
		and b.to_date = '9999-01-01'
		group by b.title) d) c
where a.emp_no = b.emp_no
and a.salary = c.avg_salary
and a.to_date = '9999-01-01'
and b.to_date = '9999-01-01';

-- 다중행(in(not in), any, all)
-- any = in과 동일
-- all = 모두 다 같아야 한다
-- 예제:  현재 급여가 50000 이상인 직원 이름 출력
SELECT a.first_name, b.salary
FROM employees a, salaries b
where a.emp_no = b.emp_no
and b.to_date = '9999-01-01'
and (b.emp_no, b.salary) = any (
		SELECT emp_no, salary
		FROM salaries
		WHERE salary > 50000                                                         
		AND to_date = '9999-01-01'
    );

-- from절에 subquery
select a.first_name, b.salary
from employees a, (SELECT emp_no, salary
		FROM salaries
		WHERE salary > 50000
        and to_date = '9999-01-01') b
where a.emp_no = b.emp_no;


-- 추가예제 : 각 부서별로 최고 월급을 받는 직원의 이름과 월급을 출력
select c.dept_no, max(b.salary) as max_salary
from employees a, salaries b, dept_emp c
where a.emp_no = b.emp_no
and b.emp_no = c.emp_no
and b.to_date = '9999-01-01'
and c.to_date = '9999-01-01'
group by c.dept_no;

-- sol1) where 절에 subquery
select a.first_name, a.last_name, b.salary, a.emp_no
from employees a, salaries b, dept_emp c
where a.emp_no = b.emp_no
and b.emp_no = c.emp_no
and b.to_date = '9999-01-01'
and c.to_date = '9999-01-01'
and (a.emp_no, salary) = any (
		select a.emp_no, c.dept_no, max(b.salary)
		from employees a, salaries b, dept_emp c
		where a.emp_no = b.emp_no
		and b.emp_no = c.emp_no
		and b.to_date = '9999-01-01'
		and c.to_date = '9999-01-01'
		group by c.dept_no
	);

-- sol2) from 절에 subquery
select a.first_name, a.last_name, b.salary
from employees a, salaries b, dept_emp c,
	(select c.dept_no, max(b.salary) as max_salary
	from employees a, salaries b, dept_emp c
	where a.emp_no = b.emp_no
	and b.emp_no = c.emp_no
	and b.to_date = '9999-01-01'
	and c.to_date = '9999-01-01'
	group by c.dept_no) d
where a.emp_no = b.emp_no
and b.emp_no = c.emp_no
and b.to_date = '9999-01-01'
and c.to_date = '9999-01-01'
and b.salary = d.max_salary;