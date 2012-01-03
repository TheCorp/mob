package com.mob.view.action.search;

import java.util.List;

import com.mob.model.employer.Opportunity;
import com.mob.services.SearchService;
import com.mob.util.MOBLogger;

public class LoadListOpportunitiesFromSearchAction {
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(LoadListOpportunitiesFromSearchAction.class);

	private String[] skillName;
	private String position;
	private String location;
	private String skillsNeeded;
	private SearchService searchService;
	private List<Opportunity> oppotunityList;
	private Opportunity opportunity;
	private long opportunityid;
	private long employer_profileid;
	private List<Opportunity>  opportunityList;
	private String search;
	private String skillNames;
	private String additionalKeyword;
	private String additionalSkillNames;

	public String getSkillNames() {
		return skillNames;
	}



	public void setSkillNames(String skillNames) {
		this.skillNames = skillNames;
	}



	public List<Opportunity> getOpportunityList() {
		return opportunityList;
	}



	public void setOpportunityList(List<Opportunity> opportunityList) {
		this.opportunityList = opportunityList;
	}



	public String getSearch() {
		return search;
	}



	public void setSearch(String search) {
		this.search = search;
	}



	public String getOpportunities(){
		
			
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
		
		/*if(additionalKeyword!=null || !additionalKeyword.isEmpty()){
		position = position+","+additionalKeyword;
		LOGGER.info("appended keyword is");
		}*/
		
		oppotunityList = searchService.findOpportunities(position,location,skillNames,additionalKeyword,additionalSkillNames);
		java.util.Iterator<Opportunity> it = oppotunityList.iterator();
		while(it.hasNext()){
			opportunity = (Opportunity)it.next();
			LOGGER.info("opp.getid"+opportunity.getId());
			opportunityid=opportunity.getId();
			LOGGER.info("opp.getprofileowner.getid"+opportunity.getProfileOwner().getId());
			employer_profileid =opportunity.getProfileOwner().getId();
		}
		
		return "success";
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

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getSkillsNeeded() {
		return skillsNeeded;
	}

	public void setSkillsNeeded(String skillsNeeded) {
		this.skillsNeeded = skillsNeeded;
	}

	public SearchService getSearchService() {
		return searchService;
	}

	public void setSearchService(SearchService searchService) {
		this.searchService = searchService;
	}

	public List<Opportunity> getOppotunityList() {
		return oppotunityList;
	}

	public void setOppotunityList(List<Opportunity> oppotunityList) {
		this.oppotunityList = oppotunityList;
	}

	public Opportunity getOpportunity() {
		return opportunity;
	}

	public void setOpportunity(Opportunity opportunity) {
		this.opportunity = opportunity;
	}

	public long getOpportunityid() {
		return opportunityid;
	}

	public void setOpportunityid(long opportunityid) {
		this.opportunityid = opportunityid;
	}

	public long getEmployer_profileid() {
		return employer_profileid;
	}

	public void setEmployer_profileid(long employer_profileid) {
		this.employer_profileid = employer_profileid;
	}

	public String getAllOpportunities(){
		LOGGER.info("Entered getAllOpportunities");
		LOGGER.info("inisde opP and the search is:"+search);
		opportunityList = searchService.findAllOpportunities(search);
		LOGGER.info("size is:"+opportunityList.size());
		return "success";
	}



	public String getAdditionalKeyword() {
		return additionalKeyword;
	}



	public void setAdditionalKeyword(String additionalKeyword) {
		this.additionalKeyword = additionalKeyword;
	}



	public String getAdditionalSkillNames() {
		return additionalSkillNames;
	}



	public void setAdditionalSkillNames(String additionalSkillNames) {
		this.additionalSkillNames = additionalSkillNames;
	}
}
