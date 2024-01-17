-- SQL excercise 3

CREATE DATABASE EX3;
SHOW DATABASES;
USE EX3;

-- Question 1a
CREATE TABLE customer (
id integer PRIMARY KEY,
customer_name varchar(255) not null,
city_id integer,
customer_address varchar(255) not null,
contact_person varchar(255),
email varchar(128) not null,
phone varchar(128) not null
);

CREATE TABLE product (
id integer PRIMARY KEY,
sku varchar(32) not null,
product_name varchar(128) not null,
product_description text not null,
current_price decimal(8,2) not null,
quantity_in_stock integer
);

CREATE TABLE invoice (
id integer PRIMARY KEY,
invoice_number varchar(255) not null,
customer_id integer,
user_account_id integer,
total_price decimal(8,2) not null,
time_issued varchar(25),
time_due varchar(25),
time_paid varchar(25),
time_canceled varchar(25),
time_refunded varchar(25),
foreign key (customer_id) references customer(id)
);

CREATE TABLE invoice_item (
id integer PRIMARY KEY,
invoice_id integer not null,
product_id integer not null,
quantity integer not null,
price decimal(8,2) not null,
line_total_price decimal(8,2) not null,
foreign key (invoice_id) references invoice(id),
foreign key (product_id) references product(id)
);

-- Question 1b
delete from customer;
insert into customer values
(1, 'Drogerie Wien', 1, 'Deckergasse 15A', 'Emil Steinbach', 'abc@gmail.com', 12345678);
insert into customer values
(2, 'John', 4, 'Deckergasse 1A', '9upper', 'abck@gmail.com', 12345567);
insert into customer values
(3, 'Mary', 8, 'Deckergasse 18A', '9upper', 'abcd@gmail.com', 1234556789);

delete from product;
insert into product values
(1, '330120', '9up Product', 'Completely 9up', 60, 122);
insert into product values
(2, '330121', '9upper Product', 'Completely 9upper', 50, 50);
insert into product values
(3, '330122', '9upper Products', 'Super 9upper', 40, 600);
insert into product values
(4, '330123', '9upper Productss', 'Super completely 9upper', 30, 500);

delete from invoice;
insert into invoice values
(1, 123456780, 2, 41, 1423, NULL, NULL, NULL, NULL, NULL);
insert into invoice values
(2, 123456780, 3, 42, 1400, NULL, NULL, NULL, NULL, NULL);
insert into invoice values
(3, 123456780, 2, 43, 17000, NULL, NULL, NULL, NULL, NULL);

delete from invoice_item;
insert into invoice_item values
(1, 1, 1, 40, 23, 920);
insert into invoice_item values
(2, 1, 2, 4, 20, 80);
insert into invoice_item values
(3, 1, 3, 4, 10, 40);
insert into invoice_item values
(4, 1, 2, 4, 30, 120);

-- Question 1c
select 'customer', id, customer_name as name
from customer
where id not in (select distinct customer_id from invoice)
UNION
select 'product', id, product_name as name
from product
where id not in (select distinct product_id from invoice_item);

-- Question 2
Create table employee (
id integer not null auto_increment primary key,
employee_name varchar(30) not null,
salary numeric(8,2),
phone numeric(15),
email varchar(50),
dept_id integer not null
);

Create table department (
id integer not null auto_increment primary key,
dept_code varchar(3) not null,
dept_name varchar(200) not null
);

delete from employee;
insert into employee values (1, 'John', 20000, 90234567, 'John@gmail.com', 1);
insert into employee values (2, 'Mary', 10000, 90234561, 'Mary@gmail.com', 1);
insert into employee values (3, 'Steve', 30000, 90234562, 'Steve@gmail.com', 3);
insert into employee values (4, 'Sunny', 40000, 90234563, 'Sunny@gmail.com', 4);

delete from department;
insert into department values (1, 'HR', 'Human Resources');
insert into department values (2, '9UP', '9UP Department');
insert into department values (3, 'SA', 'Sales Department');
insert into department values (4, 'IT', 'Infomation Technology');

-- 2a
select d.dept_code as Department_Code, ifnull(count(employee_name),0) as Number_of_Employee
from department d left join employee e
on d.id = e.dept_id
group by d.id
order by Number_of_Employee desc, Department_Code;

-- 2b
delete from department where id = 5;
insert into department values (5, 'IT', 'Information Technology Department');
-- still work