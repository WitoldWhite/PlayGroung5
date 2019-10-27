/**
 * Created by Witold on 25.10.2019.
 */

public  class RepairServiceHandler {

    public static void beforeUpdate(List<RepairService__c> repairServices){
        RepairService repairService = new RepairService();
        repairService.fillCurrentDate(repairServices);
    }
    public static void beforeUpdate(List<RepairService__c> repairServices, Map<Id,RepairService__c> oldRepairServices){
        RepairService repairService = new RepairService();
        repairService.updateLastDate(repairServices, oldRepairServices);
    }

}