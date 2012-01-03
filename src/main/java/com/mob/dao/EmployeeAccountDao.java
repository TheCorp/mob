package com.mob.dao;

import java.util.List;

import com.mob.model.User;

public interface EmployeeAccountDao {
	
	public void updateEmployeeAccount(User user);

	public User findByEmployeePrimaryKey(User user, long id);

	public String findByEmailValidation(User t, String email);
	
	public List<User> findByEmailValidationForEdit(String email);
	
	public String findByEmpContactValidation(long id, String nickName);
}
