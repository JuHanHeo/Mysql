-- 문제1
select e.emp_no, concat(e.first_name, ' ', e.last_name), s.salary
from employees e, salaries s
where e.emp_no = s.emp_no
and s.to_date = '9999-01-01'
order by 3 desc;

-- 문제2
select e.emp_no, concat(e.first_name, ' ', e.last_name), t.title
from employees e, titles t
where e.emp_no = t.emp_no
and t.to_date = '9999-01-01'
order by 2;

-- 문제3
select e.emp_no, concat(e.first_name, ' ', e.last_name), d.dept_name
from employees e, dept_emp de, departments d
where e.emp_no = de.emp_no
and de.dept_no = d.dept_no
and de.to_date = '9999-01-01'
order by 2;

-- 문제4
select e.emp_no, concat(e.first_name, ' ', e.last_name), t.title ,d.dept_name
from employees e, dept_emp de, departments d, titles t
where e.emp_no = de.emp_no
and e.emp_no = t.emp_no
and de.dept_no = d.dept_no
and de.to_date = '9999-01-01'
and t.to_date = '9999-01-01'
order by 2;

-- 문제5
select e.emp_no, concat(e.first_name, ' ', e.last_name)
from employees e, titles t
where e.emp_no = t.emp_no
and t.title = 'Technique Leader'
and t.to_date != '9999-01-01';

-- 문제6
select concat(e.first_name, ' ', e.last_name), d.dept_name, t.title
from employees e, dept_emp de, departments d, titles t
where e.emp_no = de.emp_no
and e.emp_no = t.emp_no
and de.dept_no = d.dept_no
and de.to_date = '9999-01-01'
and t.to_date = '9999-01-01'
and e.last_name like 'S%';

-- 문제7
select concat(e.first_name, ' ', e.last_name), t.title, s.salary
from employees e, titles t, salaries s
where e.emp_no = t.emp_no
and e.emp_no = s.emp_no
and s.to_date = '9999-01-01'
and t.to_date = '9999-01-01'
and s.salary >= 40000
and t.title = 'Engineer'
order by 3 desc;

-- 문제8
select t.title, min(s.salary)
from employees e, titles t, salaries s
where e.emp_no = s.emp_no
and e.emp_no = t.emp_no
and t.to_date = '9999-01-01'
and s.to_date = '9999-01-01'
group by 1
having min(s.salary)>50000;


-- 문제9
select d.dept_name, avg(salary)
from employees e, dept_emp de, departments d, salaries s
where e.emp_no = de.emp_no
and e.emp_no = s.emp_no
and de.dept_no = d.dept_no
and s.to_date = '9999-01-01'
and de.to_date = '9999-01-01'
group by 1
order by 2 desc;

-- 문제10
select t.title, avg(salary)
from employees e, titles t, salaries s
where e.emp_no = s.emp_no
and e.emp_no = t.emp_no
and s.to_date = '9999-01-01'
and t.to_date = '9999-01-01'
group by 1
order by 2 desc;