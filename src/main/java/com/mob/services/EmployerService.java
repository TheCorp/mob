package com.mob.services;

import com.mob.model.employer.Employer;

public interface EmployerService {
	
	public void updateEmployerAccount(Employer employer);
	//public T findByPrimaryKey(T t,long id);
	public Employer findByEmployerPrimaryKey(Employer employer,long id );
	
	public void updateEmployerPassword(Employer employer,String newPassword);
	
}
