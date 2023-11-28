CLASS zinvo_ass_cls DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zinvo_ass_cls IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    "DATA update_tab TYPE TABLE FOR CREATE zinvo_supplier_i.
DELETE from zinvoice_itm_ass.
  INSERT  zinvoice_itm_ass  FROM TABLE @( VALUE #(
  (
  SUPPLIERINVOICE = '5105600751'
  FISCALYEAR = '2022'
SUPPLIERINVOICEITEM = '000001'
ORDINALNUMBER   = '0001'
COSTCENTER = 'SAJY'
CONTROLLINGAREA   = 'SAJY'
BUSINESSAREA = 'SAJY'
GLACCOUNT = '0000180002'
SALESORDERITEM = '000000' )

(
  SUPPLIERINVOICE = '5105600752'
  FISCALYEAR = '2021'
SUPPLIERINVOICEITEM = '000002'
ORDINALNUMBER   = '0001'
COSTCENTER = 'SAJY'
CONTROLLINGAREA   = 'SAJY'
BUSINESSAREA = 'SAJY'
GLACCOUNT = '0000180002'
SALESORDERITEM = '000000' )

(
  SUPPLIERINVOICE = '5105600753'
  FISCALYEAR = '2020'
SUPPLIERINVOICEITEM = '000003'
ORDINALNUMBER   = '0001'
COSTCENTER = 'SAJY'
CONTROLLINGAREA   = 'SAJY'
BUSINESSAREA = 'SAJY'
GLACCOUNT = '0000180002'
SALESORDERITEM = '000000' )

(
  SUPPLIERINVOICE = '5105600754'
  FISCALYEAR = '2019'
SUPPLIERINVOICEITEM = '000004'
ORDINALNUMBER   = '0001'
COSTCENTER = 'SAJY'
CONTROLLINGAREA   = 'SAJY'
BUSINESSAREA = 'SAJY'
GLACCOUNT = '0000180002'
SALESORDERITEM = '000000' )

(
  SUPPLIERINVOICE = '5105600755'
  FISCALYEAR = '2018'
SUPPLIERINVOICEITEM = '000005'
ORDINALNUMBER   = '0001'
COSTCENTER = 'SAJY'
CONTROLLINGAREA   = 'SAJY'
BUSINESSAREA = 'SAJY'
GLACCOUNT = '0000180002'
SALESORDERITEM = '000000' )
                        ) ).
  SELECT * FROM zinvoice_itm_ass INTO TABLE @DATA(lt_sql_entries).
    out->write( ' Run Successful' ).

  ENDMETHOD.

ENDCLASS.