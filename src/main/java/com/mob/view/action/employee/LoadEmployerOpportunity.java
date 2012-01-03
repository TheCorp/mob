package com.mob.view.action.employee;

import java.util.List;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.User;
import com.mob.model.employer.Opportunity;
import com.mob.model.profile.Profile;
import com.mob.services.EmployeeProfileService;
import com.mob.services.SearchService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;

public class LoadEmployerOpportunity extends ActionSupport{
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(LoadEmployerOpportunity.class);

	private long opportunityid;
	
	private Opportunity opportunity;
	
	private SearchService searchService;
	private List  opportunityskillsList;
	
	private Profile profile;
	private List<Profile> profiles;
	private EmployeeProfileService profileService;
	private User user;
	
	public String viewOpportunity(){
		LOGGER.info("Inside viewOpportunity");
		LOGGER.info("opp id is:"+opportunityid);
		
		opportunity = new Opportunity();
		opportunity = searchService.loadForViewOpportunity(opportunity,opportunityid);
		LOGGER.info("oppo job name:"+opportunity.getStr_job_name());
		
		LOGGER.info("opportunity:"+opportunity.getId());
		opportunityskillsList =searchService.findOpportunitySkills(opportunityid);
		LOGGER.info("opp skill size:"+opportunityskillsList.size());
		
		/* Load list of profiles*/
		user = (User) SecurityContextHolder.getContext()
		.getAuthentication().getPrincipal();
		profile = new Profile();
		profile.setProfileOwner(user);
		
		profiles = profileService.findByUserProfiles(profile,profile.getProfileOwner().getId());
		LOGGER.info("list of profiles of employee:"+profiles.size());
		return "success";
	}
	
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}
	public List<Profile> getProfiles() {
		return profiles;
	}

	public void setProfiles(List<Profile> profiles) {
		this.profiles = profiles;
	}
	
	
	public SearchService getSearchService() {
		return searchService;
	}
	public void setSearchService(SearchService searchService) {
		this.searchService = searchService;
	}
	
	public long getOpportunityid() {
		return opportunityid;
	}
	public void setOpportunityid(long opportunityid) {
		this.opportunityid = opportunityid;
	}
	
	
	public Opportunity getOpportunity() {
		return opportunity;
	}
	public void setOpportunity(Opportunity opportunity) {
		this.opportunity = opportunity;
	}
	
	public List getOpportunityskillsList() {
		return opportunityskillsList;
	}
	public void setOpportunityskillsList(List opportunityskillsList) {
		this.opportunityskillsList = opportunityskillsList;
	}


	public EmployeeProfileService getProfileService() {
		return profileService;
	}


	public void setProfileService(EmployeeProfileService profileService) {
		this.profileService = profileService;
	}
}
