public with sharing class viewBadgeRulesController {
	
	 public badge__c badge{get;set;}
	  public Boolean customMessageChecked {get; set;}
	public viewBadgeRulesController () {
		step = 1;
		urlLink = ' ';
		renderFile = true;
		hasUploadedFile = false;
		
		  renderStep1 = true;
		   renderStep2 = false;
		    renderStep3 = false;
		     renderStep4 = false;
			renderStep5 = false;
		
		  counter = 0;
        pageLimit = staticCredlyClass.PageLimit();
        badgeOffset = 0;
        ruleOffset = 0; 
        currentRulePage = 1;
        currentBadgePage = 1;

         xSelectedIDs = '';
        renderUpload = false;
        addBlock = false;
         detailsBlock = true;
         
           filterName = '';
        filterBadge = '';
        setRuleText = '';
        setBadgeSelect = '';
        
        uploadedFileName = '';
        
          emailChecked = true;
         
       setTypeSelect  = (populateRecordType != null) ? populateRecordType : 'Account';
        
          myId = UserInfo.getUserId();
        getRuleFields = getFields(setTypeSelect);
       
        getOperandTypes = getOperandTypes();
        
        myCredlyBadges = staticCredlyClass.getMyBadgesFromCredly();
        myCredlyBadgeIDs = staticCredlyClass.getCredlyBadgeIdsFromData(myCredlyBadges);
        mySalesForceCredlyBadgeIDs = staticCredlyClass.getCredlyBadgeIDsFromSalesforce();
         mySalesForceRuleIDs = staticCredlyClass.getRuleIDsFromSalesforce();
        
         //Rules//
            totalNumberofRules = mySalesForceRuleIDs.size();
            
                      numberOfRulePages  = totalNumberofRules / pageLimit;
         			Integer remainder = Math.mod(totalNumberofRules,pageLimit); 
         			if (remainder > 0)
         			{
         			++numberOfRulePages;
         			}
         
   
         			if (numberOfRulePages < 1)
         			{
         			numberOfRulePages = 1;
        			 }
        			 
         //Badges//
          totalNumberofBadges = myCredlyBadgeIDs.size();
       
                      numberOfBadgePages  = totalNumberofBadges / pageLimit;
         			remainder = Math.mod(totalNumberofBadges,pageLimit); 
         			if (remainder > 0)
         			{
         			++numberOfBadgePages;
         			}
         
   
         			if (numberOfBadgePages < 1)
         			{
         			numberOfBadgePages = 1;
        			 }
        			 
              			 
               
    }
       public Integer totalNumberofBadges{get;set;}
        public Integer totalNumberofRules{get;set;}
       
      public List<CredlyJSON2ApexMyBadges.Data> myCredlyBadges {get;set;}
         public Integer pageLimit{get;set;}
    public Integer pageOffset{get;set;}
   
 public Integer badgeOffset{get;set;}
  public Integer ruleOffset{get;set;}
    public Integer numberOfRulePages{get; set;}
     public Integer numberOfBadgePages{get; set;}
    public Integer currentRulePage{get; set;}
     public Integer currentBadgePage{get; set;}
    public set<String> myCredlyBadgeIDs {get;set;}
     public set<String> mySalesForceRuleIDs {get;set;}
     public set<String> mySalesForceCredlyBadgeIDs {get;set;}
      public Boolean emailChecked {get; set;}
       public ID myID {get;set;}
         public Integer counter {
        get;
        set;
    }
    
        public Boolean renderStep1 {
        get;
        set;
    }
     public Boolean renderStep2 {
        get;
        set;
    }
      public Boolean renderStep3 {
        get;
        set;
    }
    
       public Boolean renderStep4 {
        get;
        set;
    }
       public Boolean renderStep5 {
        get;
        set;
    }
    
    public String upload_option { get; set; }
    public Boolean renderFile { get; set; }
    public pageReference setUploadAction()
    {
    		renderFile = (upload_option.compareTo('UP') == 0) ? true : false;
    	    renderLink = (upload_option.compareTo('LN') == 0) ? true : false;
    	   
    	    document = null;
    	    urlLink = ' ';
    	   
    	    return null;
    }
    
     public List < SelectOption > getuploadTypes() {
        List < SelectOption > options = new List < SelectOption > ();
        options.add(new SelectOption('UP', 'Upload an Evidence File'));
        options.add(new SelectOption('LN', 'Use an Evidence URL'));
        return options;
    }
    
      public String customMessage {get; set;}
    
    public Integer step {get; set;}
    
    public String testimonial { get; set; }
    
     public String populateRecordType { get; set; }
    

    public String loadEditRuleDetails {get; set;}
    
    public String ruleParm {get; set;}

    public String selectedBadge;
     public String selectedRecordType;
       public String xSelectedIDs {
        get;
        set;
    }

    
    public String getPopulateRecordType() {
        return selectedRecordType;
    }
    

      public void backStep() { 

      		step = step - 2;
  
      	nextStep();
      }
      
      public void setVisibleStep(Integer passedStep)
      {
      		renderStep1 = (passedStep == 1) ? true:false;
      		renderStep2 = (passedStep == 2) ? true:false;
      		renderStep3 = (passedStep == 3) ? true:false;
      		renderStep4 = (passedStep == 4) ? true:false;
      		renderStep5 = (passedStep == 5) ? true:false;
      } 
    
      public PageReference nextStep() { 
      	step = step + 1;
      	
      	if (step == 1)
      	{
      	    setVisibleStep(1);
      	}
      	if (step == 2)
      	{
      		setVisibleStep(2);
      	}
      	if (step == 3)
      	{
        if (setBadgeSelect.trim().length() == 0) {
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, 'Need to Select a Badge'));
            step = 2;
            setVisibleStep(2);
        }
      		
      		setVisibleStep(3);
      	}
      		      	
      		if (step == 4)
      	{
      		if (name.trim().length() == 0)
      		{
      			step = 3;
            	setVisibleStep(3);
            	ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, 'Need Rule Name'));
      		}
      		
      			if (setRuleText.trim().length() == 0)
      		{
      			step = 3;
            	setVisibleStep(3);
            	ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, 'Need a Rule'));
      		}
      		
      		setVisibleStep(4);
      		loadEditRuleDetails = 'N';
      	//	showReview();
      	}
      	
      		if (step == 6)
      	{
      	//	showConfirm();
      	}
      	
        return null;
    }
    
    public void setPopulateRecordType(String selectedRecordType) {
        this.selectedRecordType = selectedRecordType ;
    }
    
    public String selectedBadgeValue { get; set; }
    public Boolean hasUploadedFile { get; set; }
     
    public String setBadgeSelect{ get; set;}
    public String setTypeSelect{ get; set; }
     public String uploadedFileName{get; set;}
    
    public pageReference modify() {
    
    	
    	setBadgeSelect = xBadgeId;
    	
        List < badge_rules__c > rule = [select id, account_type_r__c, evidence_id_r__c, evidence_name_r__c, evidence_r__c, lookup_id_r__c, rule_name_r__c, testimonial_r__c, badge_rule_r__c, badge_visual_rule_r__c,send_email_r__c,evidence_url_r__c,custom_message_r__c   from badge_rules__c where ID = :xRuleId LIMIT 1];
        
         List < badge__c > badge = [select id, title__c, credlyBadgeId__c from badge__c where ID = :xBadgeId LIMIT 1];
       
     
       
         for (badge_rules__c x: rule)
        {
        name = x.rule_name_r__c;
        populateRecordType = x.account_type_r__c;
        setTestimonialSelect = x.testimonial_r__c;
        ruleParm = x.badge_rule_r__c;
        emailChecked = x.send_email_r__c;
        uploadedFileName = x.evidence_name_r__c; 
        
        hasUploadedFile = uploadedFileName == null ? false : true;
        
        customMessage = x.custom_message_r__c;
      
        urlLink = x.evidence_url_r__c;
        
        if (urlLink != null)
        {
        	renderFile = false;
        	renderLink = true;
        	
        	upload_option = 'LN';
        }
        }
        
       step = 2;
       setVisibleStep(2);
         
         // read by jquery document ready //
         loadEditRuleDetails = 'Y';
         
       return null;
    }
    
     public PageReference deleteBadgeRuleController() {
    
     
        List < badge_rules__c> badgeRule = [Select Id from badge_rules__c where Id = : xRuleId  LIMIT 1];
      
        try {
            delete badgeRule;
        } catch (DMLException e) {
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, 'Error Deleting Rule.'));
        }
        
        return null;
    }


    public PageReference setRuleEmpty() {
        return null;
    }


    public String setOperandField1 { get; set; }

    public String getRuleField1 { get; set; }


     public String xRuleId{ get; set; } 
     
     public String xBadgeId{ get; set; } 
 
    public List<SelectOption> getOperandTypes { get; set; }

    public String rule2 { get; set; }

    public String rule1 { get; set; }

    public PageReference deleteRuleDetail() {
        return null;
    }
    
    
 public void reloadFields () {
        
       renderUpload = false;
        addBlock = true;
        detailsBlock = false;
     //   setBadgeSelect =  xBadgeId;
        setTypeSelect  = (populateRecordType != null) ? populateRecordType : 'Account';
        
        getRuleFields = getFields(setTypeSelect);
     
        getOperandTypes = getOperandTypes();
      
    } 
    
  
    
    public class ruleDetails{
        public string fieldName{get; set;}  
         public string fieldOperand{get; set;}             
    }

    public List<ruleDetails> testList = new List<ruleDetails>();
    
    public String setTestimonialSelect{get;set;}
    
    public String setRuleText{get;set;}
    
    public List < SelectOption > getRuleFields { get; set; }
    
    public List < SelectOption > getDropBadges() {
        List < badge__c > newBadges = getBadges();


        List < SelectOption > options = new List < SelectOption > ();
          options.add(new SelectOption('', ''));
        for (badge__c c: newBadges) {
            options.add(new SelectOption(c.id, c.title__c + ' - ' + c.short_description__c)  );
        }
        
        return options;
    }
    
      // Initialize getBadge and return a list of records
    public List < badge__c > getBadges() {
            return (List<badge__c>) getBadge;
    } 

    public PageReference setTestimonialEmpty() {
        return null;
    }

    public PageReference setBadgeIdEmpty() {
        return null;
    }
    
      public pageReference nextRule() {
  
       ruleOffset = ruleOffset + pageLimit;
       currentRulePage = currentRulePage + 1;
       if (currentRulePage > numberOfRulePages)
       {
       	currentRulePage = 1;
       	ruleOffset = 0;
       }
       
       
       getRules();
        return null;
    }
     public pageReference prevRule() { 
  
       ruleOffset = ruleOffset - pageLimit;
       currentRulePage = currentRulePage - 1;
       
       if (currentRulePage <= 0)
       {
       	ruleOffset = 0;
       	currentRulePage = 1;
       }
       
       getRules();
       
        return null;
    }
    
      public pageReference nextBadge() {
  
       badgeOffset = badgeOffset + pageLimit;
       currentBadgePage = currentBadgePage + 1;
       if (currentBadgePage > numberOfBadgePages)
       {
       	currentBadgePage = 1;
       	badgeOffset = 0;
       }
       
       
       getBadges();
        return null;
    }
     public pageReference prevBadge() { 
  
       badgeOffset = BadgeOffset - pageLimit;
       currentBadgePage = currentBadgePage - 1;
       
       if (currentBadgePage <= 0)
       {
       	BadgeOffset = 0;
       	currentBadgePage = 1;
       }
       
       getBadges();
       
        return null;
    }

       public List<badge__c> getBadge {
       get {
       	
       	List<badge__c> badges;
        	//	system.debug(filterBadge);
        	
        	 // ApexPages.StandardgetBadgetroller must be instantiated
    // for standard list controllers

        
          badges = [select criteria__c, description__c, expires_in__c, is_giveable__c, short_description__c,title__c, image__c, document_ID__c, credlyBadgeId__c, createdById from badge__c  where (credlyBadgeId__c IN :myCredlyBadgeIDs) order by title__c LIMIT :pageLimit OFFSET :badgeOffset];   
            
        	   if (((filterBadge != null) || (filterBadge.trim().length() != 0))) 
               {
               filterBadgeSearch = filterBadge;
          badges = [select id,criteria__c, description__c, expires_in__c, is_giveable__c, short_description__c, title__c, image__c, document_ID__c, credlyBadgeId__c  from badge__c where (credlyBadgeId__c IN :myCredlyBadgeIDs) and title__c like :filterBadgeSearch LIMIT :pageLimit OFFSET :badgeOffset];
            }
            
            if (((filterBadge == null) || (filterBadge.trim().length() == 0))) 
            {
            badges =[select id,criteria__c, description__c, expires_in__c, is_giveable__c, short_description__c, title__c, image__c, document_ID__c, credlyBadgeId__c  from badge__c where (credlyBadgeId__c IN :myCredlyBadgeIDs) LIMIT :pageLimit OFFSET :badgeOffset];
            }
               
           return badges;
        }
        set;
    }

      public List < SelectOption > getRecordTypes() {
        List < SelectOption > options = new List < SelectOption > ();
        options.add(new SelectOption('Account', 'Account'));
        options.add(new SelectOption('Contact', 'Contact'));
         options.add(new SelectOption('Lead', 'Lead'));
        return options;
    }
    
     public List < SelectOption > getOperandTypes() {
        List < SelectOption > options = new List < SelectOption > ();
        options.add(new SelectOption('eq', 'equal to'));
        options.add(new SelectOption('lt', 'less than'));
        options.add(new SelectOption('le', 'less than or equal to'));
         options.add(new SelectOption('gt', 'greater than'));
           options.add(new SelectOption('ge', 'greater than or equal to'));
           options.add(new SelectOption('ct', 'contains'));
             options.add(new SelectOption('ne', 'not equal to'));
         
        return options;
    }


    public PageReference renderPage() {
        return null;
    }

    public String filterName { get; set; }

    public String renderFilters { get; set; }

    public String renderBadges { get; set; }


    public PageReference hideUpload() {
         renderUpload = false;
         addBlock = false;
         detailsBlock = true;
      
         PageReference newocp = new PageReference('/apex/viewBadgeRules');
         newocp.setRedirect(true);
         return newocp;
    }


    public Boolean renderUpload { get; set; }
     
     public Boolean renderLink { get; set; }
     
      public String urlLink {get; set;}

    public String name { get; set; }
    public String rule { get; set; }

    public PageReference addBadge() {
    		renderStep1 = false;
    		renderStep2 = true;
    		renderStep3 = false;
    		renderStep4 = false;
    		renderStep5 = false;
            xRuleId = null;
            xBadgeId = null;
          detailsBlock = false;
          addBlock = true;
        return null;
    }
    
     public String filterBadge {
        get;
        set;
    }

    public String filterBadgeSearch {
        get {
            return '%' + filterBadgeSearch + '%';
        }

        set {
            filterBadgeSearch = filterBadge;
        }

    }
    
      public PageReference searchBadge() {
     	  getBadges();
        return null;
     }



    public Boolean detailsBlock { get; set; }


public Document document {
    get {
      if (document == null)
        document = new Document();
      return document;
    }
    set;
  }

 // ApexPages.StandardgetBadgetroller must be instantiated
    // for standard list controllers
    public List<badge_rules__c> getRule {
   
        get {
        		List<badge_rules__c> rules; 
          
                rules = [select id, badge_lookup__r.title__c ,account_type_r__c, evidence_id_r__c, 
                    evidence_name_r__c, evidence_r__c, lookup_id_r__c, 
                    rule_name_r__c, testimonial_r__c, badge_rule_r__c, 
                    badge_visual_rule_r__c,
                    badge_lookup__r.image__c,
                    number_of_badges_issued_r__c,
                    date_last_issued_r__c,
                    evidence_url_r__c, createdByid
                    from badge_rules__c  where createdById = :myId LIMIT :pageLimit OFFSET :ruleOffset]; 
           
            return rules; 
        }
        set;
    }

    // Initialize getBadge and return a list of records
    public List<badge_rules__c> getRules() {
      return (List<badge_rules__c>) getRule;
    }
 

    public String expires_in { get; set; }

    public String is_giveable { get; set; }

    public String criteria { get; set; }

    public String description { get; set; }

    public String short_description { get; set; }

    public String title { get; set; }
    
    public PageReference closeBadge() {
      renderUpload = false;
         addBlock = false;
         detailsBlock = true;
      return null;
    }


    public Boolean addBlock { get; set; }
    
 
    public PageReference upload() {
    
       if (document.body != null) {
           document.AuthorId = UserInfo.getUserId();
        document.FolderId = UserInfo.getUserId(); // put it in running user's folder

        //Encode the image string for storage on the server//
        String strBody = EncodingUtil.base64Encode(document.body);
        }

        //  test = 'this better work';
        // getBadges('https://apistaging2.credly.com/v0.2/badges?page=1&per_page=10&order_direction=ASC');
        //system.debug(strBody);

        //  system.debug(document.body);



        try {
         if (document.body != null) {
         insert document;
         }
        }
        catch (DMLException e) {
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, 'Error uploading file'));
            return null;
        }
          
             
        
        
        //get original base badge
        
        
       //  badge = [Select Id, criteria__c, description__c, document_id__c,
       //  expires_in__c, image__c,is_giveable__c, short_description__c,
       //  title__c from badge__c where ID = : setBadgeSelect LIMIT 1];
       
        if (xRuleId == null)
           {
         
         badge_rules__c ruleBadge = new badge_rules__c ();
         ruleBadge.badge_lookup__c = setBadgeSelect;
         ruleBadge.lookup_id_r__c = setBadgeSelect;
         ruleBadge.rule_name_r__c = name;
         ruleBadge.badge_visual_rule_r__c = automatedTriggerClass.displayRule(setRuleText);
         ruleBadge.badge_rule_r__c = setRuleText;
         ruleBadge.testimonial_r__c =  setTestimonialSelect;
         ruleBadge.send_email_r__c = emailChecked;
         ruleBadge.account_type_r__c = populateRecordType ;
         ruleBadge.custom_message_r__c = customMessage;
        
       
         if (document.body == null) {
             ruleBadge.evidence_url_r__c = urlLink;
            
             }
         else
         {
             ruleBadge.evidence_id_r__c = document.Id;
             ruleBadge.evidence_name_r__c = document.Name;
             
             }
             
            try {
            insert ruleBadge;
        } catch (DMLException e) {
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, 'Error Creating Automated Rule.'));
        }
         finally {
            document.body = null; // clears the viewstate
            document = new Document();
        }
            }
            
            if (xRuleId != null)
            {
            List < badge_rules__c > ruleBadge = [Select id, account_type_r__c, evidence_id_r__c, evidence_name_r__c, evidence_r__c, lookup_id_r__c, rule_name_r__c, testimonial_r__c, badge_rule_r__c, badge_visual_rule_r__c, send_email_r__c, custom_message_r__c,badge_lookup__c, evidence_url_r__c from badge_rules__c where Id = : xRuleId LIMIT 1];
            for (badge_rules__c i: ruleBadge) {
           
          i.badge_lookup__c = setBadgeSelect;
         i.lookup_id_r__c = setBadgeSelect;
         i.rule_name_r__c = name;
         i.badge_visual_rule_r__c = automatedTriggerClass.displayRule(setRuleText);
         i.badge_rule_r__c = setRuleText;
        
         i.testimonial_r__c =  setTestimonialSelect; 
        i.account_type_r__c = populateRecordType;
         i.send_email_r__c = emailChecked;
         i.custom_message_r__c = customMessage;
        
         if (document.body != null) {
           
             i.evidence_id_r__c = document.ID;
             i.evidence_name_r__c = document.Name;
             i.evidence_url_r__c = '';
           }
           
           if (urlLink != null)
             {
             i.evidence_url_r__c = urlLink;
             i.evidence_id_r__c = '';
             i.evidence_name_r__c = '';
             }
             }
            
        try {
            update ruleBadge;
        } catch (DMLException e) {
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, 'Error Updating Rule.'));
        }
         finally {
            document.body = null; // clears the viewstate
            document = new Document();
        }
        }
        
      

        hideUpload();

        ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO, 'Badge Rule Successfully Created'));

        PageReference pageRef = new PageReference('/apex/viewBadgeRules');
        pageRef.setRedirect(true);
        return pageRef;
    
    }
    
    
    
public List<SelectOption> getFields(String xtype) 
{   
 // Set<String> result = new Set<String>();
 String label;
 List<SelectOption> options = new List<SelectOption>();  
 Map<String, Schema.SObjectType> 
 schemaMap = Schema.getGlobalDescribe();
 
Schema.SObjectType leadSchema = schemaMap.get(xtype);
 
 Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
 options.add(new SelectOption('',''));  
 for (String fieldName: fieldMap.keySet())
  {  
  Schema.DescribeFieldResult fieldObject = fieldMap.get(fieldName).getDescribe();
     
      options.add(new SelectOption(String.valueOf(fieldObject.getName()) + ':' + String.valueOf(fieldObject.getType()), String.valueOf(fieldObject.getLabel()))); 
  }  
   return options;
   }

//public static String helloWorld()
//{
//return 'hello world';
//}


////public static Set<String> getFieldValues(SObject[] objects, SObjectField field) {
 // Set<String> result = new Set<String>();
 // if (null != objects) {
 //   final String fieldName = field.getDescribe().getName();
 //   for (SObject o : objects) {
  //    result.add(String.valueOf(o.get(fieldName)));
 //   }
 //   result.remove(null);
 // }
 // return result;
//}
}