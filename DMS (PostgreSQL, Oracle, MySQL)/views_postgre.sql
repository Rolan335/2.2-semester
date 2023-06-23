create or replace view Request_List("Номер","Заказчик","Дата","Время","Точки доставки", "Транспортируемый груз","Габариты груза","Вес груза","Стоимость груза")
as
	
	select Request_Number, Client_Organization_Name, Request_Date,Request_Time, STRING_AGG(delivery_Point_destination ||' '|| Delivery_Point_Mark, ' ; '), Cargo_Description, Cargo_Width ||' X '|| Cargo_Height 
			||' X '|| Cargo_Length, Cargo_Weight, Cargo_Price from Request
		inner join Client on ID_Client = Client_ID
        inner join Delivery_Point on Request_ID = ID_Request
        inner join Cargo on Cargo.Request_ID = ID_Request
        group by Request_Number, Client_Organization_Name, Request_Date,Request_Time, Cargo_Description, Cargo_Width ||' X '|| Cargo_Height 
			||' X '|| Cargo_Length, Cargo_Weight, Cargo_Price
		order by Request_Number asc;

Create or replace view Route_Sheet_List("Номер маршрутного листа","Номер принадлежащих заявок","ФИО Менеджера","Дата формирования")
as
	Select Route_Sheet_Number, String_AGG(Request_Number,' ; '), Manager_Surname ||' '|| Manager_Name||' '|| Manager_Second_Name, 
			Route_Sheet_Date From Route_Sheet
		inner join Combination_Route_Sheet_Delivery_Point on ID_Route_Sheet = Route_Sheet_ID
		inner join Delivery_Point on Delivery_Point_ID = ID_Delivery_Point
		inner join Request on Request_ID = ID_Request
		inner join Manager on Manager_ID = ID_Manager
		group by Route_Sheet_Number,Manager_Surname ||' '|| Manager_Name||' '|| Manager_Second_Name,  
			Route_Sheet_Date
		order by Route_Sheet_Number asc;
Create or replace view Vehicle_List("Государственный номер", "Ширина грузовой части", "Высота грузовой части", "Длина грузовой части", "Грузоподъёмность")
as
	Select Vehicle_State_Number, Vehicle_Width, Vehicle_Height, Vehicle_Length, Vehicle_Capacity from Vehicle
	order by vehicle_capacity asc;

Create or replace view Driver_List("ФИО водителя","Паспортные данные","СНИЛС","Полис ФОМС","Реквизиты прав")
as
	Select Driver_Surname||' '||Driver_Name||' '||Driver_Second_Name,Driver_Passport_Series||' '||Driver_Passport_Number,Driver_SNILS, Driver_FFOMI,Driver_License_Series||' '||Driver_Passport_Number
		from Driver
	order by Driver_Surname asc;


--забраковано
-- Create or replace view Client_List("Полное название организации","Юр. Адрес","Физ. Адрес","ИНН","БИК","ОКПО","ФИО представителя") 
-- as
--  SELECT client_organization_name, client_legal_address, client_physical_address, client_itn,client_bic,client_okpo,
--     client.client_repr_surname|| ' ' || client.client_repr_name || ' ' || client.client_repr_second_name
--    FROM client
--   ORDER BY client.client_organization_name;