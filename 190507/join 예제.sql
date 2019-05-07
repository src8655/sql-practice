-- 예제10: employees 테이블과 titles 테이블를 join하여 직원의 이름과 직책을 출력하되 여성 엔지니어만 출력하세요. 
select a.first_name, b.title, a.gender
from employees a, titles b
where a.emp_no=b.emp_no
and a.gender='f';

-- 예제11-1: 앞의 예제의 join on 법
select a.first_name, b.title, a.gender
from employees a join titles b on a.emp_no=b.emp_no
where a.gender='f';

-- 예제11-2 :  앞의 예제의 Natural Join 법
select a.first_name, b.title, a.gender
from employees a join titles b
where a.gender='f';

-- 예제11-3 :  앞의 예제를 JOIN~ USING을 사용해서  같은 결과가 나오도록 해 보세요.
select a.first_name, b.title, a.gender
from employees a join titles b using (emp_no)
where a.gender='f';

-- 실습문제 1:  현재 회사 상황을 반영한 직원별 근무부서를  사번, 직원 전체이름, 근 
-- 			  무부서 형태로 출력해 보세요.
-- inner join
select a.emp_no, a.first_name, a.last_name, c.dept_name
from employees a, dept_emp b, departments c
where a.emp_no = b.emp_no
and b.dept_no = c.dept_no
and b.to_date = '9999-01-01';

-- outer join
select a.emp_no, a.first_name, a.last_name, c.dept_name
from employees a
left join dept_emp b on a.emp_no = b.emp_no
join departments c on b.dept_no = c.dept_no
where  b.to_date = '9999-01-01';

-- left outer join
select a.name, ifnull(b.name, '없음')
from employee a
left join department b
on a.department_no=b.no;

-- right outer join
select ifnull(a.name, '없음'), b.name
from employee a
right join department b
on a.department_no=b.no;

