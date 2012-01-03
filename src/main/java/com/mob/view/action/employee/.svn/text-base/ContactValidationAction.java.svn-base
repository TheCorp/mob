package com.mob.view.action.employee;

import com.mob.model.Contact;
import com.mob.model.User;
import com.mob.services.BaseService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;

public class ContactValidationAction extends ActionSupport {
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(ContactValidationAction.class);

	private User user;
	private Contact contact;
	private String nickName;

	private BaseService<User> userService;
	private BaseService<Contact> contactService;
	
	private String result;



	public String validateContactName() {
		LOGGER.info("Inside ValidateContactName***");
		/*User user = (User) SecurityContextHolder.getContext()
		.getAuthentication().getPrincipal();
		contact.setContactOwner(user);
		contact.setInboxOwnerProfile(user);*/
		LOGGER.info("Contact Name in Action class getNickName():" +getNickName());
		/*result = contactService.findByContactNameValidation(contact,
				getNickName());
		LOGGER.info("result" + result);

		if (result.equals("true")) {
			return "success";
		} else {
			return "failure";
		}*/
		return "success";
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public BaseService<User> getUserService() {
		return userService;
	}

	public void setUserService(BaseService<User> userService) {
		this.userService = userService;
	}



	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public Contact getContact() {
		return contact;
	}

	public void setContact(Contact contact) {
		this.contact = contact;
	}

	public BaseService<Contact> getContactService() {
		return contactService;
	}

	public void setContactService(BaseService<Contact> contactService) {
		this.contactService = contactService;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

}
