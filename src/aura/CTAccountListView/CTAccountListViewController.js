/**
 * Created by vitek on 03.09.2019.
 */

({
    doInit : function(component, event, helper) {
        helper.init(component);
    },
    viewContactDetails : function(component, event, helper) {
        var acc = event.getSource().get('v.value');
        console.log('acc', acc);
        if (acc) {
            helper.viewContactDetails(component, acc);
        }
    },
});