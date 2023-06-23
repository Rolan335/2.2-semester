create database employee_db_2r1;
use employee_db_2r1;

create table Employee
(
	ID_Employee int not null auto_increment primary key,
    Second_Name varchar(30) not null,
    First_Name varchar(30) not null,
    Middle_Name varchar(30) null default 'Нет данных',
    Employee_Phone varchar(17) not null unique check
    (regexp_like(Employee_Phone,'\\+7\\([0-9]{3}\\)[0-9]{3}\\-[0-9]{2}\\-[0-9]{2}'))
);