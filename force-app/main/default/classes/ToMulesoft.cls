public class ToMulesoft {
    public static void sendToMulesoft(String name){
        //Account lst = [SELECT Name, Description, Phone FROM Account WHERE Name = :name LIMIT 1];
        //String payload = JSON.serialize(lst);
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        
        request.setEndpoint('http://verifyaccount2-gsxw.us-e2.cloudhub.io/Accounts');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        request.setBody('{"name": "' + name +'"}');
        system.debug(request.getHeader('Content-Type') + ' ' + request.getBody());
        
        HttpResponse response = http.send(request);
        
        if (response.getStatusCode() != 201) {
    		System.debug('The status code returned was not expected: ' +
        		response.getStatusCode() + ' ' + response.getStatus() + ' ' + response.getBody());
		} else {
    		System.debug(response.getBody());
		}
    }
}