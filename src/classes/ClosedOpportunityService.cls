/**
 * Created by ADMIN on 22.10.2019.
 */

public with sharing class ClosedOpportunityService {

    public static void addTask(List<Opportunity>opportunities){

        List<Task>tasks = new List<Task>();
       for(Opportunity opportunity:opportunities){
           if(opportunity.StageName.equals('Closed Won'))
           {
               Task tas = new Task(Subject='Follow Up Test Task');
               tasks.add(tas);
           }
       }
        insert tasks;

    }

}