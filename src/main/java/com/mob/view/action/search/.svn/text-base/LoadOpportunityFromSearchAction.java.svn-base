package com.mob.view.action.search;

import java.util.List;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.User;
import com.mob.model.employer.Employer;
import com.mob.model.employer.Opportunity;
import com.mob.model.profile.Profile;
import com.mob.services.EmployerProfileService;
import com.mob.services.SearchService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;

public class LoadOpportunityFromSearchAction extends ActionSupport{
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(LoadOpportunityFromSearchAction.class);

	private User user;
	private Opportunity opportunity;
	private Profile profile;
	
	//private EmployeeProfileService profileService;
	private SearchService searchService;
	
	private List  opportunityskillsList;
	private List<Opportunity>  opportunityList;
	private List<Profile> profiles;
	private Employer employer;
	private long opportunityid;
	private EmployerProfileService employerProfileService;
	
	

	public List<Opportunity> getOpportunityList() {
		return opportunityList;
	}

	public void setOpportunityList(List<Opportunity> opportunityList) {
		this.opportunityList = opportunityList;
	}

	

	public String getOpportunityDetails(){
		LOGGER.info("Entered getOpportunityDetails");
    LOGGER.info("opp id is:"+opportunityid);
		
		opportunity = new Opportunity();
		
		/*loadForViewOpportunity() will increment view count of opportunity */
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
		employer=employerProfileService.loadEmployerAccInfo(user.getId());
		profiles = searchService.findListOfEmployeeProfiles(profile,profile.getProfileOwner().getId());
		LOGGER.info("list of profiles of employee:"+profiles.size());
		return "success";
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

	

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
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
	
	public List getOpportunityskillsList() {
		return opportunityskillsList;
	}
	public void setOpportunityskillsList(List opportunityskillsList) {
		this.opportunityskillsList = opportunityskillsList;
	}
	
	public Opportunity getOpportunity() {
		return opportunity;
	}

	public void setOpportunity(Opportunity opportunity) {
		this.opportunity = opportunity;
	}

	public Employer getEmployer() {
		return employer;
	}

	public void setEmployer(Employer employer) {
		this.employer = employer;
	}

	public EmployerProfileService getEmployerProfileService() {
		return employerProfileService;
	}

	public void setEmployerProfileService(
			EmployerProfileService employerProfileService) {
		this.employerProfileService = employerProfileService;
	}
	

	

	
}
