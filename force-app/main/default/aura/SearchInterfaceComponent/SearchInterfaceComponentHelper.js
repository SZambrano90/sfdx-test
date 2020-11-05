({
    showAccounts : function(component, event) {
        var action = component.get("c.sendToMulesoftGET");
        if(component.get("v.AccountName") == null){
            alert("Please insert a term to search for.")
        } else {
            action.setParams({"name": component.get("v.AccountName")});
            action.setCallback(this, function(response) {
                if(response.getState() === "SUCCESS"){
                    var results = response.getReturnValue();
                    if(results != undefined && results != null){
                        component.set("v.Results", results);
                    } else {
                        alert("Result is null");
                    }
                } else {
                    alert("Error receiving data. Retry.")
                }
            });
            $A.enqueueAction(action);
        }
    }
})