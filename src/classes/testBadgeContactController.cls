@isTest(seeAllData=true)
public  class testBadgeContactController {
	static testMethod void testController() 
	{
		 testRequestHTTPMock fakeResponse = new testRequestHTTPMock(200,
                                                 'Complete',
                                                 '{"meta":{"status_code":200,"status":"OK","message":"","more_info":null},"data":{"token":"7dde435cda3b006441d3ded3d9b2f62e4492c96696c2ecc0a7102e084dd4214c106d458d0fb2c4e4fb3ea9f7248e4d8471743bdf1bf85c17d1bfa1ca1ba6138e"}}',
                                                 null);
		Test.setMock(HttpCalloutMock.class, fakeResponse);
		staticCredlyClass.Token j = staticCredlyClass.getToken(); 
        String  returnData = j.APItoken;
        
        
        BadgeContactController controller = new BadgeContactController(); 
	}
	
	static testMethod void step1()
	{
		  BadgeContactController controller = new BadgeContactController(); 
		  controller.step = 0;
		  controller.nextStep();
	}
	static testMethod void step2()
	{
		  BadgeContactController controller = new BadgeContactController(); 
		
		   controller.step = 1;
		  controller.setBadgeSelect = '';
		    controller.nextStep();	
		    
		     
		  controller.step = 1;
		  controller.setBadgeSelect = '12345';
		   controller.xSelectedIDs = '';
		    controller.nextStep();	
		    
		      controller.step = 1;
		  controller.setBadgeSelect = '12345';
		   controller.xSelectedIDs = '12345';
		    controller.nextStep();	
		    
		    
		
	}
	
	
	
	static testMethod void showRecipients(){
		 BadgeContactController controller = new BadgeContactController(); 
		controller.showRecipients();
		
	}
	
//	static testMethod void step3()
//	{
	//	  BadgeContactController controller = new BadgeContactController(); 
	//	  controller.xSelectedIDs = '';
	//	  controller.step = 2;
	//	   controller.nextStep();
		   
		
	//}
	
	//static testMethod void step4()
//	{
//		  BadgeContactController controller = new BadgeContactController(); 
//
//		 controller.xSelectedRecipients = '';
//		  controller.step = 3;
//		 controller.nextStep();
///		 
//		  controller.xSelectedRecipients = '12345';
//		  controller.step = 3;
	//	 controller.nextStep(); 
		 
		 
//	}
	static testMethod void step5()
	{
		  BadgeContactController controller = new BadgeContactController(); 
		  controller.step = 4;
		   controller.nextStep();	
	}
	static testMethod void step6()
	{
		  BadgeContactController controller = new BadgeContactController(); 
		  controller.xSelectedIDs = '';
		  controller.step = 0;
		  controller.setBadgeSelect = '12345';	
	}
	
	
	static testMethod void testGetSet() 
	{
		 testRequestHTTPMock fakeResponse = new testRequestHTTPMock(200,
                                                 'Complete',
                                                 '{"meta":{"status_code":200,"status":"OK","message":"","more_info":null},"data":{"token":"7dde435cda3b006441d3ded3d9b2f62e4492c96696c2ecc0a7102e084dd4214c106d458d0fb2c4e4fb3ea9f7248e4d8471743bdf1bf85c17d1bfa1ca1ba6138e"}}',
                                                 null);
		Test.setMock(HttpCalloutMock.class, fakeResponse);
		staticCredlyClass.Token j = staticCredlyClass.getToken(); 
        String  returnData = j.APItoken;
        
        
    
        BadgeContactController controller = new BadgeContactController(); 
        controller.emailChecked = true;
        controller.customMessageChecked = true;
        controller.customMessage = 'test';
        controller.description = 'test';
        controller.detailsBlock = true;
        controller.setTestimonialEmpty();
        controller.backStep();
        controller.renderStep1 = true;
         controller.renderStep2 = true;
          controller.renderStep3 = true;
           controller.renderStep4 = true;
            controller.renderStep5 = true;
            controller.criteria = 'test';
            controller.expires_in = 99999;
            controller.filterBadge = 'test';
            controller.filterBadgeSearch = 'test';
            controller.filterName = 'test';
            controller.filterNameSearch = 'test';
              controller.renderFilters = true;
                controller.renderBadges = true;
                  controller.renderUpload = true;
                    controller.renderStep5 = true;
                      controller.renderAccounts = true;
                        controller.renderLeads = true;
                          controller.renderContacts = true;
                          controller.setBadgeSelectImage = 'test';
                          controller.setBadgeSelectTitle = 'test';
                          controller.setTestimonialEmpty();
                          controller.setTestimonialSelect = 'test';
                          
                          	 List < CredlyJSON2ApexMyBadges.Data > myCredlyBadges; 
		 set < String > myCredlyBadgeIDs ;
		 set < String > mySalesForceCredlyBadgeIDs;
                          
                           myCredlyBadges = staticCredlyClass.getMyBadgesFromCredly();
        myCredlyBadgeIDs = staticCredlyClass.getCredlyBadgeIdsFromData(myCredlyBadges);
        mySalesForceCredlyBadgeIDs = staticCredlyClass.getCredlyBadgeIDsFromSalesforce();
        
        controller.reloadFields();
        controller.createRecipientsController();
        controller.setSortController();

	}
	
	static testMethod void dmlOperation()
	{
		   BadgeContactController controller = new BadgeContactController(); 
		   controller.dmlOperation();
		
	}
	
	/*static testMethod void testMethods() 
	{
     testRequestHTTPMock fakeResponse = new testRequestHTTPMock(200,
                                                 'Complete',
                                                 '{"meta":{"status_code":200,"status":"OK","message":"","more_info":null},"data":{"token":"7dde435cda3b006441d3ded3d9b2f62e4492c96696c2ecc0a7102e084dd4214c106d458d0fb2c4e4fb3ea9f7248e4d8471743bdf1bf85c17d1bfa1ca1ba6138e"}}',
                                                 null);
		Test.setMock(HttpCalloutMock.class, fakeResponse);
		staticCredlyClass.Token j = staticCredlyClass.getToken(); 
       
        
    
        BadgeContactController controller = new BadgeContactController(); 
        controller.closeBadge();
        controller.createMemberBadgesApex();
        controller.captureChecks();
        controller.getAccounts();
        controller.getBadges();
        controller.getContacts();
        controller.getAccounts();
        controller.getDropBadges();
        controller.getLeads();
        controller.xRecordType = 'Account';
        controller.renderPage();
        controller.xRecordType = 'Contact';
         controller.renderPage();
         controller.xRecordType = 'Lead';
          controller.renderPage();
          
           controller.getRecordTypes();
        controller.xSelectedIDs = ' ';
        controller.setBadgeSelect = 'test';
     
   
        controller.searchBadge();
        controller.setBadgeIdEmpty();
        controller.showConfirm();
         controller.showReview();
          controller.showUploadOnly();
          controller.xSelectedIDs = null;
          controller.showUploadOnly();
         controller.xSelectedIDs = '1,2,3,4';
        controller.showUploadOnly();
        controller.getRecordTypes();
        controller.getSelectedItem();
        controller.filterNameSearch = 'test';
	}*/
	
	static testMethod void testUpload() 
	{
		 testRequestHTTPMock fakeResponse = new testRequestHTTPMock(200,
                                                 'Complete',
                                                 '{"meta":{"status_code":200,"status":"OK","message":"","more_info":null},"data":{"token":"7dde435cda3b006441d3ded3d9b2f62e4492c96696c2ecc0a7102e084dd4214c106d458d0fb2c4e4fb3ea9f7248e4d8471743bdf1bf85c17d1bfa1ca1ba6138e"}}',
                                                 null);
		Test.setMock(HttpCalloutMock.class, fakeResponse);
		staticCredlyClass.Token j = staticCredlyClass.getToken(); 
        String  returnData = j.APItoken;
       
        
		BadgeContactController controller = new BadgeContactController(); 
		//create fake badge for testing//
		badge__c myNewBadge = new badge__c();
	
            myNewBadge.description__c = 'testOnlyLong';
            myNewBadge.expire_number__c = 0;
            myNewBadge.expire_period__c = 'NEVER';

            myNewBadge.is_giveable__c = 'true';
            myNewBadge.categories__c = 'test1,test2,test3';

            myNewBadge.short_description__c = 'testOnlyShort';
            myNewBadge.title__c = 'josephTestingOnly';

            myNewBadge.document_id__c = 'https://credlyapp.s3.amazonaws.com/badges/5c51479bc27446c205810bcbf9dee3e4.png';
        
            myNewBadge.credlyBadgeId__c = '99999';
           insert myNewBadge;
		
       //set up fake accounts//
       
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
        
          controller.GetName('contact', accContact.id);
          controller.GetName('account', accAccount.id);
         controller.GetName('lead', accLead.id);
       
    //   system.debug(accContact.id);
       
          ApexPages.StandardSetController sc;
          sc = controller.getContact;
          sc = controller.getAccount;
          sc = controller.getLead;
          
          controller.setBadgeSelect = myNewBadge.id;
          controller.setRuleText = 'name:name|ct|j~name:name|ct|j';
      
     		 controller.xSelectedIDs = accContact.id;
              controller.xRecordType = 'contact';
               controller.setTypeSelect = 'contact';
              controller.populateRecordType = 'contact';
              controller.selectedRecordType = 'contact';
               controller.upload();
                controller.editRecipients();
               
                controller.xSelectedIDs = accAccount.id;
               controller.xRecordType = 'account';
                controller.setTypeSelect = 'account';
           controller.populateRecordType = 'account';
           controller.selectedRecordType = 'account';
                controller.upload();
           controller.editRecipients();
                
             controller.xSelectedIDs = accLead.id;
               controller.xRecordType = 'lead';
                controller.setTypeSelect = 'lead';
          controller.populateRecordType = 'lead';
          controller.selectedRecordType = 'lead';
                controller.upload();
          controller.editRecipients();
            
	}
	
	static testMethod void setBadgeIdEmpty()
	{
		  BadgeContactController controller = new BadgeContactController();
		controller.setBadgeIdEmpty();
	}
	
	static testMethod void showUploadOnly()
	{
		  BadgeContactController controller = new BadgeContactController();
		  
		  controller.setRuleText = null;
		controller.showUploadOnly();
		
		 controller.setRuleText = 'test';
		 controller.xSelectedIDs = 'test';
		controller.showUploadOnly();
	}
	
	static testMethod void setPopulateRecordType()
	{
		  BadgeContactController controller = new BadgeContactController();
		controller.setPopulateRecordType('test');
	}
	
	static testMethod void getPopulateRecordType()
	{
		  BadgeContactController controller = new BadgeContactController();
		controller.getPopulateRecordType();
	}
	static testMethod void showConfirm()
	{
		  BadgeContactController controller = new BadgeContactController();
		controller.showConfirm();
	}
	
	static testMethod void searchBadge()
	{
		  BadgeContactController controller = new BadgeContactController();
		controller.searchBadge();
	}
	
	static testMethod void renderPage()
	{
		  BadgeContactController controller = new BadgeContactController();
		  controller.recordType = 'Account';
		controller.renderPage();
		
		 controller.recordType = 'Contact';
		controller.renderPage();
		
		 controller.recordType = 'Lead';
		controller.renderPage();
	}
	
	static testMethod void getRecordTypes()
	{
		  BadgeContactController controller = new BadgeContactController();
		  controller.getRecordTypes();
	}
	
	
}