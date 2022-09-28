CLASS ycl_prime_factors_angelp DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
    TYPES integertab TYPE STANDARD TABLE OF i WITH EMPTY KEY.
    METHODS factors
      IMPORTING
        input         TYPE int8
      RETURNING
        VALUE(result) TYPE integertab.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ycl_prime_factors_angelp IMPLEMENTATION.
  METHOD factors.
    " add solution here
    DATA(number) = input.
    DATA(factor) = 2.
    WHILE number NE 1.
      IF number MOD factor EQ 0.
        number = number / factor.
        INSERT factor INTO TABLE result.
        CONTINUE.
      ENDIF.
      factor = factor + 1.
    ENDWHILE.
  ENDMETHOD.
  METHOD if_oo_adt_classrun~main.
    out->write( factors( 60 ) ).
  ENDMETHOD.

ENDCLASS.
