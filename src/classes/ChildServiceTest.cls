/**
 * Created by ADMIN on 19.10.2019.
 */

@isTest
private with sharing class ChildServiceTest {

    @IsTest
    static void countChildren(){
        Parent__c parent = new Parent__c();
        insert parent;
        Child__c childOne = new Child__c(Parent__c = parent.Id);
        Child__c childTwo = new Child__c(Parent__c = parent.Id);
        insert childOne;
        insert childTwo;
        System.assertEquals(2, selectNumberOfChildren ());
        delete childOne;
        System.assertEquals(1, selectNumberOfChildren ());
        undelete childOne;
        System.assertEquals(2, selectNumberOfChildren ());
        delete childTwo;
        System.assertEquals(1, selectNumberOfChildren ());

    }

    @isTest
    private static void onUpdateCounter () {
        Parent__c parent1 = new Parent__c();
        Parent__c parent2 = new Parent__c();
        insert parent1;
        insert parent2;
        Child__c child1 = new Child__c(Parent__c = parent1.Id);
        Child__c child2 = new Child__c();
        insert child1;
        insert child2;
        List<Child__c> children = [SELECT Id, Parent__c FROM Child__c];
        System.debug(children);
        children[1].Parent__c = children[0].Parent__c;
        children[0].Parent__c = null;
        update children;
        System.debug([SELECT Id, Parent__c FROM Child__c]);
        System.assertEquals(0, [SELECT Children_Count__c FROM Parent__c][1].Children_Count__c);
    }

     static Integer selectNumberOfChildren () {
        Parent__c parent = [SELECT Children_Count__c FROM Parent__c];
        Integer numberOfChildren = (Integer) parent.Children_Count__c;
        return numberOfChildren;
    }
}