@isTest(seeAllData=true)
public with sharing class testAutomatedBadgeTrigger {

	static testMethod void testController() 
	{
        automatedTriggerClass controller = new automatedTriggerClass(); 
	}
	
	static testMethod void testGetSet() 
	{
        automatedTriggerClass controller = new automatedTriggerClass();
        ApexPages.StandardSetController test;
        controller.getBadges(); 
        test = controller.getBadge;
	}
	static testMethod void testMethods() 
	{
        automatedTriggerClass controller = new automatedTriggerClass();
    //  controller.addMemberBadge(accountID, ruleID, badgeID, accountType);
   automatedTriggerClass.addMemberBadge('001i000000NI5twAAD', 'a03i0000008TGGAAA4', 'a01i00000084HSB', 'account');
   automatedTriggerClass.addMemberBadge('003i000000Qv0GiAAJ', 'a03i0000008TGGAAA4', 'a01i00000084HSB', 'contact');
    automatedTriggerClass.addMemberBadge('00Qi0000007QIh4EAG', 'a03i0000008TGGAAA4', 'a01i00000084HSB', 'lead');
     automatedTriggerClass.displayRule('OtherState:STRING|ct|nc~Languages__c:STRING|ct|spanish');
	automatedTriggerClass.lookForHit('test', 'test', 'eq', 'string');
	automatedTriggerClass.lookForHit('test', 'test', 'lt', 'string');
	automatedTriggerClass.lookForHit('test', 'test', 'le', 'string');
	automatedTriggerClass.lookForHit('test', 'test', 'gt', 'string');
	automatedTriggerClass.lookForHit('test', 'test', 'ge', 'string');
	automatedTriggerClass.lookForHit('test', 'test', 'ct', 'string');
	automatedTriggerClass.lookForHit('test', 'test', 'not eq', 'string');
	
	automatedTriggerClass.unparseRules('OtherState:STRING|ct|nc~Languages__c:STRING|ct|spanish');
	
	
	badge__c newBadge1 = new badge__c(title__c = 'triggerTest1', document_id__c = '015i0000001umwy', expire_number__c = 5, expire_period__c = 'never' );
    insert newBadge1;
    
    badge__c newBadge2 = new badge__c(title__c = 'triggerTest2', document_id__c = '015i0000001umwy', expire_number__c = 5,expire_period__c = 'day' );
    insert newBadge2;
    
    badge__c newBadge3 = new badge__c(title__c = 'triggerTest3', document_id__c = '015i0000001umwy', expire_number__c = 5,expire_period__c = 'week' );
    insert newBadge3;
    
    badge__c newBadge4 = new badge__c(title__c = 'triggerTest4', document_id__c = '015i0000001umwy', expire_number__c = 5,expire_period__c = 'month' );
    insert newBadge4;
    
    badge__c newBadge5 = new badge__c(title__c = 'triggerTest5', document_id__c = '015i0000001umwy', expire_number__c = 5,expire_period__c = 'year' );
    insert newBadge5;
    
    badge__c newBadge6 = new badge__c(title__c = 'triggerTest6', document_id__c = '015i0000001umwy', expire_number__c = 5,expire_period__c = 'never' );
    insert newBadge6;
    

	}

}