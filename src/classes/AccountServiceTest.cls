/**
 * Created by ADMIN on 19.10.2019.
 */

@isTest
private with sharing class AccountServiceTest {

     @isTest
     static void createCaseTest(){
         //task trigger 1
         // When creating new Account records and Name of Account contains @’/&*! Symbols,
         // create Case for this Account
         Account account = new Account(Name='@\'/&*!');
         insert account;
         List<Case> c = [
                 SELECT  Account.Name
                 FROM    Case
                 WHERE   Account.Name
                 LIKE    '@\'/&*!'
         ];
         System.assertEquals(1, c.size());
     }

    //task trigger last
    // Написать триггер, который после создания аккаунта, создает новый аккаунт с именем 'Welcome'
    @isTest
    static void addAccountTest(){
        Account account = new Account(Name='Welcome');
        insert account;
        System.assertEquals(1,[
                SELECT Name
                FROM   Account
                WHERE  Name
                LIKE  'Welcome'
        ].size());
    }


    //task trigger 2
    //When we delete Account record from the system update related Contacts
    // Name field (old contact Name + ‘Deleted’)
    @isTest
    static void updateRelatedContactNameTest(){
        Account account = new Account(Name='UpdateRelatedContactNameTest');
        insert Account;
        Contact contact = new Contact(LastName='Test',AccountId=account.Id);
        insert contact;
        delete account;
        List<Contact> contacts = [
                SELECT  Name
                FROM    Contact
                WHERE   Contact.Account.Name
                LIKE    'UpdateRelatedContactNameTest'
        ];
        for(Contact con :contacts){
            System.assertEquals('UpdateRelatedContactNameTest' + AccountService.DELETED, con.Name);
        }
    }

}