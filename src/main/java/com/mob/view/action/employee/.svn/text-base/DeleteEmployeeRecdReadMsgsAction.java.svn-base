package com.mob.view.action.employee;

import com.mob.model.Inbox;
import com.mob.model.User;
import com.mob.model.profile.Profile;
import com.mob.services.BaseService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;

public class DeleteEmployeeRecdReadMsgsAction extends ActionSupport {

    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(DeleteEmployeeRecdReadMsgsAction.class);
	private static final long serialVersionUID = 1L;
	private Profile profile;
	private BaseService<Inbox> inboxBoxService;
	private Inbox inBox =new Inbox();
	private User user;
	private String  inBoxid;
	
	public String deleteRecdReadMsgs(){
		int id = Integer.parseInt(inBoxid);
		inBox = inboxBoxService.findByPrimaryKey(inBox, id);
		inboxBoxService.delete(inBox);
		return "success";
	}

	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}


	public BaseService<Inbox> getInboxBoxService() {
		return inboxBoxService;
	}

	public void setInboxBoxService(BaseService<Inbox> inboxBoxService) {
		this.inboxBoxService = inboxBoxService;
	}


	public Inbox getInBox() {
		return inBox;
	}

	public void setInBox(Inbox inBox) {
		this.inBox = inBox;
	}

	public String getInBoxid() {
		return inBoxid;
	}

	public void setInBoxid(String inBoxid) {
		this.inBoxid = inBoxid;
	}


}
