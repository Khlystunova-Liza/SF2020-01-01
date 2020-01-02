/**
 * Created by ADMIN on 16.10.2019.
 */

public with sharing class ContactService {

    //метод проверяет наличие аккаунта у каждого контакта
    public static void addRelatedAccount(List<Contact> contacts){
        List<Account> accounts = new List<Account>();
        for(Contact contact : contacts){
            if(contact.AccountId == null){
                Account account = new Account();
                account.Name = 'TaskOnSelects Account';
                accounts.add(account);
            }
        }
        insert accounts;//инсертим созданный аккаунт в бд
        Integer i = 0;
        for(Contact contact : contacts){//добавляенм в контакт созданный аккаунт 
            if(contact.AccountId == null){
                contact.AccountId = accounts[i].Id;
                i++;
            }
        }
    }

    public static void updateName(List<Account> accounts){

        List<Contact> listOfUpdateContacts =  new List<Contact>();
        Set<Id> setIdOfAccounts = new Set<Id>();

        for(Account acc:accounts) {
           setIdOfAccounts.add(acc.Id);
        }

        List<Contact> contacts = [SELECT AccountId,LastName FROM Contact WHERE AccountId IN :setIdOfAccounts ];

        for(Contact con:contacts){
            con.AccountId=null;
            String updateName = con.LastName + ' Deleted';
            con.LastName = updateName;
            listOfUpdateContacts.add(con);

        }

        update listOfUpdateContacts;

    }

    public static void checkUpdateEmailField(List<Contact> oldContacts, List<Contact> newContacts){

        System.debug('into checkUpdateEmailField');

        List<Id> contactIds = new List<Id>();

        for (Integer i = 0; i < oldContacts.size(); i++) {
           if (!oldContacts[i].Email.equals(newContacts[i].Email)){
               contactIds.add(newContacts[i].Id);
           }
        }

        EmailUpdater.updateEmail(contactIds);
    }
}