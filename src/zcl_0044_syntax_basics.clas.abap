CLASS zcl_0044_syntax_basics DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_0044_syntax_basics IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: name TYPE c LENGTH 10,
          text TYPE string.
    CONCATENATE 'Hello'
                 name
             INTO text.

text = `Hello`.
text = name.

text = replace(  val  = `Hello World`
                 sub  = `world`
                 with = name ).

text = COND #(  WHEN text = `` THEN `Hello` && name
                ELSE text ).

    out->write( text ).
  ENDMETHOD.
ENDCLASS.
