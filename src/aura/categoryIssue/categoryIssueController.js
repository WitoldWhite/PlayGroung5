/**
 * Created by Witold on 27.10.2019.
 */

({

    doInit: function (component, event, helper) {
        let action = component.get("c.getRepairActions");
        action.setCallback(this, function (response) {
            let state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.RepaiActions", response.getReturnValue());
            } else {
                console.log("Failed with state: " + state);
            }
        });
        $A.enqueueAction(action);

    },

    onChange: function (cmp, evt, helper) {
        alert(cmp.find('select').get('v.value') + ' pie is good.');
    },

});