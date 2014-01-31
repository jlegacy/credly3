public with sharing class CredlyJSON2ApexMyBadges {


	public class Data {
		public Integer id;
		public String title;
		public String short_description;
		public String image_url;
		public Boolean is_giveable;
		public String created_at;
		public Integer creator_id;
		public Resources resources;
	}

	public class Paging {
		public Integer page;
		public Integer per_page;
		public String order_direction;
		public Integer total_results;
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

	
	public static CredlyJSON2ApexMyBadges parse(String json) {
		return (CredlyJSON2ApexMyBadges) System.JSON.deserialize(json, CredlyJSON2ApexMyBadges.class);
	}
	
/*	static testMethod void testParse() {
		'String json = '{'+
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
		' CredlyJSON2ApexMyBadges obj = parse(json);
		' System.assert(obj != null);
	}*/
}