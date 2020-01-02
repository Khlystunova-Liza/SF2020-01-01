/**
 * Created by ADMIN on 26.10.2019.
 */

({
    checkContact:function(component, event, helper) {

        var login = component.find("inputEmail").get("v.value");
        var password = component.find("inputPassword").get("v.value");
        console.log("Input password: " + password);
        console.log("Input login: " + login);

        helper.checkContactAndFireEvent(component, login, password);

    }
});