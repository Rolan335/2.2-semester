
CREATE OR REPLACE PROCEDURE Client_Update(p_ID_Client int,p_Client_Organization_Name varchar,p_Client_Legal_Address varchar,
									p_Client_Physical_Address varchar, p_Client_ITN varchar, p_Client_BIC varchar, p_Client_OKPO varchar,
									p_Client_Repr_Surname varchar, p_Client_Repr_Name varchar, p_Client_Repr_Second_Name varchar)
is
    p_Exists_Record smallint;
begin
    select count(*) into p_Exists_Record from Client where ID_Client = p_ID_Client;
		if p_Exists_Record = 0 then
			DBMS_OUTPUT.PUT_LINE('Невозможно обновить данные. Клиента с введёным идентификатором не существует');
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
		exception 
        when VALUE_ERROR then 
			DBMS_OUTPUT.PUT_LINE('Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку');
		when DUP_VAL_ON_INDEX then
			DBMS_OUTPUT.PUT_LINE('Введённые данные не являются уникальными');
		when others then 
			DBMS_OUTPUT.PUT_LINE('Данные не могут быть добавлены. ' || SQLERRM);
commit;

end;

 
Create or replace procedure Client_Insert (p_Client_Organization_Name varchar,p_Client_Legal_Address varchar,
									p_Client_Physical_Address varchar, p_Client_ITN varchar, p_Client_BIC varchar, p_Client_OKPO varchar,
									p_Client_Repr_Surname varchar, p_Client_Repr_Name varchar, p_Client_Repr_Second_Name varchar )
    is
    p_Exists_Record smallint;
	begin
        select count(*) into p_Exists_Record from Client where Client_ITN = p_Client_ITN and 
																   Client_BIC = p_Client_BIC and 
																   Client_OKPO = p_Client_OKPO;
		if p_Exists_Record > 0 then
			DBMS_OUTPUT.PUT_LINE('Клиент с введёнными данными уже есть в системе');
		else
			Insert into Client (Client_Organization_Name, Client_Legal_Address, Client_Physical_Address, Client_ITN, Client_BIC, Client_OKPO, Client_Repr_Surname, Client_Repr_Name, Client_Repr_Second_Name)
			values (p_Client_Organization_Name,p_Client_Legal_Address,
									p_Client_Physical_Address, p_Client_ITN, p_Client_BIC, p_Client_OKPO,
									p_Client_Repr_Surname, p_Client_Repr_Name, p_Client_Repr_Second_Name);
		end if;
		exception 
        when VALUE_ERROR then 
			DBMS_OUTPUT.PUT_LINE('Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку');
		when DUP_VAL_ON_INDEX then
			DBMS_OUTPUT.PUT_LINE('Введённые данные не являются уникальными');
		when others then 
			DBMS_OUTPUT.PUT_LINE('Данные не могут быть добавлены. ' || SQLERRM);
	commit;

end; 




 
Create or replace procedure Client_Delete (p_ID_Client int)
is
    p_exists smallint;
	begin
    select count(*) into p_exists from request where Client_ID = p_ID_Client;
    if p_exists > 0 then
		DBMS_OUTPUT.PUT_LINE('Данные не могут быть удалены так как на них ссылаются значения из других таблиц');
	else
	  delete from client where ID_Client = p_ID_Client;
	end if;
	commit;

end;




--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------




 
Create or replace procedure Manager_Update (p_ID_Manager int, p_Manager_Surname varchar, p_Manager_Name varchar, p_Manager_Second_Name varchar,
										   p_Manager_Passport_Series varchar, p_Manager_Passport_Number varchar, p_Manager_ITN varchar, 
											P_Manager_SNILS varchar)
    is
    	p_Exists_Record smallint;
	begin
    select count(*) into p_Exists_Record from Manager where ID_Manager = p_ID_Manager;
		if p_Exists_Record = 0 then
			DBMS_OUTPUT.PUT_LINE('Невозможно обновить данные. Менеджера с введёным идентификатором не существует');
			
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
        		exception 
        when VALUE_ERROR then 
			DBMS_OUTPUT.PUT_LINE('Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку');
		when DUP_VAL_ON_INDEX then
			DBMS_OUTPUT.PUT_LINE('Введённые данные не являются уникальными');
		when others then 
			DBMS_OUTPUT.PUT_LINE('Данные не могут быть добавлены. ' || SQLERRM);
	commit;

end; 

 
Create or replace procedure Manager_Insert (p_Manager_Surname varchar, p_Manager_Name varchar, p_Manager_Second_Name varchar,
										p_Manager_Passport_Series varchar, p_Manager_Passport_Number varchar, p_Manager_ITN varchar, 
											p_Manager_SNILS varchar)

    is
    p_Exists_Record smallint; 
	begin
        select count(*)  into p_Exists_Record from Manager where Manager_ITN = p_Manager_ITN and Manager_SNILS = p_Manager_SNILS;
		if p_Exists_Record > 0 then
			DBMS_OUTPUT.PUT_LINE('Менеджер с введёнными данными уже есть в системе');
			
		else
				Insert into Manager (Manager_Surname, Manager_Name, Manager_Second_Name,	Manager_Passport_Series,	Manager_Passport_Number,	Manager_ITN, Manager_SNILS)
				values (p_Manager_Surname, p_Manager_Name, p_Manager_Second_Name,	p_Manager_Passport_Series,	p_Manager_Passport_Number,	p_Manager_ITN, p_Manager_SNILS);
		end if;
		exception 
        when VALUE_ERROR then 
			DBMS_OUTPUT.PUT_LINE('Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку');
		when DUP_VAL_ON_INDEX then
			DBMS_OUTPUT.PUT_LINE('Введённые данные не являются уникальными');
		when others then 
			DBMS_OUTPUT.PUT_LINE('Данные не могут быть добавлены. ' || SQLERRM);
	commit;

end;






 
Create or replace procedure Manager_Delete (p_ID_Manager int)
is
    p_Exists_Record smallint;
	begin
    select count(*) into p_Exists_Record from Request where Manager_ID = p_ID_Manager;
    if p_Exists_Record > 0 then
        DBMS_OUTPUT.PUT_LINE('Данные не могут быть удалены так как на них ссылаются значения из других таблиц');
    else
		delete from Manager where ID_Manager = p_ID_Manager;
	end if;
	commit;

end; 



-----------------------------------------------------------------------------------


 
Create or replace procedure Driver_Insert (p_Driver_Passport_Series varchar,p_Driver_Passport_Number varchar,p_Driver_SNILS varchar,
										   p_Driver_FFOMI varchar,p_Driver_License_Series varchar,p_Driver_License_Number varchar,
										  p_Driver_Surname varchar, p_Driver_Name varchar, p_Driver_Second_Name varchar)
    is
        p_Exists_Record smallint; 
	begin
    select count(*) into p_Exists_Record from Driver where Driver_SNILS = p_Driver_SNILS and Driver_FFOMI = p_Driver_FFOMI;
	if p_Exists_Record > 0 then 
		DBMS_OUTPUT.PUT_LINE('Водитель с введёнными данными есть в системе');
	else
		Insert into Driver (Driver_Passport_Series,	Driver_Passport_Number,	Driver_Snils,	Driver_FFOMI,	Driver_License_Series,	Driver_License_Number,	Driver_Surname,	Driver_Name,	Driver_Second_Name)
		values (p_Driver_Passport_Series,	p_Driver_Passport_Number,	p_Driver_Snils,	p_Driver_FFOMI,	p_Driver_License_Series,	p_Driver_License_Number,	p_Driver_Surname,	p_Driver_Name,	p_Driver_Second_Name);
	end if;
    		exception 
        when VALUE_ERROR then 
			DBMS_OUTPUT.PUT_LINE('Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку');
		when DUP_VAL_ON_INDEX then
			DBMS_OUTPUT.PUT_LINE('Введённые данные не являются уникальными');
		when others then 
			DBMS_OUTPUT.PUT_LINE('Данные не могут быть добавлены. ' || SQLERRM);
	commit;

end; 



 
Create or replace procedure Driver_Update (p_ID_Driver int,p_Driver_Passport_Series varchar,p_Driver_Passport_Number varchar,p_Driver_SNILS varchar,
										   p_Driver_FFOMI varchar,p_Driver_License_Series varchar,p_Driver_License_Number varchar,
										  p_Driver_Surname varchar, p_Driver_Name varchar, p_Driver_Second_Name varchar)
    is 
    p_Exists_Record smallint;
	begin

    select count(*) into  p_Exists_Record from Driver where ID_Driver = p_ID_Driver;
	if p_Exists_Record = 0 then 
		DBMS_OUTPUT.PUT_LINE('Невозможно обновить данные. Водителя с введёным идентификатором не существует');
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
    		exception 
        when VALUE_ERROR then 
			DBMS_OUTPUT.PUT_LINE('Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку');
		when DUP_VAL_ON_INDEX then
			DBMS_OUTPUT.PUT_LINE('Введённые данные не являются уникальными');
		when others then 
			DBMS_OUTPUT.PUT_LINE('Данные не могут быть добавлены. ' || SQLERRM);
	commit;

end; 

	


 
Create or replace procedure Driver_Delete (p_ID_Driver int)
    is
    p_Exists_Record smallint;
	begin
    select count(*) into p_Exists_Record from Route_Sheet where Driver_ID = p_ID_Driver
        if p_Exists_Record > 0 then
            DBMS_OUTPUT.PUT_LINE('Данные не могут быть удалены так как на них ссылаются значения из других таблиц');
        else
		    delete from Driver where ID_Driver = p_ID_Driver;
        end if;
	commit;

end; 



--------------------------------------------------------------------------------------------------------------------

 
Create or replace procedure Vehicle_Insert (p_Vehicle_Width int, p_Vehicle_Height int, p_Vehicle_Length int, p_Vehicle_Capacity int, p_Vehicle_State_Number varchar)


	is
         p_Exists_Record  smallint;
	begin
    select count(*) into p_Exists_Record from Vehicle where Vehicle_State_Number = p_Vehicle_State_Number;
		if p_Exists_Record > 0 then
			DBMS_OUTPUT.PUT_LINE('Автомобиль с введёнными данными есть в системе');
		else
			if p_Vehicle_Width < 0 or p_Vehicle_Height < 0 or p_Vehicle_Length < 0 or p_Vehicle_Capacity < 0 then
				DBMS_OUTPUT.PUT_LINE('Параметры автомобиля не могут быть отрицательными');
			else
				Insert into Vehicle (Vehicle_Width, Vehicle_Height, Vehicle_Length, Vehicle_Capacity, Vehicle_State_Number)
				values (p_Vehicle_Width, p_Vehicle_Height, p_Vehicle_Length, p_Vehicle_Capacity, p_Vehicle_State_Number);
			end if;
		end if;
        		exception 
        when VALUE_ERROR then 
			DBMS_OUTPUT.PUT_LINE('Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку');
		when DUP_VAL_ON_INDEX then
			DBMS_OUTPUT.PUT_LINE('Введённые данные не являются уникальными');
		when others then 
			DBMS_OUTPUT.PUT_LINE('Данные не могут быть добавлены. ' || SQLERRM);
	commit;

end; 



 
Create or replace procedure Vehicle_Update (p_ID_Vehicle int, p_Vehicle_Width int, p_Vehicle_Height int, p_Vehicle_Length int, p_Vehicle_Capacity int, p_Vehicle_State_Number varchar)
	is
        p_Exists_Record  smallint;
    begin

    select count(*) into p_Exists_Record from Vehicle where ID_Vehicle = p_ID_Vehicle;
		if p_Exists_Record = 0 then
			DBMS_OUTPUT.PUT_LINE('Невозможно обновить данные. Автомобиля с введёным идентификатором не существует');
		else
			if p_Vehicle_Width < 0 or p_Vehicle_Height < 0 or p_Vehicle_Length < 0 or p_Vehicle_Capacity < 0 then
				DBMS_OUTPUT.PUT_LINE('Параметры автомобиля не могут быть отрицательными');
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
        		exception 
        when VALUE_ERROR then 
			DBMS_OUTPUT.PUT_LINE('Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку');
		when DUP_VAL_ON_INDEX then
			DBMS_OUTPUT.PUT_LINE('Введённые данные не являются уникальными');
		when others then 
			DBMS_OUTPUT.PUT_LINE('Данные не могут быть добавлены. ' || SQLERRM);
	commit;

end; 



 
Create or replace procedure Vehicle_Delete (p_ID_Vehicle int)
    is
        p_Exists_Record  smallint;
	begin
    select count(*) into p_Exists_Record from Route_Sheet where Vehicle_ID = p_ID_Vehicle;
        if p_Exists_Record > 0 then
            DBMS_OUTPUT.PUT_LINE('Данные не могут быть удалены так как на них ссылаются значения из других таблиц');
        else
		    delete from Vehicle where ID_Vehicle = p_ID_Vehicle;
        end if;
	commit;

end; 






-------------------------------------------------------------
--1111
 
Create or replace procedure Complexity_Insert(p_Complexity_Level int)
is
	begin
		if p_Complexity_Level < 0 then
			DBMS_OUTPUT.PUT_LINE('Уровень сложности не может быть отрицательным');
		else
			insert into complexity(complexity_Level)
				values(p_Complexity_Level);
		end if;
        exception 
        when VALUE_ERROR then 
			DBMS_OUTPUT.PUT_LINE('Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку');
		when DUP_VAL_ON_INDEX then
			DBMS_OUTPUT.PUT_LINE('Введённые данные не являются уникальными');
		when others then 
			DBMS_OUTPUT.PUT_LINE('Данные не могут быть добавлены. ' || SQLERRM);
	commit;

end; 



 
Create or replace procedure Complexity_Update(p_ID_Complexity int, p_Complexity_Level int)
is
    p_Exists_Record smallint;
	begin
    select count(*) into p_Exists_Record from complexity where ID_Complexity = p_ID_Complexity;
	if p_Exists_Record = 0 then
		DBMS_OUTPUT.PUT_LINE('Невозможно обновить сложность. Сложности с введённым идентификатором не существует');
	else
		if p_Complexity_Level < 0 then
			DBMS_OUTPUT.PUT_LINE('Уровень сложности не может быть отрицательным');
		else
			update complexity set 
                complexity_level = p_Complexity_Level
                where ID_Complexity = p_ID_Complexity;
		end if;
	end if;
    exception 
        when VALUE_ERROR then 
			DBMS_OUTPUT.PUT_LINE('Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку');
		when DUP_VAL_ON_INDEX then
			DBMS_OUTPUT.PUT_LINE('Введённые данные не являются уникальными');
		when others then 
			DBMS_OUTPUT.PUT_LINE('Данные не могут быть добавлены. ' || SQLERRM);
	commit;

end; 



 
Create or replace procedure Complexity_Delete(p_ID_Complexity int)
    is 
    p_Exists_Record smallint;
	begin
    select count(*) into p_Exists_Record from Route_Sheet where Complexity_ID = p_ID_Complexity;
        if p_Exists_Record > 0 then
            DBMS_OUTPUT.PUT_LINE('Данные не могут быть удалены так как на них ссылаются значения из других таблиц');
        else
		    delete from Complexity where ID_Complexity = p_ID_Complexity;
        end if;
	commit;

end; 


----------------------------------------------------
 
alter table Request add (Request_Number_Temp VARCHAR(8));
update Request set Request_Number_Temp = Request_Number;
alter table Request MODIFY(Request_Number NULL);
Update Request set Request_Number = null;
select * from Request;
alter table Request Modify(Request_Number varchar(8));
update Request set Request_Number = Request_Number_Temp;

alter table request drop column Request_Number_Temp;













Create or replace procedure Request_Insert(p_Request_Number varchar, p_Manager_ID int, p_Client_ID int)    
is
	 p_Exists_Record smallint;
	 p_Request_Number_New varchar(8);
	 p_Client_Exists smallint;
	 p_Manager_Exists smallint;
	begin
    p_Request_Number_New := p_Request_Number;
    select count(*) into p_Client_Exists from Client where ID_Client = p_Client_ID;
    select count(*) into p_Manager_Exists from Manager where ID_Manager = p_Manager_ID;
    while length(p_Request_Number_New) < 8
    loop
		p_Request_Number_New := CONCAT('0',p_Request_Number_New);
	end loop;
    select count(*) into p_Exists_Record from Request where Request_Number = p_Request_Number_New;
		if p_Exists_Record > 0 then
			DBMS_OUTPUT.PUT_LINE('Запись с данным номером уже есть в таблице');
		else
			if p_Client_Exists = 0 then
				DBMS_OUTPUT.PUT_LINE('Клиента с указанным идентификатором нет');
			else
				if p_Manager_Exists = 0 then 
					DBMS_OUTPUT.PUT_LINE('Менеджера с указанным идентификатором нет');
				else
					insert into Request(Request_Number, Manager_ID, Client_ID)
						values(p_Request_Number_New, p_Manager_ID, p_Client_ID);
				end if;
			end if;
		end if; 
        		exception 
        when VALUE_ERROR then 
			DBMS_OUTPUT.PUT_LINE('Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку');
		when DUP_VAL_ON_INDEX then
			DBMS_OUTPUT.PUT_LINE('Введённые данные не являются уникальными');
		when others then 
			DBMS_OUTPUT.PUT_LINE('Данные не могут быть добавлены. ' || SQLERRM);
	commit;

end;



Create or replace procedure Request_Update(p_ID_Request int, p_Request_Number varchar, p_Manager_ID int, p_Client_ID int)
    is
     p_Exists_ID smallint;
	 p_Exists_Record smallint;
	 p_Request_Number_New varchar(8);
	 p_Client_Exists smallint;
	 p_Manager_Exists smallint;
	begin
    p_Request_Number_New := p_Request_Number;
    select count(*) into p_Exists_ID from Request where ID_Request = p_ID_Request;
    select count(*) into p_Client_Exists from Client where ID_Client = p_Client_ID;
    select count(*) into p_Manager_Exists from Manager where ID_Manager = p_Manager_ID;
    while length(p_Request_Number_New) < 8
    loop
		p_Request_Number_New := CONCAT('0',p_Request_Number_New);
	end loop;
    select count(*) into p_Exists_Record from Request where Request_Number = p_Request_Number_New;
		if p_Exists_Record > 0 then
			DBMS_OUTPUT.PUT_LINE('Запись с данным номером уже есть в таблице');
		else
			if p_Exists_ID = 0 then
				DBMS_OUTPUT.PUT_LINE('Невозможно обновить данные. Заявки с данным идентификатором не существует');
			else
				if p_Client_Exists = 0 then
					DBMS_OUTPUT.PUT_LINE('Клиента с указанным идентификатором нет');
				else
					if p_Manager_Exists = 0 then 
						DBMS_OUTPUT.PUT_LINE('Менеджера с указанным идентификатором нет');
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
        		exception 
        when VALUE_ERROR then 
			DBMS_OUTPUT.PUT_LINE('Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку');
		when DUP_VAL_ON_INDEX then
			DBMS_OUTPUT.PUT_LINE('Введённые данные не являются уникальными');
		when others then 
			DBMS_OUTPUT.PUT_LINE('Данные не могут быть добавлены. ' || SQLERRM);
	commit;

end; 



 
 
Create or replace procedure Request_Delete(p_ID_Request int)
is
    p_Exists_Cargo smallint;
    p_Exists_Delivery_Point smallint;
	begin
    select count(*) into p_Exists_Cargo from Cargo where Request_ID = p_ID_Request;
    select count(*) into p_Exists_Delivery_Point from Delivery_Point where Request_ID = p_ID_Request;
    if p_Exists_Cargo > 0 or p_Exists_Delivery_Point > 0 then
        DBMS_OUTPUT.PUT_LINE('Данные не могут быть удалены так как на них ссылаются значения из других таблиц');
    else
		delete from Request where ID_Request = p_ID_Request;
    end if;
	commit;

end; 




-----------------------------------------------------

 
Create or replace procedure Cargo_Insert(p_Cargo_Description varchar, p_Cargo_Width int, p_Cargo_Height int, p_Cargo_Length int, p_Cargo_Weight int, p_Cargo_Price int,  p_Request_ID int)
is
    p_Exists_Record smallint; 
    p_Exists_Request smallint;
	begin
    select count(*) into p_Exists_Record from Cargo where Cargo_Description = p_Cargo_Description
																	and Cargo_Width = p_Cargo_Width 
																	and p_Cargo_Height = Cargo_Height
																	and p_Cargo_Length = Cargo_Length
																	and p_Cargo_Weight = Cargo_Weight
																	and Cargo_price = p_Cargo_Price;
    select count(*) into p_Exists_Request from Request where ID_Request = p_Request_ID;
		if p_Exists_Request = 0 then 
			DBMS_OUTPUT.PUT_LINE('Введённой записи в таблице Заявка не существует');
		else 
			if p_Exists_Record > 0 then
				DBMS_OUTPUT.PUT_LINE('Введённый груз уже есть в базе');
			else
				if p_Cargo_Width < 0 or p_Cargo_Height < 0 or p_Cargo_Length < 0 or p_Cargo_Weight < 0 or p_Cargo_Price < 0 then
					DBMS_OUTPUT.PUT_LINE('Значения груза не могут быть отрицательными');
				else
					Insert into Cargo (Cargo_Description,	Cargo_Width,	Cargo_Height,	Cargo_Length,	Cargo_Weight,	Cargo_Price,	Request_ID)
						values (p_Cargo_Description, p_Cargo_Width, p_Cargo_Height,	p_Cargo_Length,	p_Cargo_Weight,	p_Cargo_Price,	p_Request_ID);
				end if;
			end if;
		end if;
        		exception 
        when VALUE_ERROR then 
			DBMS_OUTPUT.PUT_LINE('Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку');
		when DUP_VAL_ON_INDEX then
			DBMS_OUTPUT.PUT_LINE('Введённые данные не являются уникальными');
		when others then 
			DBMS_OUTPUT.PUT_LINE('Данные не могут быть добавлены. ' || SQLERRM);
	commit;

end; 



Create or replace procedure Cargo_Update(p_ID_Cargo int, p_Cargo_Description varchar, p_Cargo_Width int, p_Cargo_Height int, p_Cargo_Length int, p_Cargo_Weight int, p_Cargo_Price int,  p_Request_ID int)
	is
         p_Exists_ID smallint;
	 p_Exists_Record smallint;
	 p_Exists_Request smallint;
    begin


    select count(*) into p_Exists_ID from Cargo where ID_Cargo = p_ID_Cargo;
    select count(*) into p_Exists_Record from Cargo where Cargo_Description = p_Cargo_Description
																	and Cargo_Width = p_Cargo_Width 
																	and p_Cargo_Height = Cargo_Height
																	and p_Cargo_Length = Cargo_Length
																	and p_Cargo_Weight = Cargo_Weight
																	and Cargo_price = p_Cargo_Price;
    select count(*) into p_Exists_Request from Request where ID_Request = p_Request_ID;
		if p_Exists_ID = 0 then 
			DBMS_OUTPUT.PUT_LINE('Невозможно обновить таблицу. Груза с введёнными идентификатором нет');
		else
			if p_Exists_Record > 0 then 
				DBMS_OUTPUT.PUT_LINE('Введённый груз уже есть в базе');
			else 
				if p_Exists_Request = 0 then
					DBMS_OUTPUT.PUT_LINE('Введённой записи в таблице Заявка не существует');
				else
					if p_Cargo_Width < 0 or p_Cargo_Height < 0 or p_Cargo_Length < 0 or p_Cargo_Weight < 0 or p_Cargo_Price < 0 then
						DBMS_OUTPUT.PUT_LINE('Значения груза не могут быть отрицательными');
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
        		exception 
        when VALUE_ERROR then 
			DBMS_OUTPUT.PUT_LINE('Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку');
		when DUP_VAL_ON_INDEX then
			DBMS_OUTPUT.PUT_LINE('Введённые данные не являются уникальными');
		when others then 
			DBMS_OUTPUT.PUT_LINE('Данные не могут быть добавлены. ' || SQLERRM);
	commit;

end; 


 
Create or replace procedure Cargo_Delete(p_ID_Cargo int)
    is p_Exists_Combination_Route_Sheet_Cargo smallint;
	begin
    select count(*) into p_Exists_Combination_Route_Sheet_Cargo from Combination_Route_Sheet_Cargo where Cargo_ID = p_ID_Cargo;
        if p_Exists_Combination_Route_Sheet_Cargo > 0 then
            DBMS_OUTPUT.PUT_LINE('Данные не могут быть удалены так как на них ссылаются значения из других таблиц');
        else
		    delete from Cargo where ID_Cargo = p_ID_Cargo;
        end if;
	commit;

end; 





--------
--------------------------------------

Create or replace procedure Delivery_Point_Insert(p_Request_ID int, p_Delivery_Point_Destination varchar) 
    is
     p_Exists_Record smallint;
     p_Exists_Request smallint;
	begin
    select count(*) into p_Exists_Request from Request where ID_Request = p_Request_ID;
    select count(*) into p_Exists_Record from Delivery_Point where Request_ID = p_Request_ID and Delivery_Point_Destination = p_Delivery_Point_Destination;
		if p_Exists_Request = 0 then
			DBMS_OUTPUT.PUT_LINE('Введённой записи в таблице Заявка не существует');
		else
            if p_Exists_Record > 0 then
                DBMS_OUTPUT.PUT_LINE('Введённая запись уже есть в таблице');
            else
                insert into Delivery_Point(Request_ID, Delivery_Point_Destination)
                    values(p_Request_ID, p_Delivery_Point_Destination);
            end if;
		end if;
        		exception 
        when VALUE_ERROR then 
			DBMS_OUTPUT.PUT_LINE('Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку');
		when DUP_VAL_ON_INDEX then
			DBMS_OUTPUT.PUT_LINE('Введённые данные не являются уникальными');
		when others then 
			DBMS_OUTPUT.PUT_LINE('Данные не могут быть добавлены. ' || SQLERRM);
	commit;

end; 



 
Create or replace procedure Delivery_Point_Update(p_ID_Delivery_Point int, p_Delivery_Point_Mark varchar ,p_Request_ID int, p_Delivery_Point_Destination varchar)
is
         p_Exists_ID smallint; 
     p_Exists_Record smallint;
	 p_Exists_Request smallint;
	begin

    select count(*) into p_Exists_ID from Delivery_Point where ID_Delivery_Point = p_ID_Delivery_Point;
    select count(*) into p_Exists_Request from Request where ID_Request = p_Request_ID;
    select count(*) into p_Exists_Record from Delivery_Point where Request_ID = p_Request_ID and Delivery_Point_Destination = p_Delivery_Point_Destination;
		if p_Exists_ID = 0 then
			DBMS_OUTPUT.PUT_LINE('Невозможно обновить данные. Точки доставки с введённым идентификатором не существует');
		else
			if p_Exists_Request = 0 then
				DBMS_OUTPUT.PUT_LINE('Введённой записи в таблице Заявка не существует');
			else
                if p_Exists_Record > 0 then
                    DBMS_OUTPUT.PUT_LINE('Введённая запись уже есть в таблице');
                else
                    update delivery_Point set
                        Delivery_Point_Mark = p_Delivery_Point_Mark,
                        Request_ID = p_Request_ID,
                        Delivery_Point_Destination = p_Delivery_Point_Destination
                            where ID_Delivery_Point = p_ID_Delivery_Point;
                end if;
			end if;
		end if;
        		exception 
        when VALUE_ERROR then 
			DBMS_OUTPUT.PUT_LINE('Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку');
		when DUP_VAL_ON_INDEX then
			DBMS_OUTPUT.PUT_LINE('Введённые данные не являются уникальными');
		when others then 
			DBMS_OUTPUT.PUT_LINE('Данные не могут быть добавлены. ' || SQLERRM);
	commit;

end; 



 
Create or replace procedure Delivery_Point_Delete(p_ID_Delivery_Point int)
is
    p_Exists_Combination_Route_Sheet_Delivery_Point smallint;
	begin
    select count(*) into p_Exists_Combination_Route_Sheet_Delivery_Point from Combination_Route_Sheet_Delivery_Point where Delivery_Point_ID = p_ID_Delivery_Point; 
    if p_Exists_Combination_Route_Sheet_Delivery_Point > 0 then
        DBMS_OUTPUT.PUT_LINE('Данные не могут быть удалены так как на них ссылаются значения из других таблиц');
    else
		delete from Delivery_Point where ID_Delivery_Point = p_ID_Delivery_Point;
	end if;
	commit;

end; 



-----------------------------------------------------------------------------------------


 
Create or replace procedure Route_Sheet_Insert(p_Route_Sheet_Number varchar, p_Complexity_ID int, p_Vehicle_ID int, p_Driver_ID int)
is
     p_Exists_Record smallint;
	 p_Route_Sheet_Number_New varchar(8);
	 p_Complexity_Exists smallint;  
	 p_Vehicle_Exists smallint;  
	 p_Driver_Exists smallint;
	begin

    p_Route_Sheet_Number_New := p_Route_Sheet_Number;
    select count(*) into p_Complexity_Exists from Complexity where ID_Complexity = p_Complexity_ID;
    select count(*) into p_Vehicle_Exists from Vehicle where ID_Vehicle = p_Vehicle_ID;
    select count(*) into p_Driver_Exists from Driver where ID_Driver = p_Driver_ID;
		while LENGTH(p_Route_Sheet_Number_New) < 8
        loop
			p_Route_Sheet_Number_New := CONCAT('0',p_Route_Sheet_Number_New);
		end loop;
		select count(*) into p_Exists_Record from Route_Sheet where Route_Sheet_Number = p_Route_Sheet_Number_New;
		if p_Exists_Record > 0 then
			DBMS_OUTPUT.PUT_LINE('Запись с данным номером уже есть в таблице');
		else
			if p_Complexity_Exists = 0 then
				DBMS_OUTPUT.PUT_LINE('Сложности с указанным идентификатором нет');
			else
				if p_Vehicle_Exists = 0 then
					DBMS_OUTPUT.PUT_LINE('Автомобиля с указанным идентификатором нет');
				else
					if p_Driver_Exists = 0 then
						DBMS_OUTPUT.PUT_LINE('Водителя с указанным идентификатором нет');
					else
						insert into Route_Sheet(Route_Sheet_Number,Complexity_ID,Vehicle_ID,Driver_ID)
							values(p_Route_Sheet_Number_New, p_Complexity_ID, p_Vehicle_ID, p_Driver_ID);
					end if;
				end if;
			end if;
		end if;
        		exception 
        when VALUE_ERROR then 
			DBMS_OUTPUT.PUT_LINE('Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку');
		when DUP_VAL_ON_INDEX then
			DBMS_OUTPUT.PUT_LINE('Введённые данные не являются уникальными');
		when others then 
			DBMS_OUTPUT.PUT_LINE('Данные не могут быть добавлены. ' || SQLERRM);
	commit;

end; 

	



 
Create or replace procedure Route_Sheet_Update(p_ID_Route_Sheet int, p_Route_Sheet_Number varchar, p_Complexity_ID int, p_Vehicle_ID int, p_Driver_ID int)
    is
     p_Exists_ID smallint; 
     p_Exists_Record smallint;
	 p_Route_Sheet_Number_New varchar(8);
	 p_Complexity_Exists smallint;  
	 p_Vehicle_Exists smallint;  
	 p_Driver_Exists smallint; 
	begin
    select count(*) into p_Exists_ID from Route_Sheet where ID_Route_Sheet = p_ID_Route_Sheet;
    p_Route_Sheet_Number_New := p_Route_Sheet_Number;
    select count(*) into p_Complexity_Exists from Complexity where ID_Complexity = p_Complexity_ID;
    select count(*) into p_Vehicle_Exists from Vehicle where ID_Vehicle = p_Vehicle_ID;
    select count(*) into p_Driver_Exists from Driver where ID_Driver = p_Driver_ID;
    while LENGTH(p_Route_Sheet_Number_New) < 8
    loop
		p_Route_Sheet_Number_New := CONCAT('0',p_Route_Sheet_Number_New);
	end loop;
	select count(*) into p_Exists_Record from Route_Sheet where Route_Sheet_Number = p_Route_Sheet_Number_New;
		if p_Exists_ID = 0 then
			DBMS_OUTPUT.PUT_LINE('Невозможно обновить данные. Маршрутного листа с введённым идентификатором не существует');
		else
			if p_Exists_Record > 0 then
				DBMS_OUTPUT.PUT_LINE('Запись с данным номером уже есть в таблице');
			else
				if p_Complexity_Exists = 0 then
					DBMS_OUTPUT.PUT_LINE('Сложности с указанным идентификатором нет');
				else
					if p_Vehicle_Exists = 0 then
						DBMS_OUTPUT.PUT_LINE('Автомобиля с указанным идентификатором нет');
					else
						if p_Driver_Exists = 0 then
							DBMS_OUTPUT.PUT_LINE('Водителя с указанным идентификатором нет');
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
         		exception 
        when VALUE_ERROR then 
			DBMS_OUTPUT.PUT_LINE('Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку');
		when DUP_VAL_ON_INDEX then
			DBMS_OUTPUT.PUT_LINE('Введённые данные не являются уникальными');
		when others then 
			DBMS_OUTPUT.PUT_LINE('Данные не могут быть добавлены. ' || SQLERRM);
	commit;

end; 

	


 
Create or replace procedure Route_Sheet_Delete(p_ID_Route_Sheet int)
    is
    p_Exists_Combination_Route_Sheet_Delivery_Point smallint;
    p_Exists_Combination_Route_Sheet_Cargo smallint;
	begin
    select count(*) into p_Exists_Combination_Route_Sheet_Delivery_Point from Combination_Route_Sheet_Delivery_Point where Route_Sheet_ID = p_ID_Route_Sheet;
    select count(*) into p_Exists_Combination_Route_Sheet_Cargo from Combination_Route_Sheet_Cargo where Route_Sheet_ID = p_ID_Route_Sheet;
        if p_Exists_Combination_Route_Sheet_Cargo > 0 or p_Exists_Combination_Route_Sheet_Cargo > 0 then
            DBMS_OUTPUT.PUT_LINE('Данные не могут быть удалены так как на них ссылаются значения из других таблиц');
        else
		    delete from Route_Sheet where ID_Route_Sheet = p_ID_Route_Sheet;
        end if;
	commit;

end; 

-----------------------------------------------------------------------------------------


 
Create or replace procedure Combination_Route_Sheet_Delivery_Point_Insert(p_Route_Sheet_ID int, p_Delivery_Point_ID int)
    is
     p_Exists_Record smallint; 
	 p_Exists_Route_Sheet smallint; 
	 p_Exists_Delivery_Point smallint;
	begin
    select count(*) into p_Exists_Record from Combination_Route_Sheet_Delivery_Point where Route_Sheet_ID = p_Route_Sheet_ID and 
																								 Delivery_Point_ID = p_Delivery_Point_ID;
    select count(*) into p_Exists_Route_Sheet from Route_Sheet where ID_Route_Sheet = p_Route_Sheet_ID;
    select count(*) into p_Exists_Delivery_Point  from Delivery_Point where ID_Delivery_Point = p_Delivery_Point_ID;
	if p_Exists_Record > 0 then
		DBMS_OUTPUT.PUT_LINE('Введённая запись уже есть в таблице');
	else
		if p_Exists_Route_Sheet = 0 then
			DBMS_OUTPUT.PUT_LINE('Введённой записи нету в таблице Маршрутный лист');
		else
			if p_Exists_Delivery_Point = 0 then
				DBMS_OUTPUT.PUT_LINE('Введённой записи нету в таблице Точки доставки');
			else
				insert into Combination_Route_Sheet_Delivery_Point(Route_Sheet_ID, Delivery_Point_ID)
					values(p_Route_Sheet_ID, p_Delivery_Point_ID);
			end if;
		end if;
	end if;
    		exception 
        when VALUE_ERROR then 
			DBMS_OUTPUT.PUT_LINE('Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку');
		when DUP_VAL_ON_INDEX then
			DBMS_OUTPUT.PUT_LINE('Введённые данные не являются уникальными');
		when others then 
			DBMS_OUTPUT.PUT_LINE('Данные не могут быть добавлены. ' || SQLERRM);
	commit;

end; 




 
Create or replace procedure Combination_Route_Sheet_Delivery_Point_Update(p_ID_Combination_Route_Sheet_Delivery_Point int, p_Route_Sheet_ID int, p_Delivery_Point_ID int)
	is
     p_Exists_ID smallint;
     p_Exists_Record smallint; 
	 p_Exists_Route_Sheet smallint; 
	 p_Exists_Delivery_Point smallint;
    begin
    select count(*) into p_Exists_ID  from Combination_Route_Sheet_Delivery_Point where ID_Combination_Route_Sheet_Delivery_Point = p_ID_Combination_Route_Sheet_Delivery_Point;
    select count(*) into p_Exists_Record from Combination_Route_Sheet_Delivery_Point where Route_Sheet_ID = p_Route_Sheet_ID and 
																								 Delivery_Point_ID = p_Delivery_Point_ID;
    select count(*) into p_Exists_Route_Sheet from Route_Sheet where ID_Route_Sheet = p_Route_Sheet_ID;
    select count(*) into p_Exists_Delivery_Point  from Delivery_Point where ID_Delivery_Point = p_Delivery_Point_ID;
	if p_Exists_ID = 0 then
		DBMS_OUTPUT.PUT_LINE('Невозможно обновить таблицу. Данных с введённым идентификатором нет');
	else
		if p_Exists_Record > 0 then
			DBMS_OUTPUT.PUT_LINE('Введённая запись уже есть в таблице');
		else
			if p_Exists_Route_Sheet = 0 then
				DBMS_OUTPUT.PUT_LINE('Введённой записи нету в таблице Маршрутный лист');
			else
				if p_Exists_Delivery_Point = 0 then
					DBMS_OUTPUT.PUT_LINE('Введённой записи нету в таблице Точки доставки');
				else
					update Combination_Route_Sheet_Delivery_Point set
						Route_Sheet_ID = p_Route_Sheet_ID,
						Delivery_Point_ID = p_Delivery_Point_ID
						where ID_Combination_Route_Sheet_Delivery_Point = p_ID_Combination_Route_Sheet_Delivery_Point;
				end if;
			 end if;
		 end if;
	 end if;
     		exception 
        when VALUE_ERROR then 
			DBMS_OUTPUT.PUT_LINE('Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку');
		when DUP_VAL_ON_INDEX then
			DBMS_OUTPUT.PUT_LINE('Введённые данные не являются уникальными');
		when others then 
			DBMS_OUTPUT.PUT_LINE('Данные не могут быть добавлены. ' || SQLERRM);
	commit;

end; 



 
Create or replace procedure Combination_Route_Sheet_Delivery_Point_Delete(p_ID_Combination_Route_Sheet_Delivery_Point int)
	begin
		delete from Combination_Route_Sheet_Delivery_Point where ID_Combination_Route_Sheet_Delivery_Point = p_ID_Combination_Route_Sheet_Delivery_Point;
	commit;

end; 



-------------------------------------------------------


 
Create or replace procedure Combination_Route_Sheet_Cargo_Insert(p_Route_Sheet_ID int, p_Cargo_ID int)
	is
     p_Exists_Record smallint;  
	 p_Exists_Route_Sheet smallint; 
	 p_Exists_Cargo smallint;

    begin
    select count(*) into p_Exists_Record from Combination_Route_Sheet_Cargo where Route_Sheet_ID = p_Route_Sheet_ID and 
																								 Cargo_ID = p_Cargo_ID;
    select count(*) into p_Exists_Route_Sheet from Route_Sheet where ID_Route_Sheet = p_Route_Sheet_ID;
    select count(*) into p_Exists_Cargo  from Cargo where ID_Cargo = p_Cargo_ID;
	if p_Exists_Record > 0 then
		DBMS_OUTPUT.PUT_LINE('Введённая запись уже есть в таблице');
	else
		if p_Exists_Route_Sheet = 0 then
			DBMS_OUTPUT.PUT_LINE('Введённой записи нету в таблице Маршрутный лист');
		else
			if p_Exists_Cargo = 0 then
				DBMS_OUTPUT.PUT_LINE('Введённой записи нету в таблице Точки доставки');
			else
				insert into Combination_Route_Sheet_Cargo(Route_Sheet_ID, Cargo_ID)
					values(p_Route_Sheet_ID, p_Cargo_ID);
			end if;
		end if;
	end if;
    		exception 
        when VALUE_ERROR then 
			DBMS_OUTPUT.PUT_LINE('Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку');
		when DUP_VAL_ON_INDEX then
			DBMS_OUTPUT.PUT_LINE('Введённые данные не являются уникальными');
		when others then 
			DBMS_OUTPUT.PUT_LINE('Данные не могут быть добавлены. ' || SQLERRM);
	commit;

end; 




 
Create or replace procedure Combination_Route_Sheet_Cargo_Update(p_ID_Combination_Route_Sheet_Cargo int, p_Route_Sheet_ID int, p_Cargo_ID int)
	 p_Exists_ID smallint;  
     p_Exists_Record smallint;  
	 p_Exists_Route_Sheet smallint; 
	 p_Exists_Cargo smallint; 
    begin
    select count(*) into p_Exists_ID from Combination_Route_Sheet_Cargo where ID_Combination_Route_Sheet_Cargo = p_ID_Combination_Route_Sheet_Cargo;
    select count(*) into p_Exists_Record from Combination_Route_Sheet_Cargo where Route_Sheet_ID = p_Route_Sheet_ID and 
																								 Cargo_ID = p_Cargo_ID;
    select count(*) into p_Exists_Route_Sheet from Route_Sheet where ID_Route_Sheet = p_Route_Sheet_ID;
    select count(*) into p_Exists_Cargo  from Cargo where ID_Cargo = p_Cargo_ID;
	if p_Exists_ID = 0 then
		DBMS_OUTPUT.PUT_LINE('Невозможно обновить таблицу. Данных с введённым идентификатором нет');
	else
		if p_Exists_Record > 0 then
			DBMS_OUTPUT.PUT_LINE('Введённая запись уже есть в таблице');
		else
			if p_Exists_Route_Sheet = 0 then
				DBMS_OUTPUT.PUT_LINE('Введённой записи нету в таблице Маршрутный лист');
			else
				if p_Exists_Cargo = 0 then
					DBMS_OUTPUT.PUT_LINE('Введённой записи нету в таблице Точки доставки');
				else
					update Combination_Route_Sheet_Cargo set
						Route_Sheet_ID = p_Route_Sheet_ID,
						Cargo_ID = p_Cargo_ID
						where ID_Combination_Route_Sheet_Cargo = p_ID_Combination_Route_Sheet_Cargo;
				end if;
			 end if;
		 end if;
	 end if;
     		exception 
        when VALUE_ERROR then 
			DBMS_OUTPUT.PUT_LINE('Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку');
		when DUP_VAL_ON_INDEX then
			DBMS_OUTPUT.PUT_LINE('Введённые данные не являются уникальными');
		when others then 
			DBMS_OUTPUT.PUT_LINE('Данные не могут быть добавлены. ' || SQLERRM);
	commit;

end; 


 
Create or replace procedure Combination_Route_Sheet_Cargo_Delete(p_ID_Combination_Route_Sheet_Cargo int)
	begin
		delete from Combination_Route_Sheet_Cargo where ID_Combination_Route_Sheet_Cargo = p_ID_Combination_Route_Sheet_Cargo;
	commit;

end; 

