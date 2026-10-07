CREATE OR REPLACE FUNCTION fn_annual_salary (p_emp_id IN NUMBER)
RETURN NUMBER IS
  v_sal employees.salary%TYPE;
BEGIN
  SELECT salary INTO v_sal FROM employees WHERE employeeid = p_emp_id;
  RETURN v_sal * 12;
EXCEPTION
  WHEN NO_DATA_FOUND THEN RETURN NULL;
END;
/
SELECT TO_CHAR(fn_annual_salary(01)) as annual_salary from dual;
