CLASS zcl_unsuccessful_assignment DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_unsuccessful_assignment IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  DATA var_string TYPE string.
  DATA var_int    TYPE i.
  DATA var_pack   TYPE p LENGTH 3 DECIMALS 2.
TRY.
  var_string = 'ABCDE'.
  var_pack   = var_string.
CATCH cx_sy_conversion_no_number.
ENDTRY.
  var_string = 'ABCDE'.
  var_int    = var_string.
TRY.
  var_string = '1000'.
  var_int    = var_string.
CATCH cx_sy_conversion_overflow.
ENDTRY.
  var_string = '1000'.
  var_pack   = var_string.

  ENDMETHOD.
ENDCLASS.
