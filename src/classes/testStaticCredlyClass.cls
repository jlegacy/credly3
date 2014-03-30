@isTest(seeAllData=true)
public with sharing class testStaticCredlyClass {
    
    static testmethod badge__c[] generateBadges()
    {
        badge__c[] badgeList = new badge__c[]{};
        
        badgeList.add(new badge__c(Name = 'test', title__c = 'test0', is_giveable__c = 'false',
                                  short_description__c = 'blah', expires_in__c = 4, expire_number__c = 1,
                                  description__c = 'blahblah'));
        badgeList.add(new badge__c(Name = 'test2', title__c = 'test02', is_giveable__c = 'false',
                                  short_description__c = 'blah2', expires_in__c = 12, expire_number__c = 11,
                                  description__c = 'blahblah22'));
        return badgeList;
    }
	static testmethod void testSortBadges()
	{  
		badge__c[] arrayOfBadges = generateBadges();
        			/*arrayOfBadges = [select criteria__c, description__c, expires_in__c, 
                             is_giveable__c, short_description__c, title__c, image__c, 
                             document_ID__c, credlyBadgeId__c, createdById, createdDate 
                             from badge__c where title__c like 'test'];*/
        
                arrayOfBadges = staticCredlyClass.sortSpecialBadges(arrayOfBadges, 'Description', 'ASC');
                arrayOfBadges = staticCredlyClass.sortSpecialBadges(arrayOfBadges, 'Description', 'DESC');
		     
        
        member_badge__c[] arrayOfMemberBadges = [select CreatedById, LastModifiedById, Name,
                                                       OwnerId, account_lookup_m__c, account_type_m__c,
                                                       badge_lookup_m__c, categories_m__c, contact_lookup_m__c,
                                                      description_m__c, evidence_id_m__c, evidence_m__c, evidence_url_m__c,
                                                      title_m__c, testimonial_m__c, short_description_m__c, name_m__c,
                                                      lookup_id_m__c, lead_lookup_m__c, issue_date_m__c, is_visible_m__c,
                                                      expires_in_m__c, expire_date_m__c, evidence_name_m__c, lead_lookup_m__r.email,
                                                 	   contact_lookup_m__r.email, account_lookup_m__r.name, contact_lookup_m__r.name,
                                                 lead_lookup_m__r.name
                                                      from member_badge__c limit 4];
                
                 arrayOfMemberBadges = staticCredlyClass.sortSpecialMemberBadges(arrayOfMemberBadges, 'Evidence', 'ASC');
                arrayOfMemberBadges = staticCredlyClass.sortSpecialMemberBadges(arrayOfMemberBadges, 'Evidence', 'DESC');
                
                arrayOfMemberBadges = staticCredlyClass.sortSpecialMemberBadges(arrayOfMemberBadges, 'Email', 'ASC');
                arrayOfMemberBadges = staticCredlyClass.sortSpecialMemberBadges(arrayOfMemberBadges, 'Email', 'DESC');
                
                 arrayOfMemberBadges = staticCredlyClass.sortSpecialMemberBadges(arrayOfMemberBadges, 'Testimonial', 'ASC');
                arrayOfMemberBadges = staticCredlyClass.sortSpecialMemberBadges(arrayOfMemberBadges, 'Testimonial', 'DESC');
                
                  arrayOfMemberBadges = staticCredlyClass.sortSpecialMemberBadges(arrayOfMemberBadges, 'Recipient', 'ASC');
                arrayOfMemberBadges = staticCredlyClass.sortSpecialMemberBadges(arrayOfMemberBadges, 'Recipient', 'DESC');
                
                
             
	}
	
	static testmethod void testRecipientCounts()
	{
		Integer recordCount;
		//recordCount = staticCredlyClass.getRecipientCount('Account', '((BillingCity, STRING, ct, test), (Industry, PICKLIST, eq, it))');
		recordCount = staticCredlyClass.getRecipientCount('Account', 'BillingCity:STRING|ct|test~Industry:PICKLIST|eq|it');
        //system.assertEquals(null,recordCount);
    	//recordCount = staticCredlyClass.getRecipientCount('Contact', 'Languages, STRING, ct, alien');
        recordCount = staticCredlyClass.getRecipientCount('Contact', 'Languages__c:STRING|ct|alien');
    	//system.assertEquals(null,recordCount);
    	recordCount = staticCredlyClass.getRecipientCount('Lead', 'Street:STRING|ct|test');
    	//system.assertEquals(null,recordCount);
	}
	
	static testmethod void testStrings()
	{
		   /* test string utils */
		system.assertEquals('true',staticCredlyClass.ToString(true));
		system.assertEquals('false',staticCredlyClass.ToString(false));
		system.assertEquals('4/17/1960',staticCredlyClass.ToString(date.newInstance(1960, 4, 17)));
		system.assertEquals('Apr, 26 04 11:24:40',staticCredlyClass.ToString(datetime.newInstance(2004, 4, 26, 23, 24, 40), 'MMM, dd yy hh:mm:ss'));
		system.assertEquals('Apr, 17 1960',staticCredlyClass.ToString(date.newInstance(1960, 4, 17), 'MMM, dd yyyy'));
		system.assertEquals('4/26/2004 11:24 PM',staticCredlyClass.ToString(datetime.newInstance(2004, 4, 26, 23, 24, 40)));
		system.assertEquals('12.457',staticCredlyClass.ToString(decimal.valueOf('12.4567')));
		system.assertEquals('0',staticCredlyClass.ToString(decimal.valueOf('.000000000000000000000012'), true));
		system.assertEquals('12.4567',staticCredlyClass.ToString(decimal.valueOf('12.4567'), false));
		system.assertEquals('3.142',staticCredlyClass.ToString(double.valueOf('3.14159')));
		system.assertEquals('123,456',staticCredlyClass.ToString(123456));
		system.assertEquals('1,234,567,890',staticCredlyClass.ToString(long.valueOf('1234567890')));
		system.assertEquals('18:30:02.020Z',staticCredlyClass.ToString(time.newInstance(18, 30, 2, 20)));
		system.assertEquals('06-30-02-302',staticCredlyClass.ToString(time.newInstance(18, 30, 2, 20), 'hh-mm-ss-ms'));
		system.assertEquals('$123,456.17',staticCredlyClass.CurrencyToString(decimal.valueOf('123456.17'), '$'));
		system.assertEquals('1,023 Bytes',staticCredlyClass.FileSizeToString(long.valueOf('1023')));
		system.assertEquals('1,015.62 KB',staticCredlyClass.FileSizeToString(long.valueOf('1040000')));
		system.assertEquals('1,020.43 MB',staticCredlyClass.FileSizeToString(long.valueOf('1070000000')));
		system.assertEquals('1,015.14 GB',staticCredlyClass.FileSizeToString(long.valueOf('1090000000000')));
	}
	
	static testmethod void testDates()
	{
			staticCredlyClass.convCRDateTime('Thu, 14 Jan 2013 18:49:39 -0500');
	staticCredlyClass.convCRDateTime('Thu, 14 Feb 2013 18:49:39 -0500');
	staticCredlyClass.convCRDateTime('Thu, 14 Mar 2013 18:49:39 -0500');
	staticCredlyClass.convCRDateTime('Thu, 14 Apr 2013 18:49:39 -0500');
	staticCredlyClass.convCRDateTime('Thu, 14 May 2013 18:49:39 -0500');
	staticCredlyClass.convCRDateTime('Thu, 14 Jun 2013 18:49:39 -0500');
	staticCredlyClass.convCRDateTime('Thu, 14 Jul 2013 18:49:39 -0500');
	staticCredlyClass.convCRDateTime('Thu, 14 Aug 2013 18:49:39 -0500');
	staticCredlyClass.convCRDateTime('Thu, 14 Sep 2013 18:49:39 -0500');
	staticCredlyClass.convCRDateTime('Thu, 14 Oct 2013 18:49:39 -0500');
	staticCredlyClass.convCRDateTime('Thu, 14 Nov 2013 18:49:39 -0500');
	staticCredlyClass.convCRDateTime('Thu, 14 Dec 2013 18:49:39 -0500');
	}
	
	static testmethod void getMyMemberBadgesFromCredly()
	{
		staticCredlyClass.getMyMemberBadgesFromCredly();
	}	
	
	static testmethod void getMyBadgesFromCredly()
	{
		 staticCredlyClass.getMyBadgesFromCredly();
	}
	
	static testmethod void synchBadgesFromCredly()
	{
		 List < CredlyJSON2ApexMyBadges.Data > myCredlyBadges; 
		 set < String > myCredlyBadgeIDs ;
		 set < String > mySalesForceCredlyBadgeIDs;
		  
		 
		 myCredlyBadges = staticCredlyClass.getMyBadgesFromCredly();
        myCredlyBadgeIDs = staticCredlyClass.getCredlyBadgeIdsFromData(myCredlyBadges);
        mySalesForceCredlyBadgeIDs = staticCredlyClass.getCredlyBadgeIDsFromSalesforce();
        staticCredlyClass.synchBadgesFromCredly(myCredlyBadges, mySalesForceCredlyBadgeIDs);
	}
	
		static testmethod void synchMemberBadgesFromCredly()
	{
		List < CredlyJSON2ApexMyMemberBadges.Data > myCredlyMemberBadges;
		set < String > mySalesForceCredlyMemberBadgeIDs;
		set < Integer > myCredlyMemberBadgeIDs;
		
		  myCredlyMemberBadges = staticCredlyClass.getMyMemberBadgesFromCredly();
        mySalesForceCredlyMemberBadgeIDs = staticCredlyClass.getCredlyMemberIDsFromSalesforce();
        staticCredlyClass.synchMemberBadgesFromCredly(myCredlyMemberBadges, mySalesForceCredlyMemberBadgeIDs);
        myCredlyMemberBadgeIDs = staticCredlyClass.getCredlyMemberBadgeIdsFromData(myCredlyMemberBadges);
		
		
	}
	
	static testmethod void singleBadgeDataFromCredly()
	{
		
        staticCredlyClass.getSingleBadgeDataFromCredly('12345');
		
		
	}
		static testmethod void getSingleCategorID()
	{
		
        staticCredlyClass.getSingleCategoryID('test');
		
		
	}
	
	static testmethod void testRecipients()
	{
		staticCredlyClass.getRecipientAccountIDs('Name:Name|ct|a');
		staticCredlyClass.getRecipientLeadIDs('Name:Name|ct|a');
		staticCredlyClass.getRecipientContactIDs('Name:Name|ct|a');
	}
	
	static testmethod void test() {
		

         staticCredlyClass.getRuleIDsFromSalesforce();
         staticCredlyClass.getBadgeID('123');
         staticCredlyClass.getBadgeIDMap();
         
    
         staticCredlyClass.getContactID('legacy@starfishenterprises.net');
          staticCredlyClass.getLeadID('legacy@starfishenterprises.net');
           staticCredlyClass.getBadgeDocumentId('123');
           
            staticCredlyClass.storeCredlyId(1,'003i000000JaDM9AAN','contact');
            staticCredlyClass.storeCredlyId(1,'00Qi0000007QIh4EAG','lead');
            staticCredlyClass.storeCredlyId(1, '001i000000NI5txAAD','account');
            
            staticCredlyClass.getCredlyIdfromSalesForce('003i000000JaDM9AAN','contact');
            staticCredlyClass.getCredlyIdfromSalesForce('001i000000NI5txAAD','account');
            staticCredlyClass.getCredlyIdfromSalesForce('00Qi0000007QIh4EAG','lead');
                  
	}

}