package com.mob.view.action.admin;

import java.util.Set;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.Role;
import com.mob.model.User;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport{
	
	@Override
	public String execute() throws Exception {
		try {
			
			System.out.println("execute method");
			User user = (User) SecurityContextHolder.getContext()
			.getAuthentication().getPrincipal();
			System.out.println("user:----"+user);
			Set<Role> role=user.getRoles();
			for(Role roles : role){
				
				System.out.println(roles.getId());
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	
		
		return "success";
	}
	
}
