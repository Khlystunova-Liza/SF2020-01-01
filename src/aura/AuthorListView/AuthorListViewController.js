/**
 * Created by ADMIN on 23.10.2019.
 */

({
    doInit : function(component, event, helper) {
        helper.init(component);
    },

    editBook : function(component, event, helper) {
        var book = event.getSource().get('v.value');
        console.log('book', book);
        if (book) {
            helper.editBook(component, book);
        }
    },
});