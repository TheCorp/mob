package com.mob.dao;

import com.mob.model.User;
import com.mob.model.employer.Employer;

public interface EmployerAccountDao {
	
	public void updateEmployerAccount(Employer employer);
	public Employer findByEmployerPrimaryKey(Employer employer, long id);
	public void updateEmployerPassword(Employer employer, String newPassword);
	public User findByUserName(User t, String email);
	public String findByEmprEmailValidation(Employer t, String email);
	 public String findByEmprContactValidation(long id, String nickName);
}
