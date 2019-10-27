trigger RepairServiceTrigger on RepairService__c (before insert, after insert, before update, after update, before delete, after delete) {

    if (Trigger.isUpdate) {
        if (Trigger.isBefore) {
            RepairServiceHandler.beforeUpdate(Trigger.new);
            RepairServiceHandler.beforeUpdate(Trigger.new, Trigger.oldMap);

        }

    }
}