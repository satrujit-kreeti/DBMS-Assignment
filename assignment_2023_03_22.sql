/* My SQL */

/* (1) */

select concat(e.first_name, ' ', e.last_name) as full_name,
       e.email,
       e.salary,
       d.department_name,
       l.postal_code,
       l.city
from employees e
JOIN departments d on e.department_id = d.department_id
JOIN locations l on d.location_id = l.location_id
where e.employee_id = 1;


/* (2) */

select d.department_name,
       l.state_province,
       l.street_address
from departments d
join locations l on d.location_id = l.location_id
join countries c on l.country_id = c.country_id
join regions r on c.region_id = r.region_id
where r.region_name in ('Jammu Kashmir', 'Jharkhand');


/* (3) */

select count(e.employee_id) as employee_count, 
       j.job_title as job_name, 
       avg(e.salary) as avg_salary
from employees e
join jobs j on e.job_id = j.job_id
group by j.job_id
having avg(e.salary) > 10000;

/* (4) */

select first_name, last_name
from employees
union all
select first_name, last_name
from dependents
order by last_name desc;

/* (5) */

select e1.first_name, e1.last_name, e1.email, e1.manager_id, e2.first_name as manager_first_name, e2.last_name as manager_last_name
from employees e1
join employees e2 on e1.manager_id = e2.employee_id
where CONCAT(e2.first_name, ' ', e2.last_name) = e1.first_name

/* (6) */

select d.department_name, l.city as location, COUNT(*) as employee_count
from departments d
join employees e on d.department_id = e.department_id
join locations l on d.location_id = l.location_id
where e.salary > 50000 and l.state_province in ('New York', 'California')
group by d.department_name, l.city
having count(*) > 5;

/* (7) */

select e.employee_id, e.first_name, e.last_name, j.job_title, d.department_name 
from employees e
join departments d on e.department_id = d.department_id
inner join dependents dp on e.employee_id = dp.employee_id
join jobs j on e.job_id = j.job_id 
where j.job_title like '%manager%' 
order by d.department_name asc;


/* (8) */

/* Added city column in dependents */
alter table dependents
add column city VARCHAR(255);

/* Added data into dependent column */
insert into dependents (city) values
('New York'),
('San Francisco',),
('Boston'),
('Washington DC'),
('Los Angeles',),
('Chicago'),
('Dallas');

/* Query */
select e.employee_id, e.first_name, e.last_name, e.salary, d.department_name, l.city, dp.city as dependent_city
from employees e
join departments d on e.department_id = d.department_id
join locations l on d.location_id = l.location_id
join employees m on e.manager_id = m.employee_id
join jobs j on e.job_id = j.job_id
join dependents dp on e.employee_id = dp.employee_id
where dp.city <> l.city
and e.hire_date >= DATE_SUB(CURDATE(), INTERVAL 3 YEAR)
and j.job_title = 'developer'
and e.salary > (select AVG(salary) from employees where job_id = j.job_id)
and m.job_id in (select job_id from jobs where job_title like '%director%')
order by d.department_name asc;