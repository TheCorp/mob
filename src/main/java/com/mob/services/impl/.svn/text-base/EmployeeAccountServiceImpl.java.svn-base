package com.mob.services.impl;

import java.util.List;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mob.dao.EmployeeAccountDao;
import com.mob.model.User;
import com.mob.services.EmployeeAccountService;

public class EmployeeAccountServiceImpl implements EmployeeAccountService {
	
	private EmployeeAccountDao employeeAccountDao;
    
	
	@Transactional (propagation=Propagation.REQUIRED,
			readOnly=false)
	public String findByEmailValidation(User t, String email) {
		
		return  employeeAccountDao.findByEmailValidation(t,email);
	}

	public EmployeeAccountDao getEmployeeAccountDao() {
		return employeeAccountDao;
	}

	public void setEmployeeAccountDao(EmployeeAccountDao employeeAccountDao) {
		this.employeeAccountDao = employeeAccountDao;
	}

	public List<User> findByEmailValidationForEdit(String email) {
		
		
		return employeeAccountDao.findByEmailValidationForEdit(email);
	}

	public String findByEmpContactValidation(long id, String nickName) {
		// TODO Auto-generated method stub
		return  employeeAccountDao.findByEmpContactValidation(id, nickName);
	}

}
