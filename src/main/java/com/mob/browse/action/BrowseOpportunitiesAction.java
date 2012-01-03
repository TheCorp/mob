package com.mob.browse.action;

import java.util.ArrayList;
import java.util.List;

import com.mob.browse.dao.BrowseDao;
import com.mob.browse.dao.SearchResult;
import com.mob.browse.model.ItemCount;
import com.mob.browse.service.OpportunitySearchCriteria;
import com.mob.model.profile.Education;
import com.mob.model.profile.Industry;
import com.mob.model.profile.Salary;
import com.mob.model.profile.Skills;
import com.opensymphony.xwork2.ActionSupport;

public class BrowseOpportunitiesAction extends ActionSupport {

	private OpportunitySearchCriteria opportunitySearchCriteria = new OpportunitySearchCriteria();
	
	private int categoryLimit = 5;
	private BrowseDao browseDao;
	private List<SearchCategory> category = new ArrayList<SearchCategory>();
	private SearchResult result;
	private int startIndex = 0;
	private int endIndex = 5;
	private String itemType;
	public static final String LOCATIONS = "Locations";
	public static final String SKILLS = "Skills";
	public static final String INDUSTRY = "Industry";
	public static final String SALRANGE = "Salary Range";
	private String keyword;
	
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public void setItemType(String itemType) {
		this.itemType = itemType;
	}

	public void setCategoryLimit(int categoryLimit) {
		this.categoryLimit = categoryLimit;
	}

	public int getCategoryLimit() {
		return categoryLimit;
	}

	public List<SearchCategory> getCategory() {
		return category;
	}

	public void setBrowseDao(BrowseDao browseDao) {
		this.browseDao = browseDao;
	}


	public SearchResult getResult() {
		return result;
	}

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public int getEndIndex() {
		return endIndex;
	}

	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}

	public String loadAllItems(){
		if(itemType.equals(INDUSTRY)){
			List<CategoryItem> industries = browseDao.
			listTopSearchedIndustryForOpportunities(true, categoryLimit);
			addIndustries(industries);
		}else if(itemType.equals(LOCATIONS)){
			List<CategoryItem> locations = browseDao.
			listTopSearchedLocationForOpportunities(true, categoryLimit);
			addLocations(locations);
		}else if(itemType.equals(SKILLS)){
			List<CategoryItem> skills = browseDao.
			listTopSearchedSkillsForOpportunities(true, categoryLimit);
			addSkills(skills);
		}else{
			List<CategoryItem> salaries = browseDao.
			listTopSearchedSalaryRangeForOpportunities(true, categoryLimit);
			addSalaryRange(salaries);
		}

		return SUCCESS;
	}
	public String opportunitySearch(){
		try{
			List<CategoryItem> industries = browseDao.
				listTopSearchedIndustryForOpportunities(false, categoryLimit);
			List<CategoryItem> locations = browseDao.
				listTopSearchedLocationForOpportunities(false, categoryLimit);
			List<CategoryItem> skills = browseDao.
				listTopSearchedSkillsForOpportunities(false, categoryLimit);
			List<CategoryItem> salaries = browseDao.
				listTopSearchedSalaryRangeForOpportunities(false, categoryLimit);
			
			addIndustries(industries);
			addLocations(locations);
			addSkills(skills);
			addSalaryRange(salaries);
			if(keyword!=null){
				opportunitySearchCriteria.setKeyword(keyword);
			}
			
		
			result = browseDao.listOpportunitiesByCriteria(opportunitySearchCriteria, 
					startIndex, 
					endIndex);
			return SUCCESS;
		}catch(Throwable t){
			t.printStackTrace();
			return ERROR;
		}
	}

	private void addSalaryRange(List<CategoryItem> salaries) {
		// TODO Auto-generated method stub
		SearchCategory salaryCat = new SearchCategory();
		salaryCat.setCategoryHeading(SALRANGE);
		salaryCat.setItems(salaries);
		category.add(salaryCat);
	}

	private void addIndustries(List<CategoryItem> industries) {
		// TODO Auto-generated method stub
		SearchCategory industryCat = new SearchCategory();
		industryCat.setCategoryHeading(INDUSTRY);
		industryCat.setItems(industries);
		category.add(industryCat);
	}

	private void addSkills(List<CategoryItem> skills) {
		// TODO Auto-generated method stub
		SearchCategory skillsCat = new SearchCategory();
		skillsCat.setCategoryHeading(SKILLS);
		skillsCat.setItems(skills);
		category.add(skillsCat);
	}

	private void addLocations(List<CategoryItem> locations) {
		// TODO Auto-generated method stub
		SearchCategory locCat = new SearchCategory();
		locCat.setCategoryHeading(LOCATIONS);
		locCat.setItems(locations);
		category.add(locCat);
	}
	
	private String searchTerm;
	
	public void setSearchTerm(String searchTerm) {
		this.searchTerm = searchTerm;
	}

	// To be called to update the search count
	public String countSearch(){
		if(itemType.equals(LOCATIONS)){
			ItemCount count = browseDao.findForSearchTermAndType(BrowseDao.OPP_LOC, searchTerm);
			if(count == null){
				count = new ItemCount();
				count.setItemType(BrowseDao.OPP_LOC);
				count.setSearchTerm(searchTerm);
				count.setCount(1);
				browseDao.save(count);
			}else{
				count.setCount(count.getCount()+1);
				browseDao.update(count);
			}
		}else if(itemType.equals(INDUSTRY)){
			ItemCount count = browseDao.findForSearchTermAndType(BrowseDao.OPP_IND, searchTerm);
			if(count == null){
				count = new ItemCount();
				count.setItemType(BrowseDao.OPP_IND);
				count.setSearchTerm(searchTerm);
				count.setCount(1);
				browseDao.save(count);
			}else{
				count.setCount(count.getCount()+1);
				browseDao.update(count);
			}
		}else if(itemType.equals(SALRANGE)){
			ItemCount count = browseDao.findForSearchTermAndType(BrowseDao.OPP_SAL_RANGE, searchTerm);
			if(count == null){
				count = new ItemCount();
				count.setItemType(BrowseDao.OPP_SAL_RANGE);
				count.setSearchTerm(searchTerm);
				count.setCount(1);
				browseDao.save(count);
			}else{
				count.setCount(count.getCount()+1);
				browseDao.update(count);
			}
		}else{
			ItemCount count = browseDao.findForSearchTermAndType(BrowseDao.OPP_SKILLS, searchTerm);
			if(count == null){
				count = new ItemCount();
				count.setItemType(BrowseDao.OPP_SKILLS);
				count.setSearchTerm(searchTerm);
				count.setCount(1);
				browseDao.save(count);
			}else{
				count.setCount(count.getCount()+1);
				browseDao.update(count);
			}
		}
		return SUCCESS;
	}
}
