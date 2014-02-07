public with sharing class BadgeTokenController {
    
        public String APIsecret{get;set;}
        public String APIkey{get;set;}
        public String name{get;set;}
        public String password{get;set;}
         public String authKey{get;set;}
         public String APItoken{get;set;}
         public Boolean checkCredly{get;set;}
            public String successMessage{get;set;}
             public Boolean success{get;set;}
      
       public BadgeTokenController() { 
        
       authKey = ' ';
       APIsecret = ' ';
       APIkey = ' ';
       APItoken = ' ';
       success = false;
     
      
       staticCredlyClass.Token j = staticCredlyClass.getToken(); 
       
       authKey = j.authKey; 
       APIsecret = j.APIsecret;
       APIkey = j.APIkey; 
        APItoken = j.APItoken; 
       name = j.UserName;       
       }
       public PageReference checkCredly()
       {
          String securityToken;
          successMessage = '';
          success = false;
          securityToken = CredlyJSONCalls.authenticate(CredlyJSONCalls.getURL() + 'authenticate');
         if (securityToken.compareTo('error') == 0)
         {
               ApexPages.addMessage(new ApexPages.message(ApexPages.severity.error, 'Invalid Security Information'));
         }
         else
         {
            APItoken = securityToken;
            assignToken();
            success = true;
            successMessage = 'Credly account successfully linked';
            
         }
         
         return null;
         
       }
       public PageReference saveToken()
       {
         String securityToken;
         staticCredlyClass.Token j = new staticCredlyClass.Token();
         j.authKey = staticCredlyClass.createAuthKey(name, password);
         j.APIkey = APIkey;
         j.APISecret = APISecret;
         j.APItoken = APItoken;
         staticCredlyClass.setToken(j);
         authKey = staticCredlyClass.createAuthKey(name, password);
         
         checkCredly = true;
         
         return null;
       }
         public PageReference assignToken()
       {
         String securityToken;
         staticCredlyClass.Token j = new staticCredlyClass.Token();
         j.authKey = authKey;
         j.APIkey = APIkey;
         j.APISecret = APISecret;
         j.APItoken = APItoken;
         staticCredlyClass.setToken(j);
         
         checkCredly = true;
         
         return null;
       }
        public PageReference updateToken()
       {
         String securityToken;
         staticCredlyClass.setTokenOnly(APItoken); 
         return null;
       }
       
          public PageReference checkCredlyToken()
       {
          String securityToken;
            String returnData;
    		String createURL;
          successMessage = '';
          success = false;
           staticCredlyClass.Token j = staticCredlyClass.getToken(); 
     securityToken = j.APItoken;
    
       Map<String, String> mBadge = new Map<String, String>();
      mBadge.put('access_token',securityToken);  
      mBadge.put('page','1');
      mBadge.put('per_page','9999');  
        
      createURL = CredlyJSONCalls.createURLString(mBadge);
         returnData = CredlyJSONCalls.getCredly(CredlyJSONCalls.getURL()+ 'me?' + createURL);  

          CredlyJSON2ApexErrors obj = CredlyJSON2ApexErrors.parse(returnData);
        if (obj.meta.status.compareTo('OK') == 0)
            {
            success = true;
            successMessage = 'Credly account successfully linked';
            } 
            else
            {
            	 success = false;
            	 ApexPages.addMessage(new ApexPages.message(ApexPages.severity.error, 'Invalid API Key'));
            }

         return null;
         
       }

}