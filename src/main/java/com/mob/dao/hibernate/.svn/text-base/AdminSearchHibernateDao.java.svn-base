package com.mob.dao.hibernate;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.bea.xml.stream.StaticAllocator;
import com.mob.dao.AdminSearchDao;
import com.mob.model.FlagData;
import com.mob.model.User;
import com.mob.model.group.Group;
import com.mob.model.group.GroupDiscussions;
import com.mob.model.group.Topics;
import com.mob.model.profile.Item;
import com.mob.model.profile.Profile;
 
public class AdminSearchHibernateDao extends HibernateDaoSupport implements AdminSearchDao {

	public List<User> findByUserName(String name) {
		
	 	 SessionFactory sessionFactory = getHibernateTemplate().getSessionFactory();
	     Session session = sessionFactory.openSession();
	     Query query = session.createQuery("from User u where u.firstName like :name");
	     query.setString("name", "%" + name + "%");
	     List<User> result = query.list();
	     session.close();
		 return result;
	}

	public List<Profile> findByProfileName(String name) {
		
		 SessionFactory sessionFactory = getHibernateTemplate().getSessionFactory();
	     Session session = sessionFactory.openSession();
	     Query query = session.createQuery("from Profile p where p.name like :name");
	     query.setString("name", "%" + name + "%");
	     List<Profile> result = query.list();
	     session.close();
		 return result; 
	}

	public FlagData findExistingFlagData(String selectedFlaggedId,String type) {
		
		    String queryString ="from FlagData f where f.flaggedId=:selectedFlaggedId and f.type=:type";
			Query query = getSession().createQuery(queryString);
			query.setLong("selectedFlaggedId",Long.parseLong(selectedFlaggedId));
			query.setString("type",type);
			FlagData flagData=(FlagData)query.uniqueResult();  
			 getSession().close();
		 	return flagData;
	}

	public User findByExistingUser(String selectedFlaggedId) {
		
		 String queryString ="from User u where u.id=:selectedFlaggedId";
			Query query = getSession().createQuery(queryString);
			query.setLong("selectedFlaggedId",Long.parseLong(selectedFlaggedId));
			User user=(User)query.uniqueResult();  
			 getSession().close();
		 	return user;
	}

	public Profile findByExistingProfile(String selectedFlaggedId) {
		
		 String queryString ="from Profile p where p.id=:selectedFlaggedId";
			Query query = getSession().createQuery(queryString);
			query.setLong("selectedFlaggedId",Long.parseLong(selectedFlaggedId));
			Profile profile=(Profile)query.uniqueResult();  
			getSession().close();
		 	return profile;
	}
	public Item findByExistingItem(String selectedFlaggedId) {
		
		 String queryString ="from Item i where i.id=:selectedFlaggedId";
			Query query = getSession().createQuery(queryString);
			query.setLong("selectedFlaggedId",Long.parseLong(selectedFlaggedId));
			Item item=(Item)query.uniqueResult();  
			 getSession().close();
		 	return item;
	}
	
	public GroupDiscussions findByExistingThreads(String selectedFlaggedId) {
	
		 String queryString ="from GroupDiscussions gd where gd.id=:selectedFlaggedId";
			Query query = getSession().createQuery(queryString);
			query.setLong("selectedFlaggedId",Long.parseLong(selectedFlaggedId));
			GroupDiscussions groupDiscussions=(GroupDiscussions)query.uniqueResult();  
			 getSession().close();
		 	return groupDiscussions;
	}
	
	public List<User> findAllFlaggedUser() {
		
		 SessionFactory sessionFactory = getHibernateTemplate().getSessionFactory();
	     Session session = sessionFactory.openSession();
	     Query query = session.createQuery("from User u where u.flagdelete=false");	     
	     List<User> result = query.list();
	     session.close();
		 return result; 
	}
	

	public List<Item> findAllFlaggedItems() {
		
		 SessionFactory sessionFactory = getHibernateTemplate().getSessionFactory();
	     Session session = sessionFactory.openSession();
	     Query query = session.createQuery("from Item i where i.flagdelete=false");	     
	     List<Item> result = query.list();
	     session.close();
		 return result;
	}

	public List<Profile> findAllFlaggedProfiles() {
		
		 SessionFactory sessionFactory = getHibernateTemplate().getSessionFactory();
	     Session session = sessionFactory.openSession();
	     Query query = session.createQuery("from Profile p where p.flagdelete=false");	     
	     List<Profile> result = query.list();
	     session.close();
		 return result;
	}
	

	public List<User> findAllAdminFlaggedUser(String selectedTableName) {
		
		 SessionFactory sessionFactory = getHibernateTemplate().getSessionFactory();
	     Session session = sessionFactory.openSession();
	     Query query = session.createQuery("from User u where u.flagged=true and u.flagdelete=false");	     
	     List<User> result = query.list();
	     session.close();
		 return result;
	}
	
	public List<Profile> findAllAdminFlaggedProfile(String selectedTableName) {
		
		 SessionFactory sessionFactory = getHibernateTemplate().getSessionFactory();
	     Session session = sessionFactory.openSession();
	     Query query = session.createQuery("from Profile p where p.flagged=true and p.flagdelete=false");	     
	     List<Profile> result = query.list();
	     session.close();
		 return result;
	}
	
	public List<Item> findAllAdminFlaggedItems(String selectedTableName) {
		 SessionFactory sessionFactory = getHibernateTemplate().getSessionFactory();
	     Session session = sessionFactory.openSession();
	     Query query = session.createQuery("from Item i where i.flagged=true and i.flagdelete=false");	     
	     List<Item> result = query.list();
	     session.close();
		 return result;
	}

	public List<FlagData> findCommentsForFlaggedUser(User user,
			String selectedTableName) {
		
		SessionFactory sessionFactory = getHibernateTemplate().getSessionFactory();
	     Session session = sessionFactory.openSession();
	     Query query = session.createQuery("from FlagData where flaggedId=:flaggedUserId and type=:type");
	     query.setLong("flaggedUserId",user.getId());
	     query.setString("type",selectedTableName);
	     List<FlagData> result = query.list();
	     session.close();
		 return result;
	}

	
	


	public List<FlagData> findCommentsForFlaggedProfile(Profile profile,
			String selectedTableName) {
		
		 String queryString = "from FlagData where flaggedId=:flaggedProfileId and type=:type";
			Query query = getSession().createQuery(queryString);
			query.setLong("flaggedProfileId",profile.getId());
		     query.setString("type",selectedTableName);
		     List<FlagData> result = query.list();
		     return result;
		
	}

	
	public List<FlagData> findCommentsForFlaggedItem(Item item,
			String selectedTableName) {
		SessionFactory sessionFactory = getHibernateTemplate().getSessionFactory();
	     Session session = sessionFactory.openSession();
	     Query query = session.createQuery("from FlagData where flaggedId=:flaggedItemId and type=:type");
	     query.setLong("flaggedItemId",item.getId());
	     query.setString("type",selectedTableName);
	     List<FlagData> result = query.list();
	     session.close();
		 return result;
	}
	
	public List<User> findByFlaggedUserName(String searchByName) {
		
		 SessionFactory sessionFactory = getHibernateTemplate().getSessionFactory();
	     Session session = sessionFactory.openSession();
	     Query query = session.createQuery("from User u where u.firstName like :name and u.flagdelete=false");
	     query.setString("name", "%" + searchByName + "%");
	     List<User> result = query.list();
	     session.close();
		 return result;
	}
	
	

	public List<Profile> findByFlaggedProfilName(String searchByName) {
		
		SessionFactory sessionFactory = getHibernateTemplate().getSessionFactory();
	     Session session = sessionFactory.openSession();
	     Query query = session.createQuery("from Profile p where p.name like :name and p.flagdelete=false");
	     query.setString("name", "%" + searchByName + "%");
	     List<Profile> result = query.list();
	    session.close();
		 return result;
	}

	public List<Item> findByFlaggedItemTitle(String searchByTitle) {
		
		 SessionFactory sessionFactory = getHibernateTemplate().getSessionFactory();
	     Session session = sessionFactory.openSession();
	     Query query = session.createQuery("from Item i where i.name like :name and i.flagdelete=false");
	     query.setString("name", "%" + searchByTitle + "%");
	     List<Item> result = query.list();
	    session.close();
		 return result;
	}
	
	public List<User> findByAdminFlaggedUserName(String searchByName) {
		
		 SessionFactory sessionFactory = getHibernateTemplate().getSessionFactory();
	     Session session = sessionFactory.openSession();
	     Query query = session.createQuery("from User u where u.firstName like :name and u.flagged=true");
	     query.setString("name", "%" + searchByName + "%");
	     List<User> result = query.list();
	    session.close();
		 return result;
	}
	
	

	public List<Profile> findByAdminFlaggedProfilName(String searchByName) {
		
		SessionFactory sessionFactory = getHibernateTemplate().getSessionFactory();
	     Session session = sessionFactory.openSession();
	     Query query = session.createQuery("from Profile p where p.name like :name and p.flagged=true");
	     query.setString("name", "%" + searchByName + "%");
	     List<Profile> result = query.list();
	    session.close();   
		 return result;
	}

	public List<Item> findByAdminFlaggedItemTitle(String searchByTitle) {
		 SessionFactory sessionFactory = getHibernateTemplate().getSessionFactory();
	     Session session = sessionFactory.openSession();
	     Query query = session.createQuery("from Item i where i.name like :name and i.flagged=true");
	     query.setString("name", "%" + searchByTitle + "%");
	     List<Item> result = query.list();
	    session.close();
		 return result;
	}

	
	public List<GroupDiscussions> findAllAdminFlaggedThreads(
			String selectedTableName) {
		
		SessionFactory sessionFactory = getHibernateTemplate().getSessionFactory();
	     Session session = sessionFactory.openSession();
	     Query query = session.createQuery("from GroupDiscussions gd where gd.flagged=true and gd.flagdelete=false");	     
	     List<GroupDiscussions> result = query.list();
	     session.close();
		 return result;
	}


	public List<FlagData> findCommentsForFlaggedThreads(GroupDiscussions groupDiscussions,
			String selectedTableName) {
		SessionFactory sessionFactory = getHibernateTemplate().getSessionFactory();
	     Session session = sessionFactory.openSession();
	     Query query = session.createQuery("from FlagData where flaggedId=:flaggedThreadId and type=:type");
	     query.setLong("flaggedThreadId",groupDiscussions.getId());
	     query.setString("type",selectedTableName);
	     List<FlagData> result = query.list();
	     session.close();
		 return result;
	}


	public List<GroupDiscussions> findByAdminFlaggedThreadTitle(
			String searchByTitle) {
		
		 String queryString = "from GroupDiscussions gd where gd.discussions like :discussions and gd.flagged=true";
			Query query = getSession().createQuery(queryString);
			query.setString("discussions", "%" + searchByTitle + "%");
		     List<GroupDiscussions> result = query.list();
		     getSession().close();
			 return result;
		
			}


	public List<FlagData> findCommentsForFlaggedThread(
			GroupDiscussions groupDiscussions, String selectedTableName) {
	
		 String queryString = "from FlagData where flaggedId=:flaggedItemId and type=:type";
			Query query = getSession().createQuery(queryString);
			 query.setLong("flaggedItemId",groupDiscussions.getId());
			 query.setString("type",selectedTableName);
		     List<FlagData> result = query.list();
		     getSession().close();
			 return result;
		 
	}

	
	public List<GroupDiscussions> findAllGroupDiscussions() {
		
		/* String queryString = "from GroupDiscussions gd where gd.flagdelete=false";
			Query query = getSession().createQuery(queryString);
			  List<GroupDiscussions> result = query.list();
			  getSession().close();
			 return result;
			 
		*/
		SessionFactory sessionFactory = getHibernateTemplate().getSessionFactory();
		     Session session = sessionFactory.openSession();
		     Query query = session.createQuery("from GroupDiscussions gd where gd.flagdelete=false");
		      List<GroupDiscussions> result = query.list();
		     session.close();
			 return result;	
			
		}


	public List<GroupDiscussions> findByFlaggedGroupDiscussionsTitle(
			String searchByTitle) {
		
		 String queryString = "from GroupDiscussions gd where gd.discussions like :discussions and gd.flagdelete=false";
			Query query = getSession().createQuery(queryString);
			 query.setString("discussions", "%" + searchByTitle + "%");
		     List<GroupDiscussions> result = query.list();
		     getSession().close();
			 return result;
	}


	public List<FlagData> findCommentsForFlaggedGroupDiscussions(
			GroupDiscussions groupDiscussions, String selectedTableName) {
			
		
		 SessionFactory sessionFactory = getHibernateTemplate().getSessionFactory();
	     Session session = sessionFactory.openSession();
	     Query query = session.createQuery("from FlagData where flaggedId=:flaggedItemId and type=:type");
	     query.setLong("flaggedItemId",groupDiscussions.getId());
	     query.setString("type",selectedTableName);
	     List<FlagData> result = query.list();
	     session.close();
		 return result;	
		
		
	}

	
	public List<Group> findAllGroups() {
		 String queryString = "from Group g where g.flagdelete=false";
			Query query = getSession().createQuery(queryString);
			  List<Group> result = query.list();
			  getSession().close();
			 return result;
	
	}


	public List<Group> findByFlaggedGroups(String searchByName) {
		 String queryString = "from Group g where g.title like :title and g.flagdelete=false";
			Query query = getSession().createQuery(queryString);
			 query.setString("title", "%" + searchByName + "%");
		     List<Group> result = query.list();
		     getSession().close();
			 return result;	}

	public List<FlagData> findCommentsForFlaggedGroups(Group groups,
			String selectedTableName) {
		/* String queryString = "from FlagData where flaggedId=:flaggedItemId and type=:type";
			Query query = getSession().createQuery(queryString);
			query.setLong("flaggedItemId",groups.getId());
		     query.setString("type",selectedTableName);
		     List<FlagData> result = query.list();
		     getSession().close();
			 return result;
			 */
			 SessionFactory sessionFactory = getHibernateTemplate().getSessionFactory();
		     Session session = sessionFactory.openSession();
		     Query query = session.createQuery("from FlagData where flaggedId=:flaggedItemId and type=:type");
		     query.setLong("flaggedItemId",groups.getId());
		     query.setString("type",selectedTableName);
		     List<FlagData> result = query.list();
		     session.close();
			 return result;	
			 
	}


	public Group findByExistingGroups(String selectedFlaggedId) {
		 String queryString ="from Group g where g.id=:selectedFlaggedId";
			Query query = getSession().createQuery(queryString);
			query.setLong("selectedFlaggedId",Long.parseLong(selectedFlaggedId));
			Group group=(Group)query.uniqueResult();  
			  getSession().close();
		 	return group;
	}

	public List<Group> findAllAdminFlaggedGroups(String selectedTableName) {
		
		 String queryString ="from Group g where g.flagged=true and g.flagdelete=false";
			Query query = getSession().createQuery(queryString);
			List<Group> result = query.list();
			  getSession().close();
		 	return result;
		 	}

	public List<Group> findByAdminFlaggedGroupsTitle(String searchByTitle) {
		 String queryString = "from Group g where g.title like :title and g.flagged=true";
			Query query = getSession().createQuery(queryString);
			query.setString("title", "%" + searchByTitle + "%");
		     List<Group> result = query.list();
		     getSession().close();
			 return result;
		
	}

	public List<Topics> findAllTopicReplies() {
		SessionFactory sessionFactory = getHibernateTemplate().getSessionFactory();
	     Session session = sessionFactory.openSession();
	     Query query = session.createQuery("from Topics t where t.flagdelete=false");	     
	     List<Topics> result = query.list();
	     session.close();
		 return result;
	}

	public List<Topics> findByFlaggedTopicReplies(String searchByName) {
		 SessionFactory sessionFactory = getHibernateTemplate().getSessionFactory();
	     Session session = sessionFactory.openSession();
	     Query query = session.createQuery("from Topics t where t.topic like :searchByName");
	     query.setString("searchByName", "%" + searchByName + "%");
	     List<Topics> result = query.list();
	     session.close();
		 return result;	}

	public List<FlagData> findCommentsForFlaggedTopicReplies(GroupDiscussions groupDiscussions,
			String selectedTableName) {
		
		 SessionFactory sessionFactory = getHibernateTemplate().getSessionFactory();
	     Session session = sessionFactory.openSession();
	     Query query = session.createQuery("from FlagData where flaggedId=:flaggedItemId and type=:type");
	     query.setLong("flaggedItemId", groupDiscussions.getId());
	     query.setString("type",selectedTableName);
	     List<FlagData> result = query.list();
	     session.close();
		 return result;	
		 	
	}


	public List<GroupDiscussions> findPostReplies(long topicId) {
		 SessionFactory sessionFactory = getHibernateTemplate().getSessionFactory();
	     Session session = sessionFactory.openSession();
	     Query query = session.createQuery("from GroupDiscussions g where g.topics.id =:topicId  order by  g.createdDate desc");
	     query.setLong("topicId", topicId);
	     List<GroupDiscussions> result = query.list();
	     session.close();
		 return result;	
        }
	public void UpdateUserFlaggedData(User user) {
		getHibernateTemplate().update(user);
	}
			/*String hql = "update User set flagged='1' where id = :id";
			Query query = getSession().createQuery(hql);
			//query.setBoolean("1",user.isFlagged());
			query.setLong("id", user.getId());
			query.executeUpdate();
		*/
   }