/**
 * Created by ADMIN on 06.11.2019.
 */

({
    createContactsByLikes: function (component, helper, event) {
      var action = component.get('c.createContacts');
        action.setParams({
            'contactList': component.get('v.contacts')
        });
        action.setCallback(this, function (response) {
            var state = response.getState();
            if (state === 'SUCCESS') {
                if (response.getReturnValue()) {
                    var toastEvent = $A.get('e.force:showToast');
                    toastEvent.setParams({
                        'title': 'Contacts successfully created!',
                        'message': 'Contacts successfully created!',
                        'type': 'Success'
                    });
                    toastEvent.fire();
                    console.log('into helper createcom');
                    var body = component.find('FacebookIntegration');
                    $A.createComponent(
                        'c:FacebookIntegration',
                        {},
                        function (newComponent, status, errorMessage) {
                            if (status === 'SUCCESS') {
                                body.set('v.body', newComponent);
                            } else if (status === 'INCOMPLETE') {
                                console.log('No response from server or client is offline.')
                            } else if (status === 'ERROR') {
                                console.log('Error: ' + errorMessage);
                            }
                        }
                    );
                } else {
                    var toastEvent = $A.get('e.force:showToast');
                    toastEvent.setParams({
                        'title': 'This post don\'t have likes',
                        'message': 'This post don\'t have likes',
                        'type': 'Error'
                    });
                    toastEvent.fire();
                    console.log('into helper createcom');
                    var body = component.find('FacebookIntegration');
                    $A.createComponent(
                        'c:FacebookIntegration',
                        {},
                        function (newComponent, status, errorMessage) {
                            if (status === 'SUCCESS') {
                                body.set('v.body', newComponent);
                            } else if (status === 'INCOMPLETE') {
                                console.log('No response from server or client is offline.')
                            } else if (status === 'ERROR') {
                                console.log('Error: ' + errorMessage);
                            }
                        }
                    );
                }
            } else if (state === 'INCOMPLETE') {
                console.log('state = INCOMPLETE');
            } else if (state === 'ERROR') {
                console.log('state = ERROR');
            }
        });
        $A.enqueueAction(action);
    }
});