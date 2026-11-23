CREATE DATABASE interview_commands_practice;
USE interview_commands_practice;
SET autocommit = 1;

CREATE TABLE employees (
employee_id INT PRIMARY KEY,
employee_name VARCHAR(60),
department VARCHAR(30),
city VARCHAR(40),
salary DECIMAL(10, 2),
employment_status VARCHAR(15),
phone VARCHAR(15)
)ENGINE = InnoDB;

INSERT INTO employees
(employee_id, employee_name, department, city,
salary, employment_status, phone)
VALUES
(1, 'Rahul Sharma', 'IT', 'Delhi', 45000.00, 'Active', '9000000001'),
(2, 'Priya Verma', 'HR', 'Mumbai', 42000.00, 'Active', '9000000002'),
(3, 'Amit Patel', 'Sales', 'Ahmedabad', 38000.00, 'Inactive', '9000000003'),
(4, 'Anjali Singh', 'IT', 'Kolkata', 50000.00, 'Active', '9000000004'),
(5, 'Vijay Kumar', 'Finance', 'Bangalore', 55000.00, 'Active', '9000000005'),
(6, 'Sanjay Reddy', 'Sales', 'Hyderabad', 36000.00, 'Active', '9000000006'),
(7, 'Megha Iyer', 'IT', 'Chennai', 48000.00, 'Active', '9000000007'),
(8, 'Neha Gupta', 'HR', 'Delhi', 32000.00, 'Inactive', '9000000008'),
(9, 'Arjun Mehta', 'Finance', 'Pune', 52000.00, 'Active', '9000000009'),
(10, 'Pooja Shah', 'Sales', 'Mumbai', 40000.00, 'Active', '9000000010');
COMMIT;

select* from employees;

-- #1
Insert into employees values (11, 'Karan Malhotra', 'IT', 'Noida' , 41000.00, 'Active', '9000000011');

-- #2
INSERT INTO employees
(employee_id, employee_name, department, city,
salary, employment_status, phone)
VALUES
(12, 'Simran Kaur', 'HR', 'Delhi', 35000.00, 'Active', '9000000012'),
(13, 'Rohan Das', 'Sales', 'Pune', 33000.00, 'Inactive', '9000000013');

-- #3
update employees
set city='Gurgaon' , salary=46000.00
where employee_id=11;

-- #4
Update employees
set salary= salary*1.10
where employee_id in (1,4,7);

-- #5
delete from employees
where employee_id in(3,8,13);

-- #6
Alter table employees
add column Email varchar(100);

-- #7
Alter table employees
modify phone varchar(20);

-- #8
Alter table employees
change column city work_city varchar(40);

-- #9
Alter table employees
Drop column Email;

-- #10
Alter table employees
Rename to staff;

select * from staff;

-- #11

START TRANSACTION;
-- insert
INSERT INTO staff VALUES (14, 'Nisha Rao', 'IT', 'Noida', 44000.00, 'Active', '9000000014');
-- update
UPDATE staff
SET salary = 45000.00
WHERE employee_id = 2;

COMMIT;
SELECT * FROM STAFF;
ROLLBACK;              -- ( Rollback cannot undo(unchangesd)  because here already commited)
SELECT * FROM STAFF
WHERE employee_id in (2,14);  

-- #12
START TRANSACTION;
-- update
UPDATE staff
SET salary = 60000.00
WHERE employee_id = 5;
-- Delete
DELETE FROM staff
WHERE employee_id = 6;

select * from staff;

Rollback;     # here not changed

-- #13

Start Transaction;
-- salary update
UPDATE staff
SET salary = 47000.00
WHERE employee_id = 14;

SAVEPOINT salary_saved;
-- city update
UPDATE staff
SET work_city = 'Jaipur'
WHERE employee_id = 14;

SAVEPOINT city_saved;
-- delete emp 14
DELETE FROM staff
WHERE employee_id = 14;     -- emp 14 deleted

ROLLBACK TO SAVEPOINT city_saved;   -- wapas aa gya (deletion undo)

select * from staff;

-- undo city changes
ROLLBACK TO SAVEPOINT salary_saved;

COMMIT;
SELECT * FROM staff
WHERE employee_id = 14;

-- #14

START TRANSACTION;
Truncate table staff;
select * from staff;
Rollback;   -- truncate karne ke baad data wapas nhi aata h transaction rollback select

-- #15
DROP TABLE staff;
DROP DATABASE interview_commands_practice;




