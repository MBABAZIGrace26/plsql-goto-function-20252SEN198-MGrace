

SET SERVEROUTPUT ON
DECLARE
  v_emp_id employees.employeeID%TYPE := 1;
  v_name   employees.name%TYPE;
  v_sal    employees.salary%TYPE;
BEGIN
  SELECT name, salary INTO v_name, v_sal FROM employees WHERE employeeID= v_emp_id;
  IF v_sal < 60000 THEN
    DBMS_OUTPUT.PUT_LINE(v_name || ': LOW band - eligible for 10% raise');
  ELSIF v_sal <= 200000 THEN
    DBMS_OUTPUT.PUT_LINE(v_name || ': MID band - eligible for 5% raise');
  ELSE
    DBMS_OUTPUT.PUT_LINE(v_name || ': HIGH band - no raise this cycle');
  END IF;
  DBMS_OUTPUT.PUT_LINE('Review finished.');
EXCEPTION
  WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('Employee not found.');
END;
/