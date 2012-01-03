package com.mob.view.action.employee;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.Contact;
import com.mob.model.Inbox;
import com.mob.model.SentBox;
import com.mob.model.User;
import com.mob.model.profile.Item;
import com.mob.services.MessagingService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

public class EmailMessagingInboxListAction extends ActionSupport implements Preparable{
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(EmailMessagingInboxListAction.class);
	private static final long serialVersionUID = 1L;
	private List  listInboxEmailMessages;
	private  MessagingService messagingService;
	private User user;
	private  SentBox sentBox;
	private  Inbox  inbox;
	
	private List  cntUnreadMsgList;
	private  boolean  unreadMsgCnt;
	private long unreadEmpMsgListSize;
	
	private  List<Contact>  contactNamesList;
	
	private long  contactsenderId;
	
	private String nickName;

	public SentBox getSentBox() {
		return sentBox;
	}

	public void setSentBox(SentBox sentBox) {
		this.sentBox = sentBox;
	}

	public String listReceivedMessages(){
		LOGGER.info("Inside listReceivedMessages");
		user = (User) SecurityContextHolder.getContext()
		.getAuthentication().getPrincipal();
		listInboxEmailMessages= messagingService.findInboxListEmailMessages(user.getId());
		cntUnreadMsgList=messagingService.findUnreadEmailMsgList(user.getId(),unreadMsgCnt);
		unreadEmpMsgListSize=cntUnreadMsgList.size();
		return "success";
	}

	public List getListInboxEmailMessages() {
		return listInboxEmailMessages;
	}

	public void setListInboxEmailMessages(List listInboxEmailMessages) {
		this.listInboxEmailMessages = listInboxEmailMessages;
	}

	public MessagingService getMessagingService() {
		return messagingService;
	}

	public void setMessagingService(MessagingService messagingService) {
		this.messagingService = messagingService;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void prepare() throws Exception {
		LOGGER.info("Inside prepare");
		// TODO Auto-generated method stub
		user = (User) SecurityContextHolder.getContext()
		.getAuthentication().getPrincipal();
	}

	public Inbox getInbox() {
		return inbox;
	}

	public void setInbox(Inbox inbox) {
		this.inbox = inbox;
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

	

	public long getContactsenderId() {
		return contactsenderId;
	}

	public void setContactsenderId(long contactsenderId) {
		this.contactsenderId = contactsenderId;
	}

	public List getContactNamesList() {
		return contactNamesList;
	}

	public void setContactNamesList(List contactNamesList) {
		this.contactNamesList = contactNamesList;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

}
