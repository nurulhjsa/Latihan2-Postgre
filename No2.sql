SELECT
     E.employee_id AS "Kode Karyawan",
     E.last_name ||', '|| E.first_name AS nama_karyawan,
     D.department_name AS "Nama Bagian",
CASE WHEN
   m.employee_id IS NULL
   THEN 'Saya tidak punya manager'
ELSE
   m.first_name||' '|| m.last_name
   END AS manager_name,
     UPPER(J.job_title) AS "Nama Jabatan"
FROM employees E
JOIN
     departments D ON E.department_id = D.department_id
LEFT OUTER JOIN
     employees m ON E.employee_id = m.manager_id
JOIN
     jobs J ON E.job_id = J.job_id
ORDER BY manager_name, nama_karyawan