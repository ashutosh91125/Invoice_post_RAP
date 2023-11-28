@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for Supplier'
define root view entity zinvo_supplier_i as select from zsupplier_invo
association to zinvo_status as _Status on $projection.Status = _Status.Value
composition [1..*] of zinvo_item_i as _Item
association to zinvo_itm_ass_i as _Item_Ass on $projection.Supplierinvoice = _Item_Ass.Supplierinvoice 
                                               and $projection.Fiscalyear = _Item_Ass.Fiscalyear
composition [1..*] of zinvo_comment_i as _Comments
{
    @EndUserText.label: 'Supplier Invoice'
    key supplierinvoice as Supplierinvoice,
    @EndUserText.label: 'Fiscal Year'
    key fiscalyear as Fiscalyear,
    @EndUserText.label: 'Company Code'
    companycode as Companycode,
    @EndUserText.label: 'Document Date'
    documentdate as Documentdate,
    @EndUserText.label: 'Posting Date'
    postingdate as Postingdate,
    @EndUserText.label: 'Supplier Invoice ID by Party'
    supplierinvoiceidbyinvcgparty as Supplierinvoiceidbyinvcgparty,
    @EndUserText.label: 'Invoicing Party'
    invoicingparty as Invoicingparty,
    @EndUserText.label: 'Document Currency'
    documentcurrency as Documentcurrency,
    @EndUserText.label: 'Invoice Gross Amount'
    invoicegrossamount as Invoicegrossamount,
    @EndUserText.label: 'Unplanned Delivery Cost'
    unplanneddeliverycost as Unplanneddeliverycost,
    @EndUserText.label: 'Document Header Text'
    documentheadertext as Documentheadertext,
    @EndUserText.label: 'Manual Cash Discount'
    manualcashdiscount as Manualcashdiscount,
    @EndUserText.label: 'Payment Terms'
    paymentterms as Paymentterms,
    @EndUserText.label: 'Due Calculationn Base Date'
    duecalculationbasedate as Duecalculationbasedate,
    @EndUserText.label: 'Cash Discount 1%'
    cashdiscount1percent as Cashdiscount1percent,
    @EndUserText.label: 'Cash Discount 1 Days'
    cashdiscount1days as Cashdiscount1days,
    @EndUserText.label: 'Cash Discount 2%'
    cashdiscount2percent as Cashdiscount2percent,
    @EndUserText.label: 'Cash Discount 2 Days'
    cashdiscount2days as Cashdiscount2days,
    @EndUserText.label: 'Net Payment Days'
    netpaymentdays as Netpaymentdays,
    @EndUserText.label: 'Payment Blocking Reason'
    paymentblockingreason as Paymentblockingreason,
    @EndUserText.label: 'Accounting Document Type'
    accountingdocumenttype as Accountingdocumenttype,
    @EndUserText.label: 'BP Bank Account Internal Id'
    bpbankaccountinternalid as Bpbankaccountinternalid,
    @EndUserText.label: 'Indirect Quoted Exchange Rate'
    indirectquotedexchangerate as Indirectquotedexchangerate,
    @EndUserText.label: 'Direct Quoted Exchange Rate'
    directquotedexchangerate as Directquotedexchangerate,
    @EndUserText.label: 'State Central Bank Payment Reason'
    statecentralbankpaymentreason as Statecentralbankpaymentreason,
    @EndUserText.label: 'Supplying Country'
    supplyingcountry as Supplyingcountry,
    @EndUserText.label: 'Payment Method'
    paymentmethod as Paymentmethod,
    @EndUserText.label: 'Payment Method Supplement'
    paymentmethodsupplement as Paymentmethodsupplement,
    @EndUserText.label: 'Payment Reference'
    paymentreference as Paymentreference,
    @EndUserText.label: 'Invoice Reference'
    invoicereference as Invoicereference,
    @EndUserText.label: 'Invoice Reference Fiscal Year'
    invoicereferencefiscalyear as Invoicereferencefiscalyear,
    @EndUserText.label: 'Fixed Cash Discount'
    fixedcashdiscount as Fixedcashdiscount,
    @EndUserText.label: 'Unplanned Delivery Cost Tax Code'
    unplanneddeliverycosttaxcode as Unplanneddeliverycosttaxcode,
    @EndUserText.label: 'Unplanned Delivery Cost Tax Jurisdiction'
    unplnddelivcosttaxjurisdiction as Unplnddelivcosttaxjurisdiction,
    @EndUserText.label: 'Assignment Reference'
    assignmentreference as Assignmentreference,
    @EndUserText.label: 'Supplier posting lineitem text'
    supplierpostinglineitemtext as Supplierpostinglineitemtext,
    @EndUserText.label: 'Tax Is Calculated Automatically'
    taxiscalculatedautomatically as Taxiscalculatedautomatically,
    @EndUserText.label: 'Bisiness Place'
    businessplace as Businessplace,
    @EndUserText.label: 'Business Section Code'
    businesssectioncode as Businesssectioncode,
    @EndUserText.label: 'Business Area'
    businessarea as Businessarea,
    @EndUserText.label: 'Supplier Invoice is Credit Memo'
    supplierinvoiceiscreditmemo as Supplierinvoiceiscreditmemo,
    @EndUserText.label: 'Payment SlipWith Reference Subscriber'
    paytslipwthrefsubscriber as Paytslipwthrefsubscriber,
    @EndUserText.label: 'Payment Slip With Reference Check Digit'
    paytslipwthrefcheckdigit as Paytslipwthrefcheckdigit,
    @EndUserText.label: 'Payment SlipWith Reference No'
    paytslipwthrefreference as Paytslipwthrefreference,
    @EndUserText.label: 'Tax Determination Date'
    taxdeterminationdate as Taxdeterminationdate,
    @EndUserText.label: 'Payment SlipWith Reference'
    invoicereceiptdate as Invoicereceiptdate,
    @EndUserText.label: 'Reporting Country'
    deliveryofgoodsreportingcntry as Deliveryofgoodsreportingcntry,
    @EndUserText.label: 'VAT Registration Number of Supplier'
    suppliervatregistration as Suppliervatregistration,
    @EndUserText.label: 'Triangular Deal Within the EU'
    iseutriangulardeal as Iseutriangulardeal,
    @EndUserText.label: 'Status'
    instance_staus as Status,
    
    case status
      when '0' then 0 
      when '3' then 1
      when '4' then 3
      else 0 
      end as criticality,
    created_by as CreatedBy,
    created_at as CreatedAt,
    _Item,
    _Comments,
    _Item_Ass,
    _Status,
    @EndUserText.label: 'Status Description'
    _Status.Description as Statusdesc // Make association public
}
