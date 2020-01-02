/**
 * Created by ADMIN on 23.10.2019.
 */

({
    //функция которая идет в серверный контроллер,
    //получает лист акаунтов и кладет его в атрибут компоненты
    init : function(component) {
        var action = component.get("c.getAuthorsList");//вызываем метод Apex контроллера getAccList
        //setCallback - эта функция начнет выполнение после того, как функция  $A.enqueueAction(action)
        //его завершит
        //Коллбэки же позволяют нам быть уверенными в том,
        // что определенный код не начнет исполнение до того момента,
        // пока другой код не завершит исполнение.
        action.setCallback(this,function(response){
            var state = response.getState();
            console.log(state);
            //check if result is successfull
            if(state == "SUCCESS"){
                console.log('a.getReturnValue', response.getReturnValue());
                //лист аккаунтов,который вернул контроллер Apex, кладем в атрибут нашей компоненты,
                //для того чтобы дальше можно было его использовать(выводить) в нашей компоненте.
                component.set("v.AuthorsList", response.getReturnValue());
            } else if(state == "ERROR"){
                alert('Error in calling server side action');
            }
        });
        //функция которая вызывает метод серверного контроллера
        //и возвращает результат, в котором содержится наш
        //нам нет смысла вызывать функцию function(result), пока мы не получим лист аккаунтов.
        $A.enqueueAction(action);
    },

    editBook : function(component, book) {

        $A.createComponent(
            "c:CTBookEdit",
            {
                'Book__c' : book
            },
            function(newComponent, status, errorMessage){
                console.log('status:', status);
                if (status === "SUCCESS") {
                    var body = component.find("CTBookEdit");
                    console.log(body);
                    body.set("v.body", newComponent);
                }
                else if (status === "INCOMPLETE") {
                    console.log("No response from server or client is offline.")
                }
                else if (status === "ERROR") {
                    console.log("Error: " + errorMessage);
                }
            }
        );
    },
});