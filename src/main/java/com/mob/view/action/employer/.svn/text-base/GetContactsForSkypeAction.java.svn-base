package com.mob.view.action.employer;

import java.util.Iterator;
import java.util.List;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.Contact;
import com.mob.model.User;
import com.mob.services.ContactEmployeeService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;

public class GetContactsForSkypeAction extends ActionSupport{
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(GetContactsForSkypeAction.class);

	private ContactEmployeeService contactEmployeeService;
	private List contactsForSkype;
	private String name;
	private Contact contact;
	 private String  image;
	 private String resizedMinPicture;

	public String getContacts(){
		LOGGER.info("getContacts");
        User user = (User) SecurityContextHolder.getContext()
                .getAuthentication().getPrincipal();
        contactsForSkype=contactEmployeeService.findEmployeeContactsForSkype(user,name);
        
        try {
			Iterator it=contactsForSkype.iterator();
			while (it.hasNext()) {
				contact = (Contact) it.next();
				 if(contact.getAssociatedProfile().getPicture()!=null){
					 image=(String)contact.getAssociatedProfile().getAmazonFileURL().get(0);
					}
				
					if(contact.getAssociatedProfile().getResizedMinPicture()!=null){
						resizedMinPicture=(String) contact.getAssociatedProfile().getAmazonFileURL().get(2);
						contact.getAssociatedProfile().setResizedMinPicture(resizedMinPicture);
					}
				
		} 
		}catch (Exception e) {
			e.printStackTrace();
		}
		LOGGER.info("contactsforSkype size"+contactsForSkype.size());
		return "success";
	}

	public ContactEmployeeService getContactEmployeeService() {
		return contactEmployeeService;
	}

	public void setContactEmployeeService(
			ContactEmployeeService contactEmployeeService) {
		this.contactEmployeeService = contactEmployeeService;
	}

	public List getContactsForSkype() {
		return contactsForSkype;
	}

	public void setContactsForSkype(List contactsForSkype) {
		this.contactsForSkype = contactsForSkype;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Contact getContact() {
		return contact;
	}

	public void setContact(Contact contact) {
		this.contact = contact;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getResizedMinPicture() {
		return resizedMinPicture;
	}

	public void setResizedMinPicture(String resizedMinPicture) {
		this.resizedMinPicture = resizedMinPicture;
	}
	

}
