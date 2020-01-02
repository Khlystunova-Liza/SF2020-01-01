/**
 * Created by ADMIN on 17.10.2019.
 */

public with sharing class AccountHandler {

    public static Account insertNewAccount(String name){
        Account acc;
        try{
            acc = new Account(Name=name);
            insert acc;
            return acc;
        }catch (DmlException e){
            System.debug('DmlException'+ e.getMessage());
            return null;
        }
    }
}