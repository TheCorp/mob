package com.mob.model;

import java.sql.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.mob.model.profile.Profile;

@Entity
@Table(name = "friend")
public class Contact {

	private long id;
	private String nickName;

    // The profile of the contact
    private Profile contactOwner;

    // The MoB user who owns this contact
    private User profileOwner;
	private ContactTypes contact = new ContactTypes();
	private String contactType;
	private Date createdDate;
	private Date modifiedDate;
	private String friendtype;
	private List contactList;

    // The profile with which this contact is associated
    private Profile associatedProfile;
    private boolean employer;
   
    @Transient
	public boolean isEmployer() {
		return employer;
	}

	public void setEmployer(boolean employer) {
		this.employer = employer;
	}

	@Column(name = "nickname")
	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	@ManyToOne
	@JoinColumn(name = "friendid", referencedColumnName = "id")
	public Profile getContactOwner() {
		return contactOwner;
	}

	public void setContactOwner(Profile contactOwner) {
		this.contactOwner = contactOwner;

	}

	@ManyToOne
	@JoinColumn(name = "mobid", referencedColumnName = "id")
	public User getProfileOwner() {
		return profileOwner;
		
	}

	public void setProfileOwner(User profileOwner) {
		this.profileOwner = profileOwner;
	}

	@Column(name="friendname")
	public String getContactType() {
		return contactType;
	}

	public void setContactType(String contactType) {
		this.contactType = contactType;
	}

	@Column(name="createdDate")
	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	@Column(name="modifiedDate")
	public Date getModifiedDate() {
		return modifiedDate;
	}

	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}

	@Transient
	public List getContactList() {
		return contactList;
	}

	public void setContactList(List contactList) {
		this.contactList = contactList;
	}
    
   
	 @OneToOne
		@JoinColumn(name = "associatedprofileid")
	public Profile getAssociatedProfile() {
		return associatedProfile;
	}

	public void setAssociatedProfile(Profile associatedProfile) {
		this.associatedProfile = associatedProfile;
	}


    
	
	

}
