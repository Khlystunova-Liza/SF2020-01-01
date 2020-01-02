/**
 * Created by ADMIN on 26.10.2019.
 */

({
    checkContactAndFireEvent:function (component, login, password) {
        var action = component.get("c.getContact");
        action.setParams({
            'login': login,
            'password': password
        });

        action.setCallback(this, function(response){
            var state = response.getState();
            var cont = response.getReturnValue();
            console.log("response " + JSON.stringify(cont));
            console.log("into anon function " + state);
            if(state === "SUCCESS") {
                if(cont !== null) {
                    console.log("contact : " + JSON.stringify(cont));

                    var appEvent =$A.get("e.c:PassContactEvent");
                    console.log("appEvent : " + appEvent);
                    appEvent.setParams({
                        "contact": cont
                    });
                    appEvent.fire();

                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        "title": "Welcome to the Footwear shop!",
                        "message": "Welcome to the Footwear shop!",
                        "type":"Success"
                    });
                    toastEvent.fire();

                    var destroyEvent = $A.get("e.c:DestroyParentComponent");
                    destroyEvent.fire();
                    console.log("destroyEvent : " + destroyEvent);

                    component.destroy();

                }else{
                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        "title": "wrong login or password",
                        "message": "wrong login or password",
                        "type":"ERROR"
                    });
                    toastEvent.fire();
                }

            }else if(state === "INCOMPLETE"){
                console.log("state = INCOMPLETE" );
            }else if (state === "ERROR"){
                console.log("state = ERROR" );
            }
        });
        $A.enqueueAction(action);
    }
});