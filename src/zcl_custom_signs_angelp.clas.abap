CLASS zcl_custom_signs_angelp DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    "! Build a sign that includes both of the parameters.
    METHODS build_sign IMPORTING occasion      TYPE string
                                 name          TYPE string
                       RETURNING VALUE(result) TYPE string.

    "! Build a birthday sign that conditionally formats the return string.
    METHODS build_birthday_sign IMPORTING age           TYPE i
                                RETURNING VALUE(result) TYPE string.

    "! Build a graduation sign that includes multiple lines
    METHODS graduation_for IMPORTING name          TYPE string
                                     year          TYPE i
                           RETURNING VALUE(result) TYPE string.

    "! Determine cost based on each character of sign parameter that builds
    "! the template string that includes the currency parameter.
    METHODS cost_of IMPORTING sign          TYPE string
                              currency      TYPE string
                    RETURNING VALUE(result) TYPE string.

ENDCLASS.


CLASS zcl_custom_signs_angelp IMPLEMENTATION.

  METHOD build_sign.
    "Implement solution here
    result = |Happy { occasion } { name }!|.
  ENDMETHOD.


  METHOD build_birthday_sign.
    "Implement solution here
    result = COND #( WHEN age LT 50
                     THEN |Happy Birthday! What a young fellow you are.|
                     ELSE |Happy Birthday! What a mature fellow you are.| ).
  ENDMETHOD.


  METHOD graduation_for.
    "Implement solution here
    result = |Congratulations { name }!\nClass of { year }|.
  ENDMETHOD.


  METHOD cost_of.
    "Implement solution here
    DATA(cost) = 20 + ( strlen( sign ) * 2 ).
    result = |Your sign costs { cost DECIMALS = 2 } { currency }.|.
  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.
    out->write( build_sign( occasion = 'Birthday' name = 'Angel' ) ).
    out->write( build_birthday_sign( 49 ) ).
    out->write( build_birthday_sign( 50 ) ).
    out->write( build_birthday_sign( 51 ) ).
    out->write( graduation_for( name = 'Angel' year = 2007 ) ).
    out->write( cost_of( sign = 'Happy Birthday!' currency = 'MXN' ) ).
  ENDMETHOD.

ENDCLASS.
