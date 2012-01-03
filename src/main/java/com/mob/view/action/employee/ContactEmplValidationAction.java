package com.mob.view.action.employee;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.User;
import com.mob.services.EmployeeAccountService;
import com.opensymphony.xwork2.ActionSupport;

public class ContactEmplValidationAction extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private User user;	
	private EmployeeAccountService employeeAccountService;
    private String nickName;
    private String result;
	    
	public String validateEmplContactNickName(){	
		user =  (User) SecurityContextHolder.getContext()
		.getAuthentication().getPrincipal();
		result = employeeAccountService.findByEmpContactValidation(user.getId(),getNickName());				
		if(result.equals("true")){
		  return "success";
		}else {
			return "failure";
		}
	}	

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getNickName() {
		return nickName;
	}


	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public EmployeeAccountService getEmployeeAccountService() {
		return employeeAccountService;
	}

	public void setEmployeeAccountService(
			EmployeeAccountService employeeAccountService) {
		this.employeeAccountService = employeeAccountService;
	}

	
}
