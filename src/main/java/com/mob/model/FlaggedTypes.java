package com.mob.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name = "flaggedtype")
public class FlaggedTypes {
	
	
	
	 private long id;
	 private String typeFlag;
	 
	 @Id
	 @GeneratedValue(strategy=GenerationType.IDENTITY)
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	@Column(name="typeflag")
	public String getTypeFlag() {
		return typeFlag;
	}
	public void setTypeFlag(String typeFlag) {
		this.typeFlag = typeFlag;
	}
	
	
	
}
