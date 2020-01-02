/**
 * Created by ADMIN on 08.11.2019.
 */

@isTest
global class JsonWithLikesHttpCalloutMock implements HttpCalloutMock{

    global HttpResponse respond(HttpRequest request) {
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json;charset=UTF-8');
        response.setBody('{"data":[{"id":"3391904224183676","name":"\u0418\u0432\u0430\u043d \u0428\u0443\u043b\u044c\u0446"},{"id":"2469281983126863","name":"Liza Khlystunova"},{"id":"111272053647759","name":"Test App"}],"paging":{"cursors":{"before":"QVFIUjJmZAUstdmZAHaHAxMzk4d3MwRFp5NnNnWjhMSzRnNU9FVEZA1NVkwZA1EtMEY0YUVydnRVNUlSMjdzei1sN0Y1Vnk1MzQ0Vk11bEpwYVRzbEFLMGdEYzFB","after":"QVFIUnZARVzFGSC1IcnBSQWNhenYxNVJ6QnZAVUnd5bEhjTEdJOWZACWG11S0ZAQbFBsRWVrcUJ5UHpFODhBWGpHSHJVei1oTngzUUhJUEJUWVI5WkRpNTJWTXp3"}}}');
        response.setStatusCode(200);
        return response;

    }
}