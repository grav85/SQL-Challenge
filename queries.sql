
--1. List the deatail of each employee:

SELECT employees.emp_no,
employees.last_name,
employees.first_name,
employees.sex,
salaries.salary
FROM employees
LEFT JOIN salaries
ON employees.emp_no = salaries.emp_no
ORDER BY emp_no

--2. List employees hired in 1986

SELECT * FROM Employees
WHERE DATE_PART('year', hire_date) = 1986
ORDER BY emp_no

--3. List the manager of each department
SELECT dept_managers.dept_no,
departments.dept_name,
dept_managers.emp_no,
employees.last_name,
employees.first_name
FROM dept_managers
LEFT JOIN departments
ON dept_managers.dept_no = departments.dept_no
LEFT JOIN employees
ON dept_managers.emp_no = employees.emp_no
ORDER BY emp_no;

--4. List department of each employee
SELECT
employees.emp_no,
employees.last_name,
employees.first_name,
departments.dept_name
FROM employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON departments.dept_no = dept_emp.dept_no
ORDER BY emp_no;

--5. List employees with first name "Hercules" and last name beginning with "B". 
SELECT * FROM employees
WHERE first_name = 'Hercules' AND last_name like 'B%';

--6. List all empolyees in sales department

SELECT 
employees.emp_no,
employees.last_name,
employees.first_name,
dept_emp.dept_no
FROM employees
LEFT JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments
ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales'

--7. List all employees in the Sales and Development departments
SELECT
employees.emp_no,
employees.last_name,
employees.first_name,
dept_emp.dept_no,
departments.dept_name
FROM employees
LEFT JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments
ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name IN ('Sales', 'Development')

--8. List the count of employee last name
SELECT last_name, count(*) AS name_count
FROM employees
GROUP BY last_name
ORDER BY name_count DESC; 