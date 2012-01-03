package com.mob.dao.hibernate;

import com.mob.dao.MessagingDao;
import com.mob.model.Contact;
import com.mob.model.User;
import com.mob.model.employer.Employer;
import com.mob.model.profile.Profile;
import com.mob.util.MOBLogger;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.sql.SQLException;
import java.util.List;

public class HibernateMessagingDao extends HibernateDaoSupport implements MessagingDao {

    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
            new MOBLogger(HibernateMessagingDao.class);

    public List findListEmailMessages(long id) {
        // TODO Auto-generated method stub
        String queryString = "from SentBox sb where sb.sentBoxOwner.id= :id order by sb.emailSendDate desc";
        return getHibernateTemplate().findByNamedParam(queryString, "id", id);
    }

    public User findMsgReceiverUser(String firstName) {
        // TODO Auto-generated method stub
        LOGGER.info("Entering Method :findMsgReceiverUser");
        User user = null;
        String queryString = "from User u where u.firstName =:firstName";
        List users = getHibernateTemplate().findByNamedParam(queryString, "firstName", firstName);

        if (users.size() == 0) {
            LOGGER.info("user empty");

        } else {
            user = (User) users.get(0);

            LOGGER.info("user already there" + (User) users.get(0));

        }
        LOGGER.info("Leaving Method :findMsgReceiverUser");
        return user;

    }


    public User findEmployerMsgReceiverUser(String organizationName) {
        // TODO Auto-generated method stub
        LOGGER.info("Entering Method :findEmployerMsgReceiverUser");
        User user = null;
        String queryString = "from Employer e where e.organizationName =:organizationName";
        List users = getHibernateTemplate().findByNamedParam(queryString, "organizationName", organizationName);

        if (users.size() == 0) {
            LOGGER.info("Employer user empty");

        } else {
            user = (User) users.get(0);

            LOGGER.info("Employer user already there" + (User) users.get(0));

        }
        LOGGER.info("Leaving Method :findEmployerMsgReceiverUser");
        return user;

    }

    public List findInboxListEmailMessages(long id) {
        // TODO Auto-generated method stub
     String queryString = "from Inbox ib where ib.inboxOwner.id= :id order by ib.receivedDate desc";
    //	 String queryString = "from Inbox ib where ib.inboxOwner.id= :id";               
        return getHibernateTemplate().findByNamedParam(queryString, "id", id);
    }

    public List findEmprInboxListEmailMessages(long id) {
        // TODO Auto-generated method stub
        String queryString = "from Inbox ib where ib.inboxOwner.id= :id ";
        return getHibernateTemplate().findByNamedParam(queryString, "id", id);
    }

    public Employer findEmplrMsgReceiverUser(String firstName) {
        // TODO Auto-generated method stub
        Employer user = null;
        String queryString = "from User u where u.firstName =:firstName";
        List users = getHibernateTemplate().findByNamedParam(queryString, "firstName", firstName);

        if (users.size() == 0) {
            LOGGER.info("user empty");

        } else {
            user = (Employer) users.get(0);

            LOGGER.info("user already there" + (Employer) users.get(0));

        }
        return user;
    }

    public List findUnreadEmailMsgList(long id, boolean unreadMsgid) {
        // TODO Auto-generated method stub
        LOGGER.info("findUnreadEmailMsgList***:");
        //String queryString1 = "from Inbox ib where ib.inboxOwner.id= :id and ib.readUnreadMsgId= :unreadMsgid";
        String queryString = "from Inbox ib where ib.readUnreadMsgId= :unreadMsgid and ib.inboxOwner.id= :id";
        //return getHibernateTemplate().findByNamedParam(queryString, "readUnreadMsgId",unreadMsgid, "id", id);
        return getHibernateTemplate().findByNamedParam(queryString, new String[]{"unreadMsgid", "id"}, new Object[]{unreadMsgid, id});
    }

    public List findContactsList(long id) {
        // TODO Auto-generated method stub
        String queryString = "from Contact c where c.profileOwner.id= :id ";
        return getHibernateTemplate().findByNamedParam(queryString, "id", id);
    }

    public User findContactsUser(final String nickName) {
        LOGGER.info("In Find ContactUser:--");
        // TODO Auto-generated method stub
        User user = null;
        final String queryString = "select distinct(c.contactOwner) from Contact c where c.nickName= :nickName";

        user = (User) getHibernateTemplate().execute(new HibernateCallback() {

            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query qry = session.createQuery(queryString);
//                findByNamedParam(queryString, "nickName", nickName);
//
                qry.setString("nickName", nickName);
                List profiles = qry.list();
                if (profiles.size() == 0) {
                    LOGGER.info("Contact user empty");
                } else {
                    Profile userProfile = (Profile) profiles.get(0);

//                    LOGGER.info("Contact already there" + (Profile) profiles.get(0));
                    return userProfile.getProfileOwner();
                }
                return null;
            }
        }
        );

        return user;

    }
    
    
    public User findContactsUserById(final long id){
    	  LOGGER.info("In Find findContactsUser :--");
    	  // TODO Auto-generated method stub
    	  User user = null;
          final String queryString = "select distinct(c.contactOwner) from Contact c where c.id= :id";

          user = (User) getHibernateTemplate().execute(new HibernateCallback() {

              public Object doInHibernate(Session session) throws HibernateException, SQLException {
                  Query qry = session.createQuery(queryString);
//                  findByNamedParam(queryString, "nickName", nickName);
  //
                  qry.setLong("id", id);
                  List profiles = qry.list();
                  if (profiles.size() == 0) {
                      LOGGER.info("Contact user empty");
                  } else {
                      Profile userProfile = (Profile) profiles.get(0);

//                      LOGGER.info("Contact already there" + (Profile) profiles.get(0));
                      return userProfile.getProfileOwner();
                  }
                  return null;
              }
          }
          );

          return user;
    	
    }
    
    
    public Profile findContactsProfileById(long id) {
    	LOGGER.info("In Find findContactsProfileById :--");
    	// TODO Auto-generated method stub
    	Profile profile = null;
    	String queryString = "select distinct(c.contactOwner) from Contact c where c.id= :id";
    	List profiles = getHibernateTemplate().findByNamedParam(queryString,
    			"id", id);
    	if (profiles.size() == 0) {
    		LOGGER.info("Contact user empty");
    	} else {
    		profile = (Profile) profiles.get(0);
    		LOGGER.info("Contact already there" + (Profile) profiles.get(0));
    	}
    	return profile;

    }
    
    
    

    public List<Contact> findContactNames(long id) {
        // TODO Auto-generated method stub
        LOGGER.info("Id in Hibenate Messaging Dao:" + id);
        String queryString = "from Contact c where c.profileOwner.id= :id ";

        return getHibernateTemplate().findByNamedParam(queryString, "id", id);
    }

	public Profile findAssociatedProfile(long id) {
		// TODO Auto-generated method stub
		LOGGER.info("In Find findAssociatedProfile :--");
    	// TODO Auto-generated method stub
    	Profile profile = null;
    	String queryString = "select distinct(c.associatedProfile) from Contact c where c.id= :id";
    	List profiles = getHibernateTemplate().findByNamedParam(queryString,
    			"id", id);
    	if (profiles.size() == 0) {
    		LOGGER.info("Contact user empty");
    	} else {
    		profile = (Profile) profiles.get(0);
    		LOGGER.info("Contact already there" + (Profile) profiles.get(0));
    	}
    	return profile;
	}

    public long countMessagesForProfile(Profile profile) {
        String hql = "select count(*) from Inbox i where i.associatedOwnerProfile like ?";
        List<Long> counts = (List<Long>)getHibernateTemplate().find(hql, profile);
        if(counts != null && !counts.isEmpty()){
            return counts.get(0);
        }else{
            return 0;
        }
    }

    public long findUreadMessageCountForProfile(Profile profile) {
        String queryString = "select count(*) from Inbox ib where ib.readUnreadMsgId= :unreadMsgid and ib.associatedOwnerProfile= :profile";
        //return getHibernateTemplate().findByNamedParam(queryString, "readUnreadMsgId",unreadMsgid, "id", id);
        List<Long> counts = (List<Long>) getHibernateTemplate().
                findByNamedParam(queryString, new String[]{"unreadMsgid", "profile"}, new Object[]{true, profile});

        if(counts != null && !counts.isEmpty()){
            return counts.get(0);
        }else{
            return 0;
        }
    }

}
