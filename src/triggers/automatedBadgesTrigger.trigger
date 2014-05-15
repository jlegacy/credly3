trigger automatedBadgesTrigger on badge__c (before insert, before update) {
    for (badge__c c : Trigger.new)
    {
        
if (c.expire_period__c == 'never')
        {
            c.expires_in__c = 0;
        }
        if (c.expire_period__c == 'day')
        {
            c.expires_in__c = integer.valueof(c.expire_number__c) * 86400;
        }
        if (c.expire_period__c == 'week')
        {
             c.expires_in__c = integer.valueof(c.expire_number__c) * 604800;
        }
        if (c.expire_period__c == 'month')
        {
            c.expires_in__c = integer.valueof(c.expire_number__c) * 2630000;
        }
        if (c.expire_period__c == 'year')
        {
            c.expires_in__c = integer.valueof(c.expire_number__c) * 31536000;
        }   

}
}