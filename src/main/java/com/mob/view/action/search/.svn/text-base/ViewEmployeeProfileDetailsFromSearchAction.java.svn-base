package com.mob.view.action.search;

import java.util.List;

import com.mob.model.User;
import com.mob.model.profile.Profile;
import com.mob.model.profile.WorkExperience;
import com.mob.services.BaseService;
import com.mob.services.SearchService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;

public class ViewEmployeeProfileDetailsFromSearchAction extends ActionSupport{
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(ViewEmployeeProfileDetailsFromSearchAction.class);

	private static final long serialVersionUID = 1L;
	
	private Profile employeeProfile;
	
	private SearchService searchService;
	
	private WorkExperience experience;
	
	private List employeeWorkExperience;
	
	private BaseService<User> employeeBaseService;
	
	private BaseService<Profile> employeeProfileBaseService;
	
	private User interestedEmployeeProfile=new User();
	
	private long employeeId;
	
	
	public String viewEmployeeProfileDetails(){
		LOGGER.info("Entered viewEmployeeProfileDetails");
		interestedEmployeeProfile=employeeBaseService.findByPrimaryKey(interestedEmployeeProfile, employeeId);
		
		employeeProfile=employeeProfileBaseService.findByPrimaryKey(employeeProfile,employeeProfile.getId());
		
		employeeWorkExperience=searchService.findEmployeeWorkExperience(experience,employeeProfile.getId());
		
		return "success";
	}

	public User getInterestedEmployeeProfile() {
		return interestedEmployeeProfile;
	}

	public void setInterestedEmployeeProfile(User interestedEmployeeProfile) {
		this.interestedEmployeeProfile = interestedEmployeeProfile;
	}

	
	public Profile getEmployeeProfile() {
		return employeeProfile;
	}

	public void setEmployeeProfile(Profile employeeProfile) {
		this.employeeProfile = employeeProfile;
	}

	public SearchService getSearchService() {
		return searchService;
	}

	public void setSearchService(SearchService searchService) {
		this.searchService = searchService;
	}

	public WorkExperience getExperience() {
		return experience;
	}

	public void setExperience(WorkExperience experience) {
		this.experience = experience;
	}

	public List getEmployeeWorkExperience() {
		return employeeWorkExperience;
	}

	public void setEmployeeWorkExperience(List employeeWorkExperience) {
		this.employeeWorkExperience = employeeWorkExperience;
	}

	public BaseService<Profile> getEmployeeProfileBaseService() {
		return employeeProfileBaseService;
	}

	public void setEmployeeProfileBaseService(
			BaseService<Profile> employeeProfileBaseService) {
		this.employeeProfileBaseService = employeeProfileBaseService;
	}

	public BaseService<User> getEmployeeBaseService() {
		return employeeBaseService;
	}

	public void setEmployeeBaseService(BaseService<User> employeeBaseService) {
		this.employeeBaseService = employeeBaseService;
	}

	public long getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(long employeeId) {
		this.employeeId = employeeId;
	}

	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

}
