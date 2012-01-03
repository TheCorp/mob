package com.mob.view.action.employee;

import com.mob.model.Inbox;
import com.mob.model.SentBox;
import com.mob.model.User;
import com.mob.model.profile.Profile;
import com.mob.services.BaseService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;

public class DeleteSentMessageAction extends ActionSupport {

	/**
	 * Logger for logging messages.
	 */
	private static final MOBLogger LOGGER = new MOBLogger(
			DeleteSentMessageAction.class);
	private static final long serialVersionUID = 1L;
	private Profile profile;
	private BaseService<SentBox> sentBoxService;
	private BaseService<Inbox> inboxBoxService;
	private SentBox sentBox = new SentBox();
	private Inbox inBox = new Inbox();
	private User user;
	private String ids;
	private String[] idarray;

	private String inBoxid;
	private String sentboxId;

	public String delete() {
		LOGGER.info("idsssssssss:---" + ids);
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

	public String deleteRecdReadMsgs() {
		int sentId = Integer.parseInt(inBoxid);
		inBox = inboxBoxService.findByPrimaryKey(inBox, sentId);
		inboxBoxService.delete(inBox);
		return "success";
	}

	public String deleteSentReadMsgs() {
		int sentId = Integer.parseInt(sentboxId);
		sentBox = sentBoxService.findByPrimaryKey(sentBox, sentId);
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

	public String getInBoxid() {
		return inBoxid;
	}

	public void setInBoxid(String inBoxid) {
		this.inBoxid = inBoxid;
	}

	public Inbox getInBox() {
		return inBox;
	}

	public void setInBox(Inbox inBox) {
		this.inBox = inBox;
	}

	public BaseService<Inbox> getInboxBoxService() {
		return inboxBoxService;
	}

	public void setInboxBoxService(BaseService<Inbox> inboxBoxService) {
		this.inboxBoxService = inboxBoxService;
	}

	public String getSentboxId() {
		return sentboxId;
	}

	public void setSentboxId(String sentboxId) {
		this.sentboxId = sentboxId;
	}

}
