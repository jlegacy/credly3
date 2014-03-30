@isTest(seeAllData=true)
public with sharing class testBatchSyncMemberBadges {
	 static testmethod void test() {
        // The query used by the batch job. 
        
       Test.startTest(); 
       //insert test member badge
       	Account accAccount = new Account(Name='testJoseph');
       	insert accAccount;
    	
    	   Contact accContact = new Contact();
    	   accContact.FirstName = 'testJoseph';
    	   accContact.LastName = 'testlegacy';
    	   accContact.email ='legacy@starfishenterprise.net';
    		insert accContact;
    	
    	   Lead accLead = new Lead();
    	   accLead.FirstName = 'testJoseph';
    	   accLead.LastName = 'testlegacy';
    	   accLead.email ='legacy@starfishenterprise.net';
    	   accLead.company = 'test';
    		insert accLead;
        
        
       member_badge__c myMember = new member_badge__c();
       myMember.expires_in_m__c = 0;
       myMember.evidence_url_m__c = 'http://www.google.com';
       myMember.account_lookup_m__c = accAccount.id;
        myMember.name_m__c = 'joseph,legacy';
       insert myMember;
       
         batchSyncMemberBadges b = new batchSyncMemberBadges();
                    //Schedule Class trigger id is stored in order to abort it before the start of next Schedule Class
                    b.recordId = myMember.id;
                    b.idcron = myMember.id;    
                   Database.executeBatch(b, 1);    
         
        myMember = new member_badge__c();
       myMember.expires_in_m__c = 0;
       myMember.evidence_url_m__c = 'http://www.google.com';
       myMember.contact_lookup_m__c = accContact.id;
        myMember.name_m__c = 'joseph,legacy';
       insert myMember;         
        
                    //Schedule Class trigger id is stored in order to abort it before the start of next Schedule Class
                    b.recordId = myMember.id;
                    b.idcron = myMember.id;    
                   Database.executeBatch(b, 1);    
                   
       myMember = new member_badge__c();
       myMember.expires_in_m__c = 0;
       myMember.evidence_url_m__c = 'http://www.google.com';
       myMember.lead_lookup_m__c = accLead.id;
       myMember.name_m__c = 'joseph,legacy';
       insert myMember;               
       
                    //Schedule Class trigger id is stored in order to abort it before the start of next Schedule Class
                    b.recordId = myMember.id;
                    b.idcron = myMember.id;    
                   Database.executeBatch(b, 1);    
       Test.stopTest();

	 }
    

}