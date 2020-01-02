/**
 * Created by ADMIN on 25.10.2019.
 */

({
    destroyComponent: function(component) {
        console.log('into destroyComponent');
        component.destroy();

    },

    createSignUpComponent: function(component) {

        $A.createComponent(
            "c:SignUp",
            {},
            function(newComponent, status, errorMessage){
                console.log('status:', status);
                if (status === "SUCCESS") {
                    var body = component.find("ChildComponent");
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

    createLogInComponent: function(component) {

        $A.createComponent(
            "c:LogIn",
            {},
            function(newComponent, status, errorMessage){
                console.log('status:', status);
                if (status === "SUCCESS") {
                    var body = component.find("ChildComponent");
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

});