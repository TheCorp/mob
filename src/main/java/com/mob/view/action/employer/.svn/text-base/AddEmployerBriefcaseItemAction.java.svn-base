package com.mob.view.action.employer;

import java.io.File;
import java.sql.Date;
import java.util.List;

import com.mob.model.ContactTypes;
import com.mob.model.profile.Item;
import com.mob.model.profile.Profile;
import com.mob.services.BaseService;
import com.mob.services.ItemService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;

public class AddEmployerBriefcaseItemAction extends ActionSupport {

    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
            new MOBLogger(AddEmployerBriefcaseItemAction.class);

    private static final long serialVersionUID = 1L;
    private ContactTypes contactType;
    private List contactTypesList;
    private BaseService<ContactTypes> employeeContactTypesService;
    private BaseService<Profile> profileBaseService;

    //private Employer user;
    private Profile profile;
    private Item item;
    private ItemService itemService;

    private String name;
    private String privacySetting;
    private String category;
    private File itemFile;
    private String itemFileContentType;
    private Date itemCreatedModDate;
    private String audioVideoUrl;
    private String videoUrl;
    private String Url;

    public String createEmployerBriefcaseItem() {
        itemCreatedModDate = new Date(System.currentTimeMillis());
        LOGGER.info("create employer briefcase item");
        /*user = (Employer) SecurityContextHolder.getContext()
                .getAuthentication().getPrincipal();
        LOGGER.info("employer id in briefcase action" + user.getId());*/
        profile = profileBaseService.findByPrimaryKey(profile, profile.getId());
        item = new Item();
        item.setName(name);
        item.setPrivacySetting(privacySetting);
        item.setCategory(category);
        item.setItemFile(itemFile);
        item.setItemFileName(this.itemFileName);
        item.setCreatedDate(itemCreatedModDate);
        item.setModifiedDate(itemCreatedModDate);
        itemService.addItem(item, profile, itemFileContentType);
        return "success";
    }

    public String createEmployerBriefcaseURLItem() {
        itemCreatedModDate = new Date(System.currentTimeMillis());
        LOGGER.info("create employer briefcase item");
        profile = profileBaseService.findByPrimaryKey(profile, profile.getId());
        item = new Item();
        if(Url.startsWith("www")||Url.startsWith("WWW")){
    		Url="http://"+Url;
    	}
        item.setItemURL(Url);
        item.setName(name);
        item.setPrivacySetting(privacySetting);
        item.setCreatedDate(itemCreatedModDate);
        item.setModifiedDate(itemCreatedModDate);
        itemService.addEmployerItemURL(item, profile, Url);
        return "success";
    }

    public String createNewAudioVideoItem() {

        LOGGER.info("createNewAudioVideoItem");
        itemCreatedModDate = new Date(System.currentTimeMillis());
        /*User user = (User) SecurityContextHolder.getContext()
                .getAuthentication().getPrincipal();*/

        item = new Item();
        profile = profileBaseService.findByPrimaryKey(profile, profile.getId());
        LOGGER.info("item name:" + name);
        item.setName(name);
        item.setPrivacySetting(privacySetting);
        item.setCategory(category);

        item.setCreatedDate(itemCreatedModDate);
        item.setModifiedDate(itemCreatedModDate);

        if (videoUrl != null && !videoUrl.matches("")) {
            if (videoUrl.indexOf("&feature") > 0) {
                LOGGER.info("Saving Video");
                item.setVideourl(videoUrl);//save the url if it does'nt contain "feature"
                LOGGER.info("videoUrl" + videoUrl);
            } else {
                videoUrl = videoUrl.concat("&feature=channel");//append the string
                item.setVideourl(videoUrl);
            }
        }
        if (itemFile != null) {
            LOGGER.info("itemFileContentType" + itemFileContentType);
            item.setItemFile(itemFile);
            item.setItemFileName(this.itemFileName);
        }

        itemService.addAudioVideoItem(item, profile, itemFileContentType, videoUrl);

        return "success";

    }

    private String itemFileName;

    public void setItemFileFileName(String itemFileName) {
        this.itemFileName = itemFileName;
    }

    public File getItemFile() {
        return itemFile;
    }


    public void setItemFile(File itemFile) {
        this.itemFile = itemFile;
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


    public Date getItemCreatedModDate() {
        return itemCreatedModDate;
    }


    public void setItemCreatedModDate(Date itemCreatedModDate) {
        this.itemCreatedModDate = itemCreatedModDate;
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


    public String getItemFileContentType() {
        return itemFileContentType;
    }


    public void setItemFileContentType(String itemFileContentType) {
        this.itemFileContentType = itemFileContentType;
    }


    public String getAudioVideoUrl() {
        return audioVideoUrl;
    }


    public void setAudioVideoUrl(String audioVideoUrl) {
        this.audioVideoUrl = audioVideoUrl;
    }


    public static long getSerialVersionUID() {
        return serialVersionUID;
    }


    public String getVideoUrl() {
        return videoUrl;
    }


    public void setVideoUrl(String videoUrl) {
        this.videoUrl = videoUrl;
    }


    public BaseService<Profile> getProfileBaseService() {
        return profileBaseService;
    }


    public void setProfileBaseService(BaseService<Profile> profileBaseService) {
        this.profileBaseService = profileBaseService;
    }


    public Profile getProfile() {
        return profile;
    }


    public void setProfile(Profile profile) {
        this.profile = profile;
    }


    public String getItemFileName() {
        return itemFileName;
    }


    public void setItemFileName(String itemFileName) {
        this.itemFileName = itemFileName;
    }

	public String getUrl() {
		return Url;
	}

	public void setUrl(String url) {
		Url = url;
	}


}
