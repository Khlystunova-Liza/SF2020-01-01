/**
 * Created by vitek on 03.09.2019.
 */

({
    viewContactDetails : function(component, cont) {
        $A.createComponent(
            "c:CTContactUpsert",
            {
                'Contact' : cont,
                'AccountId' : component.get("v.Account").Id
            },
            function(newComponent, status, errorMessage){
                console.log('status:', status);
                if (status === "SUCCESS") {
                    var body = component.find("CTContactUpsert");
                    body.set("v.body", newComponent);
                }
                else if (status === "INCOMPLETE") {
                    console.log("No response from server or client is offline.")
                }
                else if (status === "ERROR") {
                    console.log("Error: " + errorMessage);
                }
            }
        );
    },
    getAccWithContacts : function(component) {
        var action = component.get("c.getAccWithContacts");
        action.setParams({
            accId : component.get("v.Account").Id
        });
        action.setCallback(this,function(a){
            var state = a.getState();
            console.log(state);
            //check if result is successfull
            if(state == "SUCCESS"){
                var acc = a.getReturnValue();
                if (!acc || (acc != undefined && acc != null && (acc.Contacts == undefined || acc.Contacts.size == 0))) {
                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        "title": "No Contacts Found",
                        "message": "No Contacts Found For That Account"
                    });
                    toastEvent.fire();
                    component.destroy();
                } else {
                    component.set("v.Account", acc);
                }
            } else if(state == "ERROR"){
                alert('Error in calling server side action');
            }
        });
        $A.enqueueAction(action);
    }
});