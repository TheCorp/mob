package com.mob.view.action.employee;

import com.mob.model.Inbox;
import com.mob.model.User;
import com.mob.model.profile.Profile;
import com.mob.services.BaseService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;

public class DeleteEmployeeRecdMsgsAction extends ActionSupport {

     /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(DeleteEmployeeRecdMsgsAction.class);

	private static final long serialVersionUID = 1L;
	private Profile profile;
	private BaseService<Inbox> inboxBoxService;
	private Inbox inBox=new Inbox();
	private Inbox inBox1;
	
	private User user;
	private String ids;
	private String[] idarray;

	public String deleteReceivedMsgs() {
		LOGGER.info("Inside deleteReceivedMsgs idsssssssss:---" + ids);
		idarray = ids.split(",");
		for (int i = 0; i < idarray.length; i++) {
			LOGGER.info("string id:" + idarray[i]);
			int id = Integer.parseInt(idarray[i]);
			LOGGER.info("id:" + id);
			inBox = inboxBoxService.findByPrimaryKey(inBox, id);
			inboxBoxService.delete(inBox);
		}
		return "success";
	}
	
	public String deleteRecdReadMsgs() {
		inBox1 = new Inbox();
		LOGGER.info("Delete Received Read Msgs :---" +inBox.getId());
		inBox1 = inboxBoxService.findByPrimaryKey(inBox1, inBox.getId());
		inboxBoxService.delete(inBox1);
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

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public Inbox getInBox() {
		return inBox;
	}

	public void setInBox(Inbox inBox) {
		this.inBox = inBox;
	}

	public Inbox getInBox1() {
		return inBox1;
	}

	public void setInBox1(Inbox inBox1) {
		this.inBox1 = inBox1;
	}


}
