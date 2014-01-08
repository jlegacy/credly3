public with sharing class CredlyJSON2ApexCategories {

	public class Data {
		public Integer total;
		public Integer id;
		public String type;
		public String name;
		public String created_at;
		public Resources resources;
	}

	public class Resources_Z {
		public String next;
	}

	public class Paging {
		public Integer page;
		public Integer per_page;
		public String order_direction;
		public Resources_Z resources;
	}

	public Meta meta;
	public List<Data> data;
	public Paging paging;

	public class Meta {
		public Integer status_code;
		public String status;
		public String message;
		public Object more_info;
	}

	public class Resources {
		public String url;
	}

	
	public static CredlyJSON2ApexCategories parse(String json) {
		return (CredlyJSON2ApexCategories) System.JSON.deserialize(json, CredlyJSON2ApexCategories.class);
	}
	
	/*static testMethod void testParse() {
	//	String json = '{'+
	//	'    \"meta\": {'+
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
		//CredlyJSON2ApexCategories obj = parse(json);
	//	System.assert(obj != null); 
	}*/
}