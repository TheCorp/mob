package com.mob.view.action.employee;

import java.util.List;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.Contact;
import com.mob.model.Inbox;
import com.mob.model.SentBox;
import com.mob.model.User;
import com.mob.services.BaseService;
import com.mob.services.MessagingService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

public class LoadEmployeeMsgInboxAction extends ActionSupport implements Preparable {
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(LoadEmployeeMsgInboxAction.class);

	private SentBox sentBox;
	private Inbox inbox = new Inbox();
	private List listInboxMessages;
	private User user;
	private BaseService<Inbox> inboxBaseService;
	private  MessagingService messagingService;
	
	private List  cntUnreadMsgList;
	private  boolean  unreadMsgCnt;
	private long unreadEmpMsgListSize;
	private long inboxId;
	
	private Contact contact;
	private List  contactList;
	private long  contactListSize;
	
	
	private String  inboxReadId;

	public String loadEmployeeInboxMsgs() {
		LOGGER.info("Inside loadEmployeeInboxMsgs" );
		LOGGER.info("inboxid:-----"+inboxId);
		user = (User) SecurityContextHolder.getContext().getAuthentication()
		.getPrincipal();
		inbox = inboxBaseService.findByPrimaryKey(inbox, inbox.getId());
		inbox.setReadUnreadMsgId(true);
		inboxBaseService.update(inbox);
		cntUnreadMsgList=messagingService.findUnreadEmailMsgList(user.getId(),unreadMsgCnt);
		unreadEmpMsgListSize=cntUnreadMsgList.size();
		return "success";
	}
	
	public String loadEmployeeInboxReadMsgs() {
		LOGGER.info("Inside loadEmployeeInboxReadMsgs" );
		int ibReadid=Integer.parseInt(inboxReadId);
		user = (User) SecurityContextHolder.getContext().getAuthentication()
		.getPrincipal();
		inbox = inboxBaseService.findByPrimaryKey(inbox, ibReadid);
		contact= new Contact();
		contactList=messagingService.findContactsList(user.getId());
		contactListSize=contactList.size();
		return "success";
	}

	public void prepare() throws Exception {
		LOGGER.info("Inside prepare" );
		// TODO Auto-generated method stub
		user = (User) SecurityContextHolder.getContext().getAuthentication()
		.getPrincipal();
		contact= new Contact();
		contactList=messagingService.findContactsList(user.getId());
		contactListSize=contactList.size();

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

	public MessagingService getMessagingService() {
		return messagingService;
	}

	public void setMessagingService(MessagingService messagingService) {
		this.messagingService = messagingService;
	}

	public List getCntUnreadMsgList() {
		return cntUnreadMsgList;
	}

	public void setCntUnreadMsgList(List cntUnreadMsgList) {
		this.cntUnreadMsgList = cntUnreadMsgList;
	}

	public boolean isUnreadMsgCnt() {
		return unreadMsgCnt;
	}

	public void setUnreadMsgCnt(boolean unreadMsgCnt) {
		this.unreadMsgCnt = unreadMsgCnt;
	}

	public long getUnreadEmpMsgListSize() {
		return unreadEmpMsgListSize;
	}

	public void setUnreadEmpMsgListSize(long unreadEmpMsgListSize) {
		this.unreadEmpMsgListSize = unreadEmpMsgListSize;
	}

	public long getInboxId() {
		return inboxId;
	}

	public void setInboxId(long inboxId) {
		this.inboxId = inboxId;
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

}
