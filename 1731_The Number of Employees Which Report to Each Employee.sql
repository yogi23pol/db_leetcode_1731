Create table If Not Exists Employees_42(
employee_id int, 
name varchar(20), 
reports_to int, 
age int
);

Truncate table Employees_42;

insert into Employees_42 (employee_id, name, reports_to, age) values ('9', 'Hercy', NULL, '43');
insert into Employees_42 (employee_id, name, reports_to, age) values ('6', 'Alice', '9', '41');
insert into Employees_42 (employee_id, name, reports_to, age) values ('4', 'Bob', '9', '36');
insert into Employees_42 (employee_id, name, reports_to, age) values ('2', 'Winston', NULL, '37');

SELECT * FROM Employees_42;

/*
Q. For this problem, we will consider a manager an employee who has at least 1 other employee reporting to them.
Write a solution to report the ids and the names of all managers, the number of employees who report directly to them, and the average age of the reports rounded to the nearest integer.
Return the result table ordered by employee_id.
The result format is in the following example.

Input: 
Employees table:
+-------------+---------+------------+-----+
| employee_id | name    | reports_to | age |
+-------------+---------+------------+-----+
| 9           | Hercy   | null       | 43  |
| 6           | Alice   | 9          | 41  |
| 4           | Bob     | 9          | 36  |
| 2           | Winston | null       | 37  |
+-------------+---------+------------+-----+
Output: 
+-------------+-------+---------------+-------------+
| employee_id | name  | reports_count | average_age |
+-------------+-------+---------------+-------------+
| 9           | Hercy | 2             | 39          |
+-------------+-------+---------------+-------------+
Explanation: Hercy has 2 people report directly to him, Alice and Bob. Their average age is (41+36)/2 = 38.5, which is 39 after rounding it to the nearest integer.
*/

SELECT m.employee_id, m.name, COUNT(e.employee_id) AS reports_count, ROUND(AVG(e.age)) AS average_age 
FROM Employees_42 AS m
JOIN Employees_42 AS e
ON m.employee_id = e.reports_to
GROUP BY m.employee_id, m.name;
