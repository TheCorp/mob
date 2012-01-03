package com.mob.view.action.search;

import com.mob.dao.ContactEmployeeDao;
import com.mob.model.Contact;
import com.mob.model.ContactTypes;
import com.mob.model.FlaggedTypes;
import com.mob.model.PrivacyGroup;
import com.mob.model.User;
import com.mob.model.profile.*;
import com.mob.services.*;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;
import org.acegisecurity.context.SecurityContextHolder;
import org.apache.struts2.interceptor.SessionAware;


import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class ViewEmployeeProfileFromSearchAction extends ActionSupport implements SessionAware {
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
            new MOBLogger(ViewEmployeeProfileFromSearchAction.class);

    private static final long serialVersionUID = 1L;

    private User employee = new User();
    private Profile employeeProfile = new Profile();
    private WorkExperience interestedEmployeeExperience = new WorkExperience();
    private WorkExperience experience;
    private Feedback feedback;
    private ContactTypes friendtype;
    private PrivacyGroup privacyGroup;

    private FeedbackService feedbackService;
    private SearchService searchService;
    private ItemService itemService;
    private BaseService<ContactTypes> employeeContactTypesBaseService;
    private BaseService<User> employeeBaseService;
    private BaseService<Profile> employeeProfileBaseService;
    private MessagingService messagingService;
    private PrivacyGroupService privacyGroupService;
    private EmployeeProfileService workExperienceService;
    private EmployeeProfileService employeeProfileService;

    private List itemsList;
    private List employeeWorkExperience;
    private List contacts;
    private List contactTypesList;
    private List briefcaseItemsList;
    private List documentsListFromBriefcase = new ArrayList();
    private List photosListFromBriefcase = new ArrayList();
    private List audioVedioListFromBriefcase = new ArrayList();
    private List uRLItemListFromBriefcase = new ArrayList();
    private List listInboxEmailMessages;
    private List cntUnreadMsgList;

    private long employeeProfileId;
    private int itemcount;
    private int possitiveSize;
    private int negativeSize;
    private int contactCount;
    private int documentsCount;
    private int photossCount;
    private int audioVedioCount;
    private long inboxMessageCount;
    private long unreadEmpMsgListSize;
    private boolean unreadMsgCnt;
    private long employeeId;
    private int allProfilesFeedbackCount;
    private long uRLItemListFromBriefcaseCount;


    private WorkExperience workExperience;
    private List<WorkExperience> workExperienceList;
    private Education education;
    private Training training;
    private List<Education> educationList;
    private List<Training> trainingList;
    private EmployeeProfileService educationService;
    private EmployeeProfileService trainingService;
    private EmployeeProfileService userSkillsDetailsService;
    private List userSkillsDetailsList;
    private SkillsDetails userSkillsDetails;

    private Profile profile;
    private List<Profile> profiles;

    private Profile currentProfile;
    private BriefCase briefCase;
    private long briefcaseProfilrId;
    private BriefCaseService briefCaseService;
    private long briefcseViewCount;
    private BaseService briefcaseBaseService;
    private PhysicalTraits physicalTraits;


    private FlaggedTypes flaggedType;
    private BaseService<FlaggedTypes> flaggedTypeService;
    private List flaggedTypeList;
    private String height;
    private String measurements;
    private int weight;
    private int shoesize;
    private String build;
    private String haircolor;
    private String eyecolor;
    private String breastcupsize;
    private String ethnicity;
    private String heightIn;
    private String heightFt;
    private BaseService<Profile> profileService;
    private User user;
    private List physicalTraitsList;
    private EmployeeProfileService userPhysicalTraits;
    private NewsManager newsManager;
    
    private String  image;
	private String resizedMidPicture;
	private String resizedMinPicture;
	private String _resizedMinPicture;
	private Contact contact;
	private Contact contactOwner;

    public void setNewsManager(NewsManager newsManager) {
        this.newsManager = newsManager;
    }

    /**
     * @return
     */
    public String viewEmployeeProfile() {

        User user = (User) SecurityContextHolder.getContext()
                .getAuthentication().getPrincipal();

        System.out.println("Called viewEmployeeProfile");
        try {

            /* Increase employee profile view count when employer viewing profile*/
            employeeProfile = searchService.findEmployeeProfileForView(employeeProfile, employeeProfileId);
            employee = employeeBaseService.findByPrimaryKey(employee, employeeProfile.getProfileOwner().getId());
            contacts = searchService.findListContacts(employeeProfile.getProfileOwner().getId());
            employeeProfile.setNoOfContacts(contacts.size());
            contactCount = contacts.size();

            //contactTypesList = privacyGroupService.loadAllPrivacyGroupsOfUser(employeeProfileId);

            /* Load list of profiles*/

            profiles = searchService.findListOfEmployeeProfiles(profile, user.getId());
            if (profiles.size() != 0) {
                currentProfile = employeeProfileService.getDefaultProfileForUser(user.getId());
               // physicalTraits = employeeProfileService.getphysicalTraitsForUser(currentProfile.getId());
                LOGGER.debug("currentProfile id:" + currentProfile.getId());
                contactTypesList = privacyGroupService.loadAllPrivacyGroupsOfUser(currentProfile.getId());
            }
            if(employeeProfile.getPicture()!=null){
    			image=(String) employeeProfile.getAmazonFileURL().get(0);
    		}
    		if(employeeProfile.getResizedMidPicture()!=null){
    			resizedMidPicture=(String) employeeProfile.getAmazonFileURL().get(1);
    		}
    		if(employeeProfile.getResizedMinPicture()!=null){
    			resizedMinPicture=(String) employeeProfile.getAmazonFileURL().get(2);
    		}

    		System.out.println("Image" +image);
    		
         
            loadEmpolyeeWorkExperienceProfile();
            loadEmpolyeeEducationTrainingDetails();
            loadEmpolyeeSkillsDetails();
            loadEmpolyeePhysicalTraits();
            viewEmployeeBriefcaseItems();
            if (this.newsManager != null) {
                LOGGER.info("Profile viewed by employer");
                this.newsManager.employerViewedEmployeeProfile(user.getId(), new long[]{employeeProfileId});
            } else {
                LOGGER.info("No news manager configured");
            }
        } catch (Throwable e) {
            e.printStackTrace();
            LOGGER.error(e.getMessage());
            return "error";
        }
        System.out.println("Done viewEmployeeProfile");
        getflaggedType();
        return "success";
    }


    public String viewFeaturedEmployeeProfile() {

        try {

            /* Increase employee profile view count when employer viewing profile*/
            employeeProfile = searchService.findEmployeeProfileForView(employeeProfile, employeeProfileId);
            employee = employeeBaseService.findByPrimaryKey(employee, employeeProfile.getProfileOwner().getId());
            
            /*
             * Duplicate code
             * contacts = searchService.findListContacts(employeeProfile.getProfileOwner().getId());
            employeeProfile.setNoOfContacts(contacts.size());
            contactCount = contacts.size();*/

            if(employeeProfile.getPicture()!=null){
    			image=(String) employeeProfile.getAmazonFileURL().get(0);
    		}
    		if(employeeProfile.getResizedMidPicture()!=null){
    			resizedMidPicture=(String) employeeProfile.getAmazonFileURL().get(1);
    		}
    		if(employeeProfile.getResizedMinPicture()!=null){
    			resizedMinPicture=(String) employeeProfile.getAmazonFileURL().get(2);
    		}
    		
            //contactTypesList = privacyGroupService.loadAllPrivacyGroupsOfUser(employeeProfileId);

            /* Load list of profiles

                 profiles = searchService.findListOfEmployeeProfiles(profile, user.getId());
                 if (profiles.size() != 0) {
                     currentProfile = employeeProfileService.getDefaultProfileForUser(user.getId());
                     LOGGER.debug("currentProfile id:" + currentProfile.getId());
                     contactTypesList = privacyGroupService.loadAllPrivacyGroupsOfUser(currentProfile.getId());
                 }
            */
            
            loadEmpolyeePhysicalTraits();
            loadEmpolyeeEducationTrainingDetails();
            loadEmpolyeeSkillsDetails();
            viewEmployeeBriefcaseItems1();

        } catch (Exception e) {
            e.printStackTrace();
            LOGGER.error(e);
            return "error";
        }
        return "success";
    }

    public String loadEmpolyeePhysicalTraits() {
        /* LOGGER.info("Inside loadEmpolyeeSkillsDetails");
           user = (User)SecurityContextHolder.getContext().
           getAuthentication().getPrincipal();	*/
        employeeProfile = profileService.findByPrimaryKey(employeeProfile, employeeProfileId);
        physicalTraits = new PhysicalTraits();
        physicalTraitsList = userPhysicalTraits.findUserPhysicalTraits(physicalTraits, employeeProfileId);
        Iterator<PhysicalTraits> it = physicalTraitsList.iterator();
        try {

            while (it.hasNext()) {
                // Get element
                physicalTraits = it.next();
                System.out.println("profile" + physicalTraits.getId());
                height = physicalTraits.getHeight();


                String[] st = height.split(",");
                if (st.length == 2) {
                    heightFt = st[0];
                    heightIn = st[1];
                } else if (st.length == 1) {
                    heightFt = st[0];
                }

                measurements = physicalTraits.getMeasurements();
                measurements = measurements.replaceAll(",", "-");
                weight = physicalTraits.getWeight();
                shoesize = physicalTraits.getShoesize();
                build = physicalTraits.getBuild();
                haircolor = physicalTraits.getHaircolor();
                ;
                eyecolor = physicalTraits.getEyecolor();
                breastcupsize = physicalTraits.getBreastcupsize();
                ethnicity = physicalTraits.getEthnicity();
            }


        } catch (Exception e) {
            e.printStackTrace();
        }


        return "success";
    }


    public String viewEmployeeProfileDetails() {
        User user = (User) SecurityContextHolder.getContext()
                .getAuthentication().getPrincipal();

        /* No need for incrementing the profile view count*/
        employeeProfile = employeeProfileBaseService.findByPrimaryKey(employeeProfile, employeeProfileId);
        employee = employeeBaseService.findByPrimaryKey(employee, employeeProfile.getProfileOwner().getId());
        LOGGER.debug("contactTypesList:----------" + contactTypesList);
        loadEmpolyeeWorkExperienceProfile();
        loadEmpolyeeEducationTrainingDetails();
        loadEmpolyeeSkillsDetails();
        getListOfFeedbacks();
        getListOfAllProfilesFeedbacks();

        /* Load list of profiles*/
        profiles = searchService.findListOfEmployeeProfiles(profile, user.getId());
        if (profiles.size() != 0) {
            currentProfile = employeeProfileService.getDefaultProfileForUser(user.getId());
            LOGGER.debug("currentProfile id:" + currentProfile.getId());
            contactTypesList = privacyGroupService.loadAllPrivacyGroupsOfUser(currentProfile.getId());
        }
        return "success";

    }


    public String loadEmpolyeeWorkExperienceProfile() {

        workExperience = new WorkExperience();
        workExperienceList = workExperienceService.findExperienceList(workExperience, employeeProfile.getId());

        return "success";
    }


    public String loadEmpolyeeEducationTrainingDetails() {
        education = new Education();
        educationList = educationService.findEducationList(education, employeeProfile.getId());

        training = new Training();
        trainingList = trainingService.findTrainingList(training, employeeProfile.getId());

        return "success";
    }

    public String loadEmpolyeeSkillsDetails() {
        LOGGER.info("Inside loadEmpolyeeSkillsDetails");

        userSkillsDetails = new SkillsDetails();
        userSkillsDetailsList = userSkillsDetailsService.findUserSkillsList(userSkillsDetails, employeeProfile.getId());

        return "success";
    }

    public void getListOfFeedbacks() {
        List positiveListSize = feedbackService.findListOfFeedbacks(feedback, employeeProfile.getId());
        possitiveSize = positiveListSize.size();
    }

    public void getListOfAllProfilesFeedbacks() {

        List allProfilesFeedback = feedbackService.findAllProfilesFeedback(feedback, employee.getId());
        allProfilesFeedbackCount = allProfilesFeedback.size();

    }

    private ContactEmployeeDao contactDao;
    private String contactPrivacyGroup;

    public void setContactDao(ContactEmployeeDao contactDao) {
        this.contactDao = contactDao;
    }

    public String viewEmployeeBriefcaseItems() {
        LOGGER.info("Entered viewEmployeeBriefcaseItems");
//   employee=employeeBaseService.findByPrimaryKey(employee,employeeId);

        Long viewerProfileId = getViewerProfile();
        if (viewerProfileId != null) {
            Profile viewerProfile = employeeProfileBaseService.findByPrimaryKey(new Profile(), viewerProfileId);
            this.contactPrivacyGroup = contactDao.getPrivacyGroupForContact(viewerProfile.getId(), employeeProfile.getId());
        }
        employeeProfile = employeeProfileBaseService.findByPrimaryKey(employeeProfile, employeeProfileId);

        briefcaseItemsList = new ArrayList();
        briefcaseItemsList = itemService.findItems(this.employeeProfile.getId());
        itemcount = briefcaseItemsList.size();
        contacts = searchService.findListContacts(this.employeeProfile.getId());
        employeeProfile.setNoOfContacts(contacts.size());

        getDocumentsFromBriefcase();
        getphotosFromBriefcase();
        getAudioVedioFromBriefcase();
        getflaggedType();
        getURLItemsFromBriefcase();

//   listInboxEmailMessages= messagingService.findInboxListEmailMessages(employee.getId());
        inboxMessageCount = messagingService.findNumberOfMessagesInProfile(employeeProfile);

        unreadEmpMsgListSize = messagingService.findNumberOfUnreadMessagesInProfile(employeeProfile);
        /*System.out.println("briefcaseProfilrId:--"+briefcaseProfilrId);
        briefCase=briefCaseService.updateBriefcaseViewCount(briefcaseProfilrId);
        System.out.println("count:**----"+briefCase.getBriefcaseViewCount());*/
        briefCase = briefCaseService.updateBriefcaseViewCount(employeeProfileId);
        
        
        try {
			Iterator it=contacts.iterator();
			while (it.hasNext()) {
				/*contact = (Contact) it.next();
				 if(contact.getContactOwner().getPicture()!=null){
					 image=(String)contact.getContactOwner().getAmazonFileURL().get(0);
					}
				 if(contact.getContactOwner().getResizedMidPicture()!=null){
					 resizedMidPicture=(String)contact.getContactOwner().getAmazonFileURL().get(1);
					}
				 	if(contact.getContactOwner().getResizedMinPicture()!=null){
						_resizedMinPicture=(String)contact.getContactOwner().getAmazonFileURL().get(2);
						contact.getContactOwner().setResizedMinPicture(_resizedMinPicture);
					
					}*/
				contactOwner=(Contact)it.next();
				if(contactOwner.getContactOwner().getResizedMinPicture()!=null){
					resizedMinPicture=(String) contactOwner.getContactOwner().getAmazonFileURL().get(2);
					contactOwner.getContactOwner().setResizedMinPicture(resizedMinPicture);
				}
						
		} 
			}catch (Exception e) {
			e.printStackTrace();
		}

        return "success";


    }

    public String viewEmployeeBriefcaseItems1() {
        LOGGER.info("Entered viewEmployeeBriefcaseItems");
//		 employee=employeeBaseService.findByPrimaryKey(employee,employeeId);
        // Profile viewerProfile = employeeProfileBaseService.findByPrimaryKey(new Profile(),getViewerProfile());
        employeeProfile = employeeProfileBaseService.findByPrimaryKey(employeeProfile, employeeProfileId);
        //  this.contactPrivacyGroup = contactDao.getPrivacyGroupForContact(viewerProfile.getId(),employeeProfile.getId());

        briefcaseItemsList = new ArrayList();
        briefcaseItemsList = itemService.findItems(this.employeeProfile.getId());
        itemcount = briefcaseItemsList.size();
        contacts = searchService.findListContacts(this.employeeProfile.getId());
       
        getDocumentsFromBriefcase();
        getphotosFromBriefcase();
        getAudioVedioFromBriefcase();
        getflaggedType();
        getURLItemsFromBriefcase();
        loadEmpolyeeWorkExperienceProfile();
//		 listInboxEmailMessages= messagingService.findInboxListEmailMessages(employee.getId());
        inboxMessageCount = messagingService.findNumberOfMessagesInProfile(employeeProfile);

        unreadEmpMsgListSize = messagingService.findNumberOfUnreadMessagesInProfile(employeeProfile);
        /*System.out.println("briefcaseProfilrId:--"+briefcaseProfilrId);
        briefCase=briefCaseService.updateBriefcaseViewCount(briefcaseProfilrId);
        System.out.println("count:**----"+briefCase.getBriefcaseViewCount());*/
        briefCase = briefCaseService.updateBriefcaseViewCount(employeeProfileId);

        Iterator it=contacts.iterator();
		while(it.hasNext()){
			 contactOwner=(Contact)it.next();
			 if(contactOwner.getContactOwner().getResizedMinPicture()!=null){
					resizedMinPicture=(String) contactOwner.getContactOwner().getAmazonFileURL().get(2);
					contactOwner.getContactOwner().setResizedMinPicture(resizedMinPicture);
				}
		}
		employeeProfile.setNoOfContacts(contacts.size());
		
        return "success";


    }

    private Long getViewerProfile() {
        User user = (User) SecurityContextHolder.getContext()
                .getAuthentication().getPrincipal();

        Long currentProfileId = (Long) getSession().get("currentProfile");
        if (currentProfileId == null) {
            Profile profile1 = employeeProfileService.getDefaultProfileForUser(user.getId());
            if (profile1 != null)
                getSession().put("currentProfile", profile1.getId());
        }
        return currentProfileId;
    }

    public void getDocumentsFromBriefcase() {
        LOGGER.info("Entered getDocumentsFromBriefcase");
//		employee=employeeBaseService.findByPrimaryKey(employee,employeeId);
        Iterator it = briefcaseItemsList.iterator();
        while (it.hasNext()) {
            Item item = (Item) it.next();
            if (isItemAllowed(item)) {
                if (item.getTextFileurl() != null) {
                    documentsListFromBriefcase.add(item);
                }
            }
        }
        documentsCount = documentsListFromBriefcase.size();

    }

    private boolean isItemAllowed(Item item) {
        if (item.getPrivacySetting().equals(PrivacyGroupNames.Public.toString())) {
            return true;
        } else {
            if (item.getPrivacySetting().equals(PrivacyGroupNames.Contact.toString())
                    && this.contactPrivacyGroup != null) {
                return true;
            } else {
                if (item.getPrivacySetting().equals(this.contactPrivacyGroup)) {
                    return true;
                }
            }
        }
        return false;
    }

    public void getphotosFromBriefcase() {
        LOGGER.info("Entered getphotosFromBriefcase");
//		employee=employeeBaseService.findByPrimaryKey(employee,employeeId);
        Iterator it = briefcaseItemsList.iterator();
        while (it.hasNext()) {
            Item item = (Item) it.next();
            if (isItemAllowed(item)) {
                if (item.getImageUrl() != null) {
                    photosListFromBriefcase.add(item);
                }
            }
        }
        photossCount = photosListFromBriefcase.size();

    }

    public void getflaggedType() {
        flaggedType = new FlaggedTypes();
        flaggedTypeList = flaggedTypeService.findAll(flaggedType);

        System.out.println("flagged list type++++++++++++++++++++++++++++++++" + flaggedTypeList.size());


    }


    public void getAudioVedioFromBriefcase() {
        LOGGER.info("Entered getAudioVedioFromBriefcase");
//		employee=employeeBaseService.findByPrimaryKey(employee,employeeId);

        Iterator it = briefcaseItemsList.iterator();
        while (it.hasNext()) {
            Item item = (Item) it.next();
            if (isItemAllowed(item)) {
                if (item.getVideourl() != null || item.getAudiourl() != null) {
                    LOGGER.info(item.getVideourl());
                    audioVedioListFromBriefcase.add(item);
                }
            }
        }
        audioVedioCount = audioVedioListFromBriefcase.size();
    }

    public String getBriefcaseViewCount() {


        briefCase = briefCaseService.findBriefcaseForProfile(briefcaseProfilrId);
        briefcseViewCount = briefCase.getBriefcaseViewCount();
        return "success";
    }


    public void getURLItemsFromBriefcase() {
        LOGGER.info("Entered getAudioVedioFromBriefcase");
//		employee=employeeBaseService.findByPrimaryKey(employee,employeeId);

        Iterator it = briefcaseItemsList.iterator();
        while (it.hasNext()) {
            Item item = (Item) it.next();
            if (isItemAllowed(item)) {
                if (item.getItemURL() != null) {
                    LOGGER.info(item.getItemURL());
                    uRLItemListFromBriefcase.add(item);
                }
            }
        }
        uRLItemListFromBriefcaseCount = uRLItemListFromBriefcase.size();
    }

    public List getContactTypesList() {
        return contactTypesList;
    }


    public void setContactTypesList(List contactTypesList) {
        this.contactTypesList = contactTypesList;
    }


    public ContactTypes getFriendtype() {
        return friendtype;
    }


    public void setFriendtype(ContactTypes friendtype) {
        this.friendtype = friendtype;
    }


    public SearchService getSearchService() {
        return searchService;
    }

    public void setSearchService(SearchService searchService) {
        this.searchService = searchService;
    }

    public Profile getEmployeeProfile() {
        return employeeProfile;
    }

    public void setEmployeeProfile(Profile employeeProfile) {
        this.employeeProfile = employeeProfile;
    }

    public long getEmployeeProfileId() {
        return employeeProfileId;
    }

    public void setEmployeeProfileId(long employeeProfileId) {
        this.employeeProfileId = employeeProfileId;
    }


    public WorkExperience getInterestedEmployeeExperience() {
        return interestedEmployeeExperience;
    }


    public void setInterestedEmployeeExperience(
            WorkExperience interestedEmployeeExperience) {
        this.interestedEmployeeExperience = interestedEmployeeExperience;
    }


    public List getEmployeeWorkExperience() {
        return employeeWorkExperience;
    }


    public void setEmployeeWorkExperience(List employeeWorkExperience) {
        this.employeeWorkExperience = employeeWorkExperience;
    }


    public WorkExperience getExperience() {
        return experience;
    }


    public void setExperience(WorkExperience experience) {
        this.experience = experience;
    }


    public ItemService getItemService() {
        return itemService;
    }


    public void setItemService(ItemService itemService) {
        this.itemService = itemService;
    }


    public List getItemsList() {
        return itemsList;
    }


    public void setItemsList(List itemsList) {
        this.itemsList = itemsList;
    }


    public int getItemcount() {
        return itemcount;
    }


    public void setItemcount(int itemcount) {
        this.itemcount = itemcount;
    }


    public int getPossitiveSize() {
        return possitiveSize;
    }


    public void setPossitiveSize(int possitiveSize) {
        this.possitiveSize = possitiveSize;
    }


    public Feedback getFeedback() {
        return feedback;
    }


    public void setFeedback(Feedback feedback) {
        this.feedback = feedback;
    }


    public FeedbackService getFeedbackService() {
        return feedbackService;
    }


    public void setFeedbackService(FeedbackService feedbackService) {
        this.feedbackService = feedbackService;
    }


    public int getNegativeSize() {
        return negativeSize;
    }


    public void setNegativeSize(int negativeSize) {
        this.negativeSize = negativeSize;
    }


    public List getContacts() {
        return contacts;
    }


    public void setContacts(List contacts) {
        this.contacts = contacts;
    }


    public User getEmployee() {
        return employee;
    }


    public void setEmployee(User employee) {
        this.employee = employee;
    }


    public long getEmployeeId() {
        return employeeId;
    }


    public void setEmployeeId(long employeeId) {
        this.employeeId = employeeId;
    }


    public BaseService<ContactTypes> getEmployeeContactTypesBaseService() {
        return employeeContactTypesBaseService;
    }


    public void setEmployeeContactTypesBaseService(
            BaseService<ContactTypes> employeeContactTypesBaseService) {
        this.employeeContactTypesBaseService = employeeContactTypesBaseService;
    }


    public BaseService<User> getEmployeeBaseService() {
        return employeeBaseService;
    }


    public void setEmployeeBaseService(BaseService<User> employeeBaseService) {
        this.employeeBaseService = employeeBaseService;
    }


    public BaseService<Profile> getEmployeeProfileBaseService() {
        return employeeProfileBaseService;
    }


    public void setEmployeeProfileBaseService(
            BaseService<Profile> employeeProfileBaseService) {
        this.employeeProfileBaseService = employeeProfileBaseService;
    }


    public int getContactCount() {
        return contactCount;
    }


    public void setContactCount(int contactCount) {
        this.contactCount = contactCount;
    }


    public List getBriefcaseItemsList() {
        return briefcaseItemsList;
    }


    public void setBriefcaseItemsList(List briefcaseItemsList) {
        this.briefcaseItemsList = briefcaseItemsList;
    }


    public List getDocumentsListFromBriefcase() {
        return documentsListFromBriefcase;
    }


    public void setDocumentsListFromBriefcase(List documentsListFromBriefcase) {
        this.documentsListFromBriefcase = documentsListFromBriefcase;
    }


    public int getDocumentsCount() {
        return documentsCount;
    }


    public void setDocumentsCount(int documentsCount) {
        this.documentsCount = documentsCount;
    }


    public List getPhotosListFromBriefcase() {
        return photosListFromBriefcase;
    }


    public void setPhotosListFromBriefcase(List photosListFromBriefcase) {
        this.photosListFromBriefcase = photosListFromBriefcase;
    }


    public List getAudioVedioListFromBriefcase() {
        return audioVedioListFromBriefcase;
    }


    public void setAudioVedioListFromBriefcase(List audioVedioListFromBriefcase) {
        this.audioVedioListFromBriefcase = audioVedioListFromBriefcase;
    }


    public int getPhotossCount() {
        return photossCount;
    }


    public void setPhotossCount(int photossCount) {
        this.photossCount = photossCount;
    }


    public int getAudioVedioCount() {
        return audioVedioCount;
    }


    public void setAudioVedioCount(int audioVedioCount) {
        this.audioVedioCount = audioVedioCount;
    }


    public long getInboxMessageCount() {
        return inboxMessageCount;
    }


    public void setInboxMessageCount(long inboxMessageCount) {
        this.inboxMessageCount = inboxMessageCount;
    }


    public long getUnreadEmpMsgListSize() {
        return unreadEmpMsgListSize;
    }


    public void setUnreadEmpMsgListSize(long unreadEmpMsgListSize) {
        this.unreadEmpMsgListSize = unreadEmpMsgListSize;
    }


    public boolean isUnreadMsgCnt() {
        return unreadMsgCnt;
    }


    public void setUnreadMsgCnt(boolean unreadMsgCnt) {
        this.unreadMsgCnt = unreadMsgCnt;
    }


    public List getListInboxEmailMessages() {
        return listInboxEmailMessages;
    }


    public void setListInboxEmailMessages(List listInboxEmailMessages) {
        this.listInboxEmailMessages = listInboxEmailMessages;
    }


    public List getCntUnreadMsgList() {
        return cntUnreadMsgList;
    }


    public void setCntUnreadMsgList(List cntUnreadMsgList) {
        this.cntUnreadMsgList = cntUnreadMsgList;
    }


    public MessagingService getMessagingService() {
        return messagingService;
    }


    public void setMessagingService(MessagingService messagingService) {
        this.messagingService = messagingService;
    }


    public static long getSerialVersionUID() {
        return serialVersionUID;
    }


    public PrivacyGroupService getPrivacyGroupService() {
        return privacyGroupService;
    }


    public void setPrivacyGroupService(PrivacyGroupService privacyGroupService) {
        this.privacyGroupService = privacyGroupService;
    }


    public PrivacyGroup getPrivacyGroup() {
        return privacyGroup;
    }


    public void setPrivacyGroup(PrivacyGroup privacyGroup) {
        this.privacyGroup = privacyGroup;
    }

    public int getAllProfilesFeedbackCount() {
        return allProfilesFeedbackCount;
    }

    public void setAllProfilesFeedbackCount(int allProfilesFeedbackCount) {
        this.allProfilesFeedbackCount = allProfilesFeedbackCount;
    }


    public Profile getProfile() {
        return profile;
    }

    public EmployeeProfileService getWorkExperienceService() {
        return workExperienceService;
    }


    public void setProfile(Profile profile) {
        this.profile = profile;
    }

    public List<Profile> getProfiles() {
        return profiles;
    }

    public void setProfiles(List<Profile> profiles) {
        this.profiles = profiles;
    }


    public void setWorkExperienceService(
            EmployeeProfileService workExperienceService) {
        this.workExperienceService = workExperienceService;
    }

    public WorkExperience getWorkExperience() {
        return workExperience;
    }

    public void setWorkExperience(WorkExperience workExperience) {
        this.workExperience = workExperience;
    }

    public List<WorkExperience> getWorkExperienceList() {
        return workExperienceList;
    }

    public void setWorkExperienceList(List<WorkExperience> workExperienceList) {
        this.workExperienceList = workExperienceList;
    }

    public Education getEducation() {
        return education;
    }

    public void setEducation(Education education) {
        this.education = education;
    }

    public Training getTraining() {
        return training;
    }

    public void setTraining(Training training) {
        this.training = training;
    }

    public List<Education> getEducationList() {
        return educationList;
    }

    public void setEducationList(List<Education> educationList) {
        this.educationList = educationList;
    }

    public List<Training> getTrainingList() {
        return trainingList;
    }

    public void setTrainingList(List<Training> trainingList) {
        this.trainingList = trainingList;
    }

    public void setEducationService(EmployeeProfileService educationService) {
        this.educationService = educationService;
    }

    public void setTrainingService(EmployeeProfileService trainingService) {
        this.trainingService = trainingService;
    }

    public SkillsDetails getUserSkillsDetails() {
        return userSkillsDetails;
    }

    public void setUserSkillsDetails(SkillsDetails userSkillsDetails) {
        this.userSkillsDetails = userSkillsDetails;
    }

    public void setUserSkillsDetailsService(
            EmployeeProfileService userSkillsDetailsService) {
        this.userSkillsDetailsService = userSkillsDetailsService;
    }

    public List getUserSkillsDetailsList() {
        return userSkillsDetailsList;
    }

    public void setUserSkillsDetailsList(List userSkillsDetailsList) {
        this.userSkillsDetailsList = userSkillsDetailsList;
    }

    public void setEmployeeProfileService(
            EmployeeProfileService employeeProfileService) {
        this.employeeProfileService = employeeProfileService;
    }

    public void setCurrentProfile(Profile currentProfile) {
        this.currentProfile = currentProfile;
    }

    private Map session;

    private Map getSession() {
        return this.session;
    }

    public void setSession(Map session) {
        this.session = session;
        //To change body of implemented methods use File | Settings | File Templates.
    }


    public BriefCase getBriefCase() {
        return briefCase;
    }

    public void setBriefCase(BriefCase briefCase) {
        this.briefCase = briefCase;
    }

    public long getBriefcaseProfilrId() {
        return briefcaseProfilrId;
    }

    public void setBriefcaseProfilrId(long briefcaseProfilrId) {
        this.briefcaseProfilrId = briefcaseProfilrId;
    }

    public BriefCaseService getBriefCaseService() {
        return briefCaseService;
    }

    public void setBriefCaseService(BriefCaseService briefCaseService) {
        this.briefCaseService = briefCaseService;
    }

    public long getBriefcseViewCount() {
        return briefcseViewCount;
    }

    public void setBriefcseViewCount(long briefcseViewCount) {
        this.briefcseViewCount = briefcseViewCount;
    }

    public BaseService getBriefcaseBaseService() {
        return briefcaseBaseService;
    }

    public void setBriefcaseBaseService(BaseService briefcaseBaseService) {
        this.briefcaseBaseService = briefcaseBaseService;
    }


    public List getFlaggedTypeList() {
        return flaggedTypeList;
    }


    public void setFlaggedTypeList(List flaggedTypeList) {
        this.flaggedTypeList = flaggedTypeList;
    }


    public BaseService<FlaggedTypes> getFlaggedTypeService() {
        return flaggedTypeService;
    }


    public void setFlaggedTypeService(BaseService<FlaggedTypes> flaggedTypeService) {
        this.flaggedTypeService = flaggedTypeService;
    }


    public FlaggedTypes getFlaggedType() {
        return flaggedType;
    }


    public void setFlaggedType(FlaggedTypes flaggedType) {
        this.flaggedType = flaggedType;
    }


    public List getURLItemListFromBriefcase() {
        return uRLItemListFromBriefcase;
    }


    public void setURLItemListFromBriefcase(List itemListFromBriefcase) {
        uRLItemListFromBriefcase = itemListFromBriefcase;
    }


    public long getURLItemListFromBriefcaseCount() {
        return uRLItemListFromBriefcaseCount;
    }


    public void setURLItemListFromBriefcaseCount(long itemListFromBriefcaseCount) {
        uRLItemListFromBriefcaseCount = itemListFromBriefcaseCount;
    }


    public PhysicalTraits getPhysicalTraits() {
        return physicalTraits;
    }


    public void setPhysicalTraits(PhysicalTraits physicalTraits) {
        this.physicalTraits = physicalTraits;
    }


    public String getHeight() {
        return height;
    }


    public void setHeight(String height) {
        this.height = height;
    }


    public String getMeasurements() {
        return measurements;
    }


    public void setMeasurements(String measurements) {
        this.measurements = measurements;
    }


    public int getWeight() {
        return weight;
    }


    public void setWeight(int weight) {
        this.weight = weight;
    }


    public int getShoesize() {
        return shoesize;
    }


    public void setShoesize(int shoesize) {
        this.shoesize = shoesize;
    }


    public String getHaircolor() {
        return haircolor;
    }


    public void setHaircolor(String haircolor) {
        this.haircolor = haircolor;
    }


    public String getEyecolor() {
        return eyecolor;
    }


    public void setEyecolor(String eyecolor) {
        this.eyecolor = eyecolor;
    }


    public String getBreastcupsize() {
        return breastcupsize;
    }


    public void setBreastcupsize(String breastcupsize) {
        this.breastcupsize = breastcupsize;
    }


    public String getEthnicity() {
        return ethnicity;
    }


    public void setEthnicity(String ethnicity) {
        this.ethnicity = ethnicity;
    }


    public String getHeightIn() {
        return heightIn;
    }


    public void setHeightIn(String heightIn) {
        this.heightIn = heightIn;
    }


    public String getHeightFt() {
        return heightFt;
    }


    public void setHeightFt(String heightFt) {
        this.heightFt = heightFt;
    }


    public BaseService<Profile> getProfileService() {
        return profileService;
    }


    public void setProfileService(BaseService<Profile> profileService) {
        this.profileService = profileService;
    }


    public User getUser() {
        return user;
    }


    public void setUser(User user) {
        this.user = user;
    }


    public List getPhysicalTraitsList() {
        return physicalTraitsList;
    }


    public void setPhysicalTraitsList(List physicalTraitsList) {
        this.physicalTraitsList = physicalTraitsList;
    }


    public EmployeeProfileService getUserPhysicalTraits() {
        return userPhysicalTraits;
    }


    public void setUserPhysicalTraits(EmployeeProfileService userPhysicalTraits) {
        this.userPhysicalTraits = userPhysicalTraits;
    }


    public EmployeeProfileService getEmployeeProfileService() {
        return employeeProfileService;
    }


    public EmployeeProfileService getEducationService() {
        return educationService;
    }


    public EmployeeProfileService getUserSkillsDetailsService() {
        return userSkillsDetailsService;
    }


    public Profile getCurrentProfile() {
        return currentProfile;
    }


    public String getBuild() {
        return build;
    }


    public void setBuild(String build) {
        this.build = build;
    }

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getResizedMidPicture() {
		return resizedMidPicture;
	}

	public void setResizedMidPicture(String resizedMidPicture) {
		this.resizedMidPicture = resizedMidPicture;
	}

	public String getResizedMinPicture() {
		return resizedMinPicture;
	}

	public void setResizedMinPicture(String resizedMinPicture) {
		this.resizedMinPicture = resizedMinPicture;
	}

	public Contact getContact() {
		return contact;
	}

	public void setContact(Contact contact) {
		this.contact = contact;
	}

	public String get_resizedMinPicture() {
		return _resizedMinPicture;
	}

	public void set_resizedMinPicture(String minPicture) {
		_resizedMinPicture = minPicture;
	}

	public Contact getContactOwner() {
		return contactOwner;
	}

	public void setContactOwner(Contact contactOwner) {
		this.contactOwner = contactOwner;
	}
}
