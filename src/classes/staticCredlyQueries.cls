public with sharing class staticCredlyQueries{
//This class contains the queries used by the Visualforce pages, etc.

public static Id[] getRecipientIDs(String ruleText, String objName) {
        Integer recordCount = 0;
        boolean ruleApplies = false;
        boolean checkHit;


        List < List < String >> parsedRows = new List < List < String >> ();
        List < String > fieldValues = new List < String > ();
        List < String > ids = new List < String > ();

        System.debug(ruleText);
        parsedRows = automatedTriggerClass.unparseRules(ruleText);
        
          //Start LGMK Code
        sObject[] matchingObjects;
        string queryString = 'SELECT Id';
     //   Map<String, Schema.SObjectField> fieldMap = Schema.SObjectType.Account.fields.getMap();
        
        
        
         Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
         Schema.SObjectType accountSchema = schemaMap.get(objName);
          Map<String, Schema.SObjectField> fieldMap = accountSchema.getDescribe().fields.getMap();
        //Populate the query with all of the object fields.
        for(String key : fieldMap.keySet())
        {
             if (fieldMap.get(key).getDescribe().isAccessible())
             {
            if(key.compareTo('id') != 0){
                queryString += (', ' + key);
            }
            }
        
        }
        queryString += ' FROM ' + objName;
        if(parsedRows.isEmpty())
            matchingObjects = Database.query(queryString);
        else{   
        queryString += ' WHERE';
        Boolean isFirst = True;
        //Maps symbol codes to string symbols
        Map<String, String> symMap = automatedTriggerClass.symbolMap();
        
        // For each row: 
        // row[0] = field name
        // row[1] = field type
        // row[2] = operand
        // row[3] = field value
        for(String[] rule : parsedRows)
        {
            if(isFirst) isFirst = False;
            else queryString += ' AND';
            //Add field name to query.
            queryString += ' ' + rule.get(0) + ' ';
            //Add operand to query
            string op = symMap.get(rule.get(2));
            queryString += op + ' ';
            //Add the condition
            //For LIKE to operate like 'contains' we must have wildcards on either side of the expression
            String fieldType = rule.get(1).toLowerCase();
            if(op == 'LIKE') queryString += '\'%' + String.valueOf(rule.get(3)) + '%\'';
            else if(fieldType == 'string' || fieldType == 'picklist' || fieldType == 'textarea' || fieldType == 'email' || fieldType == 'phone') queryString += '\'' + String.valueOf(rule.get(3)) + '\'';
            else if(String.valueOf(rule.get(1)) == 'DATE') queryString += String.valueOf(Date.parse(rule.get(3)));
            else if(String.valueOf(rule.get(1)) == 'DATETIME' ){
                DateTime dt;
                if(rule.get(3).contains('AM') || rule.get(3).contains('PM')) dt = DateTime.parse(rule.get(3));
                else dt = DateTime.parse(rule.get(3) + ' 12:00 AM');
                String qdt = String.valueOf(dt.date()) + 'T' + String.valueOf(dt.time()); // + 'Z'
             queryString += qdt;
             }
            else queryString += String.valueOf(rule.get(3));
        }
        System.debug(queryString);
        //Can add an ORDER BY clause if so desired.
        matchingObjects = Database.query(queryString);
        }
        //End LGMK Code 
        //store ids for future lookup
        ids = automatedTriggerClass.getFieldValues(matchingObjects, 'id');


        return ids;

    }






}