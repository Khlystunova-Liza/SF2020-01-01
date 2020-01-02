/**
 * Created by ADMIN on 26.10.2019.
 */

({
    createContactAndFireEvent: function(component, newContact) {
        console.log("into createContactAndFireEvent " );
        var action = component.get("c.saveContact");
        action.setParams({
            "con": newContact
        });
        action.setCallback(this, function(response){

            var state = response.getState();
            console.log("into anon function " + state);

            if(state === "SUCCESS") {
                console.log("into if state success" );

                if(response.getReturnValue() !== null) {

                    console.log("into if not null " + state);

                    console.log("newContact : " + JSON.stringify(newContact));
                    var appEvent = $A.get("e.c:PassContactEvent");
                    console.log("appEvent : " + appEvent);
                    appEvent.setParams({
                        "contact": newContact
                    });
                    appEvent.fire();

                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        "title": "Welcome to the Footwear shop!",
                        "message": "Welcome to the Footwear shop!",
                        "type":"Success"
                    });
                    toastEvent.fire();

                    var con = response.getReturnValue();
                    console.log("method saveContact return : " + JSON.stringify(con));

                    var destroyEvent = $A.get("e.c:DestroyParentComponent");
                    destroyEvent.fire();
                    console.log("destroyEvent : " + destroyEvent);

                    component.destroy();

                }else{
                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        "title": "user is already registered",
                        "message": "user with this email is already registered. Please, go to the login.",
                        "type":"ERROR"
                    });
                    toastEvent.fire();
                }

            }else if(state === "INCOMPLETE"){
                console.log("state = INCOMPLETE" );
            }
        });
        $A.enqueueAction(action);
    }
});