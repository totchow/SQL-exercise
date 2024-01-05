Create database BOOTCAMP_EXERCISE1;
use BOOTCAMP_EXERCISE1;

create table regions (
	region_id integer primary key,
    region_name varchar(25) not null
);

create table countries (
	country_id char(2) primary key,
    country_name varchar(40),
    region_id integer,
    foreign key (region_id) references regions(region_id)
);

create table locations (
	location_id integer primary key,
    street_address varchar(25),
    postal_code varchar(12),
    city varchar(30),
    state_province varchar(12),
    country_id char(2),
    foreign key (country_id) references countries(country_id) 
);

create table departments (
	department_id integer primary key,
    department_name varchar(30),
    manager_id integer,
    location_id integer,
    foreign key (location_id) references locations(location_id)
);

create table jobs (
	job_id varchar(10) primary key,
    job_title varchar(35),
    min_salary integer,
    max_salary integer
);

create table job_history (
	employee_id integer,
    start_date date,
    end_date date,
    job_id varchar(10),
    department_id integer,
	PRIMARY KEY (employee_id, start_date),
    foreign key (job_id) references jobs(job_id),
    foreign key (department_id) references departments(department_id)
);

create table employees (
	employee_id integer primary key,
    first_name varchar(20),
    last_name varchar(25),
    email varchar(25),
    phone_number varchar(20),
    hire_date date,
    job_id varchar(20),
    salary integer,
    commission_pct decimal(3,2),
    manager_id integer,
    department_id integer,
    foreign key (employee_id) references job_history(employee_id),
    foreign key (department_id) references departments(department_id)
);

insert into regions (region_id, region_name)
values (1, 'EUROPE');
insert into regions (region_id, region_name)
values (2, 'AMERICA');
insert into regions (region_id, region_name)
values (3, 'ASIA');
insert into regions (region_id, region_name)
values (4, 'OCEANIA');

insert into countries (country_id, country_name, region_id)
value ('US', 'United States', 2);
insert into countries (country_id, country_name, region_id)
value ('UK', 'United Kingdom', 1);
insert into countries (country_id, country_name, region_id)
value ('DE', 'Germany', 1);
insert into countries (country_id, country_name, region_id)
value ('IT', 'Italy', 1);
insert into countries (country_id, country_name, region_id)
value ('JP', 'Japan', 3);
insert into countries (country_id, country_name, region_id)
value ('AU', 'Australia', 4);

insert into locations (location_id, street_address, postal_code, city, state_province, country_id)
value ('1000', '1297 Via Cola di Rie', '989', 'Roma', null, 'IT');
insert into locations (location_id, street_address, postal_code, city, state_province, country_id)
value ('1100', '93091 Calle della Te', '10934', 'Venice', null, 'IT');
insert into locations (location_id, street_address, postal_code, city, state_province, country_id)
value ('1200', '2017 Shinjuku-ku', '1689', 'Tokyo', 'Tokyo', 'JP');
insert into locations (location_id, street_address, postal_code, city, state_province, country_id)
value ('1400', '2014 Jabberwocky Rd', '26192', 'Southlake York', 'Texas', 'US');
insert into locations (location_id, street_address, postal_code, city, state_province, country_id)
value ('1500', '1234 Manhattan road', '23456', 'New York City', 'New York', 'US');
insert into locations (location_id, street_address, postal_code, city, state_province, country_id)
value ('1700', 'ABC Street', 'HN3 NK7', 'London', null, 'UK');
insert into locations (location_id, street_address, postal_code, city, state_province, country_id)
value ('1900', '2780 Mulgrave', 'ABF555', 'Melbourne', 'Victoria', 'AU');


insert into departments (department_id, department_name, manager_id, location_id)
value (10, 'Administration', '200', '1100');
insert into departments (department_id, department_name, manager_id, location_id)
value (20, 'Marketing', '201', '1200');
insert into departments (department_id, department_name, manager_id, location_id)
value (30, 'Purchasing', '202', '1400');
insert into departments (department_id, department_name, manager_id, location_id)
value (50, 'Legal', '209', '1900');


insert into jobs (job_id, job_title, min_salary, max_salary)
value ('IT_PROG', 'IT Programmer', 30000, 150000);
insert into jobs (job_id, job_title, min_salary, max_salary)
value ('MK_REP', 'Marketing Representative', 17500, 120000);
insert into jobs (job_id, job_title, min_salary, max_salary)
value ('ST_CLERK', 'Standard Clerk', 8800, 50000);
insert into jobs (job_id, job_title, min_salary, max_salary)
value ('CS_REP', 'Customer Service Representative', 10000, 100000);
insert into jobs (job_id, job_title, min_salary, max_salary)
value ('S_CON', 'Senior Consultant', 60000, 250000);


insert into job_history (employee_id, start_date, end_date, job_id, department_id)
value (102, '1993-01-13', '1998-07-24', 'IT_PROG', 20);
insert into job_history (employee_id, start_date, end_date, job_id, department_id)
value (101, '1989-09-21', '1993-10-27', 'MK_REP', 10);
insert into job_history (employee_id, start_date, end_date, job_id, department_id)
value (101, '1993-10-28', '1997-03-15', 'MK_REP', 30);
insert into job_history (employee_id, start_date, end_date, job_id, department_id)
value (100, '1996-02-17', '1999-12-19', 'ST_CLERK', 30);
insert into job_history (employee_id, start_date, end_date, job_id, department_id)
value (103, '1998-03-24', '1999-12-31', 'MK_REP', 20);
insert into job_history (employee_id, start_date, end_date, job_id, department_id)
value (105, '1998-04-03', '2002-03-09', 'ST_CLERK', 20);
insert into job_history (employee_id, start_date, end_date, job_id, department_id)
value (105, '2002-03-10', '2007-01-08', 'MK_REP', 20);
insert into job_history (employee_id, start_date, end_date, job_id, department_id)
value (209, '2008-05-30', '2012-09-24', 'S_CON', 50);


insert into employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
value (100, 'Steven', 'King', 'SKING', '515-1234567', '1987-06-17', 'ST_CLERK', 24000, 0.0, 109, 10);
insert into employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
value (101, 'Neena', 'Kochhar', 'NKOCHHAR', '515-1234568', '1987-06-18', 'MK_REP', 17000, 0.0, 103, 20);
insert into employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
value (102, 'Lex', 'De Haan', 'LDEHAAN', '515-1234569', '1987-06-19', 'IT_PROG', 17000, 0.0, 108, 30);
insert into employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
value (103, 'Alexander', 'Hunold', 'AHUNOLD', '590-4234567', '1987-06-20', 'MK_REP', 9000, 0.0, 105, 20);
insert into employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
value (209, 'Chris', 'Happy', 'CHAPPY', '234-4335', '1985-11-11', 'S_COU', 125000, 0.0, null, 50);
insert into employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
value (105, 'Yamashita', 'Erika', 'YERIKA', '9209-434', '1996-07-30', 'MK_REP', 31000, 0.0, 201, 20);

select * from job_history;
select * from employees;

-- Question 3
select l.location_id, l.street_address, l.postal_code, l.city, l.state_province, c.country_name
from locations l left join countries c on l.country_id = c.country_id;

-- Question 4
select e.first_name, e.last_name, e.department_id
from employees e;

-- Question 5
select e.first_name, e.last_name, e.job_id, e.department_id
from employees e 
left join departments d on e.department_id = d.department_id
left join locations l on d.location_id = l.location_id
left join countries c on l.country_id = c.country_id
where c.country_name = 'Japan';

-- Question 6
select employee_id, last_name, manager;

-- Question 7
select first_name, last_name, hire_date
from employees
where hire_date >
(select hire_date from employees where concat(first_name, ' ' , last_name) = 'Lex De Haan');

-- Question 8
select d.department_name, count(e.employee_id) as number_of_employees
from departments d left join employees e on d.department_id = e.department_id
group by d.department_id;

-- Question 9
select jh.employee_id, js.job_title, datediff(end_date,start_date) as number_of_days
from job_history jh
inner join jobs js on jh.job_id = js.job_id
where jh.department_id = 30
;

-- Question 10


-- Question 11
select d.department_name, avg(salary) as average_salary
from employees e left join departments d
on e.department_id = d.department_id
group by e.department_id;

-- Question 12
-- modify jobs table
-- (job_id varchar(10) Primary key,
-- job_title varchar(35),
-- grade_level varchar(2),
-- Foreign key (grade_level) refereces job_grades (grade_level)
-- )


