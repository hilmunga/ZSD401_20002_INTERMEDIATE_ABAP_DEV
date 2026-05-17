CLASS zcl_sorted_and_hashed_tables DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_SORTED_AND_HASHED_TABLES IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Run this class using the ABAP Profiler to measure relative access times for standard, sorted, and hashed tables

data(flights) = new lcl_flights( ).
flights->access_standard( ).
flights->access_sorted( ).
flights->access_hashed( ).


out->write( |Done| ).
  ENDMETHOD.
ENDCLASS.
