package com.mob.model.employer;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="skillsneeded_opportunity")
public class SkillsNeeded {
	
	private long id;
	private String skillname;
	
	
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
