/**
 * Created by ADMIN on 19.10.2019.
 */

@isTest
private with sharing class OfferServiceTest {

    //Task triggers 3
    //When we update Custom Object record update Number_Of_Updates__c field(increment)
    // and show the total number of updates

    @isTest
    static void updateNumberOfUpdatesTest(){
        Offer__c offer = new Offer__c(Country__c='Test');
        insert offer;
        Offer__c offerTest = [SELECT Country__c,Number_Of_Updates__c FROM Offer__c WHERE Country__c LIKE 'Test'];
        offerTest.Country__c = 'TestUp';
        update offerTest;
        Offer__c updateOffer = [SELECT Number_Of_Updates__c FROM Offer__c WHERE Country__c LIKE 'TestUp'];
        System.assertEquals(1,updateOffer.Number_Of_Updates__c);

    }

}