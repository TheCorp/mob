package com.mob.view.action.employee;

import java.util.List;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.Inbox;
import com.mob.model.SentBox;
import com.mob.model.User;
import com.mob.services.BaseService;
import com.mob.services.MessagingService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

public class LoadEmployeeMsgOutboxAction extends ActionSupport implements Preparable {
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(LoadEmployeeMsgOutboxAction.class);

	private SentBox sentBox=new SentBox();
	private Inbox inbox;
	private List listInboxMessages;
	private User user;
	private BaseService<Inbox> inboxBaseService;
	private BaseService<SentBox> sentboxBaseService;
	
	private  MessagingService messagingService;
	private List  cntUnreadMsgList;
	private  boolean  unreadMsgCnt;
	private long unreadEmpMsgListSize;
	
	private String  inboxReadId;
	
	private List  contactList;
	private long  contactListSize;

	public String loadEmployeeOutboxMsgs() {
		LOGGER.info("Inside loadEmployeeOutboxMsgs");
		user = (User) SecurityContextHolder.getContext().getAuthentication()
		.getPrincipal();
		sentBox = sentboxBaseService.findByPrimaryKey(sentBox, sentBox.getId());
		cntUnreadMsgList=messagingService.findUnreadEmailMsgList(user.getId(),unreadMsgCnt);
		unreadEmpMsgListSize=cntUnreadMsgList.size();
		return "success";

	}
	
	public String loadEmployeeOutboxReadMsgs() {
		LOGGER.info("Inside loadEmployeeOutboxReadMsgs");
		int ibReadid=Integer.parseInt(inboxReadId);
		user = (User) SecurityContextHolder.getContext().getAuthentication()
		.getPrincipal();
		sentBox = sentboxBaseService.findByPrimaryKey(sentBox, ibReadid);
		contactList=messagingService.findContactsList(user.getId());
		contactListSize=contactList.size();
		return "success";
	}

	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		user = (User) SecurityContextHolder.getContext().getAuthentication()
		.getPrincipal();

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

	public BaseService<SentBox> getSentboxBaseService() {
		return sentboxBaseService;
	}

	public void setSentboxBaseService(BaseService<SentBox> sentboxBaseService) {
		this.sentboxBaseService = sentboxBaseService;
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

	public String getInboxReadId() {
		return inboxReadId;
	}

	public void setInboxReadId(String inboxReadId) {
		this.inboxReadId = inboxReadId;
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
