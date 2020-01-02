public with sharing class CTAccountAppController {
	@AuraEnabled
	public static List<Account> getAccList () {
		List<Account> accList = [
									SELECT  Id,
											Name/*,
											(
												SELECT  Id,
														Name,
														FirstName,
														LastName
												FROM    Contacts
											)*/
									FROM    Account
									LIMIT   10
								];
		return accList;
	}
	@AuraEnabled
	public static Account getAccWithContacts (String accId) {
		Account acc = [
						SELECT  Id,
								Name,
								(
									SELECT  Id,
											Name,
											FirstName,
											LastName
									FROM    Contacts
								)
						FROM    Account
						WHERE   Id = :accId
					 ];
		return acc;
	}
}