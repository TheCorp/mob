package com.mob.model.profile;

import java.io.File;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.mob.model.Contact;
import com.mob.model.PrivacyGroup;
import com.mob.model.User;
import com.mob.model.employer.Opportunity;
import com.mob.model.group.Group;
import com.mob.model.group.GroupAdmin;
import com.mob.service.amazon.impl.AmazonServiceImpl;

@Entity
@Table(name = "profile")
@Inheritance(strategy = InheritanceType.JOINED)
public class Profile {

	private User profileOwner;
	private long id;
	private String nickName;
	private String name;
	private String phoneNumber;

	private String occupation;
	private String daysavailable;
	private String hoursavailable;
	private String skills;
	private String location;
	// private String trainings;
	private String jobcategory;

	private String workTimeframe;
	// private File picture;
	// private String uploadContentType;
	// private String uploadFileName;
	// private String fileCaption;
	private String range;
	private String salaryType;
	private int noOfContacts;
	private String days;

	private String picture;
	private String resizedMidPicture;
	private String resizedMinPicture;
	private long viewCount;
	private String status;

	private long itemCount;
	private boolean flagged;
	private boolean flagdelete;
	private String personalStatement;
	private Industry industry;
	private String itemFileName;
	private File upload;
	private String aboutUs;
	private String workCulture;
	private String whyWorkHere;
	private String achievements;
	// private PhysicalTraits physicalTraits;
	// added on Nov 11,08
	/*
	 * private List<WorkExperience> experienceList = new
	 * ArrayList<WorkExperience>();
	 * 
	 * private List<Education> educationList = new ArrayList<Education>();
	 * 
	 * private List<Training> trainingList = new ArrayList<Training>();
	 */

	private Set<PayScale> payScales = new HashSet<PayScale>();
	private Set<Training> trainings = new HashSet<Training>();
	private Set<Education> education = new HashSet<Education>();
	private Set<WorkExperience> experience = new HashSet<WorkExperience>();
	private Set<Group> groups = new HashSet<Group>();

	private Set<Feedback> feedback = new HashSet<Feedback>();
	private Set<SkillsDetails> userSkills = new HashSet<SkillsDetails>();

	private Set<Opportunity> interestOpportunityOwner = new HashSet<Opportunity>();
	private Set<Opportunity> bookMarkOpportunityOwner = new HashSet<Opportunity>();

	private Set<Contact> contacts = new HashSet<Contact>();
	private Set<PrivacyGroup> privacyGroup = new HashSet<PrivacyGroup>();

	/**
	 * Added for group join for public and private
	 */
	private Set<Group> group = new HashSet<Group>();
	private Set<Group> groupUsers = new HashSet<Group>();
	private Set<GroupAdmin> groupAdmin = new HashSet<GroupAdmin>();
	private List<String> urls = new ArrayList<String>();

	/**
	 * 
	 * @return
	 */
	@OneToMany(cascade = CascadeType.REMOVE)
	@JoinColumn(name = "profile_id")
	public Set<PrivacyGroup> getPrivacyGroup() {
		return privacyGroup;
	}

	public void setPrivacyGroup(Set<PrivacyGroup> privacyGroup) {
		this.privacyGroup = privacyGroup;
	}

	@Transient
	public int getNoOfContacts() {
		return noOfContacts;
	}

	public void setNoOfContacts(int noOfContacts) {
		this.noOfContacts = noOfContacts;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	@OneToMany
	@JoinColumn(name = "profile_id")
	public Set<WorkExperience> getExperience() {
		return experience;
	}

	public void setExperience(Set<WorkExperience> experience) {
		this.experience = experience;
	}

	@OneToMany(mappedBy="owningProfile")
	public Set<Education> getEducation() {
		return education;
	}

	public void setEducation(Set<Education> education) {
		this.education = education;
	}

	@ManyToOne
	@JoinColumn(name = "user_id")
	public User getProfileOwner() {
		return profileOwner;
	}

	public void setProfileOwner(User profileOwner) {
		this.profileOwner = profileOwner;
	}

	@Transient
	public Set<PayScale> getPayScales() {
		return payScales;
	}

	public void setPayScales(Set<PayScale> payScales) {
		this.payScales = payScales;
	}

	@Column(name = "nickname")
	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	@Column(name = "phonenumber")
	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	@Column(name = "occupation")
	public String getOccupation() {
		return occupation;
	}

	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}

	@Column(name = "daysavailable")
	public String getDaysavailable() {
		return daysavailable;
	}

	public void setDaysavailable(String daysavailable) {
		this.daysavailable = daysavailable;
	}

	@Column(name = "hoursavailable")
	public String getHoursavailable() {
		return hoursavailable;
	}

	public void setHoursavailable(String hoursavailable) {
		this.hoursavailable = hoursavailable;
	}

	@Column(name = "worktimeframe")
	public String getWorkTimeframe() {
		return workTimeframe;
	}

	public void setWorkTimeframe(String workTimeframe) {
		this.workTimeframe = workTimeframe;
	}

	@Column(name = "location")
	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	@Column(name = "skills")
	public String getSkills() {
		return skills;
	}

	public void setSkills(String skills) {
		this.skills = skills;
	}

	@Column(name = "category")
	public String getJobcategory() {
		return jobcategory;
	}

	public void setJobcategory(String jobcategory) {
		this.jobcategory = jobcategory;
	}

	@Column(name = "salrange")
	public String getRange() {
		return range;
	}

	public void setRange(String range) {
		this.range = range;
	}

	@Column(name = "salarytype")
	public String getSalaryType() {
		return salaryType;
	}

	public void setSalaryType(String salaryType) {
		this.salaryType = salaryType;
	}

	@Column(name = "days")
	public String getDays() {
		return days;
	}

	public void setDays(String days) {
		this.days = days;
	}

	@OneToMany
	@JoinColumn(name = "id")
	public Set<Feedback> getFeedback() {
		return feedback;
	}

	public void setFeedback(Set<Feedback> feedback) {
		this.feedback = feedback;
	}

	@OneToMany(mappedBy="profileOwner")
	public Set<SkillsDetails> getUserSkills() {
		return userSkills;
	}

	public void setUserSkills(Set<SkillsDetails> userSkills) {
		this.userSkills = userSkills;
	}

	/*
	 * @Transient public List<WorkExperience> getExperienceList() { return
	 * experienceList; }
	 * 
	 * public void setExperienceList(List<WorkExperience> experienceList) {
	 * this.experienceList = experienceList; }
	 * 
	 * @Transient public List<Education> getEducationList() { return
	 * educationList; }
	 * 
	 * public void setEducationList(List<Education> educationList) {
	 * this.educationList = educationList; }
	 * 
	 * @Transient public List<Training> getTrainingList() { return trainingList;
	 * }
	 * 
	 * public void setTrainingList(List<Training> trainingList) {
	 * this.trainingList = trainingList; }
	 */

	@OneToMany
	@JoinColumn(name = "id")
	public Set<Training> getTrainings() {
		return trainings;
	}

	public void setTrainings(Set<Training> trainings) {
		this.trainings = trainings;
	}

	@Column(name = "picture")
	public String getPicture() {

		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	@Column(name = "name")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "viewcount")
	public long getViewCount() {
		return viewCount;
	}

	@OneToMany
	@JoinColumn(name = "friendid")
	public Set<Contact> getContacts() {
		return contacts;
	}

	public void setContacts(Set<Contact> contacts) {
		this.contacts = contacts;
	}

	public void setViewCount(long viewCount) {
		this.viewCount = viewCount;
	}

	@ManyToMany
	@JoinTable(name = "user_bookmark", joinColumns = { @JoinColumn(name = "profile_id", referencedColumnName = "id") }, inverseJoinColumns = { @JoinColumn(name = "opportunity_id", referencedColumnName = "id") })
	public Set<Opportunity> getBookMarkOpportunityOwner() {
		return bookMarkOpportunityOwner;
	}

	public void setBookMarkOpportunityOwner(
			Set<Opportunity> bookMarkOpportunityOwner) {
		this.bookMarkOpportunityOwner = bookMarkOpportunityOwner;
	}

	@ManyToMany
	@JoinTable(name = "user_interest", joinColumns = { @JoinColumn(name = "profile_id", referencedColumnName = "id") }, inverseJoinColumns = { @JoinColumn(name = "opportunity_id", referencedColumnName = "id") })
	public Set<Opportunity> getInterestOpportunityOwner() {
		return interestOpportunityOwner;
	}

	public void setInterestOpportunityOwner(
			Set<Opportunity> interestOpportunityOwner) {
		this.interestOpportunityOwner = interestOpportunityOwner;
	}

	@Column(name = "status")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public boolean equals(Object target) {
		if (this == target) {
			return true;
		}
		if (target instanceof Profile) {
			Profile targetProfile = (Profile) target;
			if (id == targetProfile.id) {
				return true;
			} else {
				return false;
			}
		}
		return false;
	}

	@Transient
	public long getItemCount() {
		return itemCount;
	}

	public void setItemCount(long itemCount) {
		this.itemCount = itemCount;
	}

	@Column(name = "flagged")
	public boolean isFlagged() {
		return flagged;
	}

	public void setFlagged(boolean flagged) {
		this.flagged = flagged;
	}

	@Column(name = "flagdelete")
	public boolean isFlagdelete() {
		return flagdelete;
	}

	public void setFlagdelete(boolean flagdelete) {
		this.flagdelete = flagdelete;
	}

	@Column(name = "personalstatement")
	public String getPersonalStatement() {
		return personalStatement;
	}

	public void setPersonalStatement(String personalStatement) {
		this.personalStatement = personalStatement;
	}

	@ManyToMany
	@JoinTable(name = "groupinvitation", joinColumns = { @JoinColumn(name = "profileid", referencedColumnName = "id") }, inverseJoinColumns = { @JoinColumn(name = "groupid", referencedColumnName = "id") })
	public Set<Group> getGroup() {
		return group;
	}

	public void setGroup(Set<Group> group) {
		this.group = group;
	}

	@ManyToMany
	@JoinTable(name = "groupusers", joinColumns = { @JoinColumn(name = "profileid", referencedColumnName = "id") }, inverseJoinColumns = { @JoinColumn(name = "groupid", referencedColumnName = "id") })
	public Set<Group> getGroupUsers() {
		return groupUsers;
	}

	public void setGroupUsers(Set<Group> groupUsers) {
		this.groupUsers = groupUsers;
	}

	@OneToMany
	@JoinColumn(name = "profile_id")
	public Set<Group> getGroups() {
		return groups;
	}

	public void setGroups(Set<Group> groups) {
		this.groups = groups;
	}

	@OneToMany
	@JoinColumn(name = "profileid")
	public Set<GroupAdmin> getGroupAdmin() {
		return groupAdmin;
	}

	public void setGroupAdmin(Set<GroupAdmin> groupAdmin) {
		this.groupAdmin = groupAdmin;
	}

	@Column(name = "resizedpicture")
	public String getResizedMidPicture() {
		return resizedMidPicture;
	}

	public void setResizedMidPicture(String resizedMidPicture) {
		this.resizedMidPicture = resizedMidPicture;
	}

	@Column(name = "resizedminpicture")
	public String getResizedMinPicture() {
		return resizedMinPicture;
	}

	public void setResizedMinPicture(String resizedMinPicture) {
		this.resizedMinPicture = resizedMinPicture;
	}

	@ManyToOne
	@JoinColumn(name = "industry_id")
	public Industry getIndustry() {
		return industry;
	}

	public void setIndustry(Industry industry) {
		this.industry = industry;
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
		return AmazonServiceImpl.getSignedUrl("mob_profile", urls);
	}

	@Transient
	public String getItemFileName() {
		return itemFileName;
	}

	public void setItemFileName(String itemFileName) {
		this.itemFileName = itemFileName;
	}

	@Transient
	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	@Column(name = "aboutus")
	public String getAboutUs() {
		return aboutUs;
	}

	public void setAboutUs(String aboutUs) {
		this.aboutUs = aboutUs;
	}

	@Column(name = "workculture")
	public String getWorkCulture() {
		return workCulture;
	}

	public void setWorkCulture(String workCulture) {
		this.workCulture = workCulture;
	}

	@Column(name = "whyworkfromhere")
	public String getWhyWorkHere() {
		return whyWorkHere;
	}

	public void setWhyWorkHere(String whyWorkHere) {
		this.whyWorkHere = whyWorkHere;
	}

	@Column(name = "achievements")
	public String getAchievements() {
		return achievements;
	}

	public void setAchievements(String achievements) {
		this.achievements = achievements;
	}

	/*
	 * @OneToOne
	 * 
	 * @JoinColumn(name = "profile_id") public PhysicalTraits
	 * getPhysicalTraits() { return physicalTraits; }
	 * 
	 * public void setPhysicalTraits(PhysicalTraits physicalTraits) {
	 * this.physicalTraits = physicalTraits; }
	 */

	/*
	 * @OneToOne (mappedBy = "profileOwner") public PhysicalTraits
	 * getPhysicalTraits() { return physicalTraits; }
	 * 
	 * public void setPhysicalTraits(PhysicalTraits physicalTraits) {
	 * this.physicalTraits = physicalTraits; }
	 */
	private String minPictureAmazon;
	@Transient
	public String getMinPictureFromAmazon(){
		if(minPictureAmazon!=null || resizedMinPicture==null){
			return minPictureAmazon;
		}else{
			List<String> url = new ArrayList<String>();
			url.add(resizedMinPicture);
			List<String> resMinPics = AmazonServiceImpl.getSignedUrl("mob_profile", url);
			if(resMinPics!=null){
				minPictureAmazon = resMinPics.get(0);
				return minPictureAmazon;
			}else{
				return null;
			}
		}
	}

	private String midPictureAmazon;
	@Transient
	public String getMidPictureFromAmazon(){
		if(midPictureAmazon!=null || resizedMidPicture==null){
			return midPictureAmazon;
		}else{
			List<String> url = new ArrayList<String>();
			url.add(resizedMidPicture);
			List<String> resMidPics = AmazonServiceImpl.getSignedUrl("mob_profile", url);
			if(resMidPics!=null){
				midPictureAmazon = resMidPics.get(0);
				return midPictureAmazon;
			}else{
				return null;
			}
		}
	}

	private String pictureAmazon;
	@Transient
	public String getPictureFromAmazon(){
		if(pictureAmazon!=null || picture==null){
			return pictureAmazon;
		}else{
			List<String> url = new ArrayList<String>();
			url.add(picture);
			List<String> resPics = AmazonServiceImpl.getSignedUrl("mob_profile", url);
			if(resPics!=null){
				pictureAmazon = resPics.get(0);
				return pictureAmazon;
			}else{
				return null;
			}
		}
	}

}
