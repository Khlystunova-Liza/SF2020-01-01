/**
 * Created by vitek on 03.09.2019.
 */

({
    handleSaveContact: function(component, event, helper) {
        component.set("v.Contact.AccountId", component.get("v.AccountId"));
        component.find("contactRecordCreator").get("e.recordSave").fire();
        var appEvent = $A.get("e.c:CTContactCreationEvent").setParams({
            'message' : 'Contact successfully upserted',
            'title' : 'Success'
        }).fire();
        component.destroy();
    },
    closePopup : function(component, event, helper) {
        component.destroy();
    }
});