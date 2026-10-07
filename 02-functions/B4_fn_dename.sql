CREATE OR REPLACE FUNCTION fn_dept_name (p_dept_id IN NUMBER)
RETURN VARCHAR2 IS
  v_name department.departmentname%TYPE;
BEGIN
  SELECT departmentname INTO v_name FROM department WHERE departmentid = p_dept_id;
  RETURN v_name;
EXCEPTION
  WHEN NO_DATA_FOUND THEN RETURN 'Unknown';
END;
/
SELECT TO_CHAR( fn_dept_name(01)) as depname from department;