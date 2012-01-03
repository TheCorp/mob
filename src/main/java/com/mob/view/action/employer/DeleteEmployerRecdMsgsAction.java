package com.mob.view.action.employer;

import com.mob.model.Inbox;
import com.mob.model.User;
import com.mob.model.profile.Profile;
import com.mob.services.BaseService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;

public class DeleteEmployerRecdMsgsAction extends ActionSupport {

    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(DeleteEmployerRecdMsgsAction.class);
	private static final long serialVersionUID = 1L;
	private Profile profile;
	private BaseService<Inbox> inboxBoxService;
	private Inbox inBox=new Inbox();
	
	private User user;
	private String ids;
	private String[] idarray;
	
	private String recdReadEmprId;

	public String deleteEmprRecdMsgs() {
		LOGGER.info("deleteEmprRecdMsgs idsssssssss:---" + ids);
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
	
	
	public String deleteEmprRecdReadMsgs() {
			LOGGER.info("deleteEmprRecdReadMsgs" );
			int recdid = Integer.parseInt(recdReadEmprId);
			LOGGER.info("id:" + recdid);
			inBox = inboxBoxService.findByPrimaryKey(inBox, recdid);
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


	public String getRecdReadEmprId() {
		return recdReadEmprId;
	}


	public void setRecdReadEmprId(String recdReadEmprId) {
		this.recdReadEmprId = recdReadEmprId;
	}


}
