public with sharing class BadgeContactController {

    public BadgeContactController() {

        xSortDirection = 'sortUp';
        xSortField = 'Title';
        setSortProperties();
        
          setRuleText = '';

        getOnce = true;
        renderStep1 = true;
        renderStep2 = false;
        renderStep3 = false;
        renderStep4 = false;
        renderStep5 = false;
        renderAccounts = false;
        renderLeads = false;
        renderContacts = false;
        step = 1;
        emailChecked = true;

        xRecordType = '';
        xSelectedIDs = '';
        setBadgeSelect = '';
        setTestimonialSelect = '';
        filterName = '';
        filterBadge = '';
        String returnData;
        counter = 0;
        pageLimit = staticCredlyClass.PageLimit();
        badgeOffset = 0;
        currentBadgePage = 1;
        myId = UserInfo.getUserId();
        
         setTypeSelect  = (populateRecordType != null) ? populateRecordType : 'Account';

        getRuleFields = getFields(setTypeSelect);
       
        getOperandTypes = getOperandTypes();
       
        staticCredlyClass.Token j = staticCredlyClass.getToken(); 
        securityToken = j.APItoken;

        myCredlyBadges = staticCredlyClass.getMyBadgesFromCredly();
        myCredlyBadgeIDs = staticCredlyClass.getCredlyBadgeIdsFromData(myCredlyBadges);
        mySalesForceCredlyBadgeIDs = staticCredlyClass.getCredlyBadgeIDsFromSalesforce();

        //Badges//
        totalNumberofBadges = myCredlyBadgeIDs.size();

        numberOfBadgePages = totalNumberofBadges / pageLimit;
        Integer remainder = Math.mod(totalNumberofBadges, pageLimit);
        if (remainder > 0) {
            ++numberOfBadgePages;
        }


        if (numberOfBadgePages < 1) {
            numberOfBadgePages = 1;
        }


    }
    
      public String name { get; set; }
       public String setRuleText{get;set;}
    public String rule { get; set; }
    public String populateRecordType { get; set; }
    public String selectedRecordType;
    
     public List < SelectOption > getRuleFields { get; set; }
     public List<SelectOption> getOperandTypes { get; set; }
    public String xSortDirection {
        get;
        set;
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

    public Integer totalNumberofBadges {
        get;
        set;
    }
    public Integer badgeOffset {
        get;
        set;
    }
    public Integer currentBadgePage {
        get;
        set;
    }
    public set < String > myCredlyBadgeIDs {
        get;
        set;
    }
    public set < String > mySalesForceRuleIDs {
        get;
        set;
    }
    public set < String > mySalesForceCredlyBadgeIDs {
        get;
        set;
    }

    public Integer counter {
        get;
        set;
    }
     public String setBadgeSelect{ get; set;}
    public String setTypeSelect{ get; set; }
 
    
     public void reloadFields () { 
        
       renderUpload = false;
        addBlock = true;
        detailsBlock = false;
     //   setBadgeSelect =  xBadgeId;
        setTypeSelect  = (populateRecordType != null) ? populateRecordType : 'Account';
        
        getRuleFields = getFields(setTypeSelect);
     
        getOperandTypes = getOperandTypes();
      
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



    public List < badge__c > badgeList {
        get;
        set;
    }
    public String securityToken {
        get;
        set;
    }
    public Boolean getOnce {
        get;
        set;
    }

    public Boolean emailChecked {
        get;
        set;
    }
    public Boolean customMessageChecked {
        get;
        set;
    }
    public String customMessage {
        get;
        set;
    }
    public String urlLink {
        get;
        set;
    }
    public Integer recipientNumber {
        get;
        set;
    }
    public List < CredlyJSON2ApexMyBadges.Data > myCredlyBadges {
        get;
        set;
    }
    public Integer totalNumberofRecords {
        get;
        set;
    }
    public Integer pageLimit {
        get;
        set;
    }
    public Integer pageOffset {
        get;
        set;
    }
    public Integer numberOfPages {
        get;
        set;
    }
 
    public Integer numberOfBadgePages {
        get;
        set;
    }
    public ID myID {
        get;
        set;
    }



    public String setBadgeSelectTitle {
        get;
        set;
    }

    public PageReference setSortController() {
        badgeOffset = 0;
        currentBadgePage = 1;
        setSortProperties();
        return null;
    }

    public void setSortProperties() {

        pSortDirection = (xSortDirection == 'sortUp') ? 'ASC' : 'DESC';

        if (xSortField == 'Image') {
            pSortField = 'image__c';

        }

        if (xSortField == 'Title') {
            pSortField = 'title__c';
        }

        if (xSortField == 'Description') {
            pSortField = 'description__c';
        }

        if (xSortField == 'ID') {
            pSortField = 'credlyBadgeId__c';
        }

        if (xSortField == 'Created Date') {
            pSortField = 'credlyCreatedDateTime__c';
        }


    }

    public void setTestimonialEmpty() {

    }

    public pageReference dmlOperation() {
        //Call Credly API to get your badges//
        myCredlyBadges = staticCredlyClass.getMyBadgesFromCredly();
        myCredlyBadgeIDs = staticCredlyClass.getCredlyBadgeIdsFromData(myCredlyBadges);
        mySalesForceCredlyBadgeIDs = staticCredlyClass.getCredlyBadgeIDsFromSalesforce();
        staticCredlyClass.synchBadgesFromCredly(myCredlyBadges, mySalesForceCredlyBadgeIDs);

        totalNumberofRecords = myCredlyBadgeIDs.size();

        numberOfPages = totalNumberofRecords / pageLimit;


        if (numberOfPages < 1) {
            numberOfPages = 1;
        }



        return null;
    }

    public void backStep() {
        //if you are on step 3 and going back to step 2, then 
        //the select recipients screen needs to rerender

        step = step - 2;
        nextStep();
    }

    public PageReference nextStep() {
        step = step + 1;

        if (step == 1) {
            renderStep1 = true;
            renderStep2 = false;
            renderStep3 = false;
            renderStep4 = false;
            renderStep5 = false;
            renderAccounts = false;
            renderLeads = false;
            renderContacts = false;
        }
        if (step == 2) {
            if (setBadgeSelect.trim().length() == 0) {
                ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, 'Need to Select a Badge'));
                nextStep();
                return null;
            }

            if (xSelectedIDs.trim().length() == 0) {
                renderStep1 = false;
                renderStep2 = true;
                renderStep3 = false;
                renderStep4 = false;
                renderStep5 = false;

            } else {
                renderPage();
            }

        }
        if (step == 3) {
            showUploadOnly();
        }

        if (step == 4) {
            showReview();
        }

        if (step == 5) {
            showConfirm();
        }

        return null;
    }

    public PageReference setBadgeIdEmpty() {

        //select id from badge and set fields//
        String i = setBadgeSelect;
        List < badge__c > bd = [Select Id, title__c, image__c, credlyBadgeId__c from badge__c where ID = : i LIMIT 1];
        for (badge__c y: bd) {
            setBadgeSelectTitle = y.title__c;
        }

        return null;

    }


    public Integer step {
        get;
        set;
    }

   
    public String setBadgeSelectImage {
        get;
        set;
    }
    

    public Boolean renderTestimonial {
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



    public void captureChecks() {

    }


    public String getCheckIt() {

        return null;
    }


    public PageReference showUploadOnly() {

		//system.debug(setRuleText);
        String email;

        if ((SetRuleText == null)) {
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, 'Select a Rule'));
            renderStep1 = false;
            renderStep2 = true;
            renderStep3 = false;
            renderStep4 = false;
            renderStep5 = false;

            return null;
        }


        //loop through selected ids//
        if ((xSelectedIDs != null) || (xSelectedIDs.trim().length() > 2)) {
            String[] temp = null;
            temp = xSelectedIDs.split(',');

            for (String i: temp) {

                if (i.length() > 1) {
                    email = (sendEmail.getEmailAddress(i, xRecordType) != null) ? sendEmail.getEmailAddress(i, xRecordType) : ' ';
                    if (email.compareTo(' ') == 0) {
                        ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, 'Selected Accounts, Contacts, or Leads Must Have an Email Address'));
                        renderStep1 = false;
                        renderStep2 = true;
                        renderStep3 = false;
                        renderStep4 = false;
                        renderStep5 = false;

                        return null;

                    }
                }
            }

        }



        renderStep1 = false;
        renderStep2 = false;
        renderStep3 = true;
        renderStep4 = false;
        renderStep5 = false;


        renderLeads = false;
        renderAccounts = false;
        renderContacts = false;

        step = 3;

        return null;

    }

        public void setPopulateRecordType(String selectedRecordType) {
        this.selectedRecordType = selectedRecordType ;
    }
    
     public String getPopulateRecordType() {
        return selectedRecordType;
    } 
    
    public void showReview() {

       // String[] temp = xSelectedIDs.split(','); 
        recipientNumber = staticCredlyClass.getRecipientCount(setTypeSelect, setRuleText);
        
        renderStep1 = false;
        renderStep2 = false;
        renderStep3 = false;
        renderStep4 = true;
        renderStep5 = false;

        renderLeads = false;
        renderAccounts = false;
        renderContacts = false;

    }

    public void showConfirm() {


        renderStep1 = false;
        renderStep2 = false;
        renderStep3 = false;
        renderStep4 = false;
        renderStep5 = true;

        renderLeads = false;
        renderAccounts = false;
        renderContacts = false;

    }


    public badge__c badge {
        get;
        set;
    }

    public Boolean renderFilters {
        get;
        set;
    }

    public Boolean renderBadges {
        get;
        set;
    }

    public Boolean renderUpload {
        get;
        set;
    }


    public PageReference createMemberBadgesApex() {

        return null;
    }

    public String xRecordType {
        get;
        set;
    }

    public String xSelectedIDs {
        get;
        set;
    }

    public Boolean uploadRendered {
        get;
        set;
    }

    public Boolean renderAccounts {
        get;
        set;
    }

    public Boolean renderLeads {
        get;
        set;
    }

    public String setTestimonialSelect {
        get;
        set;
    }


    public Boolean renderContacts {
        get;
        set;
    }


    public PageReference searchBadge() {
        badgeOffset = 0;
        currentBadgePage = 1;
        xSortDirection = 'sortUp';
        xSortField = 'Title';
        setSortProperties();
        return null;
    }

    public PageReference renderPage() {

        renderStep1 = false;
        renderStep2 = true;
        renderStep3 = false;
        renderStep4 = false;
        renderStep5 = false;

        renderAccounts = false;
        renderContacts = false;
        renderLeads = false;

        if (recordType == 'Account') {
            renderAccounts = true;
            getAccount = null;
            getAccounts();
        }
        if (recordType == 'Contact') {
            renderContacts = true;
            getContact = null;
            getContacts();
        }
        if (recordType == 'Lead') {
            renderLeads = true;
            getLead = null;
            getLeads();
        }


        return null;

    }

    public List < SelectOption > getRecordTypes() {
        List < SelectOption > options = new List < SelectOption > ();
        options.add(new SelectOption('Account', 'Account'));
        options.add(new SelectOption('Contact', 'Contact'));
        options.add(new SelectOption('Lead', 'Lead'));
        return options;
    }

    public String filterName {
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
    public String recordType {
        get;
        set;
    }
    public String short_description {
        get;
        set;
    }
    public String description {
        get;
        set;
    }
    public String criteria {
        get;
        set;
    }
    public String is_giveable {
        get;
        set;
    }
    public Integer expires_in {
        get;
        set;
    }
    public Boolean addBlock {
        get;
        set;
    }
    public Boolean detailsBlock {
        get;
        set;
    }
    public String title {
        get;
        set;
    }


    public PageReference closeBadge() {

        addBlock = false;
        detailsBlock = true;

        PageReference pageRef = new PageReference('/apex/ViewBadges');
        pageRef.setRedirect(true);
        return pageRef;
    }


    public List < SelectOption > getDropBadges() {
        List < badge__c > newBadges = getBadges();


        List < SelectOption > options = new List < SelectOption > ();
        options.add(new SelectOption('', ''));
        for (badge__c c: newBadges) {
            options.add(new SelectOption(c.id, c.title__c + ' - ' + c.short_description__c));
        }



        return options;
    }


    public String getSelectedItem() {
        return null;
    }

    public Document document {
        get {
            if (document == null)
                document = new Document();
            return document;
        }
        set;
    }

    public String GetName(String type, String i) {
        String name = null;

        if (type.equals('contact')) {
            List < Contact > cn = [Select Id, FirstName, LastName from contact where ID = : i LIMIT 1];
            for (Contact y: cn) {
                name = y.LastName + ',' + y.FirstName;
            }
        }

        if (type.equals('account')) {
            List < Account > ac = [Select ID, Name from account where ID = : i LIMIT 1];
            for (Account x: ac) {
                name = x.Name;
            }
        }


        if (type.equals('lead')) {
            List < Lead > ld = [Select ID, FirstName, LastName from lead where ID = : i LIMIT 1];
            for (Lead x: ld) {
                name = x.LastName + ',' + x.FirstName;
            }
        }


        return name;

    }

    public PageReference upload() {

        Map<String, Integer> foundHitIds;
        List<List<String>> parsedRows = new List<List<String>>();
        String encodedImage;
        String xbadgeURL = '';
        String strBody;
        String returnData;
        String createURL;
        String errMessage;
        String stsMessage;
        String[] splitName = null;
        String email = ' ';
        
        xRecordType = setTypeSelect.toLowerCase();

        if (document.body != null) {
            document.AuthorId = UserInfo.getUserId();
            document.FolderId = UserInfo.getUserId();
            strBody = EncodingUtil.base64Encode(document.body);
            try {
                insert document;

            } catch (DMLException e) {
                ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, 'Error uploading file'));
                return null;
            }
        }

        try {


            //get original base badge

            badge = [Select Id, criteria__c, description__c, document_id__c,
                expires_in__c, image__c, is_giveable__c, short_description__c,
                title__c, credlyBadgeId__c, categories__c from badge__c where ID = : setBadgeSelect LIMIT 1
            ];

            List < member_badge__c > memberBadgeList = new List < member_badge__c > ();
            
            parsedRows = automatedTriggerClass.unparseRules(setRuleText);
            
             system.debug(xRecordType);
            //
            //Get the IDs of the members getting badges//
             if (xRecordType == 'account') {
            	foundHitIds = staticCredlyClass.getRecipientAccountIDs(setRuleText);
             }
             
              if (xRecordType == 'lead') {
            	foundHitIds = staticCredlyClass.getRecipientLeadIDs(setRuleText);
             }
             
              if (xRecordType == 'contact') {
            	foundHitIds = staticCredlyClass.getRecipientContactIDs(setRuleText);
             }
             
             system.debug(xRecordType);
             
              for(Id id : foundHitIds.keySet()) {
                    if (foundHitIds.get(id) == parsedRows.size())
                    {
           
                    member_badge__c memberBadge = new member_badge__c();

                    memberBadge.criteria_m__c = badge.criteria__c;
                    memberBadge.description_m__c = badge.description__c;
                    memberBadge.document_id_m__c = badge.document_id__c;
                    memberBadge.expires_in_m__c = badge.expires_in__c;
                    memberBadge.badge_lookup_m__c = setBadgeSelect;
                    memberBadge.categories_m__c = badge.categories__c;
                    memberBadge.custom_message_m__c = customMessage;
                    memberBadge.is_visible_m__c = 'true';

                    memberBadge.is_giveable_m__c = badge.is_giveable__c;
                    memberBadge.short_description_m__c = badge.short_description__c;
                    memberBadge.title_m__c = badge.title__c;
                    memberBadge.lookup_id_m__c = id;

                    if (xRecordType == 'account') {
                        memberBadge.account_lookup_m__c = id;
                    }
                    if (xRecordType == 'contact') {
                        memberBadge.contact_lookup_m__c = id;
                    }
                    if (xRecordType == 'lead') {
                        memberBadge.lead_lookup_m__c = id;
                    }

                    memberBadge.account_type_m__c = xRecordType;

                    if (document.body != null) {
                        memberBadge.evidence_id_m__c = document.Id;
                        memberBadge.evidence_name_m__c = document.Name;
                    } else {
                        memberBadge.evidence_url_m__c = urlLink;
                    }

                    memberBadge.testimonial_m__c = setTestimonialSelect;

                    memberBadge.name_m__c = getName(xRecordType, id);

                    memberBadge.issue_date_m__c = system.today();
                    insert memberBadge;
                    memberBadgeList.add(memberBadge); 

                }
            }

        } catch (DMLException e) {
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, 'Error creating Member Badge.'));
            return null;
        } finally {
            document.body = null; // clears the viewstate
            document = new Document();
        }

        nextStep();

        // ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO, 'Member Badge Successfully Created'));

        return null;
    }


    public ApexPages.StandardSetController getContact {

        get {
            if (getContact == null) {


                if ((filterName == null) || (filterName.trim().length() == 0)) {
                    getContact = new ApexPages.StandardSetController(Database.getQueryLocator(
                        [SELECT Name, email, ID from Contact]));
                } else {
                    filterNameSearch = filterName;
                    getContact = new ApexPages.StandardSetController(Database.getQueryLocator(
                        [SELECT Name, email, ID from Contact where Name like: filterNameSearch]));
                }

            }
            return getContact;
        }
        set;
    }

    public ApexPages.StandardSetController getLead {

        get {
            if (getLead == null) {


                if ((filterName == null) || (filterName.trim().length() == 0)) {
                    getLead = new ApexPages.StandardSetController(Database.getQueryLocator(
                        [SELECT Name, email, ID from Lead]));
                } else {
                    filterNameSearch = filterName;
                    getLead = new ApexPages.StandardSetController(Database.getQueryLocator(
                        [SELECT Name, email, ID from Lead where Name like: filterNameSearch]));
                }

            }
            return getLead;
        }
        set;
    }

    // Initialize setCon and return a list of records
    public List < Contact > getContacts() {
        return (List < Contact > ) getContact.getRecords();
    }

    // Initialize setCon and return a list of records
    public List < Lead > getLeads() {
        return (List < Lead > ) getLead.getRecords();
    }

    public ApexPages.StandardSetController getAccount {
        get {
            if (getAccount == null) {


                if ((filterName == null) || (filterName.trim().length() == 0)) {
                    getAccount = new ApexPages.StandardSetController(Database.getQueryLocator(
                        //  [SELECT Name, ID from Account]));
                        [SELECT Name, ID, (SELECT email FROM Account.Contacts LIMIT 1) FROM Account]));
                } else {
                    filterNameSearch = filterName;
                    getAccount = new ApexPages.StandardSetController(Database.getQueryLocator(
                        [SELECT Name, ID from Account where Name like: filterNameSearch]));
                }

            }
            //      system.debug(getAccount);
            return getAccount;
        }
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

    // Initialize setCon and return a list of records
    public List < Account > getAccounts() {
        return (List < Account > ) getAccount.getRecords();
    }

    public List < badge__c > getBadge {
        get {
            List < badge__c > badges;

            badge__c[] arrayOfBadges;

            //Description is a field that cannot be filtered/ordered on, have to pull all records
            if (xSortField == 'Description') {
                arrayOfBadges = [select criteria__c, description__c, expires_in__c, is_giveable__c, short_description__c, title__c, image__c, document_ID__c, credlyBadgeId__c, createdById, createdDate from badge__c where((credlyBadgeId__c IN: myCredlyBadgeIDs) or(credlyBadgeId__c = null and createdById = : myId)) and(title__c like: filterBadgeSearch)];
                arrayOfBadges = staticCredlyClass.sortSpecialBadges(arrayOfBadges, xSortField, pSortDirection);
                badges = arrayOfBadges;
                numberOfPages = 1;
                return badges;
            }

            if (((filterBadge != null) || (filterBadge.trim().length() != 0))) {
                filterBadgeSearch = filterBadge;

                AggregateResult[] groupedResults = [select count(id) recCnt from badge__c where((credlyBadgeId__c IN: myCredlyBadgeIDs)) and title__c like: filterBadgeSearch];
                Object recordCount = groupedResults[0].get('recCnt');
                setPagingInfo(Integer.valueOf(recordCount));

                badges = Database.query('select criteria__c, description__c, expires_in__c, is_giveable__c, short_description__c,title__c, image__c, document_ID__c, credlyBadgeId__c, createdById, createdDate,credlyCreatedDateTime__c from badge__c  where ((credlyBadgeId__c IN :myCredlyBadgeIDs)) and  title__c  like :filterBadgeSearch order by ' + pSortField + ' ' + pSortDirection + ' LIMIT :pageLimit OFFSET :badgeOffset');
            }

            if (((filterBadge == null) || (filterBadge.trim().length() == 0))) {
                AggregateResult[] groupedResults = [select count(id) recCnt from badge__c where((credlyBadgeId__c IN: myCredlyBadgeIDs))];
                Object recordCount = groupedResults[0].get('recCnt');
                setPagingInfo(Integer.valueOf(recordCount));


                badges = Database.query('select criteria__c, description__c, expires_in__c, is_giveable__c, short_description__c,title__c, image__c, document_ID__c, credlyBadgeId__c, createdById, createdDate,credlyCreatedDateTime__c from badge__c  where ((credlyBadgeId__c IN :myCredlyBadgeIDs)) order by ' + pSortField + ' ' + pSortDirection + ' LIMIT :pageLimit OFFSET :badgeOffset');
            }

            return badges;
        }
        set;
    }

    // Initialize getBadge and return a list of records

    // Initialize getBadge and return a list of records
    public List < badge__c > getBadges() {
        return (List < badge__c > ) getBadge;
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




}