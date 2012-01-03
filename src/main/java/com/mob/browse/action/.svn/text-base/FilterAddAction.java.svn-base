package com.mob.browse.action;

import java.util.ArrayList;
import java.util.List;

import com.mob.browse.dao.BrowseDao;
import com.mob.browse.dao.SearchResult;
import com.mob.browse.service.EmployeeSearchCriteria;
import com.mob.browse.service.EmployerSearchCriteria;
import com.mob.browse.service.GroupSearchCriteria;
import com.mob.browse.service.OpportunitySearchCriteria;
import com.mob.model.profile.Industry;
import com.opensymphony.xwork2.ActionSupport;

public class FilterAddAction extends ActionSupport {
	private EmployeeSearchCriteria employeeCriteria = new EmployeeSearchCriteria();
	private EmployerSearchCriteria employerCriteria = new EmployerSearchCriteria();
	private GroupSearchCriteria groupSearchCriteria = new GroupSearchCriteria();
	private OpportunitySearchCriteria oppsSearchCriteria = new OpportunitySearchCriteria();
	private String type;
	private List<String> categories = new ArrayList<String>();
	private List<String> values = new ArrayList<String>();
	private String category;
	private String value;
	private BrowseDao browseDao;
	private SearchResult result;
	private int startIndex = 0;
	private int endIndex = 10;
	private String keyword;
	
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public void setType(String type) {
		this.type = type;
	}
	public SearchResult getResult() {
		return result;
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
	
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}
	public String filter(){
		try{
			if(category.length()>2){
				System.out.println("Category is " + category.substring(1, category.length()-1));
				System.out.println("Value is " + value.substring(1,value.length()-1));
	
				String[] cats =  category.substring(1, category.length()-1).split(",");
				String[] vals = value.substring(1,value.length()-1).split(",");
				for(int i=0 ; i<cats.length ; i++){
					categories.add(cats[i]);
				}
				for(int i=0 ; i<vals.length ; i++){
					values.add(vals[i]);
				}
			}else{
				categories.clear();
				values.clear();
			}
			System.out.println("Categories length " +categories.size());
			System.out.println("Values length " +values.size());
			if(type.equals("Employee")){
				addToEmployeeSearch();
				if(keyword!=null && keyword.length()>0){
					employeeCriteria.setKeyword(keyword);
				}
				result = browseDao.listEmployeeProfileByCriteria
					(employeeCriteria, startIndex, endIndex);
			}
			if(type.equals("Employer")){
				addToEmployerSearch();
				if(keyword!=null && keyword.length()>0){
					employerCriteria.setKeyword(keyword);
				}
				result = browseDao.listEmployerProfileByCriteria
					(employerCriteria, startIndex, endIndex);
			}
			if(type.equals("Group")){
				addToGroupSearch();
				if(keyword!=null && keyword.length()>0){
					groupSearchCriteria.setKeyword(keyword);
				}
				result = browseDao.listGroupByCriteria(
					groupSearchCriteria, startIndex, endIndex);
			}
			if(type.equals("Opportunity")){
				addToOppsSearch();
				if(keyword!=null && keyword.length()>0){
					oppsSearchCriteria.setKeyword(keyword);
				}
				result = browseDao.listOpportunitiesByCriteria(
					oppsSearchCriteria, startIndex, endIndex);
			}
			return type;
		}catch(Exception e){
			e.printStackTrace();
			return ERROR;
		}
	}
	private void addToEmployeeSearch() {
		// TODO Auto-generated method stub
		int i=0;
		for(String category:categories){
			if(category.equals(BrowseEmployeeAction.EDU_LEVEL)){
				employeeCriteria.addToEducation(values.get(i++));
			}else if(category.equals(BrowseEmployeeAction.LOCATION)){
				employeeCriteria.addToLocations(values.get(i++));
			}else{
				employeeCriteria.addToSkills(values.get(i++));
			}
		}
	}
	private void addToEmployerSearch() {
		// TODO Auto-generated method stub
		int i=0;
		for(String category:categories){
			if(category.equals(BrowseEmployerAction.INDUSTRY)){
				employerCriteria.addToIndustry(values.get(i++));
			}else if(category.equals(BrowseEmployerAction.LOCATIONS)){
				employerCriteria.addToLocation(values.get(i++));
			}else{
				employerCriteria.setOppCount(new Integer(values.get(i++)));
			}
		}
	}
	private void addToGroupSearch() {
		// TODO Auto-generated method stub
		int i=0;
		for(String category:categories){
			if(category.equals(BrowseGroupAction.LOCATIONS)){
				groupSearchCriteria.addToLocations(values.get(i++));
			}else{
				groupSearchCriteria.setMemberCount(new Integer(values.get(i++)));
			}
		}
	}
	private void addToOppsSearch() {
		// TODO Auto-generated method stub
		int i=0;
		for(String category:categories){
			if(category.equals(BrowseOpportunitiesAction.INDUSTRY)){
				oppsSearchCriteria.addToIndustries(values.get(i++));
			}else if(category.equals(BrowseOpportunitiesAction.LOCATIONS)){
				oppsSearchCriteria.addToLocations(values.get(i++));
			}else if(category.equals(BrowseOpportunitiesAction.SALRANGE)){
				oppsSearchCriteria.addToSalaryRange(values.get(i++));
			}else{
				oppsSearchCriteria.addToSkills(values.get(i++));
			}
		}
	}
	

}
