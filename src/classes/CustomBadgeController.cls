public with sharing class CustomBadgeController {
        
    
    public String securityToken {get; set;}
    
    public CustomBadgeController () {
     String returnData;
   
     renderBadgeBuilder = true;
     renderUpload = false;
     
     //get security token//
     securityToken = CredlyJSONCalls.authenticate(CredlyJSONCalls.getURL() + 'authenticate');
  
       addBlock = false;
       showIframe = false;
        detailsBlock = true;
        is_giveable = 'false';
        giveableType = 'false';
        xbadgeURL = '';
        counter = 0;
        
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
        
        badge__c insertUser = new badge__c();
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
 
    addBlock = false; 
    showIframe = false;
    detailsBlock = true;
    ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'Badge Created Successfully'));
  
    return null;
  }
  
   // ApexPages.StandardgetBadgetroller must be instantiated
    // for standard list controllers
    public ApexPages.StandardSetController getBadge {
        get {
            if(getBadge == null) {
                getBadge = new ApexPages.StandardSetController(Database.getQueryLocator(
                    [select criteria__c, description__c, expires_in__c, is_giveable__c, short_description__c,title__c, image__c, document_ID__c, credlyBadgeId__c from badge__c]));
            }
            return getBadge;
        }
        set;
    }

    // Initialize getBadge and return a list of records
    public List<badge__c> getBadges() {
        return (List<badge__c>) getBadge.getRecords();
    }
    
    public pageReference addBadge() {
  
        addBlock = true;
        detailsBlock = false;
        return null;
    }

}