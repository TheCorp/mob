package com.mob.services;

import java.util.List;

import com.mob.model.User;

public interface EmployeeAccountService {
	
	public String findByEmailValidation(User t, String email);
	public List<User> findByEmailValidationForEdit(String email);
	public String findByEmpContactValidation(long id, String nickName);

}
