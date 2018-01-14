SELECT
     (E.salary * 12) AS gaji_setahun,
COUNT(E.employee_id) AS jumlah_karyawan
FROM employees E
WHERE E.commission_pct IS NOT NULL
GROUP BY gaji_setahun
ORDER BY gaji_setahun DESC