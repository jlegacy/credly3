global class schedulerSynchMemberBadgeClass implements Schedulable{   
    
    public Id recordId;
    
    global void execute(SchedulableContext ctx){ 
        try{
            if(!Test.isRunningTest()){
                //Check Logic type matches with Logic 1 or Logic 2.
                      batchSyncMemberBadgesAll b = new batchSyncMemberBadgesAll();
                    //Schedule Class trigger id is stored in order to abort it before the start of next Schedule Class
                //    b.recordId = recordId;
                 //   b.idcron = ctx.getTriggerId();    
                   Database.executeBatch(b, 1);         
            }
        }catch(exception ex){}  
    }
}