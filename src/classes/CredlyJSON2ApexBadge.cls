public with sharing class CredlyJSON2ApexBadge {
	public Meta meta;
	public Integer data;

	public class Meta {
		public Integer status_code;
		public String status;
		public String message;
	}

	public static CredlyJSON2ApexBadge parse(String json) {
		return (CredlyJSON2ApexBadge) System.JSON.deserialize(json, CredlyJSON2ApexBadge.class);
	}

}