public with sharing class CredlyJSON2ApexErrors {
	public Meta meta;

	public class Meta {
		public Integer status_code;
		public String status;
		public String message;
	}

	public static CredlyJSON2ApexErrors parse(String json) {
		return (CredlyJSON2ApexErrors) System.JSON.deserialize(json, CredlyJSON2ApexErrors.class);
	}

}