@isTest(seeAllData=true)
public with sharing class testCredlyJSONCalls {

	static testMethod void createURLString(){
		       Map<String, String> mBadge = new Map<String, String>();
       mBadge.put('attachment', 'test'); 
       mBadge.put('title', 'title');
      mBadge.put('short_description', 'short_description'); 
       mBadge.put('description', 'description'); 
       mBadge.put('categories',  ' '); 
       mBadge.put('criteria', 'criteria'); 
       mBadge.put('is_giveable', 'is_giveable'); 
       mBadge.put('expires_in', 'is_expirePeriod'); 
       mBadge.put('access_token','securityToken'); 
       
        testRequestHTTPMock fakeResponse = new testRequestHTTPMock(200,
                                                 'Complete',
                                                 '{"meta":{"status_code":200,"status":"OK","message":"","more_info":null},"data":{"token":"7dde435cda3b006441d3ded3d9b2f62e4492c96696c2ecc0a7102e084dd4214c106d458d0fb2c4e4fb3ea9f7248e4d8471743bdf1bf85c17d1bfa1ca1ba6138e"}}',
                                                 null);
	   Test.setMock(HttpCalloutMock.class, fakeResponse);
	   String  returnData =  CredlyJSONCalls.createURLString(mBadge); 
	}
	static testMethod void getURL() {
		testRequestHTTPMock fakeResponse = new testRequestHTTPMock(200,
                                                 'Complete',
                                                 '{"meta":{"status_code":200,"status":"OK","message":"","more_info":null},"data":{"token":"7dde435cda3b006441d3ded3d9b2f62e4492c96696c2ecc0a7102e084dd4214c106d458d0fb2c4e4fb3ea9f7248e4d8471743bdf1bf85c17d1bfa1ca1ba6138e"}}',
                                                 null);
	   Test.setMock(HttpCalloutMock.class, fakeResponse);
	   String  returnData =  CredlyJSONCalls.getURL();
	}
	static testMethod void postCredly() {
		 testRequestHTTPMock fakeResponse = new testRequestHTTPMock(200,
                                                 'Complete',
                                                 '{"meta":{"status_code":200,"status":"OK","message":"","more_info":null},"data":{"token":"7dde435cda3b006441d3ded3d9b2f62e4492c96696c2ecc0a7102e084dd4214c106d458d0fb2c4e4fb3ea9f7248e4d8471743bdf1bf85c17d1bfa1ca1ba6138e"}}',
                                                 null);
		Test.setMock(HttpCalloutMock.class, fakeResponse);
	 String  returnData =  CredlyJSONCalls.postCredly('test', 'test');
		
	
	}
	static testMethod void getCredly() {
		 testRequestHTTPMock fakeResponse = new testRequestHTTPMock(200,
                                                 'Complete',
                                                 '{"meta":{"status_code":200,"status":"OK","message":"","more_info":null},"data":{"token":"7dde435cda3b006441d3ded3d9b2f62e4492c96696c2ecc0a7102e084dd4214c106d458d0fb2c4e4fb3ea9f7248e4d8471743bdf1bf85c17d1bfa1ca1ba6138e"}}',
                                                 null);
		Test.setMock(HttpCalloutMock.class, fakeResponse);
	 String  returnData =  CredlyJSONCalls.getCredly('test');
		
	
	}
	static testMethod void testImage() {
		 testRequestHTTPMock fakeResponse = new testRequestHTTPMock(200,
                                                 'Complete',
                                                 '{"meta":{"status_code":200,"status":"OK","message":"","more_info":null},"data":{"token":"7dde435cda3b006441d3ded3d9b2f62e4492c96696c2ecc0a7102e084dd4214c106d458d0fb2c4e4fb3ea9f7248e4d8471743bdf1bf85c17d1bfa1ca1ba6138e"}}',
                                                 null);
		Test.setMock(HttpCalloutMock.class, fakeResponse);
	 String  returnData =  CredlyJSONCalls.getCredlyImage('https://credlyapp.s3.amazonaws.com/badges/standalone/fe04ea668ad3b755946952657b8abfd0.png');
	}
	
     static testmethod void testAuthentication() {
        testRequestHTTPMock fakeResponse = new testRequestHTTPMock(200,
                                                 'Complete',
                                                 '{"meta":{"status_code":200,"status":"OK","message":"","more_info":null},"data":{"token":"7dde435cda3b006441d3ded3d9b2f62e4492c96696c2ecc0a7102e084dd4214c106d458d0fb2c4e4fb3ea9f7248e4d8471743bdf1bf85c17d1bfa1ca1ba6138e"}}',
                                                 null);
		Test.setMock(HttpCalloutMock.class, fakeResponse);
		staticCredlyClass.Token j = staticCredlyClass.getToken(); 
        String  returnData = j.APItoken;
        
       // System.assertEquals(/*check for expected results here...*/);
    }
}