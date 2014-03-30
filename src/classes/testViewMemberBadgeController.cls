@isTest(seeAllData=true)
public with sharing class testViewMemberBadgeController {
		static testMethod void testController() 
	{
    
        ViewMemberBadgeController controller = new ViewMemberBadgeController(); 
        controller.dmlOperation();
	}
	
		static testMethod void testNext()
	{
		ViewMemberBadgeController controller = new ViewMemberBadgeController(); 
	
		controller.badgeOffset = 5;
		controller.pageLimit = 5;
		controller.currentBadgePage = 5;
		controller.numberOfBadgePages = 1;
		controller.nextBadge();
		
	}
		static testMethod void testPrev()
	{
		ViewMemberBadgeController controller = new ViewMemberBadgeController();
		controller.badgeOffset = 5;
		controller.pageLimit = 5; 
		controller.currentBadgePage = 0;
		controller.prevBadge();
	}
	
	static testMethod void testSetsGets()
	{
		String testFilter;
		
		testRequestHTTPMock fakeResponse = new testRequestHTTPMock(200,
                                                 'Complete',
                                                 '{"meta":{"status_code":200,"status":"OK","message":"","more_info":null},"data":{"token":"7dde435cda3b006441d3ded3d9b2f62e4492c96696c2ecc0a7102e084dd4214c106d458d0fb2c4e4fb3ea9f7248e4d8471743bdf1bf85c17d1bfa1ca1ba6138e"}}',
                                                 null);
		Test.setMock(HttpCalloutMock.class, fakeResponse);
		
		staticCredlyClass.Token j = staticCredlyClass.getToken(); 
        String  returnData = j.APItoken;
       
        
		 ViewMemberBadgeController controller = new ViewMemberBadgeController();     
          controller.filterNameSearch = 'test';
          testFilter = controller.filterNameSearch;
	}
	
	
	
	static testMethod void testSetGet() 
	{
    
         ViewMemberBadgeController controller = new ViewMemberBadgeController(); 
        controller.renderAccounts = true;
        controller.renderLeads = true;
        controller.renderContacts = true;
         controller.showAs = 'pdf';
         controller.showExcel = 'excel';
          controller.createExcel();
           controller.createPDF();
       
        
	}
	
		static testMethod void testsetSortController()
	{
		ViewMemberBadgeController controller = new ViewMemberBadgeController(); 
		controller.setSortController();
	}
	
	static testMethod void resetPageLimitController()
	{
		 ViewMemberBadgeController controller = new ViewMemberBadgeController(); 
		 controller.resetPageLimitController();
		 
	
		
	}
	
	
		static testMethod void testMethods() 
	{
		  ViewMemberBadgeController controller = new ViewMemberBadgeController(); 
		  controller.refreshScreenController();
		  controller.getRecordTypes();
		   controller.resetPageLimitController();
		   
		   controller.xSortField = 'All';
		    controller.renderPage();
		    
		     controller.xSortField = 'title';
		    controller.renderPage();
		    
		     controller.xSortField = 'recipient';
		    controller.renderPage();
	}
	
	
	static testMethod void getBadgesTest() 
	{
    
         ViewMemberBadgeController controller = new ViewMemberBadgeController(); 
          ApexPages.StandardSetController getBadge;
          controller.xSortField = 'Email';
         controller.recordType = 'All';
        controller.filterName = '';
     controller.getBadges();
      
        controller.recordType = 'All';
        controller.filterName = 'test';
   controller.getBadges();
     
       controller.recordType = 'title';
        controller.filterName = 'All';
   controller.getBadges();
   
     controller.recordType = 'title';
        controller.filterName = 'test';
   controller.getBadges();
   
     controller.recordType = 'recipient';
        controller.filterName = 'All';
   controller.getBadges();
   
     controller.recordType = 'recipient';
       controller.filterName = 'test';
   controller.getBadges();
   
       controller.recordType = 'category';
        controller.filterName = 'All';
   controller.getBadges();
   
     controller.recordType = 'category';
        controller.filterName = 'test';
   controller.getBadges();
     
	}
	
	static testMethod void testSetPagingInfo()
	{
		ViewMemberBadgeController controller = new ViewMemberBadgeController(); 
		controller.pageLimit = 5;
		controller.setPagingInfo(10);
		
		
		controller.pageLimit = 0;
		controller.setPagingInfo(0);
		
	}
	
	
	
	
	

}