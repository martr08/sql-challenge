-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
FROM employees as emp
JOIN salaries as sal on emp.emp_no = sal.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT emp.first_name, emp.last_name, emp.hire_date
FROM employees as emp
WHERE hire_date >= '1989-01-01' AND hire_date <= '1989-12-31';

--** List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT manager.dept_no,dept.dept_name, manager.emp_no, emp.last_name,emp.first_name
FROM dept_manager as manager
JOIN departments as dept ON manager.dept_no = dept.dept_no
JOIN employees as emp ON manager.emp_no = emp.emp_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT deptemp.dept_no, emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM dept_emp as deptemp 
JOIN departments as dept ON  deptemp.dept_no = dept.dept_no
JOIN employees as emp ON deptemp.emp_no = emp.emp_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name ILIKE 'B%';
	
-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT  emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM dept_emp as deptemp
JOIN employees as emp ON deptemp.emp_no = emp.emp_no 
JOIN departments AS dept ON deptemp.dept_no = dept.dept_no
WHERE deptemp.dept_no = 'd007';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT  emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM dept_emp as deptemp
JOIN employees as emp ON deptemp.emp_no = emp.emp_no 
JOIN departments AS dept ON deptemp.dept_no = dept.dept_no
WHERE deptemp.dept_no IN ('d007', 'd005');

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name). 
SELECT last_name, COUNT (*) AS name_count
FROM employees
GROUP BY last_name
ORDER BY name_count DESC;
