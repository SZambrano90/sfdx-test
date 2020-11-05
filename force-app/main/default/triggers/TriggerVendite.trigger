trigger TriggerVendite on Vendita__c (before insert)
{
    for(Vendita__c v : Trigger.new)
    {
        switch on v.Tipo_Prodotto__c
        {
            when 'Aspirapolvere con filo'
            {
                v.Dettagli_Assistenza__c = 'Per assistenza rivolgersi al numero 081 467 8889.';
                v.Dettagli_Ricambi__c = 'Per reperire pezzi di ricambio recarsi al negozio affiliato più vicino.';
                    
                system.debug('Vendita avvenuta a nome ' + v.Cognome_Acquirente__c + ' ' + v.Nome_Acquirente__c +
                                 (v.Num_Prodotti__c > 1 ? ', pz.' + v.Num_Prodotti__c + '.' : '.')
                            );
            }
            
            when 'Aspirapolvere senza filo'
            {
                v.Dettagli_Assistenza__c = 'Per assistenza rivolgersi al numero 334 78 69 009.';
                v.Dettagli_Ricambi__c = 'Per reperire pezzi di ricambio andare sul sito www.pezzidiricambio.wow .';
                    
                system.debug('Vendita avvenuta a nome ' + v.Cognome_Acquirente__c + ' ' + v.Nome_Acquirente__c +
                                 (v.Num_Prodotti__c > 1 ? ', pz.' + v.Num_Prodotti__c + '.' : '.')
                            );
            }
            
            when 'Ricambi'
            {
                v.Dettagli_Ricambi__c = 'Ricambio generico per tutti i tipi di aspirapolvere.';
                    
                system.debug('Vendita avvenuta a nome ' + v.Cognome_Acquirente__c + ' ' + v.Nome_Acquirente__c + '.');
            }
            
            when 'Assistenza'
            {
                v.Dettagli_Ricambi__c = 'Ricambio generico per tutti i tipi di aspirapolvere.';
                    
                system.debug('Vendita avvenuta a nome ' + v.Cognome_Acquirente__c + ' ' + v.Nome_Acquirente__c + '.');
            }
        }
    }
}