package com.mob.model.group;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.mob.model.Role;
import com.mob.model.profile.Profile;
 
@Entity
@Table(name="profile_group_role")
public class GroupAdmin {

	private long  id;
	private Profile profile;
	private Group group;
	private Role  role;
	
	
	
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
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
	@JoinColumn(name = "groupid")
	public Group getGroup() {
		return group;
	}
	public void setGroup(Group group) {
		this.group = group;
	}
	
	@ManyToOne
	@JoinColumn(name = "roleid")
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}

	


}

