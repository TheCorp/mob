package com.mob.view.action.employer;

import java.util.List;

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

public class LoadEmployerMsgInboxAction extends ActionSupport implements Preparable {

    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(LoadEmployerMsgInboxAction.class);

	private SentBox sentBox;
	private Inbox inbox= new Inbox();
	private List listInboxMessages;

	private User user;
	private  MessagingService messagingService;
	private BaseService<Inbox> inboxBaseService;
	private  boolean  unreadMsgCnt;
	private List  listInboxEmprUnrdEmailMessages;
	private long unreadMsgListSize;
	private String  inboxReadId;
	
	private Contact contact;
	private List  emprContactList;
	private long  emprContactListSize;
    
	public String loadEmployerInboxMsgs() {
		LOGGER.info("Inside loadEmployerInboxMsgs");
		user = (User) SecurityContextHolder.getContext().getAuthentication()
		.getPrincipal();
		inbox = inboxBaseService.findByPrimaryKey(inbox, inbox.getId());
	    inbox.setReadUnreadMsgId(true);
	    inboxBaseService.update(inbox);
	    listInboxEmprUnrdEmailMessages=messagingService.findUnreadEmailMsgList(user.getId(),unreadMsgCnt);
		unreadMsgListSize=listInboxEmprUnrdEmailMessages.size();
		return "success";

	}
	
	public String loadEmployerInboxReadMsgs() {
		LOGGER.info("Inside loadEmployerInboxReadMsgs");
		int ibReadid=Integer.parseInt(inboxReadId);
		user = (User) SecurityContextHolder.getContext().getAuthentication()
		.getPrincipal();
		inbox = inboxBaseService.findByPrimaryKey(inbox, ibReadid);
		return "success";
	}

	public void prepare() throws Exception {
		LOGGER.info("Inside prepare");
		// TODO Auto-generated method stub
	    user = (Employer) SecurityContextHolder.getContext()
			.getAuthentication().getPrincipal();
		emprContactList=messagingService.findContactsList(user.getId());
		emprContactListSize=emprContactList.size();
	}

	public SentBox getSentBox() {
		return sentBox;
	}

	public void setSentBox(SentBox sentBox) {
		this.sentBox = sentBox;
	}

	public Inbox getInbox() {
		return inbox;
	}

	public void setInbox(Inbox inbox) {
		this.inbox = inbox;
	}

	public List getListInboxMessages() {
		return listInboxMessages;
	}

	public void setListInboxMessages(List listInboxMessages) {
		this.listInboxMessages = listInboxMessages;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public BaseService<Inbox> getInboxBaseService() {
		return inboxBaseService;
	}

	public void setInboxBaseService(BaseService<Inbox> inboxBaseService) {
		this.inboxBaseService = inboxBaseService;
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

	public MessagingService getMessagingService() {
		return messagingService;
	}

	public void setMessagingService(MessagingService messagingService) {
		this.messagingService = messagingService;
	}

	public String getInboxReadId() {
		return inboxReadId;
	}

	public void setInboxReadId(String inboxReadId) {
		this.inboxReadId = inboxReadId;
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

	

}
