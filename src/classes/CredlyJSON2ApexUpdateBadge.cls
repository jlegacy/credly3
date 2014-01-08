public with sharing class CredlyJSON2ApexUpdateBadge {
public class Data {
		public Integer id;
		public String title;
		public String short_description;
		public String image_url;
		public Boolean is_giveable;
		public String created_at;
		public Integer creator_id;
		public String description;
		public String criteria;
		public Integer expires_in;
		public Creator creator;
		public List<Categories> categories;
		public Components components;
	}

	public class Meta_Z {
		public String attribute;
		public String license;
		public String noun;
		public String npid;
	}

	public class Creator {
		public Integer id;
		public String slug;
		public String type;
		public String display_name;
		public String avatar;
		public String account_type;
		public Boolean is_pro;
		public Boolean is_email_verified;
		public Boolean is_account_verified;
		public Integer member_badge_count;
		public Integer issued_badge_count;
		public Integer trusted_by_count;
		public Integer lists_count;
		public String first_name;
		public String last_name;
		public String email;
		public String bio;
		public String location;
		public String website;
		public Boolean last_activity;
		public String created_at;
		public String updated_at;
	}

	public Meta meta;
	public Data data;
	public Creator creator;

	public class Components {
		public Icon icon;
		public Meta_Y meta;
	}

	public class Meta {
		public Integer status_code;
		public String status;
		public String message;
		public Object more_info;
	}

	public class Meta_Y {
		
	}

	public class Icon {
		public Integer id;
		public String type;
		public String filename;
		public String vector_ext;
		public String raster_ext;
		public String vector_url;
		public String raster_url;
		public Meta_Z meta;
	}

	public class Categories {
	}

	
	public static CredlyJSON2ApexUpdateBadge parse(String json) {
		return (CredlyJSON2ApexUpdateBadge) System.JSON.deserialize(json, CredlyJSON2ApexUpdateBadge.class);
	}
	
/*	static testMethod void testParse() {
		String json = '{'+
		'    \"meta\": {'+
		'        \"status_code\": 200,'+
		'        \"status\": \"OK\",'+
		'        \"message\": \"\",'+
		'        \"more_info\": null'+
		'    },'+
		'    \"data\": {'+
		'        \"id\": 1405,'+
		'        \"title\": \"test\",'+
		'        \"short_description\": \"\",'+
		'        \"image_url\": \"https://credlyapp.s3.amazonaws.com/badges/bde4fd46949ec2c768cf3e474d4eb16e.png\",'+
		'        \"is_giveable\": false,'+
		'        \"created_at\": \"Fri, 29 Nov 2013 15:08:16 -0500\",'+
		'        \"creator_id\": 323,'+
		'        \"description\": \"test\",'+
		'        \"criteria\": \"\",'+
		'        \"expires_in\": 0,'+
		'        \"creator\": {'+
		'            \"id\": 323,'+
		'            \"slug\": \"\",'+
		'            \"type\": \"user\",'+
		'            \"display_name\": \"joseph legacy\",'+
		'            \"avatar\": \"https://credlyapp.s3.amazonaws.com/avatars/fbe5d8cb03489a142fe90d12bb7e7c32.png\",'+
		'            \"account_type\": \"Free\",'+
		'            \"is_pro\": false,'+
		'            \"is_email_verified\": true,'+
		'            \"is_account_verified\": false,'+
		'            \"member_badge_count\": 0,'+
		'            \"issued_badge_count\": 0,'+
		'            \"trusted_by_count\": 0,'+
		'            \"lists_count\": 0,'+
		'            \"first_name\": \"joseph\",'+
		'            \"last_name\": \"legacy\",'+
		'            \"email\": \"legacy@starfishenterprise.net\",'+
		'            \"bio\": \"\",'+
		'            \"location\": \"\",'+
		'            \"website\": \"\",'+
		'            \"last_activity\": false,'+
		'            \"created_at\": \"Thu, 14 Nov 2013 18:30:38 -0500\",'+
		'            \"updated_at\": \"Thu, 14 Nov 2013 18:49:39 -0500\"'+
		'        },'+
		'        \"categories\": [],'+
		'        \"components\": {'+
		'            \"icon\": {'+
		'                \"id\": 3771,'+
		'                \"type\": \"icon\",'+
		'                \"filename\": \"pencil-347\",'+
		'                \"vector_ext\": \"svg\",'+
		'                \"raster_ext\": \"png\",'+
		'                \"vector_url\": \"https://credlyapp.s3.amazonaws.com/assets/icon/pencil-347.svg\",'+
		'                \"raster_url\": \"https://credlyapp.s3.amazonaws.com/assets/icon/pencil-347.png\",'+
		'                \"meta\": {'+
		'                    \"attribute\": \"The Noun Project\",'+
		'                    \"license\": \"Creative Commons - Attribution (CC BY 3.0)\",'+
		'                    \"noun\": \"Pencil\",'+
		'                    \"npid\": \"347\"'+
		'                }'+
		'            },'+
		'            \"meta\": {'+
		'                \"banner-color\": \"#c3c3c3\",'+
		'                \"banner-text\": \"Blank Slate\",'+
		'                \"banner-text-color\": \"#ffffff\",'+
		'                \"border\": \"solid\",'+
		'                \"border-color\": \"#000000\",'+
		'                \"custom_icon\": \"1\",'+
		'                \"expires_amount\": \"1\",'+
		'                \"expires_units\": \"never\",'+
		'                \"icon-color\": \"#000000\",'+
		'                \"shape\": \"circle-badge\",'+
		'                \"shape-color\": \"#ffffff\"'+
		'            }'+
		'        }'+
		'    }'+
		'}'; 
		CredlyJSON2ApexUpdateBadge obj = parse(json);
		System.assert(obj != null);
	}*/
}