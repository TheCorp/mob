package com.mob.view.action.employer;

import java.util.List;

import com.mob.model.employer.Opportunity;
import com.mob.services.OpportunityService;
import com.mob.util.MOBLogger;

public class AllEmployeeProfilesViewedOpportunityAction {
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(AllEmployeeProfilesViewedOpportunityAction.class);

	private Opportunity opportunity;
	private OpportunityService opportunityService;
	private List listOfAllEmployeesProfiles;
	
	public String allEmployeeProfiles(){
		LOGGER.info("allEmployeeProfiles()");

		//listOfAllEmployeesProfiles=opportunityService.findAllEmployeeProfiles(opportunity.getId());
		LOGGER.info("list size:"+listOfAllEmployeesProfiles.size());
		
		
		return "success";
	}

}
