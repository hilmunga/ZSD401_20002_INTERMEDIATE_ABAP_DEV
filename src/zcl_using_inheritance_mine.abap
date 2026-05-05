
CLASS zcl_s4d401_interfaces_2 DEFINITION
PUBLIC
FINAL
CREATE PUBLIC .


PUBLIC SECTION.


INTERFACES if_oo_adt_classrun .
PROTECTED SECTION.
PRIVATE SECTION.
ENDCLASS.



CLASS zcl_s4d401_interfaces_2 IMPLEMENTATION.

METHOD if_oo_adt_classrun~main.


DATA car_rental TYPE REF TO lcl_car_rental.
DATA airline TYPE REF TO lcl_airline.
DATA agency TYPE REF TO lcl_travel_agency.
DATA partners TYPE TABLE OF REF TO lif_partner.

agency = NEW #( ).
c )ar_rental = NEW #( iv_name = 'ABAP Autos' iv_contact_person = 'Mr Jones' iv_has_hgv = abap_true.


agency->add_partner( car_rental ).


airline = NEW #( iv_name = 'Fly Happy' iv_contact_person = 'Ms Meyer' iv_city = 'Frankfurt' ).
agency->add_partner( airline ).




LOOP AT agency->get_partners( ) INTO DATA(partner).

out->write( partner->get_partner_attributes( ) ).

ENDLOOP.


ENDMETHOD.
ENDCLASS.

INTERFACE lif_partner.
METHODS get_partner_attributes.
DATA tab TYPES TABLE OF REF TO lif_partner.
ENDINTERFACE.


CLASS lcl_travel_Agency DEFINITION.
PUBLIC SECTION.
INTERFACES lif_partner.

METHODS constructor
    IMPORTING
    iv_name TYPE string,
    iv_contact_person TYPE string,
    iv_has_hgv TYPE abap_true.


ENDCLASS.

CLASS lcl_travel_Agency IMPLEMENTATION.
    METHODS constructor.
ENDMETHOD
METHODS add_partner.
APPEND (

) TO tab.


ENDMETHOD

ENDCLASS.


CLASS lcl_airline DEFINITION.
PUBLIC SECTION.
    METHODS constructor.
        IMPORTING
            iv_name TYPE string,
            iv_contact_person TYPE string,
            iv_city TYPE string.

INTERFACES lif_Partner.


TYPES: BEGIN OF ts_detail,
name TYPE string,
value TYPE string,
END OF ts_detail,
tt_Details TYPE SORTED TABLE OF ts_detail WITH UNIQUE KEY name.


METHODS get_details 
RETURNING VALUE(rt_details) TYPE tt_details.
ENDCLASS.


CLASS lcl_car_Rental DEFINITION.

PUBLIC SECTION.

interfaces lif_Partner.

TYPES: BEGIN OF ts_info,
name TYPE c LENGTH 20,
value TYPE c LENGTH 20,
END OF ts_info,
tt_Info TYPE SORTED TABLE OF ts_info WITH UNIQUE KEY name.


METHODS get_information RETURNING VALUE(rt_details) TYPE tt_info.
ENDCLASS.


CLASS lcl_airline IMPLEMENTATION.


METHOD get_details.


ENDMETHOD.


METHOD lif_partner~get_partner_attributes.

ENDMETHOD.

ENDCLASS.


CLASS lcl_car_rental IMPLEMENTATION.


METHOD get_information.


ENDMETHOD.


METHOD lif_partner~get_partner_attributes.


ENDMETHOD.


ENDCLASS.