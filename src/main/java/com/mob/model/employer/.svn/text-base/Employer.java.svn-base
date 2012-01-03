package com.mob.model.employer;

import java.io.File;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.mob.model.User;
import com.mob.model.profile.EmployerProfile;
import com.mob.model.profile.Industry;
import com.mob.model.profile.Profile;
import com.mob.service.amazon.impl.AmazonServiceImpl;

/**
 * Created by IntelliJ IDEA. User: ezone Date: Jul 16, 2008 Time: 6:05:52 PM To
 * change this template use File | Settings | File Templates.
 */
@Entity
@PrimaryKeyJoinColumn(name = "user_id")
@Table(name = "employer")
public class Employer extends User {

	private Set<EmployerProfile> employerProfile = new HashSet<EmployerProfile>();

	private EmployerProfile employer1Profile;
	private String organizationName;
	private String noOfEmployees;
	private String location;
	private String culture;
	private String additionalInfo;
	private String orgInfo;
	private String emplrOrgName;
	private String address1;
	private String address2;
	private String missionstatement;
	private String website;
	private String phonenumber;
	private String emplrorganizationInfo;
	private String emplrorganizationCulture;
	private String whyChooseUs;
	private Industry industry;
	private String resizedMinPicture;
	private String picture;

	// private Profile profileOwner;
	private File upload;
	private String resizedMidPicture;
	private List<String> urls = new ArrayList<String>();

	@Column(name = "location")
	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	@Column(name = "noofemployees")
	public String getNoOfEmployees() {
		return noOfEmployees;
	}

	public void setNoOfEmployees(String noOfEmployees) {
		this.noOfEmployees = noOfEmployees;
	}

	@Column(name = "organizationname")
	public String getOrganizationName() {
		return organizationName;
	}

	public void setOrganizationName(String organizationName) {
		this.organizationName = organizationName;
	}

	@OneToMany
	@JoinColumn(name = "user_id")
	public Set<EmployerProfile> getEmployerProfile() {
		return employerProfile;
	}

	public void setEmployerProfile(Set<EmployerProfile> employerProfile) {
		this.employerProfile = employerProfile;
	}

	@Transient
	public EmployerProfile getEmployer1Profile() {
		return employer1Profile;
	}

	public void setEmployer1Profile(EmployerProfile employer1Profile) {
		this.employer1Profile = employer1Profile;
	}

	@Transient
	public String getEmplrOrgName() {
		return organizationName;
	}

	public void setEmplrOrgName(String emplrOrgName) {
		this.emplrOrgName = emplrOrgName;
	}

	@Column(name = "culture")
	public String getCulture() {
		return culture;
	}

	public void setCulture(String culture) {
		this.culture = culture;
	}

	@Column(name = "additionalinfo")
	public String getAdditionalInfo() {
		return additionalInfo;
	}

	public void setAdditionalInfo(String additionalInfo) {
		this.additionalInfo = additionalInfo;
	}

	@Column(name = "orginfo")
	public String getOrgInfo() {
		return orgInfo;
	}

	public void setOrgInfo(String orgInfo) {
		this.orgInfo = orgInfo;
	}

	@Transient
	public String getDisplayName() {
		return organizationName;
	}

	@Column(name = "address1")
	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	@Column(name = "address2")
	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	@Column(name = "missionstatement")
	public String getMissionstatement() {
		return missionstatement;
	}

	public void setMissionstatement(String missionstatement) {
		this.missionstatement = missionstatement;
	}

	@Column(name = "website")
	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	@Column(name = "phonenumber")
	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	@Column(name = "emplrorgnfo")
	public String getEmplrorganizationInfo() {
		return emplrorganizationInfo;
	}

	public void setEmplrorganizationInfo(String emplrorganizationInfo) {
		this.emplrorganizationInfo = emplrorganizationInfo;
	}

	@Column(name = "emplrorgculture")
	public String getEmplrorganizationCulture() {
		return emplrorganizationCulture;
	}

	public void setEmplrorganizationCulture(String emplrorganizationCulture) {
		this.emplrorganizationCulture = emplrorganizationCulture;
	}

	@Column(name = "whychooseus")
	public String getWhyChooseUs() {
		return whyChooseUs;
	}

	public void setWhyChooseUs(String whyChooseUs) {
		this.whyChooseUs = whyChooseUs;
	}

	@Transient
	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	@Column(name = "resizedMidPicture")
	public String getResizedMidPicture() {
		return resizedMidPicture;
	}

	public void setResizedMidPicture(String resizedMidPicture) {
		this.resizedMidPicture = resizedMidPicture;
	}

	@Transient
	public List<String> getUrls() {
		return urls;
	}

	public void setUrls(List<String> urls) {
		this.urls = urls;
	}

	@Transient
	public List getAmazonFileURL() {
		if (picture != null) {
			urls.add(picture);
		}
		if (resizedMidPicture != null) {
			urls.add(resizedMidPicture);
		}
		if (resizedMinPicture != null) {
			urls.add(resizedMinPicture);
		}

		return AmazonServiceImpl.getSignedUrl("mob_EmployerProfile", urls);
	}

	@OneToOne
	@JoinColumn(name = "industry_id")
	public Industry getIndustry() {
		return industry;
	}

	public void setIndustry(Industry industry) {
		this.industry = industry;
	}

	@Column(name = "resizedMinPicture")
	public String getResizedMinPicture() {
		return resizedMinPicture;
	}

	public void setResizedMinPicture(String resizedMinPicture) {
		this.resizedMinPicture = resizedMinPicture;
	}

	@Column(name = "picture")
	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	private String midPictureAmazon;

	@Transient
	public String getMidPictureFromAmazon() {
		if (midPictureAmazon != null || resizedMidPicture == null) {
			return midPictureAmazon;
		} else {
			List<String> url = new ArrayList<String>();
			url.add(resizedMidPicture);
			List<String> resMidPics = AmazonServiceImpl.getSignedUrl(
					"mob_EmployerProfile", url);
			if (resMidPics != null) {
				midPictureAmazon = resMidPics.get(0);
				return midPictureAmazon;
			} else {
				return null;
			}
		}
	}

	private String pictureAmazon;

	@Transient
	public String getPictureFromAmazon() {
		if (pictureAmazon != null || picture == null) {
			return pictureAmazon;
		} else {
			List<String> url = new ArrayList<String>();
			url.add(picture);
			List<String> resPics = AmazonServiceImpl.getSignedUrl(
					"mob_EmployerProfile", url);
			if (resPics != null) {
				pictureAmazon  = resPics.get(0);
				return pictureAmazon;
			} else {
				return null;
			}
		}
	}	

	private String minPictureAmazon;

	@Transient
	public String getMinPictureFromAmazon() {
		if (minPictureAmazon != null || resizedMinPicture == null) {
			return minPictureAmazon;
		} else {
			List<String> url = new ArrayList<String>();
			url.add(resizedMinPicture);
			List<String> resMinPics = AmazonServiceImpl.getSignedUrl(
					"mob_EmployerProfile", url);
			if (resMinPics != null) {
				minPictureAmazon = resMinPics.get(0);
				return minPictureAmazon;
			} else {
				return null;
			}
		}
	}
}