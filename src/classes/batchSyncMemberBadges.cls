global class batchSyncMemberBadges implements 

    
   Database.Batchable<sObject>,Database.AllowsCallouts {
   	
   public id recordId;
   	
   global id idcron; 

   global final String query;
   
   global Database.QueryLocator start(Database.BatchableContext BC){
      String query = 'select id , criteria_m__c, custom_message_m__c, description_m__c, expires_in_m__c, is_visible_m__c, badge_lookup_m__r.credlyBadgeId__c, short_description_m__c,title_m__c, image_m__c, credlyMemberBadge_id_m__c,evidence_m__c, evidence_id_m__c,name_m__c,account_type_m__c,document_ID_m__c,  account_lookup_m__c,contact_lookup_m__c,lead_lookup_m__c, badge_lookup_m__r.title__c,issue_date_m__c, testimonial_m__c, evidence_url_m__c,lead_lookup_m__r.email,contact_lookup_m__r.email, expire_date_m__c from member_badge__c where credlyMemberBadge_id_m__c = null and id = :recordId';
      return Database.getQueryLocator(query);
   }
   
   global void execute(
                Database.BatchableContext BC, 
                List<member_badge__c> scope){
        
                    synchMemberBadge(scope);
   }
   
   global void finish(Database.BatchableContext BC){
       AsyncApexJob a = 
           [SELECT Id, Status, NumberOfErrors, JobItemsProcessed,
            TotalJobItems, CreatedBy.Email, ExtendedStatus
            FROM AsyncApexJob WHERE Id =
            :BC.getJobId()];
            
              //Abort the Schedule Class.
        System.abortjob(idcron);
      
       // Send an email to the Apex job's submitter 
       //   notifying of job completion. 
       Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
       String[] toAddresses = new String[] {a.CreatedBy.Email};
       mail.setToAddresses(toAddresses);
       mail.setSubject('Badge Synch Members Status: ' + a.Status);
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
   
    public void synchMemberBadge(List<member_badge__c> scope)
   {
     Double y;
    String returnData;
    String createURL;
    String badgeID;
    String errMessage;
    String stsMessage;
    String encodedImage; 
    String evidenceImage; 
    String xbadgeURL;
    String securityToken;
    String[] splitName = null;
    String email;
    Integer CredlyID;
    Boolean storeCredly;
    Integer SalesForceCredlyID;
    
     if (test.isRunningTest()) {
         securityToken = 'test'; 
     }
            else
            {
                 staticCredlyClass.Token j = staticCredlyClass.getToken(); 
                securityToken = j.APItoken;
                 
     }
   
    
    List<member_badge__c> memberBadgeList = new List<member_badge__c>();
    
    for (member_badge__c memberBadge : scope) {
   
        if (memberBadge.evidence_id_m__c != null)
        {
        evidenceImage = CredlyJSONCalls.getDocumentBlob(memberBadge.evidence_id_m__c);  
        }
        
        if (memberBadge.evidence_url_m__c != null)
        {
     //   evidenceImage = CredlyJSONCalls.getCredlyImage(memberBadge.evidence_url_m__c );
     //  if (evidenceImage == null)   
     //   {   
     		//evidenceImage = memberBadge.evidence_url_m__c;
     		Boolean result =   memberBadge.evidence_url_m__c.contains('http');
     		if (result == false)
     		{
     			evidenceImage = 'http://' + memberBadge.evidence_url_m__c;
     		}
     		else
     		{
     			evidenceImage = memberBadge.evidence_url_m__c;
     		}
     		
        //    evidenceImage = EncodingUtil.Base64Encode( Blob.valueOf( memberBadge.evidence_url_m__c ) );
     //   }
        }
        
        if (securityToken != null)
        {
           // Build Credly Badge //
       Map<String, String> mBadge = new Map<String, String>();
       mBadge.put('is_visible',memberBadge.is_visible_m__c = (memberBadge.is_visible_m__c == null) ? ' ' : memberBadge.is_visible_m__c); 
       mBadge.put('categories',  memberBadge.categories_m__c = (memberBadge.categories_m__c == null) ? ' ' : memberBadge.categories_m__c); 
       mBadge.put('access_token',securityToken); 
       mBadge.put('badge_id', memberBadge.badge_lookup_m__r.credlyBadgeId__c);
       if (evidenceImage != null)
       {
       mBadge.put('evidence_file', evidenceImage); 
       } 
       splitName = memberBadge.name_m__c.split(',');
            
            if (splitName.size() > 1)
            {
                mBadge.put('last_name',splitName[0]);
                mBadge.put('first_name',splitName[1]); 
            }
            else
            {
                mBadge.put('last_name',memberBadge.name_m__c);
                mBadge.put('first_name',memberBadge.name_m__c); 
            }
            
            CredlyId = 0;
            email = '';
            
            if (memberBadge.account_lookup_m__c != null)
            {
                email = (sendEmail.getEmailAddress(memberBadge.account_lookup_m__c, 'Account') != null) ? sendEmail.getEmailAddress(memberBadge.account_lookup_m__c, 'Account') : ' ';  
                 //Check for Credly ID on SalesForce
            //    CredlyId = staticCredlyClass.getCredlyIDfromSalesForce(memberBadge.account_lookup_m__c, 'Account');
            }
            
              if (memberBadge.contact_lookup_m__c != null)
            {
                email = (sendEmail.getEmailAddress(memberBadge.contact_lookup_m__c, 'Contact') != null) ? sendEmail.getEmailAddress(memberBadge.contact_lookup_m__c, 'Contact') : ' ';  
               //Check for Credly ID on SalesForce
             //   CredlyId = staticCredlyClass.getCredlyIDfromSalesForce(memberBadge.contact_lookup_m__c, 'Contact');
            }
            
                if (memberBadge.lead_lookup_m__c != null)
            {
                email = (sendEmail.getEmailAddress(memberBadge.lead_lookup_m__c, 'Lead') != null) ? sendEmail.getEmailAddress(memberBadge.Lead_lookup_m__c, 'Lead') : ' ';  
              //Check for Credly ID on SalesForce
               // CredlyId = staticCredlyClass.getCredlyIDfromSalesForce(memberBadge.lead_lookup_m__c, 'Lead');
            }
            
            storeCredly = false;

            
           //Check for Credly ID if not found above in Salesforce
            if (CredlyId == 0) 
            {
           CredlyId = CredlyJSONCalls.getCredlyIdsFromCredly(email);
           
           if (CredlyId <> 0)
           {
           if (memberBadge.lead_lookup_m__c != null)
           {
            storeCredly = true;
           }
           if (memberBadge.contact_lookup_m__c != null)
           {
            storeCredly = true;
           }
           if (memberBadge.account_lookup_m__c != null)
           {
            storeCredly = true;
           }
            //Store in SalesForce
            
           }
            
            } 
            
           if (CredlyId <> 0)
          {
            mBadge.put('member_id', String.valueOf(CredlyID)); 
            }
            else
            {
            mBadge.put('email', email); 
            }
            
       mBadge.put('testimonial', memberBadge.testimonial_m__c = (memberBadge.testimonial_m__c == null) ? ' ' : memberBadge.testimonial_m__c);  
       mBadge.put('notify', 'True'); 
       mBadge.put('custom_message',  memberBadge.custom_message_m__c = (memberBadge.custom_message_m__c == null) ? ' ' : memberBadge.custom_message_m__c);  
        mBadge.put('access_token',securityToken); 
        
        createURL = CredlyJSONCalls.createURLString(mBadge);

           if (test.isRunningTest()) {
           returnData = '{\"meta\":{\"status_code\":200,\"status\":\"OK\",\"message\":\"\",\"more_info\":null},\"data\":{\"hashes\":[\"c8c05dedc\"],\"ids\":[104944],\"hash\":\"c8c05dedc\"}}';
           }
           else
           {
             returnData = CredlyJSONCalls.postCredly(CredlyJSONCalls.getURL()+ 'member_badges', createURL);
             system.debug(returnData);
           }
       
          //parseResults
         CredlyJSON2ApexErrors obj = CredlyJSON2ApexErrors.parse(returnData);
        if (obj.meta.status.compareTo('OK') == 0)
            {
             CredlyJSON2ApexMemberBadge obj2 = CredlyJSON2ApexMemberBadge.parse(returnData);
             memberBadge.credlyMemberBadge_id_m__c =  obj2.data.ids[0];
             memberBadgeList.add(memberBadge);
              if (storeCredly == true) 
        {
              if (memberBadge.lead_lookup_m__c != null)
           {
            staticCredlyClass.storeCredlyId(Credlyid, memberBadge.lead_lookup_m__c, 'lead');
           }
           if (memberBadge.contact_lookup_m__c != null)
           {
            staticCredlyClass.storeCredlyId(Credlyid, memberBadge.contact_lookup_m__c, 'contact');
           }
           if (memberBadge.account_lookup_m__c != null)
           {
            staticCredlyClass.storeCredlyId(Credlyid, memberBadge.account_lookup_m__c, 'account');
           }
            
        }
            }
            
       
          
        }
   }
   
    update memberBadgeList;
 
   }
   
    
   
}