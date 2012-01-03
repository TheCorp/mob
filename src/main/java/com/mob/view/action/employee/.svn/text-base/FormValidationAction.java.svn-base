package com.mob.view.action.employee;

import java.util.Iterator;
import java.util.List;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.User;
import com.mob.services.EmployeeAccountService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;

public class FormValidationAction extends ActionSupport{
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(FormValidationAction.class);

	
	private User user;	
	private EmployeeAccountService employeeAccountService;
    private String email;
    private String result;
    
    private List<User> users;

	    
	public String validateEmail(){
		LOGGER.info("Inside validateEmail" );

		result = employeeAccountService.findByEmailValidation(user,getEmail());				
		if(result.equals("true")){
		  return "success";
		}else {
			return "failure";
		}
	}	
	
	public String validateEmailForEdit(){
		LOGGER.info("Inside validateEmailForEdit" );
		User user=(User)SecurityContextHolder.getContext().
		 getAuthentication().getPrincipal();
		
		String result="success";
		users = employeeAccountService.findByEmailValidationForEdit(getEmail());
		
		Iterator it=users.iterator();
		
		while(it.hasNext()){
			User emailOwner=(User)it.next();
			
			if(user.getId()==emailOwner.getId()){
				result="success";
			}
			else{
				result="failure";
			}
		}
		return result;
		
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
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

	public EmployeeAccountService getEmployeeAccountService() {
		return employeeAccountService;
	}

	public void setEmployeeAccountService(
			EmployeeAccountService employeeAccountService) {
		this.employeeAccountService = employeeAccountService;
	}

}
