/*
 * Select Child From Parent where Parent name contains ‘TaskOnSelects’ (fields: Id, Name)
Select Parent to Child
Select 10 Opportunity that are in Stage (custom picklist value)
Calculate the total number of the Custom object records
Create new field Geolocation on Account, get field coordinates and get Street value from Mailing Address
Get Custom object records (from 10 to 20) and group by Country
 */

public class TaskOnSelects {

    // Select Child From Parent where Parent name contains ‘TaskOnSelects’ (fields: Id, Name)
    public static void test1() {
        List<Account> accounts = [SELECT (SELECT Name from Contacts) from Account where Name like '%TaskOnSelects%'];
        for (Account account : accounts) {
            System.debug(account.Name);
        }
    }

    //Select Parent to Child
    public static void test2() {
        List<Contact> contacts = [SELECT FirstName, Account.Name FROM Contact];
        for (Contact contact : contacts) {
            System.debug(contact);
        }
    }

    //Select 10 Opportunity that are in Stage (custom picklist value)
    public static void test3() {
        List<Contact> contacts = [SELECT Account.Name FROM Contact];
        for (Contact contact : contacts) {
            System.debug(contact.Name);
        }

    }
}