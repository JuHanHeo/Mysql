-- 문제1
select concat(e.first_name, " ",  e.last_name) 이름
from employees e
where e.emp_no = 10944;

-- 문제2
select concat(first_name, ' ', last_name) 이름, gender 성별, hire_date 입사일
from employees
order by hire_date;


-- 문제3
select count(case when gender = 'm' then 1 else null end) 남성수, count(case when gender = 'f' then 1 else null end) 여성수
from employees;


-- 문제4
select count(*) "현재 직원 수"
from salaries
where to_date = '9999-01-01';

-- 문제5
select count(*) "부서 갯수"
from departments;

-- 문제6
select count(*) "현재 매니저 수"
from dept_manager
where to_date = '9999-01-01';

-- 문제7
select dept_name 부서명
from departments
order by length(dept_name) desc;

-- 문제8
select count(*) "사원수"
from salaries
where salary >= 120000
and to_date = '9999-01-01';

-- 문제9
select distinct title "직책명"
from titles
order by length(title) desc;

-- 문제10
select count(*) "엔지니어 수"
from titles
where title = 'Engineer'
and to_date = '9999-01-01';

-- 문제11
select e.emp_no, t.title, t.from_date, t.to_date
from employees e, titles t
where e.emp_no = 13250
and e.emp_no = t.emp_no
order by 3;


