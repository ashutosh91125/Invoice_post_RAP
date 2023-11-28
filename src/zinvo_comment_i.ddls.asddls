@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view'
define view entity zinvo_comment_i as select from zinvo_comment
association to parent zinvo_supplier_i as _Supplier
    on $projection.Supplierinvoice = _Supplier.Supplierinvoice
    and $projection.Fiscalyear = _Supplier.Fiscalyear
{   
    @EndUserText.label: 'Message No'
    key message_no as MessageNo,
    @EndUserText.label: 'Supplier Invoice'
    key supplierinvoice as Supplierinvoice,
    @EndUserText.label: 'Fiscal Year'
    key fiscalyear as Fiscalyear,
    @EndUserText.label: 'Comments'
    comments as Comments,
    _Supplier // Make association public
}
