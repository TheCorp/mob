package com.mob.services;

import java.util.List;

import javax.mail.MessagingException;

import com.mob.model.Inbox;
import com.mob.model.User;
import com.mob.model.employer.Employer;
import com.mob.model.group.Group;
import com.mob.model.profile.Profile;

public interface MessagingService {
	public List findListEmailMessages(long id);
	public User findMsgReceiverUser(String email);
	public List findInboxListEmailMessages(long id);
	public List findEmprInboxListEmailMessages(long id);
	public Employer findEmplrMsgReceiverUser(String emprEmail);
	public void sendEmail(String fromAddress, String[] toAddress, String[] ccAddress,
			String[] bccAddress, String messageSubject, String messageBody)  throws MessagingException;
	public void sendEmail(String fromAddress, String[] toAddress, String messageSubject,
			String messageBody)  throws MessagingException;

	public List  findUnreadEmailMsgList(long id, boolean unreadMsgid);
	public List findContactsList(long id);
	public User findEmployerMsgReceiverUser(String organizationName);
	public User findContactsUser(String contactName);
	public List findContactNames(long id);
	public void sendEmprMessageToContacts(User sender,String subject, String content, long[] contacts,Profile  profile);
	public void  sendEmpMessageToContacts(User sender,String subject, String content, long[] contacts, Profile profile);
	public void  sendEmpReplyMessageToContacts(User sender,User inboxOwner,Profile profileOwner,Profile associatedProfileOwner, String subject, String content, long[] contacts);
	public void  sendEmprReplyMessageToContacts(User sender,User inboxOwner,Profile profileOwner,Profile associatedOwnerProfile, String subject, String content, long[] contacts);
	public User findContactsUserById(long contactId);
	public Profile findContactsProfileById(long id);
	public Profile findAssociatedProfile(long id);
	public int findNumberOfMessagesInProfile(Profile profile);
	public int findNumberOfUnreadMessagesInProfile(Profile profile);
	public void sendMessage(Profile senderProfile, Profile recieverProfile,String subject, String message) throws MessagingException;
	public void  sendmessageFromGroupForJoin(User sender,Profile senderProfile, Profile associtedProfile,Group group, String message);
	public  void updateInboxMessageRequest(User user, Inbox  inbox);
	public  void rejectInboxMessageRequest(User user, Inbox  inbox);

}
