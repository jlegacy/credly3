public with sharing class CustomBadgeController {


    public String securityToken {
        get;
        set;
    }

    public Integer totalNumberofRecords {
        get;
        set;
    }
    
    public String document_name {
    	get;
    	set;
    }
    
     public String jumpURL {
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
    public Integer currentPage {
        get;
        set;
    }
    public ID myID {
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
    public String xSortDirection {
        get;
        set;
    }
    
    public ID document_id_url_form {
    	get;
    	set;
    }
    
       public String document_id {
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
    
      public String xEditId {
        get;
        set;
    }
      public String xCredlyBadgeId {
        get;
        set;
    }
    

    public set < String > mySalesForceCredlyBadgeIDs {
        get;
        set;
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
    
    public PageReference gotoEditController()
    {
    	Integer z;
    	
    	if (xCredlyBadgeId.trim().compareTo('') == 1)
    	{
    
    	CredlyJSON2ApexCredlySingleBadgeData.Data singleBadge = staticCredlyClass.getSingleBadgeDataFromCredly(xCredlyBadgeId);
    	//system.debug(singleBadge);
    	if (singleBadge != null)
    	{
    	badge__c x = [select id from badge__c where credlyBadgeID__c = :xCredlyBadgeId];
    	if (x != null)
    	{
    		if (singleBadge.description != null)
    		{
    			x.description__c = singleBadge.description;
    		}
    		z = 0;
    		for (CredlyJSON2ApexCredlySingleBadgeData.Categories j : singleBadge.categories)
    		{
    			z = z + 1;
    			if (z == 1)
    			{
    			x.categories__c = j.name;
    			}
    			else
    			{
    			x.categories__c = x.categories__c + ',' + j.name;	
    			}
    			
    		}
    		update x;
    	}
    	}
    	
    	}
    	
    	
    	String fullFileURL = URL.getSalesforceBaseUrl().toExternalForm() +
   		'/' + xEditId;
   		PageReference pageRef = new PageReference(fullFileURL);
   		pageRef.setRedirect(true);
    	return pageRef;
    }

    public PageReference searchBadge() {
        pageOffset = 0;
        currentPage = 1;
        xSortDirection = 'sortUp';
        xSortField = 'Title';
        setSortProperties();
        return null;
    }

    public PageReference setSortController() {
        pageOffset = 0;
        currentPage = 1;

        setSortProperties();

        return null;
    }



    public CustomBadgeController() {

        xSortDirection = 'sortUp';
        xSortField = 'Title';
        setSortProperties();
        document_id = '';
        document_name = '';

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

        filterBadge = '';

        String c = ApexPages.currentPage().getParameters().get('gotoAdd');


        if (c == 'Y') {
            addBadge();
        }

    }

    public void setSortProperties() {

         pSortDirection = (xSortDirection == 'sortUp') ? 'ASC' : 'DESC NULLS LAST';

        if (xSortField == 'Image') {
            pSortField = 'image__c';

        }

        if (xSortField == 'Title') {
            pSortField = 'title__c';
        }

        if (xSortField == 'Description') {
            pSortField = 'short_description__c';
        }

        if (xSortField == 'ID') {
            pSortField = 'credlyBadgeId__c';
        }

        if (xSortField == 'Created Date') {
            pSortField = 'credlyCreatedDateTime__c';
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
    public String xiconId {
        get;
        set;
    }

    public Boolean showIframe {
        get;
        set;
    }

    public pageReference dmlOperation() {
        //Call Credly API to get your badges//
        myCredlyBadges = staticCredlyClass.getMyBadgesFromCredly();
        myCredlyBadgeIDs = staticCredlyClass.getCredlyBadgeIdsFromData(myCredlyBadges);
        mySalesForceCredlyBadgeIDs = staticCredlyClass.getCredlyBadgeIDsFromSalesforce();
        staticCredlyClass.synchBadgesFromCredly(myCredlyBadges, mySalesForceCredlyBadgeIDs);

        totalNumberofRecords = myCredlyBadgeIDs.size();

        numberOfPages = totalNumberofRecords / pageLimit;
        Integer remainder = Math.mod(totalNumberofRecords, pageLimit);
        if (remainder > 0) {
            ++numberOfPages;
        }


        if (numberOfPages < 1) {
            numberOfPages = 1;
        }



        return null;
    }

    public pageReference setImageAction() {
        if (document.body != null) {
            xbadgeURL = 'data:image;base64,' + EncodingUtil.base64Encode(document.body);
          
            document.AuthorId = UserInfo.getUserId();
            document.FolderId = UserInfo.getUserId();
            //    strBody = EncodingUtil.base64Encode(document.body);
            try {
                insert document;
                document_id = document.Id;
                document_name = document.name;
                //clear view state
                document.body = null;
                document = new Document();
            } catch (DMLException e) {
                ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, 'Error uploading file'));
                return null;
            }
        
        }
        return null;
    }

    public pageReference passBadgeImageParms() {
        return null;
    }

    public pageReference setUploadAction() {
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



    public String test {
        get;
        set;
    }

    public String title {
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
    public String upload_option {
        get;
        set;
    }
    public Boolean renderUpload {
        get;
        set;
    }
    public Boolean renderBadgeBuilder {
        get;
        set;
    }



    public Document document {
        get {
            if (document == null)
                document = new Document();
            return document;
        }
        set;
    }


    public class authorizationClass {
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
        String credlyBadgeId;

        badge__c insertUser = new badge__c();

        if (xbadgeURL.trim().length() == 0) {
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, 'Badge Missing - Use Badge Builder to create.'));
            return null;
        }
    
        try {

            insertUser.criteria__c = criteria;
            insertUser.description__c = description;
            insertUser.expire_number__c = integer.valueof(is_expireNumber);
            insertUser.expire_period__c = is_expirePeriod;

            insertUser.is_giveable__c = is_giveable;
            insertUser.categories__c = categories;

            insertUser.short_description__c = short_description;
            insertUser.title__c = title;


            if (document_Id.trim().compareTo('') != 0) {
                insertUser.upload_file_id__c = document_Id;
                insertUser.document_id__c =  url.getSalesforceBaseUrl().toExternalForm() + '/servlet/servlet.FileDownload?file=' + document_Id;
            } else {
                insertUser.document_id__c = xbadgeURL;
            }
            
            
             credlyBadgeId = staticCredlyClass.sendBadgeToCredly(insertUser);
         
             if(String.isNotBlank(credlyBadgeId))
             {
             	insertUser.credlyBadgeId__c = credlyBadgeId;
             }
             else
             {
             	ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, 'Error creating new badge on Credly.'));
             	return null;
             }
             
          insert insertUser;

        } catch (DMLException e) {
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, 'Error creating new badge in Salesforce.'));
            return null;
        }
        
        finally{
        	    document_id = '';
        		document_name = '';
        }

        //Submit Job to Send Badges//
   //     staticCredlyClass.synchBadgesToCredly();


        addBlock = false;
        showIframe = false;
        detailsBlock = true;
        ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO, 'Badge Created Successfully'));
		
		PageReference pageRef = new PageReference('/apex/ViewBadges');
        pageRef.setRedirect(true);
        return pageRef;

    }

    // ApexPages.StandardgetBadgetroller must be instantiated
    // for standard list controllers
    public List < badge__c > getBadge {

        get {
                
                myId = UserInfo.getUserId();

            List < badge__c > badges;

            badge__c[] arrayOfBadges;

            //Description is a field that cannot be filtered/ordered on, have to pull all records
        //    if (xSortField == 'Description') {
         //       arrayOfBadges = [select criteria__c, description__c, expires_in__c, is_giveable__c, short_description__c, title__c, image__c, document_ID__c, credlyBadgeId__c, createdById, createdDate,credlyCreatedDateTime__c from badge__c where((credlyBadgeId__c IN: myCredlyBadgeIDs) or(credlyBadgeId__c = null and createdById = : myId)) and(title__c like: filterBadgeSearch)];
          //      arrayOfBadges = staticCredlyClass.sortSpecialBadges(arrayOfBadges, xSortField, pSortDirection);
          ////      badges = arrayOfBadges;
          //      numberOfPages = 1;
          //      return badges;
          //  }

            if ((filterBadge.trim().compareTo(' ') > 0)) {
                filterBadgeSearch = filterBadge;

                AggregateResult[] groupedResults = [select count(id) recCnt from badge__c where((credlyBadgeId__c IN: myCredlyBadgeIDs) or (credlyBadgeId__c = null and createdById = :myId)) and title__c like: filterBadgeSearch];
                Object recordCount = groupedResults[0].get('recCnt');

                setPagingInfo(Integer.valueOf(recordCount));

                badges = Database.query('select criteria__c, description__c, expires_in__c, is_giveable__c, short_description__c,title__c, image__c, document_ID__c, credlyBadgeId__c, createdById, createdDate,credlyCreatedDateTime__c from badge__c  where ((credlyBadgeId__c IN :myCredlyBadgeIDs) or (credlyBadgeId__c = null and createdById = :myId)) and (title__c  like :filterBadgeSearch)  order by ' + pSortField + ' ' + pSortDirection + ' LIMIT :pageLimit OFFSET :pageOffset');
            }
              if ((filterBadge.trim().compareTo(' ') < 0)) {
                AggregateResult[] groupedResults = [select count(id) recCnt from badge__c where((credlyBadgeId__c IN: myCredlyBadgeIDs) or (credlyBadgeId__c = null and createdById = :myId))];
                Object recordCount = groupedResults[0].get('recCnt');

                setPagingInfo(Integer.valueOf(recordCount));

                badges = Database.query('select criteria__c, description__c, expires_in__c, is_giveable__c, short_description__c,title__c, image__c, document_ID__c, credlyBadgeId__c, createdDate, createdById, credlyCreatedDateTime__c from badge__c  where ((credlyBadgeId__c IN :myCredlyBadgeIDs) or (credlyBadgeId__c = null and createdById = :myId)) order by ' + pSortField + ' ' + pSortDirection + ' LIMIT :pageLimit OFFSET :pageOffset');
            }



            return badges;
        }
        set;
    }
    // Initialize getBadge and return a list of records
    public List < badge__c > getBadges() {
        return (List < badge__c > ) getBadge;
    }

    public pageReference addBadge() {

        addBlock = true;
        detailsBlock = false;
        return null;
    }
    public pageReference next() {

        pageOffset = pageOffset + pageLimit;
        currentPage = currentPage + 1;
        if (currentPage > numberOfPages) {
            currentPage = 1;
            pageOffset = 0;
        }

        return null;
    }
    public pageReference prev() {

        pageOffset = pageOffset - pageLimit;
        currentPage = currentPage - 1;

        if (currentPage <= 0) {
            pageOffset = 0;
            currentPage = 1;
        }

        return null;
    }


    public void setPagingInfo(Integer records) {

        totalNumberofRecords = records;

        numberOfPages = totalNumberofRecords / pageLimit;
        Integer remainder = Math.mod(totalNumberofRecords, pageLimit);
        if (remainder > 0) {
            ++numberOfPages;
        }


        if (numberOfPages < 1) {
            numberOfPages = 1;
        }


    }


}