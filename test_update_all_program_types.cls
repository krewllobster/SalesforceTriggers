@istest
public with sharing class TestProgType {
    
    @isTest static void testProgTypeTrigger(){
        
        //Test data setup
        //Create contact, opportunity, and opportunity contact role
		contact testcontact = new contact (firstname = 'test', lastname = 'testing', recordtypeid = '01230000000p4Eb');
        opportunity testopp = new opportunity (name='testing',stagename='converted',closedate=date.today(),recordtypeid = '012a00000018Esx');
        opportunity testopp2 = new opportunity (name='testing2',stagename='converted',closedate=date.today(),recordtypeid = '012a00000018Esx');
        testOpp.program_type__c = 'OTO: Twin Cities';
        testOpp.program_type__c = 'Win Win';
        insert testcontact;
        insert testOpp;
        insert testOpp2;
        opportunitycontactrole testRole = new opportunitycontactrole (contactid = testcontact.id, opportunityid = testOpp.id, role = 'Investor',isprimary = TRUE);
        opportunitycontactrole testRole2 = new opportunitycontactrole (contactid = testcontact.id, opportunityid = testOpp2.id, role = 'Investor',isprimary = TRUE);
        
        insert testrole;
        insert testrole2;
        
        system.assert(testcontact.All_Program_Types__c == null);
        
        //perform test
        testOpp.program_type__c = 'OTO: Denver';
        test.startTest();
        update testOpp;
        test.stopTest();
        
        //Verify that testcontact now has text
        testcontact = [select all_program_types__c FROM Contact WHERE Id = :testContact.Id];
        system.assertNotEquals(null, testcontact.All_Program_Types__c);
    }
}