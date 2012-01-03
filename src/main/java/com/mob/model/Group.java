package com.mob.model;

import java.io.File;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.mob.model.profile.Profile;
 
@Entity
@Table(name="groups")
@PrimaryKeyJoinColumn(name="creator_id")
public class Group {

	private long id;
	private String name;
	private String title;
	private String description;
	private File icon;
	private Profile creator;
	
	
	private Set<Profile> profiles = new HashSet<Profile>();
	
    @Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id")	
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
	@Column(name="title")
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Column(name="description")
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	@Transient
	public File getIcon() {
		return icon;
	}
	public void setIcon(File icon) {
		this.icon = icon;
	}
	@ManyToOne
	@JoinColumn(name="creator_id",referencedColumnName="id")	
	public Profile getCreator(){
	    return this.creator;
	}


	
	public void setCreator(Profile creator) {
		this.creator = creator;
	}
	
	
	
	/*@ManyToMany
	 @JoinTable(name = "group_members", 
	 joinColumns={@JoinColumn(name="group_id",referencedColumnName="id")}, 
	 inverseJoinColumns={@JoinColumn(name="member_id",referencedColumnName="id")})
	public Set<Profile> getProfiles() {
		return profiles;
	}
	
	
	public void setProfiles(Set<Profile> profiles) {
		this.profiles = profiles;
	}*/
	
	
	
}

