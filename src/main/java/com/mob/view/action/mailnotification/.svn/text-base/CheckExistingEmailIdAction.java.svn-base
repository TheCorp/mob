package com.mob.view.action.mailnotification;

import com.mob.model.User;
import com.mob.services.EmployeeAccountService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;

public class CheckExistingEmailIdAction extends ActionSupport{
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(CheckExistingEmailIdAction.class);

	private static final long serialVersionUID = 1L;
	private User user=new User();
	private EmployeeAccountService employeeAccountService;
	private String email;
	
	
	public String checkEmailId(){
		LOGGER.info("Inside checkEmailId");
		String result=null;
		LOGGER.info("email:"+email);
		String emailResult=employeeAccountService.findByEmailValidation(user, email);
		
		if(emailResult.equals("true"))
			result="failure";
		else
			result="success";
		
		LOGGER.info("result:"+result);
		
		return result;
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


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

}
