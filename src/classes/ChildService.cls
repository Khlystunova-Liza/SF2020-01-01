public with sharing class ChildService {
    //task triggers 5
    //Создать Child__c и Parent__c, добавить поле Children_Count__c,
    // которое считает кол-во детей у Parent__c, связь между объектами лукап

    public static void countChildren(){
        List<Parent__c> parents = [
                SELECT   Id,
                (SELECT  Id
                FROM    Children__r
                )FROM    Parent__c
        ];
        for (Parent__c parent : parents) {
            parent.Children_Count__c = parent.Children__r.size();
        }
    }
}