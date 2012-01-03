package com.mob.browse.service;

import java.util.ArrayList;
import java.util.List;

import com.mob.model.profile.Industry;

public class EmployerSearchCriteria {
	private boolean searchByLocation;
	private boolean searchByIndustry;
	private boolean searchByOpportunities;
	
	private List<String> location = new ArrayList<String>();
	private List<String> industry = new ArrayList<String>();
	private int oppCount;

	private String keyword;
	private boolean searchByKeyword = false;
	
	public boolean isSearchByKeyword() {
		return searchByKeyword;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
		this.searchByKeyword = true;
	}
	
	
	public boolean isSearchByLocation() {
		return searchByLocation;
	}
	public void setSearchByLocation(boolean searchByLocation) {
		this.searchByLocation = searchByLocation;
	}
	public boolean isSearchByIndustry() {
		return searchByIndustry;
	}
	public void setSearchByIndustry(boolean searchByIndustry) {
		this.searchByIndustry = searchByIndustry;
	}
	public boolean isSearchByOpportunities() {
		return searchByOpportunities;
	}
	public void setSearchByOpportunities(boolean searchByOpportunities) {
		this.searchByOpportunities = searchByOpportunities;
	}
	public List<String> getLocation() {
		return location;
	}
	public void setLocation(List<String> location) {
		this.location = location;
	}
	public List<String> getIndustry() {
		return industry;
	}
	public void setIndustry(List<String> industry) {
		this.industry = industry;
	}
	public int getOppCount() {
		return oppCount;
	}
	public void setOppCount(int oppCount) {
		this.oppCount = oppCount;
		if(this.oppCount>0){
			this.searchByOpportunities = true;
		}else{
			this.searchByOpportunities = false;
		}
	}

	public void addToIndustry(String industry){
		this.industry.add(industry);
		this.searchByIndustry = true;
	}
	public void addToLocation(String location){
		this.location.add(location);
		this.searchByLocation = true;
	}
	public void removeFromIndustries(Industry industry){
		this.industry.remove(industry);
		if(this.industry.isEmpty()){
			this.searchByIndustry=false;
		}
	}
	public void removeFromLocations(String location){
		this.location.remove(location);
		if(this.location.isEmpty()){
			this.searchByLocation=false;
		}
	}
}

