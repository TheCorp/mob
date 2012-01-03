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
@Table(name="skills")
public class Skills {
	
	private long id;
	private String skillname;
	private SkillsCategory category;
	
	@ManyToOne
	@JoinColumn(name="category_id")
	public SkillsCategory getCategory() {
		return category;
	}
	public void setCategory(SkillsCategory category) {
		this.category = category;
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	
	@Column(name="skillname")
	public String getSkillname() {
		return skillname;
	}
	public void setSkillname(String skillname) {
		this.skillname = skillname;
	}
	

}



