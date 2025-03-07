-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
left join salaries s
on e.emp_no = s.emp_no
ORDER BY e.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT e.last_name, e.first_name, e.hire_date
FROM employees e
WHERE (SELECT EXTRACT(YEAR FROM hire_date)) = 1986;

-- List the manager of each department along with their department number,
-- department name, employee number, last name, and first name.
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager dm
inner join departments d
on dm.dept_no = d.dept_no
inner join employees e
on dm.emp_no = e.emp_no
order by d.dept_no;	

-- List the department number for each employee along with that employee’s employee number, 
--last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
inner join dept_emp de
on e.emp_no = de.emp_no
inner join departments d
on de.dept_no = d.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules 
-- and whose last name begins with the letter B.
SELECT e.first_name, e.last_name, e.sex
FROM employees e	
WHERE e.first_name = 'Hercules'
AND substring(e.last_name,1,1)='B';

-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
inner join dept_emp de
ON e.emp_no = de.emp_no
inner join departments d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- List each employee in the Sales and Development departments, including their employee number, 
-- last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
inner join dept_emp de
ON e.emp_no = de.emp_no
inner join departments d
ON de.dept_no = d.dept_no
WHERE d.dept_name in('Sales','Development')
ORDER BY e.emp_no;

-- List the frequency counts, in descending order, of all the employee last names 
-- (that is, how many employees share each last name).
SELECT e.last_name, count(e.last_name) AS last_name_Count
FROM employees e
GROUP BY e.last_name
ORDER BY last_name_Count DESC;
