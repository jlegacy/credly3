global class batchGetCredlyBadges implements 
   Database.Batchable<sObject>,Database.AllowsCallouts {

   global final String query;
   
   global Database.QueryLocator start(Database.BatchableContext BC){
   	  String query = 'select Name from synchBadgeDriver__c';
      return Database.getQueryLocator(query);
   }
   
   global void execute(
                Database.BatchableContext BC, 
                List<synchBadgeDriver__c> scope){
    	
                	getBadges(scope);
   }
   
   global void finish(Database.BatchableContext BC){
       AsyncApexJob a = 
           [SELECT Id, Status, NumberOfErrors, JobItemsProcessed,
            TotalJobItems, CreatedBy.Email, ExtendedStatus
            FROM AsyncApexJob WHERE Id =
            :BC.getJobId()];
                          
       // Send an email to the Apex job's submitter 
       //   notifying of job completion. 
       Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
       String[] toAddresses = new String[] {a.CreatedBy.Email};
       mail.setToAddresses(toAddresses);
       mail.setSubject('Get Badges Synch Status: ' + a.Status);
       mail.setPlainTextBody
       ('The batch Apex job processed ' + a.TotalJobItems +
       ' batches with '+ a.NumberOfErrors + ' failures.');
       
       try{
	Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
	}
	catch(System.EmailException ex){
      // This message should be added to the page, 
      // as an exception is caught
    }
   }
   
    public void getBadges(List<synchBadgeDriver__c> scope)
   {
    	 for (synchBadgeDriver__c s :scope)
    	 {
    	 String idKey;
    	 String returnData;
	 	 Integer value;
	 	  List < badge__c > currentBadges = [Select lastmodifieddate, credlyBadgeId__c from badge__c];
	 	  Map<String, Integer> foundHitIds = new Map<String, Integer>(); 
        
        //put all current badges in list for lookup 
        for (badge__c y: currentBadges)
        {
             idKey = y.credlyBadgeId__c;
             value = foundHitIds.get(idKey);
             value = (value == null) ? 1 : value + 1;
             foundHitIds.put(idKey,value);
        }
        if (test.isRunningTest()) { 
        returnData = '{ "meta": { "status_code": 200, "status": "OK", "message": "", "more_info": null }, "data": [ { "id": 1, "title": "Greeen Award", "short_description": "", "image_url": "https://credlyapp.s3.amazonaws.com/badges/3b3d21d455ba2c91aed060c8c2225542.png", "is_giveable": false, "created_at": "Tue, 04 Dec 2012 23:48:38 -0500", "creator_id": 2, "resources": { "url": "https://apistaging.credly.com/v0.2/badges/1" } } ], "paging": { "page": 1, "per_page": 1, "order_direction": "ASC", "total_results": 858, "resources": { "next": "https://apistaging.credly.com/v0.2/badges?page=2&per_page=1&order_direction=ASC" } } }';	
        }
        else
        {
	 	
    returnData = CredlyJSONCalls.getCredly(CredlyJSONCalls.getURL()+ 'badges?page=' + s.Name.trim() + '&per_page=2500&order_direction=ASC' );
        }
   String description = ' ';
 List<badge__c> credlyBadges = new List<badge__c>();
 
   Map<String, Object> m = (Map<String, Object>) JSON.deserializeUntyped(returnData);
     List<Object> dataItems = (List<Object>)m.get('data');
      Integer counter = 0;
      if (dataItems != null)
      {
      for (Object item : dataItems) {
      	badge__c insertBadges = new badge__c();
        Map<String, Object> i = (Map<String, Object>)item;
        insertBadges.document_id__c = string.valueof(i.get('image_url'));
        
         insertBadges.criteria__c = ''; 
         insertBadges.description__c = ''; 
         insertBadges.expires_in__c = 319999999;  
         insertBadges.is_giveable__c = string.valueof(i.get('is_giveable')); 
         
         if (i.get('short_description')  == null)
         {
         	insertBadges.short_description__c = 'none';	
         }
         else
         {
         	insertBadges.short_description__c = string.valueof(i.get('short_description'));	
         }
         
         insertBadges.title__c = string.valueof(i.get('title'));
         insertBadges.credlyBadgeId__c = string.valueof(i.get('id'));
         
         //lookup badge,if already exists then do not add/synch
         
          idKey = string.valueof(i.get('id'));
          value = foundHitIds.get(idKey);
         
         if (value == null)
         {
         credlyBadges.add(insertBadges);
         }
    }
      }
    	insert credlyBadges;
   }
   
}
 }