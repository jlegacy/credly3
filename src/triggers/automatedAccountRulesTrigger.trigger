trigger automatedAccountRulesTrigger on Account (after insert, after update) {

String badgeId;
boolean ruleApplies = false;
boolean checkHit;

//load up sObjects or aka..records//
sObject[] o = [SELECT Id,Phone,Jigsaw,ShippingLatitude,
               ParentId,Type,CreatedById,
               LastActivityDate,CustomerPriority__c,
               BillingCity,Description,BillingLongitude,
               IsDeleted,Industry,SystemModstamp,Fax,
               TickerSymbol,ShippingCity,ShippingState,
               BillingPostalCode,AnnualRevenue,CreatedDate,
               JigsawCompanyId,SLAExpirationDate__c,
               OwnerId,LastViewedDate,Ownership,NumberOfEmployees,
               UpsellOpportunity__c,ShippingPostalCode,
               LastModifiedById,SicDesc,SLASerialNumber__c,
               AccountSource,BillingState,BillingCountry,
               BillingLatitude,LastModifiedDate,
               LastReferencedDate,ShippingStreet,Name,
               SLA__c,AccountNumber,Site,NumberofLocations__c,
               Sic,Website,ShippingLongitude,MasterRecordId,
               ShippingCountry,Active__c,BillingStreet,
               Rating FROM Account];


//Get fields and Values from automated rules records//
// Create a list of account records from a SOQL query
List<badge_rules__c> rules = [SELECT Id, badge_rule_r__c, badge_lookup__c,account_type_r__c FROM badge_rules__c WHERE account_type_r__c = 'Account']; 

List<List<String>> parsedRows = new List<List<String>>();
List<String> fieldValues = new List<String>();
List<String> ids = new List<String>();



Set<Set<String>> idsWithMatches = new Set<Set<String>>();
Set<String> idMatches = new Set<String>();

// Loop through rules and pull rules//
for(badge_rules__c j : rules){

//unparse Rules Row
//((BillingCity, STRING, ct, test), (Industry, PICKLIST, eq, it))
    
parsedRows = automatedTriggerClass.unparseRules(j.badge_rule_r__c);
//store ids for future lookup
    ids = automatedTriggerClass.getFieldValues(o,'id');
    //loop through fields and get values from file//
    //get fields from file//
 
  Map<String, Integer> foundHitIds = new Map<String, Integer>(); 
  
    for(List<String> row: parsedRows)
        {
        
       
        
            if(!row.isEmpty())
            {
                //((BillingCity, STRING, ct, test), (Industry, PICKLIST, eq, it))
                  fieldValues = automatedTriggerClass.getFieldValues(o,row.get(0));
                integer index = 0;  
                for(String field: fieldValues)
                  {
                                      
                      checkHit = automatedTriggerClass.lookForHit(row.get(3), field, row.get(2), row.get(1));
                      if (checkHit)
                      { 
                         String idKey;
                          idKey = String.valueOf(o.get(index).get('id'));
                             Integer value = foundHitIds.get(idKey);
                             value = (value == null) ? 1 : value + 1;
                             foundHitIds.put(idKey,value);
                      }
                       index++;
                  }
                
                //loop through foundhit ids and determine if any met all field criteria
                //will check if each parsed row was equated with success
                
                for(Id id : foundHitIds.keySet()) {
                    if (foundHitIds.get(id) == parsedRows.size())
                    {
                        automatedTriggerClass.addMemberBadge(id, j.Id, j.badge_lookup__c, j.account_type_r__c.toLowerCase());
                    }
                
                }
            
            }
        }
}



}