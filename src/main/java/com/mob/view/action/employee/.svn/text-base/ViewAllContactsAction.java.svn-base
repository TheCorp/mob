package com.mob.view.action.employee;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.acegisecurity.context.SecurityContextHolder;
import org.apache.struts2.interceptor.SessionAware;

import com.mob.model.Contact;
import com.mob.model.ContactTypes;
import com.mob.model.User;
import com.mob.model.profile.Item;
import com.mob.model.profile.Profile;
import com.mob.services.BaseService;
import com.mob.services.ContactEmployeeService;
import com.mob.services.ItemService;
import com.mob.services.MessagingService;
import com.mob.services.PrivacyGroupService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

public class ViewAllContactsAction extends ActionSupport implements Preparable,
		SessionAware {
	/**
	 * Logger for logging messages.
	 */
	private static final MOBLogger LOGGER = new MOBLogger(
			ViewAllContactsAction.class);

	private Profile profile;
	private Contact contact;
	private ContactEmployeeService contactEmployeeService;
	private List contactList;
	private List contactNames = new ArrayList();
	private String contactname;
	private BaseService<Profile> profileService;
	private int contactSize;
	private ContactTypes contType;
	private List contactTypesList;
	private BaseService<ContactTypes> contactTypesService;

	private ItemService itemService;
	private List itemsList;
	private int itemcount;

	private long inboxMessageCount;
	private MessagingService messagingService;
	private List listInboxEmailMessages;

	private List documentsListFromBriefcase = new ArrayList();
	private List photosListFromBriefcase = new ArrayList();
	private List audioVedioListFromBriefcase = new ArrayList();

	private int documentsCount;
	private int photossCount;
	private int audioVedioCount;

	private long unreadEmpMsgListSize;
	private List cntUnreadMsgList;
	private boolean unreadMsgCnt;

	private Map session;
	private Long currentProfileId;

	private long associatedProfileId;
	private PrivacyGroupService privacyGroupService;
	private String image;
	private String resizedMidPicture;
	private String resizedMinPicture;

	public String loadContacts() {
		LOGGER.info("Inside loadContacts");
		User user = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		currentProfileId = (Long) getSession().get("currentProfile");
		System.out.println("currentProfileId:" + currentProfileId);
		if (currentProfileId != null) {
			contactList = contactEmployeeService
					.findListContacts(currentProfileId);
			try {
				Iterator it = contactList.iterator();
				while (it.hasNext()) {
					contact = (Contact) it.next();
					if (contact.getAssociatedProfile().getPicture() != null) {
						image = (String) contact.getAssociatedProfile()
								.getAmazonFileURL().get(0);
					}
					if (contact.getAssociatedProfile().getResizedMidPicture() != null) {
						resizedMidPicture = (String) contact
								.getAssociatedProfile().getAmazonFileURL()
								.get(1);
						contact.getAssociatedProfile().setResizedMidPicture(
								resizedMidPicture);
					}
					if (contact.getAssociatedProfile().getResizedMinPicture() != null) {
						resizedMinPicture = (String) contact
								.getAssociatedProfile().getAmazonFileURL()
								.get(2);
						contact.getAssociatedProfile().setResizedMinPicture(
								resizedMinPicture);
					}
					contact.setEmployer(contactEmployeeService.isContactOwnerEmployer(contact));

				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			contactSize = contactList.size();
			itemsList = itemService.findItems(currentProfileId);
			itemcount = itemsList.size();

			/*
			 * contType = new ContactTypes(); contactTypesList =
			 * contactTypesService.findAll(contType);
			 */
			getDocumentsFromBriefcase();
			getphotosFromBriefcase();
			getAudioVedioFromBriefcase();

			listInboxEmailMessages = messagingService
					.findInboxListEmailMessages(user.getId());
			inboxMessageCount = listInboxEmailMessages.size();

			cntUnreadMsgList = messagingService.findUnreadEmailMsgList(
					user.getId(), unreadMsgCnt);
			unreadEmpMsgListSize = cntUnreadMsgList.size();
		}
		return "success";
	}

	public void getDocumentsFromBriefcase() {
		LOGGER.info("Inside getDocumentsFromBriefcase");
		Iterator it = itemsList.iterator();
		while (it.hasNext()) {
			Item item = (Item) it.next();
			if (item.getTextFileurl() != null) {
				documentsListFromBriefcase.add(item);
			}
		}
		documentsCount = documentsListFromBriefcase.size();

	}

	public void getphotosFromBriefcase() {
		LOGGER.info("Inside getphotosFromBriefcase");
		Iterator it = itemsList.iterator();
		while (it.hasNext()) {
			Item item = (Item) it.next();
			if (item.getVideourl() != null) {
				photosListFromBriefcase.add(item);
			}
		}
		photossCount = photosListFromBriefcase.size();

	}

	public void getAudioVedioFromBriefcase() {
		LOGGER.info("Inside getAudioVedioFromBriefcase");
		Iterator it = itemsList.iterator();
		while (it.hasNext()) {
			Item item = (Item) it.next();
			if (item.getAudiourl() != null) {
				audioVedioListFromBriefcase.add(item);
			}
		}
		audioVedioCount = audioVedioListFromBriefcase.size();
	}

	public String getContactTypesListForProfile() {
		currentProfileId = (Long) getSession().get("currentProfile");
		if (currentProfileId != null)
			contactTypesList = privacyGroupService
					.loadAllPrivacyGroupsOfUser(currentProfileId);
		return "success";
	}

	public List getDocumentsListFromBriefcase() {
		return documentsListFromBriefcase;
	}

	public void setDocumentsListFromBriefcase(List documentsListFromBriefcase) {
		this.documentsListFromBriefcase = documentsListFromBriefcase;
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

	public int getDocumentsCount() {
		return documentsCount;
	}

	public void setDocumentsCount(int documentsCount) {
		this.documentsCount = documentsCount;
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

	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		User user = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		contType = new ContactTypes();
		contactTypesList = contactTypesService.findAll(contType);

	}

	public Profile getProfile() {
		return profile;
	}

	public List getContactList() {
		return contactList;
	}

	public void setContactList(List contactList) {
		this.contactList = contactList;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}

	public List getContactNames() {
		return contactNames;
	}

	public void setContactNames(List contactNames) {
		this.contactNames = contactNames;
	}

	public Contact getContact() {
		return contact;
	}

	public void setContact(Contact contact) {
		this.contact = contact;
	}

	public BaseService<Profile> getProfileService() {
		return profileService;
	}

	public void setProfileService(BaseService<Profile> profileService) {
		this.profileService = profileService;
	}

	public int getContactSize() {
		return contactSize;
	}

	public void setContactSize(int contactSize) {
		this.contactSize = contactSize;
	}

	public ContactEmployeeService getContactEmployeeService() {
		return contactEmployeeService;
	}

	public void setContactEmployeeService(
			ContactEmployeeService contactEmployeeService) {
		this.contactEmployeeService = contactEmployeeService;
	}

	public ContactTypes getContType() {
		return contType;
	}

	public void setContType(ContactTypes contType) {
		this.contType = contType;
	}

	public List getContactTypesList() {
		return contactTypesList;
	}

	public void setContactTypesList(List contactTypesList) {
		this.contactTypesList = contactTypesList;
	}

	public BaseService<ContactTypes> getContactTypesService() {
		return contactTypesService;
	}

	public void setContactTypesService(
			BaseService<ContactTypes> contactTypesService) {
		this.contactTypesService = contactTypesService;
	}

	public long getInboxMessageCount() {
		return inboxMessageCount;
	}

	public void setInboxMessageCount(long inboxMessageCount) {
		this.inboxMessageCount = inboxMessageCount;
	}

	public MessagingService getMessagingService() {
		return messagingService;
	}

	public void setMessagingService(MessagingService messagingService) {
		this.messagingService = messagingService;
	}

	public List getListInboxEmailMessages() {
		return listInboxEmailMessages;
	}

	public void setListInboxEmailMessages(List listInboxEmailMessages) {
		this.listInboxEmailMessages = listInboxEmailMessages;
	}

	public String getContactname() {
		return contactname;
	}

	public void setContactname(String contactname) {
		this.contactname = contactname;
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

	public long getUnreadEmpMsgListSize() {
		return unreadEmpMsgListSize;
	}

	public void setUnreadEmpMsgListSize(long unreadEmpMsgListSize) {
		this.unreadEmpMsgListSize = unreadEmpMsgListSize;
	}

	public List getCntUnreadMsgList() {
		return cntUnreadMsgList;
	}

	public void setCntUnreadMsgList(List cntUnreadMsgList) {
		this.cntUnreadMsgList = cntUnreadMsgList;
	}

	public boolean isUnreadMsgCnt() {
		return unreadMsgCnt;
	}

	public void setUnreadMsgCnt(boolean unreadMsgCnt) {
		this.unreadMsgCnt = unreadMsgCnt;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	public void setCurrentProfileId(Long currentProfileId) {
		this.currentProfileId = currentProfileId;
	}

	public PrivacyGroupService getPrivacyGroupService() {
		return privacyGroupService;
	}

	public void setPrivacyGroupService(PrivacyGroupService privacyGroupService) {
		this.privacyGroupService = privacyGroupService;
	}

	public void setAssociatedProfileId(long associatedProfileId) {
		this.associatedProfileId = associatedProfileId;
	}

}
