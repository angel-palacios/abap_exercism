CLASS zcl_itab_combination_angelp DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    TYPES: BEGIN OF alphatab_type,
             cola TYPE string,
             colb TYPE string,
             colc TYPE string,
           END OF alphatab_type.
    TYPES alphas TYPE STANDARD TABLE OF alphatab_type.

    TYPES: BEGIN OF numtab_type,
             col1 TYPE string,
             col2 TYPE string,
             col3 TYPE string,
           END OF numtab_type.
    TYPES nums TYPE STANDARD TABLE OF numtab_type.

    TYPES: BEGIN OF combined_data_type,
             colx TYPE string,
             coly TYPE string,
             colz TYPE string,
           END OF combined_data_type.
    TYPES combined_data TYPE STANDARD TABLE OF combined_data_type WITH EMPTY KEY.

    METHODS perform_combination
      IMPORTING
        alphas               TYPE alphas
        nums                 TYPE nums
      RETURNING
        VALUE(combined_data) TYPE combined_data.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.

CLASS zcl_itab_combination_angelp IMPLEMENTATION.

  METHOD perform_combination.
*    DO lines( alphas ) TIMES.
*      APPEND INITIAL LINE TO combined_data ASSIGNING FIELD-SYMBOL(<combined>).
*      DATA(alpha) = value #( alphas[ sy-index ] OPTIONAL ).
*      DATA(num) = value #( nums[ sy-index ] OPTIONAL ).
*      <combined>-colx = alpha-cola && num-col1.
*      <combined>-coly = alpha-colb && num-col2.
*      <combined>-colz = alpha-colc && num-col2.
*    ENDDO.
*
*    LOOP AT alphas ASSIGNING FIELD-SYMBOL(<alpha>).
*      APPEND INITIAL LINE TO combined_data ASSIGNING FIELD-SYMBOL(<combined>).
*      DATA(num) = VALUE #( nums[ sy-tabix ] OPTIONAL ).
*      <combined>-colx = <alpha>-cola && num-col1.
*      <combined>-coly = <alpha>-colb && num-col2.
*      <combined>-colz = <alpha>-colc && num-col2.
*    ENDLOOP.

   combined_data = value #( FOR alpha IN alphas INDEX INTO index
                            FOR num   IN nums from index to index
                            ( colx = alpha-cola && num-col1
                              coly = alpha-colb && num-col2
                              colz = alpha-colc && num-col3 )
                           ).

  ENDMETHOD.
  METHOD if_oo_adt_classrun~main.
    DATA alphas TYPE alphas.
    DATA nums TYPE nums.
    alphas = VALUE #(
                        ( cola = 'A' colb = 'B' colc = 'C' )
                        ( cola = 'D' colb = 'E' colc = 'F' )
                        ( cola = 'G' colb = 'H' colc = 'I' )
                       ).
    nums = VALUE #(
                     ( col1 = '1' col2 = '2' col3 = '3' )
                     ( col1 = '4' col2 = '5' col3 = '6' )
                     ( col1 = '7' col2 = '8' col3 = '9' )
                    ).
    out->write( perform_combination( alphas = alphas nums = nums ) ).
  ENDMETHOD.

ENDCLASS.
