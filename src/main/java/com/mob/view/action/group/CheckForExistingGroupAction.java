package com.mob.view.action.group;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.group.service.GroupService;
import com.mob.model.User;
import com.mob.model.group.Group;
import com.mob.model.group.Topics;
import com.opensymphony.xwork2.ActionSupport;

public class CheckForExistingGroupAction extends ActionSupport {

	private GroupService  groupService;
	private Group group;

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public String checkForExistingGroup() {
		groupService.checkForExistingGroup(group);
		return "success";
	}
	public Group getGroup() {
		return group;
	}

	public void setGroup(Group group) {
		this.group = group;
	}

	public GroupService getGroupService() {
		return groupService;
	}

	public void setGroupService(GroupService groupService) {
		this.groupService = groupService;
	}
	
	
}