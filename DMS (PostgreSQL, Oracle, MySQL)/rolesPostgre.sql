create role client with password 'Pa$$w0rd';
alter role client LOGIN;
grant connect on database "Ground_Cargo" to client;

create role driver with password 'Pa$$w0rd';
alter role driver LOGIN;
grant connect on database "Ground_Cargo" to driver;

create role manager with password 'Pa$$w0rd';
alter role manager LOGIN;
grant connect on database "Ground_Cargo" to manager;

create role GC_admin with password 'Pa$$w0rd';
alter role GC_admin LOGIN;
grant connect on database "Ground_Cargo" to GC_admin;




grant SELECT on Cargo to Client;
grant SELECT on Delivery_Point to Client;
grant SELECT on Request_History to Client;
grant EXECUTE on procedure cargo_delete to Client;
grant EXECUTE on procedure cargo_insert to Client;
grant EXECUTE on procedure cargo_update to Client;
grant EXECUTE on procedure client_delete to Client;
grant EXECUTE on procedure client_update to Client;
grant EXECUTE on procedure delivery_point_delete to Client;
grant EXECUTE on procedure delivery_point_insert to Client;
grant EXECUTE on procedure delivery_point_update to Client;
grant EXECUTE on procedure request_delete to Client;
grant EXECUTE on procedure request_insert to Client;
grant EXECUTE on procedure request_update to Client;
grant SELECT on Request_List to Client;
grant execute on function Client_Request_History to client;
grant execute on function Client_Requests_History to client;

grant SELECT on Complexity to Driver;
grant SELECT on Delivery_Point to Driver;
grant SELECT on Route_History to Driver;
grant SELECT on Vehicle to Driver;
grant execute on procedure driver_insert to Driver;
grant execute on procedure driver_update to Driver;
grant SELECT on Route_Sheet_List to Driver;
grant SELECT on Vehicle_List to Driver;
grant execute on function Driver_Route_History to Driver;

grant SELECT on Cargo to Manager;
grant SELECT on Client to Manager;
grant SELECT on Combination_Route_Sheet_Cargo to Manager;
grant SELECT on Combination_Route_Sheet_Delivery_Point to Manager;
grant SELECT on Complexity to Manager;
grant SELECT on Delivery_point to Manager;
grant SELECT on Driver to Manager;
grant SELECT on Request to Manager;
grant SELECT on Route_Sheet to Manager;
grant SELECT on Vehicle to Manager;
grant execute on procedure cargo_delete to Manager;
grant execute on procedure cargo_insert to Manager;
grant execute on procedure cargo_update to Manager;
grant execute on procedure client_delete to Manager;
grant execute on procedure client_insert to Manager;
grant execute on procedure client_update to Manager;
grant execute on procedure combination_route_sheet_cargo_delete to Manager;
grant execute on procedure combination_route_sheet_cargo_insert to Manager;
grant execute on procedure combination_route_sheet_cargo_update to Manager;
grant execute on procedure combination_route_sheet_delivery_point_delete to Manager;
grant execute on procedure combination_route_sheet_delivery_point_insert to Manager;
grant execute on procedure combination_route_sheet_delivery_point_update to Manager;
grant execute on procedure complexity_delete to Manager;
grant execute on procedure complexity_insert to Manager;
grant execute on procedure complexity_update to Manager;
grant execute on procedure delivery_point_delete to Manager;
grant execute on procedure delivery_point_insert to Manager;
grant execute on procedure delivery_point_update to Manager;
grant execute on procedure driver_delete to Manager;
grant execute on procedure driver_insert to Manager;
grant execute on procedure driver_update to Manager;
grant execute on procedure manager_update to Manager;
grant execute on procedure request_delete to Manager;
grant execute on procedure request_insert to Manager;
grant execute on procedure request_update to Manager;
grant execute on procedure route_sheet_delete to Manager;
grant execute on procedure route_sheet_insert to Manager;
grant execute on procedure route_sheet_update to Manager;
grant execute on procedure vehicle_delete to Manager;
grant execute on procedure vehicle_insert to Manager;
grant execute on procedure vehicle_update to Manager;
grant SELECT on Driver_List to Manager;
grant SELECT on Vehicle_List to Manager;
grant execute on function Choose_Vehicle_For_Cargo to manager;

grant SELECT on Cargo to GC_Admin;
grant SELECT on Client to GC_Admin;
grant SELECT on Combination_Route_Sheet_Cargo to GC_Admin;
grant SELECT on Combination_Route_Sheet_Delivery_Point to GC_Admin;
grant SELECT on Complexity to GC_Admin;
grant SELECT on Delivery_point to GC_Admin;
grant SELECT on Driver to GC_Admin;
grant SELECT on Manager to GC_Admin;
grant SELECT on Request to GC_Admin;
grant SELECT on Request_History to GC_Admin;
grant SELECT on Route_History to GC_Admin;
grant SELECT on Route_Sheet to GC_Admin;
grant SELECT on Vehicle to GC_Admin;
grant execute on procedure cargo_delete to GC_Admin;
grant execute on procedure cargo_insert to GC_Admin;
grant execute on procedure cargo_update to GC_Admin;
grant execute on procedure client_delete to GC_Admin;
grant execute on procedure client_insert to GC_Admin;
grant execute on procedure client_update to GC_Admin;
grant execute on procedure combination_route_sheet_cargo_delete to GC_Admin;
grant execute on procedure combination_route_sheet_cargo_insert to GC_Admin;
grant execute on procedure combination_route_sheet_cargo_update to GC_Admin;
grant execute on procedure combination_route_sheet_delivery_point_delete to GC_Admin;
grant execute on procedure combination_route_sheet_delivery_point_insert to GC_Admin;
grant execute on procedure combination_route_sheet_delivery_point_update to GC_Admin;
grant execute on procedure complexity_delete to GC_Admin;
grant execute on procedure complexity_insert to GC_Admin;
grant execute on procedure complexity_update to GC_Admin;
grant execute on procedure delivery_point_delete to GC_Admin;
grant execute on procedure delivery_point_insert to GC_Admin;
grant execute on procedure delivery_point_update to GC_Admin;
grant execute on procedure driver_delete to GC_Admin;
grant execute on procedure driver_insert to GC_Admin;
grant execute on procedure driver_update to GC_Admin;
grant execute on procedure manager_delete to GC_Admin;
grant execute on procedure manager_insert to GC_Admin;
grant execute on procedure manager_update to GC_Admin;
grant execute on procedure request_delete to GC_Admin;
grant execute on procedure request_insert to GC_Admin;
grant execute on procedure request_update to GC_Admin;
grant execute on procedure route_sheet_delete to GC_Admin;
grant execute on procedure route_sheet_insert to GC_Admin;
grant execute on procedure route_sheet_update to GC_Admin;
grant execute on procedure vehicle_delete to GC_Admin;
grant execute on procedure vehicle_insert to GC_Admin;
grant execute on procedure vehicle_update to GC_Admin;
grant SELECT on Driver_List to GC_Admin;
grant SELECT on Request_List to GC_Admin;
grant SELECT on Route_Sheet_List to GC_Admin;
grant SELECT on Vehicle_List to GC_Admin;
grant execute on function Choose_Vehicle_For_Cargo to GC_Admin;
grant execute on function Client_Request_History to GC_Admin;
grant execute on function Client_Requests_History to GC_Admin;
grant execute on function Driver_Route_History to GC_Admin;
