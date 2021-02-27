CREATE TABLE departments (
  dept_no VARCHAR(30),  
  dept_name VARCHAR(30)
);

CREATE TABLE dept_manager (
  dept_no VARCHAR(30),  
  emp_no INT
);

CREATE TABLE dept_employee (
  emp_no INT,
  dept_no VARCHAR(30)  
);

CREATE TABLE employees (  
    emp_no INT, 
    emp_title_id VARCHAR,  
    birth_date VARCHAR(30),
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    sex VARCHAR(30),
    hire_date VARCHAR(30)
);

CREATE TABLE salaries (  
    emp_no INT, 
    salary INT 
);

CREATE TABLE titles (  
    title_id VARCHAR(30), 
    title VARCHAR(30) 
);

CREATE TABLE sqlchallenge ( 
    employee_number VARCHAR(30), 
    last_name VARCHAR(30), 
    first_name VARCHAR(30), 
    sex VARCHAR(30), 
    salary INT
);

SELECT employees.first_name, employees.last_name, employees.sex,salaries.emp_no, salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no=salaries.emp_no;

SELECT *
FROM employees;
SELECT first_name, last_name, hire_date 
FROM employees
WHERE hire_date >= '1/1/1986'
    AND hire_date <= '12/31/1986';

--List the manager of each department with the following information: 





SELECT employees.first_name, employees.last_name, dept_manager.dept_no, dept_manager.emp_no, departments.dept_name
FROM employees 
INNER JOIN dept_manager ON
employees.emp_no=dept_manager.emp_no
INNER join departments on
departments.dept_no=dept_manager.dept_no;



--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

SELECT e.first_name, e.last_name, de.dept_no, de.emp_no, d.dept_name
FROM employees as e
INNER JOIN dept_emp as de ON
e.emp_no=de.emp_no
INNER join departments as d on
d.dept_no=de.dept_no;


--List first name, last name, and sex for employees whose 
--first name is "Hercules" and last names begin with "B."
select last_name, first_name, sex from employees where first_name = 'Hercules' and last_name LIKE 'B%'

--List all employees in the Sales department, 
--including their employee number, last name, first name, and department name
SELECT e.first_name, e.last_name, de.dept_no, de.emp_no, d.dept_name
FROM employees as e
INNER JOIN dept_emp as de ON
e.emp_no=de.emp_no
INNER join departments as d on
d.dept_no=de.dept_no
where d.dept_name='Sales'

--List all employees in the Sales and Development departments,
--including their employee number, last name, first name, and department name
SELECT e.first_name, e.last_name, de.dept_no, de.emp_no, d.dept_name
FROM employees as e
INNER JOIN dept_emp as de ON
e.emp_no=de.emp_no
INNER join departments as d on
d.dept_no=de.dept_no
where d.dept_name in ('Sales', 'Development')

--In descending order, 
--list the frequency count of employee last names, 
--i.e., how many employees share each last name
select last_name, count (last_name) from employees group by last_name order by (count (last_name)) desc