package com.mob.view.action.employee;

import com.mob.services.EmployeeOpportunityService;
import com.mob.util.MOBLogger;

public class BookMarkeOpportunityAction {
	
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(BookMarkeOpportunityAction.class);

	private long opportunityId;
	private long bookmarkedEmployeeid;
	
	private EmployeeOpportunityService employeeOpportunityService;
	
	public String bookMarkeOpportunity(){
		
		LOGGER.info("Inside bookMarkeOpportunity");
		
		employeeOpportunityService.bookMarkOpportunity(bookmarkedEmployeeid,opportunityId);
		
		return "success";
	}

	public long getOpportunityId() {
		return opportunityId;
	}

	public void setOpportunityId(long opportunityId) {
		this.opportunityId = opportunityId;
	}

	public long getBookmarkedEmployeeid() {
		return bookmarkedEmployeeid;
	}

	public void setBookmarkedEmployeeid(long bookmarkedEmployeeid) {
		this.bookmarkedEmployeeid = bookmarkedEmployeeid;
	}

	public EmployeeOpportunityService getEmployeeOpportunityService() {
		return employeeOpportunityService;
	}

	public void setEmployeeOpportunityService(
			EmployeeOpportunityService employeeOpportunityService) {
		this.employeeOpportunityService = employeeOpportunityService;
	}
	
	

}
