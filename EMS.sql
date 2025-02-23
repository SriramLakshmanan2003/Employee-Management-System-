-- database creation
create database EmployeeDB;
use EmployeeDB; 

-- TABLES;
create table department(dep_id int primary key auto_increment, dep_name varchar(100) not null);
create table employee(empid int primary key auto_increment, name varchar(100), email varchar(100) unique not null, phone varchar(66), Dep_id int, hire_Date date ,salary decimal(5,2),constraint fke foreign key(Dep_id) references department(dep_id) );
create table Salaries(salary_id int primary key auto_increment, Emp_id int , basic_pay decimal(10,2), deduction decimal(10,2), net_salary decimal(10,2) generated always as (basic_pay-deduction) stored , constraint sfk foreign key(Emp_id) references employee(empid) );
create table leaves( leave_iD int primary key auto_increment, emp_id int ,leave_type enum("sick","casual","annaul"),start_date date , end_date date,status enum('appove','pending','rejected ') default 'pending', constraint lfk foreign key(emp_id ) references employee(empid) );

-- INSERTING DATA  IN TABLES;
insert into department (dep_name) values("Admin"),("hr"),("Employee");

-- alter employee table salary decimal count
alter table employee change column salary salary decimal(10,2);


insert into employee
(name , email , phone , Dep_id, hire_Date ,salary) values
("Thiru murugan","thuru@gamil.com",654798213,1,'2025-02-14',50000 ),
("Murugan","muruga@gmail.com",994134922,1,'2025-02-11',50000),
 ("Sriram","sriram@gamil.com",9710206223,3,'2025-02-14',45000),
 ("Sushmitha","sush@gmail.com",6382102166,2,'2025-02-12',48000),
("Meena","meena@gmail.com",9941134258,2,'2025-02-20',48000),
 ("Lakshma","lakshmanan@gmail.com",8838548855,3,'2025-02-01',43000),
("Mani","mani@gmail.com",9875461230,3,'2025-02-15',47000),
 ("Somu","somu@gmail.com",7894516230,3,'2025-02-15',43000),
 ("Ramu","ramu@gmail.com",9874563210,3,'2025-02-15',43000),
 ("Sonaya","sonaya@gmail.com",9564781320,2,'2025-02-13',48000),
 ("Ponaya","ponaya@gmail.com",7986452130,2,'2025-02-02',48000),
 ("Vaithiyanathan","Vaithiyanathan@gmail.com",8796541232,3,'2025-02-15',45000);
 
 
 -- INSERTING VALUES INTO SALARY TABLE
 
 insert into Salaries(Emp_id , basic_pay, deduction) values
 (1,40000,2000), 
 (2,39000,1750),
 (3,32500,1250),
 (4,35000,1550),
 (5,37500,1650),
 (6,34750.69,1650),
 (7,39670.33,1200),
 (8,34520.20,1000.75),
 (9,29999.99,1790),
 (10,33710,1100),
 (11,33600,900.66),
 (12,32500,750.66);
 
 --  ALTER LEAVE TABLE TO CALCULATE NUMBBER OF DAYS 
 alter table leaves add column  NoDays int  generated  always as (datediff(end_date,start_date)+1) stored ;
 
 -- INSERTING VALUES INTO SALARY TABLE LEAVES 
 -- emp_id int ,leave_type enum("sick","casual","annaul"),start_date date , end_date date,status enum('appove','pending','rejected ')
 
insert into leaves(emp_id  ,leave_type ,start_date  , end_date ,status ) values 
(2,"casual",'2025-02-11','2025-02-14',"pending"),
(5,"annaul",'2025-02-15','2025-02-27',"appove"),
(7,"sick",'2025-02-20','2025-02-25',"rejected "),
(9,"sick",'2025-02-24','2025-02-25',"rejected "),
(10,"annaul",'2025-02-21','2025-02-23',"pending"),
(1,"annaul",'2025-02-24','2025-02-27',"appove"),
(11,"casual",'2025-02-18','2025-02-21',"rejected"),
(6,"annaul",'2025-02-07','2025-02-14',"pending");

--  CREATING A PROCEDURE 

delimiter //
create procedure Getsalary(in emp_id int)
begin
select e.name, e.salary, s.deduction, s.net_salary from employee e inner join salaries s  on e.empid = s.emp_id where e.empid=emp_id;
end//
delimiter ;

-- CALLING A PROCEDURE
call Getsalary(1);

-- USER ROLE MANAGEMENT

-- ADMIN  ROLE (ALL ACCESS)
create user 'admin_user'@'localhost' identified by'adminadmin';
grant all privileges on employeedb.* to 'admin_user'@'localhost';

-- HR ROLE(LIMITED ACCESS)
create user'hr'@'localhost' identified by'hr1';
grant select, insert,update,delete on employeedb.employee to 'hr'@'localhost';

-- EMPLOYEE ROLE(VIEW ONLY ACCESS)
create user'employee'@'localhost' identified by 'emp1';
grant select on employeedb.employee to 'employee'@'localhost';



  
 



