global class batchSyncBadges implements
   Database.Batchable<sObject>,Database.AllowsCallouts {

   global final String query;
   
   global Database.QueryLocator start(Database.BatchableContext BC){
   	  String query = 'select criteria__c, description__c,categories__c, expires_in__c, is_giveable__c, short_description__c,title__c, image__c, document_ID__c, credlyBadgeId__c, upload_file_id__c from badge__c where credlyBadgeId__c = null';
      return Database.getQueryLocator(query);
   }
   
   global void execute(
                Database.BatchableContext BC, 
                List<badge__c> scope){
                	synchBadge(scope);
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
       mail.setSubject('Badge Synch Status: ' + a.Status);
       mail.setPlainTextBody
       ('The batch Apex job processed ' + a.TotalJobItems +
       ' batches with '+ a.NumberOfErrors + ' failures.');
       
       try{
	Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
	}
	catch(System.EmailException ex){
      // This message should be added to the page, 
      // as an exception is caught
      system.debug(ex);
    }
   }
   
    public void synchBadge(List<badge__c> scope)
   {
     Double y;
  	String returnData;
  	String createURL;
  	String badgeID;
  	String errMessage;
  	String stsMessage;
  	String encodedImage; 
  	String xbadgeURL;
  	String securityToken;
  	
  	    if (test.isRunningTest()) { 
  	     	securityToken = 'test';
  	     }
  	     else
  	     {
  	     	
  	    staticCredlyClass.Token j = staticCredlyClass.getToken(); 
      
 	     securityToken = j.APItoken;
 //	system.debug(securityToken);
  	     }
     List<badge__c> badgeList = new List<badge__c>();
    for (badge__c badge : scope) {
    // get the image data
     	
     	if (badge.upload_file_id__c == null)
     	{
     		 if (test.isRunningTest()) { 
     		 encodedImage = 'test';	
     		 }
     		 else
     		 {
     		encodedImage = CredlyJSONCalls.getCredlyImage(badge.document_id__c);
     		 }	
     	}
     	else
     	{
     	encodedImage = CredlyJSONCalls.getDocumentBlob(badge.upload_file_id__c);	
     	}
     
        if (encodedImage != null && securityToken != null)
        {
        // Build Credly Badge //
       Map<String, String> mBadge = new Map<String, String>();
       mBadge.put('attachment', encodedImage); 
       mBadge.put('title', badge.title__c);
       mBadge.put('short_description', badge.short_description__c = (badge.short_description__c == null) ? ' ' : badge.short_description__c); 
       mBadge.put('description', badge.description__c = (badge.description__c == null) ? ' ' : badge.description__c); 
       mBadge.put('categories',   badge.categories__c = (badge.categories__c == null) ? ' ' : badge.categories__c); 
       mBadge.put('criteria', badge.criteria__c = (badge.criteria__c == null) ? ' ' : badge.criteria__c); 
       mBadge.put('is_giveable', badge.is_giveable__c = (badge.is_giveable__c == null) ? ' ' : badge.is_giveable__c); 
       mBadge.put('expires_in', staticCredlyClass.ToString(badge.expires_in__c, false)); 
        mBadge.put('access_token',securityToken);   
        
        createURL = CredlyJSONCalls.createURLString(mBadge); 
       
           //post badge to credly
           
             if (test.isRunningTest()) {
           	returnData = '{"meta": {"status_code": 200,"status": "OK","message": "","more_info": null},"data": 1408}';
           }
           else
           {
           	system.debug(CredlyJSONCalls.getURL()+ 'badges');
         returnData = CredlyJSONCalls.postCredly(CredlyJSONCalls.getURL()+ 'badges', createURL);  
           }
        
          //parseResults
         CredlyJSON2ApexErrors obj = CredlyJSON2ApexErrors.parse(returnData);
     	if (obj.meta.status.compareTo('OK') == 0)
     	  	{
     	     CredlyJSON2ApexBadge obj2 = CredlyJSON2ApexBadge.parse(returnData);
      	  	 badge.credlyBadgeId__c = String.valueOf(obj2.data);
      	  	 badgeList.add(badge);
     	  	} 
        }
   }
   
    update badgeList;
 
   }
   
}