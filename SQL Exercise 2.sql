CREATE DATABASE ORG;
SHOW DATABASES;
USE ORG;

CREATE TABLE WORKER (
WORKER_ID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY NUMERIC(15),
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);

INSERT INTO WORKER
(FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
('Monica', 'Arora', 100000, '21-02-20 09:00:00', 'HR'),
('Niharika', 'Verma', 80000, '21-06-11 09:00:00', 'Admin'),
('Vishal', 'Singhal', 300000, '21-02-20 09:00:00', 'HR'),
('Mohan', 'Sarah', 300000, '12-03-19 09:00:00', 'Admin'),
('Amitabn', 'Singh', 500000, '21-02-20 09:00:00', 'Admin'),
('Vivek', 'Bhati', 490000, '21-06-11 09:00:00', 'Admin'),
('Vipul', 'Diwan', 200000, '21-06-11 09:00:00', 'Account'),
('Satish', 'Kumar', 75000, '21-01-20 09:00:00', 'Account'),
('Geetika', 'Chauhan', 90000, '21-04-11 09:00:00', 'Admin');



CREATE TABLE BONUS (
WORKER_REF_ID INTEGER,
BONUS_AMOUNT NUMERIC(10),
BONUS_DATE DATETIME,
FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker (WORKER_ID)
);

select * from worker;

-- Task 1
Insert into Bonus 
(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) Values
(6, 32000, '21-11-02'),
(6, 20000, '22-11-02'),
(5, 21000, '21-11-02'),
(9, 30000, '21-11-02'),
(8, 4500, '22-11-02');


-- Task 2
With max as (select max(salary) as max_salary
from worker
)

select max(w.salary) as 2nd_max
from worker w, max m
where w.salary <> m.max_salary
;

-- Task 3
With max_salary as (select  max(salary) as max_salary, w.department
from worker w 
group by department
)

select w.first_name, w.salary, w.department
from worker w, max_salary m
where w.salary = m.max_salary 
and w.department = m.department
;

-- Task 4
with same_salary as (select salary
from worker
group by salary
having count(first_name) > 1
)

select w.*
from worker w, same_salary s
where w.salary <> s.salary
;

-- Task 5
With bonusyear as (select *, extract(year from bonus_date) as year
from bonus
)

select w.first_name, w.last_name, w.salary, b.bonus_amount, b.year
from worker w inner join bonusyear b
where w.worker_id = b.worker_ref_id
and b.year = '2021';

-- Task 6
-- delete from worker;
-- some worker_id in worker table is the foreign key in bonus table, so cannot delete

-- Task 7
-- drop table worker;
-- same reason, some worker_id is the foreign key in table bonus, so cannot drop
