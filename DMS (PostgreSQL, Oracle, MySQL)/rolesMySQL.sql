create user client @'localhost' identified by 'Pa$$w0rd';
use ground_cargo_database;
grant all on ground_cargo_database to client @'localhost';

create user driver @'localhost' identified by 'Pa$$w0rd';
use ground_cargo_database;
grant all on ground_cargo_database to driver @'localhost';

create user manager @'localhost' identified by 'Pa$$w0rd';
use ground_cargo_database;
grant all on ground_cargo_database to manager @'localhost';

create user GC_Admin @'localhost' identified by 'Pa$$w0rd';
use ground_cargo_database;
grant all on ground_cargo_database to GC_Admin @'localhost';


grant SELECT on Cargo to client @'localhost';
grant SELECT on Delivery_Point to client @'localhost';
grant SELECT on Request_History to client @'localhost';
grant EXECUTE on procedure cargo_delete to client @'localhost';
grant EXECUTE on procedure cargo_insert to client @'localhost';
grant EXECUTE on procedure cargo_update to client @'localhost';
grant EXECUTE on procedure client_delete to client @'localhost';
grant EXECUTE on procedure client_update to client @'localhost';
grant EXECUTE on procedure delivery_point_delete to client @'localhost';
grant EXECUTE on procedure delivery_point_insert to client @'localhost';
grant EXECUTE on procedure delivery_point_update to client @'localhost';
grant EXECUTE on procedure request_delete to client @'localhost';
grant EXECUTE on procedure request_insert to client @'localhost';
grant EXECUTE on procedure request_update to client @'localhost';
grant SELECT on Request_List to client @'localhost';
grant execute on function client_Request_History to client @'localhost';


grant SELECT on Complexity to driver @'localhost';
grant SELECT on Delivery_Point to driver @'localhost';
grant SELECT on Route_History to driver @'localhost';
grant SELECT on Vehicle to driver @'localhost';
grant execute on procedure driver_insert to driver @'localhost';
grant execute on procedure driver_update to driver @'localhost';
grant SELECT on Route_Sheet_List to driver @'localhost';
grant SELECT on Vehicle_List to driver @'localhost';
grant execute on function driver_Route_History to driver @'localhost';

grant SELECT on Cargo to manager @'localhost';
grant SELECT on client to manager @'localhost';
grant SELECT on Combination_Route_Sheet_Cargo to manager @'localhost';
grant SELECT on Combination_Route_Sheet_Delivery_Point to manager @'localhost';
grant SELECT on Complexity to manager @'localhost';
grant SELECT on Delivery_point to manager @'localhost';
grant SELECT on driver to manager @'localhost';
grant SELECT on Request to manager @'localhost';
grant SELECT on Route_Sheet to manager @'localhost';
grant SELECT on Vehicle to manager @'localhost';
grant execute on procedure cargo_delete to manager @'localhost';
grant execute on procedure cargo_insert to manager @'localhost';
grant execute on procedure cargo_update to manager @'localhost';
grant execute on procedure client_delete to manager @'localhost';
grant execute on procedure client_insert to manager @'localhost';
grant execute on procedure client_update to manager @'localhost';
grant execute on procedure combination_route_sheet_cargo_delete to manager @'localhost';
grant execute on procedure combination_route_sheet_cargo_insert to manager @'localhost';
grant execute on procedure combination_route_sheet_cargo_update to manager @'localhost';
grant execute on procedure combination_route_sheet_delivery_point_delete to manager @'localhost';
grant execute on procedure combination_route_sheet_delivery_point_insert to manager @'localhost';
grant execute on procedure combination_route_sheet_delivery_point_update to manager @'localhost';
grant execute on procedure complexity_delete to manager @'localhost';
grant execute on procedure complexity_insert to manager @'localhost';
grant execute on procedure complexity_update to manager @'localhost';
grant execute on procedure delivery_point_delete to manager @'localhost';
grant execute on procedure delivery_point_insert to manager @'localhost';
grant execute on procedure delivery_point_update to manager @'localhost';
grant execute on procedure driver_delete to manager @'localhost';
grant execute on procedure driver_insert to manager @'localhost';
grant execute on procedure driver_update to manager @'localhost';
grant execute on procedure manager_update to manager @'localhost';
grant execute on procedure request_delete to manager @'localhost';
grant execute on procedure request_insert to manager @'localhost';
grant execute on procedure request_update to manager @'localhost';
grant execute on procedure route_sheet_delete to manager @'localhost';
grant execute on procedure route_sheet_insert to manager @'localhost';
grant execute on procedure route_sheet_update to manager @'localhost';
grant execute on procedure vehicle_delete to manager @'localhost';
grant execute on procedure vehicle_insert to manager @'localhost';
grant execute on procedure vehicle_update to manager @'localhost';
grant SELECT on driver_List to manager @'localhost';
grant SELECT on Vehicle_List to manager @'localhost';
grant execute on function Choose_Vehicle_For_Cargo to manager @'localhost';

grant SELECT on Cargo to GC_Admin @'localhost';
grant SELECT on client to GC_Admin @'localhost';
grant SELECT on Combination_Route_Sheet_Cargo to GC_Admin @'localhost';
grant SELECT on Combination_Route_Sheet_Delivery_Point to GC_Admin @'localhost';
grant SELECT on Complexity to GC_Admin @'localhost';
grant SELECT on Delivery_point to GC_Admin @'localhost';
grant SELECT on driver to GC_Admin @'localhost';
grant SELECT on manager to GC_Admin @'localhost';
grant SELECT on Request to GC_Admin @'localhost';
grant SELECT on Request_History to GC_Admin @'localhost';
grant SELECT on Route_History to GC_Admin @'localhost';
grant SELECT on Route_Sheet to GC_Admin @'localhost';
grant SELECT on Vehicle to GC_Admin @'localhost';
grant execute on procedure cargo_delete to GC_Admin @'localhost';
grant execute on procedure cargo_insert to GC_Admin @'localhost';
grant execute on procedure cargo_update to GC_Admin @'localhost';
grant execute on procedure client_delete to GC_Admin @'localhost';
grant execute on procedure client_insert to GC_Admin @'localhost';
grant execute on procedure client_update to GC_Admin @'localhost';
grant execute on procedure combination_route_sheet_cargo_delete to GC_Admin @'localhost';
grant execute on procedure combination_route_sheet_cargo_insert to GC_Admin @'localhost';
grant execute on procedure combination_route_sheet_cargo_update to GC_Admin @'localhost';
grant execute on procedure combination_route_sheet_delivery_point_delete to GC_Admin @'localhost';
grant execute on procedure combination_route_sheet_delivery_point_insert to GC_Admin @'localhost';
grant execute on procedure combination_route_sheet_delivery_point_update to GC_Admin @'localhost';
grant execute on procedure complexity_delete to GC_Admin @'localhost';
grant execute on procedure complexity_insert to GC_Admin @'localhost';
grant execute on procedure complexity_update to GC_Admin @'localhost';
grant execute on procedure delivery_point_delete to GC_Admin @'localhost';
grant execute on procedure delivery_point_insert to GC_Admin @'localhost';
grant execute on procedure delivery_point_update to GC_Admin @'localhost';
grant execute on procedure driver_delete to GC_Admin @'localhost';
grant execute on procedure driver_insert to GC_Admin @'localhost';
grant execute on procedure driver_update to GC_Admin @'localhost';
grant execute on procedure manager_delete to GC_Admin @'localhost';
grant execute on procedure manager_insert to GC_Admin @'localhost';
grant execute on procedure manager_update to GC_Admin @'localhost';
grant execute on procedure request_delete to GC_Admin @'localhost';
grant execute on procedure request_insert to GC_Admin @'localhost';
grant execute on procedure request_update to GC_Admin @'localhost';
grant execute on procedure route_sheet_delete to GC_Admin @'localhost';
grant execute on procedure route_sheet_insert to GC_Admin @'localhost';
grant execute on procedure route_sheet_update to GC_Admin @'localhost';
grant execute on procedure vehicle_delete to GC_Admin @'localhost';
grant execute on procedure vehicle_insert to GC_Admin @'localhost';
grant execute on procedure vehicle_update to GC_Admin @'localhost';
grant SELECT on driver_List to GC_Admin @'localhost';
grant SELECT on Request_List to GC_Admin @'localhost';
grant SELECT on Route_Sheet_List to GC_Admin @'localhost';
grant SELECT on Vehicle_List to GC_Admin @'localhost';
grant execute on function Choose_Vehicle_For_Cargo to GC_Admin @'localhost';
grant execute on function client_Request_History to GC_Admin @'localhost';

grant execute on function driver_Route_History to GC_Admin @'localhost';
