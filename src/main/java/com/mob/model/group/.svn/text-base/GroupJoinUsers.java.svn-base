package com.mob.model.group;



import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.mob.model.profile.Profile;
 
@Entity
@Table(name="groupjoinusers")
public class GroupJoinUsers {

	//private User user;
	private Group group;
	private Profile  profile;
	private  long id;
	private boolean  groupType;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	/*	@OneToOne
	@JoinColumn(name = "userid")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	 */

	@OneToOne
	@JoinColumn(name = "groupid")
	public Group getGroup() {
		return group;
	}
	public void setGroup(Group group) {
		this.group = group;
	}

	@OneToOne
	@JoinColumn(name = "profileid")
	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}

	@Column(name = "groupType")
	public boolean isGroupType() {
		return groupType;
	}

	public void setGroupType(boolean groupType) {
		this.groupType = groupType;
	}



}

