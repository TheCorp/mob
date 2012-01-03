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

import com.mob.model.profile.Profile;

@Entity
@Table(name = "inbox")
public class Inbox {
	private long id;
	private User inboxOwner;
	private User sentboxOwner;
	private String message;
	private String subject;
	private Date receivedDate;
	private boolean readUnreadMsgId;

	private  Profile profileOwner;
	private Profile associatedOwnerProfile;
	private int  messageType;
	private String messageStatus;

	private Set<Message> inboxMessages = new HashSet<Message>();

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	@OneToOne
	@JoinColumn(name = "owner_id")
	public User getInboxOwner() {
		return inboxOwner;
	}

	public void setInboxOwner(User inboxOwner) {
		this.inboxOwner = inboxOwner;
	}

	@OneToOne
	@JoinColumn(name = "sender_id")
	public User getSentboxOwner() {
		return sentboxOwner;
	}

	public void setSentboxOwner(User sentboxOwner) {
		this.sentboxOwner = sentboxOwner;
	}

	@Column(name = "message")
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Column(name = "subject")
	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	@Column(name = "recieveddate")
	public Date getReceivedDate() {
		return receivedDate;
	}

	public void setReceivedDate(Date receivedDate) {
		this.receivedDate = receivedDate;
	}



	@Column(name = "readunreadmsgid")
	public boolean isReadUnreadMsgId() {
		return readUnreadMsgId;


	}

	public void setReadUnreadMsgId(boolean readUnreadMsgId) {
		this.readUnreadMsgId = readUnreadMsgId;
	}

	@OneToOne
	@JoinColumn(name = "profile_id")
	public Profile getProfileOwner() {
		return profileOwner;
	}

	public void setProfileOwner(Profile profileOwner) {
		this.profileOwner = profileOwner;
	}

	@OneToOne
	@JoinColumn(name = "associatedprofileid")
	public Profile getAssociatedOwnerProfile() {
		return associatedOwnerProfile;
	}

	public void setAssociatedOwnerProfile(Profile associatedOwnerProfile) {
		this.associatedOwnerProfile = associatedOwnerProfile;
	}

	@Column(name = "messageType")
	public int getMessageType() {
		return messageType;
	}

	public void setMessageType(int messageType) {
		this.messageType = messageType;
	}


	@Column(name ="messageStsus")
	public String getMessageStatus() {
		return messageStatus;
	}

	public void setMessageStatus(String messageStatus) {
		this.messageStatus = messageStatus;
	}


}
