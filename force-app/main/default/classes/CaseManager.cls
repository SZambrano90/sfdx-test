@RestResource(urlMapping='/Cases/*')
global with sharing class CaseManager 
{
   
    @HttpGet
    global static Case getCaseById()
    {
        RestRequest request = RestContext.request;
        String caseId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        Case result = [SELECT Id, CaseNumber, Subject, Status, Priority
                       FROM Case
                       WHERE Id =: caseId];
        return result;
    }
   
    @HttpPost
    global static ID createCase(String subject, String status, String origin, String priority)
    {
       
        Case caseToCreate = new Case(Subject = subject,
                                     Status = status,
                                     Origin = origin,
                                     Priority = priority);
        insert caseToCreate;
        return caseToCreate.Id;
    }
   
    @HttpDelete
    global static void deleteCase()
    {
        RestRequest request = RestContext.request;
        String caseId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        Case caseToDelete = [SELECT Id
                             FROM Case
                             WHERE Id =: caseId];
        delete caseToDelete;      
    }
   
    @HttpPut
    global static ID upsertCase (String subject, String status, String origin, String priority, String Id)
    {
        Case caseToUpsert = new Case(Id = Id,
                                     Subject = subject,
                                     Status = status,
                                     Origin = origin,
                                     Priority = priority);
        upsert caseToUpsert;
        return caseToUpsert.Id;
    }
    
    @HttpPatch
    global static ID updateCase()
    {
        RestRequest request = RestContext.request;
        String caseId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        Case caseToPatch = [SELECT Id
                             FROM Case
                             WHERE Id =: caseId];
        Map<String, object> params = (Map<String, object>) json.deserializeUntyped(request.requestBody.toString());
        for(String fieldName : params.keySet())
        {
            caseToPatch.put(fieldName, params.get(fieldName));
        }
        update caseToPatch;
        
        return caseToPatch.Id;
    }
}