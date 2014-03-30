public with sharing class sendEmail {
	
	
public static String getEmailAddress(ID whoId, String AccountType)
{
Contact recipientContact;
Contact recipientAccount;
Lead recipientLead;

if (AccountType == 'contact')
{
recipientContact = [SELECT email FROM Contact  where ID = :whoId LIMIT 1];
return recipientContact.Email;
}

if (AccountType == 'lead')
{
recipientLead = [SELECT email FROM Lead  where ID = :whoId LIMIT 1];
return recipientLead.Email;	
}
if (AccountType == 'account')
{
Id accountId; // Fill in the accountId you want
List<Contact> contacts = new List<Contact>([SELECT email FROM Contact WHERE AccountId = :whoId and email <> null LIMIT 1]);
for(Contact a : contacts){
	return a.Email;	
}
}
return null;
}

//*no longer needed*//
/*public static void sendEmail(ID whoId, ID badgeId, String emailType)
{
Contact recipientContact;
Contact recipientAccount;
Lead recipientLead;
		
member_badge__c badge = [SELECT id, title_m__c, badge_lookup_m__c, badge_lookup_m__r.image__c, testimonial_m__c,badge_lookup_m__r.document_id__c FROM member_badge__c where ID = :badgeId LIMIT 1];

String sfdcBaseURL = URL.getSalesforceBaseUrl().toExternalForm();      
String[] temp = null;

String subject;
String testimonial;
testimonial = badge.testimonial_m__c;
subject = 'Congratulations on your new ' + badge.title_m__c + ' badge!';

String htmlBody = 'Congratulations on your new badge, copy and paste the link in your browser to download your badge - <br>';
String plainBody = 'Congratulations on your new badge, copy and paste the link in your browser to download your badge - <br>';
if (testimonial != null)
{
	htmlBody = badge.testimonial_m__c;
	plainBody = badge.testimonial_m__c;
}

htmlBody = htmlBody  + '<br>' + badge.badge_lookup_m__r.document_id__c;
plainBody = plainBody  +  '<br>' + badge.badge_lookup_m__r.document_id__c;

Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
mail.setSenderDisplayName('From Credly Badges');

//**Test**  because I maxed out the single emails remove for production//
// String guir = UserInfo.getUserId();
// mail.setTargetObjectId(guir);
 //mail.setSaveAsActivity(false);
 
mail.setHtmlBody(htmlBody);
mail.setPlainTextBody(plainBody);
mail.setSubject(subject);

if (emailType == 'contact')
{
recipientContact = [SELECT id FROM Contact  where ID = :whoId LIMIT 1];
mail.setTargetObjectId(recipientContact.id);
try{
	Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
	}
	catch(System.EmailException ex){
      // This message should be added to the page, 
      // as an exception is caught
    }
}
if (emailType == 'lead')
{
recipientLead = [SELECT id FROM Lead  where ID = :whoId LIMIT 1];
mail.setTargetObjectId(recipientLead.id);	
try{
	Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
	}
	catch(System.EmailException ex){
      // This message should be added to the page, 
      // as an exception is caught
    }
}
if (emailType == 'account')
{
Id accountId; // Fill in the accountId you want
List<Contact> contacts = new List<Contact>([SELECT Id, email FROM Contact WHERE AccountId = :whoId]);
for(Contact a : contacts){
	mail.setTargetObjectId(a.id);	
	try{
	Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
	}
	catch(System.EmailException ex){
      // This message should be added to the page, 
      // as an exception is caught
    }
		
	}
}

}*/

     }