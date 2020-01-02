/**
 * Created by ADMIN on 25.10.2019.
 */

({
    saveBook: function(component, event, helper) {
        component.find("bookRecordCreator").get("e.recordSave").fire();
        component.destroy();
    },
    closeComponent : function(component, event, helper) {
        component.destroy();
    }
});