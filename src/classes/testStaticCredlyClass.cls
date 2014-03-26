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
	
	static testmethod void testCredly2Json()
	{
//		String json = '{\"meta\":{\"status_code\":200,\"status\":\"OK\",\"message\":\"\",\"more_info\":null},\"data\":{\"id\":13246,\"title\":\"assignbyId\",\"short_description\":\"assign by id\",\"image_url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/badges\\/5c51479bc27446c205810bcbf9dee3e4.png\",\"is_giveable\":false,\"created_at\":\"Sun, 02 Feb 2014 22:16:00 _0500\",\"creator_id\":10636,\"is_claimable\":false,\"description\":\"assignbyid\",\"criteria\":\" \",\"expires_in\":3,\"creator\":{\"id\":10636,\"slug\":\"\",\"type\":\"user\",\"display_name\":\"Joseph Legacy\",\"avatar\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/avatars\\/ca02cd78b68d82da8e01272ba271901d.jpeg\",\"account_type\":\"Free\",\"is_pro\":false,\"is_email_verified\":true,\"is_account_verified\":false,\"member_badge_count\":0,\"issued_badge_count\":0,\"trusted_by_count\":0,\"lists_count\":0,\"first_name\":\"Joseph\",\"last_name\":\"Legacy\",\"email\":\"jlegacy@suddenlink.net\",\"bio\":\"\",\"location\":\"\",\"website\":\"\",\"last_activity\":false,\"created_at\":\"Wed, 27 Nov 2013 23:32:54 _0500\",\"updated_at\":\"Thu, 06 Feb 2014 03:03:08 _0500\"},\"categories\":[],\"require_claim_code\":true,\"require_claim_evidence\":false,\"require_claim_evidence_description\":\"\",\"approve_claim_automatically\":false,\"components\":{\"icon\":{\"id\":3771,\"type\":\"icon\",\"filename\":\"pencil_347\",\"vector_ext\":\"svg\",\"raster_ext\":\"png\",\"vector_url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/assets\\/icon\\/pencil_347.svg\",\"raster_url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/assets\\/icon\\/pencil_347.png\",\"meta\":{\"attribute\":\"The Noun Project\",\"license\":\"Creative Commons _ Attribution (CC BY 3.0)\",\"noun\":\"Pencil\",\"npid\":\"347\"}},\"meta\":{\"banner_color\":\"#c3c3c3\",\"banner_text\":\"Blank Slate\",\"banner_text_color\":\"#ffffff\",\"border\":\"solid\",\"border_color\":\"#000000\",\"custom_icon\":\"1\",\"expires_amount\":\"1\",\"expires_units\":\"never\",\"icon_color\":\"#000000\",\"shape\":\"circle_badge\",\"shape_color\":\"#ffffff\"}},\"image_data\":{\"file_name\":\"5c51479bc27446c205810bcbf9dee3e4.png\",\"time_created\":1391397359,\"file_hash\":{\"md5\":\"5c51479bc27446c205810bcbf9dee3e4\"},\"mime_type\":\"image\\/png\",\"size\":{\"bytes\":28233,\"kilobytes\":27.6,\"megabytes\":0},\"url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/badges\\/5c51479bc27446c205810bcbf9dee3e4.png\",\"resized_images\":{\"_1\":{\"url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/badges\\/5c51479bc27446c205810bcbf9dee3e4_1.png\",\"max_width\":36,\"max_height\":36},\"_3\":{\"url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/badges\\/5c51479bc27446c205810bcbf9dee3e4_3.png\",\"max_width\":55,\"max_height\":55},\"_5\":{\"url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/badges\\/5c51479bc27446c205810bcbf9dee3e4_5.png\",\"max_width\":72,\"max_height\":72},\"_7\":{\"url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/badges\\/5c51479bc27446c205810bcbf9dee3e4_7.png\",\"max_width\":90,\"max_height\":90},\"_9\":{\"url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/badges\\/5c51479bc27446c205810bcbf9dee3e4_9.png\",\"max_width\":100,\"max_height\":100},\"_11\":{\"url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/badges\\/5c51479bc27446c205810bcbf9dee3e4_11.png\",\"max_width\":120,\"max_height\":120},\"_13\":{\"url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/badges\\/5c51479bc27446c205810bcbf9dee3e4_13.png\",\"max_width\":180,\"max_height\":180},\"_15\":{\"url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/badges\\/5c51479bc27446c205810bcbf9dee3e4_15.png\",\"max_width\":280,\"max_height\":280},\"_17\":{\"url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/badges\\/5c51479bc27446c205810bcbf9dee3e4_17.png\",\"max_width\":600,\"max_height\":600}}}}}';
//		CredlyJSON2ApexCredlySingleBadgeData obj = parse(json);
//		System.assert(obj != null);
	}
	
	static testmethod void test() {
		

         staticCredlyClass.getRuleIDsFromSalesforce();
         staticCredlyClass.getBadgeID('123');
         staticCredlyClass.getBadgeIDMap();
         
    
         staticCredlyClass.getContactID('legacy@starfishenterprises.net');
          staticCredlyClass.getLeadID('legacy@starfishenterprises.net');
           staticCredlyClass.getBadgeDocumentId('123');
           
            staticCredlyClass.storeCredlyId(1,'1','contact');
            staticCredlyClass.storeCredlyId(1,'1','lead');
            staticCredlyClass.storeCredlyId(1,'1','account');
            
            staticCredlyClass.getCredlyIdfromSalesForce('123','contact');
            staticCredlyClass.getCredlyIdfromSalesForce('123','account');
            staticCredlyClass.getCredlyIdfromSalesForce('123','lead');
                  
	}

}