@isTest 
public class testCustomBadgeController {
		static testMethod void testDMLController()
	{
        CustomBadgeController controller = new CustomBadgeController(); 
        controller.dmlOperation();
	}
	
	
	static testMethod void testController() 
	{
        testRequestHTTPMock fakeResponse = new testRequestHTTPMock(200,
                                                 'Complete',
                                                 '{"meta":{"status_code":200,"status":"OK","message":"","more_info":null},"data":{"token":"7dde435cda3b006441d3ded3d9b2f62e4492c96696c2ecc0a7102e084dd4214c106d458d0fb2c4e4fb3ea9f7248e4d8471743bdf1bf85c17d1bfa1ca1ba6138e"}}',
                                                 null);
		Test.setMock(HttpCalloutMock.class, fakeResponse);
		
		 staticCredlyClass.Token j = staticCredlyClass.getToken(); 
        String  returnData = j.APItoken;
        
        CustomBadgeController controller = new CustomBadgeController(); 
	}
	
	static testMethod void testFunctions()
	{
		 CustomBadgeController controller = new CustomBadgeController(); 
		 
		
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
        
            myNewBadge.credlyBadgeId__c = '13114';
           insert myNewBadge;
		  controller.xCredlyBadgeId = '13114';
		  

		 controller.gotoEditController();
		 
		
	}
	static testMethod void testSetPagingInfo()
	{
		CustomBadgeController controller = new CustomBadgeController(); 
		controller.setPagingInfo(10);
	}
	
		static testMethod void testNext()
	{
		CustomBadgeController controller = new CustomBadgeController(); 
		controller.next();
	}
	
		static testMethod void testPrev()
	{
		CustomBadgeController controller = new CustomBadgeController(); 
		controller.prev();
	}
	
	
	
		static testMethod void testSetImageAction()
	{
		CustomBadgeController controller = new CustomBadgeController(); 
		controller.setImageAction();
	}
	
static testMethod void testGetUploadTypes()
	{
		CustomBadgeController controller = new CustomBadgeController(); 
		controller.getUploadTypes();
	}
	
	static testMethod void testSetUploadAction()
	{
		CustomBadgeController controller = new CustomBadgeController(); 
		controller.setUploadAction();
	}
	
	static testMethod void testsearchBadge()
	{ 	//create fake badge for testing//
		badge__c myNewBadge = new badge__c();
	
            myNewBadge.description__c = 'testOnlyLong';
            myNewBadge.expire_number__c = 0;
            myNewBadge.expire_period__c = 'NEVER';

            myNewBadge.is_giveable__c = 'true';
            myNewBadge.categories__c = 'test1,test2,test3';

            myNewBadge.short_description__c = 'testOnlyShort';
            myNewBadge.title__c = 'josephTestingOnly';

            myNewBadge.document_id__c = 'https://credlyapp.s3.amazonaws.com/badges/5c51479bc27446c205810bcbf9dee3e4.png';
        
            myNewBadge.credlyBadgeId__c = '13114';
           insert myNewBadge;
		
		CustomBadgeController controller = new CustomBadgeController(); 
		controller.myBadges = new List<badge__c>();
		controller.searchBadge();
	}
	
	static testMethod void testsetSortController()
	{
		CustomBadgeController controller = new CustomBadgeController(); 
		controller.setSortController();
	}
	

	static testMethod void testSelectOption() 
	{
		testRequestHTTPMock fakeResponse = new testRequestHTTPMock(200,
                                                 'Complete',
                                                 '{"meta":{"status_code":200,"status":"OK","message":"","more_info":null},"data":{"token":"7dde435cda3b006441d3ded3d9b2f62e4492c96696c2ecc0a7102e084dd4214c106d458d0fb2c4e4fb3ea9f7248e4d8471743bdf1bf85c17d1bfa1ca1ba6138e"}}',
                                                 null);
		Test.setMock(HttpCalloutMock.class, fakeResponse);
		
        staticCredlyClass.Token j = staticCredlyClass.getToken(); 
        String  returnData = j.APItoken;
        
        CustomBadgeController controller = new CustomBadgeController();     
        controller.getExpirePeriods();
        
        controller.getGiveableTypes();
        controller.incrementCounter();
        controller.addBadge(); 
        controller.getExpireNumbers();
        controller.passBadgeImageParms();
        controller.addBlock = true;
        controller.counter = 5;
       controller.closeBadge();
       
      
        controller.title = 'test';
        controller.short_description = 'test';
         controller.criteria = 'test';
          controller.is_giveable = 'test';
          controller.expires_in = 1;
          controller.addBlock = true;
          controller.detailsBlock = true;
         
         
	}
	
	static testMethod void testSetsGets()
	{
		testRequestHTTPMock fakeResponse = new testRequestHTTPMock(200,
                                                 'Complete',
                                                 '{"meta":{"status_code":200,"status":"OK","message":"","more_info":null},"data":{"token":"7dde435cda3b006441d3ded3d9b2f62e4492c96696c2ecc0a7102e084dd4214c106d458d0fb2c4e4fb3ea9f7248e4d8471743bdf1bf85c17d1bfa1ca1ba6138e"}}',
                                                 null);
		Test.setMock(HttpCalloutMock.class, fakeResponse);
		
		staticCredlyClass.Token j = staticCredlyClass.getToken(); 
        String  returnData = j.APItoken;
       
        
		 CustomBadgeController controller = new CustomBadgeController();     
		controller.addBlock = true;
        controller.counter = 5;
      
        controller.title = 'test';
        controller.short_description = 'test';
         controller.criteria = 'test';
          controller.is_giveable = 'test';
          controller.expires_in = 1;
          controller.addBlock = true;
          controller.detailsBlock = true;
          controller.setGiveable('true');
          controller.filterBadgeSearch = 'test';
	}
	
	
	static testMethod void insertBadge()
	{
		testRequestHTTPMock fakeResponse = new testRequestHTTPMock(200,
                                                 'Complete',
                                                 '{"meta":{"status_code":200,"status":"OK","message":"","more_info":null},"data":{"token":"7dde435cda3b006441d3ded3d9b2f62e4492c96696c2ecc0a7102e084dd4214c106d458d0fb2c4e4fb3ea9f7248e4d8471743bdf1bf85c17d1bfa1ca1ba6138e"}}',
                                                 null);
		Test.setMock(HttpCalloutMock.class, fakeResponse);
		staticCredlyClass.Token j = staticCredlyClass.getToken(); 
        String  returnData = j.APItoken;
  
		 
		CustomBadgeController controller = new CustomBadgeController(); 
		     
		   controller.criteria = 'test';
        controller.description = 'test';
         controller.is_expireNumber = '0';
          controller.is_expirePeriod = 'never';
          controller.xiconId = '3444';         

          controller.is_giveable = 'true';
         
            controller.short_description = 'test';
               controller.title = 'testAutoTest';
            controller.xbadgeURL = 'https://credlyapp.s3.amazonaws.com/badges/standalone/9d75a019fdf0a49099b63de1b059e9f0.png';
		 controller.upload();
		
	}
	
	}