trigger setBadgeName on badge__c (before insert, before update) {

if(Trigger.isInsert){
    for(badge__c b : trigger.new) b.name = b.title__c;
}
else if(Trigger.isUpdate){
    for(badge__c b : trigger.new){
        if(b.name != b.title__c) b.name = b.title__c;
    }
}
}