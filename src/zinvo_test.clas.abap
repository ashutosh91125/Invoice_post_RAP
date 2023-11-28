CLASS zinvo_test DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zinvo_test IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DELETE from zsupplier_invo where supplierinvoice = '5105600756'.
  ENDMETHOD.

ENDCLASS.
