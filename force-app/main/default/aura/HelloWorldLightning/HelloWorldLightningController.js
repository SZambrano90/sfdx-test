({
	doInit : function(component, event, helper) {
        debugger;
        helper.init(component, event);
        helper.initPages(component, event);
    },
    
    cambiaNome1 : function(component, event, helper) {
        helper.faiCambiaNome1(component, event);
    },
    
    cambioPagina : function(component, event, helper) {
        helper.faiCambioPagina(component, event);
        helper.init(component, event);
    },
    
    insertContact : function(component, event, helper) {
        debugger;
        helper.doInsertContact(component, event);
        helper.initPages(component, event);
    }
})