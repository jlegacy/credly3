trigger automatedAccountRulesTrigger on Account (after insert, after update) {


String badgeId;
boolean ruleApplies = false;
boolean checkHit;


//Get fields and Values from automated rules records//
// Create a list of account records from a SOQL query
List<badge_rules__c> rules = [SELECT Id, account_type_r__c, badge_lookup__c, badge_rule_r__c,
         evidence_id_r__c, evidence_name_r__c,evidence_r__c, lookup_id_r__c,
         rule_name_r__c, testimonial_r__c, number_of_badges_issued_r__c,date_last_issued_r__c, send_email_r__c, evidence_url_r__c FROM badge_rules__c WHERE account_type_r__c = 'Account'];
Id[] badgeIDs = new Id[]{};
System.debug('All rules');
System.debug(rules);
for(badge_rules__c r : rules)
{
    badgeIDs.add(r.badge_lookup__c);
}
Map<Id, Badge__c> bmap = new Map<Id, Badge__c>( [Select Id, Name, criteria__c, description__c, document_id__c,
         expires_in__c, image__c,is_giveable__c, short_description__c,
         title__c from badge__c where ID IN :badgeIDs] );
         
Member_badge__c[] dupCheck = [Select Id, lookup_id_m__c, badge_lookup_m__c from Member_Badge__c where lookup_id_m__c IN :trigger.newMap.keySet()
                                    AND badge_lookup_m__c IN :badgeIDs];
Map<String, Member_badge__c> dupMap = new Map<String, Member_badge__c>();

for( Member_Badge__c mb : dupCheck)
{
    dupMap.put(String.valueOf(mb.badge_lookup_m__c) + String.valueOf(mb.lookup_id_m__c), mb);
}

List<List<String>> parsedRows = new List<List<String>>();
List<String> fieldValues = new List<String>();
List<String> ids = new List<String>();


Set<Set<String>> idsWithMatches = new Set<Set<String>>();
Set<String> idMatches = new Set<String>();

// Loop through rules and pull rules//
List<Member_Badge__c> toInsert = new List<Member_Badge__c>();
badge_rules__c[] toUpdate = new badge_rules__c[]{};
for(badge_rules__c j : rules){

//unparse Rules Row
//((BillingCity, STRING, ct, test), (Industry, PICKLIST, eq, it))

        // For each row: 
        // row[0] = field name
        // row[1] = field type
        // row[2] = operand
        // row[3] = field value
    Boolean ruleHasHit = false;
    parsedRows = automatedTriggerClass.unparseRules(j.badge_rule_r__c);


    ids = automatedTriggerClass.getFieldValues(trigger.new,'id');
    //loop through fields and get values from file//
    //get fields from file//
 
    Map<String, Integer> foundHitIds = new Map<String, Integer>(); 
    
    for(List<String> row: parsedRows)
        {
            if(!row.isEmpty())
            {
                //((BillingCity, STRING, ct, test), (Industry, PICKLIST, eq, it))
                System.debug('Leads');
                System.debug(trigger.new);
                  fieldValues = automatedTriggerClass.getFieldValues(trigger.new, row.get(0));
                integer index = 0;  
                for(String field: fieldValues)
                  {    
                      System.debug('Field Val/Rule Val');
                      System.debug(field);
                      System.debug(row.get(3));
                      checkHit = automatedTriggerClass.lookForHit(row.get(3), field, row.get(2), row.get(1));
                      if (checkHit)
                      { 
                          System.debug('Found hit');
                         String idKey;
                          idKey = String.valueOf(trigger.new.get(index).get('id'));
                             Integer value = foundHitIds.get(idKey);
                             value = (value == null) ? 1 : value + 1;
                             foundHitIds.put(idKey,value);
                      }
                       index++;
                  }
                
                //loop through foundhit ids and determine if any met all field criteria
                //will check if each parsed row was equated with success
                
                for(Id id : foundHitIds.keySet()) {
                    if (foundHitIds.get(id) == parsedRows.size() && !dupMap.containsKey(String.valueOf(j.badge_lookup__c) + String.valueOf(id)))
                    {
                        System.debug('Adding to toInsert');
                        toInsert.add(automatedTriggerClass.newMemberBadge(trigger.newMap.get(id), j, bmap.get(j.badge_lookup__c), j.account_type_r__c.toLowerCase()));
                        System.debug(toInsert);
                        ruleHasHit = true;
                        j.number_of_badges_issued_r__c = (j.number_of_badges_issued_r__c == null) ? 1 : j.number_of_badges_issued_r__c + 1;
             			j.date_last_issued_r__c = system.now();
                    }
                
                }
                }
            
            }
            if(ruleHasHit) toUpdate.add(j);
        }
        if(!toInsert.isEmpty()){
             System.debug('Inserting');
             insert toInsert;
             update toUpdate;
        }
}