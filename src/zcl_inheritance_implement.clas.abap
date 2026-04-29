CLASS zcl_inheritance_implement DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_inheritance_implement IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

 DATA plane TYPE REF TO lcl_cargo_plane.
    plane = NEW lcl_cargo_plane( iv_manufacturer = 'Airbus' iv_type = 'A380' iv_cargo = 1000000 ).
    out->write( plane->get_attributes( ) ).




  ENDMETHOD.
ENDCLASS.
