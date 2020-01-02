/**
 * Created by ADMIN on 21.10.2019.
 */

public with sharing class AccountToJSON {

    public static void accountToJSON(){
        List<Account> accounts = [
                SELECT  Id,
                        Name,
                        BillingAddress,
                        ShippingAddress
                FROM Account
        ];

        String result = JSON.serialize(accounts);
        System.debug(result);
    }

}