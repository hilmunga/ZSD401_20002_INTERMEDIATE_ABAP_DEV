*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
INTERFACE lif_partner.
    METHODS get_partner_attributes
        RETURNING VALUE(rv_result) TYPE string.

ENDINTERFACE.

CLASS lcl_travel_Agency DEFINITION.
PUBLIC SECTION.
TYPES tt_partners TYPE STANDARD TABLE OF REF TO lif_partner WITH EMPTY KEY.
    METHODS:
     add_partner
        IMPORTING
        io_partner TYPE REF TO lif_partner,
     get_partner
        RETURNING VALUE(rt_partners) TYPE tt_partners.
PRIVATE SECTION.
*    DATA: partners TYPE TABLE OF REF TO lif_partner.

     DATA mt_partners TYPE TABLE OF REF TO lif_partner.


ENDCLASS.

CLASS lcl_travel_agency IMPLEMENTATION.

  METHOD add_partner.
    APPEND io_partner TO mt_partners.
  ENDMETHOD.

  METHOD get_partner.
    rt_partners = mt_partners.
  ENDMETHOD.

ENDCLASS.


CLASS lcl_airline DEFINITION.
PUBLIC SECTION.
 METHODS constructor
      IMPORTING
        iv_name           TYPE string
        iv_contact_person TYPE string
        iv_city           TYPE string.


INTERFACES lif_Partner.


TYPES: BEGIN OF ts_detail,
name TYPE string,
value TYPE string,
END OF ts_detail,
tt_Details TYPE SORTED TABLE OF ts_detail WITH UNIQUE KEY name.


METHODS get_details
RETURNING VALUE(rt_details) TYPE tt_details.

PRIVATE SECTION.

DATA: mv_name TYPE string,
      mv_contact_person TYPE string,
      mv_city TYPE string.
ENDCLASS.


CLASS lcl_car_Rental DEFINITION.
PUBLIC SECTION.
METHODS constructor
      IMPORTING
        iv_name           TYPE string
        iv_contact_person TYPE string
        iv_has_hgv        TYPE abap_bool.
interfaces lif_Partner.
TYPES: BEGIN OF ts_info,
name TYPE c LENGTH 20,
value TYPE c LENGTH 20,
END OF ts_info,
tt_Info TYPE SORTED TABLE OF ts_info WITH UNIQUE KEY name.


METHODS get_information
RETURNING VALUE(rt_details) TYPE tt_info.

PRIVATE SECTION.

DATA: mv_name TYPE string,
      mv_contact_person TYPE string,
      mv_has_hgv TYPE abap_bool.

ENDCLASS.


CLASS lcl_airline IMPLEMENTATION.


METHOD get_details.


ENDMETHOD.


 METHOD constructor.
    mv_name = iv_name.
    mv_contact_person = iv_contact_person.
    mv_city = iv_city.
  ENDMETHOD.

  METHOD lif_partner~get_partner_attributes.
    rv_result = |Airline: { mv_name }, Contact: { mv_contact_person }, City: { mv_city }|.
  ENDMETHOD.

ENDCLASS.


CLASS lcl_car_rental IMPLEMENTATION.


METHOD get_information.


ENDMETHOD.


METHOD lif_partner~get_partner_attributes.
    rv_result = |Car Rental: { mv_name }, Contact: { mv_contact_person }, HGV: { mv_has_hgv }|.

ENDMETHOD.


  METHOD constructor.

    mv_name = iv_name.
    mv_contact_person = iv_contact_person.
    mv_has_hgv = iv_has_hgv.

  ENDMETHOD.

ENDCLASS.
