CREATE DATABASE internship_sql;
USE internship_sql;
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);
USE internship_sql;
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

INSERT INTO Department VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Sales');

INSERT INTO Employee VALUES
(101, 'Amit', 50000, '2026-01-15', 1),
(102, 'Priya', 65000, '2025-12-10', 2),
(103, 'Rahul', 70000, '2026-03-20', 2),
(104, 'Sneha', 45000, '2025-11-05', 1),
(105, 'Karan', 80000, '2026-04-12', 3),
(106, 'Neha', 75000, '2026-02-18', 3),
(107, 'Rohit', 60000, '2025-10-01', 4),
(108, 'Pooja', 55000, '2026-05-08', 4);

SELECT * FROM Department;
SELECT * FROM Employee;

1.Top 5 Highest Salary Employees

SELECT *
FROM Employee
ORDER BY salary DESC
LIMIT 5;

2.Department Wise Employee Count

SELECT dept_id, COUNT(*) AS employee_count
FROM Employee
GROUP BY dept_id;

3.Find Second Highest Salary

SELECT DISTINCT salary
FROM Employee
ORDER BY salary DESC
LIMIT 1 OFFSET 1;


4.Employees Whose Salary > Department Average Salary

SELECT emp_name, salary, dept_id
FROM Employee e
WHERE salary >
(
    SELECT AVG(salary)
    FROM Employee
    WHERE dept_id = e.dept_id
);

5.Inner Join

SELECT e.emp_id,
       e.emp_name,
       d.dept_name
FROM Employee e
INNER JOIN Department d
ON e.dept_id = d.dept_id;

6.Left Join

SELECT e.emp_id,
       e.emp_name,
       d.dept_name
FROM Employee e
LEFT JOIN Department d
ON e.dept_id = d.dept_id;

7.Group By with Having

SELECT dept_id,
       COUNT(*) AS total_employees
FROM Employee
GROUP BY dept_id
HAVING COUNT(*) > 1;

8.Employees Hired in Last 6 Months

SELECT *
FROM Employee
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

9.Find Duplicate Records
					
INSERT INTO Employee
VALUES (109,'Amit',50000,'2026-06-01',1);

SELECT emp_name,
       COUNT(*) AS duplicate_count
FROM Employee
GROUP BY emp_name
HAVING COUNT(*) > 1;

10.Remove Duplicate Records

DELETE e1
FROM Employee e1
INNER JOIN Employee e2
ON e1.emp_name = e2.emp_name
AND e1.emp_id > e2.emp_id;


