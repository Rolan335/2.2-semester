Create table Client(
	ID_Client Serial not null CONSTRAINT PK_Client PRIMARY KEY,
	Client_Organization_Name varchar(100) not null,
	Client_Legal_Address varchar(100) null default '-',
	Client_Physical_Address varchar(100) not null,
	Client_ITN varchar(10) not null UNIQUE,
	Client_BIC varchar(9) not null UNIQUE,
	Client_OKPO varchar(10) not null UNIQUE,
	Client_Repr_Surname varchar(30) not null,
	Client_Repr_Name varchar(30) not null,
	Client_Repr_Second_Name varchar(30) null default '-'
	CHECK(Client_ITN similar to '[0-9]{10}')
	CHECK(Client_BIC similar to '[0-9]{9}')
	CHECK(Client_OKPO similar to '[0-9]{8}|[0-9]{10}')
)

Create table Manager(
	ID_Manager Serial not null CONSTRAINT PK_Manager PRIMARY KEY,
	Manager_Surname varchar(30) not null,
	Manager_Name varchar(30) not null,
	Manager_Second_Name varchar(30) null default '-',
	Manager_Passport_Series varchar(4) not null,
	Manager_Passport_Number varchar(6) not null,
	Manager_ITN varchar(10) not null UNIQUE,
	Manager_SNILS varchar(14) not null UNIQUE
	CHECK(Manager_Passport_Series similar to '[0-9]{4}')
	CHECK(Manager_Passport_Number similar to '[0-9]{6}')
	CHECK(Manager_ITN similar to '[0-9]{10}')
	CHECK(Manager_SNILS similar to '^\d\d\d\-\d\d\d\-\d\d\d \d\d$')
)

Create table Driver(
	ID_Driver Serial not null CONSTRAINT PK_Driver PRIMARY KEY,
	Driver_Surname varchar(30) not null,
	Driver_Name varchar(30) not null,
	Driver_Second_Name varchar(30) null default '-',
	Driver_Passport_Series varchar(4) not null,
	Driver_Passport_Number varchar(6) not null,
	Driver_SNILS varchar(14) not null UNIQUE,
	Driver_FFOMI varchar(16) not null UNIQUE,
	Driver_License_Series varchar(4) not null,
	Driver_License_Number varchar(6) not null
	CHECK(Driver_Passport_Series similar to '[0-9]{4}')
	CHECK(Driver_Passport_Number similar to '[0-9]{6}')
	CHECK(Driver_SNILS similar to '^\d\d\d\-\d\d\d\-\d\d\d \d\d$')
	CHECK(Driver_FFOMI similar to '[0-9]{16}')
	CHECK(Driver_License_Series similar to '[0-9]{4}')
	CHECK(Driver_License_Number similar to '[0-9]{6}')
);

Create table Vehicle
(
        	ID_Vehicle Serial not null CONSTRAINT PK_Vehicle PRIMARY KEY,
        	Vehicle_Width int not null,
        	Vehicle_Height int not null,
       	Vehicle_Length int not null,
       	Vehicle_Capacity int not null,
       	Vehicle_State_Number varchar(10) not null
	CHECK(Vehicle_State_Number similar to '\w\w\d\d\d\w\s\d\d')
);

Create table Complexity
(
        	ID_Complexity Serial not null CONSTRAINT PK_Complexity PRIMARY KEY,
        	Complexity_Level int not null UNIQUE
);

Create table Request(
	ID_Request Serial not null CONSTRAINT PK_Request PRIMARY KEY,
	Request_Number Serial not null,
	Manager_ID int not null references Manager (ID_Manager),
	Client_ID int not null references Client (ID_Client),
	Request_Date date null DEFAULT(now()::DATE),
	Request_Time TIME null DEFAULT(now()::TIME)
);

Create table Cargo(
	ID_Cargo Serial not null CONSTRAINT PK_Cargo PRIMARY KEY,
	Cargo_Description varchar(200) not null,
	Request_ID int not null references Request (ID_Request),
	Cargo_Width int not null,
	Cargo_Height int not null,
	Cargo_Length int not null,
	Cargo_Weight int not null,
	Cargo_Price int null default 0
);

Create table Delivery_Point(
	ID_Delivery_Point Serial not null CONSTRAINT PK_Delivery_Point PRIMARY KEY,
	Delivery_Point_Mark varchar(1) null default '-',
	Request_ID int not null references Request (ID_Request),
	Delivery_Point_Destination varchar(200) not null
	CHECK(Delivery_Point_Mark similar to '[+]|[-]')
);

Create table Route_Sheet(
	ID_Route_Sheet Serial not null CONSTRAINT PK_Route_Sheet PRIMARY KEY,
	Route_Sheet_Number Serial not null,
	Complexity_ID int not null references Complexity (ID_Complexity),
	Vehicle_ID int not null references Vehicle (ID_Vehicle),
	Driver_ID int not null references Driver (ID_Driver),
	Route_Sheet_Date Date null DEFAULT(now()::DATE),
);

Create table Combination_Route_Sheet_Delivery_Point(
	ID_Combination_Route_Sheet_Delivery_Point Serial not null CONSTRAINT PK_Combination_Route_Sheet_Delivery_Point PRIMARY KEY,
	Route_Sheet_ID int not null references Route_Sheet (ID_Route_Sheet),
	Delivery_Point_ID int not null references Delivery_Point (ID_Delivery_Point)
);

Create table Combination_Route_Sheet_Cargo(
	ID_Combination_Route_Sheet_Cargo Serial not null CONSTRAINT PK_Combination_Route_Sheet_Cargo PRIMARY KEY,
	Route_Sheet_ID int not null references Route_Sheet (ID_Route_Sheet),
	Cargo_ID int not null references Cargo (ID_Cargo)
);


