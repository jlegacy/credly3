@isTest 
public class testBadges {
	
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
         controller.is_expireNumber = '10000000';
          controller.is_expirePeriod = 'never';
          controller.xiconId = '3444';         

          controller.is_giveable = 'true';
         
            controller.short_description = 'test';
               controller.title = 'testAutoTest';
            controller.xbadgeURL = 'https://credlyapp.s3.amazonaws.com/badges/standalone/9d75a019fdf0a49099b63de1b059e9f0.png';
		 controller.upload();
		
	}
	
	}