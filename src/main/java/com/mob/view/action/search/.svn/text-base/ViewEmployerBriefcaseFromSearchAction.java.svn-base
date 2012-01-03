package com.mob.view.action.search;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.mob.model.employer.Employer;
import com.mob.model.profile.Item;
import com.mob.services.BaseService;
import com.mob.services.ItemService;
import com.mob.services.MessagingService;
import com.mob.services.SearchService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;

public class ViewEmployerBriefcaseFromSearchAction extends ActionSupport {
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(ViewEmployerBriefcaseFromSearchAction.class);

	private static final long serialVersionUID = 1L;
	
	private Employer employer=new Employer();
	private SearchService searchService;
    private ItemService itemService;
	private BaseService<Employer> employerBaseService;
	private  MessagingService messagingService;
	
	private List briefcaseItemsList;
	private List contacts;
	private List documentsListFromBriefcase=new ArrayList();	
	private List photosListFromBriefcase=new ArrayList();
	private List audioVedioListFromBriefcase=new ArrayList();
	private List  uRLsListListFromBriefcase = new ArrayList();
	private List  listInboxEmailMessages;
	private List  cntUnreadMsgList;
	
	
	private int documentsCount;
	private int photossCount;
	private int audioVedioCount;
	private int itemcount;
	private long inboxMessageCount;
	private long unreadEmpMsgListSize;
	private boolean  unreadMsgCnt;
	private long contactsCount;
	private long  uRLSItemCount;
	
	public String viewEmployerContacts(){
		LOGGER.info("Entered viewEmployerContacts");
		 employer=employerBaseService.findByPrimaryKey(employer,employer.getId());
		 
		 contacts = searchService.findListContacts(employer.getId());
		 contactsCount=contacts.size();
		 LOGGER.info("contactscount"+contactsCount);
		 
		 briefcaseItemsList =new ArrayList();
		 briefcaseItemsList = itemService.findItems(employer.getId());
		 itemcount=briefcaseItemsList.size();
		 
		 listInboxEmailMessages= messagingService.findInboxListEmailMessages(employer.getId());
		 inboxMessageCount=listInboxEmailMessages.size();
			
		 cntUnreadMsgList=messagingService.findUnreadEmailMsgList(employer.getId(),unreadMsgCnt);
		 unreadEmpMsgListSize=cntUnreadMsgList.size();
		 
	    getDocumentsFromBriefcase();
		getphotosFromBriefcase();
		getAudioVedioFromBriefcase();	
		
		 return "success";
		
		
	}
	
	public String viewEmployeeBriefcaseItems(){	 
		LOGGER.info("Entered viewEmployeeBriefcaseItems");
		 employer=employerBaseService.findByPrimaryKey(employer,employer.getId());
		 
		 briefcaseItemsList =new ArrayList();
		 briefcaseItemsList = itemService.findItems(employer.getId());
		 itemcount=briefcaseItemsList.size();
		 
		 listInboxEmailMessages= messagingService.findInboxListEmailMessages(employer.getId());
		 inboxMessageCount=listInboxEmailMessages.size();

		 cntUnreadMsgList=messagingService.findUnreadEmailMsgList(employer.getId(),unreadMsgCnt);
		 unreadEmpMsgListSize=cntUnreadMsgList.size();
		 
	     getDocumentsFromBriefcase();
		 getphotosFromBriefcase();
		 getAudioVedioFromBriefcase();	
		 getURLItemsFromBriefcase();

		 return "success";
	}
	
	public void getDocumentsFromBriefcase(){
		LOGGER.info("Entered getDocumentsFromBriefcase");
		employer=employerBaseService.findByPrimaryKey(employer,employer.getId());
		
		Iterator it=briefcaseItemsList.iterator();
		while(it.hasNext()){
			Item item=(Item)it.next();
			 if(item.getTextFileurl()!=null){
			documentsListFromBriefcase.add(item);
			 }
		}
		documentsCount=documentsListFromBriefcase.size();
		
	}
	
	public void getphotosFromBriefcase(){
		LOGGER.info("Entered getphotosFromBriefcase");
		employer=employerBaseService.findByPrimaryKey(employer,employer.getId());
		Iterator it=briefcaseItemsList.iterator();
		while(it.hasNext()){
			Item item=(Item)it.next();
			 if(item.getImageUrl()!=null){
			 photosListFromBriefcase.add(item);
			 }
		}
		photossCount=photosListFromBriefcase.size();
		
	}
	

	public void getAudioVedioFromBriefcase(){
		LOGGER.info("Entered getAudioVedioFromBriefcase");
		employer=employerBaseService.findByPrimaryKey(employer,employer.getId());

		Iterator it=briefcaseItemsList.iterator();
		while(it.hasNext()){
			Item item=(Item)it.next();
			 if(item.getVideourl()!=null||item.getAudiourl()!=null){
			 LOGGER.info(item.getVideourl());
			 audioVedioListFromBriefcase.add(item);
			 }
		}
		audioVedioCount=audioVedioListFromBriefcase.size();
	}

	public void getURLItemsFromBriefcase(){
		LOGGER.info("Entered getURLItemsFromBriefcase");
		employer=employerBaseService.findByPrimaryKey(employer,employer.getId());

		Iterator it=briefcaseItemsList.iterator();
		while(it.hasNext()){
			Item item=(Item)it.next();
			 if(item.getItemURL()!=null){
			 LOGGER.info(item.getItemURL());
			uRLsListListFromBriefcase.add(item);
			 }
		}
		uRLSItemCount=uRLsListListFromBriefcase.size();
	}

	public Employer getEmployer() {
		return employer;
	}


	public void setEmployer(Employer employer) {
		this.employer = employer;
	}



	public SearchService getSearchService() {
		return searchService;
	}



	public void setSearchService(SearchService searchService) {
		this.searchService = searchService;
	}



	public ItemService getItemService() {
		return itemService;
	}



	public void setItemService(ItemService itemService) {
		this.itemService = itemService;
	}



	public int getItemcount() {
		return itemcount;
	}



	public void setItemcount(int itemcount) {
		this.itemcount = itemcount;
	}



	public List getContacts() {
		return contacts;
	}



	public void setContacts(List contacts) {
		this.contacts = contacts;
	}



	public BaseService<Employer> getEmployerBaseService() {
		return employerBaseService;
	}



	public void setEmployerBaseService(BaseService<Employer> employerBaseService) {
		this.employerBaseService = employerBaseService;
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



	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public long getContactsCount() {
		return contactsCount;
	}

	public void setContactsCount(long contactsCount) {
		this.contactsCount = contactsCount;
	}

	public List getURLsListListFromBriefcase() {
		return uRLsListListFromBriefcase;
	}

	public void setURLsListListFromBriefcase(List lsListListFromBriefcase) {
		uRLsListListFromBriefcase = lsListListFromBriefcase;
	}

	public long getURLSItemCount() {
		return uRLSItemCount;
	}

	public void setURLSItemCount(long itemCount) {
		uRLSItemCount = itemCount;
	}



	
}
