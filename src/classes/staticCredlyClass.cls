public with sharing class staticCredlyClass {
	
    public static String convCRDateTime(String x)
	{
		
		String[] dateString = x.split(' ');
		
		if (dateString[2].CompareTo('Jan') == 0)
		{
			dateString[2] = '1';
		}
		if (dateString[2].CompareTo('Feb') == 0)
		{
			dateString[2] = '2';
		}
		if (dateString[2].CompareTo('Mar') == 0)
		{
			dateString[2] = '3';
		}
		if (dateString[2].CompareTo('Apr') == 0)
		{
			dateString[2] = '4';
		}
		if (dateString[2].CompareTo('May') == 0)
		{
			dateString[2] = '5';
		} 
		if (dateString[2].CompareTo('Jun') == 0)
		{
			dateString[2] = '6';
		}
		if (dateString[2].CompareTo('Jul') == 0)
		{
			dateString[2] = '7';
		}
		if (dateString[2].CompareTo('Aug') == 0)
		{
			dateString[2] = '8';
		}
		if (dateString[2].CompareTo('Sep') == 0)
		{
			dateString[2] = '9';
		}
		if (dateString[2].CompareTo('Oct') == 0)
		{
			dateString[2] = '10';
		}
		if (dateString[2].CompareTo('Nov') == 0)
		{
			dateString[2] = '11';
		}
		if (dateString[2].CompareTo('Dec') == 0)
		{
			dateString[2] = '12';
		}
		
		string stringDate = dateString[3] + '-' + dateString[2]
 		+ '-' + dateString[1] + ' ' + dateString[4] + ' ' + dateString[5];
		
		
		
	//	Thu, 14 Nov 2013 18:49:39 -0500
		return stringDate;
		
	} 
	
	public with sharing class Token {
		public String authKey;
		public String APIkey;
		public String APIsecret;
		public String APItoken;
		public String UserName;
	}
	
	static public Token getToken()
	{
		 
       
       String name; 
       List<String> temp;
       String authName;
		
		
		Token token = new Token(); 
		token.authKey = ' ';
		token.APIsecret = ' ';
		token.APIkey = ' ';
		token.APItoken = ' ';
		token.UserName= ' ';
	
		token_data__c[] myToken = [SELECT user_name_t__c, apiToken_data_t__c, authKey_data_t__c, apiKey_data_t__c, apiSecret_data_t__c FROM token_data__c WHERE user_name_t__c = :UserInfo.getUserId()];
	    for (token_data__c a : myToken)
	    {
	
		token.authKey = a.authKey_data_t__c;
		token.APIsecret = a.apiSecret_data_t__c;
		token.APIkey = a.apiKey_data_t__c;
		token.APItoken = a.apiToken_data_t__c;
		authName = EncodingUtil.base64Decode(a.authKey_data_t__c).toString();
        temp = authName.split(':');
        token.UserName = temp[0];
	    }
	     
	    return token;
	   }
	   
	static public String createAuthKey(String name, String password)
	{
		Blob b;
		String authKey = name + ':' + password;
		String b64;
		b = Blob.valueOf(authKey);
		
		b64 = EncodingUtil.base64Encode(b);
        return b64;
	}
	
	
	static public void setTokenOnly(String passedToken)
	{
		token_data__c[] myToken = [SELECT user_name_t__c, authKey_data_t__c FROM token_data__c WHERE user_name_t__c = :UserInfo.getUserId() limit 1];
		myToken[0].apiToken_data_t__c = passedToken;
		update myToken;
	}
	
	static public void setToken(Token passedToken)
	{
	    //delete token
	    token_data__c[] myToken = [SELECT user_name_t__c, authKey_data_t__c FROM token_data__c WHERE user_name_t__c = :UserInfo.getUserId()];
	    try{
	    delete myToken;
	    	} catch (DmlException e) {
	    		system.debug(e);
    // Process exception here
			}
	    
	    //create new one
	    token_data__c newToken = new token_data__c(user_name_t__c = UserInfo.getUserId(), authKey_data_t__c = passedToken.authKey, apiKey_data_t__c = passedToken.APIkey, APIsecret_data_t__c = passedToken.APIsecret,apiToken_data_t__c = passedToken.APItoken);
		try {
    		insert newToken;
			} catch (DmlException e) {
				system.debug(e);
						
    // Process exception here
			}
	   	 
	}
		static public PageReference tokenPage()
	{
		return Page.ViewBadgeToken;
	}
	
	
	public static void synchBadgesToCredly()
	{
	 batchSyncBadges a = new batchSyncBadges();
       Database.executeBatch(a, 8);
	}
	
	public static void synchMemberBadgesToCredly()
	{
	    batchSyncMemberBadges b = new batchSyncMemberBadges();
       Database.executeBatch(b, 1);
	}
	
	 public static List<CredlyJSON2ApexMyBadges.Data> getMyBadgesFromCredly()
   { 
  
   	List<CredlyJSON2ApexMyBadges.Data> myCredlyBadges = new List<CredlyJSON2ApexMyBadges.Data>();
   	myCredlyBadges = CredlyJSONCalls.getMyBadges();
   	
  return myCredlyBadges; 
}

 public static List<CredlyJSON2ApexMyMemberBadges.Data> getMyMemberBadgesFromCredly()
   {
   	List<CredlyJSON2ApexMyMemberBadges.Data> myCredlyMemberBadges = new List<CredlyJSON2ApexMyMemberBadges.Data>();
   	myCredlyMemberBadges = CredlyJSONCalls.getMyMemberBadges(); 
  return myCredlyMemberBadges;
}

public static set<String> getCredlyBadgeIdsFromData(List<CredlyJSON2ApexMyBadges.Data> myCredlyBadges)
   {
   	 set<String> myCredlyBadgeIDs;
   	 myCredlyBadgeIDs = new set<String>();
  
    for (CredlyJSON2ApexMyBadges.Data i : myCredlyBadges) 
    	{
    		myCredlyBadgeIDs.add(String.valueOf(i.id));
     	}
     	return myCredlyBadgeIDs;
}

public static set<String> getCredlyBadgeIDsFromSalesforce()
   { 
    List<badge__c> myIds = [select credlyBadgeId__c from badge__c where credlyBadgeId__c <> null];
   	set<String> mySalesForceBadgeIDs = new set<String>();
   	
   	for (badge__c i: myIds)
   	{
   			mySalesForceBadgeIDs.add(String.valueOf(i.credlyBadgeId__c));
   	}
   	return mySalesForceBadgeIDs;
   	
   }
   
   public static void synchBadgesFromCredly(List<CredlyJSON2ApexMyBadges.Data> myCredlyBadges, set<String> mySalesForceCredlyBadgeIDs)
{
	boolean check = false;
	
	List<badge__c> newBadges = new List<badge__c>();
	
	//loop through credlyList and compare to Salesforce list 
	
	   	  	for ( CredlyJSON2ApexMyBadges.Data item : myCredlyBadges) {
	   	  		check = false;
	   	  		if (mySalesForceCredlyBadgeIDs.contains(String.valueOf(item.id)))
	   	  		{
	   	  		check=true;
	   	  		} 
	   	  		
	   	  		if (check == false)
	   	  		{

      	badge__c insertBadges = new badge__c();

        insertBadges.document_id__c = string.valueof(item.image_url);
        
         insertBadges.criteria__c = ''; 
         insertBadges.description__c = ''; 
         insertBadges.expires_in__c = 319999999;  
         insertBadges.is_giveable__c = string.valueof(item.is_giveable); 
         
         if (item.short_description  == null)
         {
         	insertBadges.short_description__c = 'none';	
         }
         else
         {
         	insertBadges.short_description__c = string.valueof(item.short_description);	
         }
         
         insertBadges.title__c = string.valueof(item.title);
         insertBadges.credlyBadgeId__c = string.valueof(item.id);
         
        
         newBadges.add(insertBadges);
         
    }
	   	  			
	   	  		}
	   	  if (newBadges <> null)
	   	  {	
	   	    insert newBadges;
	   	  }
	   	  		
    		
     	  	}
     	  	
     	  	
   public static set<Integer> getCredlyMemberBadgeIdsFromData(List<CredlyJSON2ApexMyMemberBadges.Data> myCredlyMemberBadges)
   {
   	 set<Integer> myCredlyMemberBadgeIDs;
   	 myCredlyMemberBadgeIDs = new set<Integer>();
  
    for (CredlyJSON2ApexMyMemberBadges.Data i : myCredlyMemberBadges)
    	{
    		myCredlyMemberBadgeIDs.add(i.id);
     	}
     	return myCredlyMemberBadgeIDs; 
}

public static set<String> getCredlyMemberIDsFromSalesforce()
   { 
    List<member_badge__c> myIds = [select credlyMemberBadge_id_m__c from member_badge__c where credlyMemberBadge_id_m__c <> null];
   	set<String> mySalesForceMemberBadgeIDs = new set<String>(); 
   	
   	for (member_badge__c i: myIds)
   	{
   			mySalesForceMemberBadgeIDs.add(String.valueOf(i.credlyMemberBadge_id_m__c));
   	}
   	return mySalesForceMemberBadgeIDs;
   	
   }
   
   public static ID getBadgeID(String id)
   {
   	badge__c[] badgeRec = [select id from badge__c where credlyBadgeId__c = :id limit 1];
   	if (badgeRec.Size() > 0)
   	{
   	return badgeRec[0].id;
   	}
   	else
   	{
   		return null;
   	}
   	
   }
   
   public static void synchMemberBadgesFromCredly(List<CredlyJSON2ApexMyMemberBadges.Data> myCredlyMemberBadges, set<String> mySalesForceCredlyMemberBadgeIDs)
{
	boolean check = false;
	ID leadId;
	ID contactId;
	
	List<member_badge__c> newMemberBadges = new List<member_badge__c>();
	
	//loop through credlyList and compare to Salesforce list 
	
	   	  	for ( CredlyJSON2ApexMyMemberBadges.Data item : myCredlyMemberBadges) {
	   	  		check = false;
	   	  		if (mySalesForceCredlyMemberBadgeIDs.contains(String.valueOf(item.id)))
	   	  		{
	   	  		check=true;
	   	  		} 
	   	  		else
	   	  		{
	   	  		check=false;
	   	  		}
	   	  		
	   	  		
	   	  		if (check == false)
	   	  		{

      	member_badge__c memberBadge = new member_badge__c();
      	
      	memberBadge.credlyMemberBadge_id_m__c = item.id;
      	memberBadge.badge_lookup_m__c = staticCredlyClass.getBadgeID(String.valueOf(item.badge_id));
      	if (memberBadge.badge_lookup_m__c == null)
      	{
      		continue;
      	}
      	
      	leadId = null;
      	contactId = null; 
      	
      	leadId = staticCredlyClass.GetLeadID(item.member_orphan.email);
      	if (leadId == null)
       	{
      		contactId = staticCredlyClass.GetContactID(item.member_orphan.email);
      	}
      	
      	
      	if ((leadId == null) && (contactId == null))
      	{
      		continue;
      	}
      	
      	if (leadId <> null)
      	{
      		memberBadge.lead_lookup_m__c = leadId;
      		memberBadge.account_type_m__c = 'lead';
      	}
      	
      	if (contactId <> null)
      	{
      		memberBadge.contact_lookup_m__c = contactId;
      		memberBadge.account_type_m__c = 'contact';
      	}
      	
      	memberBadge.title_m__c = item.title;
      	memberBadge.document_id_m__c = staticCredlyClass.GetBadgeDocumentId(String.valueOf(item.badge_id));
      	memberBadge.short_description_m__c = item.short_description;
      	memberBadge.is_visible_m__c = String.valueOf(item.is_visible);
      	memberBadge.description_m__c = item.description;
      	memberBadge.criteria_m__c = item.criteria;
      	memberBadge.categories_m__c = String.valueOf(item.categories); 
      	memberBadge.evidence_url_m__c = (item.badge_evidence.Size() == 0) ? ' ' : item.badge_evidence[0].resource; 
      	memberBadge.testimonial_m__c = (item.badge_testimonial.Size() == 0) ? ' ' :  item.badge_testimonial[0].body;
        memberBadge.issue_date_m__c = date.valueOf(staticCredlyClass.convCRDateTime(item.created_at));
        memberBadge.expires_in_m__c = item.badge.expires_in;
        memberBadge.expires_in_m__c = (memberBadge.expires_in_m__c == 0) ? 999999 : memberBadge.expires_in_m__c;
         newMemberBadges.add(memberBadge);
         
    } 
	   	  			
	   	  		}
	   	  if (newMemberBadges.Size() > 0)
	   	  {	
	   	    insert newMemberBadges; 
	   	  }
	   	  		
    		
     	  	}
     	  	
     	  	public static id GetContactID(String email)
     	  	{
     	  		  	Contact[] contactRec = [select id from Contact where email = :email limit 1];
   					if (contactRec.Size() > 0)
   					{
   					return contactRec[0].id;
   				}
   					else
   				{
   				return null;
   					}

     	  	}
     	  	
     	  		public static id GetLeadID(String email)
     	  	{
     	  		  	Lead[] leadRec = [select id from Lead where email = :email limit 1];
   					if (leadRec.Size() > 0)
   					{
   					return leadRec[0].id;
   				}
   					else
   				{
   				return null;
   					}

     	  	}
     	  	
     	  	public static String GetBadgeDocumentId(String ID)
     	  	{
     	  		 	badge__c[] badgeRec = [select document_id__c from badge__c where credlyBadgeId__c = :id limit 1];
   	if (badgeRec.Size() > 0)
   	{
   	return badgeRec[0].document_id__c;
   	}
   	else
   	{
   		return null;
   	}
     	  	}
     	  	
    public static void storeCredlyId(Integer CredlyId, ID whoId, String AccountType)
     	  	{
    if (AccountType == 'contact')
	{
	credlyIDEmailCross__c credlyCross = new credlyIDEmailCross__c(); 
	credlyCross.CredlyId_xf__c = CredlyId;
	credlyCross.Contact_Lookup_xf__c = whoId;
	insert credlyCross;
	}

	if (AccountType == 'lead')
	{
	credlyIDEmailCross__c credlyCross = new credlyIDEmailCross__c(); 
	credlyCross.CredlyId_xf__c = CredlyId;
	credlyCross.Lead_Lookup_xf__c = whoId;
	insert credlyCross;
	}
	
	if (AccountType == 'account')
	{
	credlyIDEmailCross__c credlyCross = new credlyIDEmailCross__c();  
	credlyCross.CredlyId_xf__c = CredlyId;
	credlyCross.Account_Lookup_xf__c = whoId;
	insert credlyCross;
}
}
     	  	
	public static Integer getCredlyIDfromSalesForce(ID whoId, String AccountType)
	{	
	Integer CredlyId = 0;
	if (AccountType == 'contact')
	{
	credlyIDEmailCross__c [] credlyCross = [SELECT CredlyId_xf__c FROM credlyIDEmailCross__c  where contact_Lookup_xf__c = :whoId LIMIT 1];
	if (credlyCross.size() > 0)
	{
	CredlyId = Integer.valueOf(credlyCross[0].CredlyId_xf__c);
	}
	return CredlyId;
	}

	if (AccountType == 'lead')
	{
	credlyIDEmailCross__c [] credlyCross = [SELECT CredlyId_xf__c FROM credlyIDEmailCross__c  where lead_Lookup_xf__c = :whoId LIMIT 1];
	if (credlyCross.size() > 0)
	{
	CredlyId = Integer.valueOf(credlyCross[0].CredlyId_xf__c);
	}
	return CredlyId;
	}
	
	if (AccountType == 'account')
	{
	credlyIDEmailCross__c [] credlyCross = [SELECT CredlyId_xf__c FROM credlyIDEmailCross__c  where account_Lookup_xf__c = :whoId LIMIT 1];
	if (credlyCross.size() > 0)
	{
	CredlyId = Integer.valueOf(credlyCross[0].CredlyId_xf__c);
	}
	return CredlyId;
}
return 0; 

}


}