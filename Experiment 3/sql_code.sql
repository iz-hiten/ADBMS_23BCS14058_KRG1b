-- q1
create table employee (
    empid int primary key,
    ename varchar(50),
    department varchar(50),
    managerid int,
    foreign key (managerid) references employee(empid)
);

insert into employee values (1, 'hiten', 'hr', null);
insert into employee values (2, 'bob', 'finance', 1);
insert into employee values (3, 'charlie', 'it', 1);
insert into employee values (4, 'david', 'finance', 2);
insert into employee values (5, 'eve', 'it', 3);
insert into employee values (6, 'frank', 'hr', 1);

select e.ename as employeename,e.department as employeedept,m.ename as managername,m.department as managerdept
from employee e left join employee m on e.managerid = m.empid
order by e.empid;


-- q2
create table year_tbl (
    id int,
    year int,
    npv int
);

create table queries_tbl (
    id int,
    year int
);

insert into year_tbl values (1, 2018, 100);
insert into year_tbl values (7, 2020, 30);
insert into year_tbl values (13, 2019, 40);
insert into year_tbl values (1, 2019, 113);
insert into year_tbl values (2, 2008, 121);
insert into year_tbl values (3, 2009, 12);
insert into year_tbl values (11, 2020, 99);
insert into year_tbl values (7, 2019, 0);

insert into queries_tbl values (1, 2019);
insert into queries_tbl values (2, 2008);
insert into queries_tbl values (3, 2009);
insert into queries_tbl values (7, 2018);
insert into queries_tbl values (7, 2019);
insert into queries_tbl values (7, 2020);
insert into queries_tbl values (13, 2019);

select q.id, q.year, isnull(y.npv, 0) as npv
from queries_tbl q left join year_tbl y
on q.id = y.id and q.year = y.year
order by q.id, q.year;


-- q3
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


-- q4
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
