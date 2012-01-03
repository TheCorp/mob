package com.mob.view.action.employer;

import com.mob.model.User;
import com.mob.model.employer.Employer;
import com.mob.model.profile.Profile;
import com.mob.model.profile.WorkExperience;
import com.mob.services.BaseService;
import com.mob.services.ItemService;
import com.mob.services.OpportunityService;
import com.mob.services.ProfileService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;

import java.util.List;

import org.acegisecurity.context.SecurityContextHolder;

public class ViewingInterestedEmployeeProfileAction extends ActionSupport {
	
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(ViewingInterestedEmployeeProfileAction.class);

	private OpportunityService opportunityService;
	private Profile interestedEmployeeProfile=new Profile();
	private WorkExperience interestedEmployeeExperience=new WorkExperience();
	private List employeeWorkExperience;
	
	private ItemService itemService;
	private List itemsList;
	private int itemcount;
	
	private BaseService<User> employeeBaseService;
	private User employee=new User();
    private ProfileService profileService;


    public void setProfileService(ProfileService profileService) {
        this.profileService = profileService;
    }

    public String viewingInterestedEmployeeProfile(){
		
		LOGGER.info("Inside viewingInterestedEmployeeProfile()");
		
//		/* Increase view count of employee profile while employer viewing */
//		interestedEmployeeProfile=opportunityService.findEmployeeProfileForView(
//                interestedEmployeeProfile,interestedEmployeeProfile.getId());
//		employeeWorkExperience=opportunityService.findEmployeeWorkExperience(
//                interestedEmployeeExperience,interestedEmployeeProfile.getId());
        interestedEmployeeProfile = profileService.getInterestedEmployeeProfileDetails(
                (Employer) SecurityContextHolder.getContext().getAuthentication().getPrincipal(),
                interestedEmployeeProfile.getId()
        );

        employee=employeeBaseService.findByPrimaryKey(employee,interestedEmployeeProfile.getProfileOwner().getId());
		
		/*itemsList = itemService.findItems(interestedEmployeeProfile.getInboxOwnerProfile().getId());
		itemcount=itemsList.size();*/
		return "success";
	}

	

	public Profile getInterestedEmployeeProfile() {
		return interestedEmployeeProfile;
	}



	public void setInterestedEmployeeProfile(Profile interestedEmployeeProfile) {
		this.interestedEmployeeProfile = interestedEmployeeProfile;
	}



	public OpportunityService getOpportunityService() {
		return opportunityService;
	}

	public void setOpportunityService(OpportunityService opportunityService) {
		this.opportunityService = opportunityService;
	}



	public WorkExperience getInterestedEmployeeExperience() {
		return interestedEmployeeExperience;
	}



	public void setInterestedEmployeeExperience(
			WorkExperience interestedEmployeeExperience) {
		this.interestedEmployeeExperience = interestedEmployeeExperience;
	}



	public List getEmployeeWorkExperience() {
		return employeeWorkExperience;
	}



	public void setEmployeeWorkExperience(List employeeWorkExperience) {
		this.employeeWorkExperience = employeeWorkExperience;
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
