package com.mob.dao.hibernate;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.mob.dao.BaseDao;

public class BaseHibernateDao<T> extends HibernateDaoSupport implements	BaseDao<T> {

	public void delete(T t) {		
		getHibernateTemplate().delete(t);
	}
	public List<T> findByExample(T t) {	
		return getHibernateTemplate().findByExample(t);
	}
	
	public List<T> findAll(T t) {	
		
		DetachedCriteria criteria = 
			DetachedCriteria.forClass(t.getClass());
		return getHibernateTemplate().findByCriteria(criteria);
	}
	public void save(T t) {		
		getHibernateTemplate().save(t);
	}
	public void update(T t) {		
		getHibernateTemplate().update(t);
	}

	public T findByPrimaryKey(T t, long id) {		
		return (T) getHibernateTemplate().get(t.getClass(), id);
	}	
}
