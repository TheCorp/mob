package com.mob.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.acegisecurity.GrantedAuthority;

import com.mob.model.group.GroupAdmin;

@Entity
@Table(name = "role")
public class Role implements GrantedAuthority{
	
	private long id;
	private String name;
	private Set<GroupAdmin> groupAdmin =new HashSet<GroupAdmin>();
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public long getId() {
		return id;
	}


	public void setId(long id) {
		this.id = id;
	}


	@Column(name="name")
	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}

	@Transient
	public String getAuthority() {
		return name;
	}


	@OneToMany
	@JoinColumn(name="roleid")
	public Set<GroupAdmin> getGroupAdmin() {
		return groupAdmin;
	}


	public void setGroupAdmin(Set<GroupAdmin> groupAdmin) {
		this.groupAdmin = groupAdmin;
	}

	
	
	
}
