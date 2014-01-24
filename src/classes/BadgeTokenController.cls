public with sharing class BadgeTokenController {
    
        public String APIsecret{get;set;}
        public String APIkey{get;set;}
        public String name{get;set;}
        public String password{get;set;}
         public String authKey{get;set;}
         public Boolean checkCredly{get;set;}
            public String successMessage{get;set;}
             public Boolean success{get;set;}
      
       public BadgeTokenController() { 
        
       authKey = ' ';
       APIsecret = ' ';
       APIkey = ' ';
       success = false;
       String authName;
       List<String> temp;
      
       staticCredlyClass.Token j = staticCredlyClass.getToken(); 
       
       authKey = j.authKey; 
       APIsecret = j.APIsecret;
       APIkey = j.APIkey; 
       
       authName = EncodingUtil.base64Decode(j.authKey).toString();
       temp = authName.split(':');
       
       name = temp[0]; 
       
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
            success = true;
            successMessage = 'Credly account successfully linked';
         }
         
         return null;
         
       }
       public PageReference saveToken()
       {
         String securityToken;
         staticCredlyClass.Token j = new staticCredlyClass.Token();
         j.authKey = authKey;
         j.APIkey = APIkey;
         j.APISecret = APISecret;
         staticCredlyClass.setToken(j); 
         
         checkCredly = true;
         
         return null;
       }

}