package com.mob.view.action.group;

import com.mob.group.service.GroupService;
import com.mob.model.Role;
import com.mob.model.User;
import com.mob.model.profile.Profile;
import com.opensymphony.xwork2.ActionSupport;

public class DeleteGroupMemberAction extends ActionSupport {


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Profile  profile;
	private  long  groupId;
	private GroupService groupService;

	public String deleteGroupMembers() {
		System.out.println("deleteGroupMembers" +profile.getId());
		groupService.deleteJoinGroupMembers(profile, groupId);
		return "success";
	}


	

	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}


	public long getGroupId() {
		return groupId;
	}

	public void setGroupId(long groupId) {
		this.groupId = groupId;
	}

	public GroupService getGroupService() {
		return groupService;
	}

	public void setGroupService(GroupService groupService) {
		this.groupService = groupService;
	}


}