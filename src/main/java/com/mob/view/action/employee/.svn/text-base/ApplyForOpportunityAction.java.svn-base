package com.mob.view.action.employee;

import com.mob.services.EmployeeOpportunityService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;

public class ApplyForOpportunityAction extends ActionSupport{
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(ApplyForOpportunityAction.class);

	private long opportunityid;
	private long interestedEmployee;
	private long bookmarkedEmployeeid;
	
	private EmployeeOpportunityService employeeOpportunityService;

	public String applyForOpportunity(){
		LOGGER.info("Inside applyForOpportunity");
		
		long interestedEmployeeId=interestedEmployee;
		
		employeeOpportunityService.applyForOpportunity(interestedEmployeeId,opportunityid);
		
		return "success";
	}
	
  /*  public String applyForMarkasFavorite(){
    	LOGGER.info("Inside applyForMarkasFavorite");
    	
    	employeeOpportunityService.bookMarkOpportunity(bookmarkedEmployeeid,opportunityid);
		
		return "success";
		
		
	}*/

	public long getOpportunityid() {
		return opportunityid;
	}

	public void setOpportunityid(long opportunityid) {
		this.opportunityid = opportunityid;
	}

	public long getInterestedEmployee() {
		return interestedEmployee;
	}

	public void setInterestedEmployee(long interestedEmployee) {
		this.interestedEmployee = interestedEmployee;
	}

	public EmployeeOpportunityService getEmployeeOpportunityService() {
		return employeeOpportunityService;
	}

	public void setEmployeeOpportunityService(
			EmployeeOpportunityService employeeOpportunityService) {
		this.employeeOpportunityService = employeeOpportunityService;
	}

	public long getBookmarkedEmployeeid() {
		return bookmarkedEmployeeid;
	}

	public void setBookmarkedEmployeeid(long bookmarkedEmployeeid) {
		this.bookmarkedEmployeeid = bookmarkedEmployeeid;
	}

}
