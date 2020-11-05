public class ToMulesoftGET {
    @AuraEnabled
    public static String[] sendToMulesoftGET(String name){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('http://verifyaccount3-zife.us-e2.cloudhub.io/Accounts?name=' + EncodingUtil.urlEncode(name, 'UTF-8'));
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        system.debug(request.getEndpoint());
        if (response.getStatusCode() == 200) {
            System.debug('Received the following: ' + String.valueOf(response.getBody()));
            if(String.valueOf(response.getBody()) == 'Not found') {
                return new String[]{'Not found'};
            } else {
                String[] output = String.valueOf(response.getBody()).split(';');
                return output;
            }
        }
        else {
            System.debug('Encountered the following error: ' + response.getStatusCode() + ' ' + response.getStatus() + ' ' + response.getBody());
            return new String[]{'Error encountered.'};
        }
    }
}