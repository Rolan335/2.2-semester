
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
	end;



--Работает
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------




Create or replace procedure Manager_Update (p_ID_Manager int, p_Manager_Surname varchar(30), p_Manager_Name varchar(30), p_Manager_Second_Name varchar(30),
										   p_Manager_Passport_Series varchar(4), p_Manager_Passport_Number varchar(6), p_Manager_ITN varchar(10), 
											P_Manager_SNILS varchar(14))
language plpgsql
as $$
	declare p_Exists_Record smallint := count(*) from Manager where ID_Manager = p_ID_Manager;
	begin
		if p_Exists_Record = 0 then
			raise notice 'Невозможно обновить данные. Менеджера с введёным идентификатором не существует';
			
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
		exception when SQLSTATE '23514' or SQLSTATE '22001' then 
			raise notice 'Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку';
		when SQLSTATE '23505' then
			raise notice 'Введённые данные не являются уникальными';
		when others then 
			raise notice '% %', 'Данные не могут быть добавлены. Код ошибки -', SQLSTATE;
	end;
$$;




Create or replace procedure Manager_Insert (p_Manager_Surname varchar(30), p_Manager_Name varchar(30), p_Manager_Second_Name varchar(30),
										   p_Manager_Passport_Series varchar(4), p_Manager_Passport_Number varchar(6), p_Manager_ITN varchar(10), 
											p_Manager_SNILS varchar(14))
language plpgsql
as $$
		declare p_Exists_Record smallint := count(*) from Manager where Manager_ITN = p_Manager_ITN and Manager_SNILS = p_Manager_SNILS;
	begin
		if p_Exists_Record > 0 then
			raise notice 'Менеджер с введёнными данными уже есть в системе';
			
		else
				Insert into Manager (Manager_Surname, Manager_Name, Manager_Second_Name,	Manager_Passport_Series,	Manager_Passport_Number,	Manager_ITN, Manager_SNILS)
				values (p_Manager_Surname, p_Manager_Name, p_Manager_Second_Name,	p_Manager_Passport_Series,	p_Manager_Passport_Number,	p_Manager_ITN, p_Manager_SNILS);
		end if;
		exception when SQLSTATE '23514' or SQLSTATE '22001' then 
			raise notice 'Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку';
		when SQLSTATE '23505' then
			raise notice 'Введённые данные не являются уникальными';
		when others then 
			raise notice '% %', 'Данные не могут быть добавлены. Код ошибки -', SQLSTATE;

	end;
$$;




Create or replace procedure Manager_Delete (p_ID_Manager int)
language plpgsql
as $$

	begin
		delete from Manager where ID_Manager = p_ID_Manager;
	  
	  exception when SQLSTATE '23503' then
	  	raise notice 'Данные не могут быть удалены так как на них ссылаются значения из других таблиц';
	end;

$$;

--Работает
-----------------------------------------------------------------------------------


Create or replace procedure Driver_Insert (p_Driver_Passport_Series varchar(4),p_Driver_Passport_Number varchar(6),p_Driver_SNILS varchar(14),
										   p_Driver_FFOMI varchar(16),p_Driver_License_Series varchar(4),p_Driver_License_Number varchar(6),
										  p_Driver_Surname varchar(30), p_Driver_Name varchar(30), p_Driver_Second_Name varchar(30))
language plpgsql
as $$

	declare p_Exists_Record smallint := count(*) from Driver where Driver_SNILS = p_Driver_SNILS and Driver_FFOMI = p_Driver_FFOMI;
	begin
	if p_Exists_Record > 0 then 
		raise notice 'Водитель с введёнными данными есть в системе';
	else
		Insert into Driver (Driver_Passport_Series,	Driver_Passport_Number,	Driver_Snils,	Driver_FFOMI,	Driver_License_Series,	Driver_License_Number,	Driver_Surname,	Driver_Name,	Driver_Second_Name)
		values (p_Driver_Passport_Series,	p_Driver_Passport_Number,	p_Driver_Snils,	p_Driver_FFOMI,	p_Driver_License_Series,	p_Driver_License_Number,	p_Driver_Surname,	p_Driver_Name,	p_Driver_Second_Name);
	end if;
	exception when SQLSTATE '23514' or SQLSTATE '22001' then 
			raise notice 'Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку';
		when SQLSTATE '23505' then
			raise notice 'Введённые данные не являются уникальными';
		when others then 
			raise notice '% %', 'Данные не могут быть добавлены. Код ошибки -', SQLSTATE;
	end;
$$;

Create or replace procedure Driver_Update (p_ID_Driver int,p_Driver_Passport_Series varchar(4),p_Driver_Passport_Number varchar(6),p_Driver_SNILS varchar(14),
										   p_Driver_FFOMI varchar(16),p_Driver_License_Series varchar(4),p_Driver_License_Number varchar(6),
										  p_Driver_Surname varchar(30), p_Driver_Name varchar(30), p_Driver_Second_Name varchar(30))
language plpgsql
as $$

	declare p_Exists_Record smallint := count(*) from Driver where ID_Driver = p_ID_Driver;
	begin
	if p_Exists_Record = 0 then 
		raise notice 'Невозможно обновить данные. Водителя с введёным идентификатором не существует';
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
	exception when SQLSTATE '23514' or SQLSTATE '22001' then 
			raise notice 'Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку';
		when SQLSTATE '23505' then
			raise notice 'Введённые данные не являются уникальными';
		when others then 
			raise notice '% %', 'Данные не могут быть добавлены. Код ошибки -', SQLSTATE;
	end;
	
$$;

Create or replace procedure Driver_Delete (p_ID_Driver int)
language plpgsql
as $$

	begin
		delete from Driver where ID_Driver = p_ID_Driver;
	  
	  exception when SQLSTATE '23503' then
	  	raise notice 'Данные не могут быть удалены так как на них ссылаются значения из других таблиц';
	end;

$$;


--Работает
--------------------------------------------------------------------------------------------------------------------

Create or replace procedure Vehicle_Insert (p_Vehicle_Width int, p_Vehicle_Height int, p_Vehicle_Length int, p_Vehicle_Capacity int, p_Vehicle_State_Number varchar(10))
language plpgsql
as $$
	declare p_Exists_Record smallint := count(*) from Vehicle where Vehicle_State_Number = p_Vehicle_State_Number;
	begin
		if p_Exists_Record > 0 then
			raise notice 'Автомобиль с введёнными данными есть в системе';
		else
			if p_Vehicle_Width < 0 or p_Vehicle_Height < 0 or p_Vehicle_Length < 0 or p_Vehicle_Capacity < 0 then
				raise notice 'Параметры автомобиля не могут быть отрицательными';
			else
				Insert into Vehicle (Vehicle_Width, Vehicle_Height, Vehicle_Length, Vehicle_Capacity, Vehicle_State_Number)
				values (p_Vehicle_Width, p_Vehicle_Height, p_Vehicle_Length, p_Vehicle_Capacity, p_Vehicle_State_Number);
			end if;
		end if;
		exception when SQLSTATE '23514' or SQLSTATE '22001' then 
			raise notice 'Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку';
		when SQLSTATE '23505' then
			raise notice 'Введённые данные не являются уникальными';
		when others then 
			raise notice '% %', 'Данные не могут быть добавлены. Код ошибки -', SQLSTATE;
	end;
$$;

Create or replace procedure Vehicle_Update (p_ID_Vehicle int, p_Vehicle_Width int, p_Vehicle_Height int, p_Vehicle_Length int, p_Vehicle_Capacity int, p_Vehicle_State_Number varchar(10))
language plpgsql
as $$
	declare p_Exists_Record smallint := count(*) from Vehicle where ID_Vehicle = p_ID_Vehicle;
	begin
		if p_Exists_Record = 0 then
			raise notice 'Невозможно обновить данные. Автомобиля с введёным идентификатором не существует';
		else
			if p_Vehicle_Width < 0 or p_Vehicle_Height < 0 or p_Vehicle_Length < 0 or p_Vehicle_Capacity < 0 then
				raise notice 'Параметры автомобиля не могут быть отрицательными';
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
		exception when SQLSTATE '23514' or SQLSTATE '22001' then 
			raise notice 'Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку';
		when SQLSTATE '23505' then
			raise notice 'Введённые данные не являются уникальными';
		when others then 
			raise notice '% %', 'Данные не могут быть добавлены. Код ошибки -', SQLSTATE;
	end;
$$;

Create or replace procedure Vehicle_Delete (p_ID_Vehicle int)
language plpgsql
as $$

	begin
		delete from Vehicle where ID_Vehicle = p_ID_Vehicle;
	  
	  exception when SQLSTATE '23503' then
	  	raise notice 'Данные не могут быть удалены так как на них ссылаются значения из других таблиц';
	end;

$$;

--Работает

-------------------------------------------------------------

create or replace procedure Complexity_Insert(p_Complexity_Level int)
language plpgsql
as $$
	begin
		if p_Complexity_Level < 0 then
			raise notice 'Уровень сложности не может быть отрицательным';
		else
			insert into complexity(complexity_Level)
				values(p_Complexity_Level);
		end if;
		exception when SQLSTATE '23514' or SQLSTATE '22001' then 
			raise notice 'Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку';
		when SQLSTATE '23505' then
			raise notice 'Введённые данные не являются уникальными';
		when others then 
			raise notice '% %', 'Данные не могут быть добавлены. Код ошибки -', SQLSTATE;
	end;
$$;

create or replace procedure Complexity_Update(p_ID_Complexity int, p_Complexity_Level int)
language plpgsql
as $$
	
	declare p_Exists_Record smallint := count(*) from complexity where ID_Complexity = p_ID_Complexity;
	begin
	if p_Exists_Record = 0 then
		raise notice 'Невозможно обновить сложность. Сложности с введённым идентификатором не существует';
	else
		if p_Complexity_Level < 0 then
			raise notice 'Уровень сложности не может быть отрицательным';
		else
			update complexity set 
                complexity_level = p_Complexity_Level
                where ID_Complexity = p_ID_Complexity;
		end if;
	end if;
		exception when SQLSTATE '23514' or SQLSTATE '22001' then 
			raise notice 'Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку';
		when SQLSTATE '23505' then
			raise notice 'Введённые данные не являются уникальными';
		when others then 
			raise notice '% %', 'Данные не могут быть добавлены. Код ошибки -', SQLSTATE;
	end;
$$;

create or replace procedure Complexity_Delete(p_ID_Complexity int)
language plpgsql
as $$
	begin
		delete from Complexity where ID_Complexity = p_ID_Complexity;
	  
	  exception when SQLSTATE '23503' then
	  	raise notice 'Данные не могут быть удалены так как на них ссылаются значения из других таблиц';

	end;
$$;


--Работает

----------------------------------------------------

create or replace procedure Request_Insert(p_Request_Number varchar(8), p_Manager_ID int, p_Client_ID int)
language plpgsql
as $$
	declare p_Exists_Record smallint;
	declare p_Request_Number_New varchar(8) := p_Request_Number;
	declare p_Client_Exists smallint := count(*) from Client where ID_Client = p_Client_ID;
	declare p_Manager_Exists smallint := count(*) from Manager where ID_Manager = p_Manager_ID;
	begin
		while LENGTH(p_Request_Number_New) < 8 loop
			p_Request_Number_New := '0'||p_Request_Number_New;
		end loop;
		p_Exists_Record := count(*) from Request where Request_Number = p_Request_Number_New;
		if p_Exists_Record > 0 then
			raise notice 'Запись с данным номером уже есть в таблице';
		else
			if p_Client_Exists = 0 then
				raise notice 'Клиента с указанным идентификатором нет';
			else
				if p_Manager_Exists = 0 then 
					raise notice 'Менеджера с указанным идентификатором нет';
				else
					insert into Request(Request_Number, Client_ID, Manager_ID)
						values(p_Request_Number_New, p_Client_ID, p_Manager_ID);
				end if;
			end if;
		end if;
		exception when SQLSTATE '23514' or SQLSTATE '22001' then 
			raise notice 'Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку';
		when others then 
			raise notice '% %', 'Данные не могут быть добавлены. Код ошибки -', SQLSTATE;
	end;
$$;


create or replace procedure Request_Update(p_ID_Request int, p_Request_Number varchar(8), p_Manager_ID int, p_Client_ID int)
language plpgsql
as $$
	declare p_Exists_ID smallint := count(*) from Request where ID_Request = p_ID_Request;
	declare p_Exists_Record smallint;
	declare p_Request_Number_New varchar(8) := p_Request_Number;
	declare p_Client_Exists smallint := count(*) from Client where ID_Client = p_Client_ID;
	declare p_Manager_Exists smallint := count(*) from Manager where ID_Manager = p_Manager_ID;
	begin
		while LENGTH(p_Request_Number_New) < 8 loop
			p_Request_Number_New := '0'||p_Request_Number_New;
		end loop;
		p_Exists_Record := count(*) from Request where Request_Number = p_Request_Number_New;
		if p_Exists_Record > 0 then
			raise notice 'Запись с данным номером уже есть в таблице';
		else
			if p_Exists_ID = 0 then
				raise notice 'Невозможно обновить данные. Заявки с данным идентификатором не существует';
			else
				if p_Client_Exists = 0 then
					raise notice 'Клиента с указанным идентификатором нет';
				else
					if p_Manager_Exists = 0 then 
						raise notice 'Менеджера с указанным идентификатором нет';
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
		exception when SQLSTATE '23514' or SQLSTATE '22001' then 
			raise notice 'Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку';
		when others then 
			raise notice '% %', 'Данные не могут быть добавлены. Код ошибки -', SQLSTATE;
	end;
$$;

create or replace procedure Request_Delete(p_ID_Request int)
language plpgsql
as $$
	begin
		delete from Request where ID_Request = p_ID_Request;
	  
	  exception when SQLSTATE '23503' then
	  	raise notice 'Данные не могут быть удалены так как на них ссылаются значения из других таблиц';

	end;
$$;


-----------------------------------------------------

Create or replace procedure Cargo_Insert(p_Cargo_Description varchar(200), p_Cargo_Width int, p_Cargo_Height int, p_Cargo_Length int, p_Cargo_Weight int, p_Cargo_Price int,  p_Request_ID int)
language plpgsql
as $$
	declare p_Exists_Record smallint := count(*) from Cargo where Cargo_Description = p_Cargo_Description
																	and Cargo_Width = p_Cargo_Width 
																	and p_Cargo_Height = Cargo_Height
																	and p_Cargo_Length = Cargo_Length
																	and p_Cargo_Weight = Cargo_Weight
																	and Cargo_price = p_Cargo_Price;
	declare p_Exists_Request smallint := count(*) from Request where ID_Request = p_Request_ID;
	begin
		if p_Exists_Request = 0 then 
			raise notice 'Введённой записи в таблице Заявка не существует';
		else 
			if p_Exists_Record > 0 then
				raise notice 'Введённый груз уже есть в базе';
			else
				if p_Cargo_Width < 0 or p_Cargo_Height < 0 or p_Cargo_Length < 0 or p_Cargo_Weight < 0 or p_Cargo_Price < 0 then
					raise notice 'Значения груза не могут быть отрицательными';
				else
					Insert into Cargo (Cargo_Description,	Cargo_Width,	Cargo_Height,	Cargo_Length,	Cargo_Weight,	Cargo_Price,	Request_ID)
						values (p_Cargo_Description, p_Cargo_Width, p_Cargo_Height,	p_Cargo_Length,	p_Cargo_Weight,	p_Cargo_Price,	p_Request_ID);
				end if;
			end if;
		end if;
		exception when SQLSTATE '23514' or SQLSTATE '22001' then 
			raise notice 'Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку';
		when others then 
			raise notice '% %', 'Данные не могут быть добавлены. Код ошибки -', SQLSTATE;
	end;
$$;

Create or replace procedure Cargo_Update(p_ID_Cargo int, p_Cargo_Description varchar(200), p_Cargo_Width int, p_Cargo_Height int, p_Cargo_Length int, p_Cargo_Weight int, p_Cargo_Price int,  p_Request_ID int)
language plpgsql
as $$
	declare p_Exists_ID smallint := count(*) from Cargo where ID_Cargo = p_ID_Cargo;
	declare p_Exists_Record smallint := count(*) from Cargo where Cargo_Description = p_Cargo_Description
																	and Cargo_Width = p_Cargo_Width 
																	and Cargo_Height = p_Cargo_Height
																	and Cargo_Length = p_Cargo_Length
																	and Cargo_Weight = p_Cargo_Weight
																	and Cargo_Price = p_Cargo_Price;
	declare p_Exists_Request smallint := count(*) from Request where ID_Request = p_Request_ID;
	begin
		if p_Exists_ID = 0 then 
			raise notice 'Невозможно обновить таблицу. Груза с введёнными идентификатором нет';
		else
			if p_Exists_Record > 0 then 
				raise notice 'Введённый груз уже есть в базе';
			else 
				if p_Exists_Request = 0 then
					raise notice 'Введённой записи в таблице Заявка не существует';
				else
					if p_Cargo_Width < 0 or p_Cargo_Height < 0 or p_Cargo_Length < 0 or p_Cargo_Weight < 0 or p_Cargo_Price < 0 then
						raise notice 'Значения груза не могут быть отрицательными';
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
		exception when SQLSTATE '23514' or SQLSTATE '22001' then 
			raise notice 'Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку';
		when others then 
			raise notice '% %', 'Данные не могут быть добавлены. Код ошибки -', SQLSTATE;
	end;
$$;

create or replace procedure Cargo_Delete(p_ID_Cargo int)
language plpgsql
as $$
	begin
		delete from Cargo where ID_Cargo = p_ID_Cargo;
	  
	  exception when SQLSTATE '23503' then
	  	raise notice 'Данные не могут быть удалены так как на них ссылаются значения из других таблиц';

	end;
$$;


--Работает
--------------------------------------

Create or replace procedure Delivery_Point_Insert(p_Request_ID int, p_Delivery_Point_Destination varchar(200))
language plpgsql
as $$
-- 	declare p_Exists_Record smallint := count(*) from Delivery_Point where Delivery_Point_Destination = p_Delivery_Point_Destination 
-- не используем т.к. каждая точка доставки и пометка отвечают за одну самостоятельную доставку, а на один адрес может быть несколько не зависящих друг от друга доставок   
	declare p_Exists_Request smallint := count(*) from Request where ID_Request = p_Request_ID;
	begin
		if p_Exists_Request = 0 then
			raise notice 'Введённой записи в таблице Заявка не существует';
		else
			insert into Delivery_Point(Request_ID, Delivery_Point_Destination)
				values(p_Request_ID, p_Delivery_Point_Destination);
		end if;
		exception when SQLSTATE '23514' or SQLSTATE '22001' then 
			raise notice 'Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку';
		when others then 
			raise notice '% %', 'Данные не могут быть добавлены. Код ошибки -', SQLSTATE;
	end;
$$;

Create or replace procedure Delivery_Point_Update(p_ID_Delivery_Point int, p_Delivery_Point_Mark varchar(1) ,p_Request_ID int, p_Delivery_Point_Destination varchar(200))
language plpgsql
as $$
	declare p_Exists_Record smallint := count(*) from Delivery_Point where ID_Delivery_Point = p_ID_Delivery_Point;
	declare p_Exists_Request smallint := count(*) from Request where ID_Request = p_Request_ID;
	begin
		if p_Exists_Record = 0 then
			raise notice 'Невозможно обновить данные. Точки доставки с введённым идентификатором не существует';
		else
			if p_Exists_Request = 0 then
				raise notice 'Введённой записи в таблице Заявка не существует';
			else
				update delivery_Point set
					Delivery_Point_Mark = p_Delivery_Point_Mark,
					Request_ID = p_Request_ID,
					Delivery_Point_Destination = p_Delivery_Point_Destination
						where ID_Delivery_Point = p_ID_Delivery_Point;
			end if;
		end if;
		exception when SQLSTATE '23514' or SQLSTATE '22001' then 
			raise notice 'Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку';
		when others then 
			raise notice '% %', 'Данные не могут быть добавлены. Код ошибки -', SQLSTATE;
	end;
$$;

create or replace procedure Delivery_Point_Delete(p_ID_Delivery_Point int)
language plpgsql
as $$
	begin
		delete from Delivery_Point where ID_Delivery_Point = p_ID_Delivery_Point;
	  
	  exception when SQLSTATE '23503' then
	  	raise notice 'Данные не могут быть удалены так как на них ссылаются значения из других таблиц';

	end;
$$;

-----------------------------------------------------------------------------------------


create or replace procedure Route_Sheet_Insert(p_Route_Sheet_Number varchar(8), p_Complexity_ID int, p_Vehicle_ID int, p_Driver_ID int)
language plpgsql 
as $$
	declare p_Exists_Record smallint;
	declare p_Route_Sheet_Number_New varchar(8) := p_Route_Sheet_Number;
	declare p_Complexity_Exists smallint := count(*) from Complexity where ID_Complexity = p_Complexity_ID;
	declare p_Vehicle_Exists smallint := count(*) from Vehicle where ID_Vehicle = p_Vehicle_ID;
	declare p_Driver_Exists smallint := count(*) from Driver where ID_Driver = p_Driver_ID;
	begin
		while LENGTH(p_Route_Sheet_Number_New) < 8 loop
			p_Route_Sheet_Number_New := '0'||p_Route_Sheet_Number_New;
		end loop;
		p_Exists_Record := count(*) from Route_Sheet where Route_Sheet_Number = p_Route_Sheet_Number_New;
		if p_Exists_Record > 0 then
			raise notice 'Запись с данным номером уже есть в таблице';
		else
			if p_Complexity_Exists = 0 then
				raise notice 'Сложности с указанным идентификатором нет';
			else
				if p_Vehicle_Exists = 0 then
					raise notice 'Автомобиля с указанным идентификатором нет';
				else
					if p_Driver_Exists = 0 then
						raise notice 'Водителя с указанным идентификатором нет';
					else
						insert into Route_Sheet(Route_Sheet_Number,Complexity_ID,Vehicle_ID,Driver_ID)
							values(p_Route_Sheet_Number_New, p_Complexity_ID, p_Vehicle_ID, p_Driver_ID);
					end if;
				end if;
			end if;
		end if;
	exception when SQLSTATE '23514' or SQLSTATE '22001' then 
			raise notice 'Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку';
		when others then 
			raise notice '% %', 'Данные не могут быть добавлены. Код ошибки -', SQLSTATE;
	end;
$$;	



create or replace procedure Route_Sheet_Update(p_ID_Route_Sheet int, p_Route_Sheet_Number varchar(8), p_Complexity_ID int, p_Vehicle_ID int, p_Driver_ID int)
language plpgsql 
as $$
	declare p_Exists_ID smallint := count(*) from Route_Sheet where ID_Route_Sheet = p_ID_Route_Sheet;
	declare p_Exists_Record smallint;
	declare p_Route_Sheet_Number_New varchar(8) := p_Route_Sheet_Number;
	declare p_Complexity_Exists smallint := count(*) from Complexity where ID_Complexity = p_Complexity_ID;
	declare p_Vehicle_Exists smallint := count(*) from Vehicle where ID_Vehicle = p_Vehicle_ID;
	declare p_Driver_Exists smallint := count(*) from Driver where ID_Driver = p_Driver_ID;
	begin
		while LENGTH(p_Route_Sheet_Number_New) < 8 loop
			p_Route_Sheet_Number_New := '0'||p_Route_Sheet_Number_New;
		end loop;
		p_Exists_Record := count(*) from Route_Sheet where Route_Sheet_Number = p_Route_Sheet_Number_New;
		if p_Exists_ID = 0 then
			raise notice 'Невозможно обновить данные. Маршрутного листа с введённым идентификатором не существует';
		else
			if p_Exists_Record > 0 then
				raise notice 'Запись с данным номером уже есть в таблице';
			else
				if p_Complexity_Exists = 0 then
					raise notice 'Сложности с указанным идентификатором нет';
				else
					if p_Vehicle_Exists = 0 then
						raise notice 'Автомобиля с указанным идентификатором нет';
					else
						if p_Driver_Exists = 0 then
							raise notice 'Водителя с указанным идентификатором нет';
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
	exception when SQLSTATE '23514' or SQLSTATE '22001' then 
			raise notice 'Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку';
		when others then 
			raise notice '% %', 'Данные не могут быть добавлены. Код ошибки -', SQLSTATE;
	end;
$$;	


create or replace procedure Route_Sheet_Delete(p_ID_Route_Sheet int)
language plpgsql
as $$
	begin
		delete from Route_Sheet where ID_Route_Sheet = p_ID_Route_Sheet;
	  
	  exception when SQLSTATE '23503' then
	  	raise notice 'Данные не могут быть удалены так как на них ссылаются значения из других таблиц';

	end;
$$;


------------------------------------------------------------------------------------

Create or replace procedure Combination_Route_Sheet_Delivery_Point_Insert(p_Route_Sheet_ID int, p_Delivery_Point_ID int)
language plpgsql
as $$
	declare p_Exists_Record smallint := count(*) from Combination_Route_Sheet_Delivery_Point_Insert where Route_Sheet_ID = p_Route_Sheet_ID and 
																								 Delivery_Point_ID = p_Delivery_Point_ID;
	declare p_Exists_Route_Sheet smallint := count(*) from Route_Sheet where ID_Route_Sheet = p_ID_Route_Sheet;
	declare p_Exists_Delivery_Point smallint := count(*) from Delivery_Point where ID_Delivery_Point = p_ID_Delivery_Point;
	if p_Exists_Record > 0 then
		raise notice 'Введённая запись уже есть в таблице';
	else
		if p_Exists_Route_Sheet = 0 then
			raise notice 'Введённой записи нету в таблице Маршрутный лист';
		else
			if p_Exists_Delivery_Point = 0 then
				raise notice 'Введённой записи нету в таблице Маршрутный лист';
			else
				insert into Combination_Route_Sheet_Delivery_Point(Route_Sheet_ID, p_Delivery_Point)
					values(p_Route_Sheet_ID, p_Delivery_Point_ID);
			end if;
		end if
	end if;
	exception when SQLSTATE '23514' or SQLSTATE '22001' then 
			raise notice 'Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку';
		when others then 
			raise notice '% %', 'Данные не могут быть добавлены. Код ошибки -', SQLSTATE;
	end;
$$;


Create or replace procedure Combination_Route_Sheet_Delivery_Point_Update(p_ID_Combination_Route_Sheet_Delivery_Point int, p_Route_Sheet_ID int, p_Delivery_Point_ID int)
language plpgsql
as $$
	declare p_Exists_ID smallint := count(*) from Combination_Route_Sheet_Delivery_Point where ID_Combination_Route_Sheet_Delivery_Point = p_ID_Combination_Route_Sheet_Delivery_Point;
	declare p_Exists_Record smallint := count(*) from Combination_Route_Sheet_Delivery_Point_Insert where Route_Sheet_ID = p_Route_Sheet_ID and 
																								 Delivery_Point_ID = p_Delivery_Point_ID;
	declare p_Exists_Route_Sheet smallint := count(*) from Route_Sheet where ID_Route_Sheet = p_ID_Route_Sheet;
	declare p_Exists_Delivery_Point smallint := count(*) from Delivery_Point where ID_Delivery_Point = p_ID_Delivery_Point;
	if p_Exists_ID = 0 then
		raise notice 'Невозможно обновить таблицу. Данных с введённым идентификатором нет';
	else
		if p_Exists_Record > 0 then
			raise notice 'Введённая запись уже есть в таблице';
		else
			if p_Exists_Route_Sheet = 0 then
				raise notice 'Введённой записи нету в таблице Маршрутный лист';
			else
				if p_Exists_Delivery_Point = 0 then
					raise notice 'Введённой записи нету в таблице Маршрутный лист';
				else
					update Combination_Route_Sheet_Delivery_Point set
						Route_Sheet_ID = p_Route_Sheet_ID,
						Delivery_Point_ID = p_Delivery_Point_ID
						where 
				end if;
			 end if
		 end if;
	 end if;
	exception when SQLSTATE '23514' or SQLSTATE '22001' then 
			raise notice 'Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку';
		when others then 
			raise notice '% %', 'Данные не могут быть добавлены. Код ошибки -', SQLSTATE;
	end;
$$;

-----------------------------------------------------------------------------------------


Create or replace procedure Combination_Route_Sheet_Delivery_Point_Insert(p_Route_Sheet_ID int, p_Delivery_Point_ID int)
language plpgsql
as $$
	declare p_Exists_Record smallint := count(*) from Combination_Route_Sheet_Delivery_Point where Route_Sheet_ID = p_Route_Sheet_ID and 
																								 Delivery_Point_ID = p_Delivery_Point_ID;
	declare p_Exists_Route_Sheet smallint := count(*) from Route_Sheet where ID_Route_Sheet = p_Route_Sheet_ID;
	declare p_Exists_Delivery_Point smallint := count(*) from Delivery_Point where ID_Delivery_Point = p_Delivery_Point_ID;
	begin
	if p_Exists_Record > 0 then
		raise notice 'Введённая запись уже есть в таблице';
	else
		if p_Exists_Route_Sheet = 0 then
			raise notice 'Введённой записи нету в таблице Маршрутный лист';
		else
			if p_Exists_Delivery_Point = 0 then
				raise notice 'Введённой записи нету в таблице Точки доставки';
			else
				insert into Combination_Route_Sheet_Delivery_Point(Route_Sheet_ID, Delivery_Point_ID)
					values(p_Route_Sheet_ID, p_Delivery_Point_ID);
			end if;
		end if;
	end if;
	exception when SQLSTATE '23514' or SQLSTATE '22001' then 
			raise notice 'Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку';
		when others then 
			raise notice '% %', 'Данные не могут быть добавлены. Код ошибки -', SQLSTATE;
	end;
$$;


Create or replace procedure Combination_Route_Sheet_Delivery_Point_Update(p_ID_Combination_Route_Sheet_Delivery_Point int, p_Route_Sheet_ID int, p_Delivery_Point_ID int)
language plpgsql
as $$
	declare p_Exists_ID smallint := count(*) from Combination_Route_Sheet_Delivery_Point where ID_Combination_Route_Sheet_Delivery_Point = p_ID_Combination_Route_Sheet_Delivery_Point;
	declare p_Exists_Record smallint := count(*) from Combination_Route_Sheet_Delivery_Point where Route_Sheet_ID = p_Route_Sheet_ID and 
																								 Delivery_Point_ID = p_Delivery_Point_ID;
	declare p_Exists_Route_Sheet smallint := count(*) from Route_Sheet where ID_Route_Sheet = p_Route_Sheet_ID;
	declare p_Exists_Delivery_Point smallint := count(*) from Delivery_Point where ID_Delivery_Point = p_Delivery_Point_ID;
	begin
	if p_Exists_ID = 0 then
		raise notice 'Невозможно обновить таблицу. Данных с введённым идентификатором нет';
	else
		if p_Exists_Record > 0 then
			raise notice 'Введённая запись уже есть в таблице';
		else
			if p_Exists_Route_Sheet = 0 then
				raise notice 'Введённой записи нету в таблице Маршрутный лист';
			else
				if p_Exists_Delivery_Point = 0 then
					raise notice 'Введённой записи нету в таблице Точки доставки';
				else
					update Combination_Route_Sheet_Delivery_Point set
						Route_Sheet_ID = p_Route_Sheet_ID,
						Delivery_Point_ID = p_Delivery_Point_ID
						where ID_Combination_Route_Sheet_Delivery_Point = p_ID_Combination_Route_Sheet_Delivery_Point;
				end if;
			 end if;
		 end if;
	 end if;
	exception when SQLSTATE '23514' or SQLSTATE '22001' then 
			raise notice 'Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку';
		when others then 
			raise notice '% %', 'Данные не могут быть добавлены. Код ошибки -', SQLSTATE;
	end;
$$;

create or replace procedure Combination_Route_Sheet_Delivery_Point_Delete(p_ID_Combination_Route_Sheet_Delivery_Point int)
language plpgsql
as $$
	begin
		delete from Combination_Route_Sheet_Delivery_Point where ID_Combination_Route_Sheet_Delivery_Point = p_ID_Combination_Route_Sheet_Delivery_Point;
	  
	  exception when SQLSTATE '23503' then
	  	raise notice 'Данные не могут быть удалены так как на них ссылаются значения из других таблиц';

	end;
$$;

-------------------------------------------------------


Create or replace procedure Combination_Route_Sheet_Cargo_Insert(p_Route_Sheet_ID int, p_Cargo_ID int)
language plpgsql
as $$
	declare p_Exists_Record smallint := count(*) from Combination_Route_Sheet_Cargo where Route_Sheet_ID = p_Route_Sheet_ID and 
																								 Cargo_ID = p_Cargo_ID;
	declare p_Exists_Route_Sheet smallint := count(*) from Route_Sheet where ID_Route_Sheet = p_Route_Sheet_ID;
	declare p_Exists_Cargo smallint := count(*) from Cargo where ID_Cargo = p_Cargo_ID;
	begin
	if p_Exists_Record > 0 then
		raise notice 'Введённая запись уже есть в таблице';
	else
		if p_Exists_Route_Sheet = 0 then
			raise notice 'Введённой записи нету в таблице Маршрутный лист';
		else
			if p_Exists_Cargo = 0 then
				raise notice 'Введённой записи нету в таблице Точки доставки';
			else
				insert into Combination_Route_Sheet_Cargo(Route_Sheet_ID, Cargo_ID)
					values(p_Route_Sheet_ID, p_Cargo_ID);
			end if;
		end if;
	end if;
	exception when SQLSTATE '23514' or SQLSTATE '22001' then 
			raise notice 'Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку';
		when others then 
			raise notice '% %', 'Данные не могут быть добавлены. Код ошибки -', SQLSTATE;
	end;
$$;


Create or replace procedure Combination_Route_Sheet_Cargo_Update(p_ID_Combination_Route_Sheet_Cargo int, p_Route_Sheet_ID int, p_Cargo_ID int)
language plpgsql
as $$
	declare p_Exists_ID smallint := count(*) from Combination_Route_Sheet_Cargo where ID_Combination_Route_Sheet_Cargo = p_ID_Combination_Route_Sheet_Cargo;
	declare p_Exists_Record smallint := count(*) from Combination_Route_Sheet_Cargo where Route_Sheet_ID = p_Route_Sheet_ID and 
																								 Cargo_ID = p_Cargo_ID;
	declare p_Exists_Route_Sheet smallint := count(*) from Route_Sheet where ID_Route_Sheet = p_Route_Sheet_ID;
	declare p_Exists_Cargo smallint := count(*) from Cargo where ID_Cargo = p_Cargo_ID;
	begin
	if p_Exists_ID = 0 then
		raise notice 'Невозможно обновить таблицу. Данных с введённым идентификатором нет';
	else
		if p_Exists_Record > 0 then
			raise notice 'Введённая запись уже есть в таблице';
		else
			if p_Exists_Route_Sheet = 0 then
				raise notice 'Введённой записи нету в таблице Маршрутный лист';
			else
				if p_Exists_Cargo = 0 then
					raise notice 'Введённой записи нету в таблице Точки доставки';
				else
					update Combination_Route_Sheet_Cargo set
						Route_Sheet_ID = p_Route_Sheet_ID,
						Cargo_ID = p_Cargo_ID
						where ID_Combination_Route_Sheet_Cargo = p_ID_Combination_Route_Sheet_Cargo;
				end if;
			 end if;
		 end if;
	 end if;
	exception when SQLSTATE '23514' or SQLSTATE '22001' then 
			raise notice 'Данные не могут быть добавлены. Проверьте правильность заполнения полей и повторите попытку';
		when others then 
			raise notice '% %', 'Данные не могут быть добавлены. Код ошибки -', SQLSTATE;
	end;
$$;

create or replace procedure Combination_Route_Sheet_Cargo_Delete(p_ID_Combination_Route_Sheet_Cargo int)
language plpgsql
as $$
	begin
		delete from Combination_Route_Sheet_Cargo where ID_Combination_Route_Sheet_Cargo = p_ID_Combination_Route_Sheet_Cargo;
	  
	  exception when SQLSTATE '23503' then
	  	raise notice 'Данные не могут быть удалены так как на них ссылаются значения из других таблиц';

	end;
$$;