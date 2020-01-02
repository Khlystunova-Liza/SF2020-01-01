/**
 * Created by ADMIN on 17.10.2019.
 */

public with sharing class ContactSearch {

    public static List<Contact> searchForContacts(String lastName,String mailingPostalCode){

        List<Contact> contacts =[SELECT Name,Id FROM Contact WHERE (LastName LIKE :lastName AND MailingPostalCode LIKE :mailingPostalCode)];
        return contacts;

    }
}