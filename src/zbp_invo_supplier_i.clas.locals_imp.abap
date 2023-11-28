CLASS lhc_zinvo_supplier_i DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zinvo_supplier_i RESULT result.

    METHODS transferdata FOR MODIFY
      IMPORTING keys FOR ACTION supplier~transferdata RESULT result.


ENDCLASS.

CLASS lhc_zinvo_supplier_i IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD transferData.

    LOOP AT keys INTO DATA(ls_key).

      SELECT * FROM zsupplier_invo WHERE supplierinvoice = @ls_key-Supplierinvoice
                                     AND fiscalyear = @ls_key-Fiscalyear
      INTO TABLE @DATA(lt_invoice_header).

      SELECT * FROM zinvo_item WHERE supplierinvoice = @ls_key-Supplierinvoice
                                     AND fiscalyear = @ls_key-Fiscalyear
      INTO TABLE @DATA(lt_invoice_item).

      SELECT * FROM zinvoice_itm_ass WHERE supplierinvoice = @ls_key-Supplierinvoice
                                     AND fiscalyear = @ls_key-Fiscalyear
      INTO TABLE @DATA(lt_invoice_item_acc).


      DATA lv_payload TYPE string.
      DATA lv_payload_item TYPE string.
      DATA lv_payload_item_acc TYPE string.

      LOOP AT lt_invoice_header INTO DATA(ls_invoice_header).

        IF ls_invoice_header-taxdeterminationdate IS INITIAL.
          DATA(lv_tax_date) = 'null'.
        ELSE.
          lv_tax_date = |{ ls_invoice_header-taxdeterminationdate+0(4) }-{ ls_invoice_header-taxdeterminationdate+4(2) }-{ ls_invoice_header-taxdeterminationdate+6(2) }T00:00:00|.
        ENDIF.

        IF ls_invoice_header-duecalculationbasedate IS INITIAL.
          DATA(lv_due_date) = 'null'.
        ELSE.

          lv_due_date = 'null'.
          "lv_due_date = ls_invoice_header-duecalculationbasedate+0(4) && '-' && ls_invoice_header-duecalculationbasedate+4(2) && '-' && ls_invoice_header-duecalculationbasedate+6(2) && 'T00:00:00'.
          "lv_due_date = |{ ls_invoice_header-duecalculationbasedate+0(4) }-{ ls_invoice_header-duecalculationbasedate+4(2) }-{ ls_invoice_header-duecalculationbasedate+6(2) }T00:00:00|.
        ENDIF.

        CLEAR lv_payload.

        lv_payload =
         `{ ` &&
         `"d" : { ` &&
         `"CompanyCode" : "` && ls_invoice_header-companycode && `",` &&
         `"DocumentDate" : "` && |{ ls_invoice_header-documentdate+0(4) }-{ ls_invoice_header-documentdate+4(2) }-{ ls_invoice_header-documentdate+6(2) }T00:00:00| && `",` &&
         `"PostingDate" : "` && |{ ls_invoice_header-postingdate+0(4) }-{ ls_invoice_header-postingdate+4(2) }-{ ls_invoice_header-postingdate+6(2) }T00:00:00| && `",` &&
         `"SupplierInvoiceIDByInvcgParty" : "` && ls_invoice_header-supplierinvoiceidbyinvcgparty && `",` &&
         `"InvoicingParty" : "` && ls_invoice_header-invoicingparty && `",` &&
         `"DocumentCurrency" : "` && ls_invoice_header-documentcurrency && `",` &&
         `"InvoiceGrossAmount" : "` && ls_invoice_header-invoicegrossamount && `",` &&
         `"DueCalculationBaseDate" : ` && lv_due_date  && `,` &&
         `"TaxIsCalculatedAutomatically" : true,` &&
         `"TaxDeterminationDate" :` && lv_tax_date && `,` &&
         `"SupplierInvoiceStatus" :` && '"A"' && `,` &&
         `"to_SuplrInvcItemPurOrdRef" : {` &&
         `"results" : [`.

        CLEAR lv_payload_item.
        LOOP AT  lt_invoice_item INTO DATA(ls_invoice_item) WHERE supplierinvoice = ls_invoice_header-supplierinvoice AND fiscalyear = ls_invoice_header-fiscalyear.
          IF lv_payload_item IS NOT  INITIAL.
            lv_payload_item = lv_payload_item && ','.
          ENDIF.
          lv_payload_item = lv_payload_item &&

             `{ "SupplierInvoiceItem" : "` && ls_invoice_item-supplierinvoiceitem && `",` &&
             `"PurchaseOrder" : "` && ls_invoice_item-purchaseorder && `",  ` &&
             `"PurchaseOrderItem" : "` && ls_invoice_item-purchaseorderitem && `",   ` &&
             `"DocumentCurrency" : "` && ls_invoice_item-documentcurrency && `",   ` &&
             `"PurchaseOrderQuantityUnit" : "` && ls_invoice_item-purchaseorderquantityunit && `",   ` &&

             `"SupplierInvoiceItemAmount" : "` && ls_invoice_item-supplierinvoiceitemamount && `",` &&
             `"TaxCode" : "` && ls_invoice_item-taxcode && `",` &&
             `"to_SupplierInvoiceItmAcctAssgmt" : {` &&
             `"results" : [`.

          CLEAR lv_payload_item_acc.
          LOOP AT  lt_invoice_item_acc INTO DATA(ls_invoice_item_acc) WHERE supplierinvoice = ls_invoice_item-supplierinvoice
                                                                  AND fiscalyear = ls_invoice_item-fiscalyear
                                                                  AND supplierinvoiceitem = ls_invoice_item-supplierinvoiceitem.
            IF lv_payload_item_acc IS NOT  INITIAL.
              lv_payload_item_acc = lv_payload_item_acc && ','.
            ENDIF.

            lv_payload_item_acc = lv_payload_item_acc &&
               `{ "SupplierInvoiceItem" : "` &&  ls_invoice_item_acc-supplierinvoiceitem && `",` &&
               `  "DocumentCurrency" : "` &&  ls_invoice_item_acc-documentcurrency && `",` &&
               `  "Quantity" : "` &&  ls_invoice_item_acc-quantity && `",` &&
           `           "PurchaseOrderQuantityUnit" : "` &&  ls_invoice_item_acc-purchaseorderquantityunit && `",` &&
           `           "SuplrInvcAcctAssignmentAmount" : "` &&  ls_invoice_item_acc-suplrinvcacctassignmentamount && `",` &&
               `  "TaxCode" : "` && ls_invoice_item_acc-taxcode && `",` &&
           `           "AccountAssignmentNumber" : "` && ls_invoice_item_acc-accountassignmentnumber && `",` &&
           `           "CostCenter" : "` && ls_invoice_item_acc-costcenter && `",` &&
           `           "AccountAssignmentIsUnplanned" : true ` && `,` &&
               ` "GLAccount" : "` && ls_invoice_item_acc-glaccount && `" } ` .

          ENDLOOP.
          lv_payload_item = lv_payload_item && lv_payload_item_acc && '] } }'.

        ENDLOOP.
        lv_payload = lv_payload && lv_payload_item  && '] } } }'.
      ENDLOOP.

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
            r_value = DATA(ls_resp_status) ).
        CATCH cx_web_message_error.
      ENDTRY.

      TRY.
          lo_response->get_text(
            RECEIVING
              r_value = DATA(lv_response) ).
        CATCH cx_web_message_error.

      ENDTRY.

      GET TIME STAMP FIELD DATA(lv_created_on).

      DELETE FROM zinvo_comment WHERE supplierinvoice = @ls_key-Supplierinvoice
                               AND fiscalyear = @ls_key-Fiscalyear.

      IF ls_resp_status-code = '200' OR ls_resp_status-code = '201'.

        UPDATE zsupplier_invo SET instance_staus =  3  , created_by = @sy-uname , created_at = @lv_created_on WHERE supplierinvoice = @ls_key-Supplierinvoice
                                         AND fiscalyear = @ls_key-Fiscalyear.

      ELSE.
        UPDATE zsupplier_invo SET instance_staus = 4 , created_by = @sy-uname , created_at = @lv_created_on WHERE supplierinvoice = @ls_key-Supplierinvoice
                                 AND fiscalyear = @ls_key-Fiscalyear.

        DATA ls_message TYPE zinvo_comment.

      ENDIF.

      ls_message-message_no = 1.

      ls_message-supplierinvoice = ls_key-Supplierinvoice.

      ls_message-fiscalyear = ls_key-Fiscalyear.

      SPLIT lv_response AT '<message xml:lang="en">' INTO DATA(lv_xml_part1) DATA(lv_exml_part2).
      SPLIT lv_exml_part2 AT '</message>' INTO DATA(lv_error_message) lv_exml_part2.

      ls_message-comments = lv_error_message.



      INSERT zinvo_comment FROM @ls_message.





    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
