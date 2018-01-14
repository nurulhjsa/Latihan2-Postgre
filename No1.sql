SELECT
     E.employee_id AS "Kode Karyawan",
     D.department_name AS "Nama Department",
     E.first_name||' '||E.last_name AS "Nama Lengkap",
     to_char(E.salary, '999,999,999') AS "Gaji Sebulan",
CASE WHEN
   E.commission_pct IS NULL
   THEN 'Tidak punya komisi!'
ELSE
   to_char((E.salary * E.commission_pct), '999,999,999') 
   END AS "Mendapatkan Komisi",
     to_char(E.salary + (E.salary * coalesce(E.commission_pct, 0)), '999,999,999') AS gaji_terima
FROM 
   departments D, employees E
WHERE
   D.department_id = E.department_id 
   AND
     E.salary + (E.salary * coalesce(E.commission_pct, 0)) >= 12000
ORDER BY gaji_terima