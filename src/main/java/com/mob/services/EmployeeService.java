package com.mob.services;

import com.mob.model.User;

public interface EmployeeService {
	
	public void updateEmployeeAccount(User user);
	
	public User findByEmployeePrimaryKey(User user,long id );
	
	
	
	

}
