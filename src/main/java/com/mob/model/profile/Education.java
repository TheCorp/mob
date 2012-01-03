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
@Table(name="education")

public class Education {
	
	
    private long id;
   
	private String schoolName;
	private String degree;
	private String concentration;
	private String gpa;
	private String honors;
	private Date courseStart;
	private Date courseEnd;
	 private long year;
	 private String major;
	 private String minor;
	
	private Profile owningProfile;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	} 
	@Column(name="schoolname")
	public String getSchoolName() {
		return schoolName;
	}
	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}
	@Column(name="degree")
	public String getDegree() {
		return degree;
	}
	public void setDegree(String degree) {
		this.degree = degree;
	}
	
	
	@Column(name="concentration")
	public String getConcentration() {
		return concentration;
	}
	public void setConcentration(String concentration) {
		this.concentration = concentration;
	}
	
	@Column(name="gpa")
	public String getGpa() {
		return gpa;
	}
	public void setGpa(String gpa) {
		this.gpa = gpa;
	}
	
	@Column(name="honors")
	public String getHonors() {
		return honors;
	}
	public void setHonors(String honors) {
		this.honors = honors;
	}
	
	
	@ManyToOne
	@JoinColumn(name = "profile_id")
	public Profile getOwningProfile() {
		return owningProfile;
	}
	public void setOwningProfile(Profile owningProfile) {
		this.owningProfile = owningProfile;
	}
	
	@Column(name="startdate")
	public Date getCourseStart() {
		return courseStart;
	}
	public void setCourseStart(Date courseStart) {
		this.courseStart = courseStart;
	}
	@Column(name="enddate")
	public Date getCourseEnd() {
		return courseEnd;
	}
	public void setCourseEnd(Date courseEnd) {
		this.courseEnd = courseEnd;
	}
	@Column(name="year")
	public long getYear() {
		return year;
	}
	public void setYear(long year) {
		this.year = year;
	}
	@Column(name="major")
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	@Column(name="minor")
	public String getMinor() {
		return minor;
	}
	public void setMinor(String minor) {
		this.minor = minor;
	}

	
	
	
	
}
