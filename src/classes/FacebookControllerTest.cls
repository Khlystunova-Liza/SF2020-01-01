/**
 * Created by ADMIN on 08.11.2019.
 */

@isTest
private with sharing class FacebookControllerTest {

    @isTest static void testMakeRequest() {
        System.Test.setMock(HttpCalloutMock.class,
                new JsonWithLikesHttpCalloutMock());
        System.Test.startTest();
        String response = FacebookController.makeRequest('https://graph.facebook.com/v5.0/111272053647759_111275350314096/Likes?access_token=EAAN47xnT3YUBACP63MKQLwtkd41ZAKEgdGdVtTGxo3ZAiXT3PBNb4TyAxUwadytYKjRUP1E0uYeZAzechdU4xklEwUUzr9i87BnSZAcOqeZAKKffdQI2182z70utD2zikTtDNEnqG0BD3uvCLxNmlqgGEqnBnIFNUrB2OlrC7LZCidIf8Kv4zl', 'GET');
        System.assertEquals(true,response!=null);
    }

    @isTest static void testGetContactList() {
        Token__c token = new Token__c();
        token.Value__c = 'EAAN47xnT3YUBAKiV7Y05b9kMwHZBYAMcjZCrIU2Ozn9cl2l52z7JRZCIgTqZBzN3ZCBVpOtaEJ4uVzXaAEOkwBbPV6LRjtKe5AfZAe7ZBHAfDVVgEow09ZANdH0VSoAYuZCBz3ZBbgLZAmfdVafNuNYT102yeOmWK1y8IPvlQmATSsJz4LFC5O5igOm';
        insert token;
        System.Test.setMock(HttpCalloutMock.class,
                new JsonWithLikesHttpCalloutMock());
        System.Test.startTest();
        List<Contact> contactList = FacebookController.getContactList('AQCSEv0_bdWV3tTC1A54sGI1EedDAW__U8BGAu04Oy5lAY_Plqsfguo97fk8VZDwKj8FF8Ks1Sde4V2-N4GHfpKKCpj1wnU2z-Iff5xyz-SFfvSSCRPVdpVUnHbFOtNuLqaFX56_Qler_szPZ0CCkqeHDR7TSK7ZxeSyVP6nPqtM-mkOnP-hfvCSwBGBvBnyLyneEYvmKhzvozRM47fvr9QdQK7JkgaW3xiFfp8UPbT1kogW_x5WwIDE965EYGdzMGrc-EVDHxaVUzFvKNRKcq8rTYX8zPIHqOOTKPfbvgfVRJy15jxmed9hOoKwpAz8ZPwjIMGgPdog4dnSV6T29-xX#_=_', '111275350314096');
        System.Test.stopTest();
        System.assertEquals(3, contactList.size());
    }

    @isTest static void testParseJsonWithContacts() {
        String json = '{"data":[{"id":"3391904224183676","name":"\u0418\u0432\u0430\u043d \u0428\u0443\u043b\u044c\u0446"},{"id":"2469281983126863","name":"Liza Khlystunova"},{"id":"111272053647759","name":"Test App"}],"paging":{"cursors":{"before":"QVFIUjJmZAUstdmZAHaHAxMzk4d3MwRFp5NnNnWjhMSzRnNU9FVEZA1NVkwZA1EtMEY0YUVydnRVNUlSMjdzei1sN0Y1Vnk1MzQ0Vk11bEpwYVRzbEFLMGdEYzFB","after":"QVFIUnZARVzFGSC1IcnBSQWNhenYxNVJ6QnZAVUnd5bEhjTEdJOWZACWG11S0ZAQbFBsRWVrcUJ5UHpFODhBWGpHSHJVei1oTngzUUhJUEJUWVI5WkRpNTJWTXp3"}}}';
        List<Contact> contacts = FacebookController.parseJsonWithContacts(json);
        System.assertEquals(3, contacts.size());
    }

    @isTest static void testCreateContacts() {
        List<Contact> contactList = new List<Contact>();
        contactList.add(new Contact(LastName = 'contact1'));
        contactList.add(new Contact(LastName = 'contact2'));
        contactList.add(new Contact(LastName = 'contact3'));
        System.Test.startTest();
        Boolean result = FacebookController.createContacts(contactList);
        System.Test.stopTest();
        System.equals(true, result);
    }

    @isTest static void testGetFacebookUserAccessToken() {
        System.Test.setMock(HttpCalloutMock.class,
                new UserAccessTokenHttpCalloutMock());
        System.Test.startTest();
        String userToken = FacebookController.getFacebookUserAccessToken('AQC9y20PcGMVBPhczp80DCW-rMYewgRanKZDNGGrlc1A2CMMBvVdyyKJSNGyz7dv6_MzbyVcl9kWHZaPhc6fVeUjhC-g-yinkp7hXiY7wlb-gaCuRGmLsy3yCd1zAMaqD7aOM3xyboSGIWxUcRtspX0WQ9KiErBB5yKirb7BdGj_Dd9_Oz7BxKkD3wsBmLVukmRm0hijTV80KeSW2cQOithSsvT-cWW06Bfu4zv4k8WcaX9Crfr4KpWKJLktsHbI36JxGdh3AGL0aagT4pxLzubAFAyj7wPzPlhmZgSmgBRdBf3jzmyo-cy19IANH-D7MhHZZ-uohMJd-8dNThKdaG9U#_=_');
        System.Test.stopTest();
        System.assertEquals(true, userToken!= null);
    }

    @isTest static void testGetFacebookPageAccessToken() {
        System.Test.setMock(HttpCalloutMock.class,
                new PageAccessTokenHttpCalloutMock());
        System.Test.startTest();
        String pageToken = FacebookController.getFacebookPageAccessToken('userToken');
        System.Test.stopTest();
        System.assertEquals(true,pageToken!=null);
    }

    @isTest static void testSavePageToken() {
        Token__c token = new Token__c();
        token.Value__c = 'djcbdbgfbfg';
        insert token;
        System.Test.startTest();
        FacebookController.savePageToken('EAAN47xnT3YUBANf98UURdVDecEf41ZAh36u7jcfasuFvA5PfRX6qt0eLvwDVBjVA4AZBJECazgDkd7qEIylhZBh8lYZAEZCvKJyldsKjsAL7ZCOv0Mw2mtq3YFS19k0xquiG5UuGxhRe9f2ZCnb71iwD7gv778TOiYESabkVOkfpQZDZD');
        System.Test.stopTest();
        Token__c tokenObject = [
                SELECT Value__c
                FROM Token__c
                LIMIT 1
        ];
        String pageToken = tokenObject.Value__c;
        System.assertEquals('EAAN47xnT3YUBANf98UURdVDecEf41ZAh36u7jcfasuFvA5PfRX6qt0eLvwDVBjVA4AZBJECazgDkd7qEIylhZBh8lYZAEZCvKJyldsKjsAL7ZCOv0Mw2mtq3YFS19k0xquiG5UuGxhRe9f2ZCnb71iwD7gv778TOiYESabkVOkfpQZDZD', pageToken);
    }

    @isTest static void testGetNewPageToken() {
        Token__c token = new Token__c();
        token.Value__c = 'djcbdbgfbfg';
        insert token;
        System.Test.setMock(HttpCalloutMock.class,
                new UserAccessTokenHttpCalloutMock());
        System.Test.setMock(HttpCalloutMock.class,
                new PageAccessTokenHttpCalloutMock());
        System.Test.startTest();
        FacebookController.getNewPageToken('AQC9y20PcGMVBPhczp80DCW-rMYewgRanKZDNGGrlc1A2CMMBvVdyyKJSNGyz7dv6_MzbyVcl9kWHZaPhc6fVeUjhC-g-yinkp7hXiY7wlb-gaCuRGmLsy3yCd1zAMaqD7aOM3xyboSGIWxUcRtspX0WQ9KiErBB5yKirb7BdGj_Dd9_Oz7BxKkD3wsBmLVukmRm0hijTV80KeSW2cQOithSsvT-cWW06Bfu4zv4k8WcaX9Crfr4KpWKJLktsHbI36JxGdh3AGL0aagT4pxLzubAFAyj7wPzPlhmZgSmgBRdBf3jzmyo-cy19IANH-D7MhHZZ-uohMJd-8dNThKdaG9U#_=_');
        System.Test.stopTest();
        Token__c tokenObject = [
                SELECT Value__c
                FROM Token__c
                LIMIT 1
        ];
        String pageToken = tokenObject.Value__c;
        System.assertEquals('EAAN47xnT3YUBANf98UURdVDecEf41ZAh36u7jcfasuFvA5PfRX6qt0eLvwDVBjVA4AZBJECazgDkd7qEIylhZBh8lYZAEZCvKJyldsKjsAL7ZCOv0Mw2mtq3YFS19k0xquiG5UuGxhRe9f2ZCnb71iwD7gv778TOiYESabkVOkfpQZDZD', pageToken);
    }
}