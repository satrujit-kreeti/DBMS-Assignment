/* My SQL */

/* 1 */
select departments.department_name as department, sum(employees.salary) as total_salary
from departments, employees
where departments.department_id = employees.department_id

group by departments.department_name
order by total_salary;

/* 2 */

select departments.department_name as department, count(employees.employee_id) as No_of_employee ,sum(employees.salary) as total_salary
from departments, employees
where departments.department_id = employees.department_id

group by departments.department_name
order by total_salary;


/* 3 */

select departments.department_name as department, max(employees.salary) as max_salary
from departments, employees
where departments.department_id = employees.department_id

group by departments.department_name
order by max_salary asc;

/* 4 */

select department_name as department from departments
where department_id in (
    select department_id from employees
    group by department_id
    having avg(salary) >60000
);

/* 5 */

select department_name as department from departments, employees
where departments.department_id = employees.department_id
group by departments.department_name
having count(employees.employee_id) >1;

/* 6 */

select departments.department_name,
    case
        when count(employees.employee_id)=1 then 'One Candidate'
        else 'Multiple Candidate'
    end as assignedTo

from departments,employees
where departments.department_id = employees.department_id
group by departments.department_name;