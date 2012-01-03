package com.mob.model.profile;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="userskills")
public class SkillsDetails {
	
    private long id;
	private String level;
	private String notes;
	private String experience;
	private String skillName;
	
	private Profile profileOwner;
	//private Skills skills;
	
	private SkillsCategory category;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="id")	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	
	@Column(name="level")
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	
	@Column(name="notes")
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	
	@Column(name="experience")
	public String getExperience() {
		return experience;
	}
	public void setExperience(String experience) {
		this.experience = experience;
	}
	
	@ManyToOne
	@JoinColumn(name ="profile_id")
	public Profile getProfileOwner() {
		return profileOwner;
	}
	public void setProfileOwner(Profile profileOwner) {
		this.profileOwner = profileOwner;
	}
	@Column(name="skillname")
	public String getSkillName() {
		return skillName;
	}
	public void setSkillName(String skillName) {
		this.skillName = skillName;
	}
	
	@ManyToOne
	@JoinColumn(name="categoryId")
	public SkillsCategory getCategory() {
		return category;
	}
	public void setCategory(SkillsCategory category) {
		this.category = category;
	}
	
	
	
}
