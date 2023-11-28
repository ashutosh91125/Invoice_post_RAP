@EndUserText.label: 'Consumption View'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@UI.headerInfo: {
  typeName:       'Purchase Order Item',
  typeNamePlural: 'Purchase Order Items',
  title: {
    type:   #STANDARD,
    value:  'Supplierinvoiceitem'
  }
  }
define view entity zinvo_item_c
   as projection on zinvo_item_i
{   
    @UI.facet: [{
        id: 'item',
        purpose: #STANDARD,
        label: 'Purchase Order Item',
        type : #IDENTIFICATION_REFERENCE,
        position : 10
        },
        {
        id: 'account_assign',
        purpose: #STANDARD,
        label : 'Account Assignment',
        type : #LINEITEM_REFERENCE,
        position : 20,
        targetElement : '_Item_Ass'
        }
        ]
        
      @UI: {
            lineItem: [{position: 10}],
            identification: [{position: 10}]
        }
    key Supplierinvoiceitem,
    @UI: {
            lineItem: [{position: 20}],
            identification: [{position: 20}]
        }
    key Supplierinvoice,
    @UI: {
            lineItem: [{position: 30}],
            identification: [{position: 30}]
        }
    key Fiscalyear,
    @UI: {
            lineItem: [{position: 40}],
            identification: [{position: 40}]
        }
    Purchaseorder,
    @UI: {
            lineItem: [{position: 50}],
            identification: [{position: 50}]
        }
    Purchaseorderitem,
    @UI: {
            lineItem: [{position: 60}],
            identification: [{position: 60}]
        }
    Plant,
    @UI: {
            lineItem: [{position: 70}],
            identification: [{position: 70}]
        }
    Referencedocument,
    @UI: {
            lineItem: [{position: 80}],
            identification: [{position: 80}]
        }
    Referencedocumentfiscalyear,
    @UI: {
            lineItem: [{position: 90}],
            identification: [{position: 90}]
        }
    Referencedocumentitem,
    @UI: {
            lineItem: [{position: 100}],
            identification: [{position: 100}]
        }
    Issubsequentdebitcredit,
    @UI: {
            lineItem: [{position: 110}],
            identification: [{position: 110}]
        }
    Taxcode,
    @UI: {
            lineItem: [{position: 120}],
            identification: [{position: 120}]
        }
    Taxjurisdiction,
    @UI: {
            lineItem: [{position: 130}],
            identification: [{position: 130}]
        }
    Documentcurrency,
    @UI: {
            lineItem: [{position: 140}],
            identification: [{position: 140}]
        }
    SupplierInvoiceItemAmount,
    @UI: {
            lineItem: [{position: 150}],
            identification: [{position: 150}]
        }
    Purchaseorderquantityunit,
    @UI: {
            lineItem: [{position: 160}],
            identification: [{position: 160}]
        }
    Quantityinpurchaseorderunit,
    @UI: {
            lineItem: [{position: 170}],
            identification: [{position: 170}]
        }
    Purchaseorderpriceunit,
    @UI: {
            lineItem: [{position: 180}],
            identification: [{position: 180}]
        }
    Qtyinpurchaseorderpriceunit,
    @UI: {
            lineItem: [{position: 190}],
            identification: [{position: 190}]
        }
    Suplrinvcdeliverycostcndntype,
    @UI: {
            lineItem: [{position: 200}],
            identification: [{position: 200}]
        }
    Suplrinvcdeliverycostcndnstep,
    @UI: {
            lineItem: [{position: 210}],
            identification: [{position: 210}]
        }
    Suplrinvcdeliverycostcndncount,
    @UI: {
            lineItem: [{position: 220}],
            identification: [{position: 220}]
        }
    Supplierinvoiceitemtext,
    @UI: {
            lineItem: [{position: 230}],
            identification: [{position: 230}]
        }
    Freightsupplier,
    @UI: {
            lineItem: [{position: 240}],
            identification: [{position: 240}]
        }
    Isnotcashdiscountliable,
    
    /* Associations */
    _Supplier : redirected to parent zinvo_supplier_c,
    _Item_Ass : redirected to composition child zinvo_itm_ass_c
   
}
