package com.mob.model.profile;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name = "briefcasecategory")
public class BriefcaseCategory {
	
	private long id;
	private String briefcaseCategoryName;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public long getId() {
		return id;
	}
    @Column(name="category")
	public String getBriefcaseCategoryName() {
		return briefcaseCategoryName;
	}

	public void setBriefcaseCategoryName(String briefcaseCategoryName) {
		this.briefcaseCategoryName = briefcaseCategoryName;
	}

	public void setId(long id) {
		this.id = id;
	}
	
	

}
