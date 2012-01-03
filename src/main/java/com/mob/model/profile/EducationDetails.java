package com.mob.model.profile;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="educationdetails")
public class EducationDetails {
	
	private long id;
	private String educationname;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getEducationname() {
		return educationname;
	}
	public void setEducationname(String educationname) {
		this.educationname = educationname;
	}
	
	

}


