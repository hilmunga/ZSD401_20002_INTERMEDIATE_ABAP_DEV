CLASS zcl_inner_joins DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_INNER_JOINS IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*    SELECT FROM /dmo/carrier INNER JOIN /dmo/connection
   SELECT FROM /dmo/carrier AS a INNER JOIN /dmo/connection AS c
             ON a~carrier_id = c~carrier_id

         FIELDS a~carrier_id,
                name AS carrier_name,
                connection_id,
                airport_from_id,
                airport_to_id

          WHERE currency_code = 'EUR'
           INTO TABLE @DATA(result).

    out->write(
      EXPORTING
        data   = result
        name   = 'RESULT'
    ).


  ENDMETHOD.
ENDCLASS.
