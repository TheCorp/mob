package com.mob.view.action.employer;

import java.util.List;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.employer.Employer;
import com.mob.model.employer.Opportunity;
import com.mob.services.BaseService;
import com.mob.services.OpportunityService;
import com.mob.util.MOBLogger;

public class ViewBookMarkedEmployeeProfilesAction {
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(ViewBookMarkedEmployeeProfilesAction.class);

	private Opportunity opportunity=new Opportunity();
	private OpportunityService opportunityService;
	private List listOfBookMarkedEmployeesProfiles;
	private Employer employer;
	
	private BaseService<Opportunity> opportunityBaseService;
	
	public String bookMarkedEmployeeProfiles(){
		LOGGER.info("Inside bookMarkedEmployeeProfiles()");
		
		employer = (Employer) SecurityContextHolder.getContext()
		.getAuthentication().getPrincipal();
		
		opportunity=opportunityBaseService.findByPrimaryKey(opportunity,opportunity.getId());
		
		listOfBookMarkedEmployeesProfiles=opportunityService.findBookMarkerEmployeeProfiles(opportunity.getId());
		
		return "success";
	}

	public Opportunity getOpportunity() {
		return opportunity;
	}

	public void setOpportunity(Opportunity opportunity) {
		this.opportunity = opportunity;
	}

	public OpportunityService getOpportunityService() {
		return opportunityService;
	}

	public void setOpportunityService(OpportunityService opportunityService) {
		this.opportunityService = opportunityService;
	}

	public List getListOfBookMarkedEmployeesProfiles() {
		return listOfBookMarkedEmployeesProfiles;
	}

	public void setListOfBookMarkedEmployeesProfiles(
			List listOfBookMarkedEmployeesProfiles) {
		this.listOfBookMarkedEmployeesProfiles = listOfBookMarkedEmployeesProfiles;
	}

	public Employer getEmployer() {
		return employer;
	}

	public void setEmployer(Employer employer) {
		this.employer = employer;
	}

	public BaseService<Opportunity> getOpportunityBaseService() {
		return opportunityBaseService;
	}

	public void setOpportunityBaseService(
			BaseService<Opportunity> opportunityBaseService) {
		this.opportunityBaseService = opportunityBaseService;
	}

}
