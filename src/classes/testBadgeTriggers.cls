@isTest(seeAllData=true)
public with sharing class testBadgeTriggers {
static testMethod void testAccountTrigger() 
	{
	Account a = new Account(Name = 'unittest');
    insert a;	
		
	}
	
	static testMethod void testLeadTrigger() 
	{
    Lead b = new Lead(firstName = 'unit', lastName = 'test', company='unittest', email='legacy@starfishenterprise.net', status='Open');
    insert b;	
		
	}
	
	static testMethod void testContactTrigger() 
	{
	Contact c = new Contact(firstName = 'unittest', lastname='unittest');
    insert c;	
		
	}
	
		
	
}