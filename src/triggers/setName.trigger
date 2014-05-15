trigger setName on member_badge__c (before insert, before update) {

if(Trigger.isInsert){
    for(member_badge__c mb : trigger.new) mb.name = mb.title_m__c;
}
else if(Trigger.isUpdate){
    for(member_badge__c mb : trigger.new){
        if(mb.name != mb.title_m__c) mb.name = mb.title_m__c;
    }
}

}