package com.mob.browse.action;

import com.mob.browse.dao.BrowseDao;
import com.mob.browse.dao.SearchResult;
import com.mob.browse.service.EmployeeSearchCriteria;
import com.opensymphony.xwork2.ActionSupport;

public class FilterRemoveAction extends ActionSupport {
	private EmployeeSearchCriteria employeeCriteria;
	private String type;
	private String category;
	private String value;
	private BrowseDao browseDao;
	private SearchResult result;
	private int startIndex = 0;
	private int endIndex = 10;
	
	public void setType(String type) {
		this.type = type;
	}
	public SearchResult getResult() {
		return result;
	}
	public void setEmployeeCriteria(EmployeeSearchCriteria employeeCriteria) {
		this.employeeCriteria = employeeCriteria;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public void setBrowseDao(BrowseDao browseDao) {
		this.browseDao = browseDao;
	}
	
	public String filter(){
		try{
			if(type.equals("Employee")){
				removeForEmployeeSearch();
				result = browseDao.listEmployeeProfileByCriteria
					(employeeCriteria, startIndex, endIndex);
			}
			return SUCCESS;
		}catch(Exception e){
			e.printStackTrace();
			return ERROR;
		}
	}
	private void removeForEmployeeSearch() {
		// TODO Auto-generated method stub
		if(category.equals("Education Levels")){
			employeeCriteria.removeFromEducations(value);
		}else if(category.equals("Locations")){
			employeeCriteria.removeFromLocations(value);
		}else{
			employeeCriteria.removeFromSkills(value);
		}
	}
	
}
