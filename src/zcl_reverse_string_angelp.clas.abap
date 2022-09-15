CLASS zcl_reverse_string_angelp DEFINITION PUBLIC.
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
    METHODS reverse_string
      IMPORTING
        input         TYPE string
      RETURNING
        VALUE(result) TYPE string.
ENDCLASS.

CLASS zcl_reverse_string_angelp IMPLEMENTATION.


  METHOD reverse_string.
    " Please complete the implementation of the reverse_string method

    result = reverse( input ).
  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.
    out->write( reverse( sy-abcde ) ).
  ENDMETHOD.

ENDCLASS.
