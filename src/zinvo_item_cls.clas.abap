CLASS zinvo_item_cls DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zinvo_item_cls IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    "DATA update_tab TYPE TABLE FOR CREATE zinvo_supplier_i.
DELETE from zinvo_item.
  INSERT  zinvo_item  FROM TABLE @( VALUE #(
  (
  SUPPLIERINVOICE = '5105600751'
  FISCALYEAR = '2022'
SUPPLIERINVOICEITEM = '000001'
PURCHASEORDER   = '4300001005'
PURCHASEORDERITEM = '00010'
PLANT   = 'RO1A'
REFERENCEDOCUMENT = '5000000086'
REFERENCEDOCUMENTFISCALYEAR = '2022'
REFERENCEDOCUMENTITEM = '0001' )

(
  SUPPLIERINVOICE = '5105600752'
  FISCALYEAR = '2021'
SUPPLIERINVOICEITEM = '000002'
PURCHASEORDER   = '4300001005'
PURCHASEORDERITEM = '00010'
PLANT   = 'RO1A'
REFERENCEDOCUMENT = '5000000086'
REFERENCEDOCUMENTFISCALYEAR = '2022'
REFERENCEDOCUMENTITEM = '0001' )

(
  SUPPLIERINVOICE = '5105600753'
  FISCALYEAR = '2020'
SUPPLIERINVOICEITEM = '000003'
PURCHASEORDER   = '4300001005'
PURCHASEORDERITEM = '00010'
PLANT   = 'RO1A'
REFERENCEDOCUMENT = '5000000086'
REFERENCEDOCUMENTFISCALYEAR = '2022'
REFERENCEDOCUMENTITEM = '0001' )

(
  SUPPLIERINVOICE = '5105600754'
  FISCALYEAR = '2019'
SUPPLIERINVOICEITEM = '000004'
PURCHASEORDER   = '4300001005'
PURCHASEORDERITEM = '00010'
PLANT   = 'RO1A'
REFERENCEDOCUMENT = '5000000086'
REFERENCEDOCUMENTFISCALYEAR = '2022'
REFERENCEDOCUMENTITEM = '0001' )

(
  SUPPLIERINVOICE = '5105600755'
  FISCALYEAR = '2018'
SUPPLIERINVOICEITEM = '000005'
PURCHASEORDER   = '4300001005'
PURCHASEORDERITEM = '00010'
PLANT   = 'RO1A'
REFERENCEDOCUMENT = '5000000086'
REFERENCEDOCUMENTFISCALYEAR = '2022'
REFERENCEDOCUMENTITEM = '0001' )
                        ) ).
  SELECT * FROM zinvo_item INTO TABLE @DATA(lt_sql_entries).
    out->write( ' Run Successful' ).

  ENDMETHOD.

ENDCLASS.
