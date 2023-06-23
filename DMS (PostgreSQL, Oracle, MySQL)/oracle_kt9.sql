Insert into Client (Client_Organization_Name, Client_Legal_Address, Client_Physical_Address, Client_ITN, Client_BIC, Client_OKPO, Client_Repr_Surname, Client_Repr_Name, Client_Repr_Second_Name)
values ('ООО "Перевозкин"', 'пр-д Якушкина, 2, Москва, 127273', 'Правды ул., д 24, стр 3, Москва, 105064', '3966528670', '044525972', '4824096313', 'Иванов', 'Иван', 'Иванович');
Insert into Client (Client_Organization_Name, Client_Legal_Address, Client_Physical_Address, Client_ITN, Client_BIC, Client_OKPO, Client_Repr_Surname, Client_Repr_Name, Client_Repr_Second_Name)
values ('ООО "СтройМент"', 'ул. Снежная, 23, Москва, 129323', 'Смирновская ул., 6, Люберцы, Московская обл., 140005',	'4829572957', '044525225', '4995123385', 'Ерёменко', 'Владлен', 'Владленович');
Insert into Client (Client_Organization_Name, Client_Legal_Address, Client_Physical_Address, Client_ITN, Client_BIC, Client_OKPO, Client_Repr_Surname, Client_Repr_Name, Client_Repr_Second_Name)
values ('ИП "Альбертов"',	'ул. Крупешина, 36, Балашиха, Московская обл., 143910', 'ул. Крупешина, 36, Балашиха, Московская обл., 143910', '5798325789', '044525643', '4824059416', 'Джон', 'Доэ',	 'Смитович');
Insert into Client (Client_Organization_Name, Client_Legal_Address, Client_Physical_Address, Client_ITN, Client_BIC, Client_OKPO, Client_Repr_Surname, Client_Repr_Name, Client_Repr_Second_Name)
values ('ОАО "Фондбра"', 'ул. Индустриальная, 13в, Мытищи, Московская обл., 141006', 'ул. Авиаконструктора Миля, 7, Москва, 109156', '2759478104', '044525974', '4824096316', 'Никитенко', 'Никита',	 'Никитин');
Insert into Client (Client_Organization_Name, Client_Legal_Address, Client_Physical_Address, Client_ITN, Client_BIC, Client_OKPO, Client_Repr_Surname, Client_Repr_Name, Client_Repr_Second_Name)
values ('ПАО "Быстро и точка"', 'Октябрьская ул., 37, Москва, 127018', 'Октябрьская ул., 40, Москва, 127018', '2750159257', '044525241', '6722450097', 'Александров', 'Евгений', 'Александрович');
/*Запросы на выборку данных ORACLE ОТРАБОТАЛ*/
/*Задача: Вывести название организации, фамилии представителей и инн клиента по возрастанию от фамилии*/
Select Client_Organization_Name as "Название компании", Client_Repr_Surname  as "Фамилии представителей", Client_ITN as "ИНН" from Client
order by Client_Repr_Surname ASC;
/*Работает*/


 
/*Изменение структуры таблицы*/
Alter table Manager drop constraint CH_MANAGER_SNILS;
Alter table Manager add constraint CH_MANAGER_SNILS CHECK(regexp_like(Manager_SNILS, '[0-9]{3}-[0-9]{3}-[0-9]{3} [0-9][0-9]'));

/*Запросы на добавление данных*/
Insert into Manager (Manager_Surname, Manager_Name, Manager_Second_Name,	Manager_Passport_Series,	Manager_Passport_Number,	Manager_ITN, Manager_SNILS)
values ('Никитин',	'Никита',	'Никитович',	'3604',	'285928',	'4729582958','214-942-124 00');
Insert into Manager (Manager_Surname, Manager_Name, Manager_Second_Name,	Manager_Passport_Series,	Manager_Passport_Number,	Manager_ITN, Manager_SNILS)
values ('Иванов',	'Иван',	'Иванович',	'7201',	'485822',	'4829573910',	'421-124-582 02');
Insert into Manager (Manager_Surname, Manager_Name, Manager_Second_Name,	Manager_Passport_Series,	Manager_Passport_Number,	Manager_ITN, Manager_SNILS)
values ('Кириллов',	'Кирилл',	'Кириллович',	'6703',	'758173',	'3890473859',	'235-126-281 82');
Insert into Manager (Manager_Surname, Manager_Name, Manager_Second_Name,	Manager_Passport_Series,	Manager_Passport_Number,	Manager_ITN, Manager_SNILS)
values ('Артёмин',	'Артём',	'Артёмович',	'6307',	'837292',	'2959340372',	'215-581-295 98');
Insert into Manager (Manager_Surname, Manager_Name, Manager_Second_Name,	Manager_Passport_Series,	Manager_Passport_Number,	Manager_ITN, Manager_SNILS)
values ('Монахов',	'Александр',	'Александрович',	'7594',	'845718',	'3958120353',	'325-794-821 82');

/*Запросы на выборку данных */
/*Задача:Вывести Фамилию, имена менеджеров, СНИЛС, Серию и номер паспорта по возрастанию от имени*/
Select Manager_Surname || ' ' || Manager_Name || ' ' || Manager_Second_Name as "ФИО менеджеров", 
Manager_SNILS as "СНИЛС", Manager_Passport_Series || ' ' || Manager_Passport_Number as "Данные паспорта" 
from Manager order by Manager_Name ASC;
/*Работает*/


 
/*Изменение структуры таблицы*/
ALTER TABLE Driver DROP CONSTRAINT CH_DRIVER_SNILS;
ALTER TABLE Driver ADD  CONSTRAINT CH_DRIVER_SNILS CHECK(regexp_like(Driver_SNILS, '[0-9]{3}-[0-9]{3}-[0-9]{3} [0-9][0-9]'));
/*Запросы на добавление данных*/
Insert into Driver (Driver_Passport_Series,	Driver_Passport_Number,	Driver_Snils,	Driver_FFOMI,	Driver_License_Series,	Driver_License_Number,	Driver_Surname,	Driver_Name,	Driver_Second_Name)
values ('4501',	'582019',	'214-913-124 00',	'5325837193829480',	'0509',	'124859',	'Никитин',	'Никита',	'Никитович');
Insert into Driver (Driver_Passport_Series,	Driver_Passport_Number,	Driver_Snils,	Driver_FFOMI,	Driver_License_Series,	Driver_License_Number,	Driver_Surname,	Driver_Name,	Driver_Second_Name)
values ('2104',	'285938',	'421-124-552 02',	'4738593857205732',	'0684',	'018592',	'Иванов',	'Иван',	'Иванович');
Insert into Driver (Driver_Passport_Series,	Driver_Passport_Number,	Driver_Snils,	Driver_FFOMI,	Driver_License_Series,	Driver_License_Number,	Driver_Surname,	Driver_Name,	Driver_Second_Name)
values ('7702',	'205814',	'415-126-281 82',	'3859302759383967',	'4804',	'291842',	'Кириллов',	'Кирилл',	'Кириллович');
Insert into Driver (Driver_Passport_Series,	Driver_Passport_Number,	Driver_Snils,	Driver_FFOMI,	Driver_License_Series,	Driver_License_Number,	Driver_Surname,	Driver_Name,	Driver_Second_Name)
values ('5703',	'128491',	'945-581-295 98',	'3957395830673869',	'2805',	'129534',	'Артёмин',	'Артём',	'Артёмович');
Insert into Driver (Driver_Passport_Series,	Driver_Passport_Number,	Driver_Snils,	Driver_FFOMI,	Driver_License_Series,	Driver_License_Number,	Driver_Surname,	Driver_Name,	Driver_Second_Name)
values ('1204',	'285929',	'927-794-821 82',	'3967385958392656',	'3996',	'495839',	'Монахов',	'Александр',	'Александрович');
/*Запросы на выборку данных */
/*Задача: Вывести серию, номер прав в одной строке и фамилии водителей, отсортировав по серии прав.*/

Select Driver_License_Series || ' ' || Driver_License_Number as "Права",
Driver_Surname as "Фамилия"
from Driver
order by Driver_License_Series ASC;
/*Работает*/
 
/*Изменение структуры таблицы*/
alter table
   Vehicle
modify
(
   Vehicle_State_Number varchar(13)
);
/*Запросы на добавление данных*/
Insert into Vehicle (Vehicle_Width, Vehicle_Height, Vehicle_Length, Vehicle_Capacity, Vehicle_State_Number)
values (300,	195,	165,	1500,	'АМ482Н 93');
Insert into Vehicle (Vehicle_Width, Vehicle_Height, Vehicle_Length, Vehicle_Capacity, Vehicle_State_Number)
values (380,	210,	200,	3000,	'ТР931Л 481');
Insert into Vehicle (Vehicle_Width, Vehicle_Height, Vehicle_Length, Vehicle_Capacity, Vehicle_State_Number)
values (300,	195,	165,	1500,	'АР291У 291');
Insert into Vehicle (Vehicle_Width, Vehicle_Height, Vehicle_Length, Vehicle_Capacity, Vehicle_State_Number)
values (380,	210,	200,	3000,	'БД101К 381');
Insert into Vehicle (Vehicle_Width, Vehicle_Height, Vehicle_Length, Vehicle_Capacity, Vehicle_State_Number)
values (300,	195,	165,	1500,	'КК124Ц 90');
/*Запросы на выборку данных */
/*Задача: Вывести ШиринуХВысотыХДлину ,грузоподьёмность и гос-номер отсортировав по грузоподъёмности по возрастанию.*/
Select Vehicle_Width || 'x' || Vehicle_Height || 'x' || Vehicle_Length as "Габариты", Vehicle_Capacity as "Грузоподъёмность",
Vehicle_State_Number as "Гос-номер"
 from Vehicle
order by Vehicle_Capacity ASC;
/*Работает*/

 
/*Изменение структуры таблицы

/*Запросы на добавление данных*/
Insert into Complexity (Complexity_Level)
values (1); Insert into Complexity (Complexity_Level) values (2); Insert into Complexity (Complexity_Level) values (3); 
/**/
/*Запросы на выборку данных*/
/*Задача: Отсортировать уровень сложности по убыванию.*/
Select Complexity_Level as "Сложность" from Complexity
order by Complexity_Level DESC;
/*Работает*/
 
/*Изменение структуры таблицы*/

/*Запросы на добавление данных*/
Insert into Request (Request_Number,	Request_Date,	Request_Time, Client_ID,	Manager_ID)
values (00000001,	'23.10.2020',	'23.10.2020 15:30:00',	4, 12);
Insert into Request (Request_Number,	Request_Date,	Request_Time, Client_ID,	Manager_ID)
values(00000002,	'01.11.2020',	'01.11.2020 18:40',	3, 14);
Insert into Request (Request_Number,	Request_Date,	Request_Time, Client_ID,	Manager_ID)
values(00000003,	'13.11.2020',	'13.11.2020 14:41',	6, 12);
Insert into Request (Request_Number,	Request_Date,	Request_Time, Client_ID,	Manager_ID)
values(00000004,	'18.11.2020',	'18.11.2020 15:36',	7, 11);
Insert into Request (Request_Number,	Request_Date,	Request_Time, Client_ID,	Manager_ID)
values(00000005,	'09.11.2020',	'09.11.2020 18:29',	7, 13);
/*Запросы на выборку данных */
/*Задача: Вывести номера заявок, отсортировав по дате по возрастанию.*/
Select Request_Number as "Номер заявки",
manager_ITN as "ИНН менеджера",
client_ITN as "ИНН клиента"
from Request
inner join manager on manager_ID = ID_Manager
inner join client on client_id = ID_Client
order by Request_Date ASC;
/*Работает*/

 
/*Изменение структуры таблицы*/

/*Запросы на добавление данных*/
Insert into Cargo (Cargo_Description,	Cargo_Width,	Cargo_Height,	Cargo_Length,	Cargo_Weight,	Cargo_Price,	Request_ID)
values ('Упаковочная плёнка пластиковая',	123,	81,	74,	100,	50000,	17);
Insert into Cargo (Cargo_Description,	Cargo_Width,	Cargo_Height,	Cargo_Length,	Cargo_Weight,	Cargo_Price,	Request_ID)
values ('Алюминивые балки 10x10',	100,	100,	50,	1000,	39900,	18);
Insert into Cargo (Cargo_Description,	Cargo_Width,	Cargo_Height,	Cargo_Length,	Cargo_Weight,	Cargo_Price,	Request_ID)
values ('Вода бутилированая 19л',	124,	75,	70,	200,	71000,	20);
Insert into Cargo (Cargo_Description,	Cargo_Width,	Cargo_Height,	Cargo_Length,	Cargo_Weight,	Cargo_Price,	Request_ID)
values ('Ёлки новогодние пластиковые',	137,	91,	75,	500,	100101,	21);
Insert into Cargo (Cargo_Description,	Cargo_Width,	Cargo_Height,	Cargo_Length,	Cargo_Weight,	Cargo_Price,	Request_ID)
values ('Подшипники ABEC 5',	121,	100,	91,	90,	33900,	25);
/*Запросы на выборку данных */
/*Задача: Вывести ширинуXвысотуXдлину Вес, Вывести номер заявки и имя менеджера. Отсортировать по заявке.*/
Select Cargo_Width ||'x' ||Cargo_Height ||'x' ||Cargo_Length ||' ' ||Cargo_Weight as "Габариты", 
Request_Number as "Номер заявки",Manager_Name as "Имя менеджера" 
from Cargo 
inner join request on Request_ID = ID_Request
inner join Manager on Manager_ID = ID_Manager
order by Request_Number ASC
/*Работает*/


 
/*Изменение структуры таблицы*/
-
/*Запросы на добавление данных*/
Insert into Delivery_Point (Delivery_Point_Mark,	Delivery_Point_Destination, Request_ID)
values ('+',	'ул. Карбышева, 77, Самара, Самарская обл., 443090',	17);
Insert into Delivery_Point (Delivery_Point_Mark,	Delivery_Point_Destination, Request_ID)
values ('+',	'ул. Карла Маркса, 43А, Екатеринбург, Свердловская обл., 620026',	18);
Insert into Delivery_Point (Delivery_Point_Mark,	Delivery_Point_Destination, Request_ID)
values ('+',	'Комсомольская ул., 21, Екатеринбург, Свердловская обл., 620137',	20);
Insert into Delivery_Point (Delivery_Point_Mark,	Delivery_Point_Destination, Request_ID)
values ('+',	'пр. Кирова, 170, Самара, Самарская обл., 443087',	21);
Insert into Delivery_Point (Delivery_Point_Mark,	Delivery_Point_Destination, Request_ID)
values ('+',	'ул. Малышева, 85, Екатеринбург, Свердловская обл., 620075',	25);
/*Запросы на выборку данных */
/*Задача: Вывести отметку и адрес отсортировав по адресу.*/
Select Delivery_Point_Mark as "Выполнено",
Delivery_Point_Destination as "Адрес",
Request_Date as "Дата"
 from Delivery_Point
 Inner	Join Request on request_ID = ID_Request
order by Delivery_Point_Destination ASC;

 
/*Изменение структуры таблицы*/
-
/*Запросы на добавление данных*/
Insert into Route_Sheet (Route_Sheet_Number, Route_Sheet_Date, Driver_ID,	Vehicle_ID, Complexity_ID)
values (00000001,	'04.08.2019',	6,	15,	1);
Insert into Route_Sheet (Route_Sheet_Number, Route_Sheet_Date, Driver_ID,	Vehicle_ID, Complexity_ID)
(00000002,	'12.08.2019',	7,	16,	2);
Insert into Route_Sheet (Route_Sheet_Number, Route_Sheet_Date, Driver_ID,	Vehicle_ID, Complexity_ID)
(00000003,	'17.08.2019',	8,	17,	2);
Insert into Route_Sheet (Route_Sheet_Number, Route_Sheet_Date, Driver_ID,	Vehicle_ID, Complexity_ID)
(00000004,	'27.08.2019',	9,	18,	3);
Insert into Route_Sheet (Route_Sheet_Number, Route_Sheet_Date, Driver_ID,	Vehicle_ID, Complexity_ID)
(00000005,	'02.09.2019',	10,	19,	1);
/*Запросы на выборку данных */
/*Задача: Вывести номер маршрутного листа с назначенным водителем и транспортом, отсортировать по дате*/
Select Route_Sheet_Number as "Номер", Driver_Surname || ' ' || Driver_Name as "Водитель", Vehicle_State_Number as "Номер автомобиля" from Route_Sheet
inner join Driver on Driver_ID = ID_Driver
inner join vehicle on Vehicle_ID = ID_Vehicle
 Order by Route_Sheet_Date ASC;



 
/*Изменение структуры таблицы*/

/*Запросы на добавление данных*/
Insert into Combination_Route_Sheet_Delivery_Point (ID_Combination_Route_Sheet_Delivery_Point,	Route_Sheet_ID, Delivery_Point_ID)
values (1,	2,	6);
Insert into Combination_Route_Sheet_Delivery_Point (ID_Combination_Route_Sheet_Delivery_Point,	Route_Sheet_ID, Delivery_Point_ID)
values (2,	3,	6);
Insert into Combination_Route_Sheet_Delivery_Point (ID_Combination_Route_Sheet_Delivery_Point,	Route_Sheet_ID, Delivery_Point_ID)
values (3,	5,	7);
Insert into Combination_Route_Sheet_Delivery_Point (ID_Combination_Route_Sheet_Delivery_Point,	Route_Sheet_ID, Delivery_Point_ID)
values (4,	5,	7);
Insert into Combination_Route_Sheet_Delivery_Point (ID_Combination_Route_Sheet_Delivery_Point,	Route_Sheet_ID, Delivery_Point_ID)
values (5,	5,	8);
Insert into Combination_Route_Sheet_Delivery_Point (ID_Combination_Route_Sheet_Delivery_Point,	Route_Sheet_ID, Delivery_Point_ID)
values (6,	3,	8);
Insert into Combination_Route_Sheet_Delivery_Point (ID_Combination_Route_Sheet_Delivery_Point,	Route_Sheet_ID, Delivery_Point_ID)
values (7,	4,	9);
Insert into Combination_Route_Sheet_Delivery_Point (ID_Combination_Route_Sheet_Delivery_Point,	Route_Sheet_ID, Delivery_Point_ID)
values (8,	6,	9);
Insert into Combination_Route_Sheet_Delivery_Point (ID_Combination_Route_Sheet_Delivery_Point,	Route_Sheet_ID, Delivery_Point_ID)
values (9,	3,	10);
/*Запросы на выборку данных*/
/*Вывести номер маршрутного листа и адрес точки доставки, отсортировать по номеру маршрутного листа*/
Select Route_Sheet_Number as "Номер", Delivery_Point_Destination as "Адрес" from Combination_Route_Sheet_Delivery_Point
inner join Route_Sheet on Route_Sheet_ID = ID_Route_Sheet
inner join Delivery_Point on Delivery_Point_ID = ID_Delivery_Point
order by Route_Sheet_Number ASC;

 
/*Изменение структуры таблицы*/

/*Запросы на добавление данных*/
Insert into Combination_Route_Sheet_Cargo (ID_Combination_Route_Sheet_Cargo, Route_Sheet_ID, Cargo_ID)
values (1,	2,	6);
Insert into Combination_Route_Sheet_Cargo (ID_Combination_Route_Sheet_Cargo, Route_Sheet_ID, Cargo_ID)
values (2,	4,	7);
Insert into Combination_Route_Sheet_Cargo (ID_Combination_Route_Sheet_Cargo, Route_Sheet_ID, Cargo_ID)
values (3,	5,	8);
Insert into Combination_Route_Sheet_Cargo (ID_Combination_Route_Sheet_Cargo, Route_Sheet_ID, Cargo_ID)
values (4,	4,	9);
Insert into Combination_Route_Sheet_Cargo (ID_Combination_Route_Sheet_Cargo, Route_Sheet_ID, Cargo_ID)
(values 5,	2,	10);
Insert into Combination_Route_Sheet_Cargo (ID_Combination_Route_Sheet_Cargo, Route_Sheet_ID, Cargo_ID)
values (6,	3,	6);
Insert into Combination_Route_Sheet_Cargo (ID_Combination_Route_Sheet_Cargo, Route_Sheet_ID, Cargo_ID)
values (7,	4,	7);
Insert into Combination_Route_Sheet_Cargo (ID_Combination_Route_Sheet_Cargo, Route_Sheet_ID, Cargo_ID)
values (8,	3,	8);
Insert into Combination_Route_Sheet_Cargo (ID_Combination_Route_Sheet_Cargo, Route_Sheet_ID, Cargo_ID)
values (9,	2,	9);
Insert into Combination_Route_Sheet_Cargo (ID_Combination_Route_Sheet_Cargo, Route_Sheet_ID, Cargo_ID)
values (10,	2,	6);
Insert into Combination_Route_Sheet_Cargo (ID_Combination_Route_Sheet_Cargo, Route_Sheet_ID, Cargo_ID)
values (11,	2,	7);
/*Запросы на выборку данных*/
/*Задача: Вывести номер маршрутного листа и габариты груза, отсортировать по номеру маршрутного листа*/
	Select Route_Sheet_Number as "Номер", Cargo_Width || 'x' || Cargo_Height || 'x' || Cargo_Length || ' ' || Cargo_Weight as "Габариты" from Combination_Route_Sheet_Cargo
inner join Route_Sheet on Route_Sheet_ID = ID_Route_Sheet
inner join Cargo on Cargo_ID = ID_Cargo
order by Route_Sheet_Number ASC;

 



/*Запросы и результаты*/
/*Изменение данных*/
Update Driver set
	Driver_Snils = '311-111-111 10'
		where
		ID_Driver = 7;
 
/*Удаление данных*/
Delete from Driver
	where ID_Driver = 7;
 
/*Запросы и результаты*/
/*Изменение данных*/
Update Manager set
	Manager_Name = 'Глеб'
		where 
		ID_Manager = 11;
 
/*Удаление данных*/
Delete from Manager
	where
	ID_Manager = 11;
 
/*Запросы и результаты*/
/*Изменение данных*/
update Client set
	Client_ITN = '1902938574'
	where
		ID_Client = 3;
 
/*Удаление данных*/
delete from Client
	where 
	ID_Client = 3;



/*Запросы и результаты*/
/*Изменение данных*/
Update Request set
	Request_Time = '11.11.2020 13:10',
	Request_Date = '11.11.2020'
		where
		ID_Request = 17;
 
/*Удаление данных*/
Delete from Request
	where
	ID_Request = 18;
 
/*Запросы и результаты*/
/*Изменение данных*/
Update Vehicle set
	Vehicle_Width = 355
	where
		ID_Vehicle = 15;
 
/*Удаление данных*/
Delete from Vehicle
	where
	ID_Vehicle = 17;
 

/*Задача: Вывести данные по заказчикам которые имеют статус ООО.*/
Select * from Client 
where Client_Organization_Name like 'ООО%';
 
/*Задача: Вывести гос-номер автотранспорта, у которого грузоподъёмность больше 2000кг*/
Select Vehicle_Capacity as "Грузоподъёмность", 
Vehicle_State_Number as "Госномер"
from Vehicle
where Vehicle_Capacity > 2000

/*Задача: Вывести Адреса, по которым была выполнена доставка */
Select Delivery_Point_Destination as "Выполненные адреса"
from Delivery_Point
where Delivery_Point_Mark = '+'


