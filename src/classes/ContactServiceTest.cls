/**
 * Created by ADMIN on 16.10.2019.
 */

@isTest
private class ContactServiceTest {

    @isTest static void testAddRelatedAccount(){
        Contact contact = new Contact();
        contact.LastName = 'Zuzu';
        insert contact;
        System.assertEquals(1, [SELECT Id FROM Account].size());
    }
}