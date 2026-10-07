CREATE OR REPLACE FUNCTION fn_validate_payroll (p_emp_id IN NUMBER)
RETURN VARCHAR2 IS
  v_emp employees%ROWTYPE;
  v_msg VARCHAR2(200) := 'VALID';
BEGIN
  SELECT * INTO v_emp FROM employees WHERE employeeid = p_emp_id;

  IF v_emp.salary IS NULL OR v_emp.salary <= 0 THEN
    v_msg := 'INVALID: salary must be greater than zero';
  END IF;
  IF v_emp.hire_date IS NULL OR v_emp.hire_date > SYSDATE THEN
    v_msg := 'INVALID: hire date missing or in the future'; GOTO finish;
  END IF;
  IF v_emp.departmentid IS NULL OR fn_dept_name(v_emp.departmentid) = 'Unknown' THEN
    v_msg := 'INVALID: employee has no valid department'; GOTO finish;
  END IF;
  IF fn_calculate_tax(v_emp.salary) >= v_emp.salary THEN
    v_msg := 'INVALID: tax exceeds salary'; GOTO finish;
  END IF;

  <<finish>>
  RETURN v_msg;
EXCEPTION
  WHEN NO_DATA_FOUND THEN RETURN 'INVALID: employee not found';
  WHEN OTHERS THEN RETURN 'ERROR: ' || SQLERRM;
END;
/

select TO_CHAR(fn_validate_payroll(1)) as payrolltest from dual;