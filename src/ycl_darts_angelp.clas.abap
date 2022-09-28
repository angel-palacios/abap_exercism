CLASS ycl_darts_angelp DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
    METHODS score
      IMPORTING
        x             TYPE f
        y             TYPE f
      RETURNING
        VALUE(result) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ycl_darts_angelp IMPLEMENTATION.
  METHOD score.
    " add solution here
    DATA(radius) = sqrt( ( x ** 2 ) + ( y ** 2 ) ).

    result = COND #( WHEN radius GT 10 THEN 0
                     WHEN radius GT 5  THEN 1
                     WHEN radius GT 1  THEN 5
                     ELSE 10 ).
  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.
    out->write( score( x = -9 y = 9 ) ).
    out->write( score( x = 0 y = 10 ) ).
    out->write( score( x = -5 y = 0 ) ).
    out->write( score( x = 0 y = -1 ) ).
    out->write( score( x = 0 y = 0 ) ).
    out->write( score( x = -9 y = 9 ) ).
    out->write( score( x = '-7.0' y = '7.0' ) ).
  ENDMETHOD.

ENDCLASS.
