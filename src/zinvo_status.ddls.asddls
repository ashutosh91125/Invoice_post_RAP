@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'status'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zinvo_status as select from DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name:'ZINVO_INSTANCE_STATUS'  )
{   
    @UI.hidden: true
    key domain_name,
    @UI.hidden: true
    key value_position,
    @UI.hidden: true
    @Semantics.language: true
    key language,
    @EndUserText.label: 'Status'
    value_low as Value,
    @EndUserText.label: 'Description'
    @Semantics.text: true
    text as Description
}
