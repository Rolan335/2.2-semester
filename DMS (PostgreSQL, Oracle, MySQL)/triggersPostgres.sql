-- cargo_info null и delivery_point_info null потому что данные в эти таблицы могут быть добавлены позже, но являются неотъемлемой частью заявки. 
-- Для этого создаём триггеры которые будут срабатывать при insert или update Cargo и Delivery_point и подтягивать данные в уже созданную запись в Request_History.
--При этом, к одной заявке может быть добавлено несколько точек доставки. Тоже реализовано.
create extension if not exists "uuid-ossp";
create table request_history(
	id_request_history uuid default uuid_generate_v4() constraint PK_request_history primary key,
    request_number varchar not null,
	client_info varchar not null,
	cargo_info varchar null,
	delivery_point_info varchar null,
	Create_Record TIMESTAMP null DEFAULT(CURRENT_TIMESTAMP),
	Change_Record TIMESTAMP null DEFAULT(CURRENT_TIMESTAMP)
)

create or replace function fc_Request_History_Insert()
returns trigger
language plpgsql
as $$
	begin
		insert into Request_History (request_number, client_info, cargo_info, delivery_point_info)
		values(
		--Request_Number
		(select 'ДОБАВЛЕНА заявка: '||request_number from request where request_number = New.Request_Number),
		--Client_info
		(select 'Организация: '|| client_organization_name||' ИНН:'||client_ITN from request
			inner join client on Client_ID = ID_Client where request_number = New.Request_Number),
		--Cargo_info
		(select 'Перевозимый груз: '|| cargo_description||' С параметрами: '||Cargo_width||'x'||Cargo_height||'x'||Cargo_length||' Вес: '||Cargo_weight
			from request
		 inner join cargo on ID_Request = Request_ID
		 where request_number = new.request_number),
		--Delivery_point_info
		(select 'Точки доставки: '|| String_AGG(delivery_point_destination||' '||delivery_point_mark,';')
		from request
			inner join delivery_point on ID_Request = Request_ID where request_number = New.request_number));
		raise notice 'Запись об добавлении заявки успешно добавлена';
	return new;
	end;
$$;
create trigger tg_request_history_insert
after insert on Request
for each row
execute procedure fc_Request_History_insert();


-- Обновление/Добавление точек доставки и Груза
create or replace function fc_Request_History_Update()
returns trigger
language plpgsql
as $$
	declare p_Request_number varchar(8);
	begin
	p_Request_Number := request_number from Request where ID_Request = new.Request_ID limit 1;
		update Request_History set
        --Request_number
        Request_Number = (select 'ИЗМЕНЕНА заявка: '||p_request_number),
		--Cargo_info
		cargo_info = (select 'Перевозимый груз: '|| cargo_description||' С параметрами: '||Cargo_width||'x'||Cargo_height||'x'||Cargo_length||' Вес: '||Cargo_weight
			from request
		 inner join cargo on ID_Request = Request_ID
		 where ID_Request = new.request_ID limit 1),
		--Delivery_Point_Info
		delivery_point_info = (select 'Точки доставки: '|| String_AGG(delivery_point_destination||' '||delivery_point_mark,';')
		from request
		inner join delivery_point on ID_Request = Request_ID where ID_Request = new.Request_ID limit 1),
		--Timestamp
		change_record = CURRENT_TIMESTAMP
			where RIGHT(Request_Number,8) = p_Request_Number;
		raise notice 'Запись об изменении заявки успешно добавлена';
	return new;
	end;
$$;

create trigger tg_request_history_update_delivery_point
after insert or update on Delivery_point
for each row
execute procedure fc_Request_History_update();

create trigger tg_request_history_update_Cargo
after insert or update on Cargo
for each row
execute procedure fc_Request_History_update();



create or replace function fc_Request_History_Delete()
returns trigger
language plpgsql
as $$
	declare p_request_number varchar(8);
	begin
		p_Request_Number := request_number from Request where ID_Request = old.ID_Request limit 1;
		insert into Request_History (request_number, client_info, cargo_info, delivery_point_info)
		values(
		--Request_Number
		(select 'Удалена заявка: '||request_number from request where request_number = p_Request_Number),
		--Client_info
		(select 'Организация: '|| client_organization_name||' ИНН:'||client_ITN from request
			inner join client on Client_ID = ID_Client where request_number = p_Request_Number),
		--Cargo_info
		(select 'Перевозимый груз: '|| cargo_description||' С параметрами: '||Cargo_width||'x'||Cargo_height||'x'||Cargo_length||' Вес: '||Cargo_weight
			from request
		 inner join cargo on ID_Request = Request_ID
		 where request_number = p_request_number),
		--Delivery_point_info
		(select 'Точки доставки: '|| String_AGG(delivery_point_destination||' '||delivery_point_mark,';')
		from request
			inner join delivery_point on ID_Request = Request_ID where request_number = New.request_number));
			delete from Request_History where p_Request_Number = RIGHT(Request_Number,8);
		raise notice 'Запись удалена';
	return old;
	end;
$$;

create trigger tg_Request_History_Delete
before delete on Request
for each row 
execute procedure fc_Request_History_Delete();



--История маршрутов для водителя

create table route_history(
	id_route_history uuid default uuid_generate_v4() constraint PK_request_history primary key,
    route_number varchar not null,
	route_date date not null,
	vehicle_info varchar not null,
	complexity_info varchar not null,
	driver_info varchar not null
	Create_Record TIMESTAMP null DEFAULT(CURRENT_TIMESTAMP),
	Change_Record TIMESTAMP null DEFAULT(CURRENT_TIMESTAMP)
)



create or replace function fc_Route_Insert()
returns trigger
language plpgsql
as $$
	begin
	
	insert into Route_History(route_number,route_date,vehicle_info,complexity_info,driver_info)
		values(
		--Route_Number
		(select 'ДОБАВЛЕН маршрут: '||route_sheet_number from route_sheet where route_sheet_number = new.route_sheet_number limit 1),
		--Route_Date
		(select route_sheet_date from route_sheet where route_sheet_number = new.route_sheet_number),
		--Vehicle_Info
		(select vehicle_state_number from route_sheet inner join vehicle on Vehicle_ID = ID_Vehicle where ID_Vehicle = new.Vehicle_ID limit 1),
		--Complexity_Info
		(select complexity_Level from route_sheet inner join complexity on Complexity_ID = ID_Complexity where ID_Complexity = new.Complexity_ID limit 1),
		--Driver_Info
		(select Driver_Surname||' '||Driver_Name||' СНИЛС: '||Driver_SNILS from route_Sheet inner join driver on driver_ID = ID_Driver where ID_Driver = new.Driver_ID limit 1)
		);
		raise notice 'Запись о добавлении маршрутного листа успешно добавлена';
		return new;
	end;
$$;
create trigger tg_Route_History_Insert
after insert on Route_Sheet
for each row
execute procedure fID_Route_Sheet


create or replace function fc_Route_Update()
returns trigger
language plpgsql
as $$
	declare p_Route_Number varchar(8);
	begin
	p_Route_Number := route_Sheet_Number from route_Sheet where ID_Route_Sheet = New.ID_Route_Sheet limit 1;
	update route_history set
	--Route_Number
	route_number = ('ИЗМЕНЁН МАРШРУТ: '||p_Route_Number),
	--Route_Date
	route_date = (select route_Sheet_Date from route_Sheet where ID_Route_Sheet = new.ID_Route_Sheet limit 1),
	--Vehicle_Info
	vehicle_info = (select vehicle_state_number from route_Sheet inner join vehicle on Vehicle_ID = ID_Vehicle where ID_Route_Sheet = new.ID_Route_Sheet limit 1),
	--Complexity_Info
	complexity_info = (select complexity_Level from route_sheet inner join complexity on Complexity_ID = ID_Complexity where ID_Route_Sheet = new.ID_Route_Sheet limit 1),
	--Driver_Info
	driver_info = (select Driver_Surname||' '||Driver_Name||' СНИЛС: '||Driver_SNILS from route_Sheet inner join driver on driver_ID = ID_Driver where ID_Route_Sheet = new.ID_Route_Sheet limit 1),
	--Timestamp
	change_record = CURRENT_TIMESTAMP
	where p_route_Number = right(Route_Number,8);
	raise notice 'Маршрут успешно изменён';
	return new;
	end;
$$;
create trigger tg_Route_History_Update
after update on Route_Sheet
for each row
execute procedure fc_Route_Update();



create or replace function fc_Route_Delete()
returns trigger
language plpgsql
as $$
	declare p_route_number varchar(8);
	begin
	insert into Route_History(route_number,route_date,vehicle_info,complexity_info,driver_info)
		values(
		--Route_Number
		(select 'Удалён маршрут: '||(select route_sheet_number from route_sheet where ID_Route_Sheet = old.ID_Route_Sheet limit 1)limit 1),
		--Route_Date
		(select route_sheet_date from route_sheet where ID_Route_Sheet = old.ID_Route_Sheet limit 1),
		--Vehicle_Info
		(select vehicle_state_number from route_sheet inner join vehicle on Vehicle_ID = ID_Vehicle where ID_Vehicle = old.Vehicle_ID limit 1),
		--Complexity_Info
		(select complexity_Level from route_sheet inner join complexity on Complexity_ID = ID_Complexity where ID_Complexity = old.Complexity_ID limit 1),
		--Driver_Info
		(select Driver_Surname||' '||Driver_Name||' СНИЛС: '||Driver_SNILS from route_Sheet inner join driver on driver_ID = ID_Driver where ID_Driver = old.Driver_ID limit 1)
		);
		raise notice 'Запись об удалении маршрутного листа успешно добавлена';
		return old;
	end;
$$;

create trigger tg_Route_History_Delete
before delete on Route_Sheet
for each row
execute procedure fc_Route_Delete();


create or replace function Client_Request_History(p_Client varchar (100))
returns table (request_number varchar, client_info varchar, cargo_info varchar, delivery_point_info varchar)
language plpgsql
as $$
	begin
		return query select Request_History.request_number, Request_history.client_info, Request_history.cargo_info, Request_history.Delivery_Point_Info from Request_history  where Request_History.Client_info = 'Организация: '||p_Client||' ИНН:'||(select client_itn from client where client_organization_name = p_Client);
	end; 
$$;
select * from Client_Request_history('ООО "СтройМент"');

create or replace function Driver_Route_History(p_Driver varchar (100))
returns table (route_number varchar,route_date date,vehicle_info varchar,complexity_info varchar,driver_info varchar)
language plpgsql
as $$
	begin
		return query select route_history.route_number,route_history.route_date,route_history.vehicle_info,route_history.complexity_info,route_history.driver_info from route_history 
		--Смотрим по СНИЛС
		where right(route_history.driver_info,14) = p_Driver;
	end;
$$;