global class BatchVendite implements Database.batchable<Sobject>
{
    global String[] email = new String[]{'zambranostefano90@gmail.com'};
        
    global Database.QueryLocator start (Database.BatchableContext BC)
    {
        return Database.getQueryLocator('SELECT Id, Data_Vendita__c, Dettagli_Assistenza__c, Dettagli_Ricambi__c, Tipo_Prodotto__c FROM Vendita__c');
    }
    
    global void execute (Database.BatchableContext BC, List<Sobject> scope)
    {
        List<Vendita__c> listVendita = new List<Vendita__c>();
        List<Vendita__c> updatedListVendita = new List<Vendita__c>();
        
        for(Sobject objScope : scope)
        {
            Vendita__c v = (Vendita__c) objScope;
            system.debug(v);
            
            v.Data_Vendita__c = date.today();
            
            if(v.Tipo_Prodotto__c.equals('Aspirapolvere con filo'))
            {
                v.Dettagli_Assistenza__c = 'Nuovo numero per l\'assistenza 081 444 588 50';
                v.Dettagli_Ricambi__c = 'Per reperire pezzi di ricambio andare su www.nuovositoricambi.com';
            }
            
            if(v.Tipo_Prodotto__c.equals('Aspirapolvere senza filo'))
            {
                v.Dettagli_Assistenza__c = 'Nuovo numero per l\'assistenza 333 333 333 33';
                v.Dettagli_Ricambi__c = 'Per reperire pezzi di ricambio andare su www.nuovositoricambi.com';
            }
            
            updatedListVendita.add(v);
        }
        
        if(updatedListVendita != null && updatedListVendita.size() > 0)
        {
            Database.update(updatedListVendita);
            system.debug('Update list size: ' + updatedListVendita.size());
        }
    }
    
    global void finish (Database.BatchableContext BC)
    {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        
        AsyncApexJob a = [Select a.TotalJobItems, a.Status, a.NumberOfErrors, a.JobType,
                          a.JobItemsProcessed,a.ExtendedStatus, a.CreatedById, a.CompletedDate
                          FROM AsyncApexJob a
                          WHERE id = :BC.getJobId()];
        
        system.debug('JobId is: ' + BC.getJobId());
        
        mail.setToAddresses(email);
        mail.setReplyTo('zambranostefano90@gmail.com');
        mail.setSenderDisplayName('Apex Batch Processing Module by Stefano');
        mail.setSubject('Batch processing: ' + a.Status);
        mail.setPlainTextBody('The Batch Apex job processed ' + a.TotalJobItems + ' items, with ' + a.NumberOfErrors + ' failures. Items processed were: ' + a.JobItemsProcessed);
        
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
    }
}