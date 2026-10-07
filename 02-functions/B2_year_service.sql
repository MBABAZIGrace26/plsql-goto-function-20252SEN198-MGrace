CREATE OR REPLACE FUNCTION fn_years_of_service (p_emp_id IN NUMBER)
RETURN NUMBER IS
  v_hire employees.hire_date%TYPE;
BEGIN
  SELECT hire_date INTO v_hire FROM employees WHERE employeeid = p_emp_id;
  RETURN TRUNC(MONTHS_BETWEEN(SYSDATE, v_hire) / 12, 1);
EXCEPTION
  WHEN NO_DATA_FOUND THEN RETURN NULL;
END;
/

SELECT TO_CHAR( fn_years_of_service(1)) AS year_service from dual;
