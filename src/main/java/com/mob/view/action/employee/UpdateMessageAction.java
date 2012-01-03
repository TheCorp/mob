package com.mob.view.action.employee;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.Inbox;
import com.mob.model.User;
import com.mob.services.MessagingService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;

public class UpdateMessageAction extends ActionSupport {
	/**
	 * Logger for logging messages.
	 */
	private static final MOBLogger LOGGER = new MOBLogger(UpdateMessageAction.class);
	private static final long serialVersionUID = 1L;
	private User user;
	private MessagingService messagingService;
    private Inbox  inbox; 
    private String  inboxid;

    public String updateRequestFromGroup() {
    	System.out.println("updateRequestFromGroup");
    	user = (User) SecurityContextHolder.getContext().getAuthentication()
    	.getPrincipal();
    	System.out.println("inbox" +inbox.getId());
    	this.messagingService.updateInboxMessageRequest(user, inbox);
    	return "success";
    }

    public String rejectRequestFromJoinGroup(){
    	System.out.println("updateRequestFromGroup");
    	user = (User) SecurityContextHolder.getContext().getAuthentication()
    	.getPrincipal();
    	System.out.println("inbox" +inbox.getId());
    	this.messagingService.rejectInboxMessageRequest(user, inbox);
    	return "success";
    	
    }
    
	public Inbox getInbox() {
		return inbox;
	}

	public void setInbox(Inbox inbox) {
		this.inbox = inbox;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public MessagingService getMessagingService() {
		return messagingService;
	}

	public void setMessagingService(MessagingService messagingService) {
		this.messagingService = messagingService;
	}

	public String getInboxid() {
		return inboxid;
	}

	public void setInboxid(String inboxid) {
		this.inboxid = inboxid;
	}

	

	
}
