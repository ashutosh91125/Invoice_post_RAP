@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view'
define view entity zinvo_itm_ass_i as select from zinvoice_itm_ass

association to zinvo_supplier_i as _Supplier on
    $projection.Fiscalyear = _Supplier.Fiscalyear
    and $projection.Supplierinvoice = _Supplier.Supplierinvoice


association to parent zinvo_item_i as _Item on
    $projection.Supplierinvoiceitem = _Item.Supplierinvoiceitem
    and $projection.Fiscalyear = _Item.Fiscalyear
    and $projection.Supplierinvoice = _Item.Supplierinvoice

    
{
    
    @EndUserText.label: 'Ordinal Number'
    key ordinalnumber as Ordinalnumber,
    @EndUserText.label: 'Supplier Invoice'
    key supplierinvoice as Supplierinvoice,
    @EndUserText.label: 'Fiscal Year'
    key fiscalyear as Fiscalyear,
    @EndUserText.label: 'Supplier Invoice Item'
    key supplierinvoiceitem as Supplierinvoiceitem,
    @EndUserText.label: 'Cost Center'
    costcenter as Costcenter,
    @EndUserText.label: 'Controlling Area'
    controllingarea as Controllingarea,
    @EndUserText.label: 'Business Area'
    businessarea as Businessarea,
    @EndUserText.label: 'Profit Center'
    profitcenter as Profitcenter,
    @EndUserText.label: 'Functional Area'
    functionalarea as Functionalarea,
    @EndUserText.label: 'GL Account'
    glaccount as Glaccount,
    @EndUserText.label: 'Sales Order'
    salesorder as Salesorder,
    @EndUserText.label: 'Sales Order Item'
    salesorderitem as Salesorderitem,
    @EndUserText.label: 'Cost Object'
    costobject as Costobject,
    @EndUserText.label: 'Cost Ctractivity Type'
    costctractivitytype as Costctractivitytype,
    @EndUserText.label: 'Business Process'
    businessprocess as Businessprocess,
    @EndUserText.label: 'WB Element'
    wbselement as Wbselement,
    @EndUserText.label: 'Document Currency'
    documentcurrency as Documentcurrency,
    @EndUserText.label: 'Suplier Invoice Assignment Amount'
    suplrinvcacctassignmentamount as Suplrinvcacctassignmentamount,
    @EndUserText.label: 'Purchase Order Quantity Unit'
    purchaseorderquantityunit as Purchaseorderquantityunit,
    @EndUserText.label: 'Quantity'
    quantity as Quantity,
    @EndUserText.label: 'Tax Code'
    taxcode as Taxcode,
    @EndUserText.label: 'Account Assignment Number'
    accountassignmentnumber as Accountassignmentnumber,
    @EndUserText.label: 'Account Assignment is Unplanned'
    accountassignmentisunplanned as Accountassignmentisunplanned,
    @EndUserText.label: 'Personnel Number'
    personnelnumber as Personnelnumber,
    @EndUserText.label: 'Work Item'
    workitem as Workitem,
    @EndUserText.label: 'Master Fixed Asset'
    masterfixedasset as Masterfixedasset,
    @EndUserText.label: 'Fixed Asset'
    fixedasset as Fixedasset,
    @EndUserText.label: 'Debit Credit Code'
    debitcreditcode as Debitcreditcode,
    @EndUserText.label: 'Tax Jurisdiction'
    taxjurisdiction as Taxjurisdiction,
    @EndUserText.label: 'Internal Order'
    internalorder as Internalorder,
    @EndUserText.label: 'Project Network Internal ID'
    projectnetworkinternalid as Projectnetworkinternalid,
    @EndUserText.label: 'Network Activity Internal ID'
    networkactivityinternalid as Networkactivityinternalid,
    @EndUserText.label: 'Project Network'
    projectnetwork as Projectnetwork,
    @EndUserText.label: 'Network Activity'
    networkactivity as Networkactivity,
    @EndUserText.label: 'Commitment Item'
    commitmentitem as Commitmentitem,
    @EndUserText.label: 'Funds Center'
    fundscenter as Fundscenter,
    @EndUserText.label: 'Fund'
    fund as Fund,
    @EndUserText.label: 'Grant ID'
    grantid as Grantid,
    @EndUserText.label: 'Partner Business Area'
    partnerbusinessarea as Partnerbusinessarea,
    @EndUserText.label: 'Company Code'
    companycode as Companycode,
    @EndUserText.label: 'Supplier Invoice Account Assignment Text'
    suplrinvcaccountassignmenttext as Suplrinvcaccountassignmenttext,
    @EndUserText.label: 'Quantity In Purchase Order Unit'
    quantityinpurchaseorderunit as Quantityinpurchaseorderunit,
    @EndUserText.label: 'Profitabbility Segment'
    profitabilitysegment as Profitabilitysegment,
    _Item,
    _Supplier // Make association public
}
