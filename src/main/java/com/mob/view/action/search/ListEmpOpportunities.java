package com.mob.view.action.search;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.User;
import com.mob.model.employer.Opportunity;
import com.mob.model.profile.Profile;
import com.mob.services.OpportunityService;

public class ListEmpOpportunities {
	private User user;
	private OpportunityService opportunityService;
	private Profile profile;

	private List listEmpOpportunities;
	private List listProfiles;
	private List profiles;
	private List markAsFavorite;

	private long profileIds;
	private String result;
	private String organizationName;
	private List allOpportunitiesList = new ArrayList();
	private List allMarkAsFavoriteList = new ArrayList();

	public String listAppliedOppotunities() {
		user = (User) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		profile = new Profile();
		profile.setProfileOwner(user);
		listProfiles = opportunityService.findListEmpPropiles(user.getId());
		if (listProfiles.size() != 0) {
			Iterator it = listProfiles.iterator();
			while (it.hasNext()) {
				Profile p = (Profile) it.next();
				profileIds = p.getId();
				listEmpOpportunities = opportunityService
						.findAppliedEmployeeProfiles(profileIds);
				if (listEmpOpportunities.size() != 0) {
					Iterator it1 = listEmpOpportunities.iterator();
					while (it1.hasNext()) {
						Opportunity opportunity = (Opportunity) it1.next();
						allOpportunitiesList.add(opportunity);
						organizationName = opportunity.getProfileOwner()
								.getEmployer().getEmplrOrgName();
						result = opportunity.getTitle();
					}
				}
			}
		}
		return "success";

	}

	public String listMarkAsFavoriteOpp() {
		user = (User) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		profile = new Profile();
		profile.setProfileOwner(user);
		listProfiles = opportunityService.findListEmpPropiles(user.getId());
		if (listProfiles.size() != 0) {
			Iterator it = listProfiles.iterator();
			while (it.hasNext()) {
				Profile p = (Profile) it.next();
				profileIds = p.getId();
				markAsFavorite = opportunityService
						.findMarkAsFavoriteList(profileIds);
				if (markAsFavorite.size() != 0) {
					Iterator it1 = markAsFavorite.iterator();
					while (it1.hasNext()) {
						Opportunity opportunity = (Opportunity) it1.next();
						allMarkAsFavoriteList.add(opportunity);
						organizationName = opportunity.getProfileOwner()
								.getEmployer().getEmplrOrgName();
						result = opportunity.getTitle();
					}
				}
			}
		}
		return "success";

	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List getListEmpOpportunities() {
		return listEmpOpportunities;
	}

	public void setListEmpOpportunities(List listEmpOpportunities) {
		this.listEmpOpportunities = listEmpOpportunities;
	}

	public List getListProfiles() {
		return listProfiles;
	}

	public void setListProfiles(List listProfiles) {
		this.listProfiles = listProfiles;
	}

	public OpportunityService getOpportunityService() {
		return opportunityService;
	}

	public void setOpportunityService(OpportunityService opportunityService) {
		this.opportunityService = opportunityService;
	}

	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}

	public List getProfiles() {
		return profiles;
	}

	public void setProfiles(List profiles) {
		this.profiles = profiles;
	}

	public long getProfileIds() {
		return profileIds;
	}

	public void setProfileIds(long profileIds) {
		this.profileIds = profileIds;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getOrganizationName() {
		return organizationName;
	}

	public void setOrganizationName(String organizationName) {
		this.organizationName = organizationName;
	}

	public List getMarkAsFavorite() {
		return markAsFavorite;
	}

	public void setMarkAsFavorite(List markAsFavorite) {
		this.markAsFavorite = markAsFavorite;
	}

	public List getAllOpportunitiesList() {
		return allOpportunitiesList;
	}

	public void setAllOpportunitiesList(List allOpportunitiesList) {
		this.allOpportunitiesList = allOpportunitiesList;
	}

	public List getAllMarkAsFavoriteList() {
		return allMarkAsFavoriteList;
	}

	public void setAllMarkAsFavoriteList(List allMarkAsFavoriteList) {
		this.allMarkAsFavoriteList = allMarkAsFavoriteList;
	}

}
