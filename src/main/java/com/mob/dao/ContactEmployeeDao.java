package com.mob.dao;

import java.util.List;

import com.mob.model.Contact;
import com.mob.model.User;

public interface ContactEmployeeDao {
	
	public List findContacts(long id);
	public List findListContacts(long id);
	public List findListOfContactsForDelete(long id);
	public void updateContact(Contact contact);
	
	public List findEmployeeContactsForSkype(User owner,String name);
	
	public String getPrivacyGroupForContact(long contactProfileId,long itemOwnerUserId);
	public String findContact(long associatedProfileid, long profileid);
	public boolean isContactOwnerEmployer(long id);
}
