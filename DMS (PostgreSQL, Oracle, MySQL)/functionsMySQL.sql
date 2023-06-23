Select Request_Number as "Заявка", count(Delivery_point_Destination) as "Количество выполненных точек"
	from Request
	inner join Delivery_Point on ID_Request = Request_ID
	where delivery_point_mark = '+'
	group by Request_Number;

Select Concat(Manager_Surname,' ',Manager_Name,' ',Manager_Second_Name) as "ФИО менеджера", ROUND((cast(count(Manager_ID) as decimal)) / (select cast(count(Request_Number)as decimal )from Request) * 100,2) as "% заявок"
	from manager
		inner join Request on ID_Manager = Manager_ID
	group by Concat(Manager_Surname,' ',Manager_Name,' ',Manager_Second_Name);

Select Client_Organization_Name as "Наименование организации", SUM(Cargo_Price) as "Сумма оборота груза" from client
	inner join Request on ID_Client = Client_ID
	inner join Cargo on ID_Request = Request_ID
	group by client_organization_name;

select concat(Manager_Surname,' ',Manager_Name,' ',Manager_Second_Name) as "ФИО менеджера", count(manager_id) as "Число обработанных заявок"
  from manager
	inner join Request on ID_Manager = Manager_ID
	group by ID_Manager, Manager_Surname||' '||Manager_Name||' '||Manager_Second_Name
	having count(manager_id) = (select min(p_count) from (select count(manager_ID) as p_count from request group by Manager_ID) as p_count);

select request_number as "Номер заявки", LOWER(Group_CONCAT(delivery_Point_destination, ' ; ')) as "Точки доставки"
	from Request
	inner join Delivery_Point on ID_Request = Request_ID
	group by request_number;

select UPPER(Vehicle_State_Number) as "Гос-номер", Count(Vehicle_ID) as "Кол-во рейсов"
	from vehicle
	inner join Route_Sheet on ID_Vehicle = Vehicle_ID
	group by Vehicle_State_Number
	having count(Vehicle_ID) = (select Max(p_count) from 
(select count(vehicle_ID) as p_count from Route_Sheet group by Vehicle_ID) as p_count);

select ROW_NUMBER() over(order by Avg(Cargo_Price) desc) as "№ Строки", Client_Organization_Name as "Наименование организации",
avg(Cargo_Price) as "Средняя стоимость груза"
	from Cargo
	inner join Request on Request_ID = ID_Request
	inner join Client on Client_ID = ID_Client
	group by Client_Organization_Name
	order by Avg(Cargo_Price) desc
	limit 3;

select concat(Manager_Surname,' ',substring(Manager_Name,1,1),'.',substring(Manager_Second_Name,1,1),'.') as "ФИО менеджера",Request_Number as "Номер заявки",
Request_Date as "Дата заявки",DAYNAME(Request_Date) as "День недели", 
Route_Sheet_number as "Номер маршрутного листа", Route_Sheet_Date as "Дата обработки", DAYNAME(Route_Sheet_Date) as "День недели",
concat(DATEDIFF(Route_Sheet_Date,Request_Date),' д.') as "Время обработки"
	from Request
	inner join Delivery_Point on ID_Request = Request_ID
	inner join Manager on Manager_ID = ID_Manager
	inner join Combination_Route_Sheet_Delivery_Point on ID_Delivery_Point = Delivery_Point_ID
	inner join Route_Sheet on ID_Route_Sheet = Route_Sheet_ID
		group by  concat(Manager_Surname,' ',substring(Manager_Name,1,1),'.',substring(Manager_Second_Name,1,1),'.'), Request_Date, Route_Sheet_Date,ID_Request,ID_Route_Sheet;

select request_number as "Номер заявки", request_date as "Дата заявки", DAYNAME(request_date) as "День недели",
case 
when weekday(request_date) = 4 then DATE_ADD(request_date, interval 3 day)
when weekday(request_date) = 5 then DATE_ADD(request_date, interval 2 day)
else DATE_ADD(request_date, interval 1 day)
end as "Планируемая дата формирования МЛ" from Request;

DELIMITER //
Create function Choose_Vehicle_For_Cargo(p_ID_Request int)
returns varchar(31)
DETERMINISTIC
	begin
	declare p_Cargo_Width int;
	declare p_Cargo_Height int;
	declare p_Cargo_Length int;
	declare p_vehicle_state_number varchar(10);
	declare Cursor_Width int;
    declare Cursor_Height int;
    declare Cursor_Length int;
	declare i int;
    declare count int;
	declare cursor_i cursor for select Vehicle_Width, Vehicle_Height, Vehicle_Length from Vehicle;
		select sum(cargo_width) into p_Cargo_Width  from Cargo where Request_ID = p_ID_Request;
		select sum(cargo_height) into p_Cargo_Height  from Cargo where Request_ID = p_ID_Request;
		select sum(cargo_length) into p_Cargo_Length  from Cargo where Request_ID = p_ID_Request;
        select count(*) into count from vehicle;
		open cursor_i;
        set i = 1;
		label1:while i <= count do
        	fetch cursor_i into Cursor_Width, Cursor_Height, Cursor_Length;
				if p_Cargo_Width <= Cursor_Width and p_Cargo_Height <= Cursor_Height and p_Cargo_Length <= Cursor_Length then
					select Vehicle_State_Number into p_vehicle_state_number from Vehicle where Vehicle_Width = Cursor_Width and Vehicle_Height = Cursor_Height and Vehicle_Length = Cursor_Length limit 1;
					return p_vehicle_state_number;
			end if;
            set i = i + 1;
		end while label1;
        return "Невозможно распределить груз";
	end;
DELIMITER /
#ОНО РАБОТАЕТ
select Choose_Vehicle_For_Cargo(1);

Select DISTINCT(concat(vehicle_width,'x',vehicle_height,'x',vehicle_length)) as "Параметры автомобилей" from vehicle