package com.mob.view.action.employer;

import java.util.Date;
import java.util.List;

import javax.mail.MessagingException;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.Contact;
import com.mob.model.Inbox;
import com.mob.model.SentBox;
import com.mob.model.User;
import com.mob.model.employer.Employer;
import com.mob.services.BaseService;
import com.mob.services.MessagingService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

public class EmprMsgContactListAction extends ActionSupport implements Preparable {

    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(EmprMsgContactListAction.class);
	//private User user;
    private Employer user;
	private MessagingService emprMessagingService;
    private List  contactList;
	private long  contactListSize;
	
	public String listEmprContacts(){
		LOGGER.info("listEmprContacts");
		user = (Employer) SecurityContextHolder.getContext()
		.getAuthentication().getPrincipal();
		LOGGER.info("sent email action");
		contactList=emprMessagingService.findContactsList(user.getId());
		contactListSize=contactList.size();
		LOGGER.info("contactListSize In SentEmail:----"+contactListSize);
		return "success";
	}

	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		
	}

	

	public MessagingService getEmprMessagingService() {
		return emprMessagingService;
	}

	public void setEmprMessagingService(MessagingService emprMessagingService) {
		this.emprMessagingService = emprMessagingService;
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

	public Employer getUser() {
		return user;
	}

	public void setUser(Employer user) {
		this.user = user;
	}

}
