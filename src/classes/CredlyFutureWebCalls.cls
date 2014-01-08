public with sharing class CredlyFutureWebCalls { /*
@future  (callout=true)
public static void updateBadge(ID badgeId) 
{
	String returnData;
	String securityToken;
	String encodedImage;
	String createURL;
	
 badge__c badge = [select id,criteria__c, description__c, expires_in__c, is_giveable__c, short_description__c, title__c, document_ID__c, credlyBadgeId__c from badge__c where ID = :badgeId LIMIT 1];
    
          //get security token//
     securityToken = CredlyJSONCalls.authenticate(CredlyJSONCalls.getURL() + 'authenticate');

     // get the image data
     	encodedImage = CredlyJSONCalls.getCredlyImage(badge.document_ID__c);
     
        // Build Credly Badge //
       Map<String, String> mBadge = new Map<String, String>();
       mBadge.put('attachment', encodedImage); 
        mBadge.put('title', badge.title__c);
       mBadge.put('short_description', badge.short_description__c); 
       mBadge.put('description', badge.description__c = (badge.description__c == null) ? ' ' : badge.description__c); 
       mBadge.put('categories',  badge.categories__c = (badge.categories__c == null) ? ' ' : badge.categories__c); 
       mBadge.put('criteria', badge.criteria__c = (badge.criteria__c == null) ? ' ' : badge.criteria__c); 
       mBadge.put('is_giveable', badge.is_giveable__c); 
       mBadge.put('expires_in', String.valueOf(badge.expires_in__c)); 
        mBadge.put('access_token',securityToken); 
        
        createURL = CredlyJSONCalls.createURLString(mBadge);
       
           //post badge to credly
         returnData = CredlyJSONCalls.postCredly(CredlyJSONCalls.getURL()+ 'badges/' + badge.credlyBadgeId__c, createURL);
         system.debug(returnData);
      //   
          //parseResults
         CredlyJSON2ApexErrors obj = CredlyJSON2ApexErrors.parse(returnData);
         
         
         
}
@future  (callout=true)
public static void updateMemberBadge(ID badgeId)
{
	String returnData;
	String securityToken;
	String encodedImage;
	String createURL;
	
 member_badge__c memberBadge = [select id,credlyMemberBadge_id_m__c,categories_m__c, is_visible_m__c  from member_badge__c where ID = :badgeId LIMIT 1];
    
          //get security token//
       securityToken = CredlyJSONCalls.authenticate(CredlyJSONCalls.getURL() + 'authenticate');

        // Build Credly Badge //
       Map<String, String> mBadge = new Map<String, String>();
       mBadge.put('is_visible',memberBadge.is_visible_m__c = (memberBadge.is_visible_m__c == null) ? ' ' : memberBadge.is_visible_m__c); 
         mBadge.put('categories',  memberBadge.categories_m__c = (memberBadge.categories_m__c == null) ? ' ' : memberBadge.categories_m__c); 
        mBadge.put('access_token',securityToken); 
   
        createURL = CredlyJSONCalls.createURLString(mBadge);
       
           //post badge to credly
         returnData = CredlyJSONCalls.postCredly(CredlyJSONCalls.getURL()+ 'member_badges/' + memberBadge.credlyMemberBadge_id_m__c, createURL);     
          //parseResults
         CredlyJSON2ApexErrors obj = CredlyJSON2ApexErrors.parse(returnData);*/
}