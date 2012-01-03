package com.mob.view.action.employer;

import java.util.List;

import com.mob.model.User;
import com.mob.model.profile.Profile;
import com.mob.model.profile.WorkExperience;
import com.mob.services.BaseService;
import com.mob.services.OpportunityService;
import com.opensymphony.xwork2.ActionSupport;

public class ViewingBookMarkedEmployeeProfileAction extends ActionSupport {
	
	
	private OpportunityService opportunityService;
	private Profile bookMarkedEmployeeProfile=new Profile();
	private WorkExperience bookMarkedEmployeeExperience=new WorkExperience();
	private List employeeWorkExperience;
	
	private BaseService<User> employeeBaseService;
	private User employee=new User();
	
	public String viewingBookMarkedEmployeeProfile(){

		/* Increase view count of employee profile while employer viewing */
		bookMarkedEmployeeProfile=opportunityService.findEmployeeProfileForView(bookMarkedEmployeeProfile,bookMarkedEmployeeProfile.getId());
		employeeWorkExperience=opportunityService.findEmployeeWorkExperience(bookMarkedEmployeeExperience,bookMarkedEmployeeProfile.getId());
	
		employee=employeeBaseService.findByPrimaryKey(employee,bookMarkedEmployeeProfile.getProfileOwner().getId());
		
	return "success";
	}

	public OpportunityService getOpportunityService() {
		return opportunityService;
	}

	public void setOpportunityService(OpportunityService opportunityService) {
		this.opportunityService = opportunityService;
	}

	public Profile getBookMarkedEmployeeProfile() {
		return bookMarkedEmployeeProfile;
	}

	public void setBookMarkedEmployeeProfile(Profile bookMarkedEmployeeProfile) {
		this.bookMarkedEmployeeProfile = bookMarkedEmployeeProfile;
	}

	public WorkExperience getBookMarkedEmployeeExperience() {
		return bookMarkedEmployeeExperience;
	}

	public void setBookMarkedEmployeeExperience(
			WorkExperience bookMarkedEmployeeExperience) {
		this.bookMarkedEmployeeExperience = bookMarkedEmployeeExperience;
	}

	public List getEmployeeWorkExperience() {
		return employeeWorkExperience;
	}

	public void setEmployeeWorkExperience(List employeeWorkExperience) {
		this.employeeWorkExperience = employeeWorkExperience;
	}

	public BaseService<User> getEmployeeBaseService() {
		return employeeBaseService;
	}

	public void setEmployeeBaseService(BaseService<User> employeeBaseService) {
		this.employeeBaseService = employeeBaseService;
	}

	public User getEmployee() {
		return employee;
	}

	public void setEmployee(User employee) {
		this.employee = employee;
	}
	
	

}
