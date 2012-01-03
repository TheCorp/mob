package com.mob.browse.service;

import java.util.ArrayList;
import java.util.List;

import com.mob.model.profile.Education;
import com.mob.model.profile.Skills;

public class EmployeeSearchCriteria {

	private boolean searchByLocation = false;
	private boolean searchByEducation = false;
	private boolean searchBySkills = false;
	
	private List<String> location = new ArrayList<String>();
	private List<String> education = new ArrayList<String>();
	private List<String> skill = new ArrayList<String>();

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
	public boolean isSearchByEducation() {
		return searchByEducation;
	}
	public void setSearchByEducation(boolean searchByEducation) {
		this.searchByEducation = searchByEducation;
	}
	public boolean isSearchBySkills() {
		return searchBySkills;
	}
	public void setSearchBySkills(boolean searchBySkills) {
		this.searchBySkills = searchBySkills;
	}
	public List<String> getLocation() {
		return location;
	}
	public void setLocation(List<String> location) {
		this.location = location;
	}
	public List<String> getEducation() {
		return education;
	}
	public void setEducation(List<String> education) {
		this.education = education;
	}
	public List<String> getSkill() {
		return skill;
	}
	public void setSkill(List<String> skill) {
		this.skill = skill;
	}
	
	public void addToEducation(String education){
		this.education.add(education);
		this.searchByEducation = true;
	}
	public void addToLocations(String location){
		this.location.add(location);
		this.searchByLocation = true;
	}
	public void addToSkills(String skill){
		this.skill.add(skill);
		this.searchBySkills = true;
	}
	public void removeFromEducations(String education){
		this.education.remove(education);
		if(this.education.isEmpty()){
			this.searchByEducation = false;
		}
	}
	public void removeFromLocations(String location){
		this.location.remove(location);
		if(this.location.isEmpty()){
			this.searchByLocation = false;
		}
	}
	public void removeFromSkills(String skill){
		this.skill.remove(skill);
		if(this.skill.isEmpty()){
			this.searchBySkills = false;
		}
	}

}
