package com.mob.view.action.search;



import java.sql.Date;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.Contact;
import com.mob.model.User;
import com.mob.model.profile.Profile;
import com.mob.services.BaseService;
import com.mob.services.ContactEmployeeService;
import com.mob.util.MOBLogger;
import com.mob.view.action.tag.PrivacyGroupBean;
import com.opensymphony.xwork2.ActionSupport;

public class CreateEmployeeContactFromSearch extends ActionSupport{
	
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(PrivacyGroupBean.class);

	private User user;
	private Contact contact;
	
	private ContactEmployeeService contactEmpService;
	private String contactType;
	private Date contctCreatedDate;
	private long associatedProfileId;
	private Profile contactOwner;
	private BaseService<Contact> employeeContactBaseService;
	private BaseService<Profile> contactOwnerBaseService;
	private Profile profile;
	
	private static final long serialVersionUID = 1L;
	
	private long contactSize;

	public String createContact(){
		LOGGER.info("Entered createContact");
		contctCreatedDate = new Date(System.currentTimeMillis());
		
		User mobOwner = (User) SecurityContextHolder.getContext()
		.getAuthentication().getPrincipal();
		
		profile =new Profile();
		profile=contactOwnerBaseService.findByPrimaryKey(profile,associatedProfileId);
		contactOwner=contactOwnerBaseService.findByPrimaryKey(contactOwner,contactOwner.getId());
		contact = new Contact();
		contact.setNickName(contactOwner.getName());
		contact.setContactType(contactType);
		contact.setContactOwner(contactOwner);
		contact.setProfileOwner(mobOwner);
		contact.setAssociatedProfile(profile);
		contact.setCreatedDate(contctCreatedDate);
		contact.setModifiedDate(contctCreatedDate);
		employeeContactBaseService.create(contact);
		
		return "success";
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	

	public ContactEmployeeService getContactEmpService() {
		return contactEmpService;
	}

	public void setContactEmpService(ContactEmployeeService contactEmpService) {
		this.contactEmpService = contactEmpService;
	}

	public String getContactType() {
		return contactType;
	}

	public void setContactType(String contactType) {
		this.contactType = contactType;
	}

	public Date getContctCreatedDate() {
		return contctCreatedDate;
	}

	public void setContctCreatedDate(Date contctCreatedDate) {
		this.contctCreatedDate = contctCreatedDate;
	}

	public long getContactSize() {
		return contactSize;
	}

	public void setContactSize(long contactSize) {
		this.contactSize = contactSize;
	}

	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public Contact getContact() {
		return contact;
	}

	public void setContact(Contact contact) {
		this.contact = contact;
	}

	public BaseService<Contact> getEmployeeContactBaseService() {
		return employeeContactBaseService;
	}

	public void setEmployeeContactBaseService(
			BaseService<Contact> employeeContactBaseService) {
		this.employeeContactBaseService = employeeContactBaseService;
	}

	public BaseService<Profile> getContactOwnerBaseService() {
		return contactOwnerBaseService;
	}

	public void setContactOwnerBaseService(BaseService<Profile> contactOwnerBaseService) {
		this.contactOwnerBaseService = contactOwnerBaseService;
	}

	public void setContactOwner(Profile contactOwner) {
		this.contactOwner = contactOwner;
	}

	public Profile getContactOwner() {
		return contactOwner;
	}

	

	public long getAssociatedProfileId() {
		return associatedProfileId;
	}

	public void setAssociatedProfileId(long associatedProfileId) {
		this.associatedProfileId = associatedProfileId;
	}

	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}

	

}
