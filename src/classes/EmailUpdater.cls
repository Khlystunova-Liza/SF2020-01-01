/**
 * Created by ADMIN on 29.10.2019.
 */

public with sharing class EmailUpdater {

    /*        task Asynchronous Apex:
    1) при обновлении контакта проверять обновилось ли поле email или что нибудь другое,
     и в этом случае обновлять соотвествующие поля на его аккаунте и на CustomUser__c
     (или создайте, какой-нибудь другой объект) с таким же именем, как контакт.*/

    @future
    public static void updateEmail(List<Id> contactIds){
        System.debug('into updateEmail');

        List<Contact> contacts = [
                SELECT Email,
                       AccountId
                FROM   Contact
                WHERE  Id
                IN     :contactIds];

        List<Id> accountIds = new List<Id>();

        for(Contact contact:contacts){
            accountIds.add(contact.AccountId);
        }

        List<Account> accounts = [
                SELECT Email__c,
                       Name
                FROM   Account
                WHERE  Id
                IN     :accountIds
        ];

        for (Integer i = 0; i < contacts.size(); i++) {
             accounts[i].Email__c = contacts[i].Email;
        }

        System.debug('before update accounts');
        update accounts;
        System.debug('after update accounts');


   /*     CustomUser__c customUser = [
                SELECT Email__c
                FROM   CustomUser__c
                WHERE  CustomUser__c.Name
                =      :contact.Name
        ];
        System.debug('before update user Email, user Email = ' + user.SenderEmail );
        customUser.Email__c = contactEmail;
        update customUser;
        System.debug('after update user Email, user Email = ' + user.SenderEmail );*/

    }
}