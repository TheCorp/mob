package com.mob.model.profile;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "educationrequired")
public class EducationRequired {
	 private long id;
	 private String educationrequired;
	 
	 @Id
	 @GeneratedValue(strategy=GenerationType.IDENTITY)
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	@Column(name="education")
	public String getEducationrequired() {
		return educationrequired;
	}
	public void setEducationrequired(String educationrequired) {
		this.educationrequired = educationrequired;
	}

}
