public with sharing class ViewMemberBadgeController {

    public PageReference refreshScreenController() {
        return null;
    }

    public List < CredlyJSON2ApexMyMemberBadges.Data > myCredlyMemberBadges {
        get;
        set;
    }
    public set < Integer > myCredlyMemberBadgeIDs {
        get;
        set;
    }
    public set < String > mySalesForceCredlyMemberBadgeIDs {
        get;
        set;
    }
    public Integer totalNumberofRecords {
        get;
        set;
    }
    public List < CredlyJSON2ApexMyBadges.Data > myCredlyBadges {
        get;
        set;
    }
    public set < String > myCredlyBadgeIDs {
        get;
        set;
    }
    public Integer pageLimit {
        get;
        set;
    }
  
    public ID myID { 
        get;
        set;
    }

    public pageReference dmlOperation() {
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
    	
    	 //submit memberBadges to Credly//
    //    staticCredlyClass.synchMemberBadgesToCredly();
        
        xSortDirection = 'sortDown';
        xSortField = 'Issue Date';
        setSortProperties();
        recordType = 'All';
        filterName = '';

    }
    public String xSortDirection {
        get;
        set;
    }
    public String xSortField {
        get;
        set;
    }
    public String pSortDirection {
        get;
        set;
    }
    public String pSortField {
        get;
        set;
    }
    public Integer currentBadgePage {
        get;
        set;
    }
    public Integer badgeOffset {
        get;
        set;
    }
    public Integer totalNumberofBadges {
        get;
        set;
    }
    public Integer numberOfBadgePages {
        get;
        set;
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
    public Boolean renderContacts {
        get;
        set;
    }

    public PageReference renderPage() {
    	
    	  if (recordType.equals('All')) {
    	  		xSortField = 'Badge Title';
    	  	}
    	  	 if (recordType.equals('title')) {
    	  		xSortField = 'Badge Title';
    	  	}
    	  	 if (recordType.equals('recipient')) {
    	  		xSortField = 'Recipient';
    	  	}
    	  	
    	badgeOffset = 0;
        currentBadgePage = 1;
    	  	
       setSortProperties();
       
       return null;
    }

    public String showAs {
        get;
        set;
    }
    public String showExcel {
        get;
        set;
    }

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
        return options;
    }


    public String recordType {
        get;
        set;
    }

    public String filterName {
        get;
        set;
    }

    public String renderFilters {
        get;
        set;
    }

    public pageReference nextBadge() {

        badgeOffset = badgeOffset + pageLimit;
        currentBadgePage = currentBadgePage + 1;
        if (currentBadgePage > numberOfBadgePages) {
            currentBadgePage = 1;
            badgeOffset = 0;
        }


        return null;
    }
    public pageReference prevBadge() {

        badgeOffset = BadgeOffset - pageLimit;
        currentBadgePage = currentBadgePage - 1;

        if (currentBadgePage <= 0) {
            BadgeOffset = 0;
            currentBadgePage = 1;
        }

        return null;
    }

    public void resetPageLimitController() {
        badgeOffset = 0;
        currentBadgePage = 1;
    }

    // ApexPages.StandardgetBadgetroller must be instantiated
    // for standard list controllers
    public List < member_badge__c > getBadge() {
        List < member_badge__c > memberBadges;
          member_badge__c[] arrayOfBadges;
        
        if ((xSortField == 'Email') || (xSortField == 'Recipient') || (xSortField == 'Testimonial') || (xSortField == 'Evidence')) {
         
         if (recordType.equals('All')) {
                 arrayOfBadges = [select criteria_m__c, description_m__c, expires_in_m__c, short_description_m__c,title_m__c, image_m__c, evidence_m__c, evidence_name_m__c,evidence_id_m__c,name_m__c,account_type_m__c, document_ID_m__c, account_lookup_m__c,contact_lookup_m__c,lead_lookup_m__c,  badge_lookup_m__r.title__c, badge_lookup_m__r.credlyBadgeId__c, issue_date_m__c, testimonial_m__c, evidence_url_m__c,lead_lookup_m__r.email,contact_lookup_m__r.email,contact_lookup_m__r.name,lead_lookup_m__r.name,account_lookup_m__r.name, expire_date_m__c, credlyMemberBadge_id_m__c from member_badge__c  where ((credlyMemberBadge_id_m__c IN :myCredlyMemberBadgeIDs) or (credlyMemberBadge_id_m__c = null and createdById = :myId))];
 				arrayOfBadges = staticCredlyClass.sortSpecialMemberBadges(arrayOfBadges, xSortField, pSortDirection);
                memberBadges = arrayOfBadges;
                numberOfBadgePages = 1;
                return memberBadges; 
            
            }
          if (recordType.equals('title')) {
          		arrayOfBadges = [select criteria_m__c, description_m__c, expires_in_m__c, short_description_m__c,title_m__c, image_m__c, evidence_m__c, evidence_id_m__c,name_m__c,account_type_m__c, document_ID_m__c,  account_lookup_m__c,contact_lookup_m__c,lead_lookup_m__c, badge_lookup_m__r.title__c, badge_lookup_m__r.credlyBadgeId__c, issue_date_m__c, testimonial_m__c, evidence_name_m__c, evidence_url_m__c,lead_lookup_m__r.email,contact_lookup_m__r.email,contact_lookup_m__r.name,lead_lookup_m__r.name,account_lookup_m__r.name, expire_date_m__c  from member_badge__c where badge_lookup_m__r.title__c like :filterNameSearch and ((credlyMemberBadge_id_m__c IN :myCredlyMemberBadgeIDs) or (credlyMemberBadge_id_m__c = null and createdById = :myId))];
              arrayOfBadges = staticCredlyClass.sortSpecialMemberBadges(arrayOfBadges, xSortField, pSortDirection);
                memberBadges = arrayOfBadges;
                numberOfBadgePages = 1;
                return memberBadges; 
            }
         if (recordType.equals('recipient')) {
          	  arrayOfBadges = [select criteria_m__c, description_m__c, expires_in_m__c, short_description_m__c,title_m__c, image_m__c, evidence_m__c, evidence_id_m__c,name_m__c,account_type_m__c, document_ID_m__c,  account_lookup_m__c,contact_lookup_m__c,lead_lookup_m__c, badge_lookup_m__r.title__c, badge_lookup_m__r.credlyBadgeId__c, issue_date_m__c, testimonial_m__c,  evidence_name_m__c, evidence_url_m__c,lead_lookup_m__r.email,contact_lookup_m__r.email, expire_date_m__c, contact_lookup_m__r.name, lead_lookup_m__r.name,account_lookup_m__r.name from member_badge__c where (account_lookup_m__r.name like :filterNameSearch or lead_lookup_m__r.name like :filterNameSearch or contact_lookup_m__r.name like :filterNameSearch) and ((credlyMemberBadge_id_m__c IN :myCredlyMemberBadgeIDs) or (credlyMemberBadge_id_m__c = null and createdById = :myId))];
              arrayOfBadges = staticCredlyClass.sortSpecialMemberBadges(arrayOfBadges, xSortField, pSortDirection);
                memberBadges = arrayOfBadges;
                numberOfBadgePages = 1;
                return memberBadges; 
            }

    	
    }

        if (((filterName == null) || (filterName.trim().length() == 0)) && (recordType.equals('All'))) {
        	
            AggregateResult[] groupedResults = [select count(id) recCnt
                from member_badge__c where((credlyMemberBadge_id_m__c IN: myCredlyMemberBadgeIDs) or(credlyMemberBadge_id_m__c = null and createdById = : myId))
            ];

            Object recordCount = groupedResults[0].get('recCnt');
            setPagingInfo(Integer.valueOf(recordCount));

            memberBadges = Database.query('select criteria_m__c, description_m__c, expires_in_m__c, short_description_m__c,title_m__c, image_m__c, evidence_m__c, evidence_id_m__c,name_m__c,account_type_m__c, document_ID_m__c, account_lookup_m__c,contact_lookup_m__c,lead_lookup_m__c,  badge_lookup_m__r.title__c, badge_lookup_m__r.credlyBadgeId__c, issue_date_m__c, testimonial_m__c, evidence_name_m__c, evidence_url_m__c,lead_lookup_m__r.email,contact_lookup_m__r.email, expire_date_m__c, credlyMemberBadge_id_m__c from member_badge__c  where ((credlyMemberBadge_id_m__c IN :myCredlyMemberBadgeIDs) or (credlyMemberBadge_id_m__c = null and createdById = :myId)) order by ' + pSortField + ' ' + pSortDirection + ' LIMIT :pageLimit OFFSET :badgeOffset');

            return memberBadges;
        }



        if (!recordType.equals('All')) {
            filterNameSearch = filterName.trim();
            if (recordType.equals('title')) {

                AggregateResult[] groupedResults = [select count(id) recCnt
                    from member_badge__c where badge_lookup_m__r.title__c like: filterNameSearch and((credlyMemberBadge_id_m__c IN: myCredlyMemberBadgeIDs) or(credlyMemberBadge_id_m__c = null and createdById = : myId))
                ];

                Object recordCount = groupedResults[0].get('recCnt');
                setPagingInfo(Integer.valueOf(recordCount));

                memberBadges = Database.query('select criteria_m__c, description_m__c, expires_in_m__c, short_description_m__c,title_m__c, image_m__c, evidence_m__c, evidence_id_m__c,name_m__c,account_type_m__c, document_ID_m__c,  account_lookup_m__c,contact_lookup_m__c,lead_lookup_m__c, badge_lookup_m__r.title__c, badge_lookup_m__r.credlyBadgeId__c, issue_date_m__c, testimonial_m__c, evidence_name_m__c, evidence_url_m__c,lead_lookup_m__r.email,contact_lookup_m__r.email, expire_date_m__c  from member_badge__c where badge_lookup_m__r.title__c like :filterNameSearch and ((credlyMemberBadge_id_m__c IN :myCredlyMemberBadgeIDs) or (credlyMemberBadge_id_m__c = null and createdById = :myId)) order by ' + pSortField + ' ' + pSortDirection + ' LIMIT :pageLimit OFFSET :badgeOffset');
                return memberBadges;
            }

            if (recordType.equals('recipient')) {
                AggregateResult[] groupedResults = [select count(id) recCnt
                    from member_badge__c
                    where(account_lookup_m__r.name like: filterNameSearch or lead_lookup_m__r.name like: filterNameSearch or contact_lookup_m__r.name like: filterNameSearch)
                    and((credlyMemberBadge_id_m__c IN: myCredlyMemberBadgeIDs) or(credlyMemberBadge_id_m__c = null and createdById = : myId))
                ];

                Object recordCount = groupedResults[0].get('recCnt');
                setPagingInfo(Integer.valueOf(recordCount));

                memberBadges = Database.query('select criteria_m__c, description_m__c, expires_in_m__c, short_description_m__c,title_m__c, image_m__c, evidence_m__c, evidence_id_m__c,name_m__c,account_type_m__c, document_ID_m__c,  account_lookup_m__c,contact_lookup_m__c,lead_lookup_m__c, badge_lookup_m__r.title__c, badge_lookup_m__r.credlyBadgeId__c, issue_date_m__c, testimonial_m__c,  evidence_name_m__c, evidence_url_m__c,lead_lookup_m__r.email,contact_lookup_m__r.email, expire_date_m__c from member_badge__c where (account_lookup_m__r.name like :filterNameSearch or lead_lookup_m__r.name like :filterNameSearch or contact_lookup_m__r.name like :filterNameSearch) and ((credlyMemberBadge_id_m__c IN :myCredlyMemberBadgeIDs) or (credlyMemberBadge_id_m__c = null and createdById = :myId)) order by ' + pSortField + ' ' + pSortDirection + ' LIMIT :pageLimit OFFSET :badgeOffset');
                return memberBadges;
            }
            if (recordType.equals('category')) {

                AggregateResult[] groupedResults = [select count(id) recCnt from member_badge__c
                    where(categories_m__c like: filterNameSearch)
                    and((credlyMemberBadge_id_m__c IN: myCredlyMemberBadgeIDs) or(credlyMemberBadge_id_m__c = null and createdById = : myId))
                ];

                Object recordCount = groupedResults[0].get('recCnt');
                setPagingInfo(Integer.valueOf(recordCount));

                memberBadges = Database.query('select criteria_m__c, description_m__c, expires_in_m__c, categories_m__c, short_description_m__c,title_m__c, image_m__c, evidence_m__c, evidence_id_m__c,name_m__c,account_type_m__c, document_ID_m__c,  account_lookup_m__c,contact_lookup_m__c,lead_lookup_m__c, badge_lookup_m__r.title__c, badge_lookup_m__r.credlyBadgeId__c, issue_date_m__c, testimonial_m__c, evidence_name_m__c, evidence_url_m__c,lead_lookup_m__r.email,contact_lookup_m__r.email, expire_date_m__c from member_badge__c where (categories_m__c like :filterNameSearch) and ((credlyMemberBadge_id_m__c IN :myCredlyMemberBadgeIDs) or (credlyMemberBadge_id_m__c = null and createdById = :myId)) order by ' + pSortField + ' ' + pSortDirection + ' LIMIT :pageLimit OFFSET :badgeOffset');
                return memberBadges;
            }
        }

        return memberBadges;

    }

    // Initialize getBadge and return a list of records
    public List < member_badge__c > getBadges() {
        return (List < member_badge__c > ) getBadge();
    }

    public void setPagingInfo(Integer records) {

        totalNumberofBadges = records;
        numberOfBadgePages = totalNumberofBadges / pageLimit;
        Integer remainder = Math.mod(totalNumberofBadges, pageLimit);
        if (remainder > 0) {
            ++numberOfBadgePages;
        }


        if (numberOfBadgePages < 1) {
            numberOfBadgePages = 1;
        }


    }

    public PageReference setSortController() {
    	
        badgeOffset = 0;
        currentBadgePage = 1;
        setSortProperties();
        return null;
    }

    public void setSortProperties() {

        pSortDirection = (xSortDirection == 'sortUp') ? 'ASC' : 'DESC NULLS LAST';

        if (xSortField == 'Badge Image') {
            pSortField = 'image_m__c';

        }

        if (xSortField == 'Badge Title') {
            pSortField = 'title_m__c';
        }

        if (xSortField == 'Badge Short Description') {
            pSortField = 'short_description_m__c';
        }

        if (xSortField == 'Testimonial') {
            pSortField = 'testimonial_m__c';
        }

    

        if (xSortField == 'Issue Date') {
            pSortField = 'issue_date_m__c';
        }
        if (xSortField == 'Expire Date') {
            pSortField = 'expire_date_m__c';
        }


    }



    public String detailsBlock {
        get;
        set;
    }
}