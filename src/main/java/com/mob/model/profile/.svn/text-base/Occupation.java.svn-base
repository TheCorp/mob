package com.mob.model.profile;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="occupation")
public class Occupation {
	
	private long id;
	private String occupationname;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	
	@Column(name="occupationname")
	public String getOccupationname() {
		return occupationname;
	}
	public void setOccupationname(String occupationname) {
		this.occupationname = occupationname;
	}

}
