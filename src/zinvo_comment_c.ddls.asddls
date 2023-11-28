@EndUserText.label: 'Consumption View'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZINVO_COMMENT_C
   as projection on zinvo_comment_i
{
    @UI.facet: [{
        id: 'message',
        purpose: #STANDARD,
        label: 'Message Log',
        type : #IDENTIFICATION_REFERENCE,
        position : 10
        }]
        
      @UI: {
            lineItem: [{position: 10}],
            identification: [{position: 10}]
      }
    key MessageNo,
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
    Comments,
    /* Associations */
    _Supplier : redirected to parent zinvo_supplier_c
}
