DELIMITER //
CREATE PROCEDURE Client_Update(in p_ID_Client int,in p_Client_Organization_Name varchar(100),in p_Client_Legal_Address varchar(100),
									in p_Client_Physical_Address varchar(100), in p_Client_ITN varchar(10), in p_Client_BIC varchar(9), in p_Client_OKPO varchar(10),
									in p_Client_Repr_Surname varchar(30), in p_Client_Repr_Name varchar(30), in p_Client_Repr_Second_Name varchar(30))
begin
	declare p_Exists_Record smallint;
	declare exit handler for 1406
    begin
        select 'Данные не могут быть добавлены. Данные слишком длинные';
	end;
	declare exit handler for 3819
    begin
        select 'Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку';
	end;
    declare exit handler for 1062
    begin
        select 'Введённый данные не являются уникальными';
	end;
    select count(*) into p_Exists_Record from Client where ID_Client = p_ID_Client;
		if p_Exists_Record = 0 then
			select 'Невозможно обновить данные. Клиента с введёным идентификатором не существует';
			
		else
				update Client set
						Client_Organization_Name = p_Client_Organization_Name,
						Client_Legal_Address = p_Client_Legal_Address,
						Client_Physical_Address = p_Client_Physical_Address,
						Client_ITN = p_Client_ITN,
						Client_BIC = p_Client_BIC,
						Client_OKPO = p_Client_OKPO,
						Client_Repr_Surname = p_Client_Repr_Surname,
						Client_Repr_Name = p_Client_Repr_Name,
						Client_Repr_Second_Name = p_Client_Repr_Second_Name
							where ID_Client = p_ID_Client;
		end if;
	end;
DELIMITER /


DELIMITER // 
Create procedure Client_Insert (in p_Client_Organization_Name varchar(100),in p_Client_Legal_Address varchar(100),
									in p_Client_Physical_Address varchar(100), in p_Client_ITN varchar(10), in p_Client_BIC varchar(9), in p_Client_OKPO varchar(10),
									in p_Client_Repr_Surname varchar(30), p_Client_Repr_Name varchar(30), in p_Client_Repr_Second_Name varchar(30) )
	begin
		declare p_Exists_Record smallint;
    declare exit handler for 1406
    begin
        select 'Данные не могут быть добавлены. Данные слишком длинные';
	end;
	declare exit handler for 3819
    begin
        select 'Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку';
	end;
    declare exit handler for 1062
    begin
        select 'Введённый данные не являются уникальными';
	end;
        select count(*) into p_Exists_Record from Client where Client_ITN = p_Client_ITN and 
																   Client_BIC = p_Client_BIC and 
																   Client_OKPO = p_Client_OKPO;
		if p_Exists_Record > 0 then
			select 'Клиент с введёнными данными уже есть в системе';
		else
			Insert into Client (Client_Organization_Name, Client_Legal_Address, Client_Physical_Address, Client_ITN, Client_BIC, Client_OKPO, Client_Repr_Surname, Client_Repr_Name, Client_Repr_Second_Name)
			values (p_Client_Organization_Name,p_Client_Legal_Address,
									p_Client_Physical_Address, p_Client_ITN, p_Client_BIC, p_Client_OKPO,
									p_Client_Repr_Surname, p_Client_Repr_Name, p_Client_Repr_Second_Name);
		end if;

	end; 
DELIMITER /



DELIMITER // 
Create procedure Client_Delete (in p_ID_Client int)
	begin
    if EXISTS(select * from request where Client_ID = p_ID_Client) then
		select 'Данные не могут быть удалены так как на них ссылаются значения из других таблиц';
	else
	  delete from client where ID_Client = p_ID_Client;
	end if;
	end;
DELIMITER / 





--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------




DELIMITER // 
Create procedure Manager_Update (in p_ID_Manager int, in p_Manager_Surname varchar(30), in p_Manager_Name varchar(30), in p_Manager_Second_Name varchar(30),
										   in p_Manager_Passport_Series varchar(4), in p_Manager_Passport_Number varchar(6), in p_Manager_ITN varchar(10), 
											in P_Manager_SNILS varchar(14))
	begin
	declare p_Exists_Record smallint;
    declare exit handler for 1406
    begin
        select 'Данные не могут быть добавлены. Данные слишком длинные';
	end;
	declare exit handler for 3819
    begin
        select 'Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку';
	end;
    declare exit handler for 1062
    begin
        select 'Введённый данные не являются уникальными';
	end;  
    select count(*) into p_Exists_Record from Manager where ID_Manager = p_ID_Manager;
		if p_Exists_Record = 0 then
			select 'Невозможно обновить данные. Менеджера с введёным идентификатором не существует';
			
		else
				update Manager set
					Manager_Surname = p_Manager_Surname,
					Manager_Name = p_Manager_Name,
					Manager_Second_Name = p_Manager_Second_Name,
					Manager_Passport_Series = p_Manager_Passport_Series,
					Manager_Passport_Number = p_Manager_Passport_Number,
					Manager_ITN = p_Manager_ITN,
					Manager_SNILS = p_Manager_SNILS
						where ID_Manager = p_ID_Manager;
		end if;
	end; 
DELIMITER /





DELIMITER // 
Create procedure Manager_Insert (in p_Manager_Surname varchar(30), in p_Manager_Name varchar(30), in p_Manager_Second_Name varchar(30),
										in p_Manager_Passport_Series varchar(4), in p_Manager_Passport_Number varchar(6), in p_Manager_ITN varchar(10), 
											in p_Manager_SNILS varchar(14))


		
	begin
    declare p_Exists_Record smallint; 
    declare exit handler for 1406
    begin
        select 'Данные не могут быть добавлены. Данные слишком длинные';
	end;
	declare exit handler for 3819
    begin
        select 'Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку';
	end;
    declare exit handler for 1062
    begin
        select 'Введённый данные не являются уникальными';
	end; 
        select count(*)  into p_Exists_Record from Manager where Manager_ITN = p_Manager_ITN and Manager_SNILS = p_Manager_SNILS;
		if p_Exists_Record > 0 then
			select 'Менеджер с введёнными данными уже есть в системе';
			
		else
				Insert into Manager (Manager_Surname, Manager_Name, Manager_Second_Name,	Manager_Passport_Series,	Manager_Passport_Number,	Manager_ITN, Manager_SNILS)
				values (p_Manager_Surname, p_Manager_Name, p_Manager_Second_Name,	p_Manager_Passport_Series,	p_Manager_Passport_Number,	p_Manager_ITN, p_Manager_SNILS);
		end if;

	end;
DELIMITER /





DELIMITER // 
Create procedure Manager_Delete (in p_ID_Manager int)
	begin
    if EXISTS(select * from Request where Manager_ID = p_ID_Manager) then
        select 'Данные не могут быть удалены так как на них ссылаются значения из других таблиц';
    else
		delete from Manager where ID_Manager = p_ID_Manager;
	end if;
	end; 
DELIMITER /


-----------------------------------------------------------------------------------


DELIMITER // 
Create procedure Driver_Insert (in p_Driver_Passport_Series varchar(4),in p_Driver_Passport_Number varchar(6),in p_Driver_SNILS varchar(14),
										   in p_Driver_FFOMI varchar(16),in p_Driver_License_Series varchar(4),in p_Driver_License_Number varchar(6),
										  in p_Driver_Surname varchar(30), in p_Driver_Name varchar(30), in p_Driver_Second_Name varchar(30))
	begin
    declare p_Exists_Record smallint; 
    declare exit handler for 1406
    begin
        select 'Данные не могут быть добавлены. Данные слишком длинные';
	end;
	declare exit handler for 3819
    begin
        select 'Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку';
	end;
    declare exit handler for 1062
    begin
        select 'Введённый данные не являются уникальными';
	end;
    select count(*) into p_Exists_Record from Driver where Driver_SNILS = p_Driver_SNILS and Driver_FFOMI = p_Driver_FFOMI;
	if p_Exists_Record > 0 then 
		select 'Водитель с введёнными данными есть в системе';
	else
		Insert into Driver (Driver_Passport_Series,	Driver_Passport_Number,	Driver_Snils,	Driver_FFOMI,	Driver_License_Series,	Driver_License_Number,	Driver_Surname,	Driver_Name,	Driver_Second_Name)
		values (p_Driver_Passport_Series,	p_Driver_Passport_Number,	p_Driver_Snils,	p_Driver_FFOMI,	p_Driver_License_Series,	p_Driver_License_Number,	p_Driver_Surname,	p_Driver_Name,	p_Driver_Second_Name);
	end if;
	end; 
DELIMITER /


DELIMITER // 
Create procedure Driver_Update (in p_ID_Driver int,in p_Driver_Passport_Series varchar(4),in p_Driver_Passport_Number varchar(6),in p_Driver_SNILS varchar(14),
										   in p_Driver_FFOMI varchar(16),in p_Driver_License_Series varchar(4),in p_Driver_License_Number varchar(6),
										  in p_Driver_Surname varchar(30), in p_Driver_Name varchar(30), in p_Driver_Second_Name varchar(30))
	begin
    declare p_Exists_Record smallint;
    declare exit handler for 1406
    begin
        select 'Данные не могут быть добавлены. Данные слишком длинные';
	end;
	declare exit handler for 3819
    begin
        select 'Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку';
	end;
    declare exit handler for 1062
    begin
        select 'Введённый данные не являются уникальными';
	end;
    select count(*) into  p_Exists_Record from Driver where ID_Driver = p_ID_Driver;
	if p_Exists_Record = 0 then 
		select 'Невозможно обновить данные. Водителя с введёным идентификатором не существует';
	else
		update Driver set 
		Driver_Passport_Series = p_Driver_Passport_Series,	
		Driver_Passport_Number = p_Driver_Passport_Number,	
		Driver_Snils = p_Driver_Snils,
		Driver_FFOMI = p_Driver_FFOMI,	
		Driver_License_Series = p_Driver_License_Series,
		Driver_License_Number = p_Driver_License_Number,	
		Driver_Surname = p_Driver_Surname,
		Driver_Name = p_Driver_Name,	
		Driver_Second_Name = p_Driver_Second_Name
			where ID_Driver = p_ID_Driver;
			
	end if;
	end; 
DELIMITER /
	


DELIMITER // 
Create procedure Driver_Delete (in p_ID_Driver int)
	begin
        if EXISTS(select * from Route_Sheet where Driver_ID = p_ID_Driver) then
            select 'Данные не могут быть удалены так как на них ссылаются значения из других таблиц';
        else
		    delete from Driver where ID_Driver = p_ID_Driver;
        end if;
	end; 
DELIMITER /


--------------------------------------------------------------------------------------------------------------------

DELIMITER // 
Create procedure Vehicle_Insert (in p_Vehicle_Width int, in p_Vehicle_Height int, in p_Vehicle_Length int, in p_Vehicle_Capacity int, in p_Vehicle_State_Number varchar(10))


	
	begin
    declare p_Exists_Record  smallint;
    declare exit handler for 1406
    begin
        select 'Данные не могут быть добавлены. Данные слишком длинные';
	end;
	declare exit handler for 3819
    begin
        select 'Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку';
	end;
    declare exit handler for 1062
    begin
        select 'Введённый данные не являются уникальными';
	end;
    select count(*) into p_Exists_Record from Vehicle where Vehicle_State_Number = p_Vehicle_State_Number;
		if p_Exists_Record > 0 then
			select 'Автомобиль с введёнными данными есть в системе';
		else
			if p_Vehicle_Width < 0 or p_Vehicle_Height < 0 or p_Vehicle_Length < 0 or p_Vehicle_Capacity < 0 then
				select 'Параметры автомобиля не могут быть отрицательными';
			else
				Insert into Vehicle (Vehicle_Width, Vehicle_Height, Vehicle_Length, Vehicle_Capacity, Vehicle_State_Number)
				values (p_Vehicle_Width, p_Vehicle_Height, p_Vehicle_Length, p_Vehicle_Capacity, p_Vehicle_State_Number);
			end if;
		end if;
	end; 
DELIMITER /


DELIMITER // 
Create procedure Vehicle_Update (in p_ID_Vehicle int, p_Vehicle_Width int, in p_Vehicle_Height int, in p_Vehicle_Length int, in p_Vehicle_Capacity int, in p_Vehicle_State_Number varchar(10))
	begin
    declare p_Exists_Record smallint;
    declare exit handler for 1406
    begin
        select 'Данные не могут быть добавлены. Данные слишком длинные';
	end;
	declare exit handler for 3819
    begin
        select 'Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку';
	end;
    declare exit handler for 1062
    begin
        select 'Введённый данные не являются уникальными';
	end;
    select count(*) into p_Exists_Record from Vehicle where ID_Vehicle = p_ID_Vehicle;
		if p_Exists_Record = 0 then
			select 'Невозможно обновить данные. Автомобиля с введёным идентификатором не существует';
		else
			if p_Vehicle_Width < 0 or p_Vehicle_Height < 0 or p_Vehicle_Length < 0 or p_Vehicle_Capacity < 0 then
				select 'Параметры автомобиля не могут быть отрицательными';
			else
				update Vehicle set
					Vehicle_Width= p_Vehicle_Width, 
					Vehicle_Height= p_Vehicle_Height, 
					Vehicle_Length= p_Vehicle_Length, 
					Vehicle_Capacity= p_Vehicle_Capacity, 
					Vehicle_State_Number= p_Vehicle_State_Number
						where ID_Vehicle = p_ID_Vehicle;
			end if;
		end if;
	end; 
DELIMITER /


DELIMITER // 
Create procedure Vehicle_Delete (in p_ID_Vehicle int)
	begin
        if EXISTS(select * from Route_Sheet where Vehicle_ID = p_ID_Vehicle) then
            select 'Данные не могут быть удалены так как на них ссылаются значения из других таблиц';
        else
		    delete from Vehicle where ID_Vehicle = p_ID_Vehicle;
        end if;

	end; 
DELIMITER /





-------------------------------------------------------------

DELIMITER // 
Create procedure Complexity_Insert(in p_Complexity_Level int)
	begin
    declare exit handler for 1406
    begin
        select 'Данные не могут быть добавлены. Данные слишком длинные';
	end;
	declare exit handler for 3819
    begin
        select 'Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку';
	end;
    declare exit handler for 1062
    begin
        select 'Введённый данные не являются уникальными';
	end;
		if p_Complexity_Level < 0 then
			select 'Уровень сложности не может быть отрицательным';
		else
			insert into complexity(complexity_Level)
				values(p_Complexity_Level);
		end if;
	end; 
DELIMITER /


DELIMITER // 
Create procedure Complexity_Update(in p_ID_Complexity int, in p_Complexity_Level int)
	begin
    declare p_Exists_Record smallint;
    declare exit handler for 1406
    begin
        select 'Данные не могут быть добавлены. Данные слишком длинные';
	end;
	declare exit handler for 3819
    begin
        select 'Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку';
	end;
    declare exit handler for 1062
    begin
        select 'Введённый данные не являются уникальными';
	end; 
    select count(*) into p_Exists_Record from complexity where ID_Complexity = p_ID_Complexity;
	if p_Exists_Record = 0 then
		select 'Невозможно обновить сложность. Сложности с введённым идентификатором не существует';
	else
		if p_Complexity_Level < 0 then
			select 'Уровень сложности не может быть отрицательным';
		else
			update complexity set 
                complexity_level = p_Complexity_Level
                where ID_Complexity = p_ID_Complexity;
		end if;
	end if;
	end; 
DELIMITER /


DELIMITER // 
Create procedure Complexity_Delete(in p_ID_Complexity int)
	begin
        if EXISTS(select * from Route_Sheet where Complexity_ID = p_ID_Complexity) then
            select 'Данные не могут быть удалены так как на них ссылаются значения из других таблиц';
        else
		    delete from Complexity where ID_Complexity = p_ID_Complexity;
        end if;
	end; 
DELIMITER /





----------------------------------------------------
DELIMITER // 
Create procedure Request_Insert(in p_Request_Number varchar(8), in p_Manager_ID int, in p_Client_ID int)    
	begin
	declare p_Exists_Record smallint;
	declare p_Request_Number_New varchar(8);
	declare p_Client_Exists smallint;
	declare p_Manager_Exists smallint;
	declare exit handler for 1406
    begin
        select 'Данные не могут быть добавлены. Данные слишком длинные';
	end;
	declare exit handler for 3819
    begin
        select 'Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку';
	end;
    declare exit handler for 1062
    begin
        select 'Введённый данные не являются уникальными';
	end;
    set p_Request_Number_New = p_Request_Number;
    select count(*) into p_Client_Exists from Client where ID_Client = p_Client_ID;
    select count(*) into p_Manager_Exists from Manager where ID_Manager = p_Manager_ID;
    while length(p_Request_Number_New) < 8 do
		set p_Request_Number_New = CONCAT('0',p_Request_Number_New);
	end while;
    select count(*) into p_Exists_Record from Request where Request_Number = p_Request_Number_New;
		if p_Exists_Record > 0 then
			select 'Запись с данным номером уже есть в таблице';
		else
			if p_Client_Exists = 0 then
				select 'Клиента с указанным идентификатором нет';
			else
				if p_Manager_Exists = 0 then 
					select 'Менеджера с указанным идентификатором нет';
				else
					insert into Request(Request_Number, Manager_ID, Client_ID)
						values(p_Request_Number_New, p_Manager_ID, p_Client_ID);
				end if;
			end if;
		end if; 
	end;
DELIMITER /



DELIMITER // 
Create procedure Request_Update(in p_ID_Request int, in p_Request_Number varchar(8), in p_Manager_ID int, in p_Client_ID int)
	begin
    declare p_Exists_ID smallint;
	declare p_Exists_Record smallint;
	declare p_Request_Number_New varchar(8);
	declare p_Client_Exists smallint;
	declare p_Manager_Exists smallint;
    declare exit handler for 1406
    begin
        select 'Данные не могут быть добавлены. Данные слишком длинные';
	end;
	declare exit handler for 3819
    begin
        select 'Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку';
	end;
    declare exit handler for 1062
    begin
        select 'Введённый данные не являются уникальными';
	end;
    set  p_Request_Number_New = p_Request_Number;
    select count(*) into p_Exists_ID from Request where ID_Request = p_ID_Request;
    select count(*) into p_Client_Exists from Client where ID_Client = p_Client_ID;
    select count(*) into p_Manager_Exists from Manager where ID_Manager = p_Manager_ID;
    while length(p_Request_Number_New) < 8 do
		set p_Request_Number_New = CONCAT('0',p_Request_Number_New);
	end while;
    select count(*) into p_Exists_Record from Request where Request_Number = p_Request_Number_New;
		if p_Exists_Record > 0 then
			select 'Запись с данным номером уже есть в таблице';
		else
			if p_Exists_ID = 0 then
				select 'Невозможно обновить данные. Заявки с данным идентификатором не существует';
			else
				if p_Client_Exists = 0 then
					select 'Клиента с указанным идентификатором нет';
				else
					if p_Manager_Exists = 0 then 
						select 'Менеджера с указанным идентификатором нет';
					else
						update Request set
							Request_Number = p_Request_Number_New,
							Client_ID = p_Client_ID,
							Manager_ID = p_Manager_ID
								where ID_Request = p_ID_Request;
					end if;
				end if;
			end if;
		end if;
	end; 
DELIMITER /


DELIMITER // 
Create procedure Request_Delete(in p_ID_Request int)
	begin
    if EXISTS(select * from Cargo where Request_ID = p_ID_Request) or EXISTS(select * from Delivery_Point where Request_ID = p_ID_Request) then
        select 'Данные не могут быть удалены так как на них ссылаются значения из других таблиц';
    else
		delete from Request where ID_Request = p_ID_Request;
	end; 
DELIMITER /



-----------------------------------------------------

DELIMITER // 
Create procedure Cargo_Insert(in p_Cargo_Description varchar(200), in p_Cargo_Width int, in p_Cargo_Height int, in p_Cargo_Length int, in p_Cargo_Weight int, in p_Cargo_Price int,  in p_Request_ID int)
	begin
    declare p_Exists_Record smallint; 
	declare p_Exists_Request smallint;
    declare exit handler for 1406
    begin
        select 'Данные не могут быть добавлены. Данные слишком длинные';
	end;
	declare exit handler for 3819
    begin
        select 'Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку';
	end;
    declare exit handler for 1062
    begin
        select 'Введённый данные не являются уникальными';
	end;
    select count(*) into p_Exists_Record from Cargo where Cargo_Description = p_Cargo_Description
																	and Cargo_Width = p_Cargo_Width 
																	and p_Cargo_Height = Cargo_Height
																	and p_Cargo_Length = Cargo_Length
																	and p_Cargo_Weight = Cargo_Weight
																	and Cargo_price = p_Cargo_Price;
    select count(*) into p_Exists_Request from Request where ID_Request = p_Request_ID;
		if p_Exists_Request = 0 then 
			select 'Введённой записи в таблице Заявка не существует';
		else 
			if p_Exists_Record > 0 then
				select 'Введённый груз уже есть в базе';
			else
				if p_Cargo_Width < 0 or p_Cargo_Height < 0 or p_Cargo_Length < 0 or p_Cargo_Weight < 0 or p_Cargo_Price < 0 then
					select 'Значения груза не могут быть отрицательными';
				else
					Insert into Cargo (Cargo_Description,	Cargo_Width,	Cargo_Height,	Cargo_Length,	Cargo_Weight,	Cargo_Price,	Request_ID)
						values (p_Cargo_Description, p_Cargo_Width, p_Cargo_Height,	p_Cargo_Length,	p_Cargo_Weight,	p_Cargo_Price,	p_Request_ID);
				end if;
			end if;
		end if;
	end; 
DELIMITER /


DELIMITER // 
Create procedure Cargo_Update(in p_ID_Cargo int, in p_Cargo_Description varchar(200), in p_Cargo_Width int, in p_Cargo_Height int, in p_Cargo_Length int, in p_Cargo_Weight int, in p_Cargo_Price int,  in p_Request_ID int)
	begin
    declare p_Exists_ID smallint;
	declare p_Exists_Record smallint;
	declare p_Exists_Request smallint;
    declare exit handler for 1406
    begin
        select 'Данные не могут быть добавлены. Данные слишком длинные';
	end;
	declare exit handler for 3819
    begin
        select 'Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку';
	end;
    declare exit handler for 1062
    begin
        select 'Введённый данные не являются уникальными';
	end;
    select count(*) into p_Exists_ID from Cargo where ID_Cargo = p_ID_Cargo;
    select count(*) into p_Exists_Record from Cargo where Cargo_Description = p_Cargo_Description
																	and Cargo_Width = p_Cargo_Width 
																	and p_Cargo_Height = Cargo_Height
																	and p_Cargo_Length = Cargo_Length
																	and p_Cargo_Weight = Cargo_Weight
																	and Cargo_price = p_Cargo_Price;
    select count(*) into p_Exists_Request from Request where ID_Request = p_Request_ID;
		if p_Exists_ID = 0 then 
			select 'Невозможно обновить таблицу. Груза с введёнными идентификатором нет';
		else
			if p_Exists_Record > 0 then 
				select 'Введённый груз уже есть в базе';
			else 
				if p_Exists_Request = 0 then
					select 'Введённой записи в таблице Заявка не существует';
				else
					if p_Cargo_Width < 0 or p_Cargo_Height < 0 or p_Cargo_Length < 0 or p_Cargo_Weight < 0 or p_Cargo_Price < 0 then
						select 'Значения груза не могут быть отрицательными';
					else
					update cargo set
						Cargo_Description = p_Cargo_Description,
						Cargo_Width = p_Cargo_Width,
						Cargo_Height = p_Cargo_Height,
						Cargo_Length = p_Cargo_Length,
						Cargo_Weight = p_Cargo_Weight,
						Cargo_Price = p_Cargo_Price,
						Request_ID = p_Request_ID
							where ID_Cargo = p_ID_Cargo;
					end if;
				end if;
			end if;
		end if;
	end; 
DELIMITER /


DELIMITER // 
Create procedure Cargo_Delete(in p_ID_Cargo int)
	begin
        if EXISTS(select * from Combination_Route_Sheet_Cargo where Cargo_ID = p_ID_Cargo) then
            select 'Данные не могут быть удалены так как на них ссылаются значения из других таблиц';
        else
		    delete from Cargo where ID_Cargo = p_ID_Cargo;
        end if;
	end; 
DELIMITER /




--------------------------------------

DELIMITER //
Create procedure Delivery_Point_Insert(in p_Request_ID int, in p_Delivery_Point_Destination varchar(200)) 
	begin
    declare p_Exists_Record smallint;
    declare p_Exists_Request smallint;
    declare exit handler for 1406
    begin
        select 'Данные не могут быть добавлены. Данные слишком длинные';
	end;
	declare exit handler for 3819
    begin
        select 'Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку';
	end;
    declare exit handler for 1062
    begin
        select 'Введённый данные не являются уникальными';
	end;
    select count(*) into p_Exists_Request from Request where ID_Request = p_Request_ID;
    select count(*) into p_Exists_Record from Delivery_Point where Request_ID = p_Request_ID and Delivery_Point_Destination = p_Delivery_Point_Destination;
		if p_Exists_Request = 0 then
			select 'Введённой записи в таблице Заявка не существует';
		else
            if p_Exists_Record > 0 then
                select 'Введённая запись уже есть в таблице';
            else
                insert into Delivery_Point(Request_ID, Delivery_Point_Destination)
                    values(p_Request_ID, p_Delivery_Point_Destination);
            end if;
		end if;
	end; 
DELIMITER /


DELIMITER // 
Create procedure Delivery_Point_Update(in p_ID_Delivery_Point int, in p_Delivery_Point_Mark varchar(1) ,in p_Request_ID int, in p_Delivery_Point_Destination varchar(200))
	begin
    declare p_Exists_ID smallint; 
    declare p_Exists_Record smallint;
	declare p_Exists_Request smallint;
    declare exit handler for 1406
    begin
        select 'Данные не могут быть добавлены. Данные слишком длинные';
	end;
	declare exit handler for 3819
    begin
        select 'Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку';
	end;
    declare exit handler for 1062
    begin
        select 'Введённый данные не являются уникальными';
	end;
    select count(*) into p_Exists_ID from Delivery_Point where ID_Delivery_Point = p_ID_Delivery_Point;
    select count(*) into p_Exists_Request from Request where ID_Request = p_Request_ID;
    select count(*) into p_Exists_Record from Delivery_Point where Request_ID = p_Request_ID and Delivery_Point_Destination = p_Delivery_Point_Destination;
		if p_Exists_ID = 0 then
			select 'Невозможно обновить данные. Точки доставки с введённым идентификатором не существует';
		else
			if p_Exists_Request = 0 then
				select 'Введённой записи в таблице Заявка не существует';
			else
                if p_Exists_Record > 0 then
                    select 'Введённая запись уже есть в таблице';
                else
                    update delivery_Point set
                        Delivery_Point_Mark = p_Delivery_Point_Mark,
                        Request_ID = p_Request_ID,
                        Delivery_Point_Destination = p_Delivery_Point_Destination
                            where ID_Delivery_Point = p_ID_Delivery_Point;
                end if;
			end if;
		end if;
	end; 
DELIMITER /


DELIMITER // 
Create procedure Delivery_Point_Delete(in p_ID_Delivery_Point int)
	begin
    if EXISTS(select * from Combination_Route_Sheet_Delivery_Point where Delivery_Point_ID = p_ID_Delivery_Point) then
        select 'Данные не могут быть удалены так как на них ссылаются значения из других таблиц';
    else
		delete from Delivery_Point where ID_Delivery_Point = p_ID_Delivery_Point;
	end if;
	end; 
DELIMITER /


-----------------------------------------------------------------------------------------


DELIMITER // 
Create procedure Route_Sheet_Insert(in p_Route_Sheet_Number varchar(8), in p_Complexity_ID int, in p_Vehicle_ID int, in p_Driver_ID int)
	begin
    declare p_Exists_Record smallint;
	declare p_Route_Sheet_Number_New varchar(8);
	declare p_Complexity_Exists smallint;  
	declare p_Vehicle_Exists smallint;  
	declare p_Driver_Exists smallint;
    declare exit handler for 1406
    begin
        select 'Данные не могут быть добавлены. Данные слишком длинные';
	end;
	declare exit handler for 3819
    begin
        select 'Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку';
	end;
    declare exit handler for 1062
    begin
        select 'Введённый данные не являются уникальными';
	end;
    set p_Route_Sheet_Number_New = p_Route_Sheet_Number;
    select count(*) into p_Complexity_Exists from Complexity where ID_Complexity = p_Complexity_ID;
    select count(*) into p_Vehicle_Exists from Vehicle where ID_Vehicle = p_Vehicle_ID;
    select count(*) into p_Driver_Exists from Driver where ID_Driver = p_Driver_ID;
		while LENGTH(p_Route_Sheet_Number_New) < 8 do
			set p_Route_Sheet_Number_New = CONCAT('0',p_Route_Sheet_Number_New);
		end while;
		select count(*) into p_Exists_Record from Route_Sheet where Route_Sheet_Number = p_Route_Sheet_Number_New;
		if p_Exists_Record > 0 then
			select 'Запись с данным номером уже есть в таблице';
		else
			if p_Complexity_Exists = 0 then
				select 'Сложности с указанным идентификатором нет';
			else
				if p_Vehicle_Exists = 0 then
					select 'Автомобиля с указанным идентификатором нет';
				else
					if p_Driver_Exists = 0 then
						select 'Водителя с указанным идентификатором нет';
					else
						insert into Route_Sheet(Route_Sheet_Number,Complexity_ID,Vehicle_ID,Driver_ID)
							values(p_Route_Sheet_Number_New, p_Complexity_ID, p_Vehicle_ID, p_Driver_ID);
					end if;
				end if;
			end if;
		end if;
	end; 
DELIMITER /
	



DELIMITER // 
Create procedure Route_Sheet_Update(in p_ID_Route_Sheet int, in p_Route_Sheet_Number varchar(8), in p_Complexity_ID int, in p_Vehicle_ID int, in p_Driver_ID int)
	begin
    declare p_Exists_ID smallint; 
    declare p_Exists_Record smallint;
	declare p_Route_Sheet_Number_New varchar(8);
	declare p_Complexity_Exists smallint;  
	declare p_Vehicle_Exists smallint;  
	declare p_Driver_Exists smallint; 
    declare exit handler for 1406
    begin
        select 'Данные не могут быть добавлены. Данные слишком длинные';
	end;
	declare exit handler for 3819
    begin
        select 'Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку';
	end;
    declare exit handler for 1062
    begin
        select 'Введённый данные не являются уникальными';
	end;
    select count(*) into p_Exists_ID from Route_Sheet where ID_Route_Sheet = p_ID_Route_Sheet;
    set p_Route_Sheet_Number_New = p_Route_Sheet_Number;
    select count(*) into p_Complexity_Exists from Complexity where ID_Complexity = p_Complexity_ID;
    select count(*) into p_Vehicle_Exists from Vehicle where ID_Vehicle = p_Vehicle_ID;
    select count(*) into p_Driver_Exists from Driver where ID_Driver = p_Driver_ID;
    while LENGTH(p_Route_Sheet_Number_New) < 8 do
		set p_Route_Sheet_Number_New = CONCAT('0',p_Route_Sheet_Number_New);
	end while;
	select count(*) into p_Exists_Record from Route_Sheet where Route_Sheet_Number = p_Route_Sheet_Number_New;
		if p_Exists_ID = 0 then
			select 'Невозможно обновить данные. Маршрутного листа с введённым идентификатором не существует';
		else
			if p_Exists_Record > 0 then
				select 'Запись с данным номером уже есть в таблице';
			else
				if p_Complexity_Exists = 0 then
					select 'Сложности с указанным идентификатором нет';
				else
					if p_Vehicle_Exists = 0 then
						select 'Автомобиля с указанным идентификатором нет';
					else
						if p_Driver_Exists = 0 then
							select 'Водителя с указанным идентификатором нет';
						else
							update Route_Sheet set 
								Route_Sheet_Number = p_Route_Sheet_Number_New,
								Complexity_ID = p_Complexity_ID,
								Vehicle_ID = p_Vehicle_ID,
								Driver_ID = p_Driver_ID
									where ID_Route_Sheet = p_ID_Route_Sheet;
						end if;
					 end if;
				 end if;
			 end if;
		 end if;
	end; 
DELIMITER /
	


DELIMITER // 
Create procedure Route_Sheet_Delete(in p_ID_Route_Sheet int)
	begin
        if (EXISTS(select * from Combination_Route_Sheet_Delivery_Point where Route_Sheet_ID = p_ID_Route_Sheet) or EXISTS(select * from Combination_Route_Sheet_Cargo where Route_Sheet_ID = p_ID_Route_Sheet)) then
            select 'Данные не могут быть удалены так как на них ссылаются значения из других таблиц';
        else
		    delete from Route_Sheet where ID_Route_Sheet = p_ID_Route_Sheet;
        end if;
	end; 
DELIMITER /





-----------------------------------------------------------------------------------------


DELIMITER // 
Create procedure Combination_Route_Sheet_Delivery_Point_Insert(in p_Route_Sheet_ID int, in p_Delivery_Point_ID int)

	begin
    declare p_Exists_Record smallint; 
	declare p_Exists_Route_Sheet smallint; 
	declare p_Exists_Delivery_Point smallint;
    declare exit handler for 1406
    begin
        select 'Данные не могут быть добавлены. Данные слишком длинные';
	end;
	declare exit handler for 3819
    begin
        select 'Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку';
	end;
    declare exit handler for 1062
    begin
        select 'Введённый данные не являются уникальными';
	end;
    select count(*) into p_Exists_Record from Combination_Route_Sheet_Delivery_Point where Route_Sheet_ID = p_Route_Sheet_ID and 
																								 Delivery_Point_ID = p_Delivery_Point_ID;
    select count(*) into p_Exists_Route_Sheet from Route_Sheet where ID_Route_Sheet = p_Route_Sheet_ID;
    select count(*) into p_Exists_Delivery_Point  from Delivery_Point where ID_Delivery_Point = p_Delivery_Point_ID;
	if p_Exists_Record > 0 then
		select 'Введённая запись уже есть в таблице';
	else
		if p_Exists_Route_Sheet = 0 then
			select 'Введённой записи нету в таблице Маршрутный лист';
		else
			if p_Exists_Delivery_Point = 0 then
				select 'Введённой записи нету в таблице Точки доставки';
			else
				insert into Combination_Route_Sheet_Delivery_Point(Route_Sheet_ID, Delivery_Point_ID)
					values(p_Route_Sheet_ID, p_Delivery_Point_ID);
			end if;
		end if;
	end if;
	end; 
DELIMITER /



DELIMITER // 
Create procedure Combination_Route_Sheet_Delivery_Point_Update(in p_ID_Combination_Route_Sheet_Delivery_Point int, in p_Route_Sheet_ID int, in p_Delivery_Point_ID int)
	begin
    	declare p_Exists_ID smallint;
    declare p_Exists_Record smallint; 
	declare p_Exists_Route_Sheet smallint; 
	declare p_Exists_Delivery_Point smallint;
    declare exit handler for 1406
    begin
        select 'Данные не могут быть добавлены. Данные слишком длинные';
	end;
	declare exit handler for 3819
    begin
        select 'Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку';
	end;
    declare exit handler for 1062
    begin
        select 'Введённый данные не являются уникальными';
	end;
    select count(*) into p_Exists_ID  from Combination_Route_Sheet_Delivery_Point where ID_Combination_Route_Sheet_Delivery_Point = p_ID_Combination_Route_Sheet_Delivery_Point;
    select count(*) into p_Exists_Record from Combination_Route_Sheet_Delivery_Point where Route_Sheet_ID = p_Route_Sheet_ID and 
																								 Delivery_Point_ID = p_Delivery_Point_ID;
    select count(*) into p_Exists_Route_Sheet from Route_Sheet where ID_Route_Sheet = p_Route_Sheet_ID;
    select count(*) into p_Exists_Delivery_Point  from Delivery_Point where ID_Delivery_Point = p_Delivery_Point_ID;
	if p_Exists_ID = 0 then
		select 'Невозможно обновить таблицу. Данных с введённым идентификатором нет';
	else
		if p_Exists_Record > 0 then
			select 'Введённая запись уже есть в таблице';
		else
			if p_Exists_Route_Sheet = 0 then
				select 'Введённой записи нету в таблице Маршрутный лист';
			else
				if p_Exists_Delivery_Point = 0 then
					select 'Введённой записи нету в таблице Точки доставки';
				else
					update Combination_Route_Sheet_Delivery_Point set
						Route_Sheet_ID = p_Route_Sheet_ID,
						Delivery_Point_ID = p_Delivery_Point_ID
						where ID_Combination_Route_Sheet_Delivery_Point = p_ID_Combination_Route_Sheet_Delivery_Point;
				end if;
			 end if;
		 end if;
	 end if;
	end; 
DELIMITER /


DELIMITER // 
Create procedure Combination_Route_Sheet_Delivery_Point_Delete(in p_ID_Combination_Route_Sheet_Delivery_Point int)
	begin
		delete from Combination_Route_Sheet_Delivery_Point where ID_Combination_Route_Sheet_Delivery_Point = p_ID_Combination_Route_Sheet_Delivery_Point;
	end; 
DELIMITER /


-------------------------------------------------------


DELIMITER // 
Create procedure Combination_Route_Sheet_Cargo_Insert(in p_Route_Sheet_ID int, in p_Cargo_ID int)
	begin
    declare p_Exists_Record smallint;  
	declare p_Exists_Route_Sheet smallint; 
	declare p_Exists_Cargo smallint;
    declare exit handler for 1406
    begin
        select 'Данные не могут быть добавлены. Данные слишком длинные';
	end;
	declare exit handler for 3819
    begin
        select 'Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку';
	end;
    declare exit handler for 1062
    begin
        select 'Введённый данные не являются уникальными';
	end;
    select count(*) into p_Exists_Record from Combination_Route_Sheet_Cargo where Route_Sheet_ID = p_Route_Sheet_ID and 
																								 Cargo_ID = p_Cargo_ID;
    select count(*) into p_Exists_Route_Sheet from Route_Sheet where ID_Route_Sheet = p_Route_Sheet_ID;
    select count(*) into p_Exists_Cargo  from Cargo where ID_Cargo = p_Cargo_ID;
	if p_Exists_Record > 0 then
		select 'Введённая запись уже есть в таблице';
	else
		if p_Exists_Route_Sheet = 0 then
			select 'Введённой записи нету в таблице Маршрутный лист';
		else
			if p_Exists_Cargo = 0 then
				select 'Введённой записи нету в таблице Точки доставки';
			else
				insert into Combination_Route_Sheet_Cargo(Route_Sheet_ID, Cargo_ID)
					values(p_Route_Sheet_ID, p_Cargo_ID);
			end if;
		end if;
	end if;
	end; 
DELIMITER /



DELIMITER // 
Create procedure Combination_Route_Sheet_Cargo_Update(in p_ID_Combination_Route_Sheet_Cargo int, in p_Route_Sheet_ID int, in p_Cargo_ID int)
	begin
    declare p_Exists_ID smallint;  
    declare p_Exists_Record smallint;  
	declare p_Exists_Route_Sheet smallint; 
	declare p_Exists_Cargo smallint; 
    declare exit handler for 1406
    begin
        select 'Данные не могут быть добавлены. Данные слишком длинные';
	end;
	declare exit handler for 3819
    begin
        select 'Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку';
	end;
    declare exit handler for 1062
    begin
        select 'Введённый данные не являются уникальными';
	end;
    select count(*) into p_Exists_ID from Combination_Route_Sheet_Cargo where ID_Combination_Route_Sheet_Cargo = p_ID_Combination_Route_Sheet_Cargo;
    select count(*) into p_Exists_Record from Combination_Route_Sheet_Cargo where Route_Sheet_ID = p_Route_Sheet_ID and 
																								 Cargo_ID = p_Cargo_ID;
    select count(*) into p_Exists_Route_Sheet from Route_Sheet where ID_Route_Sheet = p_Route_Sheet_ID;
    select count(*) into p_Exists_Cargo  from Cargo where ID_Cargo = p_Cargo_ID;
	if p_Exists_ID = 0 then
		select 'Невозможно обновить таблицу. Данных с введённым идентификатором нет';
	else
		if p_Exists_Record > 0 then
			select 'Введённая запись уже есть в таблице';
		else
			if p_Exists_Route_Sheet = 0 then
				select 'Введённой записи нету в таблице Маршрутный лист';
			else
				if p_Exists_Cargo = 0 then
					select 'Введённой записи нету в таблице Точки доставки';
				else
					update Combination_Route_Sheet_Cargo set
						Route_Sheet_ID = p_Route_Sheet_ID,
						Cargo_ID = p_Cargo_ID
						where ID_Combination_Route_Sheet_Cargo = p_ID_Combination_Route_Sheet_Cargo;
				end if;
			 end if;
		 end if;
	 end if;
	end; 
DELIMITER /

DELIMITER // 
Create procedure Combination_Route_Sheet_Cargo_Delete(in p_ID_Combination_Route_Sheet_Cargo int)
	begin
		delete from Combination_Route_Sheet_Cargo where ID_Combination_Route_Sheet_Cargo = p_ID_Combination_Route_Sheet_Cargo;
	end; 
DELIMITER /
