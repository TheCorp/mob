package com.mob.model.profile;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import com.mob.model.employer.Employer;
import com.mob.model.employer.Opportunity;


@Entity
@PrimaryKeyJoinColumn(name="profile_id")
@Table(name = "employerprofile")
public class EmployerProfile extends Profile {
	
	
	private Employer employer;
	private Set<Opportunity> opportunities =new HashSet<Opportunity>();
	
	private String companyName;
	private String biography;
	private String culture;
	private String others;
	private String opportunity;
	private String website;
	private String phonenumber;
	private String emplrorganizationInfo;
	private String whyChooseUs;
	
	@Column(name="companyname")
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	
	@Column(name="biography")
	public String getBiography() {
		return biography;
	}
	public void setBiography(String biography) {
		this.biography = biography;
	}
	@Column(name="culture")
	public String getCulture() {
		return culture;
	}
	public void setCulture(String culture) {
		this.culture = culture;
	}
	@Column(name="others")
	public String getOthers() {
		return others;
	}
	public void setOthers(String others) {
		this.others = others;
	}
	@Column(name="opportunity")
	public String getOpportunity() {
		return opportunity;
	}
	public void setOpportunity(String opportunity) {
		this.opportunity = opportunity;
	}
	

	@OneToMany(cascade = CascadeType.REMOVE,mappedBy="profileOwner")
	public Set<Opportunity> getOpportunities() {
		return opportunities;
	}
	public void setOpportunities(Set<Opportunity> opportunities) {
		this.opportunities = opportunities;
	}
	
	@ManyToOne
	@JoinColumn(name ="user_id")
	public Employer getEmployer() {
		return employer;
	}
	public void setEmployer(Employer profileOwner) {
		this.employer = profileOwner;
	}
	@Column(name="website")
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	@Column(name="phonenumber")
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	@Column(name="emplrorganizationInfo")
	public String getEmplrorganizationInfo() {
		return emplrorganizationInfo;
	}
	public void setEmplrorganizationInfo(String emplrorganizationInfo) {
		this.emplrorganizationInfo = emplrorganizationInfo;
	}
	@Column(name="whyChooseUs")
	public String getWhyChooseUs() {
		return whyChooseUs;
	}
	public void setWhyChooseUs(String whyChooseUs) {
		this.whyChooseUs = whyChooseUs;
	}
	
	
}
