--- Table of students for the university program.

create table students (
    id int primary key not null,
    first_name varchar(30) not null,
    last_name varchar(30) not null,
    birth_date date not null,
    email varchar(100),
    phone varchar(30),
    insert_date date default sysdate
);


/* Departments and the number of employees working in them,
where this number is more than 10 */

select department_id, count(*) as employee
  from hr.employees
 group by department_id
having count(*) > 10;

-- IDs of all managers and the average salaries of their subordinates

select manager_id, avg(salary) from employees 
group by manager_id

/*
 job IDs from the "employees" table 
 where the difference between the maximum and average salary is greater
 than the difference between the average and minimum salary
 
*/

select job_id
  from employees e
 group by job_id
having(max(e.salary) - avg(e.salary)) &gt;
(avg(e.salary) - min(e.salary))

/* 
Formatted employee names, 
months worked, and bonus amounts from the "employees" table
*/

select rpad(substr(first_name, 1, 1), length(first_name), '*') || ' ' ||
       lpad(substr(last_name, -1, length(last_name) - 1),
            length(last_name),
            '*') as name,
       round(months_between(sysdate, hire_date)) as months_worked,
       to_char(salary * nvl(commission_pct, 0.20), '$99,999,999.99') as bonus
  from employees
 where extract(year from hire_date) < extract(year from sysdate) - 10
   and salary between 5000 and 20000
   and department_id in (20, 50, 60, 100)
 order by bonus desc;
 
/*
Name of the city,
The country where this city is located,
The number of departments and how many employees work in it.
*/

select l.city,
       c.country_name,
       count(distinct d.department_id),
       count(distinct e.employee_id)
  from locations l
  left join countries c
    on l.country_id = c.country_id
  left join departments d
    on l.location_id = d.location_id
  left join employees e
    on e.department_id = d.department_id
 group by l.city, c.country_name



