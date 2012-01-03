package com.mob.services.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.transaction.Synchronization;

import org.hibernate.Query;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mob.dao.AdminSearchDao;
import com.mob.model.FlagData;
import com.mob.model.FlaggedInformation;
import com.mob.model.User;
import com.mob.model.group.Group;
import com.mob.model.group.GroupDiscussions;
import com.mob.model.group.Topics;
import com.mob.model.profile.Item;
import com.mob.model.profile.Profile;
import com.mob.services.AdminSearchService;
import com.mob.services.BaseService;

public class AdminSearchServiceImpl implements AdminSearchService {

	private AdminSearchDao adminSearchDao;
	private BaseService<User> baseServiceUser;
	private BaseService<FlagData> flagBaseService;
	private BaseService<Item> baseServiceItem;
	private BaseService<GroupDiscussions> baseServiceGroupDiscussions;
	private BaseService<Group> baseServiceGroups;
	private BaseService<Profile> baseServiceProfile;
	private User existingUser;

	public List<User> findByUserName(String searchName) {
		return adminSearchDao.findByUserName(searchName);
	}

	public AdminSearchDao getAdminSearchDao() {
		return adminSearchDao;
	}

	public void setAdminSearchDao(AdminSearchDao adminSearchDao) {
		this.adminSearchDao = adminSearchDao;
	}

	public List<Profile> findByProfileName(String searchName) {
		// TODO Auto-generated method stub
		return adminSearchDao.findByProfileName(searchName);
	}

	public FlagData findExistingFlagData(String selectedFlaggedId, String type) {
		// TODO Auto-generated method stub
		return adminSearchDao.findExistingFlagData(selectedFlaggedId, type);
	}

	public User findByExistingUser(String selectedFlaggedId) {

		return adminSearchDao.findByExistingUser(selectedFlaggedId);
	}

	public Profile findByExistingProfile(String selectedFlaggedId) {

		return adminSearchDao.findByExistingProfile(selectedFlaggedId);
	}

	public Item findByExistingItem(String selectedFlaggedId) {

		return adminSearchDao.findByExistingItem(selectedFlaggedId);
	}

	public GroupDiscussions findByExistingThreads(String selectedFlaggedId) {
		return adminSearchDao.findByExistingThreads(selectedFlaggedId);
	}

	public Group findByExistingGroups(String selectedFlaggedId) {
		return adminSearchDao.findByExistingGroups(selectedFlaggedId);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void UpdateUserFlaggedData(String[] flagItemIds) {
		
		try {
			
			for (int i = 0; i < flagItemIds.length; i++) {
				 existingUser = adminSearchDao
						.findByExistingUser(flagItemIds[i]);
				if (existingUser != null) {
					existingUser.setFlagged(true);
					existingUser.setId(existingUser.getId());
					 baseServiceUser.update(existingUser);
				//	adminSearchDao.UpdateUserFlaggedData(existingUser);
				}
			}
				for (int j = 0; j < flagItemIds.length; j++) {
					FlagData flagData = new FlagData();
					flagData.setFlaggedDate(new Date(System.currentTimeMillis()));
					flagData.setFlaggedId(Integer.parseInt(flagItemIds[j]));
					flagData.setFlagComment("Satya");
					flagData.setSelectedFlagType("sa");
					flagData.setType("user");
					flagBaseService.create(flagData);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void UpdateProfileFlaggedData(String[] flagItemIds) {
		try {
			for (int i = 0; i < flagItemIds.length; i++) {
				Profile existingProfile = adminSearchDao
						.findByExistingProfile(flagItemIds[i]);
				if (existingProfile != null) {
					existingProfile.setFlagged(true);
					baseServiceProfile.update(existingProfile);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void UpdateItemFlaggedData(String[] flagItemIds) {
		try {
			for (int i = 0; i < flagItemIds.length; i++) {
				Item existingItem = adminSearchDao
						.findByExistingItem(flagItemIds[i]);

				if (existingItem != null) {
					existingItem.setFlagged(true);
					baseServiceItem.update(existingItem);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void UpdateThreadsFlaggedData(String[] flagItemIds) {
		try {
			for (int i = 0; i < flagItemIds.length; i++) {
				GroupDiscussions existingGroupDiscussions = adminSearchDao
						.findByExistingThreads(flagItemIds[i]);
				if (existingGroupDiscussions != null) {
					existingGroupDiscussions.setFlagged(true);
					baseServiceGroupDiscussions.update(existingGroupDiscussions);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void UpdateGroupsFlaggedData(String[] flagItemIds) {
		try {
			for (int i = 0; i < flagItemIds.length; i++) {
				Group existingGroups = adminSearchDao
						.findByExistingGroups(flagItemIds[i]);
				if (existingGroups != null) {
					existingGroups.setFlagged(true);
					baseServiceGroups.update(existingGroups);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		
			}
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void storeFlagCommentForAllTypes(String[] flagItemIds,
			String type, String flagComment, String selectedFlagTypeName) {
		try {
			for (int i = 0; i < flagItemIds.length; i++) {
				FlagData flagData = new FlagData();
				flagData.setFlaggedDate(new Date(System.currentTimeMillis()));
				flagData.setFlaggedId(Integer.parseInt(flagItemIds[i]));
				flagData.setFlagComment(flagComment);
				flagData.setSelectedFlagType(selectedFlagTypeName);
				flagData.setType(type);
				flagBaseService.create(flagData);
			}	
		} catch (Exception e) {
			e.printStackTrace();
			}
	}

	public List<FlaggedInformation> getAllAdminFlaggedData(
			String selectedTableName, String searchByName) {

		List<FlaggedInformation> flaggedInformationList = null;

		if (selectedTableName.equals("user")) {

			if (searchByName.equals("")) {
				List<User> listOfAllFlaggedUsers = adminSearchDao
						.findAllAdminFlaggedUser(selectedTableName);
				flaggedInformationList = new ArrayList<FlaggedInformation>();
				for (User user : listOfAllFlaggedUsers) {
					List<String> comments = new ArrayList<String>();
					List<String> catgoryTypes = new ArrayList<String>();

					FlaggedInformation flaggedInformation = new FlaggedInformation();
					flaggedInformation.setUser(user);
					List<FlagData> flagDataList = adminSearchDao
							.findCommentsForFlaggedUser(user, selectedTableName);
					for (FlagData flagData : flagDataList) {
						String comment = new String();
						String flagCatogoryType = new String();
						comment = flagData.getFlagComment();
						comments.add(comment);
						catgoryTypes.add(flagCatogoryType);
					}
					flaggedInformation.setComments(comments);
					flaggedInformationList.add(flaggedInformation);
					flaggedInformation.setFlaggedCategoryType(catgoryTypes);
				}

			} else {
				List<User> listOfAllFlaggedUsers = adminSearchDao
						.findByAdminFlaggedUserName(searchByName);
				flaggedInformationList = new ArrayList<FlaggedInformation>();
				for (User user : listOfAllFlaggedUsers) {
					List<String> comments = new ArrayList<String>();
					List<String> catgoryTypes = new ArrayList<String>();
					FlaggedInformation flaggedInformation = new FlaggedInformation();
					flaggedInformation.setUser(user);
					List<FlagData> flagDataList = adminSearchDao
							.findCommentsForFlaggedUser(user, selectedTableName);
					for (FlagData flagData : flagDataList) {
						String comment = new String();
						String flagCatogoryType = new String();
						comment = flagData.getFlagComment();
						flagCatogoryType = flagData.getSelectedFlagType();
						comments.add(comment);
						catgoryTypes.add(flagCatogoryType);
					}
					flaggedInformation.setComments(comments);
					flaggedInformation.setFlaggedCategoryType(catgoryTypes);
					flaggedInformationList.add(flaggedInformation);

				}
			}
		} else if (selectedTableName.equals("profile")) {
			if (searchByName.equals("")) {
				List<Profile> listOfAllFlaggedProfiles = adminSearchDao
						.findAllAdminFlaggedProfile(selectedTableName);
				flaggedInformationList = new ArrayList<FlaggedInformation>();

				for (Profile profile : listOfAllFlaggedProfiles) {
					List<String> comments = new ArrayList<String>();
					List<String> catgoryTypes = new ArrayList<String>();
					FlaggedInformation flaggedInformation = new FlaggedInformation();
					flaggedInformation.setProfile(profile);
					List<FlagData> flagDataList = adminSearchDao
							.findCommentsForFlaggedProfile(profile,
									selectedTableName);
					for (FlagData flagData : flagDataList) {
						String comment = new String();
						String flagCatogoryType = new String();
						comment = flagData.getFlagComment();
						flagCatogoryType = flagData.getSelectedFlagType();
						comments.add(comment);
						catgoryTypes.add(flagCatogoryType);
					}
					flaggedInformation.setComments(comments);
					flaggedInformation.setFlaggedCategoryType(catgoryTypes);
					flaggedInformationList.add(flaggedInformation);

				}

			} else {
				List<Profile> listOfAllProfiles = adminSearchDao
						.findByAdminFlaggedProfilName(searchByName);
				flaggedInformationList = new ArrayList<FlaggedInformation>();
				for (Profile newProfile : listOfAllProfiles) {
					List<String> comments = new ArrayList<String>();
					List<String> catgoryTypes = new ArrayList<String>();
					FlaggedInformation flaggedInformation = new FlaggedInformation();
					flaggedInformation.setProfile(newProfile);
					List<FlagData> flagDataList = adminSearchDao
							.findCommentsForFlaggedProfile(newProfile,
									selectedTableName);
					for (FlagData flagData : flagDataList) {
						String comment = new String();
						String flagCatogoryType = new String();

						comment = flagData.getFlagComment();
						flagCatogoryType = flagData.getSelectedFlagType();
						comments.add(comment);
						catgoryTypes.add(flagCatogoryType);

					}
					flaggedInformation.setComments(comments);
					flaggedInformation.setFlaggedCategoryType(catgoryTypes);
					flaggedInformationList.add(flaggedInformation);

				}
			}

		} else {
			if (selectedTableName.equals("item")) {
				if (searchByName.equals("")) {
					List<Item> listOfAllFlaggedItems = adminSearchDao
							.findAllAdminFlaggedItems(selectedTableName);

					flaggedInformationList = new ArrayList<FlaggedInformation>();
					for (Item item : listOfAllFlaggedItems) {
						List<String> comments = new ArrayList<String>();
						List<String> catgoryTypes = new ArrayList<String>();
						FlaggedInformation flaggedInformation = new FlaggedInformation();
						flaggedInformation.setItem(item);
						List<FlagData> flagDataList = adminSearchDao
								.findCommentsForFlaggedItem(item,
										selectedTableName);
						for (FlagData flagData : flagDataList) {
							String comment = new String();
							String flagCatogoryType = new String();
							comment = flagData.getFlagComment();
							flagCatogoryType = flagData.getSelectedFlagType();
							System.out.println(flagData.getSelectedFlagType());
							comments.add(comment);
							catgoryTypes.add(flagCatogoryType);
						}
						flaggedInformation.setComments(comments);
						flaggedInformation.setFlaggedCategoryType(catgoryTypes);
						flaggedInformationList.add(flaggedInformation);
					}

				} else {
					List<Item> listOfAllItems = adminSearchDao
							.findByAdminFlaggedItemTitle(searchByName);
					flaggedInformationList = new ArrayList<FlaggedInformation>();
					for (Item newItem : listOfAllItems) {
						List<String> comments = new ArrayList<String>();
						List<String> catgoryTypes = new ArrayList<String>();
						FlaggedInformation flaggedInformation = new FlaggedInformation();
						flaggedInformation.setItem(newItem);
						List<FlagData> flagDataList = adminSearchDao
								.findCommentsForFlaggedItem(newItem,
										selectedTableName);
						for (FlagData flagData : flagDataList) {
							String comment = new String();
							String flagCatogoryType = new String();

							comment = flagData.getFlagComment();
							flagCatogoryType = flagData.getSelectedFlagType();
							comments.add(comment);
							catgoryTypes.add(flagCatogoryType);

						}
						flaggedInformation.setComments(comments);
						flaggedInformation.setFlaggedCategoryType(catgoryTypes);
						flaggedInformationList.add(flaggedInformation);
					}

				}

			}
		}

		if (selectedTableName.equals("Threads")) {
			if (searchByName.equals("")) {
				List<GroupDiscussions> listOfAllFlaggedThreads = adminSearchDao
						.findAllAdminFlaggedThreads(selectedTableName);

				flaggedInformationList = new ArrayList<FlaggedInformation>();
				for (GroupDiscussions groupDiscussions : listOfAllFlaggedThreads) {
					List<String> comments = new ArrayList<String>();
					List<String> catgoryTypes = new ArrayList<String>();
					FlaggedInformation flaggedInformation = new FlaggedInformation();
					flaggedInformation.setGroupDiscussions(groupDiscussions);
					List<FlagData> flagDataList = adminSearchDao
							.findCommentsForFlaggedThreads(groupDiscussions,
									selectedTableName);
					for (FlagData flagData : flagDataList) {
						String comment = new String();
						String flagCatogoryType = new String();
						comment = flagData.getFlagComment();
						flagCatogoryType = flagData.getSelectedFlagType();
						System.out.println(flagData.getSelectedFlagType());
						comments.add(comment);
						catgoryTypes.add(flagCatogoryType);
					}
					flaggedInformation.setComments(comments);
					flaggedInformation.setFlaggedCategoryType(catgoryTypes);
					flaggedInformationList.add(flaggedInformation);
				}

			} else {
				List<GroupDiscussions> listOfAllItems = adminSearchDao
						.findByAdminFlaggedThreadTitle(searchByName);
				flaggedInformationList = new ArrayList<FlaggedInformation>();
				for (GroupDiscussions newThread : listOfAllItems) {
					List<String> comments = new ArrayList<String>();
					List<String> catgoryTypes = new ArrayList<String>();
					FlaggedInformation flaggedInformation = new FlaggedInformation();
					flaggedInformation.setGroupDiscussions(newThread);
					List<FlagData> flagDataList = adminSearchDao
							.findCommentsForFlaggedThread(newThread,
									selectedTableName);
					for (FlagData flagData : flagDataList) {
						String comment = new String();
						String flagCatogoryType = new String();

						comment = flagData.getFlagComment();
						flagCatogoryType = flagData.getSelectedFlagType();
						comments.add(comment);
						catgoryTypes.add(flagCatogoryType);

					}
					flaggedInformation.setComments(comments);
					flaggedInformation.setFlaggedCategoryType(catgoryTypes);
					flaggedInformationList.add(flaggedInformation);
				}

			}

		}
		if (selectedTableName.equals("Groups")) {
			if (searchByName.equals("")) {
				List<Group> listOfAllFlaggedGroups = adminSearchDao
						.findAllAdminFlaggedGroups(selectedTableName);

				flaggedInformationList = new ArrayList<FlaggedInformation>();
				for (Group group : listOfAllFlaggedGroups) {
					List<String> comments = new ArrayList<String>();
					List<String> catgoryTypes = new ArrayList<String>();
					FlaggedInformation flaggedInformation = new FlaggedInformation();
					flaggedInformation.setGroup(group);
					List<FlagData> flagDataList = adminSearchDao
							.findCommentsForFlaggedGroups(group,
									selectedTableName);
					for (FlagData flagData : flagDataList) {
						String comment = new String();
						String flagCatogoryType = new String();
						comment = flagData.getFlagComment();
						flagCatogoryType = flagData.getSelectedFlagType();
						System.out.println(flagData.getSelectedFlagType());
						comments.add(comment);
						catgoryTypes.add(flagCatogoryType);
					}
					flaggedInformation.setComments(comments);
					flaggedInformation.setFlaggedCategoryType(catgoryTypes);
					flaggedInformationList.add(flaggedInformation);
				}

			} else {
				List<Group> listOfAllGroups = adminSearchDao
						.findByAdminFlaggedGroupsTitle(searchByName);
				flaggedInformationList = new ArrayList<FlaggedInformation>();
				for (Group newGroup : listOfAllGroups) {
					List<String> comments = new ArrayList<String>();
					List<String> catgoryTypes = new ArrayList<String>();
					FlaggedInformation flaggedInformation = new FlaggedInformation();
					flaggedInformation.setGroup(newGroup);
					List<FlagData> flagDataList = adminSearchDao
							.findCommentsForFlaggedGroups(newGroup,
									selectedTableName);
					for (FlagData flagData : flagDataList) {
						String comment = new String();
						String flagCatogoryType = new String();

						comment = flagData.getFlagComment();
						flagCatogoryType = flagData.getSelectedFlagType();
						comments.add(comment);
						catgoryTypes.add(flagCatogoryType);

					}
					flaggedInformation.setComments(comments);
					flaggedInformation.setFlaggedCategoryType(catgoryTypes);
					flaggedInformationList.add(flaggedInformation);
				}

			}

		}

		return flaggedInformationList;
	}

	public List<FlaggedInformation> getAllFlaggedData(String selectedTableName,
			String searchByName) {

		List<FlaggedInformation> flaggedInformationList = null;
		List<GroupDiscussions> TopicrepliesList = new ArrayList<GroupDiscussions>();
		
		if (selectedTableName.equals("user")) {

			if (searchByName.equals("")) {
				// Find All flagged Users
				List<User> listOfAllFlaggedUsers = adminSearchDao
						.findAllFlaggedUser();

				flaggedInformationList = new ArrayList<FlaggedInformation>();
				for (User user : listOfAllFlaggedUsers) {
					List<String> comments = new ArrayList<String>();
					List<String> catgoryTypes = new ArrayList<String>();
					FlaggedInformation flaggedInformation = new FlaggedInformation();
					flaggedInformation.setUser(user);
					List<FlagData> flagDataList = adminSearchDao
							.findCommentsForFlaggedUser(user, selectedTableName);
					for (FlagData flagData : flagDataList) {
						String comment = new String();
						String flagCatogoryType = new String();
						flagCatogoryType = flagData.getSelectedFlagType();
						comment = flagData.getFlagComment();
						catgoryTypes.add(flagCatogoryType);
						comments.add(comment);
					}
					flaggedInformation.setComments(comments);
					flaggedInformation.setFlaggedCategoryType(catgoryTypes);
					flaggedInformationList.add(flaggedInformation);

				}
			} else {

				List<User> listOfAllFlaggedUsers = adminSearchDao
						.findByFlaggedUserName(searchByName);
				flaggedInformationList = new ArrayList<FlaggedInformation>();
				for (User user : listOfAllFlaggedUsers) {
					List<String> comments = new ArrayList<String>();
					FlaggedInformation flaggedInformation = new FlaggedInformation();
					List<String> catgoryTypes = new ArrayList<String>();

					flaggedInformation.setUser(user);
					List<FlagData> flagDataList = adminSearchDao
							.findCommentsForFlaggedUser(user, selectedTableName);
					for (FlagData flagData : flagDataList) {
						String comment = new String();
						String flagCatogoryType = new String();
						comment = flagData.getFlagComment();
						flagCatogoryType = flagData.getSelectedFlagType();
						comments.add(comment);
						catgoryTypes.add(flagCatogoryType);
					}
					flaggedInformation.setComments(comments);
					flaggedInformation.setFlaggedCategoryType(catgoryTypes);
					flaggedInformationList.add(flaggedInformation);

				}

			}

		} else if (selectedTableName.equals("profile")) {

			if (searchByName.equals("")) {

				List<Profile> listOfAllProfiles = adminSearchDao
						.findAllFlaggedProfiles();
				flaggedInformationList = new ArrayList<FlaggedInformation>();
				List<String> catgoryTypes = new ArrayList<String>();
				for (Profile newProfile : listOfAllProfiles) {
					List<String> comments = new ArrayList<String>();
					FlaggedInformation flaggedInformation = new FlaggedInformation();
					flaggedInformation.setProfile(newProfile);
					List<FlagData> flagDataList = adminSearchDao
							.findCommentsForFlaggedProfile(newProfile,
									selectedTableName);
					for (FlagData flagData : flagDataList) {
						String comment = new String();
						String flagCatogoryType = new String();
						comment = flagData.getFlagComment();
						flagCatogoryType = flagData.getSelectedFlagType();
						comments.add(comment);
						catgoryTypes.add(flagCatogoryType);
					}
					flaggedInformation.setComments(comments);
					flaggedInformation.setFlaggedCategoryType(catgoryTypes);
					flaggedInformationList.add(flaggedInformation);

				}
			} else {

				List<Profile> listOfAllProfiles = adminSearchDao
						.findByFlaggedProfilName(searchByName);
				flaggedInformationList = new ArrayList<FlaggedInformation>();
				for (Profile newProfile : listOfAllProfiles) {
					List<String> comments = new ArrayList<String>();
					List<String> catgoryTypes = new ArrayList<String>();
					FlaggedInformation flaggedInformation = new FlaggedInformation();
					flaggedInformation.setProfile(newProfile);
					List<FlagData> flagDataList = adminSearchDao
							.findCommentsForFlaggedProfile(newProfile,
									selectedTableName);
					for (FlagData flagData : flagDataList) {
						String comment = new String();
						String flagCatogoryType = new String();
						comment = flagData.getFlagComment();
						flagCatogoryType = flagData.getSelectedFlagType();
						comments.add(comment);
						catgoryTypes.add(flagCatogoryType);

					}
					flaggedInformation.setComments(comments);
					flaggedInformation.setFlaggedCategoryType(catgoryTypes);
					flaggedInformationList.add(flaggedInformation);

				}

			}

		} else {
			if (selectedTableName.equals("item")) {
				if (searchByName.equals("")) {

					List<Item> listOfAllItems = adminSearchDao
							.findAllFlaggedItems();
					flaggedInformationList = new ArrayList<FlaggedInformation>();

					for (Item newItem : listOfAllItems) {
						List<String> comments = new ArrayList<String>();
						List<String> catgoryTypes = new ArrayList<String>();

						FlaggedInformation flaggedInformation = new FlaggedInformation();
						flaggedInformation.setItem(newItem);
						List<FlagData> flagDataList = adminSearchDao
								.findCommentsForFlaggedItem(newItem,
										selectedTableName);
						for (FlagData flagData : flagDataList) {
							String comment = new String();

							String flagCatogoryType = new String();
							comment = flagData.getFlagComment();
							flagCatogoryType = flagData.getSelectedFlagType();

							comments.add(comment);
							catgoryTypes.add(flagCatogoryType);

						}
						flaggedInformation.setComments(comments);
						flaggedInformation.setFlaggedCategoryType(catgoryTypes);
						flaggedInformationList.add(flaggedInformation);

					}
				} else {

					List<Item> listOfAllItems = adminSearchDao
							.findByFlaggedItemTitle(searchByName);
					flaggedInformationList = new ArrayList<FlaggedInformation>();
					List<String> catgoryTypes = new ArrayList<String>();
					for (Item newItem : listOfAllItems) {
						List<String> comments = new ArrayList<String>();
						FlaggedInformation flaggedInformation = new FlaggedInformation();
						flaggedInformation.setItem(newItem);
						List<FlagData> flagDataList = adminSearchDao
								.findCommentsForFlaggedItem(newItem,
										selectedTableName);
						for (FlagData flagData : flagDataList) {
							String comment = new String();
							String flagCatogoryType = new String();

							comment = flagData.getFlagComment();
							flagCatogoryType = flagData.getSelectedFlagType();

							comments.add(comment);
							catgoryTypes.add(flagCatogoryType);
							flaggedInformation
									.setFlaggedCategoryType(catgoryTypes);

						}
						flaggedInformation.setComments(comments);
						flaggedInformation.setFlaggedCategoryType(catgoryTypes);
						flaggedInformationList.add(flaggedInformation);

					}

				}
			}
		}
		if (selectedTableName.equals("Threads")) {
			if (searchByName.equals("")) {

				List<GroupDiscussions> listOfAllGroupDiscussions = adminSearchDao
						.findAllGroupDiscussions();
				flaggedInformationList = new ArrayList<FlaggedInformation>();

				for (GroupDiscussions newGroupDiscussions : listOfAllGroupDiscussions) {
					List<String> comments = new ArrayList<String>();
					List<String> catgoryTypes = new ArrayList<String>();

					FlaggedInformation flaggedInformation = new FlaggedInformation();
					flaggedInformation.setGroupDiscussions(newGroupDiscussions);
					List<FlagData> flagDataList = adminSearchDao
							.findCommentsForFlaggedGroupDiscussions(
									newGroupDiscussions, selectedTableName);
					for (FlagData flagData : flagDataList) {
						String comment = new String();

						String flagCatogoryType = new String();
						comment = flagData.getFlagComment();
						flagCatogoryType = flagData.getSelectedFlagType();

						comments.add(comment);
						catgoryTypes.add(flagCatogoryType);

					}
					flaggedInformation.setComments(comments);
					flaggedInformation.setFlaggedCategoryType(catgoryTypes);
					flaggedInformationList.add(flaggedInformation);

				}
			} else {

				List<GroupDiscussions> listOfAllGroupDiscussions = adminSearchDao
						.findByFlaggedGroupDiscussionsTitle(searchByName);
				flaggedInformationList = new ArrayList<FlaggedInformation>();
				List<String> catgoryTypes = new ArrayList<String>();
				for (GroupDiscussions newGroupDiscussions : listOfAllGroupDiscussions) {
					List<String> comments = new ArrayList<String>();
					FlaggedInformation flaggedInformation = new FlaggedInformation();
					flaggedInformation.setGroupDiscussions(newGroupDiscussions);
					List<FlagData> flagDataList = adminSearchDao
							.findCommentsForFlaggedGroupDiscussions(
									newGroupDiscussions, selectedTableName);
					for (FlagData flagData : flagDataList) {
						String comment = new String();
						String flagCatogoryType = new String();

						comment = flagData.getFlagComment();
						flagCatogoryType = flagData.getSelectedFlagType();

						comments.add(comment);
						catgoryTypes.add(flagCatogoryType);
						flaggedInformation.setFlaggedCategoryType(catgoryTypes);

					}
					flaggedInformation.setComments(comments);
					flaggedInformation.setFlaggedCategoryType(catgoryTypes);
					flaggedInformationList.add(flaggedInformation);

				}

			}
		}
		if (selectedTableName.equals("Groups")) {
			if (searchByName.equals("")) {

				List<Group> listOfAllGroups = adminSearchDao.findAllGroups();
				flaggedInformationList = new ArrayList<FlaggedInformation>();

				for (Group newGroups : listOfAllGroups) {
					List<String> comments = new ArrayList<String>();
					List<String> catgoryTypes = new ArrayList<String>();

					FlaggedInformation flaggedInformation = new FlaggedInformation();
					flaggedInformation.setGroup(newGroups);
					List<FlagData> flagDataList = adminSearchDao
							.findCommentsForFlaggedGroups(newGroups,
									selectedTableName);
					for (FlagData flagData : flagDataList) {
						String comment = new String();

						String flagCatogoryType = new String();
						comment = flagData.getFlagComment();
						flagCatogoryType = flagData.getSelectedFlagType();

						comments.add(comment);
						catgoryTypes.add(flagCatogoryType);

					}
					flaggedInformation.setComments(comments);
					flaggedInformation.setFlaggedCategoryType(catgoryTypes);
					flaggedInformationList.add(flaggedInformation);

				}
			} else {

				List<Group> listOfAllGroups = adminSearchDao
						.findByFlaggedGroups(searchByName);
				flaggedInformationList = new ArrayList<FlaggedInformation>();
				List<String> catgoryTypes = new ArrayList<String>();
				for (Group newGroups : listOfAllGroups) {
					List<String> comments = new ArrayList<String>();
					FlaggedInformation flaggedInformation = new FlaggedInformation();
					flaggedInformation.setGroup(newGroups);
					List<FlagData> flagDataList = adminSearchDao
							.findCommentsForFlaggedGroups(newGroups,
									selectedTableName);
					for (FlagData flagData : flagDataList) {
						String comment = new String();
						String flagCatogoryType = new String();

						comment = flagData.getFlagComment();
						flagCatogoryType = flagData.getSelectedFlagType();

						comments.add(comment);
						catgoryTypes.add(flagCatogoryType);
						flaggedInformation.setFlaggedCategoryType(catgoryTypes);
					}
					flaggedInformation.setComments(comments);
					flaggedInformation.setFlaggedCategoryType(catgoryTypes);
					flaggedInformationList.add(flaggedInformation);

				}

			}
		}
		if (selectedTableName.equals("TopicReplies")) {
			if (searchByName.equals("")) {

				List<Topics> listOfAllTopicReplies = adminSearchDao
						.findAllTopicReplies();
				flaggedInformationList = new ArrayList<FlaggedInformation>();
				for (Topics topics : listOfAllTopicReplies) {
					List<GroupDiscussions> listOfAllDiscussions = adminSearchDao
							.findPostReplies(topics.getId());
					TopicrepliesList.addAll(listOfAllDiscussions);
				}

				for (GroupDiscussions groupDiscussions : TopicrepliesList) {
					List<String> comments = new ArrayList<String>();
					List<String> catgoryTypes = new ArrayList<String>();

					FlaggedInformation flaggedInformation = new FlaggedInformation();
					flaggedInformation.setGroupDiscussions(groupDiscussions);
					List<FlagData> flagDataList = adminSearchDao
							.findCommentsForFlaggedTopicReplies(
									groupDiscussions, selectedTableName);
					for (FlagData flagData : flagDataList) {
						String comment = new String();

						String flagCatogoryType = new String();
						comment = flagData.getFlagComment();
						flagCatogoryType = flagData.getSelectedFlagType();

						comments.add(comment);
						catgoryTypes.add(flagCatogoryType);

					}
					flaggedInformation.setComments(comments);
					flaggedInformation.setFlaggedCategoryType(catgoryTypes);
					flaggedInformationList.add(flaggedInformation);

				}
			} else {

				List<Topics> listOfAllTopicReplies = adminSearchDao
						.findByFlaggedTopicReplies(searchByName);
				for (Topics topics : listOfAllTopicReplies) {
					List<GroupDiscussions> listOfAllDiscussions = adminSearchDao
							.findPostReplies(topics.getId());
					TopicrepliesList.addAll(listOfAllDiscussions);
				}

				flaggedInformationList = new ArrayList<FlaggedInformation>();
				List<String> catgoryTypes = new ArrayList<String>();
				for (GroupDiscussions groupDiscussions : TopicrepliesList) {
					List<String> comments = new ArrayList<String>();
					FlaggedInformation flaggedInformation = new FlaggedInformation();
					flaggedInformation.setGroupDiscussions(groupDiscussions);
					List<FlagData> flagDataList = adminSearchDao
							.findCommentsForFlaggedTopicReplies(
									groupDiscussions, selectedTableName);
					for (FlagData flagData : flagDataList) {
						String comment = new String();
						String flagCatogoryType = new String();

						comment = flagData.getFlagComment();
						flagCatogoryType = flagData.getSelectedFlagType();

						comments.add(comment);
						catgoryTypes.add(flagCatogoryType);
						flaggedInformation.setFlaggedCategoryType(catgoryTypes);
					}
					flaggedInformation.setComments(comments);
					flaggedInformation.setFlaggedCategoryType(catgoryTypes);
					flaggedInformationList.add(flaggedInformation);

				}

			}
		}

		return flaggedInformationList;
	}

	public BaseService<User> getBaseServiceUser() {
		return baseServiceUser;
	}

	public void setBaseServiceUser(BaseService<User> baseServiceUser) {
		this.baseServiceUser = baseServiceUser;
	}

	public BaseService<FlagData> getFlagBaseService() {
		return flagBaseService;
	}

	public void setFlagBaseService(BaseService<FlagData> flagBaseService) {
		this.flagBaseService = flagBaseService;
	}

	public BaseService<Item> getBaseServiceItem() {
		return baseServiceItem;
	}

	public void setBaseServiceItem(BaseService<Item> baseServiceItem) {
		this.baseServiceItem = baseServiceItem;
	}

	public BaseService<GroupDiscussions> getBaseServiceGroupDiscussions() {
		return baseServiceGroupDiscussions;
	}

	public void setBaseServiceGroupDiscussions(
			BaseService<GroupDiscussions> baseServiceGroupDiscussions) {
		this.baseServiceGroupDiscussions = baseServiceGroupDiscussions;
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

	public User getExistingUser() {
		return existingUser;
	}

	public void setExistingUser(User existingUser) {
		this.existingUser = existingUser;
	}

}
