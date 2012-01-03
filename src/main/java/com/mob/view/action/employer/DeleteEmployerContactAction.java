package com.mob.view.action.employer;

import com.mob.model.Contact;
import com.mob.model.User;
import com.mob.model.profile.Profile;
import com.mob.services.BaseService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;

public class DeleteEmployerContactAction extends ActionSupport{
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(DeleteEmployerContactAction.class);

	private Profile profile;
	private BaseService<Contact> contactService;
	private Contact contact;
	private User user;
	
	
   
    
	

	public String delete() {
		
		
	
		LOGGER.info("contact obj:---"+contact.getClass());
		LOGGER.info("contact id:---"+contact.getId());
		contactService.delete(contact);
		
	    return "success";
	}




	public Profile getProfile() {
		return profile;
	}




	public void setProfile(Profile profile) {
		this.profile = profile;
	}




	public BaseService<Contact> getContactService() {
		return contactService;
	}




	public void setContactService(BaseService<Contact> contactService) {
		this.contactService = contactService;
	}




	public Contact getContact() {
		return contact;
	}




	public void setContact(Contact contact) {
		this.contact = contact;
	}




	public User getUser() {
		return user;
	}




	public void setUser(User user) {
		this.user = user;
	}







	
}
