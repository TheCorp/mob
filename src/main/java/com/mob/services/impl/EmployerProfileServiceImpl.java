package com.mob.services.impl;

import java.util.List;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mob.dao.EmployerProfileDao;
import com.mob.model.employer.Employer;
import com.mob.model.profile.EmployerProfile;
import com.mob.model.profile.Profile;
import com.mob.services.EmployerProfileService;

public class EmployerProfileServiceImpl implements EmployerProfileService {

	private EmployerProfileDao employerProfileDao;

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public List findUserProfile(long id) {

		return employerProfileDao.findUserProfile(id);
	}

	public EmployerProfileDao getEmployerProfileDao() {
		return employerProfileDao;
	}

	public void setEmployerProfileDao(EmployerProfileDao employerProfileDao) {
		this.employerProfileDao = employerProfileDao;
	}

	public Employer loadEmployerAccInfo(long id) {
		return employerProfileDao.loadEmployerAccInfo(id);
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public List findemplrProfile(long id) {
		return employerProfileDao.findemplrProfile(id);
	}

	public EmployerProfile findEmployerProfile(long id) {
		return employerProfileDao.findEmployerProfile(id);
		
	}
	public Profile findProfileForEmployer(long id) {
		return employerProfileDao.findProfileForEmployer(id);
		
	}

	
}
