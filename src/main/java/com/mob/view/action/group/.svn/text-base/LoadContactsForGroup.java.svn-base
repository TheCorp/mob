package com.mob.view.action.group;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.User;
import com.opensymphony.xwork2.ActionSupport;

public class LoadContactsForGroup extends ActionSupport {



	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public String loadGroups() {
		User user = (User)SecurityContextHolder.getContext().
        getAuthentication().getPrincipal();
		System.out.println("loadGroups" );
		return "success";
	}

	

}