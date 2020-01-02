/**
 * Created by ADMIN on 12.11.2019.
 */


@isTest
global class UserAccessTokenHttpCalloutMock implements HttpCalloutMock {

    global HttpResponse respond(HttpRequest request) {
        HttpResponse response = new HttpResponse();
        response.setBody('{"access_token": "EAAN47xnT3YUBAOYiYx6HaTVVgmds0DSvUCXAqPSlzN5yKIQsbQben1n9JMPg8OdDenIiZAeTSQZAeOYtXdfhAMp7SkIY5LEcUPlHLtC3YP1UlJuDcXEZAI5gcsyKaLL15ZCvpMwHPSckw0mCZCODXBfKAnHlYaoSZBZBLHdIr1kwQZDZD","token_type": "bearer"}');
        response.setStatusCode(200);
        return response;
    }

}