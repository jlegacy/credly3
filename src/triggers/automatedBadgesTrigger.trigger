trigger automatedBadgesTrigger on badge__c (before insert, before update) {
	for (badge__c c : Trigger.new)
	{
		
if (c.expire_period__c == 'never')
     	{
     		c.expires_in__c = 10 * 31536000;
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
    //If trigger Update and CredlyBadgeId present, then write to changed table
  /*   if ((Trigger.isUpdate) && (c.credlyBadgeId__c != null))
     	{ 
     		
     	List<chg_badge__c> aa = [select credlyBadgeId_x__c from chg_badge__c where credlyBadgeId_x__c = :c.credlyBadgeId__c];
    
	    if (aa.isEmpty()) {
	    	chg_badge__c insertChange = new chg_badge__c();
	    	insertChange.credlyBadgeId_x__c = c.credlyBadgeId__c;
	  		insert insertChange;
	    }
	    
		}	*/
}
}