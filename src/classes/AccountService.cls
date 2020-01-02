/**
 * Created by ADMIN on 19.10.2019.
 */

public with sharing class AccountService {

    private static Boolean flag = true;
    public static final String DELETED = ' Deleted';

    public static void createCase(List<Account> accounts){

        List<Case> cases = new List<Case>();
        Pattern p = Pattern.compile('[@\'/&*!]');
        for(Account acc:accounts){
            Matcher result = p.matcher(acc.Name);
            if(result.find()){
                Case c = new Case(AccountId=acc.Id);
                cases.add(c);
                System.debug('Case added');
            }
        }
        insert cases;
    }

    public static void addAccount() {
        if(flag) {
            flag = false;
            Account acct = new Account(Name = 'Welcome');
            insert acct;
            System.debug('Account with name=Welcome has added');
        }
    }

    public static void updateRelatedContactName(List<Account> accounts){

        List<Contact> listOfUpdateContacts =  new List<Contact>();
        Set<Id> setIdOfAccounts = new Set<Id>();

        for(Account acc:accounts) {
            setIdOfAccounts.add(acc.Id);
        }

        List<Contact> contacts = [
                SELECT
                        AccountId,
                        LastName
                FROM
                        Contact
                WHERE   AccountId
                IN      :setIdOfAccounts
        ];

        for(Contact con:contacts){
            con.AccountId=null;
            String updateName = con.LastName + DELETED;
            con.LastName = updateName;
            listOfUpdateContacts.add(con);

        }

        update listOfUpdateContacts;

    }

}