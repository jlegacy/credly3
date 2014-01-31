@isTest(seeAllData=true)
public with sharing class testIssuedBadgesParse {
	static testMethod void testParse(){
		String json = '{'+
		'  \"meta\": {'+
		'    \"status_code\": 200,'+
		'    \"status\": \"OK\",'+
		'    \"message\": \"\",'+
		'    \"more_info\": ""'+
		'  },'+
		'  \"data\": ['+
		'    {'+
		'      \"id\": 68884,'+
		'      \"member_id\": 0,'+
		'      \"issuer_id\": 10636,'+
		'      \"badge_id\": 16,'+
		'      \"title\": \"Leadership Professional\",'+
		'      \"short_description\": \"Demonstrates competency in ten key measures of leadership behaviors and skills.\",'+
		'      \"image\": \"https://credlyapp.s3.amazonaws.com/badges/af55ecd091e5ebca07b6a5e95eea295e.png\",'+
		'      \"created_at\": \"Sat, 04 Jan 2014 17:06:41 -0500\",'+
		'      \"expires_at\": \"\",'+
		'      \"is_draft\": false,'+
		'      \"is_accepted\": false,'+
		'      \"is_visible\": true,'+
		'      \"is_deleted\": false,'+
		'      \"description\": \"\",'+
		'      \"criteria\": \"The holder of this credential has successfully completed a leadership skills assessment of ten core measures of leadership success.\",'+
		'      \"categories\": [],'+
		'      \"issuer_categories\": [],'+
		'      \"member\": "",'+
		'      \"member_orphan\": {'+
		'        \"id\": 50918,'+
		'        \"member_badge_id\": 68884,'+
		'        \"email\": \"legacy@starfishenterprise.net\",'+
		'        \"first_name\": \"joseph legacy\",'+
		'        \"last_name\": \"joseph legacy\"'+
		'      },'+
		'      \"issuer\": {'+
		'        \"id\": 10636,'+
		'        \"slug\": \"\",'+
		'        \"type\": \"user\",'+
		'        \"display_name\": \"Joseph Legacy\",'+
		'        \"avatar\": \"https://credlyapp.s3.amazonaws.com/avatars/a67b912e3df563dbcac76c63c365c642.jpeg\",'+
		'        \"account_type\": \"Free\",'+
		'        \"is_pro\": false,'+
		'        \"is_email_verified\": true,'+
		'        \"is_account_verified\": false,'+
		'        \"member_badge_count\": 1,'+
		'        \"issued_badge_count\": 0,'+
		'        \"trusted_by_count\": 0,'+
		'        \"lists_count\": 0,'+
		'        \"first_name\": \"Joseph\",'+
		'        \"last_name\": \"Legacy\",'+
		'        \"email\": \"jlegacy@suddenlink.net\",'+
		'        \"bio\": \"\",'+
		'        \"location\": \"\",'+
		'        \"website\": \"\",'+
		'        \"last_activity\": false,'+
		'        \"created_at\": \"Wed, 27 Nov 2013 23:32:54 -0500\",'+
		'        \"updated_at\": \"Wed, 27 Nov 2013 23:32:57 -0500\"'+
		'      },'+
		'      \"badge\": {'+
		'        \"id\": 16,'+
		'        \"title\": \"Leadership Professional\",'+
		'        \"short_description\": \"Demonstrates competency in ten key measures of leadership behaviors and skills.\",'+
		'        \"image_url\": \"https://credlyapp.s3.amazonaws.com/badges/af55ecd091e5ebca07b6a5e95eea295e.png\",'+
		'        \"is_giveable\": false,'+
		'        \"created_at\": \"Thu, 03 Jan 2013 22:10:08 -0500\",'+
		'        \"creator_id\": 37,'+
		'        \"description\": \"\",'+
		'        \"criteria\": \"The holder of this credential has successfully completed a leadership skills assessment of ten core measures of leadership success.\",'+
		'        \"expires_in\": 0,'+
		'        \"creator\": {'+
		'          \"id\": 37,'+
		'          \"slug\": \"proexamtests\",'+
		'          \"type\": \"organization\",'+
		'          \"display_name\": \"ProExam\",'+
		'          \"avatar\": \"https://credlyapp.s3.amazonaws.com/avatars/cc9887a41e2f466430b1aa6e5b07da2c.png\",'+
		'          \"account_type\": \"Free\",'+
		'          \"is_pro\": false,'+
		'          \"is_email_verified\": true,'+
		'          \"is_account_verified\": false,'+
		'          \"member_badge_count\": 0,'+
		'          \"issued_badge_count\": 11,'+
		'          \"trusted_by_count\": 2,'+
		'          \"lists_count\": 0,'+
		'          \"email\": \"SGreenberg@proexam.org\",'+
		'          \"bio\": \"ProExam provides industry-leading credentialing, technology, and delivery solutions in support of professional licensure and certification, training, and continuing professional education, across a broad range of professions. \",'+
		'          \"location\": \"New York, NY\",'+
		'          \"website\": \"http://www.proexam.org\",'+
		'          \"last_activity\": false,'+
		'          \"created_at\": \"Thu, 03 Jan 2013 21:11:06 -0500\",'+
		'          \"updated_at\": \"Wed, 20 Mar 2013 21:00:22 -0400\"'+
		'        },'+
		'        \"categories\": ['+
		'          {'+
		'            \"id\": 6802,'+
		'            \"name\": \"company leadership and management\",'+
		'            \"created_at\": \"Sat, 17 Nov 2012 18:46:03 -0500\"'+
		'          },'+
		'          {'+
		'            \"id\": 1125,'+
		'            \"name\": \"team leadership\",'+
		'            \"created_at\": \"Sat, 17 Nov 2012 18:42:32 -0500\"'+
		'          },'+
		'          {'+
		'            \"id\": 599,'+
		'            \"name\": \"leadership skills\",'+
		'            \"created_at\": \"Sat, 17 Nov 2012 18:42:13 -0500\"'+
		'          }'+
		'        ],'+
		'        \"components\": {'+
		'          \"icon\": {'+
		'            \"id\": 3712,'+
		'            \"type\": \"icon\",'+
		'            \"filename\": \"refresh-7452\",'+
		'            \"vector_ext\": \"svg\",'+
		'            \"raster_ext\": \"png\",'+
		'            \"vector_url\": \"https://credlyapp.s3.amazonaws.com/assets/icon/refresh-7452.svg\",'+
		'            \"raster_url\": \"https://credlyapp.s3.amazonaws.com/assets/icon/refresh-7452.png\",'+
		'            \"meta\": {'+
		'              \"attribute\": "",'+
		'              \"license\": \"Creative Commons - Attribution (CC BY 3.0)\",'+
		'              \"noun\": \"Refresh\",'+
		'              \"npid\": \"7452\"'+
		'            }'+
		'          },'+
		'          \"meta\": {'+
		'            \"banner-color\": \"#f3da2a\",'+
		'            \"banner-text\": \"Leadership PRO\",'+
		'            \"banner-text-color\": \"#000000\",'+
		'            \"border\": \"solid\",'+
		'            \"border-color\": \"#e74d80\",'+
		'            \"expires_amount\": \"1\",'+
		'            \"expires_units\": \"never\",'+
		'            \"icon-color\": \"#000000\",'+
		'            \"shape\": \"shield-badge\",'+
		'            \"shape-color\": \"#ffffff\"'+
		'          }'+
		'        }'+
		'      },'+
		'      \"badge_evidence\": ['+
		'        {'+
		'          \"id\": 52263,'+
		'          \"member_badge_id\": 68884,'+
		'          \"type\": \"photo\",'+
		'          \"mime_type\": \"image/jpeg\",'+
		'          \"resource\": \"https://credlyapp.s3.amazonaws.com/evidence/4e9c11ee1b753a7e28e04f81215cd8c7.jpeg\",'+
		'          \"comment_count\": 0,'+
		'          \"like_count\": 0,'+
		'          \"created_at\": \"Sat, 04 Jan 2014 17:06:41 -0500\"'+
		'        }'+
		'      ],'+
		'      \"badge_testimonial\": ['+
		'        {'+
		'          \"id\": 21920,'+
		'          \"composer_id\": 10636,'+
		'          \"member_badge_id\": 68884,'+
		'          \"body\": \"test\",'+
		'          \"created_at\": \"Sat, 04 Jan 2014 17:06:41 -0500\"'+
		'        }'+
		'      ]'+
		'    },'+
		'    {'+
		'      \"id\": 68903,'+
		'      \"member_id\": 0,'+
		'      \"issuer_id\": 10636,'+
		'      \"badge_id\": 165,'+
		'      \"title\": \"Blank Slate\",'+
		'      \"short_description\": \"\",'+
		'      \"image\": \"https://credlyapp.s3.amazonaws.com/badges/13d2010e48a8c706b89b4953fe1c9e30.png\",'+
		'      \"created_at\": \"Sat, 04 Jan 2014 18:09:43 -0500\",'+
		'      \"expires_at\": \"\",'+
		'      \"is_draft\": false,'+
		'      \"is_accepted\": false,'+
		'      \"is_visible\": true,'+
		'      \"is_deleted\": false,'+
		'      \"description\": \"\",'+
		'      \"criteria\": \"\",'+
		'      \"categories\": [],'+
		'      \"issuer_categories\": [],'+
		'      \"member\": "",'+
		'      \"member_orphan\": {'+
		'        \"id\": 50932,'+
		'        \"member_badge_id\": 68903,'+
		'        \"email\": \"legacy@starfishenterprise.net\",'+
		'        \"first_name\": \"joseph\",'+
		'        \"last_name\": \"legacy\"'+
		'      },'+
		'      \"issuer\": {'+
		'        \"id\": 10636,'+
		'        \"slug\": \"\",'+
		'        \"type\": \"user\",'+
		'        \"display_name\": \"Joseph Legacy\",'+
		'        \"avatar\": \"https://credlyapp.s3.amazonaws.com/avatars/a67b912e3df563dbcac76c63c365c642.jpeg\",'+
		'        \"account_type\": \"Free\",'+
		'        \"is_pro\": false,'+
		'        \"is_email_verified\": true,'+
		'        \"is_account_verified\": false,'+
		'        \"member_badge_count\": 1,'+
		'        \"issued_badge_count\": 0,'+
		'        \"trusted_by_count\": 0,'+
		'        \"lists_count\": 0,'+
		'        \"first_name\": \"Joseph\",'+
		'        \"last_name\": \"Legacy\",'+
		'        \"email\": \"jlegacy@suddenlink.net\",'+
		'        \"bio\": \"\",'+
		'        \"location\": \"\",'+
		'        \"website\": \"\",'+
		'        \"last_activity\": false,'+
		'        \"created_at\": \"Wed, 27 Nov 2013 23:32:54 -0500\",'+
		'        \"updated_at\": \"Wed, 27 Nov 2013 23:32:57 -0500\"'+
		'      },'+
		'      \"badge\": {'+
		'        \"id\": 165,'+
		'        \"title\": \"Blank Slate\",'+
		'        \"short_description\": \"\",'+
		'        \"image_url\": \"https://credlyapp.s3.amazonaws.com/badges/13d2010e48a8c706b89b4953fe1c9e30.png\",'+
		'        \"is_giveable\": false,'+
		'        \"created_at\": \"Mon, 04 Feb 2013 13:20:25 -0500\",'+
		'        \"creator_id\": 246,'+
		'        \"description\": \"\",'+
		'        \"criteria\": \"\",'+
		'        \"expires_in\": 0,'+
		'        \"creator\": {'+
		'          \"id\": 246,'+
		'          \"slug\": \"\",'+
		'          \"type\": \"user\",'+
		'          \"display_name\": \"Monica Yatsyla\",'+
		'          \"avatar\": \"https://credlyapp.s3.amazonaws.com/avatars/fbe5d8cb03489a142fe90d12bb7e7c32.png\",'+
		'          \"account_type\": \"Free\",'+
		'          \"is_pro\": false,'+
		'          \"is_email_verified\": true,'+
		'          \"is_account_verified\": false,'+
		'          \"member_badge_count\": 1,'+
		'          \"issued_badge_count\": 0,'+
		'          \"trusted_by_count\": 0,'+
		'          \"lists_count\": 1,'+
		'          \"first_name\": \"Monica\",'+
		'          \"last_name\": \"Yatsyla\",'+
		'          \"email\": \"monica.yatsyla@hofstra.edu\",'+
		'          \"bio\": \"\",'+
		'          \"location\": \"\",'+
		'          \"website\": \"\",'+
		'          \"last_activity\": false,'+
		'          \"created_at\": \"Mon, 04 Feb 2013 13:17:23 -0500\",'+
		'          \"updated_at\": \"Mon, 04 Feb 2013 19:23:47 -0500\"'+
		'        },'+
		'        \"categories\": [],'+
		'        \"components\": {'+
		'          \"icon\": {'+
		'            \"id\": 3771,'+
		'            \"type\": \"icon\",'+
		'            \"filename\": \"pencil-347\",'+
		'            \"vector_ext\": \"svg\",'+
		'            \"raster_ext\": \"png\",'+
		'            \"vector_url\": \"https://credlyapp.s3.amazonaws.com/assets/icon/pencil-347.svg\",'+
		'            \"raster_url\": \"https://credlyapp.s3.amazonaws.com/assets/icon/pencil-347.png\",'+
		'            \"meta\": {'+
		'              \"attribute\": \"The Noun Project\",'+
		'              \"license\": \"Creative Commons - Attribution (CC BY 3.0)\",'+
		'              \"noun\": \"Pencil\",'+
		'              \"npid\": \"347\"'+
		'            }'+
		'          },'+
		'          \"meta\": {'+
		'            \"banner-color\": \"#c3c3c3\",'+
		'            \"banner-text\": \"Blank Slate\",'+
		'            \"banner-text-color\": \"#ffffff\",'+
		'            \"border\": \"solid\",'+
		'            \"border-color\": \"#000000\",'+
		'            \"expires_amount\": \"1\",'+
		'            \"expires_units\": \"never\",'+
		'            \"icon-color\": \"#000000\",'+
		'            \"shape\": \"shield-badge\",'+
		'            \"shape-color\": \"#ffffff\"'+
		'          }'+
		'        }'+
		'      },'+
		'      \"badge_evidence\": ['+
		'        {'+
		'          \"id\": 52274,'+
		'          \"member_badge_id\": 68903,'+
		'          \"type\": \"text\",'+
		'          \"mime_type\": \"text/plain\",'+
		'          \"resource\": \"https://credlyapp.s3.amazonaws.com/evidence/ed646a3334ca891fd3467db131372140.txt\",'+
		'          \"comment_count\": 0,'+
		'          \"like_count\": 0,'+
		'          \"created_at\": \"Sat, 04 Jan 2014 18:09:44 -0500\"'+
		'        }'+
		'      ],'+
		'      \"badge_testimonial\": []'+
		'    }'+
		'  ],'+
		'  \"paging\": {'+
		'    \"page\": 1,'+
		'    \"per_page\": 10,'+
		'    \"order_direction\": \"ASC\",'+
		'    \"total_results\": 17,'+
		'    \"resources\": {'+
		'      \"next\": \"https://api.credly.com/v1.1/me/badges/given?is_accepted=0&page=2&per_page=10&order_direction=ASC&access_token=e9f2ceca20e2cf6d7c8cd14eedaac408f65415fd66904f07538ba90fd36abe2d8b5cd2a67be4635d5666c14badc8758af58595d07e53072806af8a12a5d7a7aa\"'+
		'    }'+
		'  }'+
		'}';
		 CredlyJSON2ApexMyIssuedBadges obj = CredlyJSON2ApexMyIssuedBadges.parse(json);
		 system.debug(obj);
		System.assert(obj != null);
}

}