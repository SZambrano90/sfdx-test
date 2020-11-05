({
    init : function(component, event) {
        //qui va il codice da eseguire al caricamento iniziale della pagina
        var action = component.get("c.getContacts");
        action.setParams({  page : component.get("v.pagina")  });
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state == 'SUCCESS'){
                alert('Sto per mostrare i contatti!!!!!');
                var risultatiContatti = response.getReturnValue();
                component.set('v.listaContatti', risultatiContatti);
            } else {
                alert('Sono andato in errore. L\'errore proviene da APEX!!!! ');
            }
        });
        $A.enqueueAction(action);
    },
    
	faiCambiaNome1 : function(component, event) {
        var nome = component.get("v.inserisciNome");
        if(nome == null || nome == ''){
            alert('il nome inserito non è valido');
        }else{
            alert('Attenzione!!! Sto per cambiare il nome in ' + nome);
            component.set('v.nomeUtente', nome);
            component.set('v.inserisciNome', null);
        }
       
    },
    
    faiCambioPagina : function(component, event) {
        var pagina = component.get("v.inserisciPagina");
        if(pagina == null || pagina == ''){
            alert('Pagina non valida.');
        }else{
            alert('Attenzione!!! Sto per cambiare pagina a ' + pagina);
            component.set('v.pagina', pagina);
        }
       
    },
    
    initPages : function(component, event) {
        //Initializes the number of contacts.
        var action = component.get("c.getNumberOfContacts");
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state == 'SUCCESS'){
                var numberOfContacts = response.getReturnValue();
                component.set('v.numberOfContacts', numberOfContacts);
            } else {
                alert('Sono andato in errore. L\'errore proviene da APEX!!!! ');
            }
        });
        $A.enqueueAction(action);
    },
    
    doInsertContact : function(component, event) {
        //qui va il codice da eseguire al caricamento iniziale della pagina
        var FirstName = component.get("v.inserisciName");
        component.set('v.nameInserting', FirstName);
        var LastName = component.get("v.inserisciSurname");
        component.set('v.surnameInserting', LastName);
        var action = component.get("c.insertContacts");
        action.setParams({  nome : component.get("v.nameInserting"),
                          	cognome : component.get("v.surnameInserting")  });
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state == 'SUCCESS'){
                alert('Contatto inserito.');
            } else {
                alert('Sono andato in errore. L\'errore proviene da APEX!!!! ');
            }
        });
        $A.enqueueAction(action);
    }
})