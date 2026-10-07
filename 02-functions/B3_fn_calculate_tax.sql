CREATE OR REPLACE FUNCTION fn_calculate_tax (p_salary IN NUMBER)
RETURN NUMBER IS
BEGIN
  IF p_salary IS NULL OR p_salary < 0 THEN
    RAISE_APPLICATION_ERROR(-20001, 'Salary must be a non-negative number');
  ELSIF p_salary <= 60000 THEN RETURN 0;
  ELSIF p_salary <= 100000 THEN RETURN (p_salary - 60000) * 0.20;
  ELSE RETURN 8000 + (p_salary - 100000) * 0.30;
  END IF;
END;
/
SELECT TO_CHAR(fn_calculate_tax(80000)) AS tax FROM dual;

