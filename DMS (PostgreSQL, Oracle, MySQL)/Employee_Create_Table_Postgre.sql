create table Employee
(
	ID_Employee SERIAL not null constraint PK_Employee primary key,
	Second_Name varchar (30) not null,
	First_Name varchar (30) not null,
	Middle_Name varchar (30) null default ('Нет данных'),
	Employee_Phone varchar(19) not null constraint UQ_Employee_Phone unique
	constraint CH_Employee_Phone check (Employee_Phone similar to
									   '\+7\([0-9]{3}\)[0-9]{3}\-[0-9]{2}\-[0-9]{2}')
);