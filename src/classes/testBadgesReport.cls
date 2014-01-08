@isTest(seeAllData=true)
public with sharing class testBadgesReport {
	static testMethod void testController() 
	{
    
        ViewMemberBadgeController controller = new ViewMemberBadgeController(); 
	}
	
	static testMethod void testSetGet() 
	{
    
         ViewMemberBadgeController controller = new ViewMemberBadgeController(); 
        controller.renderAccounts = true;
        controller.renderLeads = true;
        controller.renderContacts = true;
         controller.showAs = 'pdf';
         controller.showExcel = 'excel';
          controller.createExcel();
           controller.createPDF();
        controller.renderPage();
        
	}
	
		static testMethod void testMethods() 
	{
		  ViewMemberBadgeController controller = new ViewMemberBadgeController(); 
		  controller.refreshScreenController();
		  controller.getRecordTypes();
	}
	
	
	static testMethod void testQueries() 
	{
    
         ViewMemberBadgeController controller = new ViewMemberBadgeController(); 
          ApexPages.StandardSetController getBadge;
          
         controller.recordType = 'All';
        controller.filterName = '';
     getBadge = controller.getBadge;
      
        controller.recordType = 'All';
        controller.filterName = 'test';
   getBadge = controller.getBadge;
     
       controller.recordType = 'title';
        controller.filterName = 'All';
   getBadge = controller.getBadge;
   
     controller.recordType = 'title';
        controller.filterName = 'test';
   getBadge = controller.getBadge;
   
     controller.recordType = 'recipient';
        controller.filterName = 'All';
   getBadge = controller.getBadge;
   
     controller.recordType = 'recipient';
        controller.filterName = 'test';
   getBadge = controller.getBadge;
   
       controller.recordType = 'category';
        controller.filterName = 'All';
   getBadge = controller.getBadge;
   
     controller.recordType = 'category';
        controller.filterName = 'test';
   getBadge = controller.getBadge;
     
	}
	

}