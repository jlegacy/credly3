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
    //    system.debug(encodedImage);
        return encodedImage; 
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
 
}