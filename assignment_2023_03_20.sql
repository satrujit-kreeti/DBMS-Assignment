/* MySQL */

/* 1. */
select * from employees where lastname like 'Sah%';

/* 2. */
select * from employees
where hire_date between '2021-06-01' and '2022-02-15'
limit 10 offset 3;

/* 3. */

select distinct salary as Top5salaries
from Employees
order by salary DESC
limit 5;

/* 4 */

select first_name, last_name, email
from employees
where salary between 25000 and 45000;

/* 5 */

select first_name, manager_id, salary
from employees
where department_id =101
order by salary asc;

/* 6 */

select first_name, last_name
from employees
where first_name like 'A%' and last_name like '_TH%';

