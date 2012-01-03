package com.mob.view.action.employer;

import com.mob.model.Inbox;
import com.mob.model.User;
import com.mob.model.profile.Profile;
import com.mob.services.BaseService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;

public class MarkAsUnreadEmprMsgsAction extends ActionSupport {

    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(MarkAsUnreadEmprMsgsAction.class);
	private static final long serialVersionUID = 1L;
	private Profile profile;
	private BaseService<Inbox> inboxBoxService;
	private Inbox inBox =new Inbox();
	private User user;
	private String ids;
	private String[] idarray;
	
	public String markAsUnReadEmprMsgs(){
		LOGGER.info("inside markAsUnReadEmprMsgs");
		LOGGER.info("Mark As unreadmsgs  idsssssssss:---" + ids);
		idarray = ids.split(",");
		for (int i = 0; i < idarray.length; i++) {
			LOGGER.info("string id:" + idarray[i]);
			int id = Integer.parseInt(idarray[i]);
			LOGGER.info("id:" + id);
			inBox = inboxBoxService.findByPrimaryKey(inBox, id);
			inBox.setReadUnreadMsgId(false);
			inboxBoxService.update(inBox);
		}
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

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public String[] getIdarray() {
		return idarray;
	}

	public void setIdarray(String[] idarray) {
		this.idarray = idarray;
	}



}
