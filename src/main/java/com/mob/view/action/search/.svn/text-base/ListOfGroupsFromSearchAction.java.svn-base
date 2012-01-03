package com.mob.view.action.search;

import java.util.Iterator;
import java.util.List;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.group.service.GroupService;
import com.mob.model.User;
import com.mob.model.group.Group;
import com.mob.model.profile.Profile;
import com.mob.services.BaseService;
import com.mob.services.SearchService;
import com.opensymphony.xwork2.ActionSupport;

public class ListOfGroupsFromSearchAction extends ActionSupport {
	private String groupName;
	private List<Group> ListOfgroups;
	private String search;
	private SearchService searchService;
	private List<Profile> profilList;
	private User user;
	private Profile profile;
	private GroupService groupService;
	private List<Group> listOfMyJoinedGroups;
	private List<Group> serchGroupResults;
	private BaseService<Group> groupBaseService;
	private boolean ChkGroupMember;
	
	public String checkGroups() {
		user = (User) SecurityContextHolder.getContext().getAuthentication()
		.getPrincipal();
		ListOfgroups = searchService.findAllGroupsFromSearch(search,user);
	
	
		profilList = searchService.findListOfEmployeeProfiles(profile, user
				.getId());
		return "success";
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public SearchService getSearchService() {
		return searchService;
	}

	public void setSearchService(SearchService searchService) {
		this.searchService = searchService;
	}

	public List<Group> getListOfgroups() {
		return ListOfgroups;
	}

	public void setListOfgroups(List<Group> listOfgroups) {
		ListOfgroups = listOfgroups;
	}

	public List<Profile> getProfilList() {
		return profilList;
	}

	public void setProfilList(List<Profile> profilList) {
		this.profilList = profilList;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}

	public GroupService getGroupService() {
		return groupService;
	}

	public void setGroupService(GroupService groupService) {
		this.groupService = groupService;
	}

	public List<Group> getListOfMyJoinedGroups() {
		return listOfMyJoinedGroups;
	}

	public void setListOfMyJoinedGroups(List<Group> listOfMyJoinedGroups) {
		this.listOfMyJoinedGroups = listOfMyJoinedGroups;
	}

	public List<Group> getSerchGroupResults() {
		return serchGroupResults;
	}

	public void setSerchGroupResults(List<Group> serchGroupResults) {
		this.serchGroupResults = serchGroupResults;
	}

	public BaseService<Group> getGroupBaseService() {
		return groupBaseService;
	}

	public void setGroupBaseService(BaseService<Group> groupBaseService) {
		this.groupBaseService = groupBaseService;
	}

	public boolean isChkGroupMember() {
		return ChkGroupMember;
	}

	public void setChkGroupMember(boolean chkGroupMember) {
		ChkGroupMember = chkGroupMember;
	}

	
}
