package com.mob.view.action.employer;

import java.util.List;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.employer.Employer;
import com.mob.model.employer.Opportunity;
import com.mob.services.BaseService;
import com.mob.services.ItemService;
import com.mob.services.OpportunityService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;

public class ViewInterestedEmployeeProfilesAction extends ActionSupport{
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(ViewInterestedEmployeeProfilesAction.class);

	private Opportunity opportunity=new Opportunity();
	private OpportunityService opportunityService;
	private List listOfInterestedEmployees;
	private Employer employer;
	

	private ItemService itemService;
	private List itemsList;
	private int itemcount;
	private long employeeOwnerId;
	
	private BaseService<Opportunity> opportunityBaseService;

	



	public String viewInterestedEmployeeProfiles(){
		
		LOGGER.info("Inside viewInterestedEmployeeProfiles");
		employer = (Employer) SecurityContextHolder.getContext()
		.getAuthentication().getPrincipal();
		
		opportunity=opportunityBaseService.findByPrimaryKey(opportunity,opportunity.getId());
		
		listOfInterestedEmployees=opportunityService.findInterestedEmployeeProfiles(opportunity.getId());
		
		LOGGER.info("listOfInterestedEmployees size:"+listOfInterestedEmployees.size());
		
		/*itemsList = itemService.findItems(interestedEmployeeProfile.getInboxOwnerProfile().getId());
		itemcount=itemsList.size();*/
		
		
		return "success";
	}

	


	public long getEmployeeOwnerId() {
		return employeeOwnerId;
	}



	public void setEmployeeOwnerId(long employeeOwnerId) {
		this.employeeOwnerId = employeeOwnerId;
	}



	public BaseService<Opportunity> getOpportunityBaseService() {
		return opportunityBaseService;
	}



	public void setOpportunityBaseService(
			BaseService<Opportunity> opportunityBaseService) {
		this.opportunityBaseService = opportunityBaseService;
	}


	
	public ItemService getItemService() {
		return itemService;
	}

	public void setItemService(ItemService itemService) {
		this.itemService = itemService;
	}

	public List getItemsList() {
		return itemsList;
	}

	public void setItemsList(List itemsList) {
		this.itemsList = itemsList;
	}

	public int getItemcount() {
		return itemcount;
	}

	public void setItemcount(int itemcount) {
		this.itemcount = itemcount;
	}
	public Employer getEmployer() {
		return employer;
	}

	public void setEmployer(Employer employer) {
		this.employer = employer;
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
	

	public List getListOfInterestedEmployees() {
		return listOfInterestedEmployees;
	}

	public void setListOfInterestedEmployees(List listOfInterestedEmployees) {
		this.listOfInterestedEmployees = listOfInterestedEmployees;
	}
}
