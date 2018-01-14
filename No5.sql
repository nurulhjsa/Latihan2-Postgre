SELECT
     E.employee_id AS kode_karyawan,
     E.first_name ||' '|| E.last_name AS nama_lengkap,
     to_char(E.salary, '99,999') AS gaji_karyawan,
     J.job_title AS jabatan,
     E.email AS email
FROM employees E
JOIN
   jobs J ON E.job_id = J.job_id
WHERE
   E.salary >=(SELECT MAX(E2.salary)
   FROM employees E2
   WHERE
      E2.job_id = 'IT_PROG')
      AND commission_pct IS NOT NULL
ORDER BY gaji_karyawan