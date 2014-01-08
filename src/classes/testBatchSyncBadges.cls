@isTest(seeAllData=true)
public with sharing class testBatchSyncBadges {
	 static testmethod void test() {
        // The query used by the batch job. 
        
       Test.startTest(); 
       batchSyncBadges c = new batchSyncBadges();
       Database.executeBatch(c);
       Test.stopTest();

	 }
    

}