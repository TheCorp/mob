package com.mob.view.action.employer;

import com.mob.model.profile.Item;
import com.mob.services.ItemService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;

public class DeleteEmployerBriefcaseItemAction extends ActionSupport{
	
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(DeleteEmployerBriefcaseItemAction.class);

	private Item item;
	private ItemService itemService; 
	


	public String delete() {
		
		LOGGER.info("inside delete briefcase items");
		itemService.delete(item);		
	    return "success";
	}

	public Item getItem() {
		return item;
	}
	
	public void setItem(Item item) {
		this.item = item;
	}
	
	public ItemService getItemService() {
		return itemService;
	}
	
	public void setItemService(ItemService itemService) {
		this.itemService = itemService;
	}
}
