SELECT
      D.department_id AS dep_id,
      D.department_name AS dep_name,
      SUM(E.salary) AS total_gaji
FROM employees E
JOIN
    departments D ON E.department_id = D.department_id
GROUP BY 
    dep_id, dep_name
ORDER BY total_gaji DESC