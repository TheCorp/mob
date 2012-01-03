package com.mob.model.group;




import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.mob.model.User;
import com.mob.model.profile.Profile;
 
@Entity
@Table(name="grouptopics")
public class Topics {

	private long id;
	private String topic;
	private String  description;
	private Date createdDate;
	private Group group;
	private User user;
	private Profile profile;
	private Profile discussionprofiles;
	private GroupDiscussions latestDiscussion;
	private GroupDiscussions latestDiscussionDate;
	private List<GroupDiscussions> discussionList;
	private List<Profile> grouptopicsProfiles = new ArrayList<Profile>();
	private boolean flagged;
	private boolean flagdelete;
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id")	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}


	@Column(name="topic")
	public String getTopic() {
		return topic;
	}
	public void setTopic(String topic) {
		this.topic = topic;
	}
	@Column(name="description")
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	@Column(name="createddate")
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	@ManyToOne
	@JoinColumn(name = "groupid")
	public Group getGroup() {
		return group;
	}
	public void setGroup(Group group) {
		this.group = group;
	}

/*	@ManyToOne
	@JoinColumn(name = "userid")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	*/
	@ManyToOne
	@JoinColumn(name = "profileid")
	public Profile getProfile() {
		return profile;
	}
	public void setProfile(Profile profile) {
		this.profile = profile;
	}
	
	
	
	
	
	  @Transient
	public List<Profile> getGrouptopicsProfiles() {
		return grouptopicsProfiles;
	}
	public void setGrouptopicsProfiles(List<Profile> grouptopicsProfiles) {
		this.grouptopicsProfiles = grouptopicsProfiles;
	}
	
	 @Transient
	public List<GroupDiscussions> getDiscussionList() {
		return discussionList;
	}
	public void setDiscussionList(List<GroupDiscussions> discussionList) {
		this.discussionList = discussionList;
	}
	 @Transient
	public Profile getDiscussionprofiles() {
		return discussionprofiles;
	}
	public void setDiscussionprofiles(Profile discussionprofiles) {
		this.discussionprofiles = discussionprofiles;
	}
	 @Transient
	public GroupDiscussions getLatestDiscussion() {
		return latestDiscussion;
	}
	public void setLatestDiscussion(GroupDiscussions latestDiscussion) {
		this.latestDiscussion = latestDiscussion;
	}
	 @Transient
	public GroupDiscussions getLatestDiscussionDate() {
		return latestDiscussionDate;
	}
	public void setLatestDiscussionDate(GroupDiscussions latestDiscussionDate) {
		this.latestDiscussionDate = latestDiscussionDate;
	}
	@Column(name="flagged")
	public boolean isFlagged() {
		return flagged;
	}
	public void setFlagged(boolean flagged) {
		this.flagged = flagged;
	}
	@Column(name="flagdelete")
	public boolean isFlagdelete() {
		return flagdelete;
	}
	public void setFlagdelete(boolean flagdelete) {
		this.flagdelete = flagdelete;
	}
	
	 
	





}

