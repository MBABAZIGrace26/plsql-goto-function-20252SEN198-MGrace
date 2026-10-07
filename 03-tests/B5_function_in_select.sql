
SELECT e.employeeid, e.name, TO_CHAR(e.hire_date,'dd-mm-yyyy') as hire_date,
       TO_CHAR(fn_dept_name(e.departmentid))       AS department,
       TO_CHAR(e.salary,'FM99999999990.00')                      AS monthly_salary,
       TO_CHAR(fn_annual_salary(e.employeeid),'FM99999999990.00')    AS annual_salary,
       TO_CHAR(fn_years_of_service(e.employeeid)) AS years_service,
       TO_CHAR(fn_calculate_tax(e.salary),'FM99999999990.00')    AS monthly_tax
FROM   employees e
WHERE  e.salary > 0
ORDER  BY e.employeeid;
