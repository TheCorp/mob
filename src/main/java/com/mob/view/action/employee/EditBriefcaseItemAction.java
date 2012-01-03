package com.mob.view.action.employee;

import java.sql.Date;
import java.util.List;

import com.mob.model.ContactTypes;
import com.mob.model.User;
import com.mob.model.profile.BriefCase;
import com.mob.model.profile.Item;
import com.mob.services.BaseService;
import com.mob.services.BriefCaseService;
import com.mob.services.ItemService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;

public class EditBriefcaseItemAction extends ActionSupport {
	
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(EditBriefcaseItemAction.class);

	private ContactTypes contactType;
	private List contactTypesList;
	private BaseService<ContactTypes> employeeContactTypesService;
	private User user;
	private Item item=new Item();;
	private BriefCase briefcase;
	private BriefCaseService briefCaseService;
	private List<BriefCase> briefcaseList;
	private boolean hasBriefcase;
	
	private long itemId;
	private String name;
	private String itemURL;
	private String privacySetting;
	

	private String locationOfItem;
	private BaseService<BriefCase> briefCaseBaseService;
	private ItemService itemService;
	
	private Item updatedBriefcaseItems;
	private BaseService<Item> itemBaseService;
	
	private Date modifiedDate;

	
	public String updateNewBriefcaseItem(){
		modifiedDate= new Date(System.currentTimeMillis());
		LOGGER.info("Inside updateNewBriefcaseItem");
		item=itemBaseService.findByPrimaryKey(item,item.getId());
		item.setName(name);
		item.setPrivacySetting(privacySetting);
		item.setModifiedDate(modifiedDate);
		//item.setItemURL(itemURL);
		itemService.updateItem(item);
		updatedBriefcaseItems = itemBaseService.findByPrimaryKey(item,item.getId());
		
		return "success";
		
	}
	public String updateNewBriefcaseItemURL(){
		modifiedDate= new Date(System.currentTimeMillis());
		LOGGER.info("Inside updateNewBriefcaseItem");
		item=itemBaseService.findByPrimaryKey(item,item.getId());
		item.setPrivacySetting(privacySetting);
		item.setModifiedDate(modifiedDate);
		if(itemURL.startsWith("www")||itemURL.startsWith("WWW")){
			itemURL="http://"+itemURL;
    	}
		System.out.println("In Update URL" +name);
		//item.setItemURL(itemURL);
		item.setName(name);
		itemService.updateItem(item);
		updatedBriefcaseItems = itemBaseService.findByPrimaryKey(item,item.getId());
		return "success";
		
	}
	

	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		LOGGER.info("user is:"+user.getId());
		this.user = user;
	}
	public boolean isHasBriefcase() {
		return hasBriefcase;
	}
	public void setHasBriefcase(boolean hasBriefcase) {
		this.hasBriefcase = hasBriefcase;
	}

	public ContactTypes getContactType() {
		return contactType;
	}


	public void setContactType(ContactTypes contactType) {
		this.contactType = contactType;
	}


	public List getContactTypesList() {
		return contactTypesList;
	}


	public void setContactTypesList(List contactTypesList) {
		this.contactTypesList = contactTypesList;
	}


	public BaseService<ContactTypes> getEmployeeContactTypesService() {
		return employeeContactTypesService;
	}


	public void setEmployeeContactTypesService(
			BaseService<ContactTypes> employeeContactTypesService) {
		this.employeeContactTypesService = employeeContactTypesService;
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
	public BriefCaseService getBriefCaseService() {
		return briefCaseService;
	}
	public void setBriefCaseService(BriefCaseService briefCaseService) {
		this.briefCaseService = briefCaseService;
	}
	public List<BriefCase> getBriefcaseList() {
		return briefcaseList;
	}
	public void setBriefcaseList(List<BriefCase> briefcaseList) {
		this.briefcaseList = briefcaseList;
	}
	public BaseService<BriefCase> getBriefCaseBaseService() {
		return briefCaseBaseService;
	}
	public void setBriefCaseBaseService(BaseService<BriefCase> briefCaseBaseService) {
		this.briefCaseBaseService = briefCaseBaseService;
	}
	
	/*public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}*/
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLocationOfItem() {
		return locationOfItem;
	}
	public void setLocationOfItem(String locationOfItem) {
		this.locationOfItem = locationOfItem;
	}
	public String getPrivacySetting() {
		return privacySetting;
	}
	public void setPrivacySetting(String privacySetting) {
		this.privacySetting = privacySetting;
	}
	
	public ItemService getItemService() {
		return itemService;
	}
	public void setItemService(ItemService itemService) {
		this.itemService = itemService;
	}
	public long getItemId() {
		return itemId;
	}
	public void setItemId(long itemId) {
		this.itemId = itemId;
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


	public Date getModifiedDate() {
		return modifiedDate;
	}


	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}


	public String getItemURL() {
		return itemURL;
	}


	public void setItemURL(String itemURL) {
		this.itemURL = itemURL;
	}
	
	
	
	
}