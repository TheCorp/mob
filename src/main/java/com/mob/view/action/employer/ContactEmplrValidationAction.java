package com.mob.view.action.employer;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.employer.Employer;
import com.mob.services.EmployerAccountService;
import com.opensymphony.xwork2.ActionSupport;

public class ContactEmplrValidationAction extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Employer user;	
	private EmployerAccountService employerAccountService;
    private String email;
    private String nickName;
    private String result;

	    
	public String validateEmprContactNickName(){	
		user = (Employer) SecurityContextHolder.getContext()
		.getAuthentication().getPrincipal();
		result = employerAccountService.findByEmprContactValidation(user.getId(),getNickName());				
		if(result.equals("true")){
		  return "success";
		}else {
			return "failure";
		}
	}	

	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}


	public Employer getUser() {
		return user;
	}


	public void setUser(Employer user) {
		this.user = user;
	}


	public EmployerAccountService getEmployerAccountService() {
		return employerAccountService;
	}


	public void setEmployerAccountService(
			EmployerAccountService employerAccountService) {
		this.employerAccountService = employerAccountService;
	}


	public String getNickName() {
		return nickName;
	}


	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	
}
