package com.mob.model.profile;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "salary")
public class Salary {
 private long id;
 private String range;
 //private String type;
 
 @Id
 @GeneratedValue(strategy=GenerationType.IDENTITY)
public long getId() {
	return id;
}
public void setId(long id) {
	this.id = id;
}

@Column(name="range")
public String getRange() {
	return range;
}
public void setRange(String range) {
	this.range = range;
}

}
