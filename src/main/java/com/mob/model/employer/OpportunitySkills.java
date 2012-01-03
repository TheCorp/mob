package com.mob.model.employer;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
//@PrimaryKeyJoinColumn(name="category_id")
@Table(name = "opportunity_skills")

public class OpportunitySkills {

	//private EmployerProfile profileOwner;
	private Opportunity opprtunityOwner ;
	private long id;
	private String skillsNeeded;
	private String level;
	
	private String jobType;
	private String noOfYears;
	private String skillscategory;
	private String notes;
	
	
	 @Id
	 @GeneratedValue(strategy=GenerationType.AUTO)
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	
	
	
	@Column(name="skillNeeded")
	public String getSkillsNeeded() {
		return skillsNeeded;
	}
	public void setSkillsNeeded(String skillsNeeded) {
		this.skillsNeeded = skillsNeeded;
	}
	
	@Column(name="level")
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	
	@Column(name="jobType")
	public String getJobType() {
		return jobType;
	}
	public void setJobType(String jobType) {
		this.jobType = jobType;
	}
	
	@ManyToOne
	@JoinColumn(name ="opportunity_id", referencedColumnName = "id")
	public Opportunity getOpprtunityOwner() {
		return opprtunityOwner;
	}
	public void setOpprtunityOwner(Opportunity opprtunityOwner) {
		this.opprtunityOwner = opprtunityOwner;
	}
	
	@Column(name="noOfYears")
	public String getNoOfYears() {
		return noOfYears;
	}
	public void setNoOfYears(String noOfYears) {
		this.noOfYears = noOfYears;
	}
	
	
	@Column(name="notes")
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	@Column(name="category")
	public String getSkillscategory() {
		return skillscategory;
	}
	public void setSkillscategory(String skillscategory) {
		this.skillscategory = skillscategory;
	}
	
	
	
}
