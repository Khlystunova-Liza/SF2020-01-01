/**
 * Created by ADMIN on 12.11.2019.
 */

@isTest
global class PageAccessTokenHttpCalloutMock implements HttpCalloutMock {

    global HttpResponse respond(HttpRequest request) {
        HttpResponse response = new HttpResponse();
        response.setBody('{"data":[{"access_token":"EAAN47xnT3YUBANf98UURdVDecEf41ZAh36u7jcfasuFvA5PfRX6qt0eLvwDVBjVA4AZBJECazgDkd7qEIylhZBh8lYZAEZCvKJyldsKjsAL7ZCOv0Mw2mtq3YFS19k0xquiG5UuGxhRe9f2ZCnb71iwD7gv778TOiYESabkVOkfpQZDZD","category":"News and media website","category_list":[{"id":"2709","name":"News and media website"}],"name":"Test App","id":"111272053647759","tasks":["ANALYZE","ADVERTISE","MODERATE","CREATE_CONTENT","MANAGE"]}],"paging":{"cursors":{"before":"MTExMjcyMDUzNjQ3NzU5","after":"MTExMjcyMDUzNjQ3NzU5"}}}');
        response.setStatusCode(200);
        return response;
    }

}