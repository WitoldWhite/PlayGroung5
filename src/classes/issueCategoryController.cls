/**
 * Created by Witold on 27.10.2019.
 */

public with sharing class issueCategoryController {

    @AuraEnabled
    public static List<RepairAction__c> getRepairActions(){
        return [SELECT Id, Name, Category__c FROM RepairAction__c];
    }

}