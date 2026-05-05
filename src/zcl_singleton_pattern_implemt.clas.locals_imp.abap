*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

CLASS lcl_connection DEFINITION CREATE PRIVATE.
PUBLIC SECTION.
METHODS constructor
IMPORTING
iv_airlineid TYPE /dmo/carrier_id
iv_connectionnumber TYPE /dmo/connection_id
iv_fromAirport TYPE /dmo/airport_from_id
iv_toAirport TYPE /dmo/airport_to_id.


CLASS-METHODS get_connection
IMPORTING
airlineId TYPE /dmo/carrier_id
connectionNumber TYPE /dmo/connection_id
RETURNING VALUE(ro_connection) TYPE REF TO lcl_Connection.

PRIVATE SECTION.


TYPES: BEGIN OF ts_instance,
airlineId TYPE /dmo/carrier_id,
connectionNumber TYPE /dmo/connection_id,
object TYPE REF TO lcl_connection,
END OF ts_instance,
tt_instances TYPE HASHED TABLE OF ts_instance
WITH UNIQUE KEY airlineId ConnectionNumber.


DATA mv_AirlineId TYPE /dmo/carrier_id.
DATA mv_ConnectionNumber TYPE /dmo/connection_id.
DATA mv_fromAirport TYPE /dmo/airport_from_id.
DATA mv_toAirport TYPE /dmo/airport_to_id.
CLASS-DATA mv_connections TYPE tt_instances.
ENDCLASS.


CLASS lcl_connection IMPLEMENTATION.


METHOD constructor.


me->mv_airlineid = iV_airlineid.
me->mv_connectionnumber = iv_connectionnumber.
me->mv_fromAirport = iv_fromAirport.
me->mv_toAirport = iv_toAirport.


ENDMETHOD.


METHOD get_connection.
DATA fromAirport TYPE /dmo/airport_from_id.
DATA toAirport TYPE /dmo/airport_to_id.


IF NOT line_exists( mv_connections[ airlineid = airlineid connectionnumber = connectionnumber ] ).
SELECT SINGLE FROM /dmo/connection FIELDS airport_from_id, airport_to_id
WHERE carrier_id = @airlineid
AND connection_id = @connectionnumber
INTO ( @fromAirport, @toAirport ).


ro_connection = NEW #( iv_airlineid = airlineid iv_connectionnumber = connectionnumber iv_fromairport = fromairport iv_toairport = toairport ).
DATA(new_instance) = VALUE ts_instance( airlineId = airlineId connectionnumber = connectionnumber object = ro_connection ).
INSERT new_instance INTO TABLE mv_connections.
ELSE.
ro_connection = mv_connections[ airlineId = airlineId connectionnumber = connectionnumber ]-object.
ENDIF.


ENDMETHOD.


ENDCLASS.
