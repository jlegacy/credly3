public with sharing class synchBadgesController {
      public synchBadgesController () {
      }
      
public PageReference synchBadges() {
    //Send any badges to Credly that have no credlyid
      batchSyncBadges a = new batchSyncBadges();
       Database.executeBatch(a, 8);
       
    //Send any memberbadges to Credly that have no credlymemberid   
        batchSyncMemberBadges b = new batchSyncMemberBadges();
       Database.executeBatch(b, 1);
       
    //Pull any badges from Credly missing in Salesforce   
        batchGetCredlyBadges c = new batchGetCredlyBadges();
        Database.executeBatch(c, 1);
        
        return null;    
     }

}