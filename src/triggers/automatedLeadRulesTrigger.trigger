trigger automatedLeadRulesTrigger on Lead (after insert, after update) {


String badgeId;
boolean ruleApplies = false;
boolean checkHit;

//load up sObjects or aka..records//
sObject[] o = [SELECT Id, PostalCode,Phone,Jigsaw,Street,LeadSource,ConvertedOpportunityId,
IsUnreadByOwner,CreatedById,LastActivityDate,
City,IsConverted,Description,IsDeleted,Longitude,Industry,
SystemModstamp,Fax,Status,HasOptedOutOfEmail,ConvertedDate,
AnnualRevenue,Primary__c,CreatedDate,OwnerId,HasOptedOutOfFax,
JigsawContactId,LastViewedDate,Country,Email,NumberOfEmployees,
DoNotCall,Company,Latitude,ProductInterest__c,LastModifiedById,
State,LastName,LastModifiedDate,ConvertedAccountId,MobilePhone,
Title,LastReferencedDate,EmailBouncedDate,Name,NumberofLocations__c,
EmailBouncedReason,Website,MasterRecordId,SICCode__c,FirstName,
CurrentGenerators__c,ConvertedContactId,Rating,LastTransferDate,Salutation  FROM Lead];

//Get fields and Values from automated rules records//
// Create a list of account records from a SOQL query
List<badge_rules__c> rules = [SELECT Id, badge_rule_r__c, badge_lookup__c,account_type_r__c FROM badge_rules__c WHERE account_type_r__c = 'Lead']; 

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