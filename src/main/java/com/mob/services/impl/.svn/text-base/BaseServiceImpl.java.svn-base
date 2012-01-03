package com.mob.services.impl;

import java.util.List;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mob.dao.BaseDao;
import com.mob.services.BaseService;

public class BaseServiceImpl<T> implements BaseService<T> {

	private BaseDao<T> baseDao;

	public void setBaseDao(BaseDao<T> baseDao) {
		this.baseDao = baseDao;

	}

	public BaseDao<T> getBaseDao() {
		return baseDao;
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void create(T t) {
		// TODO Auto-generated method stub
		this.baseDao.save(t);
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void delete(T t) {
		// TODO Auto-generated method stub
		this.baseDao.delete(t);
	}

	public List<T> findAll(T t) {
		// TODO Auto-generated method stub
		return this.baseDao.findAll(t);
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void update(T t) {
		// TODO Auto-generated method stub
		this.baseDao.update(t);
	}

	public T findByPrimaryKey(T t, long id) {
		// TODO Auto-generated method stub
		return this.baseDao.findByPrimaryKey(t, id);
	}

	public List<T> findByExample(T t) {
		// TODO Auto-generated method stub
		return this.baseDao.findByExample(t);
	}
}
