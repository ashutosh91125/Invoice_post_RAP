CLASS zinvo_cls_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zinvo_cls_01 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    "DATA update_tab TYPE TABLE FOR CREATE zinvo_supplier_i.
DELETE from zsupplier_invo.
  INSERT  zsupplier_invo  FROM TABLE @( VALUE #(
  ( SUPPLIERINVOICE   = '5105600751'
FISCALYEAR = '2022'
COMPANYCODE = 'RO12'
DOCUMENTDATE    = '20220817'
POSTINGDATE = '20220819'
SUPPLIERINVOICEIDBYINVCGPARTY   = 'SH12/2022'
INVOICINGPARTY = '3000001001'
DOCUMENTCURRENCY = 'INR'
INVOICEGROSSAMOUNT = '7198.00' )
(
SUPPLIERINVOICE   = '5105600752'
FISCALYEAR = '2021'
COMPANYCODE = 'RO12'
DOCUMENTDATE    = '20220817'
POSTINGDATE = '20220819'
SUPPLIERINVOICEIDBYINVCGPARTY   = 'SH12/2022'
INVOICINGPARTY = '3000001001'
DOCUMENTCURRENCY = 'INR'
INVOICEGROSSAMOUNT = '7198.00' )

(
SUPPLIERINVOICE   = '5105600753'
FISCALYEAR = '2020'
COMPANYCODE = 'RO12'
DOCUMENTDATE    = '20220819'
POSTINGDATE = '20220819'
SUPPLIERINVOICEIDBYINVCGPARTY   = 'SH12/2022'
INVOICINGPARTY = '3000001001'
DOCUMENTCURRENCY = 'INR'
INVOICEGROSSAMOUNT = '7198.00' )

(
SUPPLIERINVOICE   = '5105600754'
FISCALYEAR = '2019'
COMPANYCODE = 'RO12'
DOCUMENTDATE    = '20220819'
POSTINGDATE = '20220819'
SUPPLIERINVOICEIDBYINVCGPARTY   = 'SH12/2022'
INVOICINGPARTY = '3000001001'
DOCUMENTCURRENCY = 'INR'
INVOICEGROSSAMOUNT = '7198.00' )

(
SUPPLIERINVOICE   = '5105600755'
FISCALYEAR = '2018'
COMPANYCODE = 'RO12'
DOCUMENTDATE    = '20220819'
POSTINGDATE = '20220819'
SUPPLIERINVOICEIDBYINVCGPARTY   = 'SH12/2022'
INVOICINGPARTY = '3000001001'
DOCUMENTCURRENCY = 'INR'
INVOICEGROSSAMOUNT = '7198.00')

(
SUPPLIERINVOICE   = '5105600756'
FISCALYEAR = '2017'
COMPANYCODE = 'RO12'
DOCUMENTDATE    = '20220819'
POSTINGDATE = '20220820'
SUPPLIERINVOICEIDBYINVCGPARTY   = 'SH12/2022'
INVOICINGPARTY = '3000001001'
DOCUMENTCURRENCY = 'INR'
INVOICEGROSSAMOUNT = '7198.00')
                        ) ).
  SELECT * FROM zsupplier_invo INTO TABLE @DATA(lt_sql_entries).
    out->write( ' Run Successful' ).

  ENDMETHOD.

ENDCLASS.