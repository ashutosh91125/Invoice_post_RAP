CLASS zinvo_api_call DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zinvo_api_call IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    TRY.
        DATA(http_client) = cl_web_http_client_manager=>create_by_http_destination( i_destination =
        cl_http_destination_provider=>create_by_url( i_url =
      'http://71.251.192.136:8011/sap/opu/odata/SAP/API_SUPPLIERINVOICE_PROCESS_SRV/A_SupplierInvoice' ) ).

      CATCH cx_web_http_client_error cx_http_dest_provider_error.
        "handle exception
    ENDTRY.

    http_client->get_http_request( )->set_authorization_basic(
        i_username = 'hpratap'
        i_password = 'Programming@1234'

     ).

    DATA(lv_payload) =

    ` {` &&
    `  "d" : { ` &&
     `   "CompanyCode" : "1010",  ` &&
      `  "DocumentDate" : "2022-04-08T00:00", ` &&
       ` "PostingDate" : "2022-04-08T00:00", ` &&
       ` "SupplierInvoiceIDByInvcgParty" : "Test", ` &&
       ` "InvoicingParty" : "10300003", ` &&
       ` "DocumentCurrency" : "EUR", ` &&
       ` "InvoiceGrossAmount" : "100.00", ` &&
       ` "DueCalculationBaseDate" : "2022-04-08T00:00",  ` &&
       ` "TaxIsCalculatedAutomatically" : true,  ` &&
       ` "TaxDeterminationDate" : "2022-04-08T00:00", ` &&
       ` "to_SuplrInvcItemPurOrdRef" : { ` &&
       `   "results" : [ ` &&
       `    { "SupplierInvoiceItem" : "00001", ` &&
       `       "PurchaseOrder" : "4500020375", ` &&
       `      "PurchaseOrderItem" : "00010", ` &&
       `      "DocumentCurrency" : "EUR", ` &&
       `      "QuantityInPurchaseOrderUnit" : "100.00", ` &&
       `      "PurchaseOrderQuantityUnit" : "PC", ` &&
       `      "SupplierInvoiceItemAmount" : "100.00", ` &&
       `      "TaxCode" : "V0", ` &&
       `      "to_SupplierInvoiceItmAcctAssgmt" : { ` &&
       `        "results" : [ ` &&
       `          { "SupplierInvoiceItem" : "00001", ` &&
       `            "DocumentCurrency" : "EUR", ` &&
       `            "Quantity" : "20.00", ` &&
       `            "PurchaseOrderQuantityUnit" : "PC", ` &&
       `            "SuplrInvcAcctAssignmentAmount" : "20.00", ` &&
       `            "TaxCode" : "V0", ` &&
       `            "GLAccount" : "0065008400", ` &&
       `            "CostCenter" : "123009", ` &&
       `             "AccountAssignmentNumber" : "01" }, ` &&
       `          { "SupplierInvoiceItem" : "00001", ` &&
       `           "DocumentCurrency" : "EUR", ` &&
       `            "Quantity" : "80.00", ` &&
       `            "PurchaseOrderQuantityUnit" : "PC", ` &&
       `            "SuplrInvcAcctAssignmentAmount" : "80.00", ` &&
       `            "TaxCode" : "V0", ` &&
       `            "GLAccount" : "0065008400", ` &&
       `            "CostCenter" :  "MTCC159", ` &&
       `            "AccountAssignmentNumber" : "02" } ` &&
       `        ] ` &&
       `       } ` &&
       `   } ` &&
       `  ] ` &&
       `} ` &&
       `} ` &&
      `} `.




    http_client->get_http_request(
          RECEIVING
            r_http_request = DATA(lo_request) ).

    lo_request->set_header_field(

  EXPORTING

    i_name  =  'X-CSRF-Token'                " Name of the header field

    i_value =  'Fetch'   ).

    TRY.
        http_client->execute(
          EXPORTING
            i_method   = if_web_http_client=>get
          RECEIVING
            r_response = DATA(lo_response) ).
      CATCH cx_web_http_client_error.

    ENDTRY.

    DATA(lv_token)    = lo_response->get_header_field('X-CSRF-Token').


*    http_client->get_http_request(
*     RECEIVING
*       r_http_request = DATA(lo_request_post) ).
*
    lo_request->set_header_field(

  EXPORTING

    i_name  = 'X-CSRF-Token'                " Name of the header field

    i_value =    lv_token  ).

    lo_request->set_header_field(
    EXPORTING
    i_name  = 'Content-Type'
    i_value = 'application/json'
    ).

    TRY.
        lo_request->set_text(
          EXPORTING
            i_text   = lv_payload ).
      CATCH cx_web_message_error.
    ENDTRY.

    TRY.
        http_client->execute(
          EXPORTING
            i_method   = if_web_http_client=>post
          RECEIVING
            r_response = lo_response ).
      CATCH cx_web_http_client_error.

    ENDTRY.

    TRY.
        lo_response->get_status(
        RECEIVING
          r_value = DATA(lo_resp_status) ).
      CATCH cx_web_message_error.
    ENDTRY.

    TRY.
        lo_response->get_text(
          RECEIVING
            r_value = DATA(lv_response) ).
      CATCH cx_web_message_error.

    ENDTRY.

    data(header_fields) = lo_response->get_header_fields(  ).


    out->write( 'API Called' ).


  ENDMETHOD.
ENDCLASS.
