trigger automatedContactRulesTrigger on Contact (after insert, after update) {


String badgeId;
boolean ruleApplies = false;
boolean checkHit;

//load up sObjects or aka..records//
sObject[] o = [SELECT Id, Phone,Jigsaw ,MailingLatitude ,OtherState ,LeadSource ,
CreatedById ,LastActivityDate ,OtherPhone ,Description ,
IsDeleted ,Level__c ,SystemModstamp,AssistantPhone ,
IsEmailBounced ,OtherStreet ,Languages__c ,Fax ,HasOptedOutOfEmail ,
CreatedDate ,OwnerId ,HasOptedOutOfFax ,JigsawContactId ,
LastViewedDate ,LastCUUpdateDate ,Email ,DoNotCall ,OtherCity ,
LastModifiedById ,MailingState ,ReportsToId ,Department ,LastName ,
LastCURequestDate ,OtherLongitude ,LastModifiedDate ,MailingLongitude ,
MailingCountry ,MobilePhone ,Title ,LastReferencedDate ,
OtherLatitude ,EmailBouncedDate ,Name ,Birthdate ,MailingStreet ,
HomePhone ,AccountId ,EmailBouncedReason ,MasterRecordId ,
OtherPostalCode ,MailingPostalCode ,FirstName ,AssistantName ,
OtherCountry ,Salutation ,MailingCity  FROM Contact];


//Get fields and Values from automated rules records//
// Create a list of account records from a SOQL query
List<badge_rules__c> rules = [SELECT Id, badge_rule_r__c, badge_lookup__c,account_type_r__c FROM badge_rules__c WHERE account_type_r__c = 'Contact']; 

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