-- 문제1
select max(salary) 최고임금, min(salary) 최저임금, max(salary)-min(salary) "최저임금 - 최저임금"
from salaries;

-- 문제2
select date_format(max(hire_date),'%Y년 %m월 %d일') "입사일"
from employees;

-- 문제3
select date_format(min(a.hire_date),'%Y년 %m월 %d일') "입사일"
from (select e.emp_no, e.hire_date
from employees e, salaries s
where e.emp_no = s.emp_no
group by 1
having to_days(max(s.to_date)) - to_days(e.hire_date) = (select max(days)
														from (select e.emp_no, to_days(max(s.to_date)) - to_days(e.hire_date) days
																from employees e, salaries s
																where e.emp_no = s.emp_no
																group by 1) a)) a ;
																		
-- 문제4
select avg(salary) "평균 연봉"
from salaries s , employees e
where s.emp_no = e.emp_no
and s.to_date = '9999-01-01';

-- 문제5
select max(salary) "최고 연봉", min(salary) "최저 연봉"
from salaries
where to_date = '9999-01-01';

-- 문제6
select (cast(date_format(now(),'%Y') as unsigned) - cast(date_format(max(birth_date),'%Y') as unsigned))+1 "최 연장자 나이",
		(cast(date_format(now(),'%Y') as unsigned) - cast(date_format(min(birth_date),'%Y') as unsigned))+1 "최고 어린 사원"
from employees;
