--List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT 
	em.Emp_No,
	em.Last_Name,
	em.First_Name,
	em.Sex,
	sal.Salary

FROM 
	Employees as em
INNER JOIN 
	Salaries as sal
ON 
	em.Emp_No=sal.Emp_No
ORDER BY 
	em.EMP_No;
		
		
--List first name, last name, and hire date for employees who were hired in 1986.
SELECT 
	em.First_Name, 
	em.Last_Name, 
	em.Hire_Date
FROM 
	Employees as em
WHERE 
	Hire_Date BETWEEN '1986-01-01' AND '1986-12-31';

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT 
	de.Dept_No,
	de.Dept_Name,
	de_ma.Emp_No,
	em.First_Name,
	em.Last_Name
	
FROM 
	dept_manager as de_ma
INNER JOIN 
	departments as de ON (de_ma.Dept_No=de.Dept_No)
INNER JOIN 
	employees as em ON (de_ma.Emp_No=em.Emp_No)
ORDER BY 
	de_ma.Dept_No;
	
--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT 
	de.Dept_Name,
	de_em.Emp_No,
	em.First_Name,
	em.Last_Name	
FROM 
	departments as de
INNER JOIN 
	dept_emp as de_em ON (de.Dept_No=de_em.Dept_No)
INNER JOIN 
	employees as em ON (de_em.Emp_No=em.Emp_No)
ORDER BY 
	de.Dept_Name;
	
	
--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT 
	em.First_Name, 
	em.Last_Name, 
	em.Sex
FROM 
	Employees as em
WHERE 
	First_Name = 'Hercules'
AND 
	Last_Name LIKE 'B%';


--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT
	em.emp_no,
	em.last_name,
	em.first_name,
	de.dept_name
FROM
	employees as em
INNER JOIN 
	dept_emp ON (em.emp_no = dept_emp.emp_no)
INNER JOIN 
	departments as de ON (de.dept_no = dept_emp.dept_no)
WHERE
	dept_name = 'Sales'
ORDER BY 
	emp_no;

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
	em.emp_no,
	em.last_name,
	em.first_name,
	de.dept_name
FROM
	employees as em
INNER JOIN 
	dept_emp ON (em.emp_no = dept_emp.emp_no)
INNER JOIN 
	departments as de ON (de.dept_no = dept_emp.dept_no)
WHERE
	dept_name IN ('Sales', 'Development')
ORDER BY 
	emp_no;

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT 
	em.last_name, COUNT(last_name)
FROM 
	employees as em
GROUP BY 
	last_name
ORDER BY COUNT
	(last_name) DESC;
