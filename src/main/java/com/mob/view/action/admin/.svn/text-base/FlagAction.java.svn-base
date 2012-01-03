package com.mob.view.action.admin;

import java.util.Date;

import javax.servlet.jsp.tagext.TryCatchFinally;

import com.mob.model.FlagData;
import com.mob.model.User;
import com.mob.model.group.Group;
import com.mob.model.group.GroupDiscussions;
import com.mob.model.profile.Item;
import com.mob.model.profile.Profile;
import com.mob.services.AdminSearchService;
import com.mob.services.BaseService;
import com.opensymphony.xwork2.ActionSupport;

public class FlagAction extends ActionSupport {

	private BaseService<Item> baseServiceItem;
	private BaseService<GroupDiscussions> baseServiceGroupDiscussions;
	private AdminSearchService adminSearchService;
	private String flagItemId;
	private String flagComment;
	private FlagData flagData;
	private String type;
	private BaseService<FlagData> flagBaseService;
	private String selectedFlagTypeName;
	private BaseService<User> baseServiceUser;
	private String[] flagItemIds;
	private BaseService<Group> baseServiceGroups;
	private BaseService<Profile> baseServiceProfile;

	public String storeFlagComment() {

		System.out.println("storeFlagComment:-----");

		System.out.println(flagComment);
		Item existingItem = adminSearchService.findByExistingItem(flagItemId);
		if (existingItem != null) {
			existingItem.setFlagged(true);
			//existingItem.setFlagcomment(flagComment);
			baseServiceItem.update(existingItem);
		}
		FlagData flagData = new FlagData();
		flagData.setFlaggedDate(new Date(System.currentTimeMillis()));
		flagData.setFlaggedId(Integer.parseInt(flagItemId));
		flagData.setFlagComment(flagComment);
		flagData.setSelectedFlagType(selectedFlagTypeName);
		flagData.setType(type);
		flagBaseService.create(flagData);
		return "success";
	}

	public String storeFlagCommentForThreads() {
		System.out.println(flagItemId);
		System.out.println("TYPEEEEEEEEEEEEEEEEEEEEE" + type);
		GroupDiscussions existingGroupDiscussions = adminSearchService
				.findByExistingThreads(flagItemId);
		if (existingGroupDiscussions != null) {
			existingGroupDiscussions.setFlagged(true);
			//existingItem.setFlagcomment(flagComment);
			baseServiceGroupDiscussions.update(existingGroupDiscussions);
		}

		FlagData flagData = new FlagData();
		flagData.setFlaggedDate(new Date(System.currentTimeMillis()));
		flagData.setFlaggedId(Integer.parseInt(flagItemId));
		flagData.setFlagComment(flagComment);
		flagData.setSelectedFlagType(selectedFlagTypeName);
		flagData.setType(type);
		flagBaseService.create(flagData);
		return "success";
	}

	public String storeFlagCommentForAdmin() {
		
		if (type.equals("user")) {
			adminSearchService.UpdateUserFlaggedData(flagItemIds);
		}
		if (type.equals("profile")) {
			adminSearchService.UpdateProfileFlaggedData(flagItemIds);
		}
		if (type.equals("item")) {
			adminSearchService.UpdateItemFlaggedData(flagItemIds);
		}
		if (type.equals("Threads")) {
			adminSearchService.UpdateThreadsFlaggedData(flagItemIds);
		}
		if (type.equals("Groups")) {
			adminSearchService.UpdateGroupsFlaggedData(flagItemIds);
		}
		adminSearchService.storeFlagCommentForAllTypes(flagItemIds, type,
				flagComment, selectedFlagTypeName);
		return "success";
	}
	
	public void setFlagItemId(String flagItemId) {
		this.flagItemId = flagItemId;
	}

	public String getFlagComment() {
		return flagComment;
	}

	public void setFlagComment(String flagComment) {
		this.flagComment = flagComment;
	}

	public AdminSearchService getAdminSearchService() {
		return adminSearchService;
	}

	public void setAdminSearchService(AdminSearchService adminSearchService) {
		this.adminSearchService = adminSearchService;
	}

	public BaseService<Item> getBaseServiceItem() {
		return baseServiceItem;
	}

	public void setBaseServiceItem(BaseService<Item> baseServiceItem) {
		this.baseServiceItem = baseServiceItem;
	}

	public FlagData getFlagData() {
		return flagData;
	}

	public void setFlagData(FlagData flagData) {
		this.flagData = flagData;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public BaseService<FlagData> getFlagBaseService() {
		return flagBaseService;
	}

	public void setFlagBaseService(BaseService<FlagData> flagBaseService) {
		this.flagBaseService = flagBaseService;
	}

	public String getSelectedFlagTypeName() {
		return selectedFlagTypeName;
	}

	public void setSelectedFlagTypeName(String selectedFlagTypeName) {
		this.selectedFlagTypeName = selectedFlagTypeName;
	}

	public BaseService<GroupDiscussions> getBaseServiceGroupDiscussions() {
		return baseServiceGroupDiscussions;
	}

	public void setBaseServiceGroupDiscussions(
			BaseService<GroupDiscussions> baseServiceGroupDiscussions) {
		this.baseServiceGroupDiscussions = baseServiceGroupDiscussions;
	}

	public BaseService<User> getBaseServiceUser() {
		return baseServiceUser;
	}

	public void setBaseServiceUser(BaseService<User> baseServiceUser) {
		this.baseServiceUser = baseServiceUser;
	}

	public String[] getFlagItemIds() {
		return flagItemIds;
	}

	public void setFlagItemIds(String[] flagItemIds) {
		this.flagItemIds = flagItemIds;
	}

	public BaseService<Group> getBaseServiceGroups() {
		return baseServiceGroups;
	}

	public void setBaseServiceGroups(BaseService<Group> baseServiceGroups) {
		this.baseServiceGroups = baseServiceGroups;
	}

	public BaseService<Profile> getBaseServiceProfile() {
		return baseServiceProfile;
	}

	public void setBaseServiceProfile(BaseService<Profile> baseServiceProfile) {
		this.baseServiceProfile = baseServiceProfile;
	}

}
