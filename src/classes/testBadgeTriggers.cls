@isTest(seeAllData=true)
public with sharing class testBadgeTriggers {
	
static testMethod void testAccountTrigger() 
	{
	
	
	badge__c newBadge1 = new badge__c(title__c = 'triggerTest1', expire_number__c = 5,expire_period__c = 'never' );
    insert newBadge1;
    
    badge_rules__c rule = new badge_rules__c(account_type_r__c = 'Account', badge_lookup__c= newBadge1.id, evidence_url_r__c='http://www.google.com',
    						lookup_id_r__c= newBadge1.id, rule_name_r__c= 'testing', send_email_r__c = true, badge_rule_r__c = 'Name:STRING|ct|test');
    insert rule;
    
    Account a = new Account(Name = 'unittest');
    insert a;	
    
    a.Name = 'untest';
    update a;
	}
	
	static testMethod void testLeadTrigger() 
	{
	badge__c newBadge1 = new badge__c(title__c = 'triggerTest1', expire_number__c = 5,expire_period__c = 'never' );
    insert newBadge1;
    
    badge_rules__c rule = new badge_rules__c(account_type_r__c = 'Lead', badge_lookup__c= newBadge1.id, evidence_url_r__c='http://www.google.com',
    						lookup_id_r__c= newBadge1.id, rule_name_r__c= 'testing', send_email_r__c = true, badge_rule_r__c = 'Company:STRING|ct|test');
    insert rule;
    
    System.debug('Inserting Lead');
    Lead b = new Lead(firstName = 'testfirst', lastName = 'test', Company='unittest', email='legacy@starfishenterprise.net', status='Open');
    insert b;	
    
    b.company='test2';
    update b;
    
		
	}
	
	static testMethod void testContactTrigger() 
	{
	badge__c newBadge1 = new badge__c(title__c = 'triggerTest1', expire_number__c = 5,expire_period__c = 'never' );
    insert newBadge1;
    
    badge_rules__c rule = new badge_rules__c(account_type_r__c = 'Contact', badge_lookup__c= newBadge1.id, evidence_url_r__c='http://www.google.com',
    						lookup_id_r__c= newBadge1.id, rule_name_r__c= 'testing', send_email_r__c = true, badge_rule_r__c = 'FirstName:STRING|ct|test');
    insert rule;
    
	Contact c = new Contact(firstName = 'unittest', lastname='unittest');
    insert c;
    
    c.FirstName = 'test2';
    update c;
		
	}
	
		
	
}