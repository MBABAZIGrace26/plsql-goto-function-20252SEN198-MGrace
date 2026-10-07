-- ILLEGAL: jumps INTO an IF block -> PLS-00375
BEGIN
  GOTO inside_if;
  IF 1 = 1 THEN
    <<inside_if>>
    DBMS_OUTPUT.PUT_LINE('Inside IF');
  END IF;
END;
/

-- FIX: label in the same block as the GOTO
BEGIN
  GOTO outer_label;
  DBMS_OUTPUT.PUT_LINE('Skipped');
  <<outer_label>>
  DBMS_OUTPUT.PUT_LINE('Reached label safely');
END;
/
