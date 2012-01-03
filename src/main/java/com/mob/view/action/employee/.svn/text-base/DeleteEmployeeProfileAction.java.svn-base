package com.mob.view.action.employee;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.mob.model.Contact;
import com.mob.model.profile.Profile;
import com.mob.services.BaseService;
import com.mob.services.ContactEmployeeService;
import com.mob.services.EmployeeProfileService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;

public class DeleteEmployeeProfileAction extends ActionSupport {

    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(DeleteEmployeeProfileAction.class);

	private Profile profile;	
	private BaseService<Profile> profileService;
	private BaseService<Contact> contactService;
	private Contact contact;
	private List contacts=new ArrayList();
	private List contactsForDelete=new ArrayList();
	private EmployeeProfileService employeeProfileService;
	private ContactEmployeeService contactEmployeeService;
	public String delete() {
		try{  
		
		 contacts = contactEmployeeService.findListOfContactsForDelete(profile.getId());
		 Iterator it=contacts.iterator();
		 while(it.hasNext()){
		    Contact deletedContact=(Contact)it.next();	
		    profile=profileService.findByPrimaryKey(profile,profile.getId());
		    profile.getContacts().remove(deletedContact);
		    contactService.delete(deletedContact);
		 }
		 contactsForDelete = contactEmployeeService.findListContacts(profile.getId());
		 Iterator it1=contactsForDelete.iterator();
		 while(it1.hasNext()){
		    Contact deletedContact=(Contact)it1.next();	
		    profile=profileService.findByPrimaryKey(profile,profile.getId());
		    profile.getContacts().remove(deletedContact);
		    contactService.delete(deletedContact);
		 }
		 
	      profileService.delete(profile);
		}catch (Exception e) {
			System.out.println("exception "+e.getMessage());
			e.printStackTrace();
		}
		return "success";
	}
	
	
	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}
	
	
	public BaseService<Profile> getProfileService() {
		return profileService;
	}
	public void setProfileService(BaseService<Profile> profileService) {
		this.profileService = profileService;
	}


	public EmployeeProfileService getEmployeeProfileService() {
		return employeeProfileService;
	}


	public void setEmployeeProfileService(
			EmployeeProfileService employeeProfileService) {
		this.employeeProfileService = employeeProfileService;
	}


	public Contact getContact() {
		return contact;
	}


	public void setContact(Contact contact) {
		this.contact = contact;
	}


	public List getContacts() {
		return contacts;
	}


	public void setContacts(List contacts) {
		this.contacts = contacts;
	}


	public ContactEmployeeService getContactEmployeeService() {
		return contactEmployeeService;
	}


	public void setContactEmployeeService(
			ContactEmployeeService contactEmployeeService) {
		this.contactEmployeeService = contactEmployeeService;
	}


	public BaseService<Contact> getContactService() {
		return contactService;
	}


	public void setContactService(BaseService<Contact> contactService) {
		this.contactService = contactService;
	}


	public List getContactsForDelete() {
		return contactsForDelete;
	}


	public void setContactsForDelete(List contactsForDelete) {
		this.contactsForDelete = contactsForDelete;
	}


	
}
