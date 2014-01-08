trigger automatedMemberBadgesTrigger on member_badge__c (before insert, before update) {
	for (member_badge__c c : Trigger.new)
	{
		 String returnData;
	String securityToken;
	String encodedImage;
	String createURL;
	String[] splitName = null;
	String email;
	
	  if ((Trigger.isUpdate) && (c.credlyMemberBadge_Id_m__c != null))
     	{ 
     	
     	List<chg_member_badge__c> aa = [select credlyMemberBadgeId_x__c from chg_member_badge__c where credlyMemberBadgeId_x__c = :c.credlyMemberBadge_Id_m__c];
    
	    if (aa.isEmpty()) {
	    	chg_member_badge__c insertChange = new chg_member_badge__c();
	    	insertChange.credlyMemberBadgeId_x__c = c.credlyMemberBadge_Id_m__c;
	  		insert insertChange;
	    }
	    
		}	
	}
	}