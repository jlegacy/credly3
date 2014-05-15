public with sharing class CredlyJSONCalls { 
    
    // Pass in the endpoint to be used using the string url  
    
   //pass list of string data in and create a url string for pos
   
  
     public static String createURLString(Map<String, String> data)  
   {
       String encodedString;
       Integer count = 0;
     for(String key:data.keySet())
  {  
      ++count;
      if (count == 1)
      {
      encodedString = key + '=' + EncodingUtil.urlEncode(data.get(key), 'UTF-8');
          }
      else
      {
     encodedString = encodedString + '&' + key + '=' + EncodingUtil.urlEncode(data.get(key), 'UTF-8');
      } 
      
      }
      
      //put apostrophes, quotes and ampersands back in
     System.debug('Encoded string pre-replace');
     System.debug(encodedString);
     //For reasons I don't understand, we need to replace not the output of urlEncode, but the HTML representation.
     //'
     //%26%2339%3B
     //&
     //%26amp%3B
     //"
     //%26quot%3B
     encodedString = encodedString.replace('%26%2339%3B' , '\'');
     //Note: this will cut off the message. Not sure how to handle ampersands.
     //encodedString = encodedString.replace('%26amp%3B' , '&');
     encodedString = encodedString.replace('%26quot%3B' , '\"');
     System.debug('Post replace');
     System.debug(encodedString);
     return encodedString; 
     }

     
   public static String getURL()
   {
    String URL = 'https://api.credly.com/v1.1/';
    return URL;
   } 
    
   public static String authenticate(String URL) { 
    // Instantiate a new http object
    staticCredlyClass.Token j = staticCredlyClass.getToken();
    
    Http h = new Http();
    
   String authorizationHeader = 'Basic ' + j.authKey;
 
// Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
    HttpRequest req = new HttpRequest();
    req.setEndpoint(url);
    req.setMethod('POST');
    
     req.setHeader('Authorization', authorizationHeader);
      req.setHeader('X-Api-Key', j.APIkey);
       req.setHeader('X-Api-Secret', j.APIsecret);
    
// Send the request, and return a response
    HttpResponse res = h.send(req); 
 
       //parseResults
         CredlyJSON2ApexErrors obj = CredlyJSON2ApexErrors.parse(res.getBody());
        if (obj.meta.status.compareTo('OK') != 0)
          {
            return 'error';
          }
        else
            {
            Map<String, Object> m = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
            Map<String, Object> a = (Map<String, Object>) m.get('data');
            return String.valueOf(a.get('token')); 
   }
   }

    public static String getCredlyImage(String URL) {
  
        String encodedImage;
         Http h = new Http();
         HttpRequest req = new HttpRequest();
         req.setEndpoint(url);
         req.setMethod('GET');
      
         req.setHeader('Connection', 'close'); 
         req.setTimeout(2000);
         try
           {
            HttpResponse res = h.send(req);
            blob image = (res.getBodyAsBlob());
            Attachment attach = new Attachment();
            attach.body = image;
            encodedImage = EncodingUtil.base64Encode(attach.body);
            return encodedImage;
           }
           catch(Exception e)
           {
            return null;
           }

    }
    
     public static String getDocumentBlob(String documentId) {
        String encodedImage;
        Document doc = [select id, name, body, contenttype, developername, type 
        from Document where id = :documentId];
        encodedImage = EncodingUtil.base64Encode(doc.body);
        return encodedImage; 
    }
   public static String postCredly(String URL, String dataURL, Id userId) {
    // Instantiate a new http object
   
    Http h = new Http();
    
    staticCredlyClass.Token j = staticCredlyClass.getToken(userId);
    
    String authorizationHeader = 'Basic ' + j.authKey;
    
// Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
    HttpRequest req = new HttpRequest();
    
    
    req.setEndpoint(url);
    req.setMethod('POST');
    req.setBody(dataURL);
    
    req.setHeader('Authorization', authorizationHeader);
      req.setHeader('X-Api-Key', j.APIkey);
       req.setHeader('X-Api-Secret', j.APIsecret);
  
// Send the request, and return a response
    HttpResponse res = h.send(req); 
    return res.getBody();
   }
      
   public static String postCredly(String URL, String dataURL) {
    // Instantiate a new http object
   
    Http h = new Http();
    
    staticCredlyClass.Token j = staticCredlyClass.getToken();
    
    String authorizationHeader = 'Basic ' + j.authKey;
    
// Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
    HttpRequest req = new HttpRequest();
    
    
    req.setEndpoint(url);
    req.setMethod('POST');
    req.setBody(dataURL);
    
    req.setHeader('Authorization', authorizationHeader);
      req.setHeader('X-Api-Key', j.APIkey);
       req.setHeader('X-Api-Secret', j.APIsecret);
  
// Send the request, and return a response
    HttpResponse res = h.send(req); 
    return res.getBody();
   }
   
   public static String getCredly(String URL) {
    // Instantiate a new http object
    Http h = new Http();
  
    staticCredlyClass.Token j = staticCredlyClass.getToken();
      
// Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
    HttpRequest req = new HttpRequest();
      req.setTimeout(15000);
    req.setHeader('X-Api-Key', j.APIkey);
    req.setHeader('X-Api-Secret', j.APIsecret);
   
    req.setEndpoint(url);
    req.setMethod('GET');

// Send the request, and return a response
    HttpResponse res = h.send(req);
    return res.getBody(); 
   }
   
   
     public static String postMyBadge(badge__c badge)
   {
    String returnData;
    String createURL;
    String errMessage;
    String stsMessage;
    String xbadgeURL;
    String securityToken;
    Integer credlyId;
    String userName;
    String temp;
    String name;
    String encodedImage; 
    String categoriesString;
    String categoriesCredly;
    Integer z;
    
    List<CredlyJSON2ApexMyBadges.Data> myBadges = new List<CredlyJSON2ApexMyBadges.Data>();
    
     staticCredlyClass.Token j = staticCredlyClass.getToken(); 
     securityToken = j.APItoken;
    
       Map<String, String> mBadge = new Map<String, String>();
      mBadge.put('access_token',securityToken);  
      mBadge.put('page','1');
      mBadge.put('per_page','9999');  
        
      createURL = CredlyJSONCalls.createURLString(mBadge);
        
           //post badge to credly
           
         List<badge__c> badgeList = new List<badge__c>();
 
    // get the image data
 
        if (badge.upload_file_id__c == null)
        {
             if (test.isRunningTest()) { 
             encodedImage = 'test'; 
             }
             else
             {
            encodedImage = CredlyJSONCalls.getCredlyImage(badge.document_id__c);
             }  
        }
        else
        {
        encodedImage = CredlyJSONCalls.getDocumentBlob(badge.upload_file_id__c);
     
        
        }
        if (encodedImage != null && securityToken != null)
        {
        // Build Credly Badge //
       mBadge.put('attachment', encodedImage); 
       mBadge.put('title', badge.title__c);
       mBadge.put('short_description', badge.short_description__c = (badge.short_description__c == null) ? ' ' : badge.short_description__c); 
       mBadge.put('description', badge.description__c = (badge.description__c == null) ? ' ' : badge.description__c); 
       mBadge.put('criteria', badge.criteria__c = (badge.criteria__c == null) ? ' ' : badge.criteria__c); 
       mBadge.put('is_giveable', badge.is_giveable__c = (badge.is_giveable__c == null) ? ' ' : badge.is_giveable__c); 
       
       categoriesString = null;
       categoriesCredly = null;
       z = 0;
       
       String[] rows = badge.categories__c.split('\\,');
       for (String c: rows)
            {
                categoriesString = (staticCredlyClass.getSingleCategoryID(c));
                {
                z = z + 1;
                if (z == 1)
                {
                categoriesCredly = categoriesString;
                }
                else
                {
                categoriesCredly = categoriesCredly + ',' + categoriesString;   
                }
                
            }
            }
            
          mBadge.put('categories',   categoriesCredly = (categoriesCredly == null) ? ' ' : categoriesCredly);      
          
       if (badge.expires_in__c > 0.0)
            { 
                mBadge.put('expires_in', staticCredlyClass.ToString(badge.expires_in__c, false)); 
            }
            else
            {
                mBadge.put('expires_in', '');  
            }
     
        createURL = CredlyJSONCalls.createURLString(mBadge); 
       
           //post badge to credly
           
             if (test.isRunningTest()) {
            returnData = '{"meta": {"status_code": 200,"status": "OK","message": "","more_info": null},"data": 1408}';
           }
           else
           {
         returnData = CredlyJSONCalls.postCredly(CredlyJSONCalls.getURL()+ 'badges', createURL); 
           }
        
          //parseResults
         CredlyJSON2ApexErrors obj = CredlyJSON2ApexErrors.parse(returnData);
        if (obj.meta.status.compareTo('OK') == 0)
            {
             CredlyJSON2ApexBadge obj2 = CredlyJSON2ApexBadge.parse(returnData);
             return String.valueOf(obj2.data);
            } 
        }
   
            return null;
        }
  
   
   public static List<CredlyJSON2ApexMyBadges.Data> getMyBadges()
   {
    String returnData;
    String createURL;
    String errMessage;
    String stsMessage;
    String xbadgeURL;
    String securityToken;
    Integer credlyId;
    String userName;
    String temp;
    String name;
    
    List<CredlyJSON2ApexMyBadges.Data> myBadges = new List<CredlyJSON2ApexMyBadges.Data>();
    
     staticCredlyClass.Token j = staticCredlyClass.getToken(); 
     securityToken = j.APItoken;
    
       Map<String, String> mBadge = new Map<String, String>();
      mBadge.put('access_token',securityToken);  
      mBadge.put('page','1');
      mBadge.put('per_page','9999');  
        
      createURL = CredlyJSONCalls.createURLString(mBadge);
        
           //post badge to credly
             if (test.isRunningTest()) {
                returnData = '{"meta":{"status_code":200,"status":"OK","message":"","more_info":null},"data":[{"id":99999,"title":"joseph Apostrophe Test 2","short_description":"testing","image_url":"https://credlyapp.s3.amazonaws.com/badges/517cf495acf031e1f5138ff30d7f182b.png","is_giveable":false,"created_at":"Sun, 23 Mar 2014 18:13:21 -0400","creator_id":10636,"is_claimable":false,"resources":{"url":"https://api.credly.com/v1.1/me/badges/created/15594"}},{"id":15592,"title":"josephs test","short_description":"test","image_url":"https://credlyapp.s3.amazonaws.com/badges/51f5cd8cf4e496cd07815a0b0610ad9b.png","is_giveable":false,"created_at":"Sun, 23 Mar 2014 18:05:13 -0400","creator_id":10636,"is_claimable":false,"resources":{"url":"https://api.credly.com/v1.1/me/badges/created/15592"}},{"id":15509,"title":"testupload3","short_description":"test","image_url":"https://credlyapp.s3.amazonaws.com/badges/53d4433bda4719fe77303cf801f763f2.png","is_giveable":false,"created_at":"Thu, 20 Mar 2014 22:26:40 -0400","creator_id":10636,"is_claimable":false,"resources":{"url":"https://api.credly.com/v1.1/me/badges/created/15509"}}],"paging":{"page":1,"per_page":3,"order_direction":"DESC","total_results":33,"multi_result_count":4,"resources":{"next":"https://api.credly.com/v1.1/me/badges/created?access_token=efaa8a6c587c02edfd4ba1cc88c2fee7a09ce865eaff860a6a6a92a85c0445c4bfb26951a03bee7bed5d17ed684a194da0dced5559aa23453231699a6db85ecd&per_page=3&email=jlegacy%40suddenlink.net&page=2&order_direction=DESC"}}}';
                
             }
             else
             {
         
         returnData = CredlyJSONCalls.getCredly(CredlyJSONCalls.getURL()+ 'me/badges/created?' + createURL);
             }  
          //parseResults
         CredlyJSON2ApexErrors obj = CredlyJSON2ApexErrors.parse(returnData);
        if (obj.meta.status.compareTo('OK') == 0)
            {
             CredlyJSON2ApexMyBadges obj2 = CredlyJSON2ApexMyBadges.parse(returnData);
            myBadges = obj2.Data;
          //    for (CredlyJSON2ApexMyBadges.Data i : myBadges) {
          //    }
            } 
   
            return myBadges;
        }
     
      public static CredlyJSON2ApexCredlySingleBadgeData getSingleBadge(String BadgeID)
   {
    system.debug('in test');
    String returnData;
    String createURL;
    String errMessage;
    String stsMessage;
    String xbadgeURL;
    String securityToken;
    Integer credlyId;
    String userName;
    String temp;
    String name;
    
    CredlyJSON2ApexCredlySingleBadgeData mySingleBadge = new CredlyJSON2ApexCredlySingleBadgeData();
    
     staticCredlyClass.Token j = staticCredlyClass.getToken(); 
     securityToken = j.APItoken;
    
       Map<String, String> mBadge = new Map<String, String>();
      mBadge.put('access_token',securityToken);  
     mBadge.put('id',badgeID);  
      mBadge.put('verbose','false');  
        
      createURL = CredlyJSONCalls.createURLString(mBadge);
        
           //post badge to credly
           if (test.isRunningTest()) {
        returnData = '{\"meta\":{\"status_code\":200,\"status\":\"OK\",\"message\":\"\",\"more_info\":null},\"data\":{\"id\":13114,\"title\":\"autobatchjob\",\"short_description\":\"test\",\"image_url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/badges\\/37fa80b966dee856b5a1f1092ccc8d26.png\",\"is_giveable\":false,\"created_at\":\"Thu, 30 Jan 2014 22:46:54 -0500\",\"creator_id\":10636,\"is_claimable\":false,\"description\":\"test\",\"criteria\":\"test\",\"expires_in\":3,\"creator\":{\"id\":10636,\"slug\":\"\",\"type\":\"user\",\"display_name\":\"Joseph Legacy\",\"avatar\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/avatars\\/ca02cd78b68d82da8e01272ba271901d.jpeg\",\"account_type\":\"Free\",\"is_pro\":false,\"is_email_verified\":true,\"is_account_verified\":false,\"member_badge_count\":0,\"issued_badge_count\":0,\"trusted_by_count\":0,\"lists_count\":0,\"first_name\":\"Joseph\",\"last_name\":\"Legacy\",\"email\":\"jlegacy@suddenlink.net\",\"bio\":\"\",\"location\":\"\",\"website\":\"\",\"last_activity\":false,\"created_at\":\"Wed, 27 Nov 2013 23:32:54 -0500\",\"updated_at\":\"Thu, 06 Feb 2014 03:03:08 -0500\"},\"categories\":[],\"require_claim_code\":true,\"require_claim_evidence\":false,\"require_claim_evidence_description\":\"\",\"approve_claim_automatically\":false,\"components\":{\"icon\":{\"id\":3771,\"type\":\"icon\",\"filename\":\"pencil-347\",\"vector_ext\":\"svg\",\"raster_ext\":\"png\",\"vector_url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/assets\\/icon\\/pencil-347.svg\",\"raster_url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/assets\\/icon\\/pencil-347.png\",\"meta\":{\"attribute\":\"The Noun Project\",\"license\":\"Creative Commons - Attribution (CC BY 3.0)\",\"noun\":\"Pencil\",\"npid\":\"347\"}},\"meta\":{\"banner-color\":\"#c3c3c3\",\"banner-text\":\"Blank Slate\",\"banner-text-color\":\"#ffffff\",\"border\":\"solid\",\"border-color\":\"#000000\",\"custom_icon\":\"1\",\"expires_amount\":\"1\",\"expires_units\":\"never\",\"icon-color\":\"#000000\",\"shape\":\"circle-badge\",\"shape-color\":\"#ffffff\"}},\"image_data\":{\"file_name\":\"37fa80b966dee856b5a1f1092ccc8d26.png\",\"time_created\":1391139946,\"file_hash\":{\"md5\":\"37fa80b966dee856b5a1f1092ccc8d26\"},\"mime_type\":\"image\\/png\",\"size\":{\"bytes\":39456,\"kilobytes\":38.5,\"megabytes\":0},\"url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/badges\\/37fa80b966dee856b5a1f1092ccc8d26.png\",\"resized_images\":{\"_1\":{\"url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/badges\\/37fa80b966dee856b5a1f1092ccc8d26_1.png\",\"max_width\":36,\"max_height\":36},\"_3\":{\"url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/badges\\/37fa80b966dee856b5a1f1092ccc8d26_3.png\",\"max_width\":55,\"max_height\":55},\"_5\":{\"url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/badges\\/37fa80b966dee856b5a1f1092ccc8d26_5.png\",\"max_width\":72,\"max_height\":72},\"_7\":{\"url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/badges\\/37fa80b966dee856b5a1f1092ccc8d26_7.png\",\"max_width\":90,\"max_height\":90},\"_9\":{\"url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/badges\\/37fa80b966dee856b5a1f1092ccc8d26_9.png\",\"max_width\":100,\"max_height\":100},\"_11\":{\"url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/badges\\/37fa80b966dee856b5a1f1092ccc8d26_11.png\",\"max_width\":120,\"max_height\":120},\"_13\":{\"url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/badges\\/37fa80b966dee856b5a1f1092ccc8d26_13.png\",\"max_width\":180,\"max_height\":180},\"_15\":{\"url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/badges\\/37fa80b966dee856b5a1f1092ccc8d26_15.png\",\"max_width\":280,\"max_height\":280},\"_17\":{\"url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/badges\\/37fa80b966dee856b5a1f1092ccc8d26_17.png\",\"max_width\":600,\"max_height\":600}}}}}';
         }
           else
           { 
         returnData = CredlyJSONCalls.getCredly(CredlyJSONCalls.getURL()+ 'badges/' + badgeID +'?' + createURL);
         system.debug(returnData);
           }  
          //parseResults
         CredlyJSON2ApexErrors obj = CredlyJSON2ApexErrors.parse(returnData);
        if (obj.meta.status.compareTo('OK') == 0)
            {
             CredlyJSON2ApexCredlySingleBadgeData obj2 = CredlyJSON2ApexCredlySingleBadgeData.parse(returnData);
            mySingleBadge.data = obj2.data; 
          //    for (CredlyJSON2ApexMyBadges.Data i : myBadges) {
          //    }
            } 
   
            return mySingleBadge;
        }
        
   public static String getCategoryId(String searchString)
   {
    String returnData;
    String createURL;
    String errMessage;
    String stsMessage;
    String xbadgeURL;
    String securityToken;
    Integer credlyId;
    String userName;
    String temp;
    String name;
    
    CredlyJSON2ApexCredlyCategoryId myCategoryId = new CredlyJSON2ApexCredlyCategoryId();
    
     staticCredlyClass.Token j = staticCredlyClass.getToken(); 
     securityToken = j.APItoken;
    
       Map<String, String> mBadge = new Map<String, String>();
        mBadge.put('query',searchString.trim());  
        mBadge.put('access_token',securityToken);  
        mBadge.put('page','1');  
        mBadge.put('per_page','1');  
        
      createURL = CredlyJSONCalls.createURLString(mBadge);
        
           //post badge to credly
               if (test.isRunningTest()) {
             returnData = '{"meta":{"status_code":200,"status":"OK","message":"","more_info":null},"data":[{"total":14,"id":248,"type":"badge","name":"ABAP programming","created_at":"Sat, 17 Nov 2012 18:42:00 -0500","resources":{"url":"https://api.credly.com/v1.1/badges/categories/248"}}],"paging":{"page":1,"per_page":1,"order_direction":"ASC","multi_result_count":null}}';
           }
           else
           { 
         returnData = CredlyJSONCalls.getCredly(CredlyJSONCalls.getURL()+ 'badges/categories' + '?' + createURL);
           } 
          //parseResults
         CredlyJSON2ApexErrors obj = CredlyJSON2ApexErrors.parse(returnData);
        if (obj.meta.status.compareTo('OK') == 0)
            {
             CredlyJSON2ApexCredlyCategoryId obj2 = CredlyJSON2ApexCredlyCategoryId.parse(returnData);
              myCategoryId.data = obj2.data; 
            } 
            return String.valueOf(myCategoryId.data[0].id);
        }
           
           
    public static List<CredlyJSON2ApexMyMemberBadges.Data> getMyMemberBadges()
   {
   
    String returnData;
    String createURL;
    String errMessage;
    String stsMessage;
    String xbadgeURL;
    String securityToken;
    Integer credlyId;
    String userName;
    String temp;
    String name; 
    
    List<CredlyJSON2ApexMyMemberBadges.Data> myMemberBadges = new List<CredlyJSON2ApexMyMemberBadges.Data>();
    
     staticCredlyClass.Token j = staticCredlyClass.getToken(); 
     securityToken = j.APItoken;
    
       Map<String, String> mBadge = new Map<String, String>();
      mBadge.put('access_token',securityToken);  
      mBadge.put('page','1');
      mBadge.put('per_page','9999');  
        
      createURL = CredlyJSONCalls.createURLString(mBadge);
        
           //post badge to credly
           
               if (test.isRunningTest()) {
                returnData = '{"meta":{"status_code":200,"status":"OK","message":"","more_info":null},"data":[{"id":999999,"member_id":0,"issuer_id":10636,"badge_id":15594,"title":"joseph Apostrophe Test 2","short_description":"testing","image":"https://credlyapp.s3.amazonaws.com/badges/517cf495acf031e1f5138ff30d7f182b.png","created_at":"Sun, 23 Mar 2014 18:15:31 -0400","expires_at":"","is_draft":false,"is_accepted":false,"is_visible":true,"is_deleted":false,"description":"testing","criteria":"testing Josephs apostrophe","categories":[],"issuer_categories":[],"member":null,"member_orphan":{"id":74637,"member_badge_id":102418,"email":"legacy@starfishenterprise.net","first_name":"Jake","last_name":"Llorrac"},"issuer":{"id":10636,"slug":"","type":"user","display_name":"Joseph Legacy","avatar":"https://credlyapp.s3.amazonaws.com/avatars/ca02cd78b68d82da8e01272ba271901d.jpeg","account_type":"Free","is_pro":false,"is_email_verified":true,"is_account_verified":false,"member_badge_count":0,"issued_badge_count":0,"trusted_by_count":0,"lists_count":0,"first_name":"Joseph","last_name":"Legacy","email":"jlegacy@suddenlink.net","bio":"","location":"","website":"","last_activity":false,"created_at":"Wed, 27 Nov 2013 23:32:54 -0500","updated_at":"Thu, 06 Feb 2014 03:03:08 -0500"},"badge":{"id":15594,"title":"joseph Apostrophe Test 2","short_description":"testing","image_url":"https://credlyapp.s3.amazonaws.com/badges/517cf495acf031e1f5138ff30d7f182b.png","is_giveable":false,"created_at":"Sun, 23 Mar 2014 18:13:21 -0400","creator_id":10636,"is_claimable":false,"description":"testing","criteria":"testing Josephs apostrophe","expires_in":0,"creator":{"id":10636,"slug":"","type":"user","display_name":"Joseph Legacy","avatar":"https://credlyapp.s3.amazonaws.com/avatars/ca02cd78b68d82da8e01272ba271901d.jpeg","account_type":"Free","is_pro":false,"is_email_verified":true,"is_account_verified":false,"member_badge_count":0,"issued_badge_count":0,"trusted_by_count":0,"lists_count":0,"first_name":"Joseph","last_name":"Legacy","email":"jlegacy@suddenlink.net","bio":"","location":"","website":"","last_activity":false,"created_at":"Wed, 27 Nov 2013 23:32:54 -0500","updated_at":"Thu, 06 Feb 2014 03:03:08 -0500"},"categories":[{"id":995,"name":"ability to cooperate","created_at":"Sat, 17 Nov 2012 18:42:28 -0500"},{"id":795,"name":"(sodium) vapour lamp","created_at":"Sat, 17 Nov 2012 18:42:20 -0500"}],"require_claim_code":true,"require_claim_evidence":false,"require_claim_evidence_description":"","approve_claim_automatically":false,"components":{"icon":{"id":3771,"type":"icon","filename":"pencil-347","vector_ext":"svg","raster_ext":"png","vector_url":"https://credlyapp.s3.amazonaws.com/assets/icon/pencil-347.svg","raster_url":"https://credlyapp.s3.amazonaws.com/assets/icon/pencil-347.png","meta":{"attribute":"The Noun Project","license":"Creative Commons - Attribution (CC BY 3.0)","noun":"Pencil","npid":"347"}},"meta":{"banner-color":"#c3c3c3","banner-text":"Blank Slate","banner-text-color":"#ffffff","border":"solid","border-color":"#000000","custom_icon":"1","expires_amount":"1","expires_units":"never","icon-color":"#000000","shape":"circle-badge","shape-color":"#ffffff"}}},"badge_evidence":[],"badge_testimonial":[{"id":35398,"composer_id":10636,"member_badge_id":102418,"body":"Joseph","created_at":"Sun, 23 Mar 2014 18:15:31 -0400"}]}],"paging":{"page":1,"per_page":1,"order_direction":"DESC","total_results":74,"multi_result_count":2,"resources":{"next":"https://api.credly.com/v1.1/me/badges/given?access_token=efaa8a6c587c02edfd4ba1cc88c2fee7a09ce865eaff860a6a6a92a85c0445c4bfb26951a03bee7bed5d17ed684a194da0dced5559aa23453231699a6db85ecd&per_page=1&page=2&order_direction=DESC"}}}';
           }
           else
           { 
     
         returnData = CredlyJSONCalls.getCredly(CredlyJSONCalls.getURL()+ 'me/badges/given?' + createURL);
           }  

          //parseResults
       //  CredlyJSON2ApexErrors obj = CredlyJSON2ApexErrors.parse(returnData);
       // if (obj.meta.status.compareTo('OK') == 0)
       //     {
            CredlyJSON2ApexMyMemberBadges obj2 = CredlyJSON2ApexMyMemberBadges.parse(returnData);
            myMemberBadges = obj2.Data;
          //    for (CredlyJSON2ApexMyBadges.Data i : myBadges) {
          //    }
     //       } 
            return myMemberBadges;
        }
        
  /* public static List<CredlyJSON2ApexMyIssuedBadges.Data> getMyIssuedBadges()
  {
    String returnData;
    String createURL;
    String errMessage;
    String stsMessage;
    String xbadgeURL;
    String securityToken;
    Integer credlyId;
    String userName;
    String temp;
    String name; 
    
    List<CredlyJSON2ApexMyIssuedBadges.Data> myIssuedBadges = new List<CredlyJSON2ApexMyIssuedBadges.Data>();
    
     staticCredlyClass.Token j = staticCredlyClass.getToken(); 
     securityToken = j.APItoken;
    
       Map<String, String> mBadge = new Map<String, String>();
      mBadge.put('access_token',securityToken);  
      mBadge.put('page','1');
      mBadge.put('per_page','9999');  
        
      createURL = CredlyJSONCalls.createURLString(mBadge);
        
           //post badge to credly
               if (test.isRunningTest()) {
                returnData = '{"meta":{"status_code":200,"status":"OK","message":"","more_info":null},"data":[{"id":102418,"member_id":0,"issuer_id":10636,"badge_id":15594,"title":"joseph Apostrophe Test 2","short_description":"testing","image":"https://credlyapp.s3.amazonaws.com/badges/517cf495acf031e1f5138ff30d7f182b.png","created_at":"Sun, 23 Mar 2014 18:15:31 -0400","expires_at":"","is_draft":false,"is_accepted":false,"is_visible":true,"is_deleted":false,"description":"testing","criteria":"testing Josephs apostrophe","categories":[],"issuer_categories":[],"member":null,"member_orphan":{"id":74637,"member_badge_id":102418,"email":"legacy@starfishenterprise.net","first_name":"Jake","last_name":"Llorrac"},"issuer":{"id":10636,"slug":"","type":"user","display_name":"Joseph Legacy","avatar":"https://credlyapp.s3.amazonaws.com/avatars/ca02cd78b68d82da8e01272ba271901d.jpeg","account_type":"Free","is_pro":false,"is_email_verified":true,"is_account_verified":false,"member_badge_count":0,"issued_badge_count":0,"trusted_by_count":0,"lists_count":0,"first_name":"Joseph","last_name":"Legacy","email":"jlegacy@suddenlink.net","bio":"","location":"","website":"","last_activity":false,"created_at":"Wed, 27 Nov 2013 23:32:54 -0500","updated_at":"Thu, 06 Feb 2014 03:03:08 -0500"},"badge":{"id":15594,"title":"joseph Apostrophe Test 2","short_description":"testing","image_url":"https://credlyapp.s3.amazonaws.com/badges/517cf495acf031e1f5138ff30d7f182b.png","is_giveable":false,"created_at":"Sun, 23 Mar 2014 18:13:21 -0400","creator_id":10636,"is_claimable":false,"description":"testing","criteria":"testing Josephs apostrophe","expires_in":0,"creator":{"id":10636,"slug":"","type":"user","display_name":"Joseph Legacy","avatar":"https://credlyapp.s3.amazonaws.com/avatars/ca02cd78b68d82da8e01272ba271901d.jpeg","account_type":"Free","is_pro":false,"is_email_verified":true,"is_account_verified":false,"member_badge_count":0,"issued_badge_count":0,"trusted_by_count":0,"lists_count":0,"first_name":"Joseph","last_name":"Legacy","email":"jlegacy@suddenlink.net","bio":"","location":"","website":"","last_activity":false,"created_at":"Wed, 27 Nov 2013 23:32:54 -0500","updated_at":"Thu, 06 Feb 2014 03:03:08 -0500"},"categories":[{"id":995,"name":"ability to cooperate","created_at":"Sat, 17 Nov 2012 18:42:28 -0500"},{"id":795,"name":"(sodium) vapour lamp","created_at":"Sat, 17 Nov 2012 18:42:20 -0500"}],"require_claim_code":true,"require_claim_evidence":false,"require_claim_evidence_description":"","approve_claim_automatically":false,"components":{"icon":{"id":3771,"type":"icon","filename":"pencil-347","vector_ext":"svg","raster_ext":"png","vector_url":"https://credlyapp.s3.amazonaws.com/assets/icon/pencil-347.svg","raster_url":"https://credlyapp.s3.amazonaws.com/assets/icon/pencil-347.png","meta":{"attribute":"The Noun Project","license":"Creative Commons - Attribution (CC BY 3.0)","noun":"Pencil","npid":"347"}},"meta":{"banner-color":"#c3c3c3","banner-text":"Blank Slate","banner-text-color":"#ffffff","border":"solid","border-color":"#000000","custom_icon":"1","expires_amount":"1","expires_units":"never","icon-color":"#000000","shape":"circle-badge","shape-color":"#ffffff"}}},"badge_evidence":[],"badge_testimonial":[{"id":35398,"composer_id":10636,"member_badge_id":102418,"body":"Joseph","created_at":"Sun, 23 Mar 2014 18:15:31 -0400"}]}],"paging":{"page":1,"per_page":1,"order_direction":"DESC","total_results":74,"multi_result_count":2,"resources":{"next":"https://api.credly.com/v1.1/me/badges/given?access_token=efaa8a6c587c02edfd4ba1cc88c2fee7a09ce865eaff860a6a6a92a85c0445c4bfb26951a03bee7bed5d17ed684a194da0dced5559aa23453231699a6db85ecd&per_page=1&page=2&order_direction=DESC"}}}';
           }
           else
           { 
         returnData = CredlyJSONCalls.getCredly(CredlyJSONCalls.getURL()+ 'me/badges/given?' + createURL);
           }  
        
          //parseResults
         CredlyJSON2ApexErrors obj = CredlyJSON2ApexErrors.parse(returnData);
        if (obj.meta.status.compareTo('OK') == 0)
            {
             CredlyJSON2ApexMyIssuedBadges obj2 = CredlyJSON2ApexMyIssuedBadges.parse(returnData);
            myIssuedBadges = obj2.Data; 
            } 
            return myIssuedBadges;
        } */
        
  public static Integer getCredlyIdsFromCredly(String email)
   {
    
    String returnData;
    String createURL;
    String errMessage;
    String stsMessage;
    String xbadgeURL;
    String securityToken;
    Integer credlyId;
    String userName;
    String temp;
  
    //get User Id//
   
   //    staticCredlyClass.Token j = staticCredlyClass.getToken(); 
      
         //userName 
       
 //     name = j.UserName;
           
       // Retrieve Credly Id //
       Map<String, String> mBadge = new Map<String, String>();
       mBadge.put('email', email);
    
     createURL = CredlyJSONCalls.createURLString(mBadge);
     
         if (test.isRunningTest()) {
             returnData = '{"meta":{"status_code":200,"status":"OK","message":"","more_info":null},"data":[{"id":10636,"slug":"","type":"user","display_name":"Joseph Legacy","avatar":"https://credlyapp.s3.amazonaws.com/avatars/ca02cd78b68d82da8e01272ba271901d.jpeg","account_type":"Free","is_pro":false,"is_email_verified":true,"is_account_verified":false,"member_badge_count":0,"issued_badge_count":0,"trusted_by_count":0,"lists_count":0,"first_name":"Joseph","last_name":"Legacy","email":"jlegacy@suddenlink.net","bio":"","location":"","website":"","last_activity":false,"created_at":"Wed, 27 Nov 2013 23:32:54 -0500","updated_at":"Thu, 06 Feb 2014 03:03:08 -0500","phone":"","openbadge_id":0,"connected_accounts":[{"type":"facebook","account_id":"1112216605"}],"emails":[{"id":10654,"email":"jlegacy@suddenlink.net","is_verified":true,"is_primary":true}],"show_full":true,"resources":{"url":"https://api.credly.com/v1.1/members/10636"}}],"paging":{"page":1,"per_page":1,"order_direction":"DESC","multi_result_count":1}}';
           }
           else
           { 
     returnData = CredlyJSONCalls.getCredly(CredlyJSONCalls.getURL() + 'members?' + createURL);
           }  
        //parseResults
         CredlyJSON2ApexErrors obj = CredlyJSON2ApexErrors.parse(returnData);
        if (obj.meta.status.compareTo('OK') == 0)
            {
             CredlyJSON2ApexMemberInfo obj2 = CredlyJSON2ApexMemberInfo.parse(returnData);
            credlyId= (obj2.data[0].id);
            } 
            else
            {
            credlyId= 0;
            }
         
    return credlyId;
   }
  
        }