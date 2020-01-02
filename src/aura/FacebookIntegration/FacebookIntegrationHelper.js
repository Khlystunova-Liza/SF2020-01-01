/**
 * Created by ADMIN on 04.11.2019.
 */

({
    getTableWithLikes: function (component, postId, url) {
        var code = this.getParameterByName('code', url);
        var action = component.get('c.getContactList');
        action.setParams({
            'code': code,
            'postId': postId
        });
        action.setCallback(this, function (response) {
            var state = response.getState();
            console.log( state);
            if (state === 'SUCCESS') {
                var contacts = response.getReturnValue();
                if (response.getReturnValue() != null) {
                    component.set('v.contacts', contacts);
                    var toastEvent = $A.get('e.force:showToast');
                    toastEvent.setParams({
                        'title': 'likes received',
                        'message': 'likes received',
                        'type': 'Success'
                    });
                    toastEvent.fire();
                    this.createFacebookLikes(component);
                }else{      
                      this.loginInFacebook(component);
                }
            } else if(state==='ERROR'){
                 var toastEvent = $A.get('e.force:showToast');
                       toastEvent.setParams({
                      'title': 'post not found',
                      'message': 'post not found',
                      'type': 'ERROR'
                      });
                      toastEvent.fire(); 
            }
        });
        $A.enqueueAction(action);
    },

    getParameterByName: function (name, url) {
        if (!url) url = window.location.href;
        name = name.replace(/[\[\]]/g, "\\$&");
        var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
            results = regex.exec(url);
        if (!results) return null;
        if (!results[2]) return '';
        return decodeURIComponent(results[2].replace(/\+/g, " "));
    },

    createFacebookLikes: function (component) {
        var body = component.find('FacebookLikes');
        $A.createComponent(
            'c:FacebookLikes',
            {
                'contacts': component.get('v.contacts')
            },
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
    },

    loginInFacebook: function (component) {
        window.location.href = 'https://www.facebook.com/v2.11/dialog/oauth?client_id=977393255964037&redirect_uri=https://lisakhlystunova-dev-ed.lightning.force.com/lightning/n/Facebook_integration_page';
    },
});