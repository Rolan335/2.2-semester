Create table route_history(
    id_route_history varchar(400) primary key default(uuid()),
    route_number text not null,
    route_date date not null,
    vehicle_info text not null,
    complexity_info text not null,
    driver_info text not null,
    Create_Record TIMESTAMP null DEFAULT(CURRENT_TIMESTAMP),
    Change_Record TIMESTAMP null DEFAULT(CURRENT_TIMESTAMP)
)

create table request_history(
	id_request_history varchar(400) primary key default(uuid()),
    request_number text not null,
	client_info text not null,
	cargo_info text null,
	delivery_point_info text null,
	Create_Record TIMESTAMP null DEFAULT(CURRENT_TIMESTAMP),
	Change_Record TIMESTAMP null DEFAULT(CURRENT_TIMESTAMP)
)

DELIMITER //
create trigger fc_Request_History_Insert
after insert on Request
for each row
    begin
        insert into Request_History (request_number, client_info, cargo_info, delivery_point_info)
        values(
        #Request_Number
        (select Concat('ДОБАВЛЕНА заявка: ',(select request_number from request where request_number = New.Request_Number))),
        #Client_info
        (select concat('Организация: ', client_organization_name,' ИНН:',client_ITN) from request
            inner join client on Client_ID = ID_Client where request_number = New.Request_Number),
        #Cargo_info
        (select concat('Перевозимый груз: ', cargo_description,' С параметрами: ',Cargo_width,'x',Cargo_height,'x',Cargo_length,' Вес: ',Cargo_weight)
            from request
         inner join cargo on ID_Request = Request_ID
         where request_number = new.request_number),
        #Delivery_point_info
        (select Concat('Точки доставки: ',group_concat(delivery_point_destination,';')) from request
            inner join delivery_point on ID_Request = Request_ID where request_number = New.request_number));
    end;


#Добавление изменение

DELIMITER //
create trigger tg_request_history_insert_delivery_point
after insert on Delivery_point
for each row
    begin
	declare p_Request_number varchar(8);
    select request_number into p_Request_Number  from Request where ID_Request = new.Request_ID limit 1;
        update Request_History set
        #Request_number
        Request_Number = (select concat('ИЗМЕНЕНА заявка: ',p_request_number)),
        #Cargo_info
        cargo_info = (select concat('Перевозимый груз: ', cargo_description,' С параметрами: ',Cargo_width,'x',Cargo_height,'x',Cargo_length,' Вес: ',Cargo_weight)
            from request
         inner join cargo on ID_Request = Request_ID
         where ID_Request = new.request_ID limit 1),
        #Delivery_Point_Info
        delivery_point_info = (select concat('Точки доставки: ', GROUP_CONCAT(delivery_point_destination,';'))
        from request
        inner join delivery_point on ID_Request = Request_ID where ID_Request = new.Request_ID limit 1),
        #Timestamp
        change_record = CURRENT_TIMESTAMP
            where RIGHT(Request_Number,8) = p_Request_Number;
    end;

DELIMITER //
create trigger tg_request_history_update_delivery_point
after update on Delivery_point
for each row
    begin
	declare p_Request_number varchar(8);
    select request_number into p_Request_Number  from Request where ID_Request = new.Request_ID limit 1;
        update Request_History set
        #Request_number
        Request_Number = (select concat('ИЗМЕНЕНА заявка: ',p_request_number)),
        #Cargo_info
        cargo_info = (select concat('Перевозимый груз: ', cargo_description,' С параметрами: ',Cargo_width,'x',Cargo_height,'x',Cargo_length,' Вес: ',Cargo_weight)
            from request
         inner join cargo on ID_Request = Request_ID
         where ID_Request = new.request_ID limit 1),
        #Delivery_Point_Info
        delivery_point_info = (select concat('Точки доставки: ', GROUP_CONCAT(delivery_point_destination,';'))
        from request
        inner join delivery_point on ID_Request = Request_ID where ID_Request = new.Request_ID limit 1),
        #Timestamp
        change_record = CURRENT_TIMESTAMP
            where RIGHT(Request_Number,8) = p_Request_Number;
    end;

DELIMITER //
create trigger tg_request_history_insert_cargo
after insert on cargo
for each row
    begin
	declare p_Request_number varchar(8);
    select request_number into p_Request_Number  from Request where ID_Request = new.Request_ID limit 1;
        update Request_History set
        #Request_number
        Request_Number = (select concat('ИЗМЕНЕНА заявка: ',p_request_number)),
        #Cargo_info
        cargo_info = (select concat('Перевозимый груз: ', cargo_description,' С параметрами: ',Cargo_width,'x',Cargo_height,'x',Cargo_length,' Вес: ',Cargo_weight)
            from request
         inner join cargo on ID_Request = Request_ID
         where ID_Request = new.request_ID limit 1),
        #Delivery_Point_Info
        delivery_point_info = (select concat('Точки доставки: ', GROUP_CONCAT(delivery_point_destination,';'))
        from request
        inner join delivery_point on ID_Request = Request_ID where ID_Request = new.Request_ID limit 1),
        #Timestamp
        change_record = CURRENT_TIMESTAMP
            where RIGHT(Request_Number,8) = p_Request_Number;
    end;
    
DELIMITER //
create trigger tg_request_history_update_cargo
after update on cargo
for each row
    begin
	declare p_Request_number varchar(8);
    select request_number into p_Request_Number  from Request where ID_Request = new.Request_ID limit 1;
        update Request_History set
        #Request_number
        Request_Number = (select concat('ИЗМЕНЕНА заявка: ',p_request_number)),
        #Cargo_info
        cargo_info = (select concat('Перевозимый груз: ', cargo_description,' С параметрами: ',Cargo_width,'x',Cargo_height,'x',Cargo_length,' Вес: ',Cargo_weight)
            from request
         inner join cargo on ID_Request = Request_ID
         where ID_Request = new.request_ID limit 1),
        #Delivery_Point_Info
        delivery_point_info = (select concat('Точки доставки: ', GROUP_CONCAT(delivery_point_destination,';'))
        from request
        inner join delivery_point on ID_Request = Request_ID where ID_Request = new.Request_ID limit 1),
        #Timestamp
        change_record = CURRENT_TIMESTAMP
            where RIGHT(Request_Number,8) = p_Request_Number;
    end;

#Удаление

DELIMITER //
create trigger tg_Request_History_Delete
before delete on Request
for each row 
	begin
		declare p_request_number varchar(8);
		select request_number into p_Request_Number  from Request where ID_Request = old.ID_Request limit 1;
		insert into Request_History (request_number, client_info, cargo_info, delivery_point_info)
		values(
		#Request_Number
		(select concat('Удалена заявка: ',request_number) from request where request_number = p_Request_Number),
		#Client_info
		(select concat('Организация: ', client_organization_name,' ИНН:',client_ITN) from request
			inner join client on Client_ID = ID_Client where request_number = p_Request_Number),
		#Cargo_info
		(select concat('Перевозимый груз: ', cargo_description,' С параметрами: ',Cargo_width,'x',Cargo_height,'x',Cargo_length,' Вес: ',Cargo_weight)
			from request
		 inner join cargo on ID_Request = Request_ID
		 where request_number = p_request_number),
		#Delivery_point_info
		(select concat('Точки доставки: ', GROUP_CONCAT(delivery_point_destination,';'))
		from request
			inner join delivery_point on ID_Request = Request_ID where request_number = old.request_number));
			delete from Request_History where p_Request_Number = RIGHT(Request_Number,8);
	end;







DELIMITER //
create trigger tg_Route_History_Insert
after insert on Route_Sheet
for each row
	begin
	insert into Route_History(route_number,route_date,vehicle_info,complexity_info,driver_info)
		values(
		#Route_Number
		(select concat('ДОБАВЛЕН маршрут: ',route_sheet_number) from route_sheet where route_sheet_number = new.route_sheet_number limit 1),
		#Route_Date
		(select route_sheet_date from route_sheet where route_sheet_number = new.route_sheet_number),
		#Vehicle_Info
		(select vehicle_state_number from route_sheet inner join vehicle on Vehicle_ID = ID_Vehicle where ID_Vehicle = new.Vehicle_ID limit 1),
		#Complexity_Info
		(select complexity_Level from route_sheet inner join complexity on Complexity_ID = ID_Complexity where ID_Complexity = new.Complexity_ID limit 1),
		#Driver_Info
		(select concat(Driver_Surname,' ',Driver_Name,' СНИЛС: ',Driver_SNILS) from route_Sheet inner join driver on driver_ID = ID_Driver where ID_Driver = new.Driver_ID limit 1)
		);
	end;


DELIMITER //
create trigger tg_Route_History_Update
after update on Route_Sheet
for each row
	begin
	declare p_Route_Number varchar(8);
	select route_Sheet_Number into p_Route_Number from route_Sheet where ID_Route_Sheet = New.ID_Route_Sheet limit 1;
	update route_history set
	#Route_Number
	route_number = (concat('ИЗМЕНЁН МАРШРУТ: ',p_Route_Number)),
	#Route_Date
	route_date = (select route_Sheet_Date from route_Sheet where ID_Route_Sheet = new.ID_Route_Sheet limit 1),
	#Vehicle_Info
	vehicle_info = (select vehicle_state_number from route_Sheet inner join vehicle on Vehicle_ID = ID_Vehicle where ID_Route_Sheet = new.ID_Route_Sheet limit 1),
	#Complexity_Info
	complexity_info = (select complexity_Level from route_sheet inner join complexity on Complexity_ID = ID_Complexity where ID_Route_Sheet = new.ID_Route_Sheet limit 1),
	#Driver_Info
	driver_info = (select concat(Driver_Surname,' ',Driver_Name,' СНИЛС: ',Driver_SNILS) from route_Sheet inner join driver on driver_ID = ID_Driver where ID_Route_Sheet = new.ID_Route_Sheet limit 1),
	#Timestamp
	change_record = CURRENT_TIMESTAMP
	where p_route_Number = right(Route_Number,8);
	end;

DELIMITER //
create trigger tg_Route_History_Delete
before delete on Route_Sheet
for each row
	begin
	declare p_route_number varchar(8);
	insert into Route_History(route_number,route_date,vehicle_info,complexity_info,driver_info)
		values(
		#Route_Number
		(select concat('Удалён маршрут: ',(select route_sheet_number from route_sheet where ID_Route_Sheet = old.ID_Route_Sheet limit 1))limit 1),
		#Route_Date
		(select route_sheet_date from route_sheet where ID_Route_Sheet = old.ID_Route_Sheet limit 1),
		#Vehicle_Info
		(select vehicle_state_number from route_sheet inner join vehicle on Vehicle_ID = ID_Vehicle where ID_Vehicle = old.Vehicle_ID limit 1),
		#Complexity_Info
		(select complexity_Level from route_sheet inner join complexity on Complexity_ID = ID_Complexity where ID_Complexity = old.Complexity_ID limit 1),
		#Driver_Info
		(select concat(Driver_Surname,' ',Driver_Name,' СНИЛС: ',Driver_SNILS) from route_Sheet inner join driver on driver_ID = ID_Driver where ID_Driver = old.Driver_ID limit 1)
		);
	end;





DELIMITER // 
Create function Client_Request_history(p_Client_Info varchar(100))
returns text
deterministic
	begin
		declare res text;
        select group_concat(concat(request_number ,'  |  ',client_info,'  |  ', cargo_info,'  |  ', delivery_point_info)) into res from request_history 
        where client_info = concat('Организация: ',p_Client_Info,' ИНН:',(select client_itn from client where client_organization_name = p_Client_info));
        return res;
    end;
select Client_Request_history('ООО "СтройМент"')


DELIMITER // 
Create function Driver_Route_history(p_Driver_Info varchar(14))
returns text
deterministic
	begin
		declare res text;
        select group_concat(concat(route_number,'  |  ',route_date,'  |  ',vehicle_info,'  |  ',complexity_info,'  |  ',driver_info)) into res from route_history 
        where right(route_history.driver_info,14) = p_Driver_Info;
        return res;
    end;
select Driver_Route_history('214-913-124 00')