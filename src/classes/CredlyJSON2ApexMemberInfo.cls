public with sharing class CredlyJSON2ApexMemberInfo {

	public class Data {
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
		public String phone;
		public Integer openbadge_id;
		public List<Connected_accounts> connected_accounts;
		public List<Emails> emails;
		public Boolean show_full;
		public Resources resources;
	}

	public class Emails {
		public Integer id;
		public String email;
		public Boolean is_verified;
		public Boolean is_primary;
	}

	public class Paging {
		public Integer page;
		public Integer per_page;
		public String order_direction;
	}

	public Meta meta;
	public List<Data> data;
	public Paging paging;

	public class Connected_accounts {
		public String type;
		public String account_id;
	}

	public class Meta {
		public Integer status_code;
		public String status;
		public String message;
		public Object more_info;
	}

	public class Resources {
		public String url;
	}

	
	public static CredlyJSON2ApexMemberInfo parse(String json) {
		return (CredlyJSON2ApexMemberInfo) System.JSON.deserialize(json, CredlyJSON2ApexMemberInfo.class);
	}
	
	/*static testMethod void testParse() {
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
		CredlyJSON2ApexCredlyId obj = parse(json);
		System.assert(obj != null); 
	}*/
}