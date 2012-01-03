package com.mob.browse.service;

import java.util.ArrayList;
import java.util.List;

import com.mob.model.profile.Industry;
import com.mob.model.profile.Skills;

public class OpportunitySearchCriteria {
	private boolean searchBySkills;
	private boolean searchBySalaryRange;
	private boolean searchByLocation;
	private boolean searchByIndustry;
	
	private List<String> skill = new ArrayList<String>();
	private List<String> salaryRange = new ArrayList<String>();
	private List<String> locations = new ArrayList<String>();
	private List<String> industry = new ArrayList<String>();

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
	

	public boolean isSearchBySkills() {
		return searchBySkills;
	}
	public void setSearchBySkills(boolean searchBySkills) {
		this.searchBySkills = searchBySkills;
	}
	public boolean isSearchBySalaryRange() {
		return searchBySalaryRange;
	}
	public List<String> getSkill() {
		return skill;
	}
	public void setSkill(List<String> skill) {
		this.skill = skill;
	}
	public List<String> getSalaryRange() {
		return salaryRange;
	}
	public void setSalaryRange(List<String> salaryRange) {
		this.salaryRange = salaryRange;
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
	public List<String> getLocations() {
		return locations;
	}
	public void setLocations(List<String> locations) {
		this.locations = locations;
	}
	public List<String> getIndustry() {
		return industry;
	}
	public void setIndustry(List<String> industry) {
		this.industry = industry;
	}
	
	public void addToIndustries(String industry){
		this.industry.add(industry);
		this.searchByIndustry = true;
	}
	public void addToLocations(String location){
		this.locations.add(location);
		this.searchByLocation = true;
	}
	public void addToSkills(String skill){
		this.skill.add(skill);
		this.searchBySkills = true;
	}
	public void addToSalaryRange(String range){
		this.salaryRange.add(range);
		this.searchBySalaryRange = true;
	}
}
