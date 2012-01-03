package com.mob.view.action.group;

import java.util.ArrayList;
import java.util.List;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.group.service.GroupService;
import com.mob.model.User;
import com.mob.model.group.Group;
import com.mob.model.group.Topics;
import com.mob.model.profile.Profile;
import com.mob.services.BaseService;
import com.opensymphony.xwork2.ActionSupport;

public class SaveTopicAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Topics objTopics;
	private String description;
	private String topic;
	private Group group;
	private Profile profile;
	private User  user;
	private BaseService<Topics> baseServiceTopic; 
	private BaseService<Group> groupBaseService; 
	private List<Topics> listOfTopicConntent =new ArrayList<Topics>();
	private GroupService groupService;
	private List profileList;
	private long newTopicId;


	public String storeTopicsInformation(){
		user = (User)SecurityContextHolder.getContext().
		getAuthentication().getPrincipal();
		newTopicId=groupService.saveTopics(group,profile,user,objTopics);
		return "success";
	}



	public List<Topics> getListOfTopicConntent() {
		return listOfTopicConntent;
	}


	public void setListOfTopicConntent(List<Topics> listOfTopicConntent) {
		this.listOfTopicConntent = listOfTopicConntent;
	}




	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public String getTopic() {
		return topic;
	}


	public void setTopic(String topic) {
		this.topic = topic;
	}


	public Topics getObjTopics() {
		return objTopics;
	}


	public void setObjTopics(Topics objTopics) {
		this.objTopics = objTopics;
	}


	public BaseService<Topics> getBaseServiceTopic() {
		return baseServiceTopic;
	}


	public void setBaseServiceTopic(BaseService<Topics> baseServiceTopic) {
		this.baseServiceTopic = baseServiceTopic;
	}


	public Group getGroup() {
		return group;
	}


	public void setGroup(Group group) {
		this.group = group;
	}


	public BaseService<Group> getGroupBaseService() {
		return groupBaseService;
	}


	public void setGroupBaseService(BaseService<Group> groupBaseService) {
		this.groupBaseService = groupBaseService;
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


	public List getProfileList() {
		return profileList;
	}


	public void setProfileList(List profileList) {
		this.profileList = profileList;
	}



	public Profile getProfile() {
		return profile;
	}



	public void setProfile(Profile profile) {
		this.profile = profile;
	}



	public long getNewTopicId() {
		return newTopicId;
	}



	public void setNewTopicId(long newTopicId) {
		this.newTopicId = newTopicId;
	}


}
