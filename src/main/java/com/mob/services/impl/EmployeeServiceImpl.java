package com.mob.services.impl;

import com.mob.dao.EmployeeAccountDao;
import com.mob.model.User;
import com.mob.services.EmployeeService;
import com.mob.util.MOBLogger;

public class EmployeeServiceImpl implements EmployeeService {
	
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(EmployeeServiceImpl.class);

	private EmployeeAccountDao empDao;
	
	public User findByEmployeePrimaryKey(User user, long id) {
		// TODO Auto-generated method stub
		LOGGER.info("Inside findByEmployeePrimaryKey");
		LOGGER.info("Employee Dao:"+empDao.toString());
		return empDao.findByEmployeePrimaryKey(user,id);
	}

	public void updateEmployeeAccount(User user) {
		// TODO Auto-generated method stub
		LOGGER.info("Inside updateEmployeeAccount");
		this.empDao.updateEmployeeAccount(user);

	}

	public EmployeeAccountDao getEmpDao() {
		return empDao;
	}

	public void setEmpDao(EmployeeAccountDao empDao) {
		this.empDao = empDao;
	}

	

}
