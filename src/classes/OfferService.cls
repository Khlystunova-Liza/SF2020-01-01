public with sharing class OfferService {

    public static void updateNumberOfUpdates(List<Offer__c> offers){
        System.debug('into method' );
        for(Offer__c offer:offers){
            if(offer.Number_Of_Updates__c != null) {
                offer.Number_Of_Updates__c++;
                System.debug('Number of updates is ' + offer.Number_Of_Updates__c);
            }else{
                offer.Number_Of_Updates__c = 1;
                System.debug('Number of updates is 1' );
            }
        }
    }

}