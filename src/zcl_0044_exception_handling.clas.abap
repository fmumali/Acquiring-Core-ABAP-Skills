CLASS zcl_0044_exception_handling DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_0044_exception_handling IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


*** Data Objects with Built-in Types
***********************************************************************
*
*    " comment/uncomment the following declarations and check the output
*    DATA variable1 TYPE string.
*    DATA variable2 TYPE i.
*    DATA variable3 TYPE d.
*    DATA variable4 TYPE c LENGTH 10.
*    DATA variable5 TYPE n LENGTH 10.
*    DATA variable6 TYPE p LENGTH 8 DECIMALS 2.
*

*
*    out->write(  'Result with Initial Value)' ).
*    out->write(   variable1 ).
*    out->write(  '---------' ).
*
*    variable = '19891109'.
*
*    out->write(  'Result with Value 19891109' ).
*    out->write(   variable ).
*    out->write(  '---------' ).

*CONSTANTS: my_const1 type i value 12345,
*           my_const2 type string value `Hello World`,
*           my_const3 type c LENGTH 3 value is INITIAL.
*
*           out->write( my_const2 ).



*** 1: Local Types
***********************************************************************
*
** Comment/Uncomment the following lines to change the type of my_var
*    TYPES my_type TYPE p LENGTH 3 DECIMALS 2.
*    TYPES my_type TYPE i .
*    TYPES my_type TYPE string.
*    TYPES my_type TYPE n length 10.
*
** Variable based on local type
*    DATA my_variable TYPE my_type.
*
*    out->write(  `my_variable (TYPE MY_TYPE)` ).
*    out->write(   my_variable ).
*
*** 2: Global Types
***********************************************************************
*
** Variable based on global type .
*    " Place cursor on variable and press F2 or F3
*    DATA airport TYPE /dmo/airport_id VALUE 'FRA'.
*
*    out->write(  `airport (TYPE /DMO/AIRPORT_ID )` ).
*    out->write(   airport ).
*
*** 3: Constants
***********************************************************************
*
*    CONSTANTS c_text   TYPE string VALUE `Hello World`.
*    CONSTANTS c_number TYPE i      VALUE 12345.
*
*    "Uncomment this line to see syntax error ( VALUE is mandatory)
**  constants c_text2   type string.
*
*    out->write(  `c_text (TYPE STRING)` ).
*    out->write(   c_text ).
*    out->write(  '---------' ).
*
*    out->write(  `c_number (TYPE I )` ).
*    out->write(   c_number ).
*    out->write(  `---------` ).
*
*** 4: Literals
***********************************************************************
*
*    out->write(  '12345               ' ).    "Text Literal   (Type C)
*    out->write(  `12345               ` ).    "String Literal (Type STRING)
*    out->write(  12345                  ).    "Number Literal (Type I)
*
*    "uncomment this line to see syntax error (no number literal with digits)
*    out->write(  12345.67                  ).

*** 5. Resetting variables
***********************************************************************

*DATA my_var1 type i.
*DATA my_var2 type i value 1234.
*DATA my_var3 type string.
*
*my_var1 = my_var2.
*my_var3 = `Hello world.`.


*out->write( my_var1 ).
*out->write( my_var3 ).

*clear my_var1.
*clear my_var2.
*clear my_var3.

***6. Arithmetic Calculations
***********************************************************************


    " comment/uncomment these line for different result types
*    TYPES t_result TYPE p LENGTH 8 DECIMALS 2.
*    TYPES t_result TYPE p LENGTH 8 DECIMALS 0.
    TYPES t_result TYPE i.
    DATA result TYPE t_result.

    " comment/uncomment these lines for different calculations

*    result = 2 + 3.
*    result = 2 - 3.
*    result = 2 * 3.
*    result = 2 / 3.
*
*    result = sqrt( 2 ).
*    result = ipow( base = 2 exp = 3 ).
*
*    result = ( 8 * 7 - 6 ) / ( 5 + 4 ).
*    result = 8 * 7 - 6 / 5 + 4.

*    out->write( result ).

***String Processing
**********************************************************************

** Declarations

    TYPES t_amount TYPE  p LENGTH 8 DECIMALS 2.

    DATA amount   TYPE t_amount VALUE '3.30'.
    DATA amount1  TYPE t_amount VALUE '1.20'.
    DATA amount2  TYPE t_amount VALUE '2.10'.

    DATA the_date  TYPE d                     VALUE '19891109'.
    DATA my_number TYPE p LENGTH 3 DECIMALS 2 VALUE '-273.15'.

    DATA part1 TYPE string VALUE `Hello`.
    DATA part2 TYPE string VALUE `World`.

** String Templates


    " comment/uncomment the following lines for different examples
    DATA(text1) = |Hello World|.
    DATA(text2) = |Total: { amount } EUR|.
    DATA(text3) = |Total: { amount1 + amount2 } EUR|.

    out->write( text1 ).
    out->write( text2 ).
    out->write( text3 ).

** Format Options

    "Date
    DATA(date1) = |Raw Date: { the_date             }|.
    DATA(date2) = |ISO Date: { the_date Date = ISO  }|.
    DATA(date3) = |USER Date:{ the_date Date = USER }|.

    out->write( date1 ).
    out->write( date2 ).
    out->write( date3 ).

    "Number
    DATA(number1) = |Raw Number { my_number                    }|.
    DATA(number2) = |User Format{ my_number NUMBER = USER      }|.
    DATA(number3) = |Sign Right { my_number SIGN = RIGHT      }|.
    DATA(number4) = |Scientific { my_number STYLE = SCIENTIFIC }|.

    out->write( number1 ).
    out->write( number2 ).
    out->write( number3 ).
    out->write( number4 ).

** String expression (concatenation Operator)


    DATA(text4) = part1 && part2.
    DATA(text5) = part1 && | | && part2.
    DATA(text6) = |{ amount1 } + { amount2 }| &&
                 | = | &&
                 |{ amount1 + amount2 }|.


    out->write( text4 ).
    out->write( text5 ).
    out->write( text6 ).



*** Simple Internal Tables
**********************************************************************

    " Internal tables
    DATA numbers TYPE TABLE OF i.

    "Table type (local)
    TYPES tt_strings TYPE TABLE OF string.
    DATA texts1      TYPE tt_strings.

    " Table type (global)
    DATA texts2 TYPE string_table.

    " work areas
    DATA number TYPE i VALUE 1234.
    DATA text TYPE string.

* Example 1: APPEND

    APPEND 4711       TO numbers.
    APPEND number     TO numbers.
    APPEND 2 * number TO numbers.

    out->write(  `-----------------` ).
    out->write(  `Example 1: APPEND` ).
    out->write(  `-----------------` ).

    out->write( numbers ).

* Example 2: CLEAR

    CLEAR numbers.

    out->write(  `----------------` ).
    out->write(  `Example 2: CLEAR` ).
    out->write(  `----------------` ).

    out->write( numbers ).

* Example 3: table expression

    APPEND 4711       TO numbers.
    APPEND number     TO numbers.
    APPEND 2 * number TO numbers.

    out->write(  `---------------------------` ).
    out->write(  `Example 3: Table Expression` ).
    out->write(  `---------------------------` ).

    number = numbers[ 2 ] .

    out->write( |Content of row 2: { number }|    ).
    "Direct use of expression in string template
    out->write( |Content of row 1: { numbers[ 1 ]  }| ).

* Example 4: LOOP ... ENDLOOP

    out->write(  `---------------------------` ).
    out->write(  `Example 4: LOOP ... ENDLOOP` ).
    out->write(  `---------------------------` ).

    LOOP AT numbers INTO number.

      out->write( |Row: { sy-tabix } Content { number }| ).

    ENDLOOP.

* Example 5: Inline declaration in LOOP ... ENDLOOP
*
    out->write(  `-----------------------------` ).
    out->write(  `Example 5: Inline Declaration` ).
    out->write(  `-----------------------------` ).

    LOOP AT numbers INTO DATA(number_inline).
      out->write( |Row: { sy-tabix } Content { number_inline }| ).
    ENDLOOP.



*** Conditional Branching
**********************************************************************

    CONSTANTS c_number TYPE i VALUE 0.
*    CONSTANTS c_number TYPE i VALUE 1.
*    CONSTANTS c_number TYPE i VALUE 2.
*    CONSTANTS c_number TYPE i VALUE -1.
*    CONSTANTS c_number TYPE i VALUE -2.

* Example 1: Simple IF ... ENDIF.

    out->write(  `--------------------------------` ).
    out->write(  `Example 1: Simple IF ... ENDIF.` ).
    out->write(  `-------------------------------` ).

    IF c_number = 0.
      out->write( `The value of C_NUMBER equals zero`   ).
    ELSE.
      out->write( `The value of C_NUMBER is NOT zero`   ).
    ENDIF.

* Example 2: Optional Branches ELSEIF and ELSE


    out->write(  `--------------------------------------------` ).
    out->write(  `Example 2: Optional Branches ELSEIF and ELSE` ).
    out->write(  `--------------------------------------------` ).

    IF c_number = 0.
      out->write( `The value of C_NUMBER equals zero`            ).
    ELSEIF c_number > 0.
      out->write( `The value of C_NUMBER is greater than zero`   ).
    ELSE.
      out->write( `The value of C_NUMBER is less than zero`      ).
    ENDIF.

* Example 3: CASE ... ENDCASE

    out->write(  `---------------------------` ).
    out->write(  `Example 3: CASE ... ENDCASE` ).
    out->write(  `---------------------------` ).

    CASE c_number.
      WHEN 0.
        out->write( `The value of C_NUMBER equals zero`             ).
      WHEN 1.
        out->write( `The value of C_NUMBER equals one`              ).
      WHEN 2.
        out->write( `The value of C_NUMBER equals two`              ).
      WHEN OTHERS.
        out->write( `The value of C_NUMBER equals non of the above` ).
    ENDCASE.



*** Exception Handling
**********************************************************************
    DATA results TYPE i.

    DATA nums TYPE TABLE OF i.

* Preparation

    APPEND 123 TO numbers.

* Example 1: Conversion Error (no Number)


    CONSTANTS c_text TYPE string VALUE 'ABC'.
*    CONSTANTS c_text TYPE string VALUE '123'.

    out->write(  `---------------------------` ).
    out->write(  `Example 1: Conversion Error` ).
    out->write(  `---------------------------` ).

    TRY.
        result = c_text.
        out->write( |Converted content is { result }|  ).
      CATCH cx_sy_conversion_no_number.
        out->write( |Error: { c_text } is not a number!| ).
    ENDTRY.

* Example 2: Division by Zero


    CONSTANTS c_nums TYPE i VALUE 0.
*    CONSTANTS c_nums TYPE i VALUE 7.

    out->write(  `---------------------------` ).
    out->write(  `Example 2: Division by Zero` ).
    out->write(  `---------------------------` ).

    TRY.
        result = 100 / c_number.
        out->write( |100 divided by { c_number } equals { result }| ).
      CATCH cx_sy_zerodivide.
        out->write(  `Error: Division by zero is not defined!` ).
    ENDTRY.

* Example 3: Itab Error (Line Not Found)

    CONSTANTS c_index TYPE i VALUE 2.
*    CONSTANTS c_index TYPE i VALUE 1.

    out->write(  `-------------------------` ).
    out->write(  `Example 3: Line Not Found` ).
    out->write(  `-------------------------` ).

    TRY.
        result = numbers[ c_index ].
        out->write( |Content of row { c_index } equals { result }| ).
      CATCH cx_sy_itab_line_not_found.
        out->write(  `Error: Itab has less than { c_index } rows!` ).
    ENDTRY.


* Example 4: Combination of Different Exceptions
**********************************************************************
*    CONSTANTS c_char TYPE c LENGTH 1 VALUE 'X'.
*    CONSTANTS c_char TYPE c length 1 value '0'.
    CONSTANTS c_char TYPE c LENGTH 1 VALUE '1'.
*    CONSTANTS c_char TYPE c length 1 value '2'.

    out->write(  `----------------------` ).
    out->write(  `Example 4: Combination` ).
    out->write(  `----------------------` ).

    TRY.
        result = numbers[ 2 / c_char ].
        out->write( |Result: { result } | ).
      CATCH cx_sy_zerodivide.
        out->write( `Error: Division by zero is not defined`  ).
      CATCH cx_sy_conversion_no_number.
        out->write( |Error: { c_char } is not a number! | ).
      CATCH cx_sy_itab_line_not_found.
        out->write( |Error: Itab contains less than { 2 / c_char } rows| ).
    ENDTRY.




  ENDMETHOD.

ENDCLASS.
