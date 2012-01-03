package com.mob.view.action.group;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.group.service.GroupService;
import com.mob.model.User;
import com.mob.model.group.Group;
import com.mob.model.group.Topics;
import com.mob.model.profile.Profile;
import com.opensymphony.xwork2.ActionSupport;

public class AcceptDenyGroupAction extends ActionSupport {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Profile  profile;
	private Group  group; 
	private long  groupId;
	private GroupService groupService;
	public String acceptGroupJoinedProfile() {
		System.out.println("profile:List" +profile.getId());
		System.out.println("Group:List" +groupId);
		groupService.acceptGroupRequest(profile,groupId);
		return "success";
	}
	
	public String denyGroupJoinedProfile() {
		groupService.denyGroupRequest(profile,groupId);
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