package com.mob.view.action.employee;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.User;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

public class LoadEmployeeAccountAction extends ActionSupport implements Preparable {
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(LoadEmployeeAccountAction.class);

	private User user;
	
	private String selectedRadiaoButton;
 

	public String loadAccount() {
		    LOGGER.info("Inside loadAccount" );
			user = (User) SecurityContextHolder.getContext()
					.getAuthentication().getPrincipal();
			LOGGER.info("user name:"+user.getFirstName());
			
			selectedRadiaoButton=user.getSex();
			
		return "success";
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		
	}

	public String getSelectedRadiaoButton() {
		return selectedRadiaoButton;
	}

	public void setSelectedRadiaoButton(String selectedRadiaoButton) {
		this.selectedRadiaoButton = selectedRadiaoButton;
	}

	

}
