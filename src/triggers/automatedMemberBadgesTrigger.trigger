trigger automatedMemberBadgesTrigger on member_badge__c (after insert, before update) {
	for (member_badge__c c : Trigger.new)
	{
		 String returnData;
	String securityToken;
	String encodedImage;
	String createURL;
	String[] splitName = null;
	String email;
		
		 if ((Trigger.isInsert) && (c.credlyMemberBadge_Id_m__c == null))
		 {
		 	try{
		 	staticCredlyClass.synchMemberBadgeToCredly(c.id); 
		 	}
		 	catch(DmlException e)
		 	{
		 	} 
		 }
		 }
	}