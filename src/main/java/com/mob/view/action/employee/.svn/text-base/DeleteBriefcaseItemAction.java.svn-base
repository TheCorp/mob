package com.mob.view.action.employee;

import com.mob.model.User;
import com.mob.model.profile.BriefCase;
import com.mob.model.profile.Item;
import com.mob.services.ItemService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;

public class DeleteBriefcaseItemAction extends ActionSupport{
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(DeleteBriefcaseItemAction.class);

	private User user;
	private Item item;
	private BriefCase briefcase;
	private ItemService itemService; 
	

	public String delete() {
		
		LOGGER.info("inside delete");
		itemService.delete(item);		
	    return "success";
	}
	
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Item getItem() {
		return item;
	}
	public void setItem(Item item) {
		this.item = item;
	}
	public BriefCase getBriefcase() {
		return briefcase;
	}
	public void setBriefcase(BriefCase briefcase) {
		this.briefcase = briefcase;
	}
	public ItemService getItemService() {
		return itemService;
	}
	public void setItemService(ItemService itemService) {
		this.itemService = itemService;
	}

	
}
