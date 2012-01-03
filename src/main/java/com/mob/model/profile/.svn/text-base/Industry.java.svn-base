package com.mob.model.profile;

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

@Entity
@Table(name = "industry")
public class Industry {
	
	private long id;
	private String name;
	private Set<SkillsCategory> categories = new HashSet<SkillsCategory>();
	private Set<Profile> profile = new HashSet<Profile>();
	
	@Id
    @GeneratedValue(strategy=GenerationType.AUTO)
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
	
	@OneToMany
	@JoinColumn(name="industry_id")
	public Set<SkillsCategory> getCategories() {
		return categories;
	}
	public void setCategories(Set<SkillsCategory> categories) {
		this.categories = categories;
	}
	
	@OneToMany
	@JoinColumn(name="industry_id")
	public Set<Profile> getProfile() {
		return profile;
	}
	public void setProfile(Set<Profile> profile) {
		this.profile = profile;
	}

}
