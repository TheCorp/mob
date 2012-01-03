package com.mob.view.action.employer;

import java.util.List;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.SentBox;
import com.mob.model.employer.Employer;
import com.mob.services.MessagingService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

public class ListEmprEmailMessagingListAction extends ActionSupport implements
Preparable {
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(ListEmprEmailMessagingListAction.class);
    
	private static final long serialVersionUID = 1L;
	private List listEmailMessages;
	private MessagingService emprmessagingService;
	private Employer user;
	private SentBox sentBox;
	
	private  boolean  unreadMsgCnt;
	private List  listInboxEmprUnrdEmailMessages;
	private long unreadMsgListSize;

	public SentBox getSentBox() {
		return sentBox;
	}

	public void setSentBox(SentBox sentBox) {
		this.sentBox = sentBox;
	}

	public String listEmprSentMessages() {
		LOGGER.info("Inside listEmprSentMessages");
		user = (Employer) SecurityContextHolder.getContext()
		.getAuthentication().getPrincipal();
		listEmailMessages = emprmessagingService.findListEmailMessages(user
				.getId());
		 listInboxEmprUnrdEmailMessages=emprmessagingService.findUnreadEmailMsgList(user.getId(),unreadMsgCnt);
		unreadMsgListSize=listInboxEmprUnrdEmailMessages.size();
		return "success";
	}

	public List getListEmailMessages() {
		return listEmailMessages;
	}

	public void setListEmailMessages(List listEmailMessages) {
		this.listEmailMessages = listEmailMessages;
	}

	public void prepare() throws Exception {
		LOGGER.info("prepare");
		// TODO Auto-generated method stub
		user = (Employer) SecurityContextHolder.getContext()
		.getAuthentication().getPrincipal();

	}

	public MessagingService getEmprmessagingService() {
		return emprmessagingService;
	}

	public void setEmprmessagingService(MessagingService emprmessagingService) {
		this.emprmessagingService = emprmessagingService;
	}

	public Employer getUser() {
		return user;
	}

	public void setUser(Employer user) {
		this.user = user;
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

}
