public with sharing class staticCredlyClass {
	
	
	/*public static String convCRDateTime(String x)
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
		
		system.debug(stringDate);
		return stringDate;
		
	} */
	
	public with sharing class Token {
		public String authKey;
		public String APIkey;
		public String APIsecret;
	}
	
	static public Token getToken()
	{
		Token token = new Token(); 
		token.authKey = ' ';
		token.APIsecret = ' ';
		token.APIkey = ' ';
	
		token_data__c[] myToken = [SELECT user_name_t__c, authKey_data_t__c, apiKey_data_t__c, apiSecret_data_t__c FROM token_data__c WHERE user_name_t__c = :UserInfo.getUserId()];
	    for (token_data__c a : myToken)
	    {
	
		token.authKey = a.authKey_data_t__c;
		token.APIsecret = a.apiSecret_data_t__c;
		token.APIkey = a.apiKey_data_t__c;
	
	    }
	     
	    return token;
	   }
	static public void setToken(Token passedToken)
	{
	    //delete token
	    token_data__c[] myToken = [SELECT user_name_t__c, authKey_data_t__c FROM token_data__c WHERE user_name_t__c = :UserInfo.getUserId()];
	    try{
	    delete myToken;
	    	} catch (DmlException e) {
    // Process exception here
			}
	    
	    //create new one
	    token_data__c newToken = new token_data__c(user_name_t__c = UserInfo.getUserId(), authKey_data_t__c = passedToken.authKey, apiKey_data_t__c = passedToken.APIkey, APIsecret_data_t__c = passedToken.APIsecret);
		try {
    		insert newToken;
			} catch (DmlException e) {
						
    // Process exception here
			}
	   	 
	}
		static public PageReference tokenPage()
	{
		return Page.ViewBadgeToken;
	}
	   
}