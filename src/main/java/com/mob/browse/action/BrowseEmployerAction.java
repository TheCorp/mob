package com.mob.browse.action;

import java.util.ArrayList;
import java.util.List;

import com.mob.browse.dao.BrowseDao;
import com.mob.browse.dao.SearchResult;
import com.mob.browse.model.ItemCount;
import com.mob.browse.service.EmployerSearchCriteria;
import com.mob.model.profile.Industry;
import com.opensymphony.xwork2.ActionSupport;

public class BrowseEmployerAction extends ActionSupport {

	private EmployerSearchCriteria employerSearchCriteria = new EmployerSearchCriteria();
	
	private int categoryLimit = 5;
	private BrowseDao browseDao;
	private List<SearchCategory> category = new ArrayList<SearchCategory>();
	private SearchResult result;
	private int startIndex = 0;
	private int endIndex = 5;
	private String itemType;
	public static final String LOCATIONS = "Locations";
	public static final String INDUSTRY = "Industry";
	public static final String NOOFOPPS = "Number Of Opportunities";
	
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
		if(itemType.equals(LOCATIONS)){
			List<CategoryItem> locations = browseDao.
			listTopSearchedLocationForEmployers(true, categoryLimit);
			addLocations(locations);
		}else if(itemType.equals(INDUSTRY)){
			List<CategoryItem> industries = browseDao.
			listTopSearchedIndustryForEmployers(true, categoryLimit);
		
			addIndustries(industries);
		}else{
			addOppCount();
		}
		return SUCCESS;
	}
	
	public String employerSearch(){
		try{
			
			List<CategoryItem> locations = browseDao.
				listTopSearchedLocationForEmployers(false, categoryLimit);
			List<CategoryItem> industries = browseDao.
				listTopSearchedIndustryForEmployers(false, categoryLimit);
			
			addIndustries(industries);
			addLocations(locations);
			addOppCount();
			if(keyword!=null){
				employerSearchCriteria.setKeyword(keyword);
			}
			
			result = browseDao.listEmployerProfileByCriteria(employerSearchCriteria, 
					startIndex, 
					endIndex);
			return SUCCESS;
		}catch(Throwable t){
			t.printStackTrace();
			return ERROR;
		}
	}	

	private void addOppCount() {
		// TODO Auto-generated method stub
		SearchCategory oppCount = new SearchCategory();
		oppCount.setCategoryHeading(NOOFOPPS);
		String[] oppCounts = {"1-10","11-20","21-30",">30"};
		int i=1;
		for(String oppCt:oppCounts){
			CategoryItem item = new CategoryItem();
			item.setDisplay(oppCt);
			item.setName(oppCt);
			item.setValue(i++);
			oppCount.addCategoryItem(item);
		}
		category.add(oppCount);
	}

	private void addIndustries(List<CategoryItem> industries) {
		// TODO Auto-generated method stub
		SearchCategory industryCat = new SearchCategory();
		industryCat.setCategoryHeading(INDUSTRY);
		industryCat.setItems(industries);
		category.add(industryCat);
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
			ItemCount count = browseDao.findForSearchTermAndType(BrowseDao.EMPLOYER_LOC, searchTerm);
			if(count == null){
				count = new ItemCount();
				count.setItemType(BrowseDao.EMPLOYER_LOC);
				count.setSearchTerm(searchTerm);
				count.setCount(1);
				browseDao.save(count);
			}else{
				count.setCount(count.getCount()+1);
				browseDao.update(count);
			}
		}else if(itemType.equals(INDUSTRY)){
			ItemCount count = browseDao.findForSearchTermAndType(BrowseDao.EMPLOYER_IND, searchTerm);
			if(count == null){
				count = new ItemCount();
				count.setItemType(BrowseDao.EMPLOYER_IND);
				count.setSearchTerm(searchTerm);
				count.setCount(1);
				browseDao.save(count);
			}else{
				count.setCount(count.getCount()+1);
				browseDao.update(count);
			}
		}else{
			ItemCount count = browseDao.findForSearchTermAndType(BrowseDao.EMPLOYER_OPP_COUNT, searchTerm);
			if(count == null){
				count = new ItemCount();
				count.setItemType(BrowseDao.EMPLOYER_OPP_COUNT);
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
