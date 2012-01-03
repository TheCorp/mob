package com.mob.view.action.employee;


import java.sql.Date;
import java.util.Iterator;
import java.util.List;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.Contact;
import com.mob.model.ContactTypes;
import com.mob.model.User;
import com.mob.model.profile.Profile;
import com.mob.services.BaseService;
import com.mob.services.ContactEmployeeService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

public class CreateContactAction extends ActionSupport implements Preparable {
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(CreateContactAction.class);

	private User user;
	
	private Contact contact;
	private Profile profile;

	private ContactTypes friendtype;
	private List contactTypesList;
	private String[] selectedContacts;
	private List contacts;
	private  ContactEmployeeService contactEmpService;
	private String contactType;
	private Date contctCreatedDate;
	private static final long serialVersionUID = 1L;
	
	private BaseService<Contact> employeeContactService;
	private BaseService<ContactTypes> employeeContactTypesService;
	private BaseService<Profile> employeeProfileService;
	private BaseService<Profile> profileService;
	private long contactSize;
	
	private String latestNickName;

	public String create() {
		java.sql.Date contctCreatedDate = new java.sql.Date(System.currentTimeMillis());
		
		LOGGER.info("Inside create method ");
		User user = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		LOGGER.info("user id:" + user.getId());
		Contact contact = new Contact();
		LOGGER.info("contact");
		contact.setNickName(user.getFirstName());
		LOGGER.info("cont type:"+contactType);
		contact.setContactType(contactType);
		contact.setContactOwner(profile);
		contact.setProfileOwner(user);
		contact.setCreatedDate(contctCreatedDate);
		contact.setModifiedDate(contctCreatedDate);
		employeeContactService.create(contact);
		
		LOGGER.info("user id:-------"+user.getId());
		LOGGER.info("Latest contactId:-----"+contact.getId());
	    contacts = contactEmpService.findListContacts(user.getId());
	    Iterator it=contacts.iterator();
	    while(it.hasNext()){
	    	LOGGER.info(((Contact)it.next()).getNickName());
	    }
		contactSize = contacts.size();		
		
		contact =  employeeContactService.findByPrimaryKey(contact,contact.getId());
		latestNickName = contact.getNickName();
		LOGGER.info("LatestContactDetails:-----"+contact.getNickName());
		return "success";
	}


	public void prepare() throws Exception {
		// Added for contactTypes
		User user = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		profile = new Profile();
		profile.setProfileOwner(user);
		LOGGER.info("in prepare method of Contact type");
		friendtype = new ContactTypes();
		contactTypesList = employeeContactTypesService.findAll(friendtype);
		
		
		
		/**
		 * for displaying list of contacts.
		 */
		contacts = contactEmpService.findListContacts(profile.getProfileOwner().getId());

		/**
		 * for displaying Total no. of contacts.
		 */
		profile.setProfileOwner(user);
		List listContacts = contactEmpService.findContacts(profile.getProfileOwner().getId());
		profile.setNoOfContacts(listContacts.size());
		/**
		 * for displaying profile information.
		 */
		profile.setProfileOwner(user);
		profile = profileService.findByPrimaryKey(profile, profile
				.getProfileOwner().getId());

	}

	public Contact getContact() {
		return contact;
	}

	public void setContact(Contact contact) {
		this.contact = contact;
	}

	public BaseService<Contact> getEmployeeContactService() {
		return employeeContactService;
	}

	public void setEmployeeContactService(
			BaseService<Contact> employeeContactService) {
		this.employeeContactService = employeeContactService;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List getContactTypesList() {
		return contactTypesList;
	}

	public void setContactTypesList(List contactTypesList) {
		this.contactTypesList = contactTypesList;
	}

	public ContactTypes getFriendtype() {
		return friendtype;
	}

	public void setFriendtype(ContactTypes friendtype) {
		this.friendtype = friendtype;
	}

	public BaseService<ContactTypes> getEmployeeContactTypesService() {
		return employeeContactTypesService;
	}

	public void setEmployeeContactTypesService(
			BaseService<ContactTypes> employeeContactTypesService) {
		this.employeeContactTypesService = employeeContactTypesService;
	}

	public String[] getSelectedContacts() {
		return selectedContacts;
	}

	public void setSelectedContacts(String[] selectedContacts) {
		this.selectedContacts = selectedContacts;
	}



	public BaseService<Profile> getProfileService() {
		return profileService;
	}

	public void setProfileService(BaseService<Profile> profileService) {
		this.profileService = profileService;
	}

	public BaseService<Profile> getEmployeeProfileService() {
		return employeeProfileService;
	}

	public void setEmployeeProfileService(
			BaseService<Profile> employeeProfileService) {
		this.employeeProfileService = employeeProfileService;
	}
	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}


	public String getContactType() {
		return contactType;
	}


	public void setContactType(String contactType) {
		this.contactType = contactType;
	}


	public static long getSerialVersionUID() {
		return serialVersionUID;
	}


	public Date getContctCreatedDate() {
		return contctCreatedDate;
	}


	public void setContctCreatedDate(Date contctCreatedDate) {
		this.contctCreatedDate = contctCreatedDate;
	}


	public ContactEmployeeService getContactEmpService() {
		return contactEmpService;
	}


	public void setContactEmpService(ContactEmployeeService contactEmpService) {
		this.contactEmpService = contactEmpService;
	}


	public long getContactSize() {
		return contactSize;
	}


	public void setContactSize(long contactSize) {
		this.contactSize = contactSize;
	}


	public List getContacts() {
		return contacts;
	}


	public void setContacts(List contacts) {
		this.contacts = contacts;
	}


	public String getLatestNickName() {
		return latestNickName;
	}


	public void setLatestNickName(String latestNickName) {
		this.latestNickName = latestNickName;
	}

}
