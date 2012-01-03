package com.mob.browse.action;

import java.util.ArrayList;
import java.util.List;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.browse.dao.BrowseDao;
import com.mob.browse.dao.SearchResult;
import com.mob.browse.model.ItemCount;
import com.mob.browse.service.EmployeeSearchCriteria;
import com.mob.browse.service.GroupSearchCriteria;
import com.mob.model.User;
import com.mob.model.profile.Education;
import com.mob.model.profile.Industry;
import com.mob.model.profile.Profile;
import com.mob.model.profile.Skills;
import com.mob.services.SearchService;
import com.opensymphony.xwork2.ActionSupport;

public class BrowseGroupAction extends ActionSupport {

	private GroupSearchCriteria groupSearchCriteria = new GroupSearchCriteria();
	
	private int categoryLimit = 5;
	private BrowseDao browseDao;
	private List<SearchCategory> category = new ArrayList<SearchCategory>();
	private SearchResult result;
	private int startIndex = 0;
	private int endIndex = 5;
	private String itemType;
	public static final String NOOFMEM = "Number Of Members";
	public static final String LOCATIONS = "Locations";
	private String keyword;
	private List<Profile> profiles;
	private SearchService searchService;
	
	public void setSearchService(SearchService searchService) {
		this.searchService = searchService;
	}

	public List<Profile> getProfiles() {
		return profiles;
	}

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
		if(itemType.equals(LOCATIONS)){
			List<CategoryItem> locations = browseDao.
			listTopSearchedLocationForGroups(true, categoryLimit);
		
			addLocations(locations);
		}else{
			addGroupMemberCounts();
		}
		return SUCCESS;
	}
	public String groupSearch(){
		try{
			List<CategoryItem> locations = browseDao.
				listTopSearchedLocationForGroups(false, categoryLimit);
			
			addLocations(locations);
			addGroupMemberCounts();
			if(keyword!=null){
				groupSearchCriteria.setKeyword(keyword);
			}
			
		
			result = browseDao.listGroupByCriteria(groupSearchCriteria, 
					startIndex, 
					endIndex);
			User user = (User) SecurityContextHolder.getContext()
			.getAuthentication().getPrincipal();

			profiles = searchService.findListOfEmployeeProfiles(null,user.getId());
			
			return SUCCESS;
		}catch(Throwable t){
			t.printStackTrace();
			return ERROR;
		}
	}

	private void addGroupMemberCounts() {
		// TODO Auto-generated method stub
		SearchCategory oppCount = new SearchCategory();
		oppCount.setCategoryHeading(NOOFMEM);
		String[] memberCount = {"1-50","51-100",">100"};
		int i=1;
		for(String memCt:memberCount){
			CategoryItem item = new CategoryItem();
			item.setDisplay(memCt);
			item.setName(memCt);
			item.setValue(i++);
			oppCount.addCategoryItem(item);
		}
		category.add(oppCount);
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
		if(itemType.equals(NOOFMEM)){
			ItemCount count = browseDao.findForSearchTermAndType(BrowseDao.GROUP_NO_MEM, searchTerm);
			if(count == null){
				count = new ItemCount();
				count.setItemType(BrowseDao.GROUP_NO_MEM);
				count.setSearchTerm(searchTerm);
				count.setCount(1);
				browseDao.save(count);
			}else{
				count.setCount(count.getCount()+1);
				browseDao.update(count);
			}
		}else if(itemType.equals(LOCATIONS)){
			ItemCount count = browseDao.findForSearchTermAndType(BrowseDao.GROUP_LOC, searchTerm);
			if(count == null){
				count = new ItemCount();
				count.setItemType(BrowseDao.GROUP_LOC);
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
