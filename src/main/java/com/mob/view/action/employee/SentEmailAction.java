package com.mob.view.action.employee;

import java.util.Date;
import java.util.List;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.Contact;
import com.mob.model.ContactTypes;
import com.mob.model.User;
import com.mob.model.profile.Profile;
import com.mob.services.BaseService;
import com.mob.services.MessagingService;
import com.mob.services.SearchService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

public class SentEmailAction extends ActionSupport implements Preparable {
	/**
	 * Logger for logging messages.
	 */
	private static final MOBLogger LOGGER = new MOBLogger(SentEmailAction.class);
	private static final long serialVersionUID = 1L;
	private User user;
	private ContactTypes contType;
	private Contact contact;

	private BaseService<User> userService;
	private BaseService<ContactTypes> contactTypesService;
	private MessagingService messagingService;

	private String emailSubject;
	private String emailContent;

	private List contactTypesList;
	private List cntUnreadMsgList;
	private List contactList;

	private boolean unreadMsgCnt;
	private long unreadEmpMsgListSize;
	private long contactListSize;
	
	
	private List<Profile> profilList;
	private SearchService searchService;
	private Profile profile;
	/**
	 * contactId getting from contactListsuccess.jsp for getting contact ids.
	 */
	private long[] contactId;

	public String retrieveEmailInfo() {
		
		user = (User) SecurityContextHolder.getContext().getAuthentication()
		.getPrincipal();
		System.out.println("Profile.Id" +profile.getId());
		this.messagingService.sendEmpMessageToContacts(user, emailSubject,
				emailContent, contactId,profile);
		return "success";

	}
	
	public String  loadProfileList(){
		user = (User)SecurityContextHolder.getContext().
	    getAuthentication().getPrincipal();
		profilList = searchService.findListOfEmployeeProfiles(profile,user.getId());
		System.out.println("profilList.size() in  LoadProfileListAction" +profilList.size());
		contactList = messagingService.findContactsList(user.getId());
		contactListSize = contactList.size();
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

	public String listContacts() {
		user = (User) SecurityContextHolder.getContext().getAuthentication()
		.getPrincipal();
		LOGGER.info("sent email action");
		contactList = messagingService.findContactsList(user.getId());
		contactListSize = contactList.size();
		LOGGER.info("contactListSize In SentEmail:----" + contactListSize);
		return "success";
	}

	public void prepare() throws Exception {
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

	public long[] getContactId() {
		return contactId;
	}

	public void setContactId(long[] contactId) {
		this.contactId = contactId;
	}

	public List<Profile> getProfilList() {
		return profilList;
	}

	public void setProfilList(List<Profile> profilList) {
		this.profilList = profilList;
	}

	public SearchService getSearchService() {
		return searchService;
	}

	public void setSearchService(SearchService searchService) {
		this.searchService = searchService;
	}

	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}

}
