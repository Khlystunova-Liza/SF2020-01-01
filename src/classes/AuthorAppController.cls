/**
 * Created by ADMIN on 23.10.2019.
 */

public with sharing class AuthorAppController {
    @AuraEnabled
    public static List<Author__c> getAuthorsList () {
        List<Author__c> authorsList = [
                 SELECT  Name,
                        (
                            SELECT  Name,
                                    Author__c
                            FROM    Books__r
                        )
                FROM    Author__c
                LIMIT   10
        ];
        return authorsList;
    }


}