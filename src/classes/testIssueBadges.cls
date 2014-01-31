@isTest(seeAllData=true)
public  class testIssueBadges {
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
                          
            
        
        
        
	}
	
	static testMethod void testMethods() 
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
        controller.getCheckIt();
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
        
        controller.step = 0;
        controller.nextStep();
        controller.xSelectedIDs = ' ';
        controller.setBadgeSelect = 'test';
        controller.nextStep();
        controller.nextStep();
        controller.nextStep();
        controller.nextStep();
        
          controller.backStep();
         controller.backStep();
         controller.backStep();
          controller.backStep();
          controller.backStep();
        
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
	}
	
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
       controller.setBadgeSelect = 'a01i00000084HQUAA2'; 
        
       controller.GetName('contact', '123');
       controller.GetName('account', '123');
          controller.GetName('lead', '123');
          ApexPages.StandardSetController sc;
          sc = controller.getContact;
          sc = controller.getAccount;
          sc = controller.getLead;
      //    controller.getContact
      
     		 controller.xSelectedIDs = '003i000000Qw9iSAAR';
              controller.xRecordType = 'contact';
               controller.upload();
               
                controller.xSelectedIDs = '001i000000TM30RAAT';
               controller.xRecordType = 'account';
                controller.upload();
                
              
                controller.xSelectedIDs = '00Qi0000007QIh4EAG';
               controller.xRecordType = 'lead';
                controller.upload();
            
	}
	
	
	

}