--Well Paid Employees

--Companies often perform salary analyses to ensure fair compensation practices. One useful analysis is to check if there are any employees earning more than their direct managers.
--As a HR Analyst, you're asked to identify all employees who earn more than their direct managers. The result should include the employee's ID and name.

WITH manager_salaries AS 
(
SELECT 
  employee_id AS manager_id_r,
  salary AS manager_salary 
FROM 
  employee
WHERE
  manager_id is NULL)
  
SELECT 
  A.employee_id,	
  A.name
FROM 
  employee AS A
JOIN 
  manager_salaries AS B 
ON A.manager_id = B.manager_id_r
WHERE 
  manager_id IS NOT NULL AND B.manager_salary < A.salary;

