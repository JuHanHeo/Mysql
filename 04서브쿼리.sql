-- 문제1
select count(*)
from employees e, salaries s
where e.emp_no = s.emp_no
and s.to_date = '9999-01-01'
and s.salary > (select avg(salary)
				from employees e, salaries s
				where e.emp_no = s.emp_no
				and s.to_date = '9999-01-01');
				
-- 문제2
select a.emp_no, concat(a.first_name, ' ', a.last_name), z.msal
from employees a, dept_emp b, salaries c,
(select de.dept_no dno,  max(s.salary) msal
from employees e, dept_emp de, salaries s
where e.emp_no = de.emp_no
and e.emp_no = s.emp_no
and s.to_date = '9999-01-01'
and de.to_date = '9999-01-01'
group by 1) z
where a.emp_no = b.emp_no
and a.emp_no = c.emp_no
and c.to_date = '9999-01-01'
and b.to_date = '9999-01-01'
and b.dept_no = z.dno
and c.salary = z.msal
order by 3 desc;

-- 문제3
select e.emp_no, concat(e.first_name, ' ', e.last_name), s.salary
from employees e, salaries s, dept_emp d,
(select de2.dept_no dno,avg(salary) asal
from employees e2, salaries s2, dept_emp de2
where e2.emp_no = s2.emp_no
and e2.emp_no = de2.emp_no
and s2.to_date = '9999-01-01'
and de2.to_date = '9999-01-01'
group by 1) z
where e.emp_no = s.emp_no
and e.emp_no = d.emp_no
and s.to_date = '9999-01-01'
and d.to_date = '9999-01-01'
and d.dept_no = z.dno
and s.salary > z.asal;

-- 문제4
select e.emp_no, e.ename, m.dmname, e.dept_name
from (select e.emp_no, concat(e.first_name, ' ', e.last_name) ename,  d.dept_name, de.dept_no
from employees e, dept_emp de, departments d
where e.emp_no = de.emp_no
and de.dept_no = d.dept_no
and de.to_date = '9999-01-01') e, 
(select d.dept_no, concat(e.first_name, ' ', e.last_name) dmname
from employees e, dept_manager d
where e.emp_no = d.emp_no
and d.to_date = '9999-01-01') m
where e.dept_no =m.dept_no;

-- 문제5
select e.emp_no, concat(e.first_name, ' ', e.last_name), t.title, s.salary
from employees e, titles t, salaries s, dept_emp d, 
(select d.dept_no, avg(s.salary)
from employees e, dept_emp d, salaries s
where e.emp_no = d.emp_no
and e.emp_no = s.emp_no
and s.to_date = '9999-01-01'
and d.to_date = '9999-01-01'
group by 1
order by 2 desc
limit 0,1) m
where e.emp_no = t.emp_no
and e.emp_no = s.emp_no
and e.emp_no = d.emp_no
and s.to_date = '9999-01-01'
and t.to_date = '9999-01-01'
and d.to_date = '9999-01-01'
and d.dept_no = m.dept_no
order by 4 desc;

-- 문제6
select a.dept_name
from(select d.dept_name, avg(salary)
from employees e, departments d, dept_emp de, salaries s
where e.emp_no = de.emp_no
and e.emp_no = s.emp_no
and e.emp_no = de.emp_no
and d.dept_no = de.dept_no
and de.to_date = '9999-01-01'
and s.to_date = '9999-01-01'
group by 1
order by 2 desc
limit 0,1) a;

-- 문제7
select a.title 
from (select t.title, avg(salary)
from employees e, titles t,salaries s
where e.emp_no = t.emp_no
and e.emp_no = s.emp_no
and t.to_date = '9999-01-01'
and s.to_date = '9999-01-01'
group by 1
order by 2 desc
limit 0,1) a;

-- 문제8
select md.dept_name, concat(e.first_name, ' ', e.last_name), s.salary, concat(me.first_name, ' ', me.last_name), ms.salary
from employees me, salaries ms, dept_manager dm, departments md,dept_emp de, employees e, salaries s
where me.emp_no = ms.emp_no
and me.emp_no = dm.emp_no
and dm.dept_no = md.dept_no
and ms.to_date = '9999-01-01'
and dm.to_date = '9999-01-01'
and md.dept_no = de.dept_no
and de.to_date = '9999-01-01'
and de.emp_no = e.emp_no
and e.emp_no = s.emp_no
and s.to_date = '9999-01-01'
and s.salary>ms.salary;







 
 

 
 
 