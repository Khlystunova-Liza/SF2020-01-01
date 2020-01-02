/**
 * Created by ADMIN on 22.10.2019.
 */

trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {

    ClosedOpportunityService.addTask(Trigger.new);
}