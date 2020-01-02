/**
 * Created by vitek on 03.09.2019.
 */

({
    doInit : function(component, event, helper) {
        helper.getAccWithContacts(component);
    },
    editContact : function(component, event, helper) {
        helper.viewContactDetails(component, event.getSource().get('v.value'));
    },
    addNewContact : function(component, event, helper) {
        helper.viewContactDetails(component, null);
    },
    closePopup : function(component, event, helper) {
        component.destroy();
    },
    showToast : function(component, event, helper) {
        helper.getAccWithContacts(component);
        var resultsToast = $A.get("e.force:showToast");
        resultsToast.setParams({
            "title": event.getParam('title'),
            "message": event.getParam('message')
        });
        resultsToast.fire();
    }
});