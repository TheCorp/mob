package com.mob.model.profile;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="employmenthistory")
public class WorkExperience {
	
    private long id;
	private String employerName;
	private String jobType;
	private String description;
	
	private Date workStart;

	private Date workEnd;
	
	private boolean isCurrent;
	
	private Profile workExperienceProfile;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="id")	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	
	@Column(name="organizationname")
	public String getEmployerName() {
		return employerName;
	}
	public void setEmployerName(String employerName) {
		this.employerName = employerName;
	}
	@Column(name="jobtype")
	public String getJobType() {
		return jobType;
	}
	public void setJobType(String jobType) {
		this.jobType = jobType;
	}
	@Column(name="description")
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@Column(name="startdate")
	public Date getWorkStart() {
		return workStart;
	}
	public void setWorkStart(Date workStart) {
		this.workStart = workStart;
	}
	@Column(name="enddate")
	public Date getWorkEnd() {
		return workEnd;
	}
	public void setWorkEnd(Date workEnd) {
		this.workEnd = workEnd;
	}
	
	
	@Column(name="current")
	public boolean isCurrent() {
		return isCurrent;
	}
	public void setCurrent(boolean isCurrent) {
		this.isCurrent = isCurrent;
	}
	@ManyToOne
	@JoinColumn(name ="profile_id", referencedColumnName = "id")
	public Profile getWorkExperienceProfile() {
		
		return workExperienceProfile;
	}
	public void setWorkExperienceProfile(Profile workExperienceProfile) {
		this.workExperienceProfile = workExperienceProfile;
	}
	
	
	
	
	
	
	
	
	
	
	
}
