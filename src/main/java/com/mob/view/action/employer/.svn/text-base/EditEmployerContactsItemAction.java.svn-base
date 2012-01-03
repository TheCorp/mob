package com.mob.view.action.employer;

import java.sql.Date;
import java.util.List;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.Contact;
import com.mob.model.ContactTypes;
import com.mob.model.User;
import com.mob.model.employer.Employer;
import com.mob.model.profile.EmployerProfile;
import com.mob.model.profile.Profile;
import com.mob.services.BaseService;
import com.mob.services.ContactEmployeeService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

public class EditEmployerContactsItemAction extends ActionSupport implements Preparable {
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(EditEmployerContactsItemAction.class);

	private Employer user;
	private Employer contactOwner;
	private Employer profileOwner;
	private Contact contact;
	private long cid;
	private String nickName;
	private String contactType;
	private Date modifiedDate;
	private Profile employerProfile;
	//private Date date2;
	private List<ContactTypes> contactTypesList;

	private ContactTypes contType;

	private BaseService<ContactTypes> contactTypesService;
	private BaseService<Contact> contactBaseService;

	private ContactEmployeeService contactService;
	private Contact updatedContact;
	private long associatedProfileId;
	
	
   

	
	public long getAssociatedProfileId() {
		return associatedProfileId;
	}

	public void setAssociatedProfileId(long associatedProfileId) {
		this.associatedProfileId = associatedProfileId;
	}

	public String updateContactItem(){
		System.out.println("associatedProfileId:"+associatedProfileId);
		LOGGER.info("updateContactItem");
		java.sql.Date todaysDate = new java.sql.Date(System.currentTimeMillis());
		LOGGER.info("sql date:------"+todaysDate);
		User user = (User) SecurityContextHolder.getContext()
		.getAuthentication().getPrincipal();
		System.out.println("associatedProfileId:"+associatedProfileId);
		Profile associatedProfile=new Profile();
		associatedProfile.setId(associatedProfileId);
		contact.setContactOwner(employerProfile);
		contact.setAssociatedProfile(associatedProfile);
		contact.setModifiedDate(todaysDate);
		contactService.updateContact(contact);
		updatedContact=contactBaseService.findByPrimaryKey(contact,contact.getId());		
		
		return "success";

	}

	public long getCid() {
		return cid;
	}

	public void setCid(long cid) {
		this.cid = cid;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getContactType() {
		return contactType;
	}

	public void setContactType(String contactType) {
		this.contactType = contactType;
	}

	

	public ContactTypes getContType() {
		return contType;
	}

	public void setContType(ContactTypes contType) {
		this.contType = contType;
	}


	public List<ContactTypes> getContactTypesList() {
		return contactTypesList;
	}

	public void setContactTypesList(List<ContactTypes> contactTypesList) {
		this.contactTypesList = contactTypesList;
	}

	public BaseService<ContactTypes> getContactTypesService() {
		return contactTypesService;
	}

	public void setContactTypesService(BaseService<ContactTypes> contactTypesService) {
		this.contactTypesService = contactTypesService;
	}

	public void prepare() throws Exception {
		LOGGER.info("prepare");
		// TODO Auto-generated method stub
		User user = (User) SecurityContextHolder.getContext()
		.getAuthentication().getPrincipal();
		contType = new ContactTypes();
		contactTypesList = contactTypesService.findAll(contType);
	}

	public ContactEmployeeService getContactService() {
		return contactService;
	}

	public void setContactService(ContactEmployeeService contactService) {
		this.contactService = contactService;
	}

	public Date getModifiedDate() {
		return modifiedDate;
	}

	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}

	public BaseService<Contact> getContactBaseService() {
		return contactBaseService;
	}

	public void setContactBaseService(BaseService<Contact> contactBaseService) {
		this.contactBaseService = contactBaseService;
	}

	public Contact getUpdatedContact() {
		return updatedContact;
	}

	public void setUpdatedContact(Contact updatedContact) {
		this.updatedContact = updatedContact;
	}

	public Employer getUser() {
		return user;
	}

	public void setUser(Employer user) {
		this.user = user;
	}

	public Employer getContactOwner() {
		return contactOwner;
	}

	public void setContactOwner(Employer contactOwner) {
		this.contactOwner = contactOwner;
	}

	public Employer getProfileOwner() {
		return profileOwner;
	}

	public void setProfileOwner(Employer profileOwner) {
		this.profileOwner = profileOwner;
	}

	public Contact getContact() {
		return contact;
	}

	public void setContact(Contact contact) {
		this.contact = contact;
	}

	public Profile getEmployerProfile() {
		return employerProfile;
	}

	public void setEmployerProfile(Profile employerProfile) {
		this.employerProfile = employerProfile;
	}

	
	
	

}