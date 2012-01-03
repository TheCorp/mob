package com.mob.view.action.employer;

import java.util.List;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.User;
import com.mob.model.employer.Employer;
import com.mob.model.employer.Opportunity;
import com.mob.services.BaseService;
import com.mob.services.EmployerProfileService;
import com.mob.services.SearchService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;


public class ViewIndividualEmployerOpportunities extends ActionSupport {
	/**
	 * Logger for logging messages.
	 */
	private static final MOBLogger LOGGER = new MOBLogger(
			ViewIndividualEmployerOpportunities.class);

	private static final long serialVersionUID = 1L;

	private Opportunity opportunity;
	private BaseService<Opportunity> opportunityBaseService;
	private SearchService searchService;
	private List opportunityskillsList;
	private Employer user;
	private long Opportunityid;
	private User user_;
	private Employer employer;
	private EmployerProfileService employerProfileService;
	
	
	public String viewEmployerOpportunities() {
		user_ = (User) SecurityContextHolder.getContext()
		.getAuthentication().getPrincipal();
		
		opportunity = new Opportunity();
		opportunity = opportunityBaseService.findByPrimaryKey(opportunity,
				Opportunityid);
		opportunityskillsList = searchService.findOpportunitySkills(Opportunityid);
		employer=employerProfileService.loadEmployerAccInfo(user_.getId());
		return "success";
	}

	public Opportunity getOpportunity() {
		return opportunity;
	}

	public void setOpportunity(Opportunity opportunity) {
		this.opportunity = opportunity;
	}

	public Employer getUser() {
		return user;
	}

	public void setUser(Employer user) {
		this.user = user;
	}

	public long getOpportunityid() {
		return Opportunityid;
	}

	public void setOpportunityid(long opportunityid) {
		Opportunityid = opportunityid;
	}

	public BaseService<Opportunity> getOpportunityBaseService() {
		return opportunityBaseService;
	}

	public void setOpportunityBaseService(
			BaseService<Opportunity> opportunityBaseService) {
		this.opportunityBaseService = opportunityBaseService;
	}

	public List getOpportunityskillsList() {
		return opportunityskillsList;
	}

	public void setOpportunityskillsList(List opportunityskillsList) {
		this.opportunityskillsList = opportunityskillsList;
	}

	public SearchService getSearchService() {
		return searchService;
	}

	public void setSearchService(SearchService searchService) {
		this.searchService = searchService;
	}

	public User getUser_() {
		return user_;
	}

	public void setUser_(User user_) {
		this.user_ = user_;
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
