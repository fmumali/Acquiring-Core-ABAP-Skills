*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

CLASS lcl_connection DEFINITION.

  PUBLIC SECTION.


    DATA carrier_id    TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.

    CLASS-DATA conn_counter TYPE i.

    METHODS set_attributes
        IMPORTING
         i_carrier_id type /dmo/carrier_id OPTIONAL
         i_connection_id type /dmo/connection_id.

    METHODS get_attributes
        EXPORTING
            et_carrier_id type /dmo/carrier_id
            et_connection_id type /dmo/connection_id.



  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_connection IMPLEMENTATION.

  METHOD get_attributes.

  ENDMETHOD.

  METHOD set_attributes.

  ENDMETHOD.

ENDCLASS.
