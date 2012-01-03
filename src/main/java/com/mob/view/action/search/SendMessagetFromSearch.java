package com.mob.view.action.search;

import javax.mail.MessagingException;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.User;
import com.mob.model.profile.Profile;
import com.mob.services.BaseService;
import com.mob.services.MessagingService;
import com.mob.util.MOBLogger;
import com.mob.view.action.tag.PrivacyGroupBean;
import com.opensymphony.xwork2.ActionSupport;

public class SendMessagetFromSearch extends ActionSupport {

	/**
	 * Logger for logging messages.
	 */
	private static final MOBLogger LOGGER = new MOBLogger(
			PrivacyGroupBean.class);

	private User user;
	private MessagingService messagingService;
	private long contactProfileId;
	private long associatedProfileMsgId;
	private String subject;
	private String message;
	private Profile senderProfile;
	private Profile receiverProfile;

	private BaseService<Profile> profileOwnerBaseService;

	private static final long serialVersionUID = 1L;

	public String sendMessageToContacts() {
		user = (User) SecurityContextHolder.getContext().getAuthentication()
		.getPrincipal();
		LOGGER.info("Entered createContact");
		senderProfile = new Profile();
		senderProfile = profileOwnerBaseService.findByPrimaryKey(senderProfile,
				associatedProfileMsgId);
		receiverProfile = new Profile();

		receiverProfile = profileOwnerBaseService.findByPrimaryKey(
				receiverProfile, contactProfileId);
		try {
			this.messagingService.sendMessage(senderProfile, receiverProfile,
					subject, message);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "success";
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public MessagingService getMessagingService() {
		return messagingService;
	}

	public void setMessagingService(MessagingService messagingService) {
		this.messagingService = messagingService;
	}

	public long getContactProfileId() {
		return contactProfileId;
	}

	public void setContactProfileId(long contactProfileId) {
		this.contactProfileId = contactProfileId;
	}

	public long getAssociatedProfileMsgId() {
		return associatedProfileMsgId;
	}

	public void setAssociatedProfileMsgId(long associatedProfileMsgId) {
		this.associatedProfileMsgId = associatedProfileMsgId;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Profile getSenderProfile() {
		return senderProfile;
	}

	public void setSenderProfile(Profile senderProfile) {
		this.senderProfile = senderProfile;
	}

	public Profile getReceiverProfile() {
		return receiverProfile;
	}

	public void setReceiverProfile(Profile receiverProfile) {
		this.receiverProfile = receiverProfile;
	}

	public BaseService<Profile> getProfileOwnerBaseService() {
		return profileOwnerBaseService;
	}

	public void setProfileOwnerBaseService(
			BaseService<Profile> profileOwnerBaseService) {
		this.profileOwnerBaseService = profileOwnerBaseService;
	}

}
