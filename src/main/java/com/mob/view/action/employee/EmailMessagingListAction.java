package com.mob.view.action.employee;

import java.util.List;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.SentBox;
import com.mob.model.User;
import com.mob.services.MessagingService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

public class EmailMessagingListAction extends ActionSupport implements Preparable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List  listEmailMessages;
	private  MessagingService messagingService;
	private User user;
	private  SentBox sentBox;
	
	private List  cntUnreadMsgList;
	private  boolean  unreadMsgCnt;
	private long unreadEmpMsgListSize;
	
	public SentBox getSentBox() {
		return sentBox;
	}

	public void setSentBox(SentBox sentBox) {
		this.sentBox = sentBox;
	}

	public String listSentMessages(){
		User user = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		listEmailMessages= messagingService.findListEmailMessages(user.getId());
		return "success";
	}

	public List getListEmailMessages() {
		return listEmailMessages;
	}

	public void setListEmailMessages(List listEmailMessages) {
		this.listEmailMessages = listEmailMessages;
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
		// TODO Auto-generated method stub
		 user = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		 cntUnreadMsgList=messagingService.findUnreadEmailMsgList(user.getId(),unreadMsgCnt);
		 unreadEmpMsgListSize=cntUnreadMsgList.size();
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

}
