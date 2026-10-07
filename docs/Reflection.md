Reflection: PL/SQL GOTO Statements and Functions
1. Why is GOTO discouraged, and what did A3 teach me?

GOTO makes the flow of a program jump around, so the code becomes harder to read, debug and maintain. In A1 and A2 I had to follow labels up and down the block to understand what would run next. A3 showed me that PL/SQL also restricts GOTO with scope rules. A GOTO can jump out of a nested block or to a label in the same block, but it cannot jump into an IF, a loop or an exception handler. When I did that on purpose, Oracle raised PLS-00375. I fixed it by moving the label into the same block as the GOTO. I also learned that a label must be followed by an executable statement, which is why NULL; is sometimes needed.

2. What advantage did the IF/ELSIF version in A4 have?

The rewrite in A4 is shorter and reads from top to bottom, so each salary band is clearly one branch of the same decision. It needs no labels, no extra jumps and no risk of forgetting a GOTO done. It's also easier to change: adding a new band means adding one ELSIF. Structured control flow is the better choice in nearly every case. I'd only consider GOTO for something like jumping to a single exit point, as I did in C1.

3. Functions versus procedures

A function must return a value with RETURN, while a procedure performs an action and doesn't have to return anything. Because a function returns a single value, it can be used inside SQL statements. In B5 I called my functions in the SELECT list to show department name, annual salary, years of service and tax for each employee. This kept the logic in one reusable place instead of repeating calculations in many queries. One thing I noted is that a function used in SQL should not change data, which is a limitation compared to procedures.

4. How exception handling made the functions safer

Handling errors stopped bad input from crashing the code. fn_annual_salary and fn_years_of_service handle NO_DATA_FOUND and return NULL for an unknown employee. fn_dept_name returns 'Unknown' for a missing department. fn_calculate_tax uses RAISE_APPLICATION_ERROR(-20001, ...) to reject negative or null salaries with a clear message. In C1, fn_validate_payroll combines these checks and returns either 'VALID' or a specific problem, so it's easy to see why a record failed. Testing with the deliberately invalid employee (negative salary, future hire date, no department) proved the validation works.

5. Challenges and improvements

[Write one or two real difficulties here, for example: setting up the Oracle user and connection, understanding why A3 failed, getting DBMS_OUTPUT to display, or compile errors in C1 because B3 and B4 had to exist first.] If I had more time, I would store the tax brackets in a table instead of hard-coding them, add more test cases for edge values such as exactly 60,000 and 100,000, and replace the GOTO in C1 with a structured approach to compare both versions.

Key takeaways
GOTO is legal but rarely the best option, and it has strict scope rules.
Functions are reusable and can be called from SQL.
Exception handling and testing with bad data make code reliable.
Good Git commits, a clear README and screenshots make work easy to verify.
