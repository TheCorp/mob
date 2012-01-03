package com.mob.model;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
@Entity
@Table(name = "sentbox")
public class SentBox {

	private User sentBoxOwner;
	private Set<Message> messages = new HashSet<Message>();
	private long id;
	private String  emailFrom;
	private String  emailTo;
	private String  emailSubject;
	private String  emailContent;
	private  Date  emailSendDate;
	private String profileName;
	
	@Transient
	public String getEmailFrom() {
		return emailFrom;
	}
	public void setEmailFrom(String emailFrom) {
		this.emailFrom = emailFrom;
	}

	@Column(name = "senderEmailid")
	public String getEmailTo() {
		return emailTo;
	}
	public void setEmailTo(String emailTo) {
		this.emailTo = emailTo;
	}
	@Column(name = "subject")
	public String getEmailSubject() {
		return emailSubject;
	}
	
	public void setEmailSubject(String emailSubject) {
		this.emailSubject = emailSubject;
	}
	@Column(name = "message")
	public String getEmailContent() {
		return emailContent;
	}
	public void setEmailContent(String emailContent) {
		this.emailContent = emailContent;
	}
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	
	@Column(name = "sentdate")
	public Date getEmailSendDate() {
		return emailSendDate;
	}
	public void setEmailSendDate(Date emailSendDate) {
		this.emailSendDate = emailSendDate;
		
	}
	
	@Column(name = "profile_name")
	public String getProfileName() {
		return profileName;
	}
	public void setProfileName(String profileName) {
		this.profileName = profileName;
	}
	
	@OneToOne
	@JoinColumn(name = "sender_id")
	public User getSentBoxOwner() {
		return sentBoxOwner;
	}
	public void setSentBoxOwner(User sentBoxOwner) {
		this.sentBoxOwner = sentBoxOwner;
	}
}
