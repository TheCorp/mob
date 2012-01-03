package com.mob.view.action.group;

import com.mob.group.service.GroupService;
import com.mob.model.Role;
import com.mob.model.User;
import com.mob.model.profile.Profile;
import com.opensymphony.xwork2.ActionSupport;

public class MakeGroupAdminAction extends ActionSupport {


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private User user;
	private Profile  profile;
	private  Role  role;
	private  long  groupId;
	private GroupService groupService;

	public String makeGroupAdmin() {
		groupService.makeGroupAdmin(profile,role,groupId);
		return "success";
	}
	public String removeGroupAdmin() {
		groupService.removeGroupAdmin(profile,  groupId);
		return "success";
	}
	
	public String makeGroupOwner() {
		groupService.removeGroupAdmin(profile,  groupId);
		groupService.makeGroupOwner(profile,role,groupId);
		return "success";
	}
	public String removeGroupOwner() {
		groupService.removeGroupOwner(profile,  groupId);
		return "success";
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

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
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