Insert into Client (Client_Organization_Name, Client_Legal_Address, Client_Physical_Address, Client_ITN, Client_BIC, Client_OKPO, Client_Repr_Surname, Client_Repr_Name, Client_Repr_Second_Name)
values('ООО "Перевозкин"', 'пр-д Якушкина, 2, Москва, 127273', 'Правды ул., д 24, стр 3, Москва, 105064', '3966528670', '044525972', '4824096313', 'Иванов', 'Иван', 'Иванович'), 
('ООО "СтройМент"', 'ул. Снежная, 23, Москва, 129323', 'Смирновская ул., 6, Люберцы, Московская обл., 140005',	'4829572957', '044525225', '4995123385', 'Ерёменко', 'Владлен', 'Владленович'),
('ИП "Альбертов"',	'ул. Крупешина, 36, Балашиха, Московская обл., 143910', 'ул. Крупешина, 36, Балашиха, Московская обл., 143910', '5798325789', '044525643', '4824059416', 'Джон', 'Доэ',	 'Смитович'),
('ОАО "Фондбра"', 'ул. Индустриальная, 13в, Мытищи, Московская обл., 141006', 'ул. Авиаконструктора Миля, 7, Москва, 109156', '2759478104', '044525974', '4824096316', 'Никитенко', 'Никита',	 'Никитин'),
('ПАО "Быстро и точка"', 'Октябрьская ул., 37, Москва, 127018', 'Октябрьская ул., 40, Москва, 127018', '2750159257', '044525241', '6722450097', 'Александров', 'Евгений', 'Александрович');


Select Client_Represantative_Surname  as "Фамилии представителей" from Client
order by Client_Represantative_Surname ASC;
 
ALTER TABLE Manager
  DROP CONSTRAINT manager_manager_snils_check
, ADD  CONSTRAINT manager_manager_snils_check CHECK(Manager_SNILS similar to '\d\d\d\-\d\d\d\-\d\d\d \d\d');

Insert into Manager (Manager_Surname, Manager_Name, Manager_Second_Name,	Manager_Passport_Series,	Manager_Passport_Number,	Manager_ITN, Manager_SNILS)
values ('Никитин',	'Никита',	'Никитович',	'3604',	'285928',	'4729582958','214-942-124 00'),
('Иванов',	'Иван',	'Иванович',	'7201',	'485822',	'4829573910',	'421-124-582 02'),
('Кириллов',	'Кирилл',	'Кириллович',	'6703',	'758173',	'3890473859',	'235-126-281 82'),
('Артёмин',	'Артём',	'Артёмович',	'6307',	'837292',	'2959340372',	'215-581-295 98'),
('Монахов',	'Александр',	'Александрович',	'7594',	'845718',	'3958120353',	'325-794-821 82');


Select Manager_Name as "Имена менеджеров" from Manager order by Manager_Name ASC;

ALTER TABLE Driver
  DROP CONSTRAINT driver_driver_snils_check
, ADD  CONSTRAINT driver_driver_snils_check CHECK(Driver_SNILS similar to '\d\d\d\-\d\d\d\-\d\d\d \d\d');
Запросы на добавление данных
Insert into Driver (Driver_Passport_Series,	Driver_Passport_Number,	Driver_Snils,	Driver_FFOMI,	Driver_License_Series,	Driver_License_Number,	Driver_Surname,	Driver_Name,	Driver_Second_Name)
values ('4501',	'582019',	'214-913-124 00',	'5325837193829480',	'0509',	'124859',	'Никитин',	'Никита',	'Никитович'),
('2104',	'285938',	'421-124-552 02',	'4738593857205732',	'0684',	'018592',	'Иванов',	'Иван',	'Иванович'),
('7702',	'205814',	'415-126-281 82',	'3859302759383967',	'4804',	'291842',	'Кириллов',	'Кирилл',	'Кириллович'),
('5703',	'128491',	'945-581-295 98',	'3957395830673869',	'2805',	'129534',	'Артёмин',	'Артём',	'Артёмович'),
('1204',	'285929',	'927-794-821 82',	'3967385958392656',	'3996',	'495839',	'Монахов',	'Александр',	'Александрович');

Select Driver_License_Series||' '||Driver_License_Number as "Права",
Driver_Surname as "Фамилия"
from Driver
order by Driver_License_Series ASC;

ALTER TABLE Vehicle
  DROP CONSTRAINT vehicle_vehicle_state_number_check
, ADD  CONSTRAINT vehicle_vehicle_state_number_check CHECK(Vehicle_State_Number similar to '[А-Я]{2}\d\d\d[А-Я]\s\d{2,3}')

Insert into Vehicle (Vehicle_Width, Vehicle_Height, Vehicle_Length, Vehicle_Capacity, Vehicle_State_Number)
values (300,	195,	165,	1500,	'АМ482Н 93'),
(380,	210,	200,	3000,	'ТР931Л 481'),
(300,	195,	165,	1500,	'АР291У 291'),
(380,	210,	200,	3000,	'БД101К 381'),
(300,	195,	165,	1500,	'КК124Ц 90');

Select Vehicle_Capacity as "Грузоподъёмность",
Vehicle_State_Number as "Гос-номер"
 from Vehicle
order by Vehicle_Capacity ASC;

Insert into Complexity (Complexity_Level)
values (1), (2), (3);

Select Complexity_Level as "Сложность" from Complexity
order by Complexity_Level DESC;
Результат запроса на выборку данных
 
Insert into Request (Request_Number,	Request_Date,	Request_Time, Client_ID,	Manager_ID)
values (00000001,	'23-10-2020',	'15:30:00',	20, 10),
(00000002,	'01-11-2020',	'18:40',	21, 9),
(00000003,	'13-11-2020',	'14:41',	22, 10),
(00000004,	'18-11-2020',	'15:36',	23, 12),
(00000005,	'09-11-2020',	'18:29',	24, 13);

Select Request_Number as "Номер заявки" from Request
order by Request_Date ASC;


Insert into Cargo (Cargo_Description,	Cargo_Width,	Cargo_Height,	Cargo_Length,	Cargo_Weight,	Cargo_Price,	Request_ID)
values ('Упаковочная плёнка пластиковая',	123,	81,	74,	100,	50000,	2),
('Алюминивые балки 10x10',	100,	100,	50,	1000,	39900,	3),
('Вода бутилированая 19л',	124,	75,	70,	200,	71000,	3),
('Ёлки новогодние пластиковые',	137,	91,	75,	500,	100101,	1),
('Подшипники ABEC 5',	121,	100,	91,	90,	33900,	4);

Select Cargo_Width||'x'||Cargo_Height||'x'||Cargo_Length||' '||Cargo_Weight as "Габариты", 
Request_ID as "Номер заявки"
from Cargo

order by Request_ID ASC;

Insert into Delivery_Point (Delivery_Point_Mark,	Delivery_Point_Destination, Request_ID)
values ('+',	'ул. Карбышева, 77, Самара, Самарская обл., 443090',	2),
('+',	'ул. Карла Маркса, 43А, Екатеринбург, Свердловская обл., 620026',	3),
('+',	'Комсомольская ул., 21, Екатеринбург, Свердловская обл., 620137',	3),
('+',	'пр. Кирова, 170, Самара, Самарская обл., 443087',	1),
('+',	'ул. Малышева, 85, Екатеринбург, Свердловская обл., 620075',	4);


Select Delivery_Point_Mark as "Выполнено",
Delivery_Point_Destination as "Адрес"
 from Delivery_Point
order by Delivery_Point_Destination ASC;

Insert into Route_Sheet (Route_Sheet_Number, Route_Sheet_Date, Driver_ID,	Vehicle_ID, Complexity_ID)
values (00000001,	'04-08-2019',	2,	3,	1),
(00000002,	'12-08-2019',	3,	3,	2),
(00000003,	'17-08-2019',	3,	4,	2),
(00000004,	'27-08-2019',	4,	5,	3),
(00000005,	'02-09-2019',	6,	6,	1);

Select Route_Sheet_Number as "Номер" from Route_Sheet
 Order by Route_Sheet_Date ASC;

Insert into Combination_Route_Sheet_Delivery_Point (ID_Combination_Route_Sheet_Delivery_Point,	Route_Sheet_ID, Delivery_Point_ID)
values (1,	6,	1),
(2,	7,	2),
(3,	7,	3),
(4,	8,	4),
(5,	8,	5),
(6,	9,	2),
(7,	9,	3),
(8,	10,	4),
(9,	10,	5);

Select Route_Sheet_Number as “Номер”, Delivery_Point_Destination as “Адрес” from Combination_Route_Sheet_Delivery_Point
inner join Route_Sheet on Route_Sheet_ID = ID_Route_Sheet
inner join Delivery_Point on Delivery_Point_ID = ID_Delivery_Point
order by Route_Sheet_Number ASC;

Insert into Combination_Route_Sheet_Cargo (ID_Combination_Route_Sheet_Cargo, Route_Sheet_ID, Cargo_ID)
values (1,	6,	1),
(2,	6,	2),
(3,	6,	3),
(4,	7,	3),
(5,	7,	4),
(6,	8,	5),
(7,	9,	2),
(8,	9,	3),
(9,	9,	4),
(10,	10,	4),
(11,	10,	5);


Select Route_Sheet_Number as “Номер”, Cargo_Width||'x'||Cargo_Height||'x'||Cargo_Length||' '||Cargo_Weight as "Габариты" from Combination_Route_Sheet_Cargo
inner join Route_Sheet on Route_Sheet_ID = ID_Route_Sheet
inner join Cargo on Cargo_ID = ID_Cargo
order by Route_Sheet_Number ASC;













Update Driver set
	Driver_Snils = '311-111-111 10'
		where
		ID_Driver = 2;
 
Delete from Driver
	where ID_Driver = 3;
 

Update Manager set
	Manager_Name = 'Глеб'
		where 
		ID_Manager = 9;
 

Delete from Manager
	where
	ID_Manager = 10;
 

update Representative set
	Second_Name_Repres = 'Андрей'
	where
		ID_Representative = 2;
 

delete from Representative
	where 
	ID_Representative = 1;
 

Update Request set
	Request_Time = '13:10',
	Request_Date = '11-11-2020'
		where
		ID_Request = 1;
 

Delete from Request
	where
	ID_Request = 3;
 
Запросы и результаты
Изменение данных
Update Vehicle set
	Vehicle_Width = 355
	where
		ID_Vehicle = 5;
 
Удаление данных
Delete from Vehicle
	where
	ID_Vehicle = 4;

