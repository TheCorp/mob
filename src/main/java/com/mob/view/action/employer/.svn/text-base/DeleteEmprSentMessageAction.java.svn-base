package com.mob.view.action.employer;

import com.mob.model.SentBox;
import com.mob.model.User;
import com.mob.model.profile.Profile;
import com.mob.services.BaseService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;

public class DeleteEmprSentMessageAction extends ActionSupport {

    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(DeleteEmprSentMessageAction.class);
	private static final long serialVersionUID = 1L;
	private Profile profile;
	private BaseService<SentBox> sentBoxService;
	private SentBox sentBox=new SentBox();
	private User user;
	private String ids;
	private String[] idarray;
    private String setboxRecdId;
	public String deleteEmprMsgs() {
		LOGGER.info("deleteEmprRecdReadMsgs:---" + ids);
		idarray = ids.split(",");
		for (int i = 0; i < idarray.length; i++) {
			LOGGER.info("string id:" + idarray[i]);
			int id = Integer.parseInt(idarray[i]);
			LOGGER.info("id:" + id);
			sentBox = sentBoxService.findByPrimaryKey(sentBox, id);
			sentBoxService.delete(sentBox);
		}
		return "success";
	}
	public String deleteEmprReadSentMsgs() {
		    LOGGER.info("deleteEmprReadSentMsgs");
			LOGGER.info("string id:" + setboxRecdId);
			int sendRecdid = Integer.parseInt(setboxRecdId);
			LOGGER.info("id:" + sendRecdid);
			sentBox = sentBoxService.findByPrimaryKey(sentBox, sendRecdid);
			sentBoxService.delete(sentBox);
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

	public BaseService<SentBox> getSentBoxService() {
		return sentBoxService;
	}

	public void setSentBoxService(BaseService<SentBox> sentBoxService) {
		this.sentBoxService = sentBoxService;
	}

	public SentBox getSentBox() {
		return sentBox;
	}

	public void setSentBox(SentBox sentBox) {
		this.sentBox = sentBox;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}
	public String getSetboxRecdId() {
		return setboxRecdId;
	}
	public void setSetboxRecdId(String setboxRecdId) {
		this.setboxRecdId = setboxRecdId;
	}


}
