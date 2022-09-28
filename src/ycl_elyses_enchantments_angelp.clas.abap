CLASS ycl_elyses_enchantments_angelp DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
    TYPES ty_stack TYPE STANDARD TABLE OF i WITH EMPTY KEY.

    "! Get card at position
    METHODS get_item
      IMPORTING stack         TYPE ty_stack
                position      TYPE i
      RETURNING VALUE(result) TYPE i.

    "! Replace card at position
    METHODS set_item
      IMPORTING stack         TYPE ty_stack
                position      TYPE i
                replacement   TYPE i
      RETURNING VALUE(result) TYPE ty_stack.

    "Add card to stack
    METHODS insert_item_at_top
      IMPORTING stack         TYPE ty_stack
                new_card      TYPE i
      RETURNING VALUE(result) TYPE ty_stack.

    "! Remove card at position
    METHODS remove_item
      IMPORTING stack         TYPE ty_stack
                position      TYPE i
      RETURNING VALUE(result) TYPE ty_stack.

    "! Remove top card (last row)
    METHODS remove_item_from_top
      IMPORTING stack         TYPE ty_stack
      RETURNING VALUE(result) TYPE ty_stack.

    "! Add card to bottom of stack (first row)
    METHODS insert_item_at_bottom
      IMPORTING stack         TYPE ty_stack
                new_card      TYPE i
      RETURNING VALUE(result) TYPE ty_stack.

    "! Remove bottom card (delete first row)
    METHODS remove_item_from_bottom
      IMPORTING stack         TYPE ty_stack
      RETURNING VALUE(result) TYPE ty_stack.

    "! Count cards
    METHODS get_size_of_stack
      IMPORTING stack         TYPE ty_stack
      RETURNING VALUE(result) TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ycl_elyses_enchantments_angelp IMPLEMENTATION.

  METHOD get_item.
    "Implement solution here
    result = VALUE #( stack[ position ] OPTIONAL ).
  ENDMETHOD.


  METHOD set_item.
    "Implement solution here
    result = stack.
    READ TABLE result INDEX position ASSIGNING FIELD-SYMBOL(<stack>).
    IF sy-subrc EQ 0.
      <stack> = replacement.
    ENDIF.
  ENDMETHOD.


  METHOD insert_item_at_top.
    "Implement solution here
    result = stack.
    APPEND new_card TO result.
  ENDMETHOD.


  METHOD get_size_of_stack.
    "Implement solution here
    result = lines( stack ).
  ENDMETHOD.


  METHOD insert_item_at_bottom.
    "Implement solution here
    APPEND new_card to result.
    APPEND LINES OF stack TO result.
  ENDMETHOD.


  METHOD remove_item.
    "Implement solution here
    result = stack.
    DELETE result INDEX position.
  ENDMETHOD.


  METHOD remove_item_from_bottom.
    "Implement solution here
    result = stack.
    DELETE result INDEX 1.
  ENDMETHOD.


  METHOD remove_item_from_top.
    "Implement solution here
    result = stack.
    DELETE result INDEX lines( stack ).
  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.
    out->write( get_item( stack = VALUE #( ( 1 ) ( 2 ) ( 3 ) ) position = 1 ) ).
    out->write( set_item( stack = VALUE #( ( 1 ) ( 2 ) ( 3 ) ) position = 1  replacement = 4 ) ).
    out->write( insert_item_at_top( stack = VALUE #( ( 1 ) ( 2 ) ( 3 ) ) new_card = 5 ) ).
    out->write( get_size_of_stack( stack = VALUE #( ( 1 ) ( 2 ) ( 3 ) ) ) ).
    out->write( insert_item_at_bottom( stack = VALUE #( ( 1 ) ( 2 ) ( 3 ) ) new_card = 5 ) ).
    out->write( remove_item( stack = VALUE #( ( 1 ) ( 2 ) ( 3 ) ) position = 2 ) ).
    out->write( remove_item_from_bottom( stack = VALUE #( ( 1 ) ( 2 ) ( 3 ) ) ) ).

  ENDMETHOD.

ENDCLASS.
