---
/* Вывести список сотрудников, 
получающих заработную плату большую, 
чем у непосредственного руководителя */
WITH t2 AS (SELECT
    *
FROM employee)

SELECT
    *
FROM employee AS t1
WHERE t1.chef_id = t2.id 
AND t1.salary > t2.salary

---
/* Вывести список сотрудников, 
получающих максимальную заработную плату 
в своём отделе */
WITH t1 AS 
(SELECT
    id, 
    department_id,
    MAX(salary)
FROM employee
GROUP BY department_id)

SELECT 
    *
FROM employee AS t2
WHERE t2.id IN 
(SELECT
    id
FROM t1)

---
/* Вывести список ID отделов, 
количество сотрудников в которых 
не превышает 3 человек */

SELECT
    department_id
FROM employee 
GROUP BY department_id
HAVING COUNT(id) < 4

---
/* Вывести список сотрудников, 
не имеющих назначенного руководителя,
работающего в том-же отделе */
SELECT 
    *
FROM employee AS t1
LEFT JOIN employee AS t2 ON (t1.chief_id = t2.id AND t1.department_id = t2.department_id)
WHERE t2.id IS NULL

---
/* Найти список ID отделов с максимальной 
суммарной зарплатой сотрудников */
WITH t1 AS 
(SELECT 
    department_id, 
    SUM(salary) AS salary
FROM employee
GROUP BY department_id)

SELECT
    department_id
FROM employee AS t2
WHERE t2.salary =
(SELECT
    MAX(salary)
FROM t1)
