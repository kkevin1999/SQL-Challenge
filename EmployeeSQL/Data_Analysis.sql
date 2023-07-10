-- Finding Employee Data
SELECT 	e.emp_no AS "Employee Number",
		e.last_name AS "Last Name",
		e.first_name AS "First Name",
		e.sex AS "Sex",
		o.salary AS "Annual Salary"
FROM employees e
JOIN salaries o
ON (e.emp_no=o.emp_no);

-- Employees hired in 1986
SELECT 	e.emp_no AS "Employee Number",
		e.first_name AS "First Name",
		e.last_name AS "Last Name",
		e.hire_date AS "Hire Date"
FROM employees e
WHERE hire_date >= '1986-01-01'
AND hire_date <= '1986-12-31';

-- Manager data for each department 
SELECT	e.emp_no AS "Employee No",
		e.first_name AS "First Name",
		e.last_name AS "Last Name",
		m.dept_no AS "Dept No",
		d.dept_name AS "Department Name"
FROM employees e
JOIN dept_manager m
ON (e.emp_no=m.emp_no)
JOIN departments d
ON (m.dept_no=d.dept_no);

-- Employee data for departments 
SELECT	de.dept_no AS "Dept No",
		e.emp_no AS "Employee No",
		e.last_name AS "Last Name",
		e.first_name AS "First Name",
		d.dept_name AS "Department Name"
FROM employees e
JOIN dept_emp de
ON (e.emp_no=de.emp_no)
JOIN departments d
ON (de.dept_no=d.dept_no);

-- Employee's with first name Hercules and last name "B_"
SELECT 	e.emp_no AS "Employee Number",
		e.first_name AS "First Name",
		e.last_name AS "Last Name",
		e.sex AS "Sex"
FROM employees e
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- Employee's in Sale Department
SELECT	e.emp_no AS "Employee No",
		e.last_name AS "Last Name",
		e.first_name AS "First Name",
		d.dept_name AS "Department Name"
FROM employees e
JOIN dept_emp de
ON (e.emp_no=de.emp_no)
JOIN departments d
ON (de.dept_no=d.dept_no)
Where d.dept_name = 'Sales';

-- Employee's in Salke and Development departments 
SELECT	e.emp_no AS "Employee No",
		e.last_name AS "Last Name",
		e.first_name AS "First Name",
		d.dept_name AS "Department Name"
FROM employees e
JOIN dept_emp de
ON (e.emp_no=de.emp_no)
JOIN departments d
ON (de.dept_no=d.dept_no)
WHERE d.dept_name='Development'
OR d.dept_name = 'Sales';

-- List the frequency counts, in descending order, of all the employee last names 
SELECT e.last_name, COUNT(e.last_name) AS freq
FROM employees AS e
GROUP BY e.last_name
ORDER BY freq DESC
;
