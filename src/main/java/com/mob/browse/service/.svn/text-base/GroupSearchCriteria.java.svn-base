package com.mob.browse.service;

import java.util.ArrayList;
import java.util.List;

import com.mob.model.profile.Industry;

public class GroupSearchCriteria {
	private boolean searchByMembers = false;
	private boolean searchByLocation = false;
	
	private List<String> location = new ArrayList<String>();
	private int memberCount;

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
	
	
	public boolean isSearchByMembers() {
		return searchByMembers;
	}

	public boolean isSearchByLocation() {
		return searchByLocation;
	}

	public List<String> getLocation() {
		return location;
	}

	public void setLocation(List<String> location) {
		this.location = location;
	}
	

	public int getMemberCount() {
		return memberCount;
	}

	public void setMemberCount(int memberCount) {
		this.memberCount = memberCount;
		if(this.memberCount>0){
			this.searchByMembers = true;
		}else{
			this.searchByMembers = false;
		}
	}

	public void addToLocations(String location){
		this.location.add(location);
		this.searchByLocation = true;
	}
	public void removeFromLocations(String location){
		this.location.remove(location);
		this.searchByLocation = false;
	}
}
