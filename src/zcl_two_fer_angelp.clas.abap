CLASS zcl_two_fer_angelp DEFINITION PUBLIC.
  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
    METHODS two_fer
      IMPORTING
        input         TYPE string OPTIONAL
      RETURNING
        VALUE(result) TYPE string.
ENDCLASS.


CLASS zcl_two_fer_angelp IMPLEMENTATION.
  METHOD two_fer.
* add solution here
    result = COND #( when input is initial
                     then |One for you, one for me.|
                     else |One for { input }, one for me.| ).
  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.
    out->write( two_fer( CONV string( sy-uname ) ) ).
    out->write( two_fer(  ) ).
  ENDMETHOD.

ENDCLASS.
