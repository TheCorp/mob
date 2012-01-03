package com.mob.view.action.employee;

import java.util.List;

import com.mob.model.User;
import com.mob.model.employer.Opportunity;
import com.mob.services.SearchService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;

public class CreateSearchAction extends ActionSupport {
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(CreateSearchAction.class);

	private User user;
	private String[] skillName;
	private String position;
	private String location;
	private String skillsNeeded;
	private SearchService searchService;
	private List<Opportunity> oppotunityList;
	private Opportunity opportunity;
	private long opportunityid;
	private long employer_profileid;
	
	private String skillNames;
	

	public long getEmployer_profileid() {
		
		return employer_profileid;
	}

	public void setEmployer_profileid(long employer_profileid) {
		this.employer_profileid = employer_profileid;
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

	public String searchResults(){
		LOGGER.info("Inside serchResults()");
		
		LOGGER.info("data:----"+skillNames);
		if (skillName != null) {
			StringBuffer sb = new StringBuffer(skillName.length);
			String strTemp = null;
			for (int i = 0; i < skillName.length; i++) {
				strTemp = skillName[i]+",";
				sb.append(strTemp);
			}
			int index= sb.lastIndexOf(",");
			sb = sb.deleteCharAt(index);
			skillsNeeded= sb.toString();
		}
		
		LOGGER.info("skills entered in search are:"+skillsNeeded);
		oppotunityList = searchService.findOpportunities(position,location,skillNames,null,null);
		java.util.Iterator<Opportunity> it = oppotunityList.iterator();
		while(it.hasNext()){
			opportunity = (Opportunity)it.next();
			LOGGER.info("id:"+opportunity.getId());
			opportunityid=opportunity.getId();
			LOGGER.info("profile owner id:"+opportunity.getProfileOwner().getId());
			employer_profileid =opportunity.getProfileOwner().getId();
		}
		
		
		return "success";
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String[] getSkillName() {
		return skillName;
	}

	public void setSkillName(String[] skillName) {
		this.skillName = skillName;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public SearchService getSearchService() {
		return searchService;
	}

	public void setSearchService(SearchService searchService) {
		this.searchService = searchService;
	}

	public List getOppotunityList() {
		return oppotunityList;
	}

	

	public String getSkillsNeeded() {
		return skillsNeeded;
	}

	public void setSkillsNeeded(String skillsNeeded) {
		this.skillsNeeded = skillsNeeded;
	}

	

	public String getSkillNames() {
		return skillNames;
	}

	public void setSkillNames(String skillNames) {
		this.skillNames = skillNames;
	}

	public void setOppotunityList(List<Opportunity> oppotunityList) {
		this.oppotunityList = oppotunityList;
	}

}
