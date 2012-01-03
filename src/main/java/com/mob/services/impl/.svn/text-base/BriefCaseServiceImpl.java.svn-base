package com.mob.services.impl;

import java.util.List;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mob.dao.BaseDao;
import com.mob.dao.BriefCaseDao;
import com.mob.model.profile.BriefCase;
import com.mob.services.BriefCaseService;
 

public class BriefCaseServiceImpl implements BriefCaseService
{
	private BriefCaseDao bcDao;
	
	private BaseDao<BriefCase> briefCaseBaseDao;
	
	public List<BriefCase> findBriefCase(long id) {
		// TODO Auto-generated method stub
		return this.bcDao.findBriefCase(id);
	}

	public BriefCaseDao getBcDao() {
		return bcDao;
	}

	public void setBcDao(BriefCaseDao bcDao) {
		this.bcDao = bcDao;
	}
 
	@Transactional (propagation=Propagation.REQUIRED,readOnly=false)
	public BriefCase findBriefcaseForProfile(long profileId) {
		
		long count=0;
		BriefCase  existingBriefCase = new BriefCase();
		
		
		existingBriefCase = bcDao.findBriefcaseForProfile(profileId);		
		
		
	
		
		count = existingBriefCase.getBriefcaseViewCount();
		count =count+1;		
		existingBriefCase.setBriefcaseViewCount(count);
		briefCaseBaseDao.update(existingBriefCase);
		
		return this.briefCaseBaseDao.findByPrimaryKey(existingBriefCase,existingBriefCase.getId());
	}
	
	@Transactional (propagation=Propagation.REQUIRED,readOnly=false)
	public BriefCase updateBriefcaseViewCount(long briefcaseProfileId) {
		// TODO Auto-generated method stub
		return bcDao.updateBriefcaseViewCount(briefcaseProfileId);
	}
	
	public BaseDao<BriefCase> getBriefCaseBaseDao() {
		return briefCaseBaseDao;
	}

	public void setBriefCaseBaseDao(BaseDao<BriefCase> briefCaseBaseDao) {
		this.briefCaseBaseDao = briefCaseBaseDao;
	}

	public BriefCase findBriefcaseViewCountForProfile(long profileId) {
		// TODO Auto-generated method stub
		return bcDao.findBriefcaseForProfile(profileId);
	}
	
	
}
