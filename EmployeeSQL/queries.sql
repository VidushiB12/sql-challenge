--Listing the employee number, last name, first name, sex, and salary of each employee--
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary FROM employees AS e
INNER JOIN salaries as s
ON e.emp_no=s.emp_no;

--Listing the first name, last name, and hire date for the employees who were hired in 1986--
SELECT first_name, last_name, hire_date FROM employees
WHERE hire_date LIKE '%1986';

--Listing the manager of each department along with their department number, department name, employee number, last name, and first name--
SELECT dm.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name FROM employees AS e
INNER JOIN dept_manager as dm
ON e.emp_no=dm.emp_no
JOIN departments AS d
ON d.dept_no=dm.dept_no;

--Listing the department number for each employee along with that employee’s employee number, last name, first name, and department name--
SELECT de.emp_no, de.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name FROM dept_emp AS de
INNER JOIN employees as e
ON de.emp_no=e.emp_no
JOIN departments AS d
ON d.dept_no=de.dept_no;

--Listing first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT first_name, last_name, sex FROM employees
WHERE first_name='Hercules'
AND last_name LIKE 'B%';

--Listing each employee in the Sales department, including their employee number, last name, and first name
SELECT emp_no, last_name, first_name FROM employees
WHERE emp_no IN
	(SELECT emp_no FROM dept_emp
	WHERE dept_no IN
		(SELECT dept_no FROM departments
		WHERE dept_name='Sales'
		)
	);

--Listing each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT de.emp_no, e.first_name, e.last_name, d.dept_name FROM dept_emp AS de
JOIN employees AS e
ON de.emp_no=e.emp_no
JOIN departments as d
ON de.dept_no=d.dept_no
WHERE d.dept_name='Sales'
OR d.dept_name='Development';

--List the frequency counts, in descending order, of all the employee last names--
SELECT last_name, COUNT(last_name) FROM employees
GROUP BY last_name
ORDER BY last_name DESC;


	



