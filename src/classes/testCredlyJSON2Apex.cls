@isTest(seeAllData=true)
public with sharing class testCredlyJSON2Apex {
	 
	static testMethod void testCredlyJSON2ApexBadge() 
	{
	     CredlyJSON2ApexBadge controller = new CredlyJSON2ApexBadge(); 
	     CredlyJSON2ApexBadge.Meta testMeta = new CredlyJSON2ApexBadge.Meta();
	     testMeta.message = 'test';
	     testMeta.status = 'test';
	     testMeta.status_code = 1; 
	     CredlyJSON2ApexBadge.parse('{"meta":{"status_code":200,"status":"OK","message":"","more_info":null},"data":1412}');
	     
	}
	
	static testMethod void testCredlyJSON2ApexCategories() 
	{
	     	String json = '{'+
		'    \"meta\": {'+
		'        \"status_code\": 200,'+
		'        \"status\": \"OK\",'+
		'        \"message\": \"\",'+
		'        \"more_info\": null'+
		'    },'+
		'    \"data\": ['+
		'        {'+
		'            \"total\": 3,'+
		'            \"id\": 3013,'+
		'            \"type\": \"badge\",'+
		'            \"name\": \"acceptance tests\",'+
		'            \"created_at\": \"Sat, 17 Nov 2012 18:43:40 -0500\",'+
		'            \"resources\": {'+
		'                \"url\": \"https://apistaging.credly.com/v0.2/badges/categories/3013\"'+
		'            }'+
		'        },'+
		'        {'+
		'            \"total\": 0,'+
		'            \"id\": 3599,'+
		'            \"type\": \"badge\",'+
		'            \"name\": \"achievement tests (sports medicine)\",'+
		'            \"created_at\": \"Sat, 17 Nov 2012 18:44:01 -0500\",'+
		'            \"resources\": {'+
		'                \"url\": \"https://apistaging.credly.com/v0.2/badges/categories/3599\"'+
		'            }'+
		'        },'+
		'        {'+
		'            \"total\": 0,'+
		'            \"id\": 3736,'+
		'            \"type\": \"badge\",'+
		'            \"name\": \"allergy tests\",'+
		'            \"created_at\": \"Sat, 17 Nov 2012 18:44:06 -0500\",'+
		'            \"resources\": {'+
		'                \"url\": \"https://apistaging.credly.com/v0.2/badges/categories/3736\"'+
		'            }'+
		'        },'+
		'        {'+
		'            \"total\": 0,'+
		'            \"id\": 4210,'+
		'            \"type\": \"badge\",'+
		'            \"name\": \"Bible knowledge (Protestant)\",'+
		'            \"created_at\": \"Sat, 17 Nov 2012 18:44:23 -0500\",'+
		'            \"resources\": {'+
		'                \"url\": \"https://apistaging.credly.com/v0.2/badges/categories/4210\"'+
		'            }'+
		'        },'+
		'        {'+
		'            \"total\": 0,'+
		'            \"id\": 4211,'+
		'            \"type\": \"badge\",'+
		'            \"name\": \"Bible work (Protestant)\",'+
		'            \"created_at\": \"Sat, 17 Nov 2012 18:44:23 -0500\",'+
		'            \"resources\": {'+
		'                \"url\": \"https://apistaging.credly.com/v0.2/badges/categories/4211\"'+
		'            }'+
		'        },'+
		'        {'+
		'            \"total\": 0,'+
		'            \"id\": 6471,'+
		'            \"type\": \"badge\",'+
		'            \"name\": \"chemical materials testing\",'+
		'            \"created_at\": \"Sat, 17 Nov 2012 18:45:50 -0500\",'+
		'            \"resources\": {'+
		'                \"url\": \"https://apistaging.credly.com/v0.2/badges/categories/6471\"'+
		'            }'+
		'        },'+
		'        {'+
		'            \"total\": 0,'+
		'            \"id\": 6472,'+
		'            \"type\": \"badge\",'+
		'            \"name\": \"chemical-technical testing of textiles\",'+
		'            \"created_at\": \"Sat, 17 Nov 2012 18:45:50 -0500\",'+
		'            \"resources\": {'+
		'                \"url\": \"https://apistaging.credly.com/v0.2/badges/categories/6472\"'+
		'            }'+
		'        },'+
		'        {'+
		'            \"total\": 0,'+
		'            \"id\": 5058,'+
		'            \"type\": \"badge\",'+
		'            \"name\": \"cleaning intestines (meat processing)\",'+
		'            \"created_at\": \"Sat, 17 Nov 2012 18:44:54 -0500\",'+
		'            \"resources\": {'+
		'                \"url\": \"https://apistaging.credly.com/v0.2/badges/categories/5058\"'+
		'            }'+
		'        },'+
		'        {'+
		'            \"total\": 0,'+
		'            \"id\": 2422,'+
		'            \"type\": \"badge\",'+
		'            \"name\": \"concept and product tests\",'+
		'            \"created_at\": \"Sat, 17 Nov 2012 18:43:19 -0500\",'+
		'            \"resources\": {'+
		'                \"url\": \"https://apistaging.credly.com/v0.2/badges/categories/2422\"'+
		'            }'+
		'        },'+
		'        {'+
		'            \"total\": 0,'+
		'            \"id\": 6631,'+
		'            \"type\": \"badge\",'+
		'            \"name\": \"construction materials testing\",'+
		'            \"created_at\": \"Sat, 17 Nov 2012 18:45:56 -0500\",'+
		'            \"resources\": {'+
		'                \"url\": \"https://apistaging.credly.com/v0.2/badges/categories/6631\"'+
		'            }'+
		'        }'+
		'    ],'+
		'    \"paging\": {'+
		'        \"page\": 1,'+
		'        \"per_page\": 10,'+
		'        \"order_direction\": \"ASC\",'+
		'        \"resources\": {'+
		'            \"next\": \"https://apistaging.credly.com/v0.2/badges/categories?query=test&page=2&per_page=10&order_direction=ASC\"'+
		'        }'+
		'    }'+
		'}';
		
		CredlyJSON2ApexCategories.parse(json);
	     
	     CredlyJSON2ApexCategories controller = new CredlyJSON2ApexCategories(); 
	     CredlyJSON2ApexCategories.Meta testMeta = new CredlyJSON2ApexCategories.Meta();
	     testMeta.status = 'test';
	     testMeta.status_code = 1;
	    
	     CredlyJSON2ApexCategories.Paging testPaging = new CredlyJSON2ApexCategories.Paging();
	     testPaging.page=2;
	     testPaging.per_page=2;
	     
	       CredlyJSON2ApexCategories.Resources testResources = new CredlyJSON2ApexCategories.Resources();
	     testResources.url='test';
	     
	     CredlyJSON2ApexCategories.Resources_Z testResourcesZ = new CredlyJSON2ApexCategories.Resources_Z();
	     testResourcesZ.next='test';
	  
	     
	      List<CredlyJSON2ApexCategories.Data> dataList = new List<CredlyJSON2ApexCategories.Data>();
	      
	      CredlyJSON2ApexCategories.Data  insertData = new CredlyJSON2ApexCategories.Data();
	      insertData.name = 'test';
	      insertData.total = 100;
	      dataList.add(insertData);	      
	     
	     
	     
	}
	
	static testMethod void testCredlyJSON2MemberBadge() 
	{
	     CredlyJSON2ApexMemberBadge controller = new CredlyJSON2ApexMemberBadge(); 
	     CredlyJSON2ApexMemberBadge.Meta testMeta = new CredlyJSON2ApexMemberBadge.Meta();
	     testMeta.message = 'test';
	     testMeta.status = 'test';
	     testMeta.status_code = 1;
	  //   CredlyJSON2ApexMemberBadge.parse('{"meta":{"status_code":200,"status":"OK","message":"","more_info":null},"data":1412}');
	     
	     
	      CredlyJSON2ApexMemberBadge.Data dataObject = new CredlyJSON2ApexMemberBadge.Data();
	      
	   dataObject.hashes.add('testing1');
	   dataObject.hashes.add('testing2');
	      dataObject.ids.add(1);
	       dataObject.ids.add(2);
	       dataObject.hash = 'testing';
	       
	       CredlyJSON2ApexMemberBadge.Data testData = new CredlyJSON2ApexMemberBadge.Data();
			testData = null;
	       
	    
	      
	}
	
	static testMethod void testCredlyJSON2ApexErrors() 
	{
	     CredlyJSON2ApexErrors controller = new CredlyJSON2ApexErrors(); 
	     CredlyJSON2ApexErrors.Meta testMeta = new CredlyJSON2ApexErrors.Meta();
	     testMeta.message = 'test';
	     testMeta.status = 'test';
	     testMeta.status_code = 1;
	     CredlyJSON2ApexErrors.parse('{"meta":{"status_code":200,"status":"OK","message":"","more_info":null},"data":1412}');
	     
	}
	
	static testMethod void testCredlyJSON2ApexCredlySingleBadgeData()
	{
		
		system.debug('starting test');
		String json = '{\"meta\":{\"status_code\":200,\"status\":\"OK\",\"message\":\"\",\"more_info\":null},\"data\":{\"id\":13246,\"title\":\"assignbyId\",\"short_description\":\"assign by id\",\"image_url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/badges\\/5c51479bc27446c205810bcbf9dee3e4.png\",\"is_giveable\":false,\"created_at\":\"Sun, 02 Feb 2014 22:16:00 -0500\",\"creator_id\":10636,\"is_claimable\":false,\"description\":\"assignbyid\",\"criteria\":\" \",\"expires_in\":3,\"creator\":{\"id\":10636,\"slug\":\"\",\"type\":\"user\",\"display_name\":\"Joseph Legacy\",\"avatar\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/avatars\\/ca02cd78b68d82da8e01272ba271901d.jpeg\",\"account_type\":\"Free\",\"is_pro\":false,\"is_email_verified\":true,\"is_account_verified\":false,\"member_badge_count\":0,\"issued_badge_count\":0,\"trusted_by_count\":0,\"lists_count\":0,\"first_name\":\"Joseph\",\"last_name\":\"Legacy\",\"email\":\"jlegacy@suddenlink.net\",\"bio\":\"\",\"location\":\"\",\"website\":\"\",\"last_activity\":false,\"created_at\":\"Wed, 27 Nov 2013 23:32:54 -0500\",\"updated_at\":\"Thu, 06 Feb 2014 03:03:08 -0500\"},\"categories\":[],\"require_claim_code\":true,\"require_claim_evidence\":false,\"require_claim_evidence_description\":\"\",\"approve_claim_automatically\":false,\"components\":{\"icon\":{\"id\":3771,\"type\":\"icon\",\"filename\":\"pencil-347\",\"vector_ext\":\"svg\",\"raster_ext\":\"png\",\"vector_url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/assets\\/icon\\/pencil-347.svg\",\"raster_url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/assets\\/icon\\/pencil-347.png\",\"meta\":{\"attribute\":\"The Noun Project\",\"license\":\"Creative Commons - Attribution (CC BY 3.0)\",\"noun\":\"Pencil\",\"npid\":\"347\"}},\"meta\":{\"banner-color\":\"#c3c3c3\",\"banner-text\":\"Blank Slate\",\"banner-text-color\":\"#ffffff\",\"border\":\"solid\",\"border-color\":\"#000000\",\"custom_icon\":\"1\",\"expires_amount\":\"1\",\"expires_units\":\"never\",\"icon-color\":\"#000000\",\"shape\":\"circle-badge\",\"shape-color\":\"#ffffff\"}},\"image_data\":{\"file_name\":\"5c51479bc27446c205810bcbf9dee3e4.png\",\"time_created\":1391397359,\"file_hash\":{\"md5\":\"5c51479bc27446c205810bcbf9dee3e4\"},\"mime_type\":\"image\\/png\",\"size\":{\"bytes\":28233,\"kilobytes\":27.6,\"megabytes\":0},\"url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/badges\\/5c51479bc27446c205810bcbf9dee3e4.png\",\"resized_images\":{\"_1\":{\"url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/badges\\/5c51479bc27446c205810bcbf9dee3e4_1.png\",\"max_width\":36,\"max_height\":36},\"_3\":{\"url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/badges\\/5c51479bc27446c205810bcbf9dee3e4_3.png\",\"max_width\":55,\"max_height\":55},\"_5\":{\"url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/badges\\/5c51479bc27446c205810bcbf9dee3e4_5.png\",\"max_width\":72,\"max_height\":72},\"_7\":{\"url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/badges\\/5c51479bc27446c205810bcbf9dee3e4_7.png\",\"max_width\":90,\"max_height\":90},\"_9\":{\"url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/badges\\/5c51479bc27446c205810bcbf9dee3e4_9.png\",\"max_width\":100,\"max_height\":100},\"_11\":{\"url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/badges\\/5c51479bc27446c205810bcbf9dee3e4_11.png\",\"max_width\":120,\"max_height\":120},\"_13\":{\"url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/badges\\/5c51479bc27446c205810bcbf9dee3e4_13.png\",\"max_width\":180,\"max_height\":180},\"_15\":{\"url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/badges\\/5c51479bc27446c205810bcbf9dee3e4_15.png\",\"max_width\":280,\"max_height\":280},\"_17\":{\"url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/badges\\/5c51479bc27446c205810bcbf9dee3e4_17.png\",\"max_width\":600,\"max_height\":600}}}}}';	
		
		CredlyJSON2ApexCredlySingleBadgeData obj2 =  CredlyJSON2ApexCredlySingleBadgeData.parse(json);

	
	CredlyJSON2ApexCredlySingleBadgeData.Data testData = new CredlyJSON2ApexCredlySingleBadgeData.Data();
	
	CredlyJSON2ApexCredlySingleBadgeData.Creator testCreator = new CredlyJSON2ApexCredlySingleBadgeData.Creator(); 
	testCreator = obj2.Data.Creator; 
	
	List<CredlyJSON2ApexCredlySingleBadgeData.Categories> testCategories = new List<CredlyJSON2ApexCredlySingleBadgeData.Categories>(); 
	testCategories = obj2.Data.Categories; 
	
	CredlyJSON2ApexCredlySingleBadgeData.File_hash testFile_hash = new CredlyJSON2ApexCredlySingleBadgeData.File_hash(); 
	testFile_hash = obj2.Data.Image_data.File_hash; 
	
	CredlyJSON2ApexCredlySingleBadgeData.Icon testIcon = new CredlyJSON2ApexCredlySingleBadgeData.Icon(); 
	testIcon = obj2.Data.Components.Icon; 
	
		CredlyJSON2ApexCredlySingleBadgeData.Image_data testImage_data = new CredlyJSON2ApexCredlySingleBadgeData.Image_data(); 
	testImage_data = obj2.Data.Image_data; 
	
		CredlyJSON2ApexCredlySingleBadgeData.Meta testMeta2 = new CredlyJSON2ApexCredlySingleBadgeData.Meta(); 
	testMeta2 = obj2.Meta; 
	
	CredlyJSON2ApexCredlySingleBadgeData.Meta_Y testMeta_Y = new CredlyJSON2ApexCredlySingleBadgeData.Meta_Y(); 
	testMeta_Y = obj2.Data.Components.meta; 
	
	CredlyJSON2ApexCredlySingleBadgeData.Meta_Z testMeta_Z = new CredlyJSON2ApexCredlySingleBadgeData.Meta_Z(); 
	testMeta_Z = obj2.Data.Components.Icon.meta; 
	
	CredlyJSON2ApexCredlySingleBadgeData.Components testComponents = new CredlyJSON2ApexCredlySingleBadgeData.Components(); 
	testComponents = obj2.Data.Components; 
	
	CredlyJSON2ApexCredlySingleBadgeData.Size testSize = new CredlyJSON2ApexCredlySingleBadgeData.Size(); 
	testSize = obj2.Data.Image_data.size; 
	
	
	}	
	
	static testMethod void testCredlyJSON2ApexCredlyCategoryId()
	{
		
		system.debug('starting test');
	//	String json = '{\"meta\":{\"status_code\":200,\"status\":\"OK\",\"message\":\"\",\"more_info\":null},\"data\":{\"id\":13246,\"title\":\"assignbyId\",\"short_description\":\"assign by id\",\"image_url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/badges\\/5c51479bc27446c205810bcbf9dee3e4.png\",\"is_giveable\":false,\"created_at\":\"Sun, 02 Feb 2014 22:16:00 -0500\",\"creator_id\":10636,\"is_claimable\":false,\"description\":\"assignbyid\",\"criteria\":\" \",\"expires_in\":3,\"creator\":{\"id\":10636,\"slug\":\"\",\"type\":\"user\",\"display_name\":\"Joseph Legacy\",\"avatar\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/avatars\\/ca02cd78b68d82da8e01272ba271901d.jpeg\",\"account_type\":\"Free\",\"is_pro\":false,\"is_email_verified\":true,\"is_account_verified\":false,\"member_badge_count\":0,\"issued_badge_count\":0,\"trusted_by_count\":0,\"lists_count\":0,\"first_name\":\"Joseph\",\"last_name\":\"Legacy\",\"email\":\"jlegacy@suddenlink.net\",\"bio\":\"\",\"location\":\"\",\"website\":\"\",\"last_activity\":false,\"created_at\":\"Wed, 27 Nov 2013 23:32:54 -0500\",\"updated_at\":\"Thu, 06 Feb 2014 03:03:08 -0500\"},\"categories\":[],\"require_claim_code\":true,\"require_claim_evidence\":false,\"require_claim_evidence_description\":\"\",\"approve_claim_automatically\":false,\"components\":{\"icon\":{\"id\":3771,\"type\":\"icon\",\"filename\":\"pencil-347\",\"vector_ext\":\"svg\",\"raster_ext\":\"png\",\"vector_url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/assets\\/icon\\/pencil-347.svg\",\"raster_url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/assets\\/icon\\/pencil-347.png\",\"meta\":{\"attribute\":\"The Noun Project\",\"license\":\"Creative Commons - Attribution (CC BY 3.0)\",\"noun\":\"Pencil\",\"npid\":\"347\"}},\"meta\":{\"banner-color\":\"#c3c3c3\",\"banner-text\":\"Blank Slate\",\"banner-text-color\":\"#ffffff\",\"border\":\"solid\",\"border-color\":\"#000000\",\"custom_icon\":\"1\",\"expires_amount\":\"1\",\"expires_units\":\"never\",\"icon-color\":\"#000000\",\"shape\":\"circle-badge\",\"shape-color\":\"#ffffff\"}},\"image_data\":{\"file_name\":\"5c51479bc27446c205810bcbf9dee3e4.png\",\"time_created\":1391397359,\"file_hash\":{\"md5\":\"5c51479bc27446c205810bcbf9dee3e4\"},\"mime_type\":\"image\\/png\",\"size\":{\"bytes\":28233,\"kilobytes\":27.6,\"megabytes\":0},\"url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/badges\\/5c51479bc27446c205810bcbf9dee3e4.png\",\"resized_images\":{\"_1\":{\"url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/badges\\/5c51479bc27446c205810bcbf9dee3e4_1.png\",\"max_width\":36,\"max_height\":36},\"_3\":{\"url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/badges\\/5c51479bc27446c205810bcbf9dee3e4_3.png\",\"max_width\":55,\"max_height\":55},\"_5\":{\"url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/badges\\/5c51479bc27446c205810bcbf9dee3e4_5.png\",\"max_width\":72,\"max_height\":72},\"_7\":{\"url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/badges\\/5c51479bc27446c205810bcbf9dee3e4_7.png\",\"max_width\":90,\"max_height\":90},\"_9\":{\"url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/badges\\/5c51479bc27446c205810bcbf9dee3e4_9.png\",\"max_width\":100,\"max_height\":100},\"_11\":{\"url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/badges\\/5c51479bc27446c205810bcbf9dee3e4_11.png\",\"max_width\":120,\"max_height\":120},\"_13\":{\"url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/badges\\/5c51479bc27446c205810bcbf9dee3e4_13.png\",\"max_width\":180,\"max_height\":180},\"_15\":{\"url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/badges\\/5c51479bc27446c205810bcbf9dee3e4_15.png\",\"max_width\":280,\"max_height\":280},\"_17\":{\"url\":\"https:\\/\\/credlyapp.s3.amazonaws.com\\/badges\\/5c51479bc27446c205810bcbf9dee3e4_17.png\",\"max_width\":600,\"max_height\":600}}}}}';	
				String json = '{'+
		'    \"meta\": {'+
		'        \"status_code\": 200,'+
		'        \"status\": \"OK\",'+
		'        \"message\": \"\",'+
		'        \"more_info\": null'+
		'    },'+
		'    \"data\": ['+
		'        {'+
		'            \"total\": 3,'+
		'            \"id\": 248,'+
		'            \"type\": \"badge\",'+
		'            \"name\": \"ABAP programming\",'+
		'            \"created_at\": \"Sat, 17 Nov 2012 18:42:00 -0500\",'+
		'            \"resources\": {'+
		'                \"url\": \"https://api.credly.com/v1.1/badges/categories/248\"'+
		'            }'+
		'        }'+
		'    ],'+
		'    \"paging\": {'+
		'        \"page\": 1,'+
		'        \"per_page\": 1,'+
		'        \"order_direction\": \"ASC\",'+
		'        \"multi_result_count\": null'+
		'    }'+
		'}';
		CredlyJSON2ApexCredlyCategoryId obj2 =  CredlyJSON2ApexCredlyCategoryId.parse(json);
		
			CredlyJSON2ApexCredlyCategoryId.Data testData = new CredlyJSON2ApexCredlyCategoryId.Data();
			
			CredlyJSON2ApexCredlyCategoryId.Meta testMeta = new CredlyJSON2ApexCredlyCategoryId.Meta();
			testMeta = obj2.meta;
			
			CredlyJSON2ApexCredlyCategoryId.Paging testPaging = new CredlyJSON2ApexCredlyCategoryId.Paging();
			testPaging = obj2.Paging;
			
				CredlyJSON2ApexCredlyCategoryId.Resources testResources = new  CredlyJSON2ApexCredlyCategoryId.Resources();
			testResources.url = 'test';
	
	}	
	
	static testMethod void CredlyJSON2ApexMemberInfo()
	{
		
		String json = '{'+
		'    \"meta\": {'+
		'        \"status_code\": 200,'+
		'        \"status\": \"OK\",'+
		'        \"message\": \"\",'+
		'        \"more_info\": null'+
		'    },'+
		'    \"data\": ['+
		'        {'+
		'            \"id\": 10636,'+
		'            \"slug\": \"\",'+
		'            \"type\": \"user\",'+
		'            \"display_name\": \"Joseph Legacy\",'+
		'            \"avatar\": \"https://credlyapp.s3.amazonaws.com/avatars/a67b912e3df563dbcac76c63c365c642.jpeg\",'+
		'            \"account_type\": \"Free\",'+
		'            \"is_pro\": false,'+
		'            \"is_email_verified\": true,'+
		'            \"is_account_verified\": false,'+
		'            \"member_badge_count\": 1,'+
		'            \"issued_badge_count\": 0,'+
		'            \"trusted_by_count\": 0,'+
		'            \"lists_count\": 0,'+
		'            \"first_name\": \"Joseph\",'+
		'            \"last_name\": \"Legacy\",'+
		'            \"email\": \"jlegacy@suddenlink.net\",'+
		'            \"bio\": \"\",'+
		'            \"location\": \"\",'+
		'            \"website\": \"\",'+
		'            \"last_activity\": false,'+
		'            \"created_at\": \"Wed, 27 Nov 2013 23:32:54 -0500\",'+
		'            \"updated_at\": \"Wed, 27 Nov 2013 23:32:57 -0500\",'+
		'            \"phone\": \"\",'+
		'            \"openbadge_id\": 0,'+
		'            \"connected_accounts\": ['+
		'                {'+
		'                    \"type\": \"facebook\",'+
		'                    \"account_id\": \"1112216605\"'+
		'                }'+
		'            ],'+
		'            \"emails\": ['+
		'                {'+
		'                    \"id\": 10654,'+
		'                    \"email\": \"jlegacy@suddenlink.net\",'+
		'                    \"is_verified\": true,'+
		'                    \"is_primary\": true'+
		'                }'+
		'            ],'+
		'            \"show_full\": true,'+
		'            \"resources\": {'+
		'                \"url\": \"https://api.credly.com/v1.1/members/10636\"'+
		'            }'+
		'        }'+
		'    ],'+
		'    \"paging\": {'+
		'        \"page\": 1,'+
		'        \"per_page\": 10,'+
		'        \"order_direction\": \"ASC\"'+
		'    }'+
		'}';
		
		CredlyJSON2ApexMemberInfo obj2 =  CredlyJSON2ApexMemberInfo.parse(json);
		
			CredlyJSON2ApexMemberInfo.Data testData = new CredlyJSON2ApexMemberInfo.Data();
			
			CredlyJSON2ApexMemberInfo.Meta testMeta = new CredlyJSON2ApexMemberInfo.Meta();
			testMeta = obj2.meta;
			
			CredlyJSON2ApexMemberInfo.Paging testPaging = new CredlyJSON2ApexMemberInfo.Paging();
			testPaging = obj2.Paging;
			
				CredlyJSON2ApexMemberInfo.Resources testResources = new  CredlyJSON2ApexMemberInfo.Resources();
			testResources.url = 'test';
			
				CredlyJSON2ApexMemberInfo.Emails testEmails = new  CredlyJSON2ApexMemberInfo.Emails();
			testEmails.email = 'test';
			testEmails.id = 0;
			testEmails.is_primary = false;
			testEmails.is_verified = false;
			testResources.url = 'test';
	
	}	
	
		static testMethod void CredlyJSON2ApexMyBadges()
	{
		

		String json = '{'+
		'    \"meta\": {'+
		'        \"status_code\": 200,'+
		'        \"status\": \"OK\",'+
		'        \"message\": \"\",'+
		'        \"more_info\": null'+
		'    },'+
		'    \"data\": ['+
		'        {'+
		'            \"id\": 10106,'+
		'            \"title\": \"Blank Slate\",'+
		'            \"short_description\": \"\",'+
		'            \"image_url\": \"https://credlyapp.s3.amazonaws.com/badges/488fd8e4fe31fccb8d2c8d6d09b73b71.png\",'+
		'            \"is_giveable\": false,'+
		'            \"created_at\": \"Wed, 27 Nov 2013 23:33:03 -0500\",'+
		'            \"creator_id\": 10636,'+
		'            \"resources\": {'+
		'                \"url\": \"https://api.credly.com/v1.1/me/badges/created/10106\"'+
		'            }'+
		'        },'+
		'        {'+
		'            \"id\": 11515,'+
		'            \"title\": \"rockets away\",'+
		'            \"short_description\": \"\",'+
		'            \"image_url\": \"https://credlyapp.s3.amazonaws.com/badges/4e9c11ee1b753a7e28e04f81215cd8c7.jpeg\",'+
		'            \"is_giveable\": false,'+
		'            \"created_at\": \"Sat, 04 Jan 2014 19:31:16 -0500\",'+
		'            \"creator_id\": 10636,'+
		'            \"resources\": {'+
		'                \"url\": \"https://api.credly.com/v1.1/me/badges/created/11515\"'+
		'            }'+
		'        },'+
		'        {'+
		'            \"id\": 11573,'+
		'            \"title\": \"rockets away\",'+
		'            \"short_description\": \"\",'+
		'            \"image_url\": \"https://credlyapp.s3.amazonaws.com/badges/4e9c11ee1b753a7e28e04f81215cd8c7.jpeg\",'+
		'            \"is_giveable\": false,'+
		'            \"created_at\": \"Sun, 05 Jan 2014 19:17:58 -0500\",'+
		'            \"creator_id\": 10636,'+
		'            \"resources\": {'+
		'                \"url\": \"https://api.credly.com/v1.1/me/badges/created/11573\"'+
		'            }'+
		'        }'+
		'    ],'+
		'    \"paging\": {'+
		'        \"page\": 1,'+
		'        \"per_page\": 10,'+
		'        \"order_direction\": \"ASC\",'+
		'        \"total_results\": 3'+
		'    }'+
		'}';
		CredlyJSON2ApexMyBadges obj2 =  CredlyJSON2ApexMyBadges.parse(json);
		
			CredlyJSON2ApexMyBadges.Data testData = new CredlyJSON2ApexMyBadges.Data();
			
			CredlyJSON2ApexMyBadges.Meta testMeta = new CredlyJSON2ApexMyBadges.Meta();
			testMeta = obj2.meta;
			
			CredlyJSON2ApexMyBadges.Paging testPaging = new CredlyJSON2ApexMyBadges.Paging();
			testPaging = obj2.Paging;
			
				CredlyJSON2ApexMyBadges.Resources testResources = new  CredlyJSON2ApexMyBadges.Resources();
			testResources.url = 'test';
			
			
							CredlyJSON2ApexMyBadges.meta testMetaAlone = new  CredlyJSON2ApexMyBadges.meta();
				testMetaAlone = null;

	}	
	

	
/*		static testMethod void CredlyJSON2ApexMyIssuedBadges()
	{
		

		String json = '{'+
		'    \"meta\": {'+
		'        \"status_code\": 200,'+
		'        \"status\": \"OK\",'+
		'        \"message\": \"\",'+
		'        \"more_info\": null'+
		'    },'+
		'    \"data\": ['+
		'        {'+
		'            \"id\": 104944,'+
		'            \"member_id\": 0,'+
		'            \"issuer_id\": 10636,'+
		'            \"badge_id\": 15507,'+
		'            \"title\": \"test\",'+
		'            \"short_description\": \"test\",'+
		'            \"image\": \"https://credlyapp.s3.amazonaws.com/badges/53d4433bda4719fe77303cf801f763f2.png\",'+
		'            \"created_at\": \"Sat, 29 Mar 2014 14:29:43 -0400\",'+
		'            \"expires_at\": \"\",'+
		'            \"is_draft\": false,'+
		'            \"is_accepted\": false,'+
		'            \"is_visible\": true,'+
		'            \"is_deleted\": false,'+
		'            \"description\": \"test\",'+
		'            \"criteria\": \"test\",'+
		'            \"categories\": [],'+
		'            \"issuer_categories\": [],'+
		'            \"member\": null,'+
		'            \"member_orphan\": {'+
		'                \"id\": 76452,'+
		'                \"member_badge_id\": 104944,'+
		'                \"email\": \"legacy@starfishenterprise.net\",'+
		'                \"first_name\": \"Jake\",'+
		'                \"last_name\": \"Llorrac\"'+
		'            },'+
		'            \"issuer\": {'+
		'                \"id\": 10636,'+
		'                \"slug\": \"\",'+
		'                \"type\": \"user\",'+
		'                \"display_name\": \"Joseph Legacy\",'+
		'                \"avatar\": \"https://credlyapp.s3.amazonaws.com/avatars/ca02cd78b68d82da8e01272ba271901d.jpeg\",'+
		'                \"account_type\": \"Free\",'+
		'                \"is_pro\": false,'+
		'                \"is_email_verified\": true,'+
		'                \"is_account_verified\": false,'+
		'                \"member_badge_count\": 0,'+
		'                \"issued_badge_count\": 0,'+
		'                \"trusted_by_count\": 0,'+
		'                \"lists_count\": 0,'+
		'                \"first_name\": \"Joseph\",'+
		'                \"last_name\": \"Legacy\",'+
		'                \"email\": \"jlegacy@suddenlink.net\",'+
		'                \"bio\": \"\",'+
		'                \"location\": \"\",'+
		'                \"website\": \"\",'+
		'                \"last_activity\": false,'+
		'                \"created_at\": \"Wed, 27 Nov 2013 23:32:54 -0500\",'+
		'                \"updated_at\": \"Thu, 06 Feb 2014 03:03:08 -0500\"'+
		'            },'+
		'            \"badge\": {'+
		'                \"id\": 15507,'+
		'                \"title\": \"test\",'+
		'                \"short_description\": \"test\",'+
		'                \"image_url\": \"https://credlyapp.s3.amazonaws.com/badges/53d4433bda4719fe77303cf801f763f2.png\",'+
		'                \"is_giveable\": false,'+
		'                \"created_at\": \"Thu, 20 Mar 2014 22:01:17 -0400\",'+
		'                \"creator_id\": 10636,'+
		'                \"is_claimable\": false,'+
		'                \"description\": \"test\",'+
		'                \"criteria\": \"test\",'+
		'                \"expires_in\": 0,'+
		'                \"creator\": {'+
		'                    \"id\": 10636,'+
		'                    \"slug\": \"\",'+
		'                    \"type\": \"user\",'+
		'                    \"display_name\": \"Joseph Legacy\",'+
		'                    \"avatar\": \"https://credlyapp.s3.amazonaws.com/avatars/ca02cd78b68d82da8e01272ba271901d.jpeg\",'+
		'                    \"account_type\": \"Free\",'+
		'                    \"is_pro\": false,'+
		'                    \"is_email_verified\": true,'+
		'                    \"is_account_verified\": false,'+
		'                    \"member_badge_count\": 0,'+
		'                    \"issued_badge_count\": 0,'+
		'                    \"trusted_by_count\": 0,'+
		'                    \"lists_count\": 0,'+
		'                    \"first_name\": \"Joseph\",'+
		'                    \"last_name\": \"Legacy\",'+
		'                    \"email\": \"jlegacy@suddenlink.net\",'+
		'                    \"bio\": \"\",'+
		'                    \"location\": \"\",'+
		'                    \"website\": \"\",'+
		'                    \"last_activity\": false,'+
		'                    \"created_at\": \"Wed, 27 Nov 2013 23:32:54 -0500\",'+
		'                    \"updated_at\": \"Thu, 06 Feb 2014 03:03:08 -0500\"'+
		'                },'+
		'                \"categories\": ['+
		'                    {'+
		'                        \"id\": 966,'+
		'                        \"name\": \"ability to concentrate\",'+
		'                        \"created_at\": \"Sat, 17 Nov 2012 18:42:26 -0500\"'+
		'                    },'+
		'                    {'+
		'                        \"id\": 795,'+
		'                        \"name\": \"(sodium) vapour lamp\",'+
		'                        \"created_at\": \"Sat, 17 Nov 2012 18:42:20 -0500\"'+
		'                    }'+
		'                ],'+
		'                \"require_claim_code\": true,'+
		'                \"require_claim_evidence\": false,'+
		'                \"require_claim_evidence_description\": \"\",'+
		'                \"approve_claim_automatically\": false,'+
		'                \"components\": {'+
		'                    \"icon\": {'+
		'                        \"id\": 3771,'+
		'                        \"type\": \"icon\",'+
		'                        \"filename\": \"pencil-347\",'+
		'                        \"vector_ext\": \"svg\",'+
		'                        \"raster_ext\": \"png\",'+
		'                        \"vector_url\": \"https://credlyapp.s3.amazonaws.com/assets/icon/pencil-347.svg\",'+
		'                        \"raster_url\": \"https://credlyapp.s3.amazonaws.com/assets/icon/pencil-347.png\",'+
		'                        \"meta\": {'+
		'                            \"attribute\": \"The Noun Project\",'+
		'                            \"license\": \"Creative Commons - Attribution (CC BY 3.0)\",'+
		'                            \"noun\": \"Pencil\",'+
		'                            \"npid\": \"347\"'+
		'                        }'+
		'                    },'+
		'                    \"meta\": {'+
		'                        \"banner-color\": \"#c3c3c3\",'+
		'                        \"banner-text\": \"Blank Slate\",'+
		'                        \"banner-text-color\": \"#ffffff\",'+
		'                        \"border\": \"solid\",'+
		'                        \"border-color\": \"#000000\",'+
		'                        \"custom_icon\": \"1\",'+
		'                        \"expires_amount\": \"1\",'+
		'                        \"expires_units\": \"never\",'+
		'                        \"icon-color\": \"#000000\",'+
		'                        \"shape\": \"circle-badge\",'+
		'                        \"shape-color\": \"#ffffff\"'+
		'                    }'+
		'                }'+
		'            },'+
		'            \"badge_evidence\": [],'+
		'            \"badge_testimonial\": ['+
		'                {'+
		'                    \"id\": 36104,'+
		'                    \"composer_id\": 10636,'+
		'                    \"member_badge_id\": 104944,'+
		'                    \"body\": \" \",'+
		'                    \"created_at\": \"Sat, 29 Mar 2014 14:29:43 -0400\"'+
		'                }'+
		'            ]'+
		'        }'+
		'    ],'+
		'    \"paging\": {'+
		'        \"page\": 1,'+
		'        \"per_page\": 1,'+
		'        \"order_direction\": \"DESC\",'+
		'        \"total_results\": 75,'+
		'        \"multi_result_count\": 2,'+
		'        \"resources\": {'+
		'            \"next\": \"https://api.credly.com/v1.1/me/badges/given?access_token=efaa8a6c587c02edfd4ba1cc88c2fee7a09ce865eaff860a6a6a92a85c0445c4bfb26951a03bee7bed5d17ed684a194da0dced5559aa23453231699a6db85ecd&per_page=1&page=2&order_direction=DESC\"'+
		'        }'+
		'    }'+
		'}';
		
		CredlyJSON2ApexMyIssuedBadges obj2 =  CredlyJSON2ApexMyIssuedBadges.parse(json);
		
			CredlyJSON2ApexMyIssuedBadges.Data testData = new CredlyJSON2ApexMyIssuedBadges.Data();
			
			CredlyJSON2ApexMyIssuedBadges.Meta testMeta = new CredlyJSON2ApexMyIssuedBadges.Meta();
			testMeta = obj2.meta;
			
			CredlyJSON2ApexMyIssuedBadges.Paging testPaging = new CredlyJSON2ApexMyIssuedBadges.Paging();
			testPaging = obj2.Paging;
			
				CredlyJSON2ApexMyIssuedBadges.Resources testResources = new  CredlyJSON2ApexMyIssuedBadges.Resources();
				testResources = obj2.Paging.Resources;
				
				CredlyJSON2ApexMyIssuedBadges.Member_orphan testOrphan = new  CredlyJSON2ApexMyIssuedBadges.Member_orphan();
				testOrphan = obj2.Data[0].Member_orphan;
				
					CredlyJSON2ApexMyIssuedBadges.Meta_Z testMetaZ = new  CredlyJSON2ApexMyIssuedBadges.Meta_Z();
				testMetaZ = obj2.Data[0].badge.components.icon.meta;
				
			//	CredlyJSON2ApexMyIssuedBadges.Badge_testimonial testBadgeTestimonial = new  CredlyJSON2ApexMyIssuedBadges.Badge_testimonial();
			//	testBadgeTestimonial = obj2.Data[0].badge_testimonial;
			
				CredlyJSON2ApexMyIssuedBadges.Issuer testIssuer = new  CredlyJSON2ApexMyIssuedBadges.Issuer();
				testIssuer = obj2.Data[0].Issuer;
				
					CredlyJSON2ApexMyIssuedBadges.Badge testBadge = new  CredlyJSON2ApexMyIssuedBadges.Badge();
				testBadge = obj2.Data[0].Badge;
				
					CredlyJSON2ApexMyIssuedBadges.Meta_Y testMetaY = new  CredlyJSON2ApexMyIssuedBadges.Meta_Y();
				testMetaY = obj2.Data[0].badge.components.meta;
				
					CredlyJSON2ApexMyIssuedBadges.Icon testIcon = new  CredlyJSON2ApexMyIssuedBadges.Icon();
				testIcon = obj2.Data[0].badge.components.icon;
		
			
			
	}	*/
	
		static testMethod void CredlyJSON2ApexMyMemberBadges()
	{
		

	String json = '{'+
		'    \"meta\": {'+
		'        \"status_code\": 200,'+
		'        \"status\": \"OK\",'+
		'        \"message\": \"\",'+
		'        \"more_info\": null'+
		'    },'+
		'    \"data\": ['+
		'        {'+
		'            \"id\": 104944,'+
		'            \"member_id\": 0,'+
		'            \"issuer_id\": 10636,'+
		'            \"badge_id\": 15507,'+
		'            \"title\": \"test\",'+
		'            \"short_description\": \"test\",'+
		'            \"image\": \"https://credlyapp.s3.amazonaws.com/badges/53d4433bda4719fe77303cf801f763f2.png\",'+
		'            \"created_at\": \"Sat, 29 Mar 2014 14:29:43 -0400\",'+
		'            \"expires_at\": \"\",'+
		'            \"is_draft\": false,'+
		'            \"is_accepted\": false,'+
		'            \"is_visible\": true,'+
		'            \"is_deleted\": false,'+
		'            \"description\": \"test\",'+
		'            \"criteria\": \"test\",'+
		'            \"categories\": [],'+
		'            \"issuer_categories\": [],'+
		'            \"member\": null,'+
		'            \"member_orphan\": {'+
		'                \"id\": 76452,'+
		'                \"member_badge_id\": 104944,'+
		'                \"email\": \"legacy@starfishenterprise.net\",'+
		'                \"first_name\": \"Jake\",'+
		'                \"last_name\": \"Llorrac\"'+
		'            },'+
		'            \"issuer\": {'+
		'                \"id\": 10636,'+
		'                \"slug\": \"\",'+
		'                \"type\": \"user\",'+
		'                \"display_name\": \"Joseph Legacy\",'+
		'                \"avatar\": \"https://credlyapp.s3.amazonaws.com/avatars/ca02cd78b68d82da8e01272ba271901d.jpeg\",'+
		'                \"account_type\": \"Free\",'+
		'                \"is_pro\": false,'+
		'                \"is_email_verified\": true,'+
		'                \"is_account_verified\": false,'+
		'                \"member_badge_count\": 0,'+
		'                \"issued_badge_count\": 0,'+
		'                \"trusted_by_count\": 0,'+
		'                \"lists_count\": 0,'+
		'                \"first_name\": \"Joseph\",'+
		'                \"last_name\": \"Legacy\",'+
		'                \"email\": \"jlegacy@suddenlink.net\",'+
		'                \"bio\": \"\",'+
		'                \"location\": \"\",'+
		'                \"website\": \"\",'+
		'                \"last_activity\": false,'+
		'                \"created_at\": \"Wed, 27 Nov 2013 23:32:54 -0500\",'+
		'                \"updated_at\": \"Thu, 06 Feb 2014 03:03:08 -0500\"'+
		'            },'+
		'            \"badge\": {'+
		'                \"id\": 15507,'+
		'                \"title\": \"test\",'+
		'                \"short_description\": \"test\",'+
		'                \"image_url\": \"https://credlyapp.s3.amazonaws.com/badges/53d4433bda4719fe77303cf801f763f2.png\",'+
		'                \"is_giveable\": false,'+
		'                \"created_at\": \"Thu, 20 Mar 2014 22:01:17 -0400\",'+
		'                \"creator_id\": 10636,'+
		'                \"is_claimable\": false,'+
		'                \"description\": \"test\",'+
		'                \"criteria\": \"test\",'+
		'                \"expires_in\": 0,'+
		'                \"creator\": {'+
		'                    \"id\": 10636,'+
		'                    \"slug\": \"\",'+
		'                    \"type\": \"user\",'+
		'                    \"display_name\": \"Joseph Legacy\",'+
		'                    \"avatar\": \"https://credlyapp.s3.amazonaws.com/avatars/ca02cd78b68d82da8e01272ba271901d.jpeg\",'+
		'                    \"account_type\": \"Free\",'+
		'                    \"is_pro\": false,'+
		'                    \"is_email_verified\": true,'+
		'                    \"is_account_verified\": false,'+
		'                    \"member_badge_count\": 0,'+
		'                    \"issued_badge_count\": 0,'+
		'                    \"trusted_by_count\": 0,'+
		'                    \"lists_count\": 0,'+
		'                    \"first_name\": \"Joseph\",'+
		'                    \"last_name\": \"Legacy\",'+
		'                    \"email\": \"jlegacy@suddenlink.net\",'+
		'                    \"bio\": \"\",'+
		'                    \"location\": \"\",'+
		'                    \"website\": \"\",'+
		'                    \"last_activity\": false,'+
		'                    \"created_at\": \"Wed, 27 Nov 2013 23:32:54 -0500\",'+
		'                    \"updated_at\": \"Thu, 06 Feb 2014 03:03:08 -0500\"'+
		'                },'+
		'                \"categories\": ['+
		'                    {'+
		'                        \"id\": 966,'+
		'                        \"name\": \"ability to concentrate\",'+
		'                        \"created_at\": \"Sat, 17 Nov 2012 18:42:26 -0500\"'+
		'                    },'+
		'                    {'+
		'                        \"id\": 795,'+
		'                        \"name\": \"(sodium) vapour lamp\",'+
		'                        \"created_at\": \"Sat, 17 Nov 2012 18:42:20 -0500\"'+
		'                    }'+
		'                ],'+
		'                \"require_claim_code\": true,'+
		'                \"require_claim_evidence\": false,'+
		'                \"require_claim_evidence_description\": \"\",'+
		'                \"approve_claim_automatically\": false,'+
		'                \"components\": {'+
		'                    \"icon\": {'+
		'                        \"id\": 3771,'+
		'                        \"type\": \"icon\",'+
		'                        \"filename\": \"pencil-347\",'+
		'                        \"vector_ext\": \"svg\",'+
		'                        \"raster_ext\": \"png\",'+
		'                        \"vector_url\": \"https://credlyapp.s3.amazonaws.com/assets/icon/pencil-347.svg\",'+
		'                        \"raster_url\": \"https://credlyapp.s3.amazonaws.com/assets/icon/pencil-347.png\",'+
		'                        \"meta\": {'+
		'                            \"attribute\": \"The Noun Project\",'+
		'                            \"license\": \"Creative Commons - Attribution (CC BY 3.0)\",'+
		'                            \"noun\": \"Pencil\",'+
		'                            \"npid\": \"347\"'+
		'                        }'+
		'                    },'+
		'                    \"meta\": {'+
		'                        \"banner-color\": \"#c3c3c3\",'+
		'                        \"banner-text\": \"Blank Slate\",'+
		'                        \"banner-text-color\": \"#ffffff\",'+
		'                        \"border\": \"solid\",'+
		'                        \"border-color\": \"#000000\",'+
		'                        \"custom_icon\": \"1\",'+
		'                        \"expires_amount\": \"1\",'+
		'                        \"expires_units\": \"never\",'+
		'                        \"icon-color\": \"#000000\",'+
		'                        \"shape\": \"circle-badge\",'+
		'                        \"shape-color\": \"#ffffff\"'+
		'                    }'+
		'                }'+
		'            },'+
		'            \"badge_evidence\": [],'+
		'            \"badge_testimonial\": ['+
		'                {'+
		'                    \"id\": 36104,'+
		'                    \"composer_id\": 10636,'+
		'                    \"member_badge_id\": 104944,'+
		'                    \"body\": \" \",'+
		'                    \"created_at\": \"Sat, 29 Mar 2014 14:29:43 -0400\"'+
		'                }'+
		'            ]'+
		'        }'+
		'    ],'+
		'    \"paging\": {'+
		'        \"page\": 1,'+
		'        \"per_page\": 1,'+
		'        \"order_direction\": \"DESC\",'+
		'        \"total_results\": 75,'+
		'        \"multi_result_count\": 2,'+
		'        \"resources\": {'+
		'            \"next\": \"https://api.credly.com/v1.1/me/badges/given?access_token=efaa8a6c587c02edfd4ba1cc88c2fee7a09ce865eaff860a6a6a92a85c0445c4bfb26951a03bee7bed5d17ed684a194da0dced5559aa23453231699a6db85ecd&per_page=1&page=2&order_direction=DESC\"'+
		'        }'+
		'    }'+
		'}';
		
		CredlyJSON2ApexMyMemberBadges obj2 =  CredlyJSON2ApexMyMemberBadges.parse(json);
		
			CredlyJSON2ApexMyMemberBadges.Data testData = new CredlyJSON2ApexMyMemberBadges.Data();
			
			CredlyJSON2ApexMyMemberBadges.Meta testMeta = new CredlyJSON2ApexMyMemberBadges.Meta();
			testMeta = obj2.meta;
			
			CredlyJSON2ApexMyMemberBadges.Paging testPaging = new CredlyJSON2ApexMyMemberBadges.Paging();
			testPaging = obj2.Paging;
			
				CredlyJSON2ApexMyMemberBadges.Resources testResources = new  CredlyJSON2ApexMyMemberBadges.Resources();
				testResources = obj2.Paging.Resources;
				
				CredlyJSON2ApexMyMemberBadges.Member_orphan testOrphan = new  CredlyJSON2ApexMyMemberBadges.Member_orphan();
				testOrphan = obj2.Data[0].Member_orphan;
				
				CredlyJSON2ApexMyMemberBadges.Components testComponent = new  CredlyJSON2ApexMyMemberBadges.Components();
				testComponent = null;
			

					CredlyJSON2ApexMyMemberBadges.Meta_X testMetaX = new  CredlyJSON2ApexMyMemberBadges.Meta_X();
				testMetaX = null;
				
					CredlyJSON2ApexMyMemberBadges.Badge_Z testBadgeZ = new  CredlyJSON2ApexMyMemberBadges.Badge_Z();
				testBadgeZ = null;

				CredlyJSON2ApexMyMemberBadges.Badge_testimonial testBadgeTestimonial = new  CredlyJSON2ApexMyMemberBadges.Badge_testimonial();
				testBadgeTestimonial = null;
				
					CredlyJSON2ApexMyMemberBadges.Badge_evidence testBadgeEvidence = new  CredlyJSON2ApexMyMemberBadges.Badge_evidence();
				testBadgeEvidence = null;
				
				
					CredlyJSON2ApexMyMemberBadges.Categories_Z testCategoriesZ = new  CredlyJSON2ApexMyMemberBadges.Categories_Z();
				testCategoriesZ = null;
				
				CredlyJSON2ApexMyMemberBadges.Issuer testIssuer = new  CredlyJSON2ApexMyMemberBadges.Issuer();
				testIssuer = obj2.Data[0].Issuer;
				
					CredlyJSON2ApexMyMemberBadges.Badge testBadge = new  CredlyJSON2ApexMyMemberBadges.Badge();
				testBadge = obj2.Data[0].Badge;
				
					CredlyJSON2ApexMyMemberBadges.Meta_W testMetaW = new  CredlyJSON2ApexMyMemberBadges.Meta_W();
				testMetaW = obj2.Data[0].badge.components.meta;
				
					CredlyJSON2ApexMyMemberBadges.Icon testIcon = new  CredlyJSON2ApexMyMemberBadges.Icon();
				testIcon = obj2.Data[0].badge.components.icon;
				
							CredlyJSON2ApexMyMemberBadges.Meta testMetaAlone = new  CredlyJSON2ApexMyMemberBadges.Meta();
				testMetaAlone = null;
				
					CredlyJSON2ApexMyMemberBadges.Creator testCreator = new  CredlyJSON2ApexMyMemberBadges.Creator();
				testCreator = obj2.Data[0].badge.creator;
					
			
	}	
	
	
	
}