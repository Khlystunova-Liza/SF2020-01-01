/**
 * Created by ADMIN on 25.10.2019.
 */

public with sharing class RegistrationController {

    @AuraEnabled
    public static Contact saveContact(Contact con){
        System.debug('into apex method saveContact');
            Integer count = [
                SELECT  COUNT()
                FROM    Contact
                WHERE   Contact.Login__c LIKE :con.Login__c
            ];
            if(count == 0){
                insert con;
                System.debug('contact'+ con);
                return con;
            }

        return null;
    }

    @AuraEnabled
    public static Contact getContact(String login, String password){
        System.debug('into method getContact' );
        System.debug('login:' + login);
        System.debug('password:' + password);

        List<Contact> contacts = [
                SELECT  Id,
                        Login__c,
                        Password__c
                FROM    Contact
                WHERE   Contact.Login__c = :login
        ];
        if(contacts.size() == 1){
            System.debug('Contacts size = ' + contacts.size());
            if(contacts[0].Password__c == password){
                return contacts[0];
            }
        }
        return null;
    }
}