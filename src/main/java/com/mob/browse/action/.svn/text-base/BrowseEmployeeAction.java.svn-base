package com.mob.browse.action;

import java.util.ArrayList;
import java.util.List;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.browse.dao.BrowseDao;

import com.mob.browse.dao.SearchResult;
import com.mob.browse.model.ItemCount;
import com.mob.browse.service.EmployeeSearchCriteria;
import com.mob.model.User;
import com.mob.model.profile.Education;
import com.mob.model.profile.Industry;
import com.mob.model.profile.Profile;
import com.mob.model.profile.Skills;
import com.mob.services.EmployeeProfileService;
import com.mob.services.PrivacyGroupService;
import com.mob.services.SearchService;
import com.opensymphony.xwork2.ActionSupport;

public class BrowseEmployeeAction extends ActionSupport {

	private EmployeeSearchCriteria employeeSearchCriteria = new EmployeeSearchCriteria();
	
	private int categoryLimit = 5;
	private BrowseDao browseDao;
	private List<SearchCategory> category = new ArrayList<SearchCategory>();
	private SearchResult result;
	private int startIndex = 0;
	private int endIndex = 5;
	public static final String EDU_LEVEL = "Education Level";
	public static final String LOCATION = "Locations";
	public static final String SKILLS = "Skills";
	private String keyword;
	

	private String itemType;

	private List<Profile> profiles;

	private SearchService searchService;

	private List contactTypesList;

	private PrivacyGroupService privacygroupService;

	private EmployeeProfileService employeeProfileService;
	
	
	public List<Profile> getProfiles() {
		return profiles;
	}

	public List getContactTypesList() {
		return contactTypesList;
	}

	public void setSearchService(SearchService searchService) {
		this.searchService = searchService;
	}

	public void setPrivacygroupService(PrivacyGroupService privacygroupService) {
		this.privacygroupService = privacygroupService;
	}

	public void setEmployeeProfileService(
			EmployeeProfileService employeeProfileService) {
		this.employeeProfileService = employeeProfileService;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String search) {
		this.keyword = search;
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
		if(itemType.equals(EDU_LEVEL)){
			List<CategoryItem> educations = browseDao.
			listTopSearchedEducationForEmployees(true, categoryLimit);
			addEducation(educations);
		}else if(itemType.equals(SKILLS)){
			List<CategoryItem> skills = browseDao.
			listTopSearchedSkillsForEmployees(true, categoryLimit);
			addSkills(skills);
		}else{
			List<CategoryItem> locations = browseDao.
				listTopSearchedLocationForEmployees(true, categoryLimit);
			addLocations(locations);
		}
		return SUCCESS;
	}

	public String employeeSearch(){
		try{
			
			List<CategoryItem> educations = browseDao.
				listTopSearchedEducationForEmployees(false, categoryLimit);
			List<CategoryItem> locations = browseDao.
				listTopSearchedLocationForEmployees(false, categoryLimit);
			List<CategoryItem> skills = browseDao.
				listTopSearchedSkillsForEmployees(false, categoryLimit);
			
			addEducation(educations);
			addLocations(locations);
			addSkills(skills);
			if(keyword!=null){
				employeeSearchCriteria.setKeyword(keyword);
			}
			result = browseDao.listEmployeeProfileByCriteria(employeeSearchCriteria, 
					startIndex, 
					endIndex);
			User user = (User) SecurityContextHolder.getContext()
			.getAuthentication().getPrincipal();

			profiles = searchService.findListOfEmployeeProfiles(null,user.getId());
			if(profiles.size()!=0){
				Profile currentProfile=employeeProfileService.getDefaultProfileForUser(user.getId());
				contactTypesList=privacygroupService.loadAllPrivacyGroupsOfUser(currentProfile.getId());
			}
			
			return SUCCESS;
		}catch(Throwable t){
			t.printStackTrace();
			return ERROR;
		}
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
		locCat.setCategoryHeading(LOCATION);
		locCat.setItems(locations);
		category.add(locCat);
	}

	private void addEducation(List<CategoryItem> educations) {
		// TODO Auto-generated method stub
		SearchCategory eduCat = new SearchCategory();
		eduCat.setCategoryHeading(EDU_LEVEL);
		eduCat.setItems(educations);
		category.add(eduCat);
	}
	
	private String searchTerm;
	
	public void setSearchTerm(String searchTerm) {
		this.searchTerm = searchTerm;
	}

	// To be called to update the search count
	public String countSearch(){
		if(itemType.equals(EDU_LEVEL)){
			ItemCount count = browseDao.findForSearchTermAndType(BrowseDao.EMPLOYEE_EDU, searchTerm);
			if(count == null){
				count = new ItemCount();
				count.setItemType(BrowseDao.EMPLOYEE_EDU);
				count.setSearchTerm(searchTerm);
				count.setCount(1);
				browseDao.save(count);
			}else{
				count.setCount(count.getCount()+1);
				browseDao.update(count);
			}
		}else if(itemType.equals(SKILLS)){
			ItemCount count = browseDao.findForSearchTermAndType(BrowseDao.EMPLOYEE_SKILL, searchTerm);
			if(count == null){
				count = new ItemCount();
				count.setItemType(BrowseDao.EMPLOYEE_SKILL);
				count.setSearchTerm(searchTerm);
				count.setCount(1);
				browseDao.save(count);
			}else{
				count.setCount(count.getCount()+1);
				browseDao.update(count);
			}
		}else{
			ItemCount count = browseDao.findForSearchTermAndType(BrowseDao.EMPLOYEE_LOC, searchTerm);
			if(count == null){
				count = new ItemCount();
				count.setItemType(BrowseDao.EMPLOYEE_LOC);
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
