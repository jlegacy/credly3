public with sharing class ViewMemberBadgeController {

    public PageReference refreshScreenController() {
        return null;
    }
    
          public List<CredlyJSON2ApexMyMemberBadges.Data> myCredlyMemberBadges {get;set;}
    public set<Integer> myCredlyMemberBadgeIDs {get;set;}
     public set<String> mySalesForceCredlyMemberBadgeIDs {get;set;}
       public Integer totalNumberofRecords{get;set;}
          public List<CredlyJSON2ApexMyBadges.Data> myCredlyBadges {get;set;}
    public set<String> myCredlyBadgeIDs {get;set;}
    public Integer pageLimit{get;set;}
    public Integer pageOffset{get;set;}
    public Integer numberOfPages{get; set;}
    public Integer currentPage{get; set;}
     public ID myID {get;set;} 
    
     public pageReference dmlOperation()
    {
        myId = UserInfo.getUserId();
        
         pageLimit = staticCredlyClass.PageLimit();
        badgeOffset = 0;
       
        currentBadgePage = 1;
    		//Call Credly API to get your badges//
    		
    		myCredlyBadges = staticCredlyClass.getMyBadgesFromCredly();
        	myCredlyBadgeIDs = staticCredlyClass.getCredlyBadgeIdsFromData(myCredlyBadges);
    		
        	myCredlyMemberBadges = staticCredlyClass.getMyMemberBadgesFromCredly();  
        	mySalesForceCredlyMemberBadgeIDs = staticCredlyClass.getCredlyMemberIDsFromSalesforce();
        	staticCredlyClass.synchMemberBadgesFromCredly(myCredlyMemberBadges, mySalesForceCredlyMemberBadgeIDs);
        	myCredlyMemberBadgeIDs = staticCredlyClass.getCredlyMemberBadgeIdsFromData(myCredlyMemberBadges);
        	
        return null;
    }

    public ViewMemberBadgeController() {
    recordType = 'All';
    filterName = '';
    
    }
    public Integer currentBadgePage{get; set;} 
    public Integer badgeOffset{get;set;}
   public Integer totalNumberofBadges{get;set;}
   public Integer numberOfBadgePages{get; set;}
    
     public String filterNameSearch {
        get {
            return '%' + filterNameSearch + '%';
        }

        set {
            filterNameSearch = filterName;
        }
        }
      public Boolean renderAccounts {
        get;
        set;
    }
    
     public Boolean renderLeads {
        get;
        set;
    }
       public Boolean renderContacts{
        get;
        set;
    }

    public PageReference renderPage() {
      //  getBadges(); 
        return null;
    }
    
      public String showAs{get; set;} 
      public String showExcel{get; set;} 
    
     public PageReference createPDF() {
       showAs = 'pdf';
       return null;
    }
     public PageReference createExcel() {
       showExcel = 'application/vnd.ms-excel';
       return null;
    }


      public List < SelectOption > getRecordTypes() {
        List < SelectOption > options = new List < SelectOption > ();
        options.add(new SelectOption('All', 'All'));
        options.add(new SelectOption('title', 'Badge (Title)'));
        options.add(new SelectOption('recipient', 'Recipient'));
         options.add(new SelectOption('category', 'Sitewide Badge Category'));
        return options;
    }

    
    public String recordType { get; set; }

    public String filterName { get; set; }

    public String renderFilters { get; set; }
    
      public pageReference nextBadge() {
  
       badgeOffset = badgeOffset + pageLimit;
       currentBadgePage = currentBadgePage + 1;
       if (currentBadgePage > numberOfBadgePages)
       {
       	currentBadgePage = 1;
       	badgeOffset = 0;
       }
       
       
     //  getBadges();
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
       
     //  getBadges();
       
        return null;
    }
    
    public void resetPageLimitController()
    {
     badgeOffset = 0;
     currentBadgePage = 1;
    }

     // ApexPages.StandardgetBadgetroller must be instantiated
    // for standard list controllers
    public List<member_badge__c> getBadge() {
        	 List<member_badge__c> memberBadges;
               
               if (((filterName == null) || (filterName.trim().length() == 0)) && (recordType.equals('All')))  
               {
               
                memberBadges = [select credlyMemberBadge_id_m__c
                    from member_badge__c  where ((credlyMemberBadge_id_m__c IN :myCredlyMemberBadgeIDs) or (credlyMemberBadge_id_m__c = null and createdById = :myId))];
               
                  setPagingInfo(memberBadges);
                  
                memberBadges = [select criteria_m__c, description_m__c, expires_in_m__c, 
                    short_description_m__c,title_m__c, image_m__c, 
                    evidence_m__c, evidence_id_m__c,name_m__c,account_type_m__c,
                    document_ID_m__c, account_lookup_m__c,contact_lookup_m__c,lead_lookup_m__c,  badge_lookup_m__r.title__c, badge_lookup_m__r.credlyBadgeId__c, 
                    issue_date_m__c, testimonial_m__c, evidence_url_m__c,lead_lookup_m__r.email,contact_lookup_m__r.email, expire_date_m__c, credlyMemberBadge_id_m__c
                    from member_badge__c  where ((credlyMemberBadge_id_m__c IN :myCredlyMemberBadgeIDs) or (credlyMemberBadge_id_m__c = null and createdById = :myId)) order by issue_date_m__c LIMIT :pageLimit OFFSET :badgeOffset];
                  
                   return memberBadges;
                    }
                    
        
                    
               if (!recordType.equals('All'))
               {
               filterNameSearch = filterName.trim();
               if (recordType.equals('title'))
               {
               	
               	   memberBadges = [select badge_lookup_m__r.title__c, credlyMemberBadge_id_m__c
                    from member_badge__c where badge_lookup_m__r.title__c like :filterNameSearch and ((credlyMemberBadge_id_m__c IN :myCredlyMemberBadgeIDs) or (credlyMemberBadge_id_m__c = null and createdById = :myId))];
                  
                setPagingInfo(memberBadges); 
          
                memberBadges = [select criteria_m__c, description_m__c, expires_in_m__c, 
                    short_description_m__c,title_m__c, image_m__c, 
                    evidence_m__c, evidence_id_m__c,name_m__c,account_type_m__c,
                    document_ID_m__c,  account_lookup_m__c,contact_lookup_m__c,lead_lookup_m__c, badge_lookup_m__r.title__c, badge_lookup_m__r.credlyBadgeId__c,
                    issue_date_m__c, testimonial_m__c, evidence_url_m__c,lead_lookup_m__r.email,contact_lookup_m__r.email, expire_date_m__c
                    from member_badge__c where badge_lookup_m__r.title__c like :filterNameSearch and ((credlyMemberBadge_id_m__c IN :myCredlyMemberBadgeIDs) or (credlyMemberBadge_id_m__c = null and createdById = :myId)) order by issue_date_m__c LIMIT :pageLimit OFFSET :badgeOffset ];
                    return memberBadges;
                    }
                    
               if (recordType.equals('recipient'))
               {
               	 memberBadges = [select credlyMemberBadge_id_m__c,account_lookup_m__r.name,contact_lookup_m__r.name,lead_lookup_m__r.name 
                    from member_badge__c 
                    where (account_lookup_m__r.name like :filterNameSearch 
                    or lead_lookup_m__r.name like :filterNameSearch 
                     or contact_lookup_m__r.name like :filterNameSearch)
                     and ((credlyMemberBadge_id_m__c IN :myCredlyMemberBadgeIDs) or (credlyMemberBadge_id_m__c = null and createdById = :myId))];
                 
                 setPagingInfo(memberBadges);
               	
                memberBadges = [select criteria_m__c, description_m__c, expires_in_m__c, 
                    short_description_m__c,title_m__c, image_m__c, 
                    evidence_m__c, evidence_id_m__c,name_m__c,account_type_m__c,
                    document_ID_m__c,  account_lookup_m__c,contact_lookup_m__c,lead_lookup_m__c, badge_lookup_m__r.title__c, badge_lookup_m__r.credlyBadgeId__c,
                    issue_date_m__c, testimonial_m__c, evidence_url_m__c,lead_lookup_m__r.email,contact_lookup_m__r.email, expire_date_m__c
                    from member_badge__c 
                    where (account_lookup_m__r.name like :filterNameSearch 
                    or lead_lookup_m__r.name like :filterNameSearch 
                     or contact_lookup_m__r.name like :filterNameSearch)
                     and ((credlyMemberBadge_id_m__c IN :myCredlyMemberBadgeIDs) or (credlyMemberBadge_id_m__c = null and createdById = :myId))
                    order by issue_date_m__c LIMIT :pageLimit OFFSET :badgeOffset];
                     return memberBadges;
                    }
               if (recordType.equals('category'))
               {
               	
               	 memberBadges = [select credlyMemberBadge_id_m__c, categories_m__c from member_badge__c 
                    where (categories_m__c like :filterNameSearch)
                     and ((credlyMemberBadge_id_m__c IN :myCredlyMemberBadgeIDs) or (credlyMemberBadge_id_m__c = null and createdById = :myId))];
                     
                 setPagingInfo(memberBadges); 
                  
                memberBadges = [select criteria_m__c, description_m__c, expires_in_m__c, categories_m__c,
                    short_description_m__c,title_m__c, image_m__c, 
                    evidence_m__c, evidence_id_m__c,name_m__c,account_type_m__c,
                    document_ID_m__c,  account_lookup_m__c,contact_lookup_m__c,lead_lookup_m__c, badge_lookup_m__r.title__c, badge_lookup_m__r.credlyBadgeId__c,
                    issue_date_m__c, testimonial_m__c, evidence_url_m__c,lead_lookup_m__r.email,contact_lookup_m__r.email, expire_date_m__c
                    from member_badge__c 
                    where (categories_m__c like :filterNameSearch) 
                     and ((credlyMemberBadge_id_m__c IN :myCredlyMemberBadgeIDs) or (credlyMemberBadge_id_m__c = null and createdById = :myId)) 
                    order by issue_date_m__c LIMIT :pageLimit OFFSET :badgeOffset];
                     return memberBadges;
                    }
               }

             return memberBadges;
      
    }

    // Initialize getBadge and return a list of records
    public List<member_badge__c> getBadges() {
    return (List<member_badge__c>) getBadge(); 
    }
    
    public void setPagingInfo(List<member_badge__c> memberBadges)
    {
    	 totalNumberofBadges = memberBadges.size();
       
                    numberOfBadgePages  = totalNumberofBadges / pageLimit;
         			Integer remainder = Math.mod(totalNumberofBadges,pageLimit); 
         			if (remainder > 0)
         			{
         			++numberOfBadgePages;
         			}
         
   
         			if (numberOfBadgePages < 1)
         			{
         			numberOfBadgePages = 1;
        			 }
        			 
    	
    }
    
    
    public String detailsBlock { get; set; }
}