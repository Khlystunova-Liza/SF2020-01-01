trigger OfferTrigger on Offer__c (before update) {

    if(Trigger.isBefore){
        //Task triggers 3
        //When we update Custom Object record update Number_Of_Updates__c field(increment)
        // and show the total number of updates
        OfferService.updateNumberOfUpdates(Trigger.new);
    }
}