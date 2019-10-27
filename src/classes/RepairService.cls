/**
 * Created by Witold on 25.10.2019.
 */

public class RepairService {

    public void fillCurrentDate(List<RepairService__c> repairServices) {
        for (RepairService__c repairService : repairServices) {
            if (repairService.Status__c == 'Finished') {
                repairService.Service_End_Date__c = system.today();
                emailSender(repairServices);
            }
        }
    }

    public void emailSender(List<RepairService__c> repairServices) {
        //Send email about finished
        for (RepairService__c co : repairServices) {
            ClientVehicle__c po = [SELECT Id, Name, Client__r.Email FROM ClientVehicle__c WHERE Id = :co.ClientVehicle__c];
            List<RepairService__c> l_co = [SELECT Id, Name FROM RepairService__c WHERE ClientVehicle__c = :po.Id];
            for (RepairService__c am_co : l_co) {
                String email = String.valueOf(po.Client__r.Email);
                //SINGLE_EMAIL_LIMIT_EXCEEDED ((((((
                // new EmailService().sendMail(email, 'CAR SERVICE', 'Your car is ready');
            }
        }
    }

    public void updateLastDate(List<RepairService__c> repairServices, Map<Id, RepairService__c> oldRepairServices) {

        Map<Id, ClientVehicle__c> mapParent = new Map<Id, ClientVehicle__c>();
        for (RepairService__c repairService : repairServices) {
            if (repairService.Status__c != oldRepairServices.get(repairService.Id).Status__c && repairService.Status__c == 'Finished' && repairService.ClientVehicle__c != null) {
                mapParent.put(repairService.ClientVehicle__c,
                        new ClientVehicle__c(Id = repairService.ClientVehicle__c, Last_Service_Date__c = System.Today()));
                System.Debug('ID added to list ' + repairService.Id);
            }
        }
        if (!mapParent.isEmpty()) {
            update mapParent.values();

        }

    }
}





