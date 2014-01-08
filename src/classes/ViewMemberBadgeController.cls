public with sharing class ViewMemberBadgeController {

    public PageReference refreshScreenController() {
        return null;
    }

    public ViewMemberBadgeController() {
    recordType = 'All';
    filterName = '';
    }

    
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
        getBadges();
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

     // ApexPages.StandardgetBadgetroller must be instantiated
    // for standard list controllers
    public ApexPages.StandardSetController getBadge {
        get {
               
               if (((filterName == null) || (filterName.trim().length() == 0)) && (recordType.equals('All')))  
               {
                getBadge = new ApexPages.StandardSetController(Database.getQueryLocator(
                    [select criteria_m__c, description_m__c, expires_in_m__c, 
                    short_description_m__c,title_m__c, image_m__c, 
                    evidence_m__c, evidence_id_m__c,name_m__c,account_type_m__c,
                    document_ID_m__c, account_lookup_m__c,contact_lookup_m__c,lead_lookup_m__c,  badge_lookup_m__r.title__c, 
                    issue_date_m__c, testimonial_m__c, evidence_url_m__c,lead_lookup_m__r.email,contact_lookup_m__r.email, expire_date_m__c 
                    from member_badge__c order by issue_date_m__c]));
                    return getBadge;
                    }
                    
        
                    
               if (!recordType.equals('All'))
               {
               filterNameSearch = filterName.trim();
               if (recordType.equals('title'))
               {
                getBadge = new ApexPages.StandardSetController(Database.getQueryLocator(
                    [select criteria_m__c, description_m__c, expires_in_m__c, 
                    short_description_m__c,title_m__c, image_m__c, 
                    evidence_m__c, evidence_id_m__c,name_m__c,account_type_m__c,
                    document_ID_m__c,  account_lookup_m__c,contact_lookup_m__c,lead_lookup_m__c, badge_lookup_m__r.title__c, 
                    issue_date_m__c, testimonial_m__c, evidence_url_m__c,lead_lookup_m__r.email,contact_lookup_m__r.email, expire_date_m__c
                    from member_badge__c where badge_lookup_m__r.title__c like :filterNameSearch order by issue_date_m__c ]));
                     return getBadge;
                    }
                    
               if (recordType.equals('recipient'))
               {
                getBadge = new ApexPages.StandardSetController(Database.getQueryLocator(
                 [select criteria_m__c, description_m__c, expires_in_m__c, 
                    short_description_m__c,title_m__c, image_m__c, 
                    evidence_m__c, evidence_id_m__c,name_m__c,account_type_m__c,
                    document_ID_m__c,  account_lookup_m__c,contact_lookup_m__c,lead_lookup_m__c, badge_lookup_m__r.title__c, 
                    issue_date_m__c, testimonial_m__c, evidence_url_m__c,lead_lookup_m__r.email,contact_lookup_m__r.email, expire_date_m__c
                    from member_badge__c 
                    where account_lookup_m__r.name like :filterNameSearch 
                    or lead_lookup_m__r.name like :filterNameSearch 
                     or contact_lookup_m__r.name like :filterNameSearch 
                    order by issue_date_m__c ]));
                     return getBadge;
                    }
               if (recordType.equals('category'))
               {
                getBadge = new ApexPages.StandardSetController(Database.getQueryLocator(
                 [select criteria_m__c, description_m__c, expires_in_m__c, 
                    short_description_m__c,title_m__c, image_m__c, 
                    evidence_m__c, evidence_id_m__c,name_m__c,account_type_m__c,
                    document_ID_m__c,  account_lookup_m__c,contact_lookup_m__c,lead_lookup_m__c, badge_lookup_m__r.title__c, 
                    issue_date_m__c, testimonial_m__c, evidence_url_m__c,lead_lookup_m__r.email,contact_lookup_m__r.email, expire_date_m__c
                    from member_badge__c 
                    where account_lookup_m__r.name like :filterNameSearch 
                    or lead_lookup_m__r.name like :filterNameSearch 
                     or contact_lookup_m__r.name like :filterNameSearch 
                    order by issue_date_m__c ]));
                     return getBadge;
                    }
               }

             return getBadge;

           
        }
        set;
    }

    // Initialize getBadge and return a list of records
    public List<member_badge__c> getBadges() {
        return (List<member_badge__c>) getBadge.getRecords();
    }

    public String detailsBlock { get; set; }
}