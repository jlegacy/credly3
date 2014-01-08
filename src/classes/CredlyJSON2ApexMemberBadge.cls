public with sharing class CredlyJSON2ApexMemberBadge {

public class Data {
		public List<String> hashes;
		public List<Integer> ids;
		public String hash;
	}

	public Meta meta;
	public Data data;

	public class Meta {
		public Integer status_code;
		public String status;
		public String message;
		public Object more_info;
	}

	
	public static CredlyJSON2ApexMemberBadge parse(String json) {
		return (CredlyJSON2ApexMemberBadge) System.JSON.deserialize(json, CredlyJSON2ApexMemberBadge.class);
	}
	
//	static testMethod void testParse() {
//		String json = '{\"meta\":{\"status_code\":200,\"status\":\"OK\",\"message\":\"\",\"more_info\":null},\"data\":{\"hashes\":[\"c9c7bae73\"],\"ids\":[1384],\"hash\":\"c9c7bae73\"}}';
//		CredlyJSON2ApexMemberBadge obj = parse(json);
//		System.assert(obj != null);
	}