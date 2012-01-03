package com.mob.model;

import java.util.List;

import com.mob.model.group.GroupDiscussions;
import com.mob.model.group.Topics;
import com.mob.model.profile.Item;
import com.mob.model.profile.Profile;

public class FlaggedInformation {
	
	private User user;
	private List<String> comments;
	private List<String> flaggedCategoryType;
	private Profile profile;
	private Item item;
	private GroupDiscussions groupDiscussions;
	private com.mob.model.group.Group group;
	private Topics topics;
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<String> getComments() {
		return comments;
	}
	public void setComments(List<String> comments) {
		this.comments = comments;
	}
	public Profile getProfile() {
		return profile;
	}
	public void setProfile(Profile profile) {
		this.profile = profile;
	}
	public Item getItem() {
		return item;
	}
	public void setItem(Item item) {
		this.item = item;
	}
	public List<String> getFlaggedCategoryType() {
		return flaggedCategoryType;
	}
	public void setFlaggedCategoryType(List<String> flaggedCategoryType) {
		this.flaggedCategoryType = flaggedCategoryType;
	}
	public GroupDiscussions getGroupDiscussions() {
		return groupDiscussions;
	}
	public void setGroupDiscussions(GroupDiscussions groupDiscussions) {
		this.groupDiscussions = groupDiscussions;
	}
	public com.mob.model.group.Group getGroup() {
		return group;
	}
	public void setGroup(com.mob.model.group.Group group) {
		this.group = group;
	}
	public Topics getTopics() {
		return topics;
	}
	public void setTopics(Topics topics) {
		this.topics = topics;
	}
	
}
