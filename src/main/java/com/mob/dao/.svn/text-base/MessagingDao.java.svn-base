package com.mob.dao;

import java.util.List;

import com.mob.model.User;
import com.mob.model.employer.Employer;
import com.mob.model.profile.Profile;

public interface MessagingDao {
	public List findListEmailMessages(long id);
	public User findMsgReceiverUser(String email);
	public List findInboxListEmailMessages(long id);
	public List findEmprInboxListEmailMessages(long id);
	public Employer findEmplrMsgReceiverUser(String emprEmail);
	public List  findUnreadEmailMsgList(long id, boolean unreadMsgid);
	public List findContactsList(long id);
	public User findEmployerMsgReceiverUser(String organizationName);
	public User findContactsUser(String contactName);
	public List findContactNames(long id);
    public User findContactsUserById(long contactId);
    public Profile findContactsProfileById(long id);
    public Profile findAssociatedProfile(long id);
    public long countMessagesForProfile(Profile profile);
    public long findUreadMessageCountForProfile(Profile profile);
    
}
