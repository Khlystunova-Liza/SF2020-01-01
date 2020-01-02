/**
 * Created by ADMIN on 23.10.2019.
 */

public with sharing class ContactEditController {

    public Contact contact {get;set;}
    public Id selectedId {get;set;}
    public List<Contact> contacts {get;set;}

    public ContactEditController(){
        contacts = [
                SELECT
                        Id,
                        LastName,
                        FirstName
                FROM    Contact
                LIMIT    10
        ];
    }

    public void selectContact(){
        contact = [
                SELECT
                        Id,
                        LastName,
                        FirstName
                FROM    Contact
                WHERE   Id = :selectedId
        ];
    }

    public void deleteContact(){
        contact = [
                SELECT
                        Id,
                        LastName,
                        FirstName
                FROM    Contact
                WHERE   Id = :selectedId
        ];
        delete contact;
    }
}