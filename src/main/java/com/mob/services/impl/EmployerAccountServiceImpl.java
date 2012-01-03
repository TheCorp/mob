package com.mob.services.impl;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mob.dao.EmployerAccountDao;
import com.mob.model.User;
import com.mob.model.employer.Employer;
import com.mob.services.EmployerAccountService;

public class EmployerAccountServiceImpl implements EmployerAccountService {

	private EmployerAccountDao employerAccountDao;
	
	@Transactional (propagation=Propagation.REQUIRED,readOnly=false)
	public User findByUserName(User t, String email) {
		
		return  employerAccountDao.findByUserName(t,email);
	}

	public EmployerAccountDao getEmployerAccountDao() {
		return employerAccountDao;
	}

	public void setEmployerAccountDao(EmployerAccountDao employerAccountDao) {
		this.employerAccountDao = employerAccountDao;
	}

	public String findByEmprEmailValidation(Employer t, String email) {
		// TODO Auto-generated method stub
		return  employerAccountDao.findByEmprEmailValidation(t, email);
	}

	public String findByEmprContactValidation(long id, String nickName) {
		// TODO Auto-generated method stub
		return  employerAccountDao.findByEmprContactValidation(id, nickName);
	}

}
