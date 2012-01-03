package com.mob.view.action.employer;

import java.util.Date;
import java.util.List;


import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.Contact;
import com.mob.model.User;
import com.mob.model.employer.Employer;
import com.mob.model.profile.Profile;
import com.mob.services.BaseService;
import com.mob.services.MessagingService;
import com.mob.services.SearchService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

public class SendEmprEmailAction extends ActionSupport implements Preparable {
	/**
	 * Logger for logging messages.
	 */
	private static final MOBLogger LOGGER = new MOBLogger(
			SendEmprEmailAction.class);
	private static final long serialVersionUID = 1L;

	private BaseService<User> userService;
	private MessagingService emplrMsgingService;

	private Employer user;
	private Contact contact;

	private String emprEmailSubject;
	private String emprEmailContent;
	private Date emailDate;

	private List listInboxEmprUnrdEmailMessages;
	private List emprContactList;

	private long unreadMsgListSize;
	private long emprContactListSize;
	private boolean unreadMsgCnt;
	
	private Profile profile;
	private List<Profile> profiles;
	private SearchService searchService;
	
	private List  contactList;
    private long  contactListSize;
	/**
	 * contactIds  reference variable for holding contactIds.
	 * contactIds getting from emprContactsListsuccess.jsp for getting contactIds.
	 */
	private long[] contactIds;

	public Date getEmailDate() {
		return emailDate;
	}

	public void setEmailDate(Date emailDate) {
		this.emailDate = emailDate;
	}

	public String sendEmprEmailInfo() {
		user = (Employer) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		this.emplrMsgingService.sendEmprMessageToContacts(user,
				emprEmailSubject, emprEmailContent, contactIds,profile);
		return "success";
	}
	
	
	public String loadEmployerProfileList(){
		user = (Employer) SecurityContextHolder.getContext()
		.getAuthentication().getPrincipal();
		profiles = searchService.findListOfEmployeeProfiles(profile,user.getId());
		contactList=emplrMsgingService.findContactsList(user.getId());
		contactListSize=contactList.size();
		return "success";
		
	}

	public BaseService<User> getUserService() {
		LOGGER.info("user password is " + userService.toString());

		return userService;
	}

	public void setUserService(BaseService<User> userService) {
		this.userService = userService;
	}

	public void prepare() throws Exception {
		LOGGER.info("Inside prepare");
		// TODO Auto-generated method stub
		user = (Employer) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		listInboxEmprUnrdEmailMessages = emplrMsgingService
				.findUnreadEmailMsgList(user.getId(), unreadMsgCnt);
		unreadMsgListSize = listInboxEmprUnrdEmailMessages.size();
		contact = new Contact();
		emprContactList = emplrMsgingService.findContactsList(user.getId());
		LOGGER.info("contactList.size():" + emprContactList.size());
		emprContactListSize = emprContactList.size();
	}

	public Employer getUser() {
		return user;
	}

	public void setUser(Employer user) {
		this.user = user;
	}

	public String getEmprEmailSubject() {
		return emprEmailSubject;
	}

	public void setEmprEmailSubject(String emprEmailSubject) {
		this.emprEmailSubject = emprEmailSubject;
	}

	public String getEmprEmailContent() {
		return emprEmailContent;
	}

	public void setEmprEmailContent(String emprEmailContent) {
		this.emprEmailContent = emprEmailContent;
	}

	public MessagingService getEmplrMsgingService() {
		return emplrMsgingService;
	}

	public void setEmplrMsgingService(MessagingService emplrMsgingService) {
		this.emplrMsgingService = emplrMsgingService;
	}

	public boolean isUnreadMsgCnt() {
		return unreadMsgCnt;
	}

	public void setUnreadMsgCnt(boolean unreadMsgCnt) {
		this.unreadMsgCnt = unreadMsgCnt;
	}

	public List getListInboxEmprUnrdEmailMessages() {
		return listInboxEmprUnrdEmailMessages;
	}

	public void setListInboxEmprUnrdEmailMessages(
			List listInboxEmprUnrdEmailMessages) {
		this.listInboxEmprUnrdEmailMessages = listInboxEmprUnrdEmailMessages;
	}

	public long getUnreadMsgListSize() {
		return unreadMsgListSize;
	}

	public void setUnreadMsgListSize(long unreadMsgListSize) {
		this.unreadMsgListSize = unreadMsgListSize;
	}

	public Contact getContact() {
		return contact;
	}

	public void setContact(Contact contact) {
		this.contact = contact;
	}

	public List getEmprContactList() {
		return emprContactList;
	}

	public void setEmprContactList(List emprContactList) {
		this.emprContactList = emprContactList;
	}

	public long getEmprContactListSize() {
		return emprContactListSize;
	}

	public void setEmprContactListSize(long emprContactListSize) {
		this.emprContactListSize = emprContactListSize;
	}

	public long[] getContactIds() {
		return contactIds;
	}

	public void setContactIds(long[] contactIds) {
		this.contactIds = contactIds;
	}

	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}

	public List<Profile> getProfiles() {
		return profiles;
	}

	public void setProfiles(List<Profile> profiles) {
		this.profiles = profiles;
	}

	public SearchService getSearchService() {
		return searchService;
	}

	public void setSearchService(SearchService searchService) {
		this.searchService = searchService;
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

}
