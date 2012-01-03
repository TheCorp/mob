package com.mob.view.action.group;

import java.util.List;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.group.service.GroupService;
import com.mob.model.User;
import com.mob.model.group.Group;
import com.opensymphony.xwork2.ActionSupport;

public class ListOfMyGroups extends ActionSupport{
	
	
	private static final long serialVersionUID = 1L;
	private List<com.mob.dto.GroupMember> listOfMyJoinedGroups;
	private List<com.mob.dto.GroupMember> listOfMyJoinedPrivateGroups;
	private List<Group> listOfMyGroups;
	private GroupService groupService;

	public String listOfGroups(){

		User user = (User) SecurityContextHolder.getContext().getAuthentication()
		  .getPrincipal();
		listOfMyGroups=	groupService.findAllMyOwnGroups(user) ;
		listOfMyJoinedGroups=groupService.findAllMyJoinedGroups(user); 
		listOfMyJoinedPrivateGroups=groupService.findAllMyJoinedPrivateGroups(user); 
		System.out.println("listOfMyJoinedPrivateGroups" +listOfMyJoinedPrivateGroups.size());
		return "success";
    }

	public GroupService getGroupService() {
		return groupService;
	}

	

	public List<Group> getListOfMyGroups() {
		return listOfMyGroups;
	}

	public void setListOfMyGroups(List<Group> listOfMyGroups) {
		this.listOfMyGroups = listOfMyGroups;
	}




	public void setGroupService(GroupService groupService) {
		this.groupService = groupService;
	}

	public List<com.mob.dto.GroupMember> getListOfMyJoinedGroups() {
		return listOfMyJoinedGroups;
	}

	public void setListOfMyJoinedGroups(
			List<com.mob.dto.GroupMember> listOfMyJoinedGroups) {
		this.listOfMyJoinedGroups = listOfMyJoinedGroups;
	}

	public List<com.mob.dto.GroupMember> getListOfMyJoinedPrivateGroups() {
		return listOfMyJoinedPrivateGroups;
	}

	public void setListOfMyJoinedPrivateGroups(
			List<com.mob.dto.GroupMember> listOfMyJoinedPrivateGroups) {
		this.listOfMyJoinedPrivateGroups = listOfMyJoinedPrivateGroups;
	}


}
