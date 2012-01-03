package com.mob.view.action.group;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.group.service.GroupService;
import com.mob.model.User;
import com.mob.model.group.Group;
import com.mob.model.profile.Profile;
import com.opensymphony.xwork2.ActionSupport;

public class JoinGroupAction extends ActionSupport {
	private GroupService  groupService;
	private User  user;
	private Group group;
	private  String  groupId;
	private Profile profile;
	private String  message;
	private Group myGroup;

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public String joinGroup() {
		user = (User)SecurityContextHolder.getContext().
        getAuthentication().getPrincipal();
		groupService.joinGroup(user,myGroup,profile,message);
		return "success";
	}

	public GroupService getGroupService() {
		return groupService;
	}

	public void setGroupService(GroupService groupService) {
		this.groupService = groupService;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Group getGroup() {
		return group;
	}

	public void setGroup(Group group) {
		this.group = group;
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Group getMyGroup() {
		return myGroup;
	}

	public void setMyGroup(Group myGroup) {
		this.myGroup = myGroup;
	}
	
	


}