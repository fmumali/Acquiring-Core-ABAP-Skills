CLASS zcl_0044_local_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_0044_local_class IMPLEMENTATION.



  METHOD if_oo_adt_classrun~main.


  DATA: connection  TYPE REF TO lcl_connection.

        connection->set_attributes(
            EXPORTING
            i_carrier_id = 'LH'
            i_connection_id = '0400' ).


  ENDMETHOD.

ENDCLASS.
