@isTest(seeAllData=true)
public with sharing class testBatchGetCredlyBadges {
	 static testmethod void test() {
        // The query used by the batch job. 
        
        
        
       Test.startTest(); 
       testRequestHTTPMock fakeResponse = new testRequestHTTPMock(200,
                                                 'Complete',
                                                 '{ "meta": { "status_code": 200, "status": "OK", "message": "", "more_info": null }, "data": [ { "id": 1, "title": "Greeen Award", "short_description": "", "image_url": "https://credlyapp.s3.amazonaws.com/badges/3b3d21d455ba2c91aed060c8c2225542.png", "is_giveable": false, "created_at": "Tue, 04 Dec 2012 23:48:38 -0500", "creator_id": 2, "resources": { "url": "https://apistaging.credly.com/v0.2/badges/1" } } ], "paging": { "page": 1, "per_page": 1, "order_direction": "ASC", "total_results": 858, "resources": { "next": "https://apistaging.credly.com/v0.2/badges?page=2&per_page=1&order_direction=ASC" } } }',
                                                 null);
		Test.setMock(HttpCalloutMock.class, fakeResponse);
       batchGetCredlyBadges c = new batchGetCredlyBadges();
       Database.executeBatch(c);
       Test.stopTest();

	 }
    
	

}