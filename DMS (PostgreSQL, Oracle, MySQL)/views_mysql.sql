create or replace view Request_List
as
	select Request_Number as "Номер", Client_Organization_Name as "Заказчик", Request_Date  as "Дата",Request_Time  as "Время", group_concat(CONCAT(delivery_Point_destination,' ', Delivery_Point_Mark), ';')  as "Точки доставки", Cargo_Description as "Транспортируемый груз", CONCAT(Cargo_Width ,' X ', Cargo_Height ,' X ', Cargo_Length) as "Габариты груза", Cargo_Weight as "Вес груза", Cargo_Price as "Стоимость груза" from Request
		inner join Client on ID_Client = Client_ID
        inner join Delivery_Point on Request_ID = ID_Request
        inner join Cargo on Cargo.Request_ID = ID_Request
        group by Request_Number, Client_Organization_Name, Request_Date,Request_Time, Cargo_Description, CONCAT(Cargo_Width ,' X ', Cargo_Height ,' X ', Cargo_Length), Cargo_Weight, Cargo_Price
		order by Request_Number asc;

Create or replace view Route_Sheet_List
as
	Select Route_Sheet_Number as "Номер маршрутного листа", GROUP_CONCAT(Request_Number,' ; ') as "Номер принадлежащих заявок", CONCAT(Manager_Surname ,' ', Manager_Name,' ', Manager_Second_Name) as "ФИО Менеджера", 
			Route_Sheet_Date as "Дата формирования" From Route_Sheet
		inner join Combination_Route_Sheet_Delivery_Point on ID_Route_Sheet = Route_Sheet_ID
		inner join Delivery_Point on Delivery_Point_ID = ID_Delivery_Point
		inner join Request on Request_ID = ID_Request
		inner join Manager on Manager_ID = ID_Manager
		group by Route_Sheet_Number,CONCAT(Manager_Surname ,' ', Manager_Name,' ', Manager_Second_Name),  
			Route_Sheet_Date
		order by Route_Sheet_Number asc;

Create or replace view Vehicle_List
as
	Select Vehicle_State_Number as "Государственный номер", Vehicle_Width as "Ширина грузовой части", Vehicle_Height as "Высота грузовой части", Vehicle_Length as "Длина грузовой части", Vehicle_Capacity as "Грузоподъёмность" from Vehicle
	order by vehicle_capacity asc;


Create or replace view Driver_List
as
	Select CONCAT(Driver_Surname,' ',Driver_Name,' ',Driver_Second_Name) as "ФИО водителя",CONCAT(Driver_Passport_Series,' ',Driver_Passport_Number) as "Паспортные данные",Driver_SNILS as "СНИЛС", Driver_FFOMI as "Полис ФОМС",CONCAT(Driver_License_Series,' ',Driver_Passport_Number) as "Реквизиты прав"
		from Driver
	order by Driver_Surname asc;