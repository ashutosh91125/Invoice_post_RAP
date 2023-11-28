@EndUserText.label: 'Consumption View'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@UI.headerInfo: {
  typeName:       'Supplier Invoice',
  typeNamePlural: 'Supplier Invoice List',
  title: {
    type:   #STANDARD,
    value:  'Supplierinvoice'
  }
}
define root view entity zinvo_supplier_c
  provider contract transactional_query
  as projection on zinvo_supplier_i
{

      @UI.facet: [{
        id: 'Supplier',
        purpose: #STANDARD,
        label: 'Supplier Invoice Reference',
        type : #IDENTIFICATION_REFERENCE,
        position : 10
        },{
        id: 'item',
        purpose: #STANDARD,
        label : 'Purchase Order Item',
        type : #LINEITEM_REFERENCE,
        position : 20,
        targetElement : '_Item'
        },{
        id: 'comment',
        purpose: #STANDARD,
        label : 'Message Log',
        type : #LINEITEM_REFERENCE,
        position : 40,
        targetElement : '_Comments'
        }]


      @UI: {
          selectionField : [{position: 10}],
          lineItem : [{position: 10}],
          identification: [{position: 10}]
      }

  key Supplierinvoice,
      @UI: {
            lineItem :[{position: 20}],
            identification: [{position: 20}]
        }

  key Fiscalyear,
      @UI: {
            lineItem : [{position: 30}],
            identification: [{position: 30}]
        }
      Companycode,
      @UI: {
            lineItem : [{position: 40}],
            identification: [{position: 40}]
        }
      Documentdate,
      @UI: {
            lineItem : [{position: 50}],
            identification: [{position: 50}]
        }
      Postingdate,
      @UI: {
            lineItem : [{position: 60}],
            identification: [{position: 60}]
        }
      Supplierinvoiceidbyinvcgparty,
      @UI: {
            lineItem : [{position: 70}],
            identification: [{position: 70}]
        }
      Invoicingparty,
      @UI: {
            lineItem : [{position: 80}],
            identification: [{position: 80}]
        }
      Documentcurrency,
      @UI: {
            lineItem : [{position: 90}],
            identification: [{position: 90}]
        }
      Invoicegrossamount,
      @UI: {
            //lineitem [{position: 100}],
            identification: [{position: 100}]
        }
      Unplanneddeliverycost,
      @UI: {
            //lineitem [{position: 110}],
            identification: [{position: 110}]
        }
      Documentheadertext,
      @UI: {
            //lineitem [{position: 120}],
            identification: [{position: 120}]
        }
      Manualcashdiscount,
      @UI: {
            //lineitem [{position: 130}],
            identification: [{position: 130}]
        }
      Paymentterms,
      @UI: {
            //lineitem [{position: 140}],
            identification: [{position: 140}]
        }
      Duecalculationbasedate,
      @UI: {
            //lineitem [{position: 150}],
            identification: [{position: 150}]
        }
      Cashdiscount1percent,
      @UI: {
            //lineitem [{position: 160}],
            identification: [{position: 160}]
        }
      Cashdiscount1days,
      @UI: {
            //lineitem [{position: 170}],
            identification: [{position: 170}]
        }
      Cashdiscount2percent,
      @UI: {
            //lineitem [{position: 180}],
            identification: [{position: 180}]
        }
      Cashdiscount2days,
      @UI: {
            //lineitem [{position: 190}],
            identification: [{position: 190}]
        }
      Netpaymentdays,
      @UI: {
            //lineitem [{position: 200}],
            identification: [{position: 200}]
        }
      Paymentblockingreason,
      @UI: {
            //lineitem [{position: 210}],
            identification: [{position: 210}]
        }
      Accountingdocumenttype,
      @UI: {
            //lineitem [{position: 220}],
            identification: [{position:220}]
        }
      Bpbankaccountinternalid,
      @UI: {
            //lineitem [{position: 230}],
            identification: [{position: 230}]
        }
      Indirectquotedexchangerate,
      @UI: {
            //lineitem [{position: 240}],
            identification: [{position: 240}]
        }
      Directquotedexchangerate,
      @UI: {
            //lineitem [{position: 250}],
            identification: [{position: 250}]
        }
      Statecentralbankpaymentreason,
      @UI: {
            //lineitem [{position: 260}],
            identification: [{position: 260}]
        }
      Supplyingcountry,
      @UI: {
            //lineitem [{position: 270}],
            identification: [{position: 270}]
        }
      Paymentmethod,
      @UI: {
            //lineitem [{position: 280}],
            identification: [{position: 280}]
        }
      Paymentmethodsupplement,
      @UI: {
            //lineitem [{position: 290}],
            identification: [{position: 290}]
        }
      Paymentreference,
      @UI: {
            //lineitem [{position: 300}],
            identification: [{position: 300}]
        }
      Invoicereference,
      @UI: {
            //lineitem [{position: 310}],
            identification: [{position: 310}]
        }
      Invoicereferencefiscalyear,
      @UI: {
            //lineitem [{position: 320}],
            identification: [{position: 320}]
        }
      Fixedcashdiscount,
      @UI: {
            //lineitem [{position: 330}],
            identification: [{position: 330}]
        }
      Unplanneddeliverycosttaxcode,
      @UI: {
            //lineitem [{position: 340}],
            identification: [{position: 340}]
        }
      Unplnddelivcosttaxjurisdiction,
      @UI: {
            //lineitem [{position: 350}],
            identification: [{position: 350}]
        }
      Assignmentreference,
      @UI: {
            //lineitem [{position: 360}],
            identification: [{position: 360}]
        }
      Supplierpostinglineitemtext,
      @UI: {
            //lineitem [{position: 370}],
            identification: [{position: 370}]
        }
      Taxiscalculatedautomatically,
      @UI: {
            //lineitem [{position: 380}],
            identification: [{position: 380}]
        }
      Businessplace,
      @UI: {
            //lineitem [{position: 390}],
            identification: [{position: 390}]
        }
      Businesssectioncode,
      @UI: {
            //lineitem [{position: 400}],
            identification: [{position: 400}]
        }
      Businessarea,
      @UI: {
            //lineitem [{position: 410}],
            identification: [{position: 410}]
        }
      Supplierinvoiceiscreditmemo,
      @UI: {
            //lineitem [{position: 420}],
            identification: [{position: 420}]
        }
      Paytslipwthrefsubscriber,
      @UI: {
            //lineitem [{position: 430}],
            identification: [{position: 430}]
        }
      Paytslipwthrefcheckdigit,
      @UI: {
            //lineitem [{position: 440}],
            identification: [{position: 440}]
        }
      Paytslipwthrefreference,
      @UI: {
            //lineitem [{position: 450}],
            identification: [{position: 450}]
        }
      Taxdeterminationdate,
      @UI: {
            //lineitem [{position: 460}],
            identification: [{position: 460}]
        }
      Invoicereceiptdate,
      @UI: {
            //lineitem [{position: 470}],
            identification: [{position: 470}]
        }
      Deliveryofgoodsreportingcntry,
      @UI: {
            //lineitem [{position: 480}],
            identification: [{position: 490}]
        }
      Suppliervatregistration,
      @UI: {
            //lineitem [{position: 500}],
            identification: [{position: 500}]
        }
      Iseutriangulardeal,
      @UI: {
            selectionField : [{position: 20}],
            lineItem : [{position: 510,criticality:'criticality', importance: #HIGH},{ type: #FOR_ACTION, dataAction: 'transferData', label: 'Transfer Data' }

            ],
            identification: [{position: 510}]

        }
       
      @Consumption.valueHelpDefinition: [{ entity: { name: 'zinvo_status', element: 'Value' },
      distinctValues: true,
      additionalBinding: [{ localElement: 'Statusdesc', element: 'Description', usage: #FILTER_AND_RESULT }] }]
      @ObjectModel.text.element:  [ 'Statusdesc' ]
      @UI.textArrangement: #TEXT_ONLY
      Status,
      criticality,
      @Semantics.text: true
      Statusdesc,
      
        
      CreatedBy,
      @UI: {

            lineItem: [{position: 520}],
            identification: [{position: 520}]

        }
      CreatedAt,
      /* Associations */

      _Comments : redirected to composition child ZINVO_COMMENT_C,
      _Item     : redirected to composition child zinvo_item_c,
      _Item_Ass : redirected to zinvo_itm_ass_c
}
