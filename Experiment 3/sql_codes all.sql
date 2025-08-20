-- q1
create table employ (
    emp_id int,
    empname varchar(50),
    gender varchar(10),
    salary int,
    city varchar(50),
    dept_id int
);

insert into employ(emp_id, empname, gender, salary, city, dept_id)
values
(1, 'amit', 'male', 50000, 'delhi', 2),
(2, 'priya', 'female', 60000, 'mumbai', 1),
(3, 'rajesh', 'male', 45000, 'agra', 3),
(4, 'sneha', 'female', 55000, 'delhi', 4),
(5, 'anil', 'male', 52000, 'agra', 2),
(6, 'sunita', 'female', 48000, 'mumbai', 1),
(7, 'vijay', 'male', 47000, 'agra', 3),
(8, 'ritu', 'female', 62000, 'mumbai', 2),
(8, 'alok', 'male', 51000, 'delhi', 1),
(9, 'neha', 'female', 53000, 'agra', 4),
(9, 'simran', 'female', 33000, 'agra', 3);

select max(emp_id)
from (select emp_id from employ group by emp_id having count(emp_id) = 1
) as u;



-- q2
create table employees (
    id int,
    name varchar(50),
    salary int,
    dept_id int
);

create table departments (
    id int,
    dept_name varchar(50)
);

insert into employees values (1, 'joe', 70000, 1);
insert into employees values (2, 'jim', 90000, 1);
insert into employees values (3, 'henry', 80000, 2);
insert into employees values (4, 'sam', 60000, 2);
insert into employees values (4, 'max', 90000, 1);

insert into departments values (1, 'it');
insert into departments values (2, 'sales');

select d.dept_name, e.name, e.salary
from employees e
join departments d on e.dept_id = d.id
where e.salary = (select max(salary) from employees e2 where e2.dept_id = e.dept_id)
order by d.dept_name;


-- q3
create table A (
    EmpID int,
    Ename varchar(20),
    Salary int
);

create table B (
    EmpID int,
    Ename varchar(20),
    Salary int
);

insert into A values (1, 'qwe', 1000);
insert into A values (2, 'rty', 300);

insert into B values (2, 'rty', 400);
insert into B values (1, 'qwe', 100);

select EmpID, Ename, min(Salary) as Salary
from (select * from A union all select * from B) merged
group by EmpID, Ename
order by EmpID;
