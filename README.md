# Employee-Management-System-
Employee Management System (EMS) 

📌 Overview

The Employee Management System (EMS) is a MySQL-based solution designed to manage employee data, payroll, attendance, and performance efficiently. It automates HR tasks using stored procedures, triggers, and generated columns to ensure accuracy and seamless workforce management.

🔑 Key Features

Employee Data Management – Securely store and manage employee records.

Payroll Processing – Auto-calculate salaries, deductions, and net pay.

Attendance & Leave Tracking – Automated leave calculations using MySQL functions.

Stored Procedures  – Automate business logic and ensure data consistency.

🛠️ Technologies Used

Database: MySQL

Queries: Stored Procedures, Joins, and Generated Columns

📂 Database Schema

The system includes the following tables:

Employees (empid int primary key auto_increment , name varchar(30), email varchar(30) unique not null, phone varchar(10), Dep_id int, hire_Date date ,salary decimal(5,2))

Salaries (salary_id int primary key  auto_increment, Emp_id int , basic_pay decimal(10,2), deduction decimal(10,2), net_salary decimal(10,2))

leaves( leave_iD int primary key auto_increment, emp_id int ,leave_type enum("sick","casual","annaul"),start_date date , end_date date,status enum('appove','pending','rejected ') default 'pending')

department(dep_id int **primary key** auto_increment, dep_name varchar(100) )

🤝 Contributing

Feel free to fork this repository, submit issues, or create pull requests. Let's build together...!



