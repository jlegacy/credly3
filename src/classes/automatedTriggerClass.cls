public with sharing class automatedTriggerClass {

public static List<List<STRING>> unparseRules(String rule)
{
List<List<STRING>> returnRows = new List<List<STRING>>();

String[] rows = rule.split('\\~');

         for (String x: rows)
        {
            List<STRING> returnFields = new List<STRING>();
            
            String[] fields = x.split('\\|');
            for (String y: fields)
            {
                String[] fieldType = y.split('\\:');
                for (String z: fieldType)
                {
                    returnFields.add(z);
                }
            }
            returnRows.add(returnFields);
        }
return returnRows;
}
public static List<String> getFieldValues(SObject[] objects, String field) {
  List<String> result = new List<String>();
  if (null != objects) {
    for (SObject o : objects) {
      result.add(String.valueOf(o.get(field)));
    }
  }
  return result;
}

public static Map<String, String> symbolMap(){
Map<String, String> symMap = new Map<String, String>();
symMap.put('eq', '=');
symMap.put('lt', '<');
symMap.put('le', '<=');
symMap.put('gt', '>');
symMap.put('ge', '>=');
symMap.put('ne', '!=');
symMap.put('ct', 'LIKE');
return symMap;
}

public static Boolean numberComp(Double ruleValue, Double fieldValue, String operand)
{

if (operand.compareTo('eq') == 0)
{
return (fieldValue == ruleValue) ? true : false;
}
if (operand.compareTo('lt') == 0)
{
return (fieldValue < ruleValue) ? true : false;
}
if (operand.compareTo('le') == 0)
{
return (fieldValue <= ruleValue) ? true : false;
}
if (operand.compareTo('gt') == 0)
{
return  (fieldValue > ruleValue) ? true : false;
}
if (operand.compareTo('ge') == 0)
{
return (fieldValue >= ruleValue) ? true : false;
}
if (operand.compareTo('ne') == 0)
{
return (fieldValue != ruleValue) ? true : false;
}
if (operand.compareTo('ct') == 0)
{
return false;
}
  return false;

}
public static Boolean stringComp(String ruleValue, String fieldValue, String operand)
{

if (operand.compareTo('eq') == 0)
{
return (fieldValue == ruleValue) ? true : false;
}
if (operand.compareTo('lt') == 0)
{
return (fieldValue < ruleValue) ? true : false;
}
if (operand.compareTo('le') == 0)
{
return (fieldValue <= ruleValue) ? true : false;
}
if (operand.compareTo('gt') == 0)
{
return  (fieldValue > ruleValue) ? true : false;
}
if (operand.compareTo('ge') == 0)
{
return (fieldValue >= ruleValue) ? true : false;
}
if (operand.compareTo('ne') == 0)
{
return (fieldValue != ruleValue) ? true : false;
}
if (operand.compareTo('ct') == 0)
{
return (fieldValue.contains(ruleValue)) ? true : false;
}
  return false;

}
public static Boolean lookForHit(String ruleValue, String fieldValue, String operand, String fieldType) 
{
Boolean result;


if (fieldValue == null || ruleValue == null)
{
return false;
}

fieldValue = fieldValue.toLowerCase();

ruleValue = ruleValue.toLowerCase();

operand = operand.toLowerCase();

fieldType = fieldType.toLowerCase();

if(fieldType == 'string' || fieldType == 'picklist' || fieldType == 'textarea' || fieldType == 'email' || fieldType == 'phone'){
    return stringComp(ruleValue, fieldValue, operand);
    }
else if(fieldType == 'integer' || fieldType == 'double' || fieldType == 'decimal'){
    return numberComp(Double.valueOf(ruleValue), Double.valueOf(fieldValue), operand);
    }
else if(fieldType == 'date')
{
    Date fieldVal = Date.valueOf(fieldValue);
    Date ruleVal = Date.parse(ruleValue);
    Time t = Time.newInstance(0,0,0,0);
    DateTime rVal = DateTime.newInstance(ruleVal, t);
    DateTime fVal = DateTime.newInstance(fieldVal, t);
    return numberComp(rVal.getTime(), fVal.getTime(), operand);

}
else if(fieldType == 'datetime')
{
    DateTime fieldVal = Date.valueOf(fieldValue);
    DateTime rVal;
    try{
        Date ruleVal = Date.parse(ruleValue);
        Time t = Time.newInstance(0,0,0,0);
        rVal = DateTime.newInstance(ruleVal, t);
    }catch(exception e)
    {
        rVal = DateTime.parse(ruleValue); 
    }
    return numberComp(rVal.getTime(), fieldVal.getTime(), operand);

}else
{
    return stringComp(ruleValue, fieldValue, operand);
}
    //return dateComp
return false;
  
  
}

  public ApexPages.StandardSetController getBadge {
        get {
            if (getBadge == null) {
                getBadge = new ApexPages.StandardSetController(Database.getQueryLocator(
                    [select id,criteria__c, description__c, expires_in__c, is_giveable__c, short_description__c, title__c, image__c, document_ID__c from badge__c]));
            }
            return getBadge;
        }
        set;
    }

    // Initialize getBadge and return a list of records
    public List < badge__c > getBadges() {
        return (List < badge__c > ) getBadge.getRecords();
    }
    
    
public badge__c badge{get;set;}

public static String displayRule(String rule)
{
 String display = rule;
    display = display.replaceAll('\\~', ') and (');
    display = display.replaceAll('\\|', ' ');
    display = display.replaceAll('\\__c', '');
    display = display.replaceAll(':PICKLIST', '');
    display = display.replaceAll(':PHONE', '');
    display = display.replaceAll(':STRING', '');
    display = display.replaceAll(':REFERENCE', '');
    display = display.replaceAll(':DOUBLE', '');
    display = display.replaceAll(':TEXTAREA', '');
    display = display.replaceAll(':BOOLEAN', '');
    display = display.replaceAll(':DATETIME', '');
    display = display.replaceAll(':PHONE', '');
    display = display.replaceAll(':DATE', '');
    display = display.replaceAll(':INTEGER', '');
    display = '(' + display;
    display = display + ')';
    return display;
}

public static void addMemberBadge(id accountID, id ruleID, id badgeID, String accountType) {

//check to see if rule and account number already exists in member badges//
 try {
         List<member_badge__c> memberBadges = [Select Id from member_badge__c where badge_lookup_m__c = : badgeID and account_type_m__c = :accountType and
         lookup_id_m__c = :accountID LIMIT 1];
         
         if (memberBadges.isEmpty()) {
        // Execute commands
             account acct;
             contact cont;
             lead lead;
             
               if (accountType.equals('account'))
                 {
                  acct = [Select Id,Name from account where ID = :accountID LIMIT 1];
                 }
                 if (accountType.equals('contact'))
                 {
                  cont = [Select Id,Name from contact where ID = :accountID LIMIT 1];
                 }
                 if (accountType.equals('lead'))
                 {
                 lead = [Select Id,Name from lead where ID = :accountID LIMIT 1];
                 }
             
        
         badge_rules__c rule = [Select Id, account_type_r__c, badge_lookup__c, badge_rule_r__c,
         evidence_id_r__c, evidence_name_r__c,evidence_r__c, lookup_id_r__c,
         rule_name_r__c, testimonial_r__c, number_of_badges_issued_r__c,date_last_issued_r__c, send_email_r__c, evidence_url_r__c  from badge_rules__c where ID = :ruleID LIMIT 1];
        
         Badge__c badge = [Select Id, Name, criteria__c, description__c, document_id__c,
         expires_in__c, image__c,is_giveable__c, short_description__c,
         title__c from badge__c where ID = :badgeID LIMIT 1];
         
          member_badge__c memberBadge = new member_badge__c();

        memberBadge.criteria_m__c = badge.criteria__c;
         memberBadge.description_m__c = badge.description__c;
          memberBadge.document_id_m__c = badge.document_id__c;
           memberBadge.expires_in_m__c = badge.expires_in__c;
           memberBadge.badge_lookup_m__c = badgeID ;
           
             memberBadge.is_giveable_m__c = badge.is_giveable__c;
              memberBadge.short_description_m__c = badge.short_description__c;
              memberBadge.title_m__c = badge.title__c;
              memberBadge.lookup_id_m__c = accountID;
                memberBadge.account_type_m__c = accountType;
                
                 memberBadge.evidence_id_m__c = rule.evidence_id_r__c;
                 memberBadge.evidence_name_m__c = rule.evidence_name_r__c;
                 memberBadge.evidence_url_m__c = rule.evidence_url_r__c;
                 memberBadge.testimonial_m__c = rule.testimonial_r__c;
                 
                if (accountType.equals('account'))
                 {
                 memberBadge.name_m__c = acct.Name;
                 memberBadge.account_lookup_m__c = accountID;
                 }
                 if (accountType.equals('contact'))
                 {
                 memberBadge.name_m__c = cont.Name;
                 memberBadge.contact_lookup_m__c = accountID;
                 }
                  if (accountType.equals('lead'))
                 {
                 memberBadge.name_m__c = lead.Name;
                 memberBadge.lead_lookup_m__c = accountID;
                 }
            
             memberBadge.issue_date_m__c = system.today();
            insert memberBadge;
              if (accountType.equals('contact'))
                 {
                 if (rule.send_email_r__c)
                    {
                 // sendEmail.sendEmail(memberBadge.contact_lookup_m__c, memberBadge.Id, accountType);
                    }
                 }
                   if (accountType.equals('lead'))
                 {
                 if (rule.send_email_r__c)
                    {
                //  sendEmail.sendEmail(memberBadge.lead_lookup_m__c, memberBadge.Id, accountType);
                    }
                 }
                   if (accountType.equals('account'))
                 {
                 if (rule.send_email_r__c)
                    {
                 // sendEmail.sendEmail(memberBadge.account_lookup_m__c, memberBadge.Id, accountType);
                    }
                 }
            
             rule.number_of_badges_issued_r__c = (rule.number_of_badges_issued_r__c == null) ? 1 : rule.number_of_badges_issued_r__c + 1;
             rule.date_last_issued_r__c = system.now();
             update rule;
             
     
}
        } catch (DMLException e) {
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, 'Error creating Member Badge.'));
        }
   
}
public static member_badge__c newMemberBadge(SObject sobj, badge_rules__c rule, badge__c badge, String accountType) {

    Id accountID = sobj.id;
//check to see if rule and account number already exists in member badges//
 try {
         //List<member_badge__c> memberBadges = [Select Id from member_badge__c where badge_lookup_m__c = : badge.id and account_type_m__c = :accountType and
         //lookup_id_m__c = :accountID LIMIT 1];
         
         //this check should be done a level up, in the trigger.
         //if (memberBadges.isEmpty()) {
         if(true){

         
          member_badge__c memberBadge = new member_badge__c();

        memberBadge.criteria_m__c = badge.criteria__c;
         memberBadge.description_m__c = badge.description__c;
          memberBadge.document_id_m__c = badge.document_id__c;
           memberBadge.expires_in_m__c = badge.expires_in__c;
           memberBadge.badge_lookup_m__c = badge.id ;
           
             memberBadge.is_giveable_m__c = badge.is_giveable__c;
              memberBadge.short_description_m__c = badge.short_description__c;
              memberBadge.title_m__c = badge.title__c;
              memberBadge.lookup_id_m__c = accountID;
                memberBadge.account_type_m__c = accountType;
                
                 memberBadge.evidence_id_m__c = rule.evidence_id_r__c;
                 memberBadge.evidence_name_m__c = rule.evidence_name_r__c;
                 memberBadge.evidence_url_m__c = rule.evidence_url_r__c;
                 memberBadge.testimonial_m__c = rule.testimonial_r__c;
                 
                 String name = (String) sobj.get('name');
                 memberBadge.name_m__c = name;
                if (accountType.equals('account'))
                 {
                 //memberBadge.name_m__c = acct.Name;
                 memberBadge.account_lookup_m__c = accountID;
                 }
                 if (accountType.equals('contact'))
                 {
                 //memberBadge.name_m__c = cont.Name;
                 memberBadge.contact_lookup_m__c = accountID;
                 }
                  if (accountType.equals('lead'))
                 {
                 //memberBadge.name_m__c = lead.Name;
                 memberBadge.lead_lookup_m__c = accountID;
                 }
            
             memberBadge.issue_date_m__c = system.today();
            //insert memberBadge;
              if (accountType.equals('contact'))
                 {
                 if (rule.send_email_r__c)
                    {
                      //sendEmail.sendEmail(memberBadge.contact_lookup_m__c, memberBadge.Id, accountType);
                    }
                 }
                   if (accountType.equals('lead'))
                 {
                 if (rule.send_email_r__c)
                    {
                      //sendEmail.sendEmail(memberBadge.lead_lookup_m__c, memberBadge.Id, accountType);
                    }
                 }
                   if (accountType.equals('account'))
                 {
                 if (rule.send_email_r__c)
                    {
                      //sendEmail.sendEmail(memberBadge.account_lookup_m__c, memberBadge.Id, accountType);
                    }
                 }
            
             //Now done in the trigger(s);
             //rule.number_of_badges_issued_r__c = (rule.number_of_badges_issued_r__c == null) ? 1 : rule.number_of_badges_issued_r__c + 1;
             //rule.date_last_issued_r__c = system.now();
             //update rule;
             
             return memberBadge;
     
}
    return null;
        } catch (DMLException e) {
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, 'Error creating Member Badge.'));
            return null;
        }
   
}
}