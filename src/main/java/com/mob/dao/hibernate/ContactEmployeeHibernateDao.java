package com.mob.dao.hibernate;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.mob.dao.ContactEmployeeDao;
import com.mob.model.Contact;
import com.mob.model.PrivacyGroup;
import com.mob.model.User;
import com.mob.model.profile.Profile;
import com.mob.util.MOBLogger;

public class ContactEmployeeHibernateDao
        extends HibernateDaoSupport implements ContactEmployeeDao {

	private static final MOBLogger LOGGER =
        new MOBLogger(HibernateEmployeeAccountDao.class);
	
    public List findContacts(long id) {

        String queryString = "from Contact c where c.profileOwner.id= :id ";
        List list_contacts = (List) getHibernateTemplate().findByNamedParam(queryString, "id", id);
        return list_contacts;
    }

    public List findListContacts(long id) {

        String queryString = "from Contact c where c.associatedProfile.id= :id ";
        return getHibernateTemplate().findByNamedParam(queryString, "id", id);
    }
    
    public List findListOfContactsForDelete(long id) {

        String queryString = "from Contact c where c.contactOwner.id= :id ";
        return getHibernateTemplate().findByNamedParam(queryString, "id", id);
    }


    public void updateContact(Contact contact) {


        String hql = "update Contact set nickName=:nickName,contactType=:contactType,modifiedDate=:modifiedDate where id = :id";

        Query query = getSession().createQuery(hql);
        query.setString("nickName", contact.getNickName());
        query.setString("contactType", contact.getContactType());
        query.setDate("modifiedDate", contact.getModifiedDate());
        query.setLong("id", contact.getId());
        query.executeUpdate();

    }

    public List findEmployeeContactsForSkype(User owner, String name) {

        String queryString = "from Contact c join fetch c.contactOwner co where c.nickName like :name " +
                "and c.profileOwner like :owner";
        return getHibernateTemplate().findByNamedParam(queryString, new String[]{"name", "owner"},
                new Object[]{"%" + name + "%", owner});

    }

    public String getPrivacyGroupForContact(long viewerUserId, long itemOwnerUserId) {


        String queryString = "Select c.contactType from Contact c " +
                "where c.contactOwner.id= :viewerUserId and  c.associatedProfile.id=:itemOwnerUserId";

        List<String> contactType = getHibernateTemplate().findByNamedParam(queryString,
                new String[]{"viewerUserId", "itemOwnerUserId"}, new Object[]{viewerUserId, itemOwnerUserId});

        if (contactType != null && !contactType.isEmpty()) {
            return contactType.get(0);
        } else {
            return null;
        }
    }
    
    public String findContact(long associatedProfileid, long profileid) {
		// TODO Auto-generated method stub
		String queryString = "from Contact c where c.associatedProfile.id = :associatedProfileid and  c.contactOwner.id= :profileid";
		
		List findByNamedParam = getHibernateTemplate().findByNamedParam(queryString, new String[]{"associatedProfileid", "profileid"},new Object[]{associatedProfileid, profileid});
		List<Contact> contact = findByNamedParam;
		if(contact.size()==0){
			LOGGER.info("Conatct empty");
			return "true";
		}else{
			return "false";
		}
	}

	public boolean isContactOwnerEmployer(long id) {
		boolean result=false;
		String queryString = "from User as user join fetch user.roles as r where user.id like :id and r.name like 'ROLE_EMPLOYER'";
	    Query query = getSession().createQuery(queryString);
		query.setLong("id",id);
		User user=(User)query.uniqueResult();
		if(user!=null)
			result=true;
		else
			result=false;
		return result;
	}
}
