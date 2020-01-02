/**
 * Created by ADMIN on 04.11.2019.
 */

({
    getLikes: function (component, event, helper) {
        var validPostId = component.find('inputPostId').get('v.validity').valid;
        if (validPostId) {
            var postId = component.get('v.postID');
            var url = window.location.href;
            helper.getTableWithLikes(component, postId, url);
        }
    }
});