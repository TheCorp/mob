package com.mob.view.action.employee;

import java.io.File;
import java.sql.Date;
import java.util.List;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.ContactTypes;
import com.mob.model.User;
import com.mob.model.profile.BriefCase;
import com.mob.model.profile.Item;
import com.mob.model.profile.Profile;
import com.mob.services.BaseService;
import com.mob.services.BriefCaseService;
import com.mob.services.ItemService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

public class AddBriefcaseItemAction extends ActionSupport implements Preparable {

    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(AddBriefcaseItemAction.class);

	private static final long serialVersionUID = 1L;
    private ContactTypes contactType;
    private List contactTypesList;
    private BaseService<ContactTypes> employeeContactTypesService;
   // private User user;
    private Profile profile=new Profile();
    private Item item;
    private BriefCase briefcase;
    private BriefCaseService briefCaseService;
    private List<BriefCase> briefcaseList;
    private String name;
    private String privacySetting;
    private String category;
    private File itemFile;
    private String itemFileContentType;
    private String videoUrl;
    private String Url;


    private Date itemCreatedModDate;
    private BaseService<BriefCase> briefCaseBaseService;
    private BaseService<Profile> profileBaseService;

    private ItemService itemService;

    public String createNewBriefcaseItem() 
    {   
    	LOGGER.info("Inside createNewBriefcaseItem");
        itemCreatedModDate = new Date(System.currentTimeMillis());
       /* User user = (User) SecurityContextHolder.getContext()
                .getAuthentication().getPrincipal();*/
        profile=profileBaseService.findByPrimaryKey(profile,profile.getId());
        System.out.println("profile id:"+profile.getId());
        //LOGGER.info("user id" + user.getId());

        item = new Item();
        LOGGER.info("item name:" + name);
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


    public String createNewAudioVideoItem() {

    	LOGGER.info("Inside createNewAudioVideoItem");
        itemCreatedModDate = new Date(System.currentTimeMillis());
       /* User user = (User) SecurityContextHolder.getContext()
                .getAuthentication().getPrincipal();*/

        profile=profileBaseService.findByPrimaryKey(profile,profile.getId());
        item = new Item();
        LOGGER.info("item name:" + name);
        item.setName(name);
        item.setPrivacySetting(privacySetting);
        item.setCategory(category);
        item.setItemFile(this.itemFile);
        item.setItemFileName(this.itemFileName);
        item.setCreatedDate(itemCreatedModDate);
        item.setModifiedDate(itemCreatedModDate);
        LOGGER.info("videoUrl" + videoUrl);
        if(videoUrl!=null && !videoUrl.matches("")){//check if the url already has the feature being passed
        	if(videoUrl.indexOf("&feature")>0){
            LOGGER.info("Saving Video");
            item.setVideourl(videoUrl);//save the url if it does'nt contain "feature"
            LOGGER.info("videoUrl" + videoUrl);
        	}else{
        		videoUrl = videoUrl.concat("&feature=channel");//append the string
        		item.setVideourl(videoUrl);
        	}
            
        } else {
            LOGGER.info("Saving Audio");
            LOGGER.info("itemFileContentType" + itemFileContentType);
        } 
        
        itemService.addAudioVideoItem(item, profile, itemFileContentType, videoUrl);

        return "success";

    }

    
    public String createNewURLItem() {
    	LOGGER.info("Inside createNewURLItem");
    	System.out.println("Inside createNewURLItem");
    	System.out.println("Url" +Url);
    	itemCreatedModDate = new Date(System.currentTimeMillis());
    	/* User user = (User) SecurityContextHolder.getContext()
                .getAuthentication().getPrincipal();*/
        Profile  existProfile= new Profile();
        existProfile=profileBaseService.findByPrimaryKey(profile,profile.getId());
    	System.out.println("existProfile Id" +existProfile.getId());
    	item = new Item();
    	LOGGER.info("item name:" + name);
    	if(Url.startsWith("www")||Url.startsWith("WWW")){
    		Url="http://"+Url;
    	}
    	System.out.println("UrlUrl" +Url);
    	System.out.println("name" +name);
    	item.setName(name);
    	item.setItemURL(Url);
    	item.setPrivacySetting(privacySetting);

    	item.setCreatedDate(itemCreatedModDate);
    	item.setModifiedDate(itemCreatedModDate);
    	LOGGER.info("videoUrl" + videoUrl);

    	itemService.addItemURL(item, existProfile, itemFileContentType,Url);

    	return "success";

    }
    
    public void prepare() throws Exception {
    	LOGGER.info("Inside prepare");
        User user = (User) SecurityContextHolder.getContext()
                .getAuthentication().getPrincipal();
        LOGGER.info("user id in perpare" + user.getId());
        contactType = new ContactTypes();
        contactTypesList = employeeContactTypesService.findAll(contactType);
        LOGGER.info("contact type:" + contactTypesList.size());
    }

   /* public User getUser() {
        return user;
    }

    public void setUser(User user) {
        LOGGER.info("user is:" + user.getId());
        this.user = user;
    }*/

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

    public ItemService getItemService() {
        return itemService;
    }

    public void setItemService(ItemService itemService) {
        this.itemService = itemService;
    }

    public File getItemFile() {
        LOGGER.info("file" + itemFile);
        return itemFile;
    }

    public void setItemFile(File itemFile) {
        this.itemFile = itemFile;
    }

    private String itemFileName;

    public void setItemFileFileName(String itemFileName) {
        this.itemFileName = itemFileName;
    }

    public BaseService<BriefCase> getBriefCaseBaseService() {
        return briefCaseBaseService;
    }

    public void setBriefCaseBaseService(BaseService<BriefCase> briefCaseBaseService) {
        this.briefCaseBaseService = briefCaseBaseService;
    }

    public Date getItemCreatedModDate() {
        return itemCreatedModDate;
    }

    public void setItemCreatedModDate(Date itemCreatedModDate) {
        this.itemCreatedModDate = itemCreatedModDate;
    }

    public String getItemFileContentType() {
        return itemFileContentType;
    }

    public void setItemFileContentType(String itemFileContentType) {
        this.itemFileContentType = itemFileContentType;
    }


    public String getVideoUrl() {
        return videoUrl;
    }


    public void setVideoUrl(String videoUrl) {
        this.videoUrl = videoUrl;
    }


	public Profile getProfile() {
		return profile;
	}


	public void setProfile(Profile profile) {
		this.profile = profile;
	}


	public BaseService<Profile> getProfileBaseService() {
		return profileBaseService;
	}


	public void setProfileBaseService(BaseService<Profile> profileBaseService) {
		this.profileBaseService = profileBaseService;
	}


	public String getUrl() {
		return Url;
	}


	public void setUrl(String url) {
		Url = url;
	}


}