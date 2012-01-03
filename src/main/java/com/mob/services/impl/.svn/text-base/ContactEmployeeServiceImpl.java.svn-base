package com.mob.services.impl;

import com.mob.dao.BaseDao;
import com.mob.dao.ContactEmployeeDao;
import com.mob.dao.ProfileDao;
import com.mob.model.Contact;
import com.mob.model.User;
import com.mob.model.profile.Profile;
import com.mob.services.ContactEmployeeService;
import com.mob.util.MOBLogger;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public class ContactEmployeeServiceImpl implements ContactEmployeeService {
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger logger =
        new MOBLogger(ContactEmployeeServiceImpl.class);

	private ContactEmployeeDao contactEmployeeDao;
	private BaseDao<Profile> profileBaseDao;
	
	 

	@Transactional (propagation=Propagation.REQUIRED,readOnly=false)
	public List findContacts(long id) {
		// TODO Auto-generated method stub
		return contactEmployeeDao.findContacts(id);
	}
	
	@Transactional (propagation=Propagation.REQUIRED,readOnly=false)
	public List findListContacts(long id) {
 		// TODO Auto-generated method stub
		return contactEmployeeDao.findListContacts(id);
	}
    
	@Transactional (propagation=Propagation.REQUIRED,readOnly=false)
	public List findListOfContactsForDelete(long id) {
		// TODO Auto-generated method stub
		return this.contactEmployeeDao.findListOfContactsForDelete(id);
	}
	
	public ContactEmployeeDao getContactEmployeeDao() {
		return contactEmployeeDao;
	}

	public void setContactEmployeeDao(ContactEmployeeDao contactEmployeeDao) {
		this.contactEmployeeDao = contactEmployeeDao;
	}
	

	public void updateContact(Contact contact) {
		// TODO Auto-generated method stub
		
			// TODO Auto-generated method stub
		    logger.info("Contact ServiceImpl");
			this.contactEmployeeDao.updateContact(contact);
		}

    private ProfileDao profileDao;

    public void setProfileDao(ProfileDao profileDao) {
        this.profileDao = profileDao;
    }

    @Transactional (propagation=Propagation.REQUIRED,readOnly=false)
	public List findEmployeeContactsForSkype(User owner, String name) {
		
		List<Contact> contacts = this.contactEmployeeDao.findEmployeeContactsForSkype(owner,name);
        if(contacts != null && !contacts.isEmpty()){
            for(Contact contact:contacts){
                User contactProfileOwner = this.profileDao.findProfileOwner(contact.getContactOwner());
                contact.getContactOwner().setProfileOwner(contactProfileOwner);
            }
        }
        return contacts;
    }

	public String findContact(long associatedProfileid, long profileid) {
		// TODO Auto-generated method stub
		return contactEmployeeDao.findContact(associatedProfileid,profileid);
	}

	public boolean isContactOwnerEmployer(Contact contact) {
		Profile profile=new Profile();
		profile=profileBaseDao.findByPrimaryKey(profile,contact.getContactOwner().getId());
		return contactEmployeeDao.isContactOwnerEmployer(profileDao.findProfileOwner(profile).getId());
	}

	public void setProfileBaseDao(BaseDao<Profile> profileBaseDao) {
		this.profileBaseDao = profileBaseDao;
	}

	

	
	
}
