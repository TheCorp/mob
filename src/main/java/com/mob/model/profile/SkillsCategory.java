
package com.mob.model.profile;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "skillscategory")
public class SkillsCategory {
	
	private long id;
	private String name;
	//private String skills;
	private Industry industry;
	private Set<Skills> skills = new HashSet<Skills>();
	
	private Set<SkillsDetails> skilsDetails = new HashSet<SkillsDetails>();
	
	@OneToMany
	@JoinColumn(name="category_id")
	public Set<Skills> getSkills() {
		return skills;
	}
	public void setSkills(Set<Skills> skills) {
		this.skills = skills;
	}
	
	@ManyToOne
	@JoinColumn(name="industry_id")
	public Industry getIndustry() {
		return industry;
	}
	public void setIndustry(Industry industry) {
		this.industry = industry;
	}
	/*@Column(name="skills")
	public String getSkills() {
		return skills;
	}
	public void setSkills(String skills) {
		this.skills = skills;
	}*/
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
	@JoinColumn(name="categoryId")
	public Set<SkillsDetails> getSkilsDetails() {
		return skilsDetails;
	}
	public void setSkilsDetails(Set<SkillsDetails> skilsDetails) {
		this.skilsDetails = skilsDetails;
	}

}
