public with sharing class CustomBadgeController {
        
    
    public String securityToken {get; set;}
    
    public Integer totalNumberofRecords{get;set;}
    public Integer pageLimit{get;set;}
    public Integer pageOffset{get;set;}
    public Integer numberOfPages{get; set;}
    public Integer currentPage{get; set;}
    public ID myID {get;set;}
    public List<CredlyJSON2ApexMyBadges.Data> myCredlyBadges {get;set;}
    public set<String> myCredlyBadgeIDs {get;set;}
     public set<String> mySalesForceCredlyBadgeIDs {get;set;}
    
    public CustomBadgeController () {
    	
    Double j; 
    	
     myId = UserInfo.getUserId();
     String returnData;
   
     renderBadgeBuilder = true;
     renderUpload = false;
     
     //get security token//
      staticCredlyClass.Token tk = staticCredlyClass.getToken(); 
 	  securityToken = tk.APItoken;
  
       addBlock = false;
       showIframe = false;
        detailsBlock = true;
        is_giveable = 'false';
        giveableType = 'false';
        xbadgeURL = '';
        counter = 0;
        pageLimit = staticCredlyClass.PageLimit();
        pageOffset = 0;
        currentPage = 1;
        
        String c = ApexPages.currentPage().getParameters().get('gotoAdd');
     
        
        if (c == 'Y')
        {
            addBadge();
        }
     
    }
   public String giveableType {
        get;
        set;
    }
    
     
       public String categories {
        get;
        set;
    }
    
    public String xbadgeName {
        get;
        set;
    }
    public String xbadgeURL {
        get;
        set;
    }
       public String xiconId{
        get;
        set;
    }
  
     public Boolean showIframe {
        get;
        set;
    }
    
    public pageReference dmlOperation()
    {
    		//Call Credly API to get your badges//
        	myCredlyBadges = staticCredlyClass.getMyBadgesFromCredly();
        	myCredlyBadgeIDs = staticCredlyClass.getCredlyBadgeIdsFromData(myCredlyBadges);
        	mySalesForceCredlyBadgeIDs = staticCredlyClass.getCredlyBadgeIDsFromSalesforce();
        	staticCredlyClass.synchBadgesFromCredly(myCredlyBadges, mySalesForceCredlyBadgeIDs);
       
         totalNumberofRecords = myCredlyBadgeIDs.size();
         
         numberOfPages  = totalNumberofRecords / pageLimit;
         Integer remainder = Math.mod(totalNumberofRecords,pageLimit); 
         if (remainder > 0)
         {
         	++numberOfPages;
         }
         
   
         if (numberOfPages < 1)
         {
         numberOfPages = 1;
         }
         
         
     
        return null;
    }
    
    public pageReference setImageAction()
    {
    	if (document.body != null)
    	{
    		xbadgeURL = 'data:image;base64,' + EncodingUtil.base64Encode(document.body);
    	}
    	return null;
    }
    
    public pageReference passBadgeImageParms()
    {
        return null;
    }
    
    public pageReference setUploadAction()
    {
    		renderBadgeBuilder = (upload_option.compareTo('CR') == 0) ? true : false;
    	    renderUpload = (upload_option.compareTo('SF') == 0) ? true : false;
    	   
    	    document = null;
    	    xBadgeURL = ' ';
    	    xbadgeName = ' ';
    	   
    	    return null;
    }
    
  
     public Integer counter {
        get;
        set;
    }
     public String is_expireNumber {
        
        get;
        set;
    }
    
      public String is_expirePeriod {
        
        get;
        set;
    }
    
    public List < SelectOption > getExpireNumbers() {
        Integer counter = 0;
        List < SelectOption > options = new List < SelectOption > ();
        do {
        options.add(new SelectOption(string.valueof(counter), string.valueof(counter)));
        counter++;
        } while (counter < 100);
      
        return options;
    }
    
     public List < SelectOption > getExpirePeriods() {
        Integer counter = 0;
        List < SelectOption > options = new List < SelectOption > ();
      
        options.add(new SelectOption('never', 'Never'));
        options.add(new SelectOption('day', 'Day(s)'));
        options.add(new SelectOption('week', 'Weeks(s)'));
        options.add(new SelectOption('month', 'Months(s)'));
        options.add(new SelectOption('year', 'Years(s)'));
        
        return options;
    }
  public List < SelectOption > getGiveableTypes() {
        List < SelectOption > options = new List < SelectOption > ();
        options.add(new SelectOption('true', 'Yes'));
        options.add(new SelectOption('false', 'No'));
        return options;
    }
    
      public List < SelectOption > getuploadTypes() {
        List < SelectOption > options = new List < SelectOption > ();
        options.add(new SelectOption('CR', 'Make badge image with Badge Builder'));
        options.add(new SelectOption('SF', 'Upload a badge image'));
        return options;
    }
    public PageReference incrementCounter() {
        return null;
    }
     public void dummy() {
        
    }
    
   // @RemoteAction
     public void setGiveable(String x) {
        is_giveable = x;
   }
    
  
    
    public PageReference closeBadge() {
    
    addBlock = false;
    detailsBlock = true;
    
    PageReference pageRef = new PageReference('/apex/ViewBadges');
        pageRef.setRedirect(true);
        return pageRef;
    }


  
  public String test { get; set; }
 
    public String title { get; set; }
    
      public String short_description { get; set; }
        public String description { get; set; }
          public String criteria { get; set; }
            public String is_giveable { get; set; }
              public Integer expires_in { get; set; }
                  public Boolean addBlock { get; set; }
                   public Boolean detailsBlock{ get; set; }
                   public String upload_option { get; set; }
                    public Boolean renderUpload { get; set; }
                    public Boolean renderBadgeBuilder { get; set; }
              
          
 
  public Document document {
    get {
      if (document == null)
        document = new Document();
      return document;
    }
    set;
  }
 
  
  public class authorizationClass
  {
   public String data;
   public String meta;
  }
 
  public PageReference upload() {
    
  Double y;
  String returnData;
  String createURL;
  String badgeID;
  String errMessage;
  String stsMessage;
  String encodedImage; 
  
  badge__c insertUser = new badge__c();
  
 
  if (xbadgeURL.trim().length() == 0)
  {
     ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, 'Badge Missing - Use Badge Builder to create.'));
     return null;
  }
  
     if (document.body != null) {
            document.AuthorId = UserInfo.getUserId();
            document.FolderId = UserInfo.getUserId(); 
        //    strBody = EncodingUtil.base64Encode(document.body);
              try {
            insert document;

        } catch (DMLException e) {
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, 'Error uploading file'));
            return null;
        }
        }
  
  
   try {
        
        
        insertUser.criteria__c = criteria;
        insertUser.description__c = description;
         insertUser.expire_number__c = integer.valueof(is_expireNumber);
           insertUser.expire_period__c = is_expirePeriod;     

          insertUser.is_giveable__c = is_giveable;
         
            insertUser.short_description__c = short_description;
               insertUser.title__c = title;
           
             
               if (document.body != null)
                {
                  insertUser.upload_file_id__c = document.Id;
                  insertUser.document_id__c = url.getSalesforceBaseUrl().toExternalForm() + '/servlet/servlet.FileDownload?file=' + document.Id;
                }
                else
                {          
                  insertUser.document_id__c = xbadgeURL;
                }
             
       insert insertUser;
          
        } catch (DMLException e) {
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, 'Error creating new badge.'));
            return null;
        }
        
    //Submit Job to Send Badges//
    staticCredlyClass.synchBadgesToCredly();
 
 
    addBlock = false; 
    showIframe = false;
    detailsBlock = true;
    ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'Badge Created Successfully'));
  
    return null;
  }
  
   // ApexPages.StandardgetBadgetroller must be instantiated
    // for standard list controllers
    public List<badge__c> getBadge {
        get {
         
          List<badge__c> badges = [select criteria__c, description__c, expires_in__c, is_giveable__c, short_description__c,title__c, image__c, document_ID__c, credlyBadgeId__c, createdById from badge__c  where (credlyBadgeId__c IN :myCredlyBadgeIDs) or (credlyBadgeId__c = null and createdById = :myId) order by title__c LIMIT :pageLimit OFFSET :pageOffset];   
            return badges;
        }
        set; 
    } 

    // Initialize getBadge and return a list of records
    public List<badge__c> getBadges() {
        return (List<badge__c>) getBadge;
    }
    
    public pageReference addBadge() {
  
        addBlock = true;
        detailsBlock = false;
        return null;
    }
     public pageReference next() {
  
       pageOffset = pageOffset + pageLimit;
       currentPage = currentPage + 1;
       if (currentPage > numberOfPages)
       {
       	currentPage = 1;
       	pageOffset = 0;
       }
       
       
       getBadges();
        return null;
    }
     public pageReference prev() {
  
       pageOffset = pageOffset - pageLimit;
       currentPage = currentPage - 1;
       
       if (currentPage <= 0)
       {
       	pageOffset = 0;
       	currentPage = 1;
       }
       
       getBadges();
       
        return null;
    }
   
 
/*public void synchBadgesFromCredly()
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
	   	  		
    		
     	  	}*/
	

/*public void synchBadgeToCredly(badge__c badge)
{
    String returnData;
  	String createURL;
  	String badgeID;
  	String errMessage;
  	String stsMessage;
  	String encodedImage; 
  	String xbadgeURL;
  	String securityToken;
    
    staticCredlyClass.Token j = staticCredlyClass.getToken(); 
      
 	securityToken = j.APItoken;
 
  	    
    List<badge__c> badgeList = new List<badge__c>();
   // for (badge__c badge : myBadge) {
    // get the image data
     	
     	if (badge.upload_file_id__c == null)
     	{
     		
     		encodedImage = CredlyJSONCalls.getCredlyImage(badge.document_id__c);
     		 	
     	}
     	else
     	{
     	encodedImage = CredlyJSONCalls.getDocumentBlob(badge.upload_file_id__c);	
     	}
     
        if (encodedImage != null && securityToken != null)
        {
        // Build Credly Badge //
       Map<String, String> mBadge = new Map<String, String>();
       mBadge.put('attachment', encodedImage); 
       mBadge.put('title', badge.title__c);
       mBadge.put('short_description', badge.short_description__c = (badge.short_description__c == null) ? ' ' : badge.short_description__c); 
       mBadge.put('description', badge.description__c = (badge.description__c == null) ? ' ' : badge.description__c); 
       mBadge.put('categories',   badge.categories__c = (badge.categories__c == null) ? ' ' : badge.categories__c); 
       mBadge.put('criteria', badge.criteria__c = (badge.criteria__c == null) ? ' ' : badge.criteria__c); 
       mBadge.put('is_giveable', badge.is_giveable__c = (badge.is_giveable__c == null) ? ' ' : badge.is_giveable__c); 
       mBadge.put('expires_in', String.valueOf(badge.expires_in__c)); 
        mBadge.put('access_token',securityToken);  
        
        createURL = CredlyJSONCalls.createURLString(mBadge);
        
           //post badge to credly
           
       
         returnData = CredlyJSONCalls.postCredly(CredlyJSONCalls.getURL()+ 'badges', createURL);  
         system.debug(returnData);
          
        
          //parseResults
         CredlyJSON2ApexErrors obj = CredlyJSON2ApexErrors.parse(returnData);
     	if (obj.meta.status.compareTo('OK') == 0)
     	  	{
     	     CredlyJSON2ApexBadge obj2 = CredlyJSON2ApexBadge.parse(returnData);
      	  	 badge.credlyBadgeId__c = String.valueOf(obj2.data);
      	  	 badgeList.add(badge);
     	  	} 
        }
   //}
   
    update badgeList;
 
   } */

	
}