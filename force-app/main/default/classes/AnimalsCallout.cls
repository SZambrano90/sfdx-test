public class AnimalsCallout
{
	public static HttpResponse makeGETCallout()
    {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        system.debug(response);
        system.debug(response.getStatusCode());
        if(response.getStatusCode() == 200)
        {
            Map<String, Object> result = (Map<String, Object>) json.deserializeUntyped(response.getBody());
            List<Object> animals = (List<Object>) result.get('animals');
            for(Object o : animals)
            {
                system.debug(o);
            }
        }
        
        return response;
    }
    
    public static HttpResponse makePOSTCallout()
    {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody('{"name":"mighty moose"}');
        HttpResponse response = http.send(request);
        
        system.debug(response);
        system.debug(response.getStatusCode());
        
        if(response.getStatusCode() == 201)
        {
            system.debug(response.getBody());
    	}
        else
        {
            system.debug(response.getStatus());
            system.debug(response.getStatusCode());
        }
        
        return response;
	}
}