Select Request_Number as "Заявка", count(Delivery_point_Destination) as "Количество выполненных точек"
	from Request
	inner join Delivery_Point on ID_Request = Request_ID
	where delivery_point_mark = '+'
	group by Request_Number;


Select Manager_Surname||' '||Manager_Name||' '||Manager_Second_Name as "ФИО менеджера", ROUND((count(Manager_ID)::decimal) / (select count(Request_Number)::decimal from Request) * 100,2) as "% заявок"
	from manager
		inner join Request on ID_Manager = Manager_ID
	group by Manager_Surname||' '||Manager_Name||' '||Manager_Second_Name;


Select Client_Organization_Name as "Наименование организации", SUM(Cargo_Price) as "Сумма оборота груза" from client
	inner join Request on ID_Client = Client_ID
	inner join Cargo on ID_Request = Request_ID
	group by client_organization_name;


select Manager_Surname||' '||Manager_Name||' '||Manager_Second_Name as "ФИО менеджера", count(manager_id) as "Число обработанных заявок"
  from manager
	inner join Request on ID_Manager = Manager_ID
	group by ID_Manager, Manager_Surname||' '||Manager_Name||' '||Manager_Second_Name
	having count(manager_id) = (select min(p_count) from 
(select count(manager_ID) as p_count from request group by Manager_ID) as "Число обработанных заявок");


select request_number as "Номер заявки", LOWER(STRING_AGG(delivery_Point_destination, ' ; ')) as "Точки доставки"
	from Request
	inner join Delivery_Point on ID_Request = Request_ID
	group by request_number;


select UPPER(Vehicle_State_Number) as "Гос-номер", Count(Vehicle_ID) as "Кол-во рейсов"
	from vehicle
	inner join Route_Sheet on ID_Vehicle = Vehicle_ID
	group by Vehicle_State_Number
	having count(Vehicle_ID) = (select Max(p_count) from 
(select count(vehicle_ID) as p_count from Route_Sheet group by Vehicle_ID) as "Кол-во рейсов");


select ROW_NUMBER() over(order by Avg(Cargo_Price) desc) as "№ Строки", Client_Organization_Name as "Наименование организации",
avg(Cargo_Price)::bigint as "Средняя стоимость груза" from Cargo
	inner join Request on Request_ID = ID_Request
	inner join Client on Client_ID = ID_Client
	group by Client_Organization_Name
	order by Avg(Cargo_Price) desc
	limit 3;


select Manager_Surname||' '||substring(Manager_Name,1,1)||'.'||substring(Manager_Second_Name,1,1)||'.' as "ФИО менеджера",Request_Number as "Номер заявки",
Request_Date as "Дата заявки",to_char(Request_Date, 'TMDay') as "День недели", 
Route_Sheet_number as "Номер маршрутного листа", Route_Sheet_Date as "Дата обработки", to_char(Route_Sheet_Date, 'TMDay') as "День недели",
(Route_Sheet_Date - Request_Date)||' д.' as "Время обработки"
	from Request
	inner join Delivery_Point on ID_Request = Request_ID
	inner join Manager on Manager_ID = ID_Manager
	inner join Combination_Route_Sheet_Delivery_Point on ID_Delivery_Point = Delivery_Point_ID
	inner join Route_Sheet on ID_Route_Sheet = Route_Sheet_ID
		group by  Manager_Surname||' '||substring(Manager_Name,1,1)||'.'||substring(Manager_Second_Name,1,1)||'.', Request_Date, Route_Sheet_Date,ID_Request,ID_Route_Sheet;


select request_number as "Номер заявки", request_date as "Дата заявки", to_char(request_date,'TMDay') as "День недели",
case 
when DATE_PART('isodow',request_date) = 5 then request_date + 3
when DATE_PART('isodow',request_date) = 6 then request_date + 2
else request_date + 1
end as "Планируемая дата формирования МЛ" from Request;


Create or replace function Choose_Vehicle_For_Cargo(p_ID_Request integer)
returns varchar
language plpgsql
as $$
	declare TABLE_RECORD RECORD;
	declare p_Cargo_Width int;
	declare p_Cargo_Height int;
	declare p_Cargo_Length int;
	declare p_vehicle_state_number varchar(10);
	begin
		p_Cargo_Width := sum(cargo_width) from Cargo where Request_ID = p_ID_Request;
		p_Cargo_Height := sum(cargo_height) from Cargo where Request_ID = p_ID_Request;
		p_Cargo_Length := sum(cargo_length) from Cargo where Request_ID = p_ID_Request;
		for TABLE_RECORD in select * from vehicle
		loop
			if p_Cargo_Width <= TABLE_RECORD.vehicle_width and p_Cargo_Height <= TABLE_RECORD.vehicle_Height and p_Cargo_Length <= TABLE_RECORD.vehicle_Length then
				return TABLE_RECORD.vehicle_state_number;
			end if;
		end loop;
		return 'Невозможно распределить заявку';
	end;
$$;
select Choose_Vehicle_For_Cargo(4);


create or replace function Client_Requests_History(p_Client_Organization_Name varchar(100))
returns table ("Номер заявки" varchar(8),"Дата заявки" date,"Время заявки" time,"Точки доставки" text, "Груз" varchar(500),
			  "Параметры груза" text, "Вес груза" int, "Цена груза" int)
language plpgsql
as $$
	begin
		return query select Request_Number, Request_Date,Request_Time, STRING_AGG(delivery_Point_destination ||' '|| Delivery_Point_Mark, ' ; '), Cargo_Description, Cargo_Width ||' X '|| Cargo_Height 
			||' X '|| Cargo_Length, Cargo_Weight, Cargo_Price from Request
		inner join Client on ID_Client = Client_ID
        inner join Delivery_Point on Request_ID = ID_Request
        inner join Cargo on Cargo.Request_ID = ID_Request
		where Client_Organization_Name = p_Client_Organization_Name
        group by Request_Number, Client_Organization_Name, Request_Date,Request_Time, Cargo_Description, Cargo_Width ||' X '|| Cargo_Height 
			||' X '|| Cargo_Length, Cargo_Weight, Cargo_Price
		order by Request_Number asc;
	end;
$$;
select * from Client_Requests_History('ООО "СтройМент"');



Select DISTINCT(vehicle_width||'x'||vehicle_height||'x'||vehicle_length) as "Параметры автомобилей" from vehicle;