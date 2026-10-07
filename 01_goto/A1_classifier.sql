SET SERVEROUTPUT ON
DECLARE
  v_num NUMBER := 7;
BEGIN
  IF v_num > 0 THEN GOTO positive;
  ELSIF v_num < 0 THEN GOTO negative;
  ELSE GOTO zero;
  END IF;

  <<positive>>
  DBMS_OUTPUT.PUT_LINE(v_num || ' is POSITIVE');
  IF MOD(v_num,2)=0 THEN DBMS_OUTPUT.PUT_LINE('...and EVEN');
  ELSE DBMS_OUTPUT.PUT_LINE('...and ODD'); END IF;
  GOTO finish;

  <<negative>>
  DBMS_OUTPUT.PUT_LINE(v_num || ' is NEGATIVE');
  GOTO finish;

  <<zero>>
  DBMS_OUTPUT.PUT_LINE('The number is ZERO');

  <<finish>>
  DBMS_OUTPUT.PUT_LINE('Classification complete.');
END;
