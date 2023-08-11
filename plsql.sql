--- Arithmetic mean.

DECLARE
  var_one   number := 19;
  var_two   number := 9;
  output number;
BEGIN
  output := (var_one + var_two) / 2;
  DBMS_OUTPUT.PUT_LINE(output);
END;

--- The maximum, minimum, and average salaries from the "employees" table

DECLARE
  max_salary number;
  min_salary number;
  avg_salary number;

BEGIN
  select max(salary), avg(salary), min(salary)
    into max_salary, avg_salary, min_salary
    from employees;

  dbms_output.put_line('Maximum Salary: ' || max_salary);
  dbms_output.put_line('Minimum Salary: ' || min_salary);
  dbms_output.put_line('Average Salary: ' || avg_salary);

END;


--- The sum of all digits.

declare
  var_one number := 9999;
  digits  number := 0;
  output  number := 0;
begin
  for i in 1 .. length(var_one) loop
    digits := substr(var_one, i, 1);
    output := output + digits;
  end loop;
  dbms_output.put_line(output);
end;
