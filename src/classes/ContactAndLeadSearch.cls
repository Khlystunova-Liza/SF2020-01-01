/**
 * Created by ADMIN on 17.10.2019.
 */

public with sharing class ContactAndLeadSearch {

    public static List<List<SObject>> searchContactsAndLeads(String name){
                List<List<SObject>> results = [FIND :name IN ALL FIELDS
                        RETURNING Contact(FirstName,LastName),Lead(FirstName,LastName)];
        return results;
    }
}