@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for item tab'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zinvo_item_i as select from zinvo_item
composition [1..*] of zinvo_itm_ass_i as _Item_Ass
association to parent zinvo_supplier_i as _Supplier on 
       $projection.Supplierinvoice = _Supplier.Supplierinvoice 
       and $projection.Fiscalyear = _Supplier.Fiscalyear
       
{
    @EndUserText.label: 'Supplier Invoice Item'
    key supplierinvoiceitem as Supplierinvoiceitem,
    @EndUserText.label: 'Supplier Invoice'
    key supplierinvoice as Supplierinvoice,
    @EndUserText.label: 'Fiscal Year'
    key fiscalyear as Fiscalyear,
    @EndUserText.label: 'Purchase Order'
    purchaseorder as Purchaseorder,
    @EndUserText.label: 'Puchase Order Item'
    purchaseorderitem as Purchaseorderitem,
    @EndUserText.label: 'Plant'
    plant as Plant,
    @EndUserText.label: 'Reference Document'
    referencedocument as Referencedocument,
    @EndUserText.label: 'Reference Document Fiscal Year'
    referencedocumentfiscalyear as Referencedocumentfiscalyear,
    @EndUserText.label: 'Reference Document Item'
    referencedocumentitem as Referencedocumentitem,
    @EndUserText.label: 'Is Subsequent Debit Credit'
    issubsequentdebitcredit as Issubsequentdebitcredit,
    @EndUserText.label: 'Tax Code'
    taxcode as Taxcode,
    @EndUserText.label: 'Tax Jurisdiction'
    taxjurisdiction as Taxjurisdiction,
    @EndUserText.label: 'Document Currency'
    documentcurrency as Documentcurrency,
    @EndUserText.label: 'Supplier Invoice Item Amount'
    supplierinvoiceitemamount as SupplierInvoiceItemAmount,
    @EndUserText.label: 'Purchase Order Quantity Unit'
    purchaseorderquantityunit as Purchaseorderquantityunit,
    @EndUserText.label: 'Quantity in Purchae Order Unit'
    quantityinpurchaseorderunit as Quantityinpurchaseorderunit,
    @EndUserText.label: 'Purchagse Order Price Unit'
    purchaseorderpriceunit as Purchaseorderpriceunit,
    @EndUserText.label: 'Quantity In Purchase Order Price Unit'
    qtyinpurchaseorderpriceunit as Qtyinpurchaseorderpriceunit,
    @EndUserText.label: 'Supplier Invoice Delivery Cost Type'
    suplrinvcdeliverycostcndntype as Suplrinvcdeliverycostcndntype,
    @EndUserText.label: 'Supplier Invoice Delivery Cost Step'
    suplrinvcdeliverycostcndnstep as Suplrinvcdeliverycostcndnstep,
    @EndUserText.label: 'Supplier Invoice Delivery Cost Counte'
    suplrinvcdeliverycostcndncount as Suplrinvcdeliverycostcndncount,
    @EndUserText.label: 'Supplier Invoice Item Text'
    supplierinvoiceitemtext as Supplierinvoiceitemtext,
    @EndUserText.label: 'Freight Supplier'
    freightsupplier as Freightsupplier,
    @EndUserText.label: 'Is Not Cash Discount Liable'
    isnotcashdiscountliable as Isnotcashdiscountliable,
    _Supplier,
    _Item_Ass
}
