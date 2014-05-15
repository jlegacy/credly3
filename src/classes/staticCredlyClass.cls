public with sharing class staticCredlyClass {

    public static DateTime convCRDateTime(String x) {

        String[] dateString = x.split(' ');

        if (dateString[2].CompareTo('Jan') == 0) {
            dateString[2] = '1';
        }
        if (dateString[2].CompareTo('Feb') == 0) {
            dateString[2] = '2';
        }
        if (dateString[2].CompareTo('Mar') == 0) {
            dateString[2] = '3';
        }
        if (dateString[2].CompareTo('Apr') == 0) {
            dateString[2] = '4';
        }
        if (dateString[2].CompareTo('May') == 0) {
            dateString[2] = '5';
        }
        if (dateString[2].CompareTo('Jun') == 0) {
            dateString[2] = '6';
        }
        if (dateString[2].CompareTo('Jul') == 0) {
            dateString[2] = '7';
        }
        if (dateString[2].CompareTo('Aug') == 0) {
            dateString[2] = '8';
        }
        if (dateString[2].CompareTo('Sep') == 0) {
            dateString[2] = '9';
        }
        if (dateString[2].CompareTo('Oct') == 0) {
            dateString[2] = '10';
        }
        if (dateString[2].CompareTo('Nov') == 0) {
            dateString[2] = '11';
        }
        if (dateString[2].CompareTo('Dec') == 0) {
            dateString[2] = '12';
        }

        string stringDate = dateString[3] + '-' + dateString[2] + '-' + dateString[1] + ' ' + dateString[4] + ' ' + dateString[5];


        DateTime dt = datetime.valueOf(stringDate);

        //  Thu, 14 Nov 2013 18:49:39 -0500
        return dt;

    }

    public with sharing class Token {
        public String authKey;
        public String APIkey;
        public String APIsecret;
        public String APItoken;
        public String UserName;
    }
    static public Token getToken(Id userId) {


        String name;
        List < String > temp;
        String authName;


        Token token = new Token();
        token.authKey = ' ';
        token.APIsecret = ' ';
        token.APIkey = ' ';
        token.APItoken = ' ';
        token.UserName = ' ';
		System.debug('Getting token');
		System.debug(userId);
        token_data__c[] myToken = [SELECT user_name_t__c, apiToken_data_t__c, 
                                    authKey_data_t__c, apiKey_data_t__c, 
                                    apiSecret_data_t__c FROM token_data__c WHERE 
                                    user_name_t__c = :userId];
   		System.debug(myToken);
        for (token_data__c a: myToken) {

            token.authKey = a.authKey_data_t__c;
            token.APIsecret = a.apiSecret_data_t__c;
            token.APIkey = a.apiKey_data_t__c;
            token.APItoken = a.apiToken_data_t__c;
            authName = EncodingUtil.base64Decode(a.authKey_data_t__c).toString();
            temp = authName.split(':');
            token.UserName = temp[0];
        }
        System.debug(token);

        return token;
    }
    static public Token getToken() {


        String name;
        List < String > temp;
        String authName;


        Token token = new Token();
        token.authKey = ' ';
        token.APIsecret = ' ';
        token.APIkey = ' ';
        token.APItoken = ' ';
        token.UserName = ' ';

        token_data__c[] myToken = [SELECT user_name_t__c, apiToken_data_t__c, authKey_data_t__c, apiKey_data_t__c, apiSecret_data_t__c FROM token_data__c WHERE user_name_t__c = : UserInfo.getUserId()];
        for (token_data__c a: myToken) {

            token.authKey = a.authKey_data_t__c;
            token.APIsecret = a.apiSecret_data_t__c;
            token.APIkey = a.apiKey_data_t__c;
            token.APItoken = a.apiToken_data_t__c;
            authName = EncodingUtil.base64Decode(a.authKey_data_t__c).toString();
            temp = authName.split(':');
            token.UserName = temp[0];
        }

        return token;
    }

    static public String createAuthKey(String name, String password) {
        Blob b;
        String authKey = name + ':' + password;
        String b64;
        b = Blob.valueOf(authKey);

        b64 = EncodingUtil.base64Encode(b);
        return b64;
    }


    static public void setTokenOnly(String passedToken) {
        token_data__c[] myToken = [SELECT user_name_t__c, authKey_data_t__c FROM token_data__c WHERE user_name_t__c = : UserInfo.getUserId() limit 1];
        myToken[0].apiToken_data_t__c = passedToken;
        update myToken;
    }

    static public void setToken(Token passedToken) {
        //delete token
        token_data__c[] myToken = [SELECT user_name_t__c, authKey_data_t__c FROM token_data__c WHERE user_name_t__c = : UserInfo.getUserId()];
        try {
            delete myToken;
        } catch (DmlException e) {
            // Process exception here
        }

        //create new one
        token_data__c newToken = new token_data__c(user_name_t__c = UserInfo.getUserId(), authKey_data_t__c = passedToken.authKey, apiKey_data_t__c = passedToken.APIkey, APIsecret_data_t__c = passedToken.APIsecret, apiToken_data_t__c = passedToken.APItoken);
        try {
            insert newToken;
        } catch (DmlException e) {
            // Process exception here
        }

    }
    static public PageReference tokenPage() {
        return Page.ViewBadgeToken;
    }


  //  public static void synchBadgesToCredly() {
  //      batchSyncBadges a = new batchSyncBadges();
  //      Database.executeBatch(a, 8);
 //   }
 
    /* public static DateTime getLastWaitingJob()
     {
     DateTime x = system.now();
     memberJobRun__c myJobs = [select jobRunDateTime__c from memberJobRun__c order by jobRunDateTime__c DESC limit 1];
     if (myJobs != null)
     {
     x = myJobs.jobRunDateTime__c;
     }
     return x;
     
     }
     
      public void insertJob(String x, DateTime y)
     {
     memberJobRun__c myJobs = new memberJobRun__c();
       myJobs.jobName__c = x;
         myJobs.jobRunDateTime__c = y;
         insert myJobs;
     }
       public void deleteJob(String x)
     {
     memberJobRun__c myJobs = [select jobRunDateTime__c from memberJobRun__c where jobName__c = :x limit 1];
          if (myJobs != null)
     {
     delete myJobs;
     }
     }*/

    public static void synchMemberBadgeToCredly(id recordId) {
    
        //check to see if any jobs left to run//
        
        String jobName = GuidUtil.NewGuid();

        //  jobName = String.newGuid();
      //  DateTime dt;
        
     //   dt = staticCredlyClass.getLastWaitingJob();

        schedulerSynchMemberBadgeClass apextoSchd = new schedulerSynchMemberBadgeClass();
        apextoSchd.recordId = recordId;
        //Get the system date and time.
        Datetime dt = DateTime.now();
        //Interval of 2 minutes after processing of first job. It can be set in terms of seconds also.
        dt = dt.addSeconds(30);
        
        String sch = String.valueOf(dt.second()) + ' ' + String.valueOf(dt.minute()) + ' ' + String.valueOf(dt.hour()) + ' ' + String.valueOf(dt.day()) + ' ' + String.valueOf(dt.month()) + ' ' + '? ' + String.valueOf(dt.Year());
        
     //   staticCredlyClass.insertJob('test', dt);
        /***** Run schedule job for second logic with TimeStamp. *****/
        system.schedule('SynchMemberBadges:' + jobName + String.valueof(dt), sch, apextoSchd);
    }


    public static List < CredlyJSON2ApexMyBadges.Data > getMyBadgesFromCredly() {

        List < CredlyJSON2ApexMyBadges.Data > myCredlyBadges = new List < CredlyJSON2ApexMyBadges.Data > ();
        myCredlyBadges = CredlyJSONCalls.getMyBadges();

        return myCredlyBadges;
    }

    public static List < CredlyJSON2ApexMyMemberBadges.Data > getMyMemberBadgesFromCredly() {
        List < CredlyJSON2ApexMyMemberBadges.Data > myCredlyMemberBadges = new List < CredlyJSON2ApexMyMemberBadges.Data > ();
        myCredlyMemberBadges = CredlyJSONCalls.getMyMemberBadges();
        return myCredlyMemberBadges;
    }

    public static CredlyJSON2ApexCredlySingleBadgeData.Data getSingleBadgeDataFromCredly(String badgeID) {
        CredlyJSON2ApexCredlySingleBadgeData mySingleBadge = new CredlyJSON2ApexCredlySingleBadgeData();
        mySingleBadge = CredlyJSONCalls.getSingleBadge(badgeID);
        return mySingleBadge.data;
    }
    public static String getSingleCategoryID(String searchString) {
        return CredlyJSONCalls.getCategoryId(searchString);
    }

    public static set < String > getCredlyBadgeIdsFromData(List < CredlyJSON2ApexMyBadges.Data > myCredlyBadges) {
        set < String > myCredlyBadgeIDs;
        myCredlyBadgeIDs = new set < String > ();

        for (CredlyJSON2ApexMyBadges.Data i: myCredlyBadges) {
            myCredlyBadgeIDs.add(String.valueOf(i.id));
        }
        return myCredlyBadgeIDs;
    }

    public static String sendBadgeToCredly(badge__c badge) {
        String credlyBadgeId;
        credlyBadgeId = CredlyJSONCalls.postMyBadge(badge);
        return credlyBadgeId;
    }

    public static set < String > getCredlyBadgeIDsFromSalesforce() {
        ID myId = UserInfo.getUserId();
        List < badge__c > myIds = [select credlyBadgeId__c from badge__c where credlyBadgeId__c <> null and createdBy.Id = : myId];
        set < String > mySalesForceBadgeIDs = new set < String > ();

        for (badge__c i: myIds) {
            mySalesForceBadgeIDs.add(String.valueOf(i.credlyBadgeId__c));
        }
        return mySalesForceBadgeIDs;

    }

    public static void synchBadgesFromCredly(List < CredlyJSON2ApexMyBadges.Data > myCredlyBadges, set < String > mySalesForceCredlyBadgeIDs) {
        boolean check = false;
        String credlyBadgeString;
        String value;
        Map<String, String> m = new Map<String, String >(); 
        
         String myId = UserInfo.getUserId();
         
       
        List < badge__c > newBadges = new List < badge__c > ();
        List < badge__c > updateBadges = new List < badge__c > ();
        
         List <badge__c> badgesWithNoCredlyDate = [select credlyBadgeId__c from badge__c where credlyCreatedDateTime__c = null and createdById = :myId];
        
        for(badge__c a : badgesWithNoCredlyDate){
            m.put(a.credlyBadgeId__c,a.credlyBadgeId__c );
        }
        
        //loop through credlyList and compare to Salesforce list 
        for (CredlyJSON2ApexMyBadges.Data item: myCredlyBadges) {
            check = false;
            if (mySalesForceCredlyBadgeIDs.contains(String.valueOf(item.id))) {
                check = true;
                credlyBadgeString = String.valueOf(item.id);
                try {
                    value = '';
                    value = m.get(credlyBadgeString);
                    if (value.trim().compareTo('') != 0)
                    {
                        badge__c test = [select id, credlyCreatedDateTime__c from badge__c where credlyBadgeId__c = :credlyBadgeString and credlyCreatedDateTime__c = null and createdById = :myId];
                        test.credlyCreatedDateTime__c = staticCredlyClass.convCRDateTime(item.created_at);
                        updateBadges.add(test);
                    }
                } catch (exception e) {}

            }

            if (check == false) {

                badge__c insertBadges = new badge__c();

                insertBadges.document_id__c = string.valueof(item.image_url);


                insertBadges.criteria__c = '';
                insertBadges.description__c = '';
                insertBadges.expires_in__c = 0;
                insertBadges.is_giveable__c = string.valueof(item.is_giveable);

                if (item.short_description == null) {
                    insertBadges.short_description__c = 'none';
                } else {
                    insertBadges.short_description__c = string.valueof(item.short_description);
                }

                insertBadges.title__c = string.valueof(item.title);
                insertBadges.credlyBadgeId__c = string.valueof(item.id);


                newBadges.add(insertBadges);

            }

        }
        if (newBadges <> null) {
            try {
                insert newBadges;
            } catch (exception e) {
                ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, 'Error Inserting/Synching Badges.'));
            }

        }
        if (updateBadges <> null) {
            try {
                update updateBadges;
            } catch (exception e) {
                ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, 'Error Updating/Synching Badges.'));

            }
        }


    }


    public static set < Integer > getCredlyMemberBadgeIdsFromData(List < CredlyJSON2ApexMyMemberBadges.Data > myCredlyMemberBadges) {
        set < Integer > myCredlyMemberBadgeIDs;
        myCredlyMemberBadgeIDs = new set < Integer > ();

        for (CredlyJSON2ApexMyMemberBadges.Data i: myCredlyMemberBadges) {
            myCredlyMemberBadgeIDs.add(i.id);
        }
        return myCredlyMemberBadgeIDs;
    }

    public static set < String > getCredlyMemberIDsFromSalesforce() {
        List < member_badge__c > myIds = [select credlyMemberBadge_id_m__c from member_badge__c where credlyMemberBadge_id_m__c <> null];
        set < String > mySalesForceMemberBadgeIDs = new set < String > ();

        for (member_badge__c i: myIds) {
            mySalesForceMemberBadgeIDs.add(String.valueOf(i.credlyMemberBadge_id_m__c));
        }
        return mySalesForceMemberBadgeIDs;

    }

    public static set < String > getRuleIDsFromSalesforce() {

        List < badge_rules__c > rules;
        set < String > mySalesForceRuleIDs = new set < String > ();
        String myId = UserInfo.getUserId();

        rules = [select id from badge_rules__c where createdById = : myId];

        for (badge_rules__c i: rules) {
            mySalesForceRuleIDs.add(String.valueOf(i.id));
        }
        return mySalesForceRuleIDs;

    }

    public static ID getBadgeID(String id) {
        badge__c[] badgeRec = [select id from badge__c where credlyBadgeId__c = : id limit 1];
        if (badgeRec.Size() > 0) {
            return badgeRec[0].id;
        } else {
            return null;
        }

    }

    public static Map < String, String > getBadgeIDMap() {
         ID myId = UserInfo.getUserId();
        Map < String, String > m = new Map < String, String > ();

        badge__c[] badgeRec = [select id, credlyBadgeId__c from badge__c where createdById = :myId];

        for (badge__c y: badgeRec) {
            m.put(y.CredlyBadgeId__c, y.id);
        }
        return m;
    }

    public static void synchMemberBadgesFromCredly(List < CredlyJSON2ApexMyMemberBadges.Data > myCredlyMemberBadges, set < String > mySalesForceCredlyMemberBadgeIDs) {
        boolean check = false;
        ID leadId;
        ID contactId;

        Map < String, String > credlyBadgesCrossRef = new Map < String, String > ();

        credlyBadgesCrossRef = getBadgeIdMap();

        List < member_badge__c > newMemberBadges = new List < member_badge__c > ();

        //loop through credlyList and compare to Salesforce list
        Map<String, Id> cIdmap = new Map<String, Id>();
        Map<String, Id> lIdmap = new Map<String, Id>();
        
        String[] emails = new String[]{};
        String[] badgeIds = new String[]{};
        for (CredlyJSON2ApexMyMemberBadges.Data item: myCredlyMemberBadges) {
            if(item.member_orphan != null && item.member_orphan.email != null) emails.add(item.member_orphan.email);
            badgeIds.add(String.valueOf(item.badge_id));
        } 
        
        System.debug('Pre-Lead/Contact Loops');
        Lead[] leads = [Select Id, Email from Lead where Email IN :emails];
        Contact[] contacts = [Select Id, Email from Contact where Email IN :emails];
        for(Lead l : leads) lIdmap.put(l.email, l.id);
        for(Contact c : contacts) cIdmap.put(c.email, c.id);
        System.debug('Pre Badge Query');
        Badge__c[] badges = [select Id, document_id__c, credlyBadgeId__c from badge__c where credlyBadgeId__c IN :badgeIds];
        Map<String, String> docIdMap = new Map<String, String>();
        for(Badge__c b : badges) docIdMap.put(b.credlyBadgeId__c, b.document_id__c);


        for (CredlyJSON2ApexMyMemberBadges.Data item: myCredlyMemberBadges) {
            check = false;
            if (mySalesForceCredlyMemberBadgeIDs.contains(String.valueOf(item.id))) {
                check = true;
            } else {
                check = false;
            }


            if (check == false) {

                member_badge__c memberBadge = new member_badge__c();

                memberBadge.credlyMemberBadge_id_m__c = item.id;
                //  memberBadge.badge_lookup_m__c = staticCredlyClass.getBadgeID(String.valueOf(item.badge_id));

                memberBadge.badge_lookup_m__c = credlyBadgesCrossRef.get(String.valueOf(item.badge_id));

                if (memberBadge.badge_lookup_m__c == null) {
                    continue;
                }

                leadId = null;
                contactId = null;

                try {
                    if(lIdmap.containsKey(item.member_orphan.email)) leadId = lIdmap.get(item.member_orphan.email);
                    if (leadId == null && cIdmap.containsKey(item.member_orphan.email)) {
                        contactId = cIdmap.get(item.member_orphan.email);
                    }
                } catch (exception e) {

                }

                if ((leadId == null) && (contactId == null)) {
                    continue;
                }

                if (leadId <> null) {
                    memberBadge.lead_lookup_m__c = leadId;
                    memberBadge.account_type_m__c = 'lead';
                }

                if (contactId <> null) {
                    memberBadge.contact_lookup_m__c = contactId;
                    memberBadge.account_type_m__c = 'contact';
                }

                memberBadge.title_m__c = item.title;
                memberBadge.document_id_m__c = docIdMap.get(String.valueOf(item.badge_id));
                memberBadge.short_description_m__c = item.short_description;
                memberBadge.is_visible_m__c = String.valueOf(item.is_visible);
                memberBadge.description_m__c = item.description;
                memberBadge.criteria_m__c = item.criteria;
                memberBadge.categories_m__c = String.valueOf(item.categories);
                memberBadge.evidence_url_m__c = (item.badge_evidence.Size() == 0) ? ' ' : item.badge_evidence[0].resource;
                memberBadge.testimonial_m__c = (item.badge_testimonial.Size() == 0) ? ' ' : item.badge_testimonial[0].body;
                memberBadge.issue_date_m__c = date.valueOf(staticCredlyClass.convCRDateTime(item.created_at));
                memberBadge.expires_in_m__c = item.badge.expires_in;
                //  memberBadge.expires_in_m__c = (memberBadge.expires_in_m__c == 0) ? 319999999 : memberBadge.expires_in_m__c;
                newMemberBadges.add(memberBadge);

            }

        }
        if (newMemberBadges.Size() > 0) {
            insert newMemberBadges;
        }


    }

    public static id GetContactID(String email) {
        Contact[] contactRec = [select id from Contact where email = : email limit 1];
        if (contactRec.Size() > 0) {
            return contactRec[0].id;
        } else {
            return null;
        }

    }

    public static id GetLeadID(String email) {
        Lead[] leadRec = [select id from Lead where email = : email limit 1];
        if (leadRec.Size() > 0) {
            return leadRec[0].id;
        } else {
            return null;
        }

    }

    public static String GetBadgeDocumentId(String ID) {
        badge__c[] badgeRec = [select document_id__c from badge__c where credlyBadgeId__c = : id limit 1];
        if (badgeRec.Size() > 0) {
            return badgeRec[0].document_id__c;
        } else {
            return null;
        }
    }

    public static void storeCredlyId(Integer CredlyId, ID whoId, String AccountType) {
        if (AccountType == 'contact') {
            credlyIDEmailCross__c credlyCross = new credlyIDEmailCross__c();
            credlyCross.CredlyId_xf__c = CredlyId;
            credlyCross.Contact_Lookup_xf__c = whoId;
            insert credlyCross;
        }

        if (AccountType == 'lead') {
            credlyIDEmailCross__c credlyCross = new credlyIDEmailCross__c();
            credlyCross.CredlyId_xf__c = CredlyId;
            credlyCross.Lead_Lookup_xf__c = whoId;
            insert credlyCross;
        }

        if (AccountType == 'account') {
            credlyIDEmailCross__c credlyCross = new credlyIDEmailCross__c();
            credlyCross.CredlyId_xf__c = CredlyId;
            credlyCross.Account_Lookup_xf__c = whoId;
            insert credlyCross;
        }
    }

    public static Integer getCredlyIDfromSalesForce(ID whoId, String AccountType) {
        Integer CredlyId = 0;
        if (AccountType == 'contact') {
            credlyIDEmailCross__c[] credlyCross = [SELECT CredlyId_xf__c FROM credlyIDEmailCross__c where contact_Lookup_xf__c = : whoId LIMIT 1];
            if (credlyCross.size() > 0) {
                CredlyId = Integer.valueOf(credlyCross[0].CredlyId_xf__c);
            }
            return CredlyId;
        }

        if (AccountType == 'lead') {
            credlyIDEmailCross__c[] credlyCross = [SELECT CredlyId_xf__c FROM credlyIDEmailCross__c where lead_Lookup_xf__c = : whoId LIMIT 1];
            if (credlyCross.size() > 0) {
                CredlyId = Integer.valueOf(credlyCross[0].CredlyId_xf__c);
            }
            return CredlyId;
        }

        if (AccountType == 'account') {
            credlyIDEmailCross__c[] credlyCross = [SELECT CredlyId_xf__c FROM credlyIDEmailCross__c where account_Lookup_xf__c = : whoId LIMIT 1];
            if (credlyCross.size() > 0) {
                CredlyId = Integer.valueOf(credlyCross[0].CredlyId_xf__c);
            }
            return CredlyId;
        }
        return CredlyId;

    }

    public static String ToString(integer Value) {
        /* string representation if an Integer value */
        return Value.format();
    }

    public static String ToString(Double Value) {
        /* string representation if a Double value */
        return Value.format();
    }

    public static String ToString(Boolean Value) {
        /* string representation if a Boolean value */
        if (Value)
            return 'true';
        else
            return 'false';
    }

    public static String ToString(Long Value) {
        /* string representation if a Long value */
        return Value.format();
    }

    public static String ToString(Date Value) {
        /* string representation if a Date value */
        return Value.format();
    }

    public static String ToString(Date Value, String format) {
        /* string representation if a Date value with formatting */
        Datetime temp = Datetime.newInstance(Value.year(), Value.month(), Value.day());
        return temp.format(format);
    }

    public static String ToString(Datetime Value) {
        /* string representation if a Datetime value */
        return Value.format();
    }

    public static String ToString(Datetime Value, String format) {
        /* string representation if a Datetime value with formatting */
        return Value.format(format);
    }

    public static String ToString(Time Value) {
        /* string representation if a Time value */
        return String.valueOf(Value);
    }

    public static String ToString(Time Value, String format) {
        /* string representation if a Time value with formating */
        Datetime temp = Datetime.newInstance(1970, 1, 1, Value.hour(), Value.minute(), Value.second());
        return temp.format(format);
    }

    public static String ToString(Decimal Value) {
        /* string representation if a Decimal value */
        return Value.format();
    }

    public static String ToString(Decimal Value, Boolean ScientificNotation) {
        /* string representation if a Decimal value with or without Scientific Notation */
        if (ScientificNotation)
            return Value.format();
        else
            return Value.toPlainString();
    }

    public static String FileSizeToString(Long Value) {
        /* string representation if a file's size, such as 2 KB, 4.1 MB, etc */
        if (Value < 1024)
            return ToString(Value) + ' Bytes';
        else
        if (Value >= 1024 && Value < (1024 * 1024)) {
            //KB
            Decimal kb = Decimal.valueOf(Value);
            kb = kb.divide(1024, 2);
            return ToString(kb) + ' KB';
        } else
        if (Value >= (1024 * 1024) && Value < (1024 * 1024 * 1024)) {
            //MB
            Decimal mb = Decimal.valueOf(Value);
            mb = mb.divide((1024 * 1024), 2);
            return ToString(mb) + ' MB';
        } else {
            //GB
            Decimal gb = Decimal.valueOf(Value);
            gb = gb.divide((1024 * 1024 * 1024), 2);

            return ToString(gb) + ' GB';
        }

    }

    public static String CurrencyToString(Decimal Value, String CurrencyChar) {
        return CurrencyChar + ToString(Value);
    }

    public static Integer PageLimit() {
        return 5;
    }

    public static badge__c[] sortSpecialBadges(badge__c[] ListToSort, String fieldDescription, String orderby) {

        integer j;
        boolean flag = true; // set flag to true to begin first pass
        badge__c temp; //holding variable
        if (ListToSort.size() > 0) {
            while (flag) {
                flag = false; //set flag to false awaiting a possible swap
                for (j = 0; j < ListToSort.size() - 1; j++) {

                    if (fieldDescription == 'Description') {
                        if (orderBy == 'ASC') {

                            if (ListToSort[j].description__c > ListToSort[j + 1].description__c) // change to > for ascending sort
                            {
                                temp = ListToSort[j]; //swap elements
                                ListToSort[j] = ListToSort[j + 1];
                                ListToSort[j + 1] = temp;
                                flag = true; //shows a swap occurred  
                            }
                        }
                        if (orderBy == 'DESC') {

                            if (ListToSort[j].description__c < ListToSort[j + 1].description__c) // change to > for ascending sort
                            {
                                temp = ListToSort[j]; //swap elements
                                ListToSort[j] = ListToSort[j + 1];
                                ListToSort[j + 1] = temp;
                                flag = true; //shows a swap occurred  
                            }
                        }
                    }
                }
            }
        }

        return ListToSort;
    }

    public static member_badge__c[] sortSpecialMemberBadges(member_badge__c[] ListToSort, String fieldDescription, String orderby) {

        integer j;
        String curRec;
        String nxtRec;

        boolean flag = true; // set flag to true to begin first pass
        member_badge__c temp; //holding variable
        if (ListToSort.size() > 0) {
            while (flag) {
                flag = false; //set flag to false awaiting a possible swap
                for (j = 0; j < ListToSort.size() - 1; j++) {

                    if (fieldDescription == 'Email') {

                        curRec = (ListToSort[j].lead_lookup_m__r.email == null) ? ListToSort[j].contact_lookup_m__r.email : ListToSort[j].lead_lookup_m__r.email;
                        nxtRec = (ListToSort[j + 1].lead_lookup_m__r.email == null) ? ListToSort[j + 1].contact_lookup_m__r.email : ListToSort[j + 1].lead_lookup_m__r.email;

                        if (orderBy == 'ASC') {

                            if (curRec > nxtRec) // change to > for ascending sort
                            {
                                temp = ListToSort[j]; //swap elements
                                ListToSort[j] = ListToSort[j + 1];
                                ListToSort[j + 1] = temp;
                                flag = true; //shows a swap occurred  
                            }
                        }
                        if (orderBy == 'DESC') {


                            if (curRec < nxtRec) // change to > for ascending sort
                            {
                                temp = ListToSort[j]; //swap elements
                                ListToSort[j] = ListToSort[j + 1];
                                ListToSort[j + 1] = temp;
                                flag = true; //shows a swap occurred  
                            }
                        }
                    }
                    if (fieldDescription == 'Evidence') {

                        curRec = (ListToSort[j].evidence_name_m__c == null) ? ListToSort[j].evidence_url_m__c : ListToSort[j].evidence_name_m__c;
                        nxtRec = (ListToSort[j + 1].evidence_name_m__c == null) ? ListToSort[j + 1].evidence_url_m__c : ListToSort[j + 1].evidence_name_m__c;

                        if (orderBy == 'ASC') {

                            if (curRec > nxtRec) // change to > for ascending sort
                            {
                                temp = ListToSort[j]; //swap elements
                                ListToSort[j] = ListToSort[j + 1];
                                ListToSort[j + 1] = temp;
                                flag = true; //shows a swap occurred  
                            }
                        }
                        if (orderBy == 'DESC') {

                            if (curRec < nxtRec) // change to > for ascending sort
                            {
                                temp = ListToSort[j]; //swap elements
                                ListToSort[j] = ListToSort[j + 1];
                                ListToSort[j + 1] = temp;
                                flag = true; //shows a swap occurred  
                            }
                        }
                    }
                    if (fieldDescription == 'Testimonial') {

                        curRec = (ListToSort[j].testimonial_m__c);
                        nxtRec = (ListToSort[j + 1].testimonial_m__c);

                        if (orderBy == 'ASC') {

                            if (curRec > nxtRec) // change to > for ascending sort
                            {
                                temp = ListToSort[j]; //swap elements
                                ListToSort[j] = ListToSort[j + 1];
                                ListToSort[j + 1] = temp;
                                flag = true; //shows a swap occurred  
                            }
                        }
                        if (orderBy == 'DESC') {

                            if (curRec < nxtRec) // change to > for ascending sort
                            {
                                temp = ListToSort[j]; //swap elements
                                ListToSort[j] = ListToSort[j + 1];
                                ListToSort[j + 1] = temp;
                                flag = true; //shows a swap occurred  
                            }
                        }
                    }
                    if (fieldDescription == 'Recipient') {



                        if (ListToSort[j].account_lookup_m__c <> null) {
                            curRec = (ListToSort[j].account_lookup_m__r.name);
                        }
                        if (ListToSort[j].contact_lookup_m__r <> null) {
                            curRec = (ListToSort[j].contact_lookup_m__r.name);
                        }
                        if (ListToSort[j].lead_lookup_m__c <> null) {
                            curRec = (ListToSort[j].lead_lookup_m__r.name);
                        }

                        if (ListToSort[j + 1].account_lookup_m__c <> null) {
                            nxtRec = (ListToSort[j + 1].account_lookup_m__r.name);
                        }
                        if (ListToSort[j + 1].contact_lookup_m__c <> null) {
                            nxtRec = (ListToSort[j + 1].contact_lookup_m__r.name);
                        }
                        if (ListToSort[j + 1].lead_lookup_m__c <> null) {
                            nxtRec = (ListToSort[j + 1].lead_lookup_m__r.name);
                        }




                        if (orderBy == 'ASC') {

                            if (curRec > nxtRec) // change to > for ascending sort
                            {
                                temp = ListToSort[j]; //swap elements
                                ListToSort[j] = ListToSort[j + 1];
                                ListToSort[j + 1] = temp;
                                flag = true; //shows a swap occurred  
                            }
                        }
                        if (orderBy == 'DESC') {

                            if (curRec < nxtRec) // change to > for ascending sort
                            {
                                temp = ListToSort[j]; //swap elements
                                ListToSort[j] = ListToSort[j + 1];
                                ListToSort[j + 1] = temp;
                                flag = true; //shows a swap occurred  
                            }
                        }
                    }
                }
            }
        }

        return ListToSort;
    }

    public static Integer getRecipientCount(String recordType, String ruleText) {
        Integer recordCount;

        if (recordType == 'Account') {
            recordCount = staticCredlyClass.getRecipientAccountCount(ruleText);
        }
        if (recordType == 'Contact') {
            recordCount = staticCredlyClass.getRecipientContactCount(ruleText);
        }
        if (recordType == 'Lead') {
            recordCount = staticCredlyClass.getRecipientLeadCount(ruleText);
        }

        return recordCount;
    }

    public static Integer getRecipientAccountCount(String ruleText) {
        Integer recordCount = 0;
        boolean ruleApplies = false;
        boolean checkHit;

        //load up sObjects or aka..records//
        sObject[] o = [SELECT Id, Phone, Jigsaw, ShippingLatitude,
            ParentId, Type, CreatedById,
            LastActivityDate, CustomerPriority__c,
            BillingCity, Description, BillingLongitude,
            IsDeleted, Industry, SystemModstamp, Fax,
            TickerSymbol, ShippingCity, ShippingState,
            BillingPostalCode, AnnualRevenue, CreatedDate,
            JigsawCompanyId, SLAExpirationDate__c,
            OwnerId, LastViewedDate, Ownership, NumberOfEmployees,
            UpsellOpportunity__c, ShippingPostalCode,
            LastModifiedById, SicDesc, SLASerialNumber__c,
            AccountSource, BillingState, BillingCountry,
            BillingLatitude, LastModifiedDate,
            LastReferencedDate, ShippingStreet, Name,
            SLA__c, AccountNumber, Site, NumberofLocations__c,
            Sic, Website, ShippingLongitude, MasterRecordId,
            ShippingCountry, Active__c, BillingStreet,
            Rating FROM Account
        ];


        List < List < String >> parsedRows = new List < List < String >> ();
        List < String > fieldValues = new List < String > ();
        List < String > ids = new List < String > ();

        //There is a problem here causing a bug on line 863
        parsedRows = automatedTriggerClass.unparseRules(ruleText);
        
          //Start LGMK Code
        sObject[] matchingObjects;
        string queryString = 'SELECT Id';
      //  Map<String, Schema.SObjectField> fieldMap = Schema.SObjectType.Account.fields.getMap();
      
       Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
         Schema.SObjectType accountSchema= schemaMap.get('Account');
          Map<String, Schema.SObjectField> fieldMap = accountSchema.getDescribe().fields.getMap();

        //Populate the query with all of the object fields.
        for(String key : fieldMap.keySet())
        {
             if (fieldMap.get(key).getDescribe().isAccessible())
             {
            if(key.compareTo('id') != 0){
                queryString += (', ' + key);
            }
            }
        
        }
        queryString += ' FROM Account';
        
        if(parsedRows.isEmpty())
            matchingObjects = Database.query(queryString);
        else{   
        queryString += ' WHERE';
        Boolean isFirst = True;
        //Maps symbol codes to string symbols
        Map<String, String> symMap = automatedTriggerClass.symbolMap();
        
        // For each row: 
        // row[0] = field name
        // row[1] = field type
        // row[2] = operand
        // row[3] = field value
        for(String[] rule : parsedRows)
        {
            if(isFirst) isFirst = False;
            else queryString += ' AND';
            //Add field name to query.
            queryString += ' ' + rule.get(0) + ' ';
            //Add operand to query
            string op = symMap.get(rule.get(2));
            queryString += op + ' ';
            //Add the condition
            //For LIKE to operate like 'contains' we must have wildcards on either side of the expression
            if(op == 'LIKE') queryString += '\'%' + String.valueOf(rule.get(3)) + '%\'';
            else queryString += '\'' + String.valueOf(rule.get(3)) + '\'';
        }
        //Can add an ORDER BY clause if so desired.
        matchingObjects = Database.query(queryString);
        }
        //End LGMK Code 
        //store ids for future lookup
        ids = automatedTriggerClass.getFieldValues(o, 'id');
        //loop through fields and get values from file//
        //get fields from file//

        Map < String, Integer > foundHitIds = new Map < String, Integer > ();

        for (List < String > row: parsedRows) {

            if (!row.isEmpty()) {
                //((BillingCity, STRING, ct, test), (Industry, PICKLIST, eq, it))
                fieldValues = automatedTriggerClass.getFieldValues(o, row.get(0));
                integer index = 0;
                for (String field: fieldValues) {

                    checkHit = automatedTriggerClass.lookForHit(row.get(3), field, row.get(2), row.get(1));
                    if (checkHit) {
                        String idKey;
                        idKey = String.valueOf(o.get(index).get('id'));
                        Integer value = foundHitIds.get(idKey);
                        value = (value == null) ? 1 : value + 1;
                        foundHitIds.put(idKey, value);
                    }
                    index++;
                }

                //loop through foundhit ids and determine if any met all field criteria
                //will check if each parsed row was equated with success

                for (Id id: foundHitIds.keySet()) {
                    if (foundHitIds.get(id) == parsedRows.size()) {
                        recordCount = recordCount + 1;
                    }

                }

            }
        }


        return recordCount;
    }

    public static Integer getRecipientContactCount(String ruleText) {

        Integer recordCount = 0;
        boolean ruleApplies = false;
        boolean checkHit;

        //load up sObjects or aka..records//
        sObject[] o = [SELECT Id, Phone, Jigsaw, MailingLatitude, OtherState, LeadSource,
            CreatedById, LastActivityDate, OtherPhone, Description,
            IsDeleted, Level__c, SystemModstamp, AssistantPhone, OtherStreet, Languages__c, Fax, HasOptedOutOfEmail,
            CreatedDate, OwnerId, HasOptedOutOfFax, JigsawContactId,
            LastViewedDate, LastCUUpdateDate, Email, DoNotCall, OtherCity,
            LastModifiedById, MailingState, ReportsToId, Department, LastName,
            LastCURequestDate, OtherLongitude, LastModifiedDate, MailingLongitude,
            MailingCountry, MobilePhone, Title, LastReferencedDate,
            OtherLatitude, EmailBouncedDate, Name, Birthdate, MailingStreet,
            HomePhone, AccountId, EmailBouncedReason, MasterRecordId,
            OtherPostalCode, MailingPostalCode, FirstName, AssistantName,
            OtherCountry, Salutation, MailingCity FROM Contact
        ];

        //Get fields and Values from automated rules records//
        // Create a list of account records from a SOQL query
        List < List < String >> parsedRows = new List < List < String >> ();
        List < String > fieldValues = new List < String > ();
        List < String > ids = new List < String > ();



        Set < Set < String >> idsWithMatches = new Set < Set < String >> ();
        Set < String > idMatches = new Set < String > ();

        // Loop through rules and pull rules//
        //unparse Rules Row
        //((BillingCity, STRING, ct, test), (Industry, PICKLIST, eq, it))

        parsedRows = automatedTriggerClass.unparseRules(ruleText);
        
        
          //Start LGMK Code
        sObject[] matchingObjects;
        string queryString = 'SELECT Id';
      //  Map<String, Schema.SObjectField> fieldMap = Schema.SObjectType.Contact.fields.getMap();
      
       Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
         Schema.SObjectType contactSchema = schemaMap.get('Contact');
          Map<String, Schema.SObjectField> fieldMap = contactSchema.getDescribe().fields.getMap();
        //Populate the query with all of the object fields.
        for(String key : fieldMap.keySet())
        {
             if (fieldMap.get(key).getDescribe().isAccessible())
             {
            if(key.compareTo('id') != 0){
                queryString += (', ' + key);
            }
            }
        
        }
        queryString += ' FROM Contact';
        if(parsedRows.isEmpty())
            matchingObjects = Database.query(queryString);
        else{   
        queryString += ' WHERE';
        Boolean isFirst = True;
        //Maps symbol codes to string symbols
        Map<String, String> symMap = automatedTriggerClass.symbolMap();
        
        // For each row: 
        // row[0] = field name
        // row[1] = field type
        // row[2] = operand
        // row[3] = field value
        for(String[] rule : parsedRows)
        {
            if(isFirst) isFirst = False;
            else queryString += ' AND';
            //Add field name to query.
            queryString += ' ' + rule.get(0) + ' ';
            //Add operand to query
            string op = symMap.get(rule.get(2));
            queryString += op + ' ';
            //Add the condition
            //For LIKE to operate like 'contains' we must have wildcards on either side of the expression
            if(op == 'LIKE') queryString += '\'%' + String.valueOf(rule.get(3)) + '%\'';
            else queryString += '\'' + String.valueOf(rule.get(3)) + '\'';
        }
        //Can add an ORDER BY clause if so desired.
        matchingObjects = Database.query(queryString);
        }
        //End LGMK Code 
        //store ids for future lookup
        ids = automatedTriggerClass.getFieldValues(o, 'id');
        //loop through fields and get values from file//
        //get fields from file//
        Map < String, Integer > foundHitIds = new Map < String, Integer > ();

        for (List < String > row: parsedRows) {

            if (!row.isEmpty()) {
                //((BillingCity, STRING, ct, test), (Industry, PICKLIST, eq, it))
                fieldValues = automatedTriggerClass.getFieldValues(o, row.get(0));
                integer index = 0;
                for (String field: fieldValues) {
                    checkHit = automatedTriggerClass.lookForHit(row.get(3), field, row.get(2), row.get(1));
                    if (checkHit) {
                        String idKey;
                        idKey = String.valueOf(o.get(index).get('id'));
                        Integer value = foundHitIds.get(idKey);
                        value = (value == null) ? 1 : value + 1;
                        foundHitIds.put(idKey, value);
                    }
                    index++;
                }

                //loop through foundhit ids and determine if any met all field criteria
                //will check if each parsed row was equated with success

                for (Id id: foundHitIds.keySet()) {
                    if (foundHitIds.get(id) == parsedRows.size()) {
                        recordCount = recordCount + 1;
                    }

                }

            }
        }

        return recordCount;

    }

    public static Integer getRecipientLeadCount(String ruleText) {

        Integer recordCount = 0;
        boolean ruleApplies = false;
        boolean checkHit;

        //load up sObjects or aka..records//
        sObject[] o = [SELECT Id, PostalCode, Phone, Jigsaw, Street, LeadSource, ConvertedOpportunityId,
            IsUnreadByOwner, CreatedById, LastActivityDate,
            City, IsConverted, Description, IsDeleted, Longitude, Industry,
            SystemModstamp, Fax, Status, HasOptedOutOfEmail, ConvertedDate,
            AnnualRevenue, Primary__c, CreatedDate, OwnerId, HasOptedOutOfFax,
            JigsawContactId, LastViewedDate, Country, Email, NumberOfEmployees,
            DoNotCall, Company, Latitude, ProductInterest__c, LastModifiedById,
            State, LastName, LastModifiedDate, ConvertedAccountId, MobilePhone,
            Title, LastReferencedDate, EmailBouncedDate, Name, NumberofLocations__c,
            EmailBouncedReason, Website, MasterRecordId, SICCode__c, FirstName,
            CurrentGenerators__c, ConvertedContactId, Rating, LastTransferDate, Salutation FROM Lead
        ];

        //Get fields and Values from automated rules records//
        // Create a list of account records from a SOQL query

        List < List < String >> parsedRows = new List < List < String >> ();
        List < String > fieldValues = new List < String > ();
        List < String > ids = new List < String > ();


        Set < Set < String >> idsWithMatches = new Set < Set < String >> ();
        Set < String > idMatches = new Set < String > ();

        //unparse Rules Row
        //((BillingCity, STRING, ct, test), (Industry, PICKLIST, eq, it))

        parsedRows = automatedTriggerClass.unparseRules(ruleText);
        
          //Start LGMK Code
        sObject[] matchingObjects;
        string queryString = 'SELECT Id';
      //  Map<String, Schema.SObjectField> fieldMap = Schema.SObjectType.Lead.fields.getMap();
      
       Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
         Schema.SObjectType leadSchema= schemaMap.get('Lead');
          Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
        //Populate the query with all of the object fields.
        for(String key : fieldMap.keySet())
        {
             if (fieldMap.get(key).getDescribe().isAccessible())
             {
            if(key.compareTo('id') != 0){
                queryString += (', ' + key);
            }
            }
        
        }
        queryString += ' FROM Lead';
        if(parsedRows.isEmpty())
            matchingObjects = Database.query(queryString);
        else{   
        queryString += ' WHERE';
        Boolean isFirst = True;
        //Maps symbol codes to string symbols
        Map<String, String> symMap = automatedTriggerClass.symbolMap();
        
        // For each row: 
        // row[0] = field name
        // row[1] = field type
        // row[2] = operand
        // row[3] = field value
        for(String[] rule : parsedRows)
        {
            if(isFirst) isFirst = False;
            else queryString += ' AND';
            //Add field name to query.
            queryString += ' ' + rule.get(0) + ' ';
            //Add operand to query
            string op = symMap.get(rule.get(2));
            queryString += op + ' ';
            //Add the condition
            //For LIKE to operate like 'contains' we must have wildcards on either side of the expression
            if(op == 'LIKE') queryString += '\'%' + String.valueOf(rule.get(3)) + '%\'';
            else queryString += '\'' + String.valueOf(rule.get(3)) + '\'';
        }
        //Can add an ORDER BY clause if so desired.
        matchingObjects = Database.query(queryString);
        }
        //End LGMK Code 
        
        //store ids for future lookup
        ids = automatedTriggerClass.getFieldValues(o, 'id');
        //loop through fields and get values from file//
        //get fields from file//

        Map < String, Integer > foundHitIds = new Map < String, Integer > ();

        for (List < String > row: parsedRows) {

            if (!row.isEmpty()) {
                //((BillingCity, STRING, ct, test), (Industry, PICKLIST, eq, it))
                fieldValues = automatedTriggerClass.getFieldValues(o, row.get(0));
                integer index = 0;
                for (String field: fieldValues) {

                    checkHit = automatedTriggerClass.lookForHit(row.get(3), field, row.get(2), row.get(1));
                    if (checkHit) {
                        String idKey;
                        idKey = String.valueOf(o.get(index).get('id'));
                        Integer value = foundHitIds.get(idKey);
                        value = (value == null) ? 1 : value + 1;
                        foundHitIds.put(idKey, value);
                    }
                    index++;
                }

                //loop through foundhit ids and determine if any met all field criteria
                //will check if each parsed row was equated with success

                for (Id id: foundHitIds.keySet()) {
                    if (foundHitIds.get(id) == parsedRows.size()) {
                        recordCount = recordCount + 1;

                    }
                }

            }
        }

        return recordCount;
    }

    public static Map < String, Integer > getRecipientAccountIDs(String ruleText) {
        Integer recordCount = 0;
        boolean ruleApplies = false;
        boolean checkHit;

        //load up sObjects or aka..records//
        sObject[] o = [SELECT Id, Phone, Jigsaw, ShippingLatitude,
            ParentId, Type, CreatedById,
            LastActivityDate, CustomerPriority__c,
            BillingCity, Description, BillingLongitude,
            IsDeleted, Industry, SystemModstamp, Fax,
            TickerSymbol, ShippingCity, ShippingState,
            BillingPostalCode, AnnualRevenue, CreatedDate,
            JigsawCompanyId, SLAExpirationDate__c,
            OwnerId, LastViewedDate, Ownership, NumberOfEmployees,
            UpsellOpportunity__c, ShippingPostalCode,
            LastModifiedById, SicDesc, SLASerialNumber__c,
            AccountSource, BillingState, BillingCountry,
            BillingLatitude, LastModifiedDate,
            LastReferencedDate, ShippingStreet, Name,
            SLA__c, AccountNumber, Site, NumberofLocations__c,
            Sic, Website, ShippingLongitude, MasterRecordId,
            ShippingCountry, Active__c, BillingStreet,
            Rating FROM Account
        ];


        List < List < String >> parsedRows = new List < List < String >> ();
        List < String > fieldValues = new List < String > ();
        List < String > ids = new List < String > ();

        parsedRows = automatedTriggerClass.unparseRules(ruleText);
        
          //Start LGMK Code
        sObject[] matchingObjects;
        string queryString = 'SELECT Id';
     //   Map<String, Schema.SObjectField> fieldMap = Schema.SObjectType.Account.fields.getMap();
        
        
        
         Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
         Schema.SObjectType accountSchema = schemaMap.get('Account');
          Map<String, Schema.SObjectField> fieldMap = accountSchema.getDescribe().fields.getMap();
        //Populate the query with all of the object fields.
        for(String key : fieldMap.keySet())
        {
             if (fieldMap.get(key).getDescribe().isAccessible())
             {
            if(key.compareTo('id') != 0){
                queryString += (', ' + key);
            }
            }
        
        }
        queryString += ' FROM Account';
        if(parsedRows.isEmpty())
            matchingObjects = Database.query(queryString);
        else{   
        queryString += ' WHERE';
        Boolean isFirst = True;
        //Maps symbol codes to string symbols
        Map<String, String> symMap = automatedTriggerClass.symbolMap();
        
        // For each row: 
        // row[0] = field name
        // row[1] = field type
        // row[2] = operand
        // row[3] = field value
        for(String[] rule : parsedRows)
        {
            if(isFirst) isFirst = False;
            else queryString += ' AND';
            //Add field name to query.
            queryString += ' ' + rule.get(0) + ' ';
            //Add operand to query
            string op = symMap.get(rule.get(2));
            queryString += op + ' ';
            //Add the condition
            //For LIKE to operate like 'contains' we must have wildcards on either side of the expression
            if(op == 'LIKE') queryString += '\'%' + String.valueOf(rule.get(3)) + '%\'';
            else queryString += '\'' + String.valueOf(rule.get(3)) + '\'';
        }
        //Can add an ORDER BY clause if so desired.
        matchingObjects = Database.query(queryString);
        }
        //End LGMK Code 
        //store ids for future lookup
        ids = automatedTriggerClass.getFieldValues(o, 'id');
        //loop through fields and get values from file//
        //get fields from file//

        Map < String, Integer > foundHitIds = new Map < String, Integer > ();

        for (List < String > row: parsedRows) {

            if (!row.isEmpty()) {
                //((BillingCity, STRING, ct, test), (Industry, PICKLIST, eq, it))
                fieldValues = automatedTriggerClass.getFieldValues(o, row.get(0));
                integer index = 0;
                for (String field: fieldValues) {

                    checkHit = automatedTriggerClass.lookForHit(row.get(3), field, row.get(2), row.get(1));
                    if (checkHit) {
                        String idKey;
                        idKey = String.valueOf(o.get(index).get('id'));
                        Integer value = foundHitIds.get(idKey);
                        value = (value == null) ? 1 : value + 1;
                        foundHitIds.put(idKey, value);
                    }
                    index++;
                }

            }

        }
        return foundHitIds;

    }

    public static Map < String, Integer > getRecipientContactIDs(String ruleText) {

        Integer recordCount = 0;
        boolean ruleApplies = false;
        boolean checkHit;

        //load up sObjects or aka..records//
        sObject[] o = [SELECT Id, Phone, Jigsaw, MailingLatitude, OtherState, LeadSource,
            CreatedById, LastActivityDate, OtherPhone, Description,
            IsDeleted, Level__c, SystemModstamp, AssistantPhone, OtherStreet, Languages__c, Fax, HasOptedOutOfEmail,
            CreatedDate, OwnerId, HasOptedOutOfFax, JigsawContactId,
            LastViewedDate, LastCUUpdateDate, Email, DoNotCall, OtherCity,
            LastModifiedById, MailingState, ReportsToId, Department, LastName,
            LastCURequestDate, OtherLongitude, LastModifiedDate, MailingLongitude,
            MailingCountry, MobilePhone, Title, LastReferencedDate,
            OtherLatitude, EmailBouncedDate, Name, Birthdate, MailingStreet,
            HomePhone, AccountId, EmailBouncedReason, MasterRecordId,
            OtherPostalCode, MailingPostalCode, FirstName, AssistantName,
            OtherCountry, Salutation, MailingCity FROM Contact
        ];

        //Get fields and Values from automated rules records//
        // Create a list of account records from a SOQL query
        List < List < String >> parsedRows = new List < List < String >> ();
        List < String > fieldValues = new List < String > ();
        List < String > ids = new List < String > ();



        Set < Set < String >> idsWithMatches = new Set < Set < String >> ();
        Set < String > idMatches = new Set < String > ();

        // Loop through rules and pull rules//
        //unparse Rules Row
        //((BillingCity, STRING, ct, test), (Industry, PICKLIST, eq, it))

        parsedRows = automatedTriggerClass.unparseRules(ruleText);
        
        //Start LGMK Code
        sObject[] matchingObjects;
        string queryString = 'SELECT id';
     //   Map<String, Schema.SObjectField> fieldMap = Schema.SObjectType.Contact.fields.getMap();
        
        
         Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
         Schema.SObjectType contactSchema = schemaMap.get('Contact');
          Map<String, Schema.SObjectField> fieldMap = contactSchema.getDescribe().fields.getMap();
 
         
        //Populate the query with all of the object fields.
        for(String key : fieldMap.keySet())
        {
             if (fieldMap.get(key).getDescribe().isAccessible())
             {
            if(key.compareTo('id') != 0){
                queryString += (', ' + key);
            }
            }
        
        }
        queryString += ' FROM Contact';
        if(parsedRows.isEmpty())
            matchingObjects = Database.query(queryString);
        else{   
        queryString += ' WHERE';
        Boolean isFirst = True;
        //Maps symbol codes to string symbols
        Map<String, String> symMap = automatedTriggerClass.symbolMap();
        
        // For each row: 
        // row[0] = field name
        // row[1] = field type
        // row[2] = operand
        // row[3] = field value
        for(String[] rule : parsedRows)
        {
            if(isFirst) isFirst = False;
            else queryString += ' AND';
            //Add field name to query.
            queryString += ' ' + rule.get(0) + ' ';
            //Add operand to query
            string op = symMap.get(rule.get(2));
            queryString += op + ' ';
            //Add the condition
            //For LIKE to operate like 'contains' we must have wildcards on either side of the expression
            if(op == 'LIKE') queryString += '\'%' + String.valueOf(rule.get(3)) + '%\'';
            else queryString += '\'' + String.valueOf(rule.get(3)) + '\'';
        }
        
        system.debug(queryString);
        //Can add an ORDER BY clause if so desired.
        matchingObjects = Database.query(queryString);
        }
        //End LGMK Code 
        //store ids for future lookup
        ids = automatedTriggerClass.getFieldValues(o, 'id');
        //loop through fields and get values from file//
        //get fields from file//
        Map < String, Integer > foundHitIds = new Map < String, Integer > ();
        //(String ruleValue, String fieldValue, String operand, String fieldType)
        for (List < String > row: parsedRows) {

            if (!row.isEmpty()) {
                //((BillingCity, STRING, ct, test), (Industry, PICKLIST, eq, it))
                fieldValues = automatedTriggerClass.getFieldValues(o, row.get(0));
                integer index = 0;
                for (String field: fieldValues) {
                    checkHit = automatedTriggerClass.lookForHit(row.get(3), field, row.get(2), row.get(1));
                    if (checkHit) {
                        String idKey;
                        idKey = String.valueOf(o.get(index).get('id'));
                        Integer value = foundHitIds.get(idKey);
                        value = (value == null) ? 1 : value + 1;
                        foundHitIds.put(idKey, value);
                    }
                    index++;
                }

                //loop through foundhit ids and determine if any met all field criteria
                //will check if each parsed row was equated with success


            }
        }

        return foundHitIds;

    }

    public static Map < String, Integer > getRecipientLeadIDs(String ruleText) {

        Integer recordCount = 0;
        boolean ruleApplies = false;
        boolean checkHit;

        //load up sObjects or aka..records//
        sObject[] o = [SELECT Id, PostalCode, Phone, Jigsaw, Street, LeadSource, ConvertedOpportunityId,
            IsUnreadByOwner, CreatedById, LastActivityDate,
            City, IsConverted, Description, IsDeleted, Longitude, Industry,
            SystemModstamp, Fax, Status, HasOptedOutOfEmail, ConvertedDate,
            AnnualRevenue, Primary__c, CreatedDate, OwnerId, HasOptedOutOfFax,
            JigsawContactId, LastViewedDate, Country, Email, NumberOfEmployees,
            DoNotCall, Company, Latitude, ProductInterest__c, LastModifiedById,
            State, LastName, LastModifiedDate, ConvertedAccountId, MobilePhone,
            Title, LastReferencedDate, EmailBouncedDate, Name, NumberofLocations__c,
            EmailBouncedReason, Website, MasterRecordId, SICCode__c, FirstName,
            CurrentGenerators__c, ConvertedContactId, Rating, LastTransferDate, Salutation FROM Lead
        ];


        //Get fields and Values from automated rules records//
        // Create a list of account records from a SOQL query

        List < List < String >> parsedRows = new List < List < String >> ();
        List < String > fieldValues = new List < String > ();
        List < String > ids = new List < String > ();


        Set < Set < String >> idsWithMatches = new Set < Set < String >> ();
        Set < String > idMatches = new Set < String > ();

        //unparse Rules Row
        //((BillingCity, STRING, ct, test), (Industry, PICKLIST, eq, it))

        parsedRows = automatedTriggerClass.unparseRules(ruleText);
          //Start LGMK Code
        sObject[] matchingObjects;
        string queryString = 'SELECT Id';
      //  Map<String, Schema.SObjectField> fieldMap = Schema.SObjectType.Lead.fields.getMap();
      
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
         Schema.SObjectType leadSchema= schemaMap.get('Lead');
          Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
        //Populate the query with all of the object fields.
        for(String key : fieldMap.keySet())
        {
             if (fieldMap.get(key).getDescribe().isAccessible())
             {
            if(key.compareTo('id') != 0){
                queryString += (', ' + key);
            }
            }
        
        }
        queryString += ' FROM Lead';
        if(parsedRows.isEmpty())
            matchingObjects = Database.query(queryString);
        else{   
        queryString += ' WHERE';
        Boolean isFirst = True;
        //Maps symbol codes to string symbols
        Map<String, String> symMap = automatedTriggerClass.symbolMap();
        
        // For each row: 
        // row[0] = field name
        // row[1] = field type
        // row[2] = operand
        // row[3] = field value
        for(String[] rule : parsedRows)
        {
            if(isFirst) isFirst = False;
            else queryString += ' AND';
            //Add field name to query.
            queryString += ' ' + rule.get(0) + ' ';
            //Add operand to query
            string op = symMap.get(rule.get(2));
            queryString += op + ' ';
            //Add the condition
            //For LIKE to operate like 'contains' we must have wildcards on either side of the expression
            if(op == 'LIKE') queryString += '\'%' + String.valueOf(rule.get(3)) + '%\'';
            else queryString += '\'' + String.valueOf(rule.get(3)) + '\'';
        }
        //Can add an ORDER BY clause if so desired.
        matchingObjects = Database.query(queryString);
        }
        //End LGMK Code 
        //store ids for future lookup
        ids = automatedTriggerClass.getFieldValues(o, 'id');
        //loop through fields and get values from file//
        //get fields from file//

        Map < String, Integer > foundHitIds = new Map < String, Integer > ();

        for (List < String > row: parsedRows) {

            if (!row.isEmpty()) {
                //((BillingCity, STRING, ct, test), (Industry, PICKLIST, eq, it))
                fieldValues = automatedTriggerClass.getFieldValues(o, row.get(0));
                integer index = 0;
                for (String field: fieldValues) {

                    checkHit = automatedTriggerClass.lookForHit(row.get(3), field, row.get(2), row.get(1));
                    if (checkHit) {
                        String idKey;
                        idKey = String.valueOf(o.get(index).get('id'));
                        Integer value = foundHitIds.get(idKey);
                        value = (value == null) ? 1 : value + 1;
                        foundHitIds.put(idKey, value);
                    }
                    index++;
                }


            }
        }

        return foundHitIds;
    }
}