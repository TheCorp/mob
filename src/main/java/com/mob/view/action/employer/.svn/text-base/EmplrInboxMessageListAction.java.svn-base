package com.mob.view.action.employer;

import java.util.List;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.Inbox;
import com.mob.model.SentBox;
import com.mob.model.employer.Employer;
import com.mob.services.MessagingService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

public class EmplrInboxMessageListAction extends ActionSupport implements Preparable{
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(EmplrInboxMessageListAction.class);
	private static final long serialVersionUID = 1L;
	private List  listEmprInboxEmailMessages;
	private  MessagingService messagingService;
	private Employer user;
	private  SentBox sentBox;
	private  Inbox  inbox;
	private  boolean  unreadMsgCnt;
	private List  listInboxEmprUnrdEmailMessages;
	private long unreadMsgListSize;
	
	public SentBox getSentBox() {
		return sentBox;
	}

	public void setSentBox(SentBox sentBox) {
		this.sentBox = sentBox;
	}

	public String listEmprRecdMessages(){
		 user = (Employer) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		 listEmprInboxEmailMessages= messagingService.findEmprInboxListEmailMessages(user.getId());
		return "success";
	}

	

	public MessagingService getMessagingService() {
		return messagingService;
	}

	public void setMessagingService(MessagingService messagingService) {
		this.messagingService = messagingService;
	}



	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		 user = (Employer) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		 listInboxEmprUnrdEmailMessages=messagingService.findUnreadEmailMsgList(user.getId(),unreadMsgCnt);
		unreadMsgListSize=listInboxEmprUnrdEmailMessages.size();
        LOGGER.info("In Prepare Method unreadMsgListSize:" +unreadMsgListSize);
	}

	public Inbox getInbox() {
		return inbox;
	}

	public void setInbox(Inbox inbox) {
		this.inbox = inbox;
	}

	public Employer getUser() {
		return user;
	}

	public void setUser(Employer user) {
		this.user = user;
	}

	public List getListEmprInboxEmailMessages() {
		return listEmprInboxEmailMessages;
	}

	public void setListEmprInboxEmailMessages(List listEmprInboxEmailMessages) {
		this.listEmprInboxEmailMessages = listEmprInboxEmailMessages;
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
		unreadMsgListSize = unreadMsgListSize;
	}

}
