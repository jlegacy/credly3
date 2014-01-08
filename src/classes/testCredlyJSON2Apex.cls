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
	     CredlyJSON2ApexMemberBadge.parse('{"meta":{"status_code":200,"status":"OK","message":"","more_info":null},"data":1412}');
	     
	     
	      CredlyJSON2ApexMemberBadge.Data dataObject = new CredlyJSON2ApexMemberBadge.Data();
	      
	   dataObject.hashes.add('testing1');
	   dataObject.hashes.add('testing2');
	      dataObject.ids.add(1);
	       dataObject.ids.add(2);
	       dataObject.hash = 'testing';
	       
	    
	      
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

}