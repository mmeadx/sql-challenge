-- Query #1 -- listing employee number, last name, first name, sex & salary
-- 300024 rows affected

select e.emp_no, 
	   e.last_name, 
	   e.first_name, 
	   e.sex,
	   sa.salary
from employees as e
	left join salaries as sa
	on (e.emp_no = sa.emp_no)
order by sa.salary desc;

-- Query #2 -- list first name, last name and hire date for employees hired in 1986
-- 36150 rows affected

select first_name, last_name, hire_date
from employees
where hire_date 
between '1986-01-01' and '1986-12-31'
order by hire_date;

-- Query #3 -- list manager of each department with: 
-- dpt number, dpt name, manager's employee number, last name, first name
-- 24 rows affected

select dema.dept_no,
	   dept.dept_name,
	   dema.emp_no,
	   e.last_name,
	   e.first_name
from dept_manager as dema
	inner join departments as dept
		on (dema.dept_no = dept.dept_no)
	inner join employees as e
		on (dema.emp_no = e.emp_no);

-- Query #4 -- list department of each employee with:
-- employee number, last name, first name & deparment name
-- 331603 rows affected 

select deem.emp_no,
	   e.last_name,
	   e.first_name,
	   dept.dept_name
from dept_emp as deem
	inner join employees as e
		on (deem.emp_no = e.emp_no)
	inner join departments as dept
		on (deem.dept_no = dept.dept_no);
		
-- Query #5 -- list first name, last name & sex for employees whose first name is "Hercules"
-- and last names begin with "B"
-- 20 rows affected

select first_name, last_name, sex
from employees
where first_name = 'Hercules' and last_name  like 'B%';

-- Query #6 -- list all employees in sales dept, including emp number, last name,
-- first name, and department name
-- 52245 rows affected

select deep.emp_no,
	   e.last_name,
	   e.first_name,
	   dept.dept_name
from dept_emp as deep
	inner join employees as e
		on (deep.emp_no = e.emp_no)
	inner join departments as dept
		on (deep.dept_no = dept.dept_no)
where dept_name = 'Sales'
order by emp_no;

-- Query #7 -- list all employees in sales and development depts, including their:
-- employee number, last name, first name, and dept name
-- 137952 rows affected

select deep.emp_no,
	   e.last_name,
	   e.first_name,
	   dept.dept_name
from dept_emp as deep
	inner join employees as e
		on (deep.emp_no = e.emp_no)
	inner join departments as dept
		on (deep.dept_no = dept.dept_no)
where dept.dept_name in ('Sales', 'Development')
order by dept_name;

-- Query #8 -- in desc order, list the frequency count of employee last names
-- 1638 rows affected

select last_name, count(last_name)
from employees
group by last_name
order by count(last_name) desc;
