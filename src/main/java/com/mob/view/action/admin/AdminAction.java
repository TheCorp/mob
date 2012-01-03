package com.mob.view.action.admin;

import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.mob.model.FlagData;
import com.mob.model.FlaggedInformation;
import com.mob.model.FlaggedTypes;
import com.mob.model.User;
import com.mob.model.group.Group;
import com.mob.model.group.GroupDiscussions;
import com.mob.model.help.Help;
import com.mob.model.profile.BriefCase;
import com.mob.model.profile.Item;
import com.mob.model.profile.Profile;
import com.mob.services.AdminSearchService;
import com.mob.services.BaseService;
import com.opensymphony.xwork2.ActionSupport;

public class AdminAction extends ActionSupport implements ServletRequestAware {

	private User user;
	private Profile profile;
	private BriefCase briefCase;
	private Item item;
	private String selectedTableName;
	private BaseService<User> baseServiceUsersList;
	private BaseService<Profile> baseServiceProfilesList;
	private BaseService<Item> baseServiceBriefCaseItemList;
	private List listOfAllAdminData;
	private String searchName;
	private String selectedFlagName;
	private AdminSearchService adminSearchService;
	private static final String SELECTEDFLAGS = "seletedFlag";
	private HttpServletRequest request;
	private BaseService<User> baseServiceUser;
	private BaseService<Profile> baseServiceProfile;
	private BaseService<Item> baseServiceItem;
	private BaseService<GroupDiscussions> baseServiceGroupDiscussions;
	private BaseService<Group> baseServiceGroups;
	private List listOfAllFlaggedData;
	private List listOfAllFlaggedProfileData;
	private List listOfAllFlaggedItemData;
	private List<FlaggedInformation> adminflaggedInfoList;
	private GroupDiscussions groupDiscussions;
	private Group group;

	private List<FlaggedInformation> flaggedInformationList;

	private String type;
	private BaseService<FlagData> flagBaseService;
	 private BaseService<FlaggedTypes> flaggedTypeService;
	    private List flaggedTypeList;

	public String getAdminDetails() {
		try {

			if (selectedTableName != null) {
				flaggedInformationList = adminSearchService.getAllFlaggedData(
						selectedTableName, searchName);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		FlaggedTypes flaggedType=new FlaggedTypes();   
	    flaggedTypeList= flaggedTypeService.findAll(flaggedType);
		
		return "success";
	}

	public String getAdminflaggedInfo() {
		try {
			if (selectedTableName != null) {
				adminflaggedInfoList = adminSearchService
						.getAllAdminFlaggedData(selectedTableName, searchName);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		FlaggedTypes flaggedType=new FlaggedTypes();   
	    flaggedTypeList= flaggedTypeService.findAll(flaggedType);

		return "success";
	}

	public String getAdminFlagDetails() {

		System.out.println("getAdminFlagDetails");
		if (selectedFlagName.equals("Flag")) {

			Enumeration<String> paramnames = this.request.getParameterNames();
			List<String> seletedFlagList = new ArrayList<String>();
			while (paramnames.hasMoreElements()) {
				String param = paramnames.nextElement();
				if (param.startsWith(SELECTEDFLAGS)) {
					seletedFlagList.add(getSelectedFlagList(param, this.request
							.getParameterValues(param)[0]));
				}
			}
			for (String selectedFlaggedId : seletedFlagList) {

				if (type.equals("user")) {

					User existingUser = adminSearchService
							.findByExistingUser(selectedFlaggedId);

					if (existingUser != null) {
						existingUser.setFlagged(true);
						baseServiceUser.update(existingUser);
					}
				}
				if (type.equals("profile")) {

					Profile existingProfile = adminSearchService
							.findByExistingProfile(selectedFlaggedId);

					if (existingProfile != null) {
						existingProfile.setFlagged(true);
						baseServiceProfile.update(existingProfile);
					}
				}
				if (type.equals("item")) {

					Item existingItem = adminSearchService
							.findByExistingItem(selectedFlaggedId);

					if (existingItem != null) {
						existingItem.setFlagged(true);
						baseServiceItem.update(existingItem);
					}
				}
				
				if (type.equals("Threads")) {

					GroupDiscussions existingGroupDiscussions = adminSearchService
							.findByExistingThreads(selectedFlaggedId);

					if (existingGroupDiscussions != null) {
						existingGroupDiscussions.setFlagged(true);
						baseServiceGroupDiscussions.update(existingGroupDiscussions);
					}
				}
				if (type.equals("Groups")) {

					Group existingGroups = adminSearchService
							.findByExistingGroups(selectedFlaggedId);

					if (existingGroups != null) {
						existingGroups.setFlagged(true);
						baseServiceGroups.update(existingGroups);
					}
				}


				System.out.println("selectedFlaggedId:-------"
						+ selectedFlaggedId);
				FlagData existingFlagData = adminSearchService
						.findExistingFlagData(selectedFlaggedId, type);

				if (existingFlagData != null) {
					flagBaseService.update(existingFlagData);
				} else {
					FlagData flagData = new FlagData();
					flagData
							.setFlaggedDate(new Date(System.currentTimeMillis()));
					flagData.setFlaggedId(Integer.parseInt(selectedFlaggedId));
					flagData.setType(type);
					flagBaseService.create(flagData);
				}
			}
		} else {

			Enumeration<String> paramnames = this.request.getParameterNames();
			List<String> seletedFlagList = new ArrayList<String>();
			while (paramnames.hasMoreElements()) {
				String param = paramnames.nextElement();
				if (param.startsWith(SELECTEDFLAGS)) {
					seletedFlagList.add(getSelectedFlagList(param, this.request
							.getParameterValues(param)[0]));
				}
			}
			for (String selectedFlaggedId : seletedFlagList) {

				if (type.equals("user")) {

					User existingUser = adminSearchService
							.findByExistingUser(selectedFlaggedId);

					if (existingUser != null) {
						existingUser.setFlagdelete(true);
						baseServiceUser.update(existingUser);
					}
				}
				if (type.equals("profile")) {

					Profile existingProfile = adminSearchService
							.findByExistingProfile(selectedFlaggedId);

					if (existingProfile != null) {
						existingProfile.setFlagdelete(true);
						baseServiceProfile.update(existingProfile);
					}
				}
				if (type.equals("item")) {

					Item existingItem = adminSearchService
							.findByExistingItem(selectedFlaggedId);

					if (existingItem != null) {
						existingItem.setFlagdelete(true);
						baseServiceItem.update(existingItem);
					}
				}
				if (type.equals("Threads")) {

					GroupDiscussions existingGroupDiscussions = adminSearchService
							.findByExistingThreads(selectedFlaggedId);

					if (existingGroupDiscussions != null) {
						existingGroupDiscussions.setFlagdelete(true);
						baseServiceGroupDiscussions.update(existingGroupDiscussions);
					}
				}
				if (type.equals("Groups")) {

					Group existingGroups = adminSearchService
							.findByExistingGroups(selectedFlaggedId);

					if (existingGroups != null) {
						existingGroups.setFlagdelete(true);
						baseServiceGroups.update(existingGroups);
					}
				}

			
			}
		}
		FlaggedTypes flaggedType=new FlaggedTypes();   
	    flaggedTypeList= flaggedTypeService.findAll(flaggedType);

		return "success";
	}

	public String getAdminFlaggedDetails() {

		listOfAllFlaggedData = new ArrayList();
		listOfAllFlaggedProfileData = new ArrayList();
		listOfAllFlaggedItemData = new ArrayList();
		FlagData flagdata = new FlagData();
		List<FlagData> listOfFlagData = flagBaseService.findAll(flagdata);
		for (FlagData data : listOfFlagData) {
			if (selectedTableName.equals("Users")) {
				if (data.getType().equals("user")) {
					user = new User();
					user = baseServiceUser.findByPrimaryKey(user, data
							.getFlaggedId());
					listOfAllFlaggedData.add(user);
				}

			} else if (selectedTableName.equals("Profiles")) {
				if (data.getType().equals("profile")) {

					profile = new Profile();
					profile = baseServiceProfile.findByPrimaryKey(profile, data
							.getFlaggedId());
					listOfAllFlaggedData.add(profile);
				}
			} else if (selectedTableName.equals("Briefcase Items")) {
				if (data.getType().equals("item")) {
					item = new Item();
					item = baseServiceItem.findByPrimaryKey(item, data
							.getFlaggedId());
					listOfAllFlaggedData.add(item);
				}

			}
			else if (selectedTableName.equals("Threads")) {
				if (data.getType().equals("Threads")) {
					groupDiscussions = new GroupDiscussions();
					groupDiscussions = baseServiceGroupDiscussions.findByPrimaryKey(groupDiscussions, data
							.getFlaggedId());
					listOfAllFlaggedData.add(groupDiscussions);
				}

			}
			else if (selectedTableName.equals("Groups")) {
				if (data.getType().equals("Groups")) {
					group = new Group();
					group = baseServiceGroups.findByPrimaryKey(group, data
							.getFlaggedId());
					listOfAllFlaggedData.add(group);
				}

			}
			
			
		}

		return "success";
	}

	public String adminFlaggedDelete() {

		System.out.println("getAdminFlagDelete");
		if (selectedFlagName.equals("Delete")) {

			Enumeration<String> paramnames = this.request.getParameterNames();
			List<String> seletedFlagList = new ArrayList<String>();
			while (paramnames.hasMoreElements()) {
				String param = paramnames.nextElement();
				if (param.startsWith(SELECTEDFLAGS)) {
					seletedFlagList.add(getSelectedFlagList(param, this.request
							.getParameterValues(param)[0]));
				}
			}
			for (String selectedFlaggedId : seletedFlagList) {

				if (type.equals("user")) {
					User existingUser = adminSearchService
							.findByExistingUser(selectedFlaggedId);
					if (existingUser != null) {
						existingUser.setFlagdelete(true);
						baseServiceUser.update(existingUser);
					}
				}
				if (type.equals("profile")) {
					Profile existingProfile = adminSearchService
							.findByExistingProfile(selectedFlaggedId);
					if (existingProfile != null) {
						existingProfile.setFlagdelete(true);
						baseServiceProfile.update(existingProfile);
					}
				}
				if (type.equals("item")) {
					Item existingItem = adminSearchService
							.findByExistingItem(selectedFlaggedId);
					if (existingItem != null) {
						existingItem.setFlagdelete(true);
						baseServiceItem.update(existingItem);
					}
				}
				
				if (type.equals("Threads")) {
					GroupDiscussions existingGroupDiscussions = adminSearchService
							.findByExistingThreads(selectedFlaggedId);
					if (existingGroupDiscussions != null) {
						existingGroupDiscussions.setFlagdelete(true);
						baseServiceGroupDiscussions.update(existingGroupDiscussions);
					}
				}
				if (type.equals("Groups")) {
					Group existingGroups = adminSearchService
							.findByExistingGroups(selectedFlaggedId);
					if (existingGroups != null) {
						existingGroups.setFlagdelete(true);
						baseServiceGroups.update(existingGroups);
					}
				}
				
				
				
			}
		}
		return "success";

	}
	
	public String getFlagedData() {
		FlaggedTypes flaggedType=new FlaggedTypes();   
	    flaggedTypeList= flaggedTypeService.findAll(flaggedType);
		return "success";
	}

	public String getSelectedFlagList(String param, String strValue) {

		String id = param.substring(SELECTEDFLAGS.length(), param.length());
		return id;

	}

	public String getSelectedTableName() {
		return selectedTableName;
	}

	public void setSelectedTableName(String selectedTableName) {
		this.selectedTableName = selectedTableName;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public BaseService<User> getBaseServiceUsersList() {
		return baseServiceUsersList;
	}

	public void setBaseServiceUsersList(BaseService<User> baseServiceUsersList) {
		this.baseServiceUsersList = baseServiceUsersList;
	}

	public String getSearchName() {
		return searchName;
	}

	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}

	public AdminSearchService getAdminSearchService() {
		return adminSearchService;
	}

	public void setAdminSearchService(AdminSearchService adminSearchService) {
		this.adminSearchService = adminSearchService;
	}

	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}

	public BaseService<Profile> getBaseServiceProfilesList() {
		return baseServiceProfilesList;
	}

	public void setBaseServiceProfilesList(
			BaseService<Profile> baseServiceProfilesList) {
		this.baseServiceProfilesList = baseServiceProfilesList;
	}

	public List getListOfAllAdminData() {
		return listOfAllAdminData;
	}

	public void setListOfAllAdminData(List listOfAllAdminData) {
		this.listOfAllAdminData = listOfAllAdminData;
	}

	public BriefCase getBriefCase() {
		return briefCase;
	}

	public void setBriefCase(BriefCase briefCase) {
		this.briefCase = briefCase;
	}

	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

	public BaseService<Item> getBaseServiceBriefCaseItemList() {
		return baseServiceBriefCaseItemList;
	}

	public void setBaseServiceBriefCaseItemList(
			BaseService<Item> baseServiceBriefCaseItemList) {
		this.baseServiceBriefCaseItemList = baseServiceBriefCaseItemList;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public BaseService<FlagData> getFlagBaseService() {
		return flagBaseService;
	}

	public void setFlagBaseService(BaseService<FlagData> flagBaseService) {
		this.flagBaseService = flagBaseService;
	}

	public String getSelectedFlagName() {
		return selectedFlagName;
	}

	public void setSelectedFlagName(String selectedFlagName) {
		this.selectedFlagName = selectedFlagName;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public BaseService<User> getBaseServiceUser() {
		return baseServiceUser;
	}

	public void setBaseServiceUser(BaseService<User> baseServiceUser) {
		this.baseServiceUser = baseServiceUser;
	}

	public BaseService<Profile> getBaseServiceProfile() {
		return baseServiceProfile;
	}

	public void setBaseServiceProfile(BaseService<Profile> baseServiceProfile) {
		this.baseServiceProfile = baseServiceProfile;
	}

	public BaseService<Item> getBaseServiceItem() {
		return baseServiceItem;
	}

	public void setBaseServiceItem(BaseService<Item> baseServiceItem) {
		this.baseServiceItem = baseServiceItem;
	}

	public List getListOfAllFlaggedData() {
		return listOfAllFlaggedData;
	}

	public void setListOfAllFlaggedData(List listOfAllFlaggedData) {
		this.listOfAllFlaggedData = listOfAllFlaggedData;
	}

	public List getListOfAllFlaggedProfileData() {
		return listOfAllFlaggedProfileData;
	}

	public void setListOfAllFlaggedProfileData(List listOfAllFlaggedProfileData) {
		this.listOfAllFlaggedProfileData = listOfAllFlaggedProfileData;
	}

	public List getListOfAllFlaggedItemData() {
		return listOfAllFlaggedItemData;
	}

	public void setListOfAllFlaggedItemData(List listOfAllFlaggedItemData) {
		this.listOfAllFlaggedItemData = listOfAllFlaggedItemData;
	}

	public List<FlaggedInformation> getFlaggedInformationList() {
		return flaggedInformationList;
	}

	public void setFlaggedInformationList(
			List<FlaggedInformation> flaggedInformationList) {
		this.flaggedInformationList = flaggedInformationList;
	}

	public List<FlaggedInformation> getAdminflaggedInfoList() {
		return adminflaggedInfoList;
	}

	public void setAdminflaggedInfoList(
			List<FlaggedInformation> adminflaggedInfoList) {
		this.adminflaggedInfoList = adminflaggedInfoList;
	}

	public BaseService<GroupDiscussions> getBaseServiceGroupDiscussions() {
		return baseServiceGroupDiscussions;
	}

	public void setBaseServiceGroupDiscussions(
			BaseService<GroupDiscussions> baseServiceGroupDiscussions) {
		this.baseServiceGroupDiscussions = baseServiceGroupDiscussions;
	}

	public GroupDiscussions getGroupDiscussions() {
		return groupDiscussions;
	}

	public void setGroupDiscussions(GroupDiscussions groupDiscussions) {
		this.groupDiscussions = groupDiscussions;
	}

	public BaseService<Group> getBaseServiceGroups() {
		return baseServiceGroups;
	}

	public void setBaseServiceGroups(BaseService<Group> baseServiceGroups) {
		this.baseServiceGroups = baseServiceGroups;
	}

	public Group getGroup() {
		return group;
	}

	public void setGroup(Group group) {
		this.group = group;
	}

	public BaseService<FlaggedTypes> getFlaggedTypeService() {
		return flaggedTypeService;
	}

	public void setFlaggedTypeService(BaseService<FlaggedTypes> flaggedTypeService) {
		this.flaggedTypeService = flaggedTypeService;
	}

	public List getFlaggedTypeList() {
		return flaggedTypeList;
	}

	public void setFlaggedTypeList(List flaggedTypeList) {
		this.flaggedTypeList = flaggedTypeList;
	}

}
