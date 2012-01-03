package com.mob.view.action.search;

import java.util.Iterator;
import java.util.List;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.User;
import com.mob.services.ContactEmployeeService;
import com.mob.services.EmployeeAccountService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;

public class ContactValidationAction extends ActionSupport {
	/**
	 * Logger for logging messages.
	 */
	private static final MOBLogger LOGGER = new MOBLogger(
			ContactValidationAction.class);

	private ContactEmployeeService conatctService;
	private String result;
	private long contactOwnerId;
	private long associatedProfileId;

	public String validateContact() {
		result = conatctService.findContact(associatedProfileId, contactOwnerId);
		if (result.equals("true")) {
			return "success";
		} else {
			return "failure";
		}

	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public ContactEmployeeService getConatctService() {
		return conatctService;
	}

	public void setConatctService(ContactEmployeeService conatctService) {
		this.conatctService = conatctService;
	}

	public long getContactOwnerId() {
		return contactOwnerId;
	}

	public void setContactOwnerId(long contactOwnerId) {
		this.contactOwnerId = contactOwnerId;
	}

	public long getAssociatedProfileId() {
		return associatedProfileId;
	}

	public void setAssociatedProfileId(long associatedProfileId) {
		this.associatedProfileId = associatedProfileId;
	}

}
