package com.mob.dao.hibernate;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.mob.dao.ItemDao;
import com.mob.model.FlagData;
import com.mob.model.profile.BriefCase;
import com.mob.model.profile.Item;
import com.mob.model.profile.Profile;
import com.mob.util.MOBLogger;

public class HibernateItemDao extends HibernateDaoSupport implements ItemDao {
	
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(HibernateItemDao.class);

	private HibernateBriefCaseDao briefCaseDao;
	private  Date createdDate;

	public void addItem(Item item, Profile user) {
		 LOGGER.info("Entering Method :addItem" );
		 createdDate= new Date(0);
		 BriefCase briefCase=null;
		 List briefcaseList=new ArrayList();
		 LOGGER.info("user id hib :"+user.getId());
		 briefcaseList=briefCaseDao.findBriefCase(user.getId());
		if(briefcaseList.size()== 0){
			briefCase=new BriefCase();
			briefCase.setBriefCaseOwner(user);
			briefCase.setCreated(createdDate);
			getHibernateTemplate().save(briefCase);
			item.getBriefCase().add(briefCase);
			getHibernateTemplate().save(item);
			
			}else{
				Iterator it=briefcaseList.iterator();
				while(it.hasNext()){
					briefCase=(BriefCase)it.next();
					item.getBriefCase().add(briefCase);
					getHibernateTemplate().save(item);
				}
				
			}
		   LOGGER.info("Leaving Method :addItem" );
		
	}

	public List findItems(long id) {
		// TODO Auto-generated method stub+
		LOGGER.info("Entering Method :findItems" );
		LOGGER.info("id"+id);
		String queryString = "select item from Item as item join item.briefCase as b where b.briefCaseOwner.id=:id and item.flagdelete=false";
		return getHibernateTemplate().findByNamedParam(queryString, "id", id);
	}
	
	 public List findItemsForViewProfileSearch(long id,String contactType) {
		/* LOGGER.info("Entering Method :findItems" );
			LOGGER.info("id"+id);
			String queryString = "select item from Item  as item join item.briefCase as b where b.briefCaseOwner.id=:id and item.friendname=contactType and item.flagdelete=false";
			return getHibernateTemplate().findByNamedParam(queryString, "id", id);
			*/
			
			 SessionFactory sessionFactory = getHibernateTemplate().getSessionFactory();
		     Session session = sessionFactory.openSession();
		     Query query = session.createQuery("select item from Item  as item join item.briefCase as b where b.briefCaseOwner.id=:id and item.privacySetting=:contactType");
		     query.setLong("id",id);
		     query.setString("contactType",contactType);
		     List result = query.list();
		     session.close();
			 return result;
			 
			 
			
	 }
	 
	public HibernateBriefCaseDao getBriefCaseDao() {
		return briefCaseDao;
	}

	public void setBriefCaseDao(HibernateBriefCaseDao briefCaseDao) {
		this.briefCaseDao = briefCaseDao;
	}

	public void updateItem(Item t) {
		LOGGER.info("inside hibernate item update");
	
	 getHibernateTemplate().update(t);
	
	}

	public Item findByPrimaryKey(Item item,long id) {
		return (Item) getHibernateTemplate().get(item.getClass(),id);
		
	}

	public void delete(Item item) {
		// TODO Auto-generated method stub
		getHibernateTemplate().delete(item);
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
}
