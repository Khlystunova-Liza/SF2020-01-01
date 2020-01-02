/**
 * Created by ADMIN on 16.10.2019.
 */

//автоматически создается аккаунт если его нет
trigger ContactTrigger on Contact (before insert,after update) {
    if(Trigger.isBefore){//если этот тригерр стработал до сохранения записи
        System.debug(Trigger.new);
        ContactService.addRelatedAccount(Trigger.new);//в данном случае trigger.new - это лист контактов, который передается в наш метод
    }


/*        task Asynchronous Apex:
    1) при обновлении контакта проверять обновилось ли поле email или что нибудь другое,
     и в этом случае обновлять соотвествующие поля на его аккаунте и на CustomUser__c
     (или создайте, какой-нибудь другой объект) с таким же именем, как контакт.*/

    if(Trigger.isAfter){
        System.debug(Trigger.old);
        System.debug(Trigger.new);
        ContactService.checkUpdateEmailField(Trigger.old, Trigger.new);
    }
}