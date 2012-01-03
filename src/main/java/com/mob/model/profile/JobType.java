package com.mob.model.profile;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name = "jobtype")
public class JobType {
	
	private long id;
	private String jobtypename;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	
	@Column(name="jobtypename")
	public String getJobtypename() {
		return jobtypename;
	}
	public void setJobtypename(String jobtypename) {
		this.jobtypename = jobtypename;
	}
	
	


}
