public class ToRob {
    public static void sendToMulesoftGET(String name){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('http://verifyaccount3-myff.us-e2.cloudhub.io/Accounts?name=' + EncodingUtil.urlEncode(name, 'UTF-8'));
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        system.debug(request.getEndpoint());
        if (response.getStatusCode() == 200) {
            System.debug('Received the following: ' + response.getBody() + ' ' + response.getHeader('Content-Length') + ' ' +
                         response.getStatusCode() + ' ' + response.getStatus());
        }
        else {
            System.debug('Encountered the following error: ' + response.getStatusCode() + ' ' + response.getStatus() + ' ' + response.getBody());
        }
    }
}