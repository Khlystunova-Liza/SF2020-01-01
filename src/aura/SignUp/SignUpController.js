/**
 * Created by ADMIN on 25.10.2019.
 */

({
    saveContactAndFireEvent:function(component, event, helper) {

        var validContact = component.find('inputContact').reduce(function (validSoFar, inputCmp) {
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        if(validContact){
            var newContact = component.get("v.newContact");
            console.log("Create contact: " + JSON.stringify(newContact));
            helper.createContactAndFireEvent(component, newContact);
            console.log("after createContact");
        }

    },

});