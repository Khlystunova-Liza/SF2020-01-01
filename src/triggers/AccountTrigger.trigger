/**
 * Created by ADMIN on 17.10.2019.
 */


trigger AccountTrigger on Account (after insert,before delete ) {

    if(Trigger.isAfter) {
         //task trigger 1
         // When creating new Account records and Name of Account contains @’/&*! Symbols,
         // create Case for this Account.
        AccountService.createCase(Trigger.new);

        //task trigger 4
        // Написать триггер, который после создания аккаунта, создает новый аккаунт с именем 'Welcome'
        AccountService.addAccount();
    }

    if(Trigger.isBefore){
        //task trigger 2
        //When we delete Account record from the system update related Contacts
        // Name field (old contact Name + ‘Deleted’)
        AccountService.updateRelatedContactName(Trigger.old);

    }
}