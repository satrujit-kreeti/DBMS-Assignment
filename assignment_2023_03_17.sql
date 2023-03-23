
/* MySQL */

-- 1.Create tables


create table
    jobs(
        job_id int primary key,
        job_title varchar(255) not null,
        min_salary int,
        max_salary int
    );

create table
    regions(
        region_id int primary key,
        region_name varchar(255) not null
    );

create table
    countries(
        country_id int primary key,
        country_name varchar(255) not null,
        region_id int,
        Foreign Key (region_id) references regions(region_id)
    );

create table
    locations(
        location_id int primary key,
        street_address varchar(255),
        postal_code varchar(10),
        city varchar(255),
        state_province varchar(255),
        country_id int,
        foreign key (country_id) references countries(country_id)
    );

create table
    departments(
        department_id int primary key,
        department_name varchar(255),
        location_id int,
        foreign key (location_id) references locations(location_id)
    );

create table
    employees(
        employee_id int primary key,
        first_name varchar(255) not null,
        last_name varchar(255),
        email varchar(255) not null,
        phone_number varchar(255) not null,
        hire_date date,
        job_id int,
        foreign key (job_id) references jobs(job_id),
        salary INT,
        manager_id INT,
        department_id int,
        Foreign Key (department_id) REFERENCES departments(department_id)
    );

create table
    dependents (
        department_id int primary key,
        first_name varchar(255),
        last_name varchar(255),
        relationship varchar(255),
        employee_id int,
        Foreign Key (employee_id) REFERENCES employees(employee_id)
    );

-- 2. Inserting Values

insert into
    jobs(
        job_id,
        job_title,
        min_salary,
        max_salary
    )
values (1,
        'Software Engineer',
        60000,
        100000
    ), (2,
        'Product Manager',
        80000,
        120000
    ), (3, 'Data Analyst', 50000, 80000), (4,
        'Sales Representative',
        40000,
        60000
    ), (5,
        'Human Resources Specialist',
        45000,
        70000
    );

insert into
    regions (region_id, region_name)
values (1,'North America'), (2,'Europe'), (3,'Asia'), (4,'South America'), (5,'Africa');

insert into
    countries (country_id, country_name, region_id)
values (1, 'United States', 1), (2, 'Canada', 1), (3, 'Germany', 2), (4, 'United Kingdom', 2), (5, 'China', 3);

insert into
    locations(
        location_id,
        street_address,
        postal_code,
        city,
        state_province,
        country_id
    )
values (1,
        '123 Main St',
        '12345',
        'New York',
        'NY',
        1
    ), (2,
        '456 Elm St',
        '67890',
        'Toronto',
        'ON',
        2
    ), (3,
        '789 Oak St',
        '23456',
        'Berlin',
        'BE',
        3
    ), (4, 
        '1011 Maple St',
        '34567',
        'London',
        'ENG',
        4
    ), (5,
        '1213 Pine St',
        '89012',
        'Shanghai',
        'SH',
        5
    );

insert into
    departments(department_id, department_name, location_id)
values (1, 'Engineering', 1), (2,'Sales', 2), (3,'Marketing', 3), (4,'Human Resources', 4), (5,'Finance', 5);

INSERT INTO
    employees (
        employee_id,
        first_name,
        last_name,
        email,
        phone_number,
        hire_date,
        job_id,
        salary,
        manager_id,
        department_id
    )
VALUES (1,
        'John',
        'Doe',
        'johndoe@example.com',
        '555-1234',
        '2020-01-01',
        1,
        80000,
        2,
        1
    ), (2,
        'Jane',
        'Doe',
        'janedoe@example.com',
        '555-5678',
        '2020-02-01',
        2,
        100000,
        1,
        1
    ), (3,
        'Bob',
        'Smith',
        'bobsmith@example.com',
        '555-4321',
        '2020-03-01',
        3,
        60000,
        2,
        2
    ), (4,
        'Alice',
        'Johnson',
        'alicejohnson@example.com',
        '555-8765',
        '2020-04-01',
        4,
        80000,
        2,
        3
    ), (5,
        'Johne',
        'Doe',
        'johndoe@example.com',
        '555-1234',
        '2020-01-01',
        1,
        80000,
        2,
        1
    ), (6,
        'Janre',
        'Doe',
        'janedoe@example.com',
        '555-5678',
        '2020-02-01',
        2,
        100000,
        1,
        1
    ), (7,
        'Boby',
        'Smith',
        'bobsmith@example.com',
        '555-4321',
        '2020-03-01',
        3,
        60000,
        2,
        2
    ), (8,
        'Alice',
        'Johnson',
        'alicejohnson@example.com',
        '555-8765',
        '2020-04-01',
        4,
        80000,
        2,
        3
    ),(9,
        'John',
        'Doe',
        'johndoe@example.com',
        '555-1234',
        '2020-01-01',
        1,
        80000,
        2,
        1
    ), (10,
        'Jane',
        'Doe',
        'janedoe@example.com',
        '555-5678',
        '2020-02-01',
        2,
        100000,
        1,
        1
    );

-- 3. Operations

-- (a)

alter table departments add column manager_name varchar(255);

-- (b)

alter table jobs drop column max_salary;
-- (c)
alter table locations rename column postal_code to pincode;

-- 4.Constratints

-- (a)

alter table employees
alter column first_name set not null,
alter column last_name set not null;

alter table employees
alter column first_name set not null,
alter column last_name set not null;

-- (b)

alter table jobs add check(min_salary>1000);

-- (c)

alter table locations modify postal_code varchar(10);
