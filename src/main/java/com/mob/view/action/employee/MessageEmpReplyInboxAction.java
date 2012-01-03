package com.mob.view.action.employee;

import java.util.Date;
import java.util.List;

import javax.mail.MessagingException;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.Contact;
import com.mob.model.ContactTypes;
import com.mob.model.Inbox;
import com.mob.model.SentBox;
import com.mob.model.User;
import com.mob.model.employer.Employer;
import com.mob.model.profile.Profile;
import com.mob.services.BaseService;
import com.mob.services.MessagingService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

public class MessageEmpReplyInboxAction extends ActionSupport implements
		Preparable {
	/**
	 * Logger for logging messages.
	 */
	private static final MOBLogger LOGGER = new MOBLogger(
			MessageEmpReplyInboxAction.class);
	private static final long serialVersionUID = 1L;
	private User user;
	private User inboxOwner;
	private ContactTypes contType;
	private Contact contact;

	private BaseService<User> userService;
	private MessagingService messagingService;
	private BaseService<ContactTypes> contactTypesService;
	private BaseService<User> userBaseService;
	private BaseService<Profile> profileBaseService;

	private String emailSubject;
	private String emailContent;

	private boolean unreadMsgCnt;
	private long unreadEmpMsgListSize;
	private long contactListSize;
	private long userOwnerId;

	private List cntUnreadMsgList;
	private List contactTypesList;
	private List contactList;
	private long[]   contactId;
	
	private long profileId;
	private Profile profileOwner;
	private long associatedProfileId;
	private Profile associatedProfileOwner;
	

	public String replyInboxRecdMsgInfo() {
		LOGGER.info("Inside replyInboxRecdMsgInfo");
		System.out.println("associatedProfileId" +associatedProfileId);
		user = (User) SecurityContextHolder.getContext().getAuthentication()
		.getPrincipal();
		inboxOwner = new User();
		inboxOwner = userBaseService.findByPrimaryKey(inboxOwner, userOwnerId);
		profileOwner=new Profile();
		profileOwner=  profileBaseService.findByPrimaryKey(profileOwner, profileId);
		associatedProfileOwner=new Profile();
		associatedProfileOwner=profileBaseService.findByPrimaryKey(associatedProfileOwner, associatedProfileId);
		this.messagingService.sendEmpReplyMessageToContacts(user, inboxOwner,profileOwner,associatedProfileOwner,emailSubject, emailContent, contactId);
		return "success";

	}

	public BaseService<User> getUserService() {
		return userService;
	}

	public void setUserService(BaseService<User> userService) {
		this.userService = userService;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		user = (User) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		cntUnreadMsgList = messagingService.findUnreadEmailMsgList(
				user.getId(), unreadMsgCnt);
		unreadEmpMsgListSize = cntUnreadMsgList.size();
		contType = new ContactTypes();
		contactTypesList = contactTypesService.findAll(contType);
		contact = new Contact();
		contactList = messagingService.findContactsList(user.getId());
		contactListSize = contactList.size();
	}

	public String getEmailSubject() {
		return emailSubject;
	}

	public void setEmailSubject(String emailSubject) {
		this.emailSubject = emailSubject;
	}

	public String getEmailContent() {
		return emailContent;
	}

	public void setEmailContent(String emailContent) {
		this.emailContent = emailContent;
	}



	public List getCntUnreadMsgList() {
		return cntUnreadMsgList;
	}

	public void setCntUnreadMsgList(List cntUnreadMsgList) {
		this.cntUnreadMsgList = cntUnreadMsgList;
	}

	public boolean isUnreadMsgCnt() {
		return unreadMsgCnt;
	}

	public void setUnreadMsgCnt(boolean unreadMsgCnt) {
		this.unreadMsgCnt = unreadMsgCnt;
	}

	public long getUnreadEmpMsgListSize() {
		return unreadEmpMsgListSize;
	}

	public void setUnreadEmpMsgListSize(long unreadEmpMsgListSize) {
		this.unreadEmpMsgListSize = unreadEmpMsgListSize;
	}

	public MessagingService getMessagingService() {
		return messagingService;
	}

	public void setMessagingService(MessagingService messagingService) {
		this.messagingService = messagingService;
	}


	public ContactTypes getContType() {
		return contType;
	}

	public void setContType(ContactTypes contType) {
		this.contType = contType;
	}

	public List getContactTypesList() {
		return contactTypesList;
	}

	public void setContactTypesList(List contactTypesList) {
		this.contactTypesList = contactTypesList;
	}

	public BaseService<ContactTypes> getContactTypesService() {
		return contactTypesService;
	}

	public void setContactTypesService(
			BaseService<ContactTypes> contactTypesService) {
		this.contactTypesService = contactTypesService;
	}

	public Contact getContact() {
		return contact;
	}

	public void setContact(Contact contact) {
		this.contact = contact;
	}

	public List getContactList() {
		return contactList;
	}

	public void setContactList(List contactList) {
		this.contactList = contactList;
	}

	public long getContactListSize() {
		return contactListSize;
	}

	public void setContactListSize(long contactListSize) {
		this.contactListSize = contactListSize;
	}

	public BaseService<User> getUserBaseService() {
		return userBaseService;
	}

	public void setUserBaseService(BaseService<User> userBaseService) {
		this.userBaseService = userBaseService;
	}

	public long getUserOwnerId() {
		return userOwnerId;
	}

	public void setUserOwnerId(long userOwnerId) {
		this.userOwnerId = userOwnerId;
	}

	public User getInboxOwner() {
		return inboxOwner;
	}

	public void setInboxOwner(User inboxOwner) {
		this.inboxOwner = inboxOwner;
	}

	public long[] getContactId() {
		return contactId;
	}

	public void setContactId(long[] contactId) {
		this.contactId = contactId;
	}

	public long getProfileId() {
		return profileId;
	}

	public void setProfileId(long profileId) {
		this.profileId = profileId;
	}

	public Profile getProfileOwner() {
		return profileOwner;
	}

	public void setProfileOwner(Profile profileOwner) {
		this.profileOwner = profileOwner;
	}

	public BaseService<Profile> getProfileBaseService() {
		return profileBaseService;
	}

	public void setProfileBaseService(BaseService<Profile> profileBaseService) {
		this.profileBaseService = profileBaseService;
	}

	public long getAssociatedProfileId() {
		return associatedProfileId;
	}

	public void setAssociatedProfileId(long associatedProfileId) {
		this.associatedProfileId = associatedProfileId;
	}

	public Profile getAssociatedProfileOwner() {
		return associatedProfileOwner;
	}

	public void setAssociatedProfileOwner(Profile associatedProfileOwner) {
		this.associatedProfileOwner = associatedProfileOwner;
	}

	

	

}
