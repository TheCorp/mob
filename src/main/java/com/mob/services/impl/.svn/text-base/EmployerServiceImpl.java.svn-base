package com.mob.services.impl;

import com.mob.dao.EmployerAccountDao;
import com.mob.model.employer.Employer;
import com.mob.services.EmployerService;
import com.mob.util.MOBLogger;

public class EmployerServiceImpl implements EmployerService {

    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(EmployerServiceImpl.class);

	private EmployerAccountDao empDao;
	
	public void updateEmployerAccount(Employer employer) {
		// TODO Auto-generated method stub
		LOGGER.info("Inside updateEmployerAccount");
		this.empDao.updateEmployerAccount(employer);
	}
	
	public Employer findByEmployerPrimaryKey(Employer employer, long id) {
		// TODO Auto-generated method stub
		LOGGER.info("Inside findByEmployerPrimaryKey");
		LOGGER.info("Employer Dao:"+empDao.toString());
		return empDao.findByEmployerPrimaryKey(employer,id);
		
	}

	public EmployerAccountDao getEmpDao() {
		return empDao;
	}

	public void setEmpDao(EmployerAccountDao empDao) {
		this.empDao = empDao;
	}

	public void updateEmployerPassword(Employer employer, String newPassword) {
		this.empDao.updateEmployerPassword(employer, newPassword);
		
	}

}
