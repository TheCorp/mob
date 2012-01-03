package com.mob.services;

import java.util.List;

import com.mob.model.Contact;
import com.mob.model.User;
import com.mob.model.profile.Profile;

public interface ContactEmployeeService {	

	public List findContacts(long id);
	public List findListContacts(long id);
	public List findListOfContactsForDelete(long id);
	public void updateContact(Contact contact);

	public List findEmployeeContactsForSkype(User owner,String name);
	public String findContact(long associatedProfileid, long profileid);
	public boolean isContactOwnerEmployer(Contact contactOwner);

}
