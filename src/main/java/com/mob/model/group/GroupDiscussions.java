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

import com.mob.model.profile.Profile;

@Entity
@Table(name = "groupdiscussions")
public class GroupDiscussions {

	private long id;
	private Profile profile;
	private String discussions;
	private Date createdDate;
	private Topics topics;
	private boolean flagged;
	private boolean flagdelete;
	private List<Profile> groupDiscussionsProfiles = new ArrayList<Profile>();
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	
	@Column(name="message")
	public String getDiscussions() {
		return discussions;
	}
	public void setDiscussions(String discussions) {
		this.discussions = discussions;
	}
	@Column(name="createddate")
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
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
	
	@ManyToOne
	@JoinColumn(name = "profileid")
	public Profile getProfile() {
		return profile;
	}
	public void setProfile(Profile profile) {
		this.profile = profile;
	}
	

	@ManyToOne
	@JoinColumn(name = "topicid")
	public Topics getTopics() {
		return topics;
	}
	public void setTopics(Topics topics) {
		this.topics = topics;
	}
	
	  @Transient
	public List<Profile> getGroupDiscussionsProfiles() {
		return groupDiscussionsProfiles;
	}
	public void setGroupDiscussionsProfiles(List<Profile> groupDiscussionsProfiles) {
		this.groupDiscussionsProfiles = groupDiscussionsProfiles;
	}
	
	
	

}
