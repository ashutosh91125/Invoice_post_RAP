@EndUserText.label: 'Consumption View'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity zinvo_itm_ass_c 
  as projection on zinvo_itm_ass_i
{
    @UI.facet: [{
        id: 'item_ass',
        purpose: #STANDARD,
        label: 'Account Assignment',
        type : #IDENTIFICATION_REFERENCE,
        position : 10
        }]
        
      @UI: {
            lineItem: [{position: 10}],
            identification: [{position: 10}]
      }
    key Ordinalnumber,
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
    key Supplierinvoiceitem,
    @UI: {
            lineItem: [{position: 50}],
            identification: [{position: 50}]
      }
    Costcenter,
    @UI: {
            lineItem: [{position: 60}],
            identification: [{position: 60}]
      }
    Controllingarea,
    @UI: {
            lineItem: [{position: 70}],
            identification: [{position: 70}]
      }
    Businessarea,
    @UI: {
            lineItem: [{position: 80}],
            identification: [{position: 80}]
      }
    Profitcenter,
    @UI: {
            lineItem: [{position: 90}],
            identification: [{position: 90}]
      }
    Functionalarea,
    @UI: {
            lineItem: [{position: 100}],
            identification: [{position: 100}]
      }
    Glaccount,
    @UI: {
            lineItem: [{position: 110}],
            identification: [{position: 110}]
      }
    Salesorder,
    @UI: {
            lineItem: [{position: 120}],
            identification: [{position: 120}]
      }
    Salesorderitem,
    @UI: {
            lineItem: [{position: 130}],
            identification: [{position: 130}]
      }
    Costobject,
    @UI: {
            lineItem: [{position: 140}],
            identification: [{position: 140}]
      }
    Costctractivitytype,
    @UI: {
            lineItem: [{position: 150}],
            identification: [{position: 150}]
      }
    Businessprocess,
    @UI: {
            lineItem: [{position: 160}],
            identification: [{position: 160}]
      }
    Wbselement,
    @UI: {
            lineItem: [{position: 170}],
            identification: [{position: 170}]
      }
    Documentcurrency,
    @UI: {
            lineItem: [{position: 180}],
            identification: [{position: 180}]
      }
    Suplrinvcacctassignmentamount,
    @UI: {
            lineItem: [{position: 190}],
            identification: [{position: 190}]
      }
    Purchaseorderquantityunit,
    @UI: {
            lineItem: [{position: 200}],
            identification: [{position: 200}]
      }
    Quantity,
    @UI: {
            lineItem: [{position: 210}],
            identification: [{position: 210}]
      }
    Taxcode,
    @UI: {
            lineItem: [{position: 220}],
            identification: [{position: 220}]
      }
    Accountassignmentnumber,
    @UI: {
            lineItem: [{position: 230}],
            identification: [{position: 230}]
      }
    Accountassignmentisunplanned,
    @UI: {
            lineItem: [{position: 240}],
            identification: [{position: 240}]
      }
    Personnelnumber,
    @UI: {
            lineItem: [{position: 250}],
            identification: [{position: 250}]
      }
    Workitem,
    @UI: {
            lineItem: [{position: 260}],
            identification: [{position: 260}]
      }
    Masterfixedasset,
    @UI: {
            lineItem: [{position: 270}],
            identification: [{position: 270}]
      }
    Fixedasset,
    @UI: {
            lineItem: [{position: 280}],
            identification: [{position: 280}]
      }
    Debitcreditcode,
    @UI: {
            lineItem: [{position: 290}],
            identification: [{position: 290}]
      }
    Taxjurisdiction,
    @UI: {
            lineItem: [{position: 300}],
            identification: [{position: 300}]
      }
    Internalorder,
    @UI: {
            lineItem: [{position: 310}],
            identification: [{position: 310}]
      }
    Projectnetworkinternalid,
    @UI: {
            lineItem: [{position: 320}],
            identification: [{position: 320}]
      }
    Networkactivityinternalid,
    @UI: {
            lineItem: [{position: 330}],
            identification: [{position: 330}]
      }
    Projectnetwork,
    @UI: {
            lineItem: [{position: 340}],
            identification: [{position: 340}]
      }
    Networkactivity,
    @UI: {
            lineItem: [{position: 350}],
            identification: [{position: 350}]
      }
    Commitmentitem,
    @UI: {
            lineItem: [{position: 360}],
            identification: [{position: 360}]
      }
    Fundscenter,
    @UI: {
            lineItem: [{position: 370}],
            identification: [{position: 370}]
      }
    Fund,
    @UI: {
            lineItem: [{position: 380}],
            identification: [{position: 380}]
      }
    Grantid,
    @UI: {
            lineItem: [{position: 390}],
            identification: [{position: 390}]
      }
    Partnerbusinessarea,
    @UI: {
            lineItem: [{position: 400}],
            identification: [{position: 400}]
      }
    Companycode,
    @UI: {
            lineItem: [{position: 410}],
            identification: [{position: 410}]
      }
    Suplrinvcaccountassignmenttext,
    @UI: {
            lineItem: [{position: 420}],
            identification: [{position: 420}]
      }
    Quantityinpurchaseorderunit,
    @UI: {
            lineItem: [{position: 430}],
            identification: [{position: 430}]
      }
    Profitabilitysegment,
    /* Associations */
    _Item : redirected to parent zinvo_item_c,
    _Supplier : redirected to zinvo_supplier_c
    
}
