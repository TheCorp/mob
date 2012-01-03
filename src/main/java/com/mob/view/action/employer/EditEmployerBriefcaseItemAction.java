package com.mob.view.action.employer;



import java.sql.Date;

import com.mob.model.profile.Item;
import com.mob.services.BaseService;
import com.mob.services.ItemService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;

public class EditEmployerBriefcaseItemAction extends ActionSupport{
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(EditEmployerBriefcaseItemAction.class);

	private ItemService itemService;
	private Item item;
	private long itemId;
	private String name;
	private String privacySetting;
	private String category;
	private String itemURL;
	private Date modifiedDate;
	private Item updatedBriefcaseItems;
	private BaseService<Item> itemBaseService;


	public String updateEmployerNewBriefcaseItem(){
		LOGGER.info("updateEmployerNewBriefcaseItem");
		modifiedDate= new Date(System.currentTimeMillis());
		
		item=itemBaseService.findByPrimaryKey(item,item.getId());
		item.setName(name);
		item.setPrivacySetting(privacySetting);
		item.setModifiedDate(modifiedDate);
		itemService.updateItem(item);
		updatedBriefcaseItems = itemBaseService.findByPrimaryKey(item,item.getId());
		return "success";
		
	}

	public String updateEmployerBriefcaseURLItem(){
		LOGGER.info("updateEmployerBriefcaseURLItem");
		modifiedDate= new Date(System.currentTimeMillis());
		
		item=itemBaseService.findByPrimaryKey(item,item.getId());
		if(itemURL.startsWith("www")||itemURL.startsWith("WWW")){
			itemURL="http://"+itemURL;
    	}
		item.setName(name);
		//item.setItemURL(itemURL);
		item.setPrivacySetting(privacySetting);
		item.setModifiedDate(modifiedDate);
		itemService.updateItem(item);
		updatedBriefcaseItems = itemBaseService.findByPrimaryKey(item,item.getId());
		return "success";
		
	}
	
	public ItemService getItemService() {
		return itemService;
	}


	public void setItemService(ItemService itemService) {
		this.itemService = itemService;
	}


	public Item getItem() {
		return item;
	}


	public void setItem(Item item) {
		this.item = item;
	}


	public long getItemId() {
		return itemId;
	}


	public void setItemId(long itemId) {
		this.itemId = itemId;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getPrivacySetting() {
		return privacySetting;
	}


	public void setPrivacySetting(String privacySetting) {
		this.privacySetting = privacySetting;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}
	
	public Date getModifiedDate() {
		return modifiedDate;
	}


	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}


	public Item getUpdatedBriefcaseItems() {
		return updatedBriefcaseItems;
	}


	public void setUpdatedBriefcaseItems(Item updatedBriefcaseItems) {
		this.updatedBriefcaseItems = updatedBriefcaseItems;
	}


	public BaseService<Item> getItemBaseService() {
		return itemBaseService;
	}


	public void setItemBaseService(BaseService<Item> itemBaseService) {
		this.itemBaseService = itemBaseService;
	}

	public String getItemURL() {
		return itemURL;
	}

	public void setItemURL(String itemURL) {
		this.itemURL = itemURL;
	}


}
