/**
 * Created by ADMIN on 02.11.2019.
 */


//2-post id 111275350314096
//post id second post id  113562946752003

public with sharing class FacebookController {

    @AuraEnabled
    public static List<Contact> getContactList(String code, String postId) {
        Credentials__c credentials = Credentials__c.getOrgDefaults();
        String pageToken = credentials.Page_Access_Tocken__c;
        String facebookAppId = credentials.FacebookAppId__c;
        String endPoint = 'https://graph.facebook.com/v5.0/'+ facebookAppId + '_' + postId + '/Likes?access_token=' + pageToken;
        System.debug('endpoint ' + endPoint);
        String response = makeRequest(endPoint, 'GET');
        System.debug('response  = ' + response);
        if (response.equals('190')){
            getNewPageToken(code);
            return null;
        }
        List<Contact> contactList = parseJsonWithContacts(response);
        return contactList;
    }

    public static void getNewPageToken(String code) {
        String userToken = getFacebookUserAccessToken(code);
        String pageToken = getFacebookPageAccessToken(userToken);
        System.debug('pageToken in getPageToken');
        savePageToken(pageToken);
    }
    @future
    public static void savePageToken(String pageToken) {
        Credentials__c credentials = Credentials__c.getOrgDefaults();
        credentials.Page_Access_Tocken__c = pageToken;
        update credentials;
    }
    @AuraEnabled
    public static Boolean createContacts(List<Contact> contactList) {
        Database.insert(contactList, false);
        System.debug('new contact = ' + contactList);
        return !contactList.isEmpty();
    }
    
    @TestVisible
    private static String getFacebookUserAccessToken(String code) {
        String userToken = null;
        Credentials__c credentials = Credentials__c.getOrgDefaults();
        String appId = credentials.AppId__c;
        String appSecret = credentials.AppSecret__c;
        String endPoint = 'https://graph.facebook.com/v2.11/oauth/access_token?client_id=' + appId + '&redirect_uri=https://lisakhlystunova-dev-ed.lightning.force.com/lightning/n/Facebook_integration_page' + '&client_secret=' + appSecret + '&code=' + code;
        System.debug('Code: ' + code);
        System.debug('Endpoint: ' + endPoint);
        String response = makeRequest(endPoint, 'POST');
        System.debug('Response userAccessToken: ' + response);
        userToken = parseResponse('access_token', String.valueOf(response));
        System.debug('User token: ' + userToken);
        return userToken;
    }
    @TestVisible
    private static String getFacebookPageAccessToken(String userToken) {
        String endPoint = 'https://graph.facebook.com/me/accounts?access_token=' + userToken;
        String response = makeRequest(endPoint, 'GET');
        System.debug('Response pageAccessToken: ' + response);
        String pageAccessToken = parseResponse('access_token', String.valueOf(response));
        System.debug('Page Token = ' + pageAccessToken);
        return pageAccessToken;
    }

    private static String parseResponse(String fieldName, String responseBodyToParse) {
        System.debug('responseBodyToParse ' + responseBodyToParse);
        if(responseBodyToParse==null){
            responseBodyToParse = '';
        }
        JSONParser parser = JSON.createParser(responseBodyToParse);
        String valueToReturn = '';
        while (parser.nextToken() != null) {
            if ((parser.getCurrentToken() == System.JSONToken.FIELD_NAME) &&
                    (parser.getText() == fieldName)) {
                parser.nextToken();
                valueToReturn = parser.getText();
            }
        }
        return valueToReturn;
    }
    @TestVisible
    private static List<Contact> parseJsonWithContacts(String json) {
        List<Contact> contactList = new List<Contact>();
        JSON2ApexGenerator jsonApex = (JSON2ApexGenerator) JSON2ApexGenerator.parse(json);
        for (Integer i = 0; i < jsonApex.data.size(); i++) {
            Contact contact = new Contact();
            contact.FacebookId__c = jsonApex.data[i].id;
            contact.LastName = jsonApex.data[i].name;
            contact.Login__c = 'facebook' + i + '@mail.com';
            System.debug('jsonApex.data[i].id = ' + jsonApex.data[i].id);
            System.debug('jsonApex.data[i].name = ' + jsonApex.data[i].name);
            contactList.add(contact);
        }
        return contactList;
    }
    @TestVisible
    private static String makeRequest(String endPoint, String typeOfMethod) {
        String response;
        try {
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint(endPoint);
            request.setMethod(typeOfMethod);
            HttpResponse res = http.send(request);
            String code = parseResponse('code', String.valueOf(res.getBody()));
            if(code.equals('190')){
                System.debug('code in makeRequest = '+ code);
                return '190';
            }
            System.debug('res.getStatusCode() ' + res.getStatusCode());
            res = http.send(request);
            response = res.getBody();
        } catch (Exception e) {
            System.debug('Integration Settings Exception: ' + e.getStackTraceString());
        }
        return response;
    }
}