@isTest(seeAllData=true)
public with sharing class testBatchSyncMemberBadges {
	 static testmethod void test() {
        // The query used by the batch job. 
        
       Test.startTest(); 
       batchSyncMemberBadges c = new batchSyncMemberBadges();
       Database.executeBatch(c);
       Test.stopTest();

	 }
    

}