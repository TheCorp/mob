package com.mob.service.group.impl;

import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.Transparency;
import java.awt.image.BufferedImage;
import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;

import javax.imageio.ImageIO;

import org.acegisecurity.context.SecurityContextHolder;
import org.apache.struts2.ServletActionContext;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mob.dao.BaseDao;
import com.mob.dao.GroupMobDao;
import com.mob.dto.GroupMember;
import com.mob.group.service.GroupService;
import com.mob.model.Role;
import com.mob.model.RoleNames;
import com.mob.model.User;
import com.mob.model.group.Group;
import com.mob.model.group.GroupAdmin;
import com.mob.model.group.GroupDiscussions;
import com.mob.model.group.GroupJoinUsers;
import com.mob.model.group.GroupTopics;
import com.mob.model.group.Topics;
import com.mob.model.profile.Profile;
import com.mob.service.amazon.AmazonFile;
import com.mob.service.amazon.AmazonService;
import com.mob.services.BaseService;
import com.mob.services.MessagingService;
import com.mob.services.ProfileService;
import com.mob.services.impl.UserManagementServiceImpl;
import com.mob.util.FileUtil;
import com.mob.util.MOBLogger;

public class GroupServiceImpl implements GroupService {

	/**
	 * Logger for logging messages.
	 */

	private BaseDao<Group> groupDao;
	private BaseDao<Topics> topicsDao;
	private BaseService<Group> groupService;
	private BaseService<Topics> topicsService;
	private BaseDao<GroupTopics> groupTopicsDao;
	private ProfileService profileService;
	private GroupMobDao groupMobDao;
	private BaseDao<GroupJoinUsers> groupJoinUsersDao;
	private MessagingService messagingService;
	private Profile profile;
	private BaseDao<GroupDiscussions> groupDiscussionsDao;
	private BaseDao<Role> roleDao;
	private BaseDao<GroupAdmin> groupAdminDao;
	private List groupMemberProfileList;
	private List groupMemberInvitationList;
	private boolean checkAdmin;
	private GroupAdmin objGroupAdmin;
	private GroupAdmin objGroupOwner;
	private List<Group> listSerchGroupResults;
	private List<GroupDiscussions> listOfGroupDiscussions;

	private AmazonService  amazonService;
	private static final MOBLogger LOGGER = new MOBLogger(
			UserManagementServiceImpl.class);

	/**
	 * this method is used for saving group details.
	 */
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void createGroup(Group group, Profile profile, User user) {
		Profile existProfile = new Profile();

		GroupAdmin groupAdmin = new GroupAdmin();
		Role existRole = new Role();
		existRole.setName(RoleNames.ROLE_GROUPOWNER.name());
		existRole = groupMobDao.findGroupAdminRole(existRole.getName());
		existProfile = profileService.findByProfilePrimaryKey(existProfile,
				profile.getId());

		group.setProfile(existProfile);
		group.setCreatedDate(new Date(System.currentTimeMillis()));
		groupDao.save(group);
		/**
		 * used for saving group admin details.
		 */
		groupAdmin.setGroup(group);
		groupAdmin.setProfile(existProfile);
		groupAdmin.setRole(existRole);
		groupAdminDao.save(groupAdmin);

	}

	public void createTopics(Topics topics, Group group, User user) {
		// TODO Auto-generated method stub
		Topics topic = new Topics();
		Group existGroup = new Group();
		topic.setTopic(topics.getTopic());
		topic.setDescription(topics.getDescription());
		topic.setCreatedDate(new Date(System.currentTimeMillis()));
		existGroup = groupService.findByPrimaryKey(existGroup, group.getId());
		topic.setGroup(existGroup);
		// topic.setUser(user);
		topicsDao.save(topic);
	}

	/**
	 * this method is used for saving Join group details.
	 */

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void joinGroup(User user, Group group, Profile profile,
			String message) {
		Group existGroup = new Group();
		Profile existProfile = new Profile();
		existGroup = groupService.findByPrimaryKey(existGroup, group.getId());
		existProfile = profileService.findByProfilePrimaryKey(existProfile,
				profile.getId());
		existGroup = groupService.findByPrimaryKey(existGroup, group.getId());

		if (group.getTitle().equalsIgnoreCase("Public")) {
			existGroup.getGroupUsersProfiles().add(existProfile);
			groupDao.update(existGroup);
		} else {
			existGroup.getGroupInvitationProfiles().add(existProfile);
			groupDao.update(existGroup);

		}

	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void acceptJoinedGroupProfile(User user, Group group,
			Profile profile, String message) {
		Group existGroup = new Group();
		Profile existProfile = new Profile();
		existGroup = groupService.findByPrimaryKey(existGroup, group.getId());
		existProfile = profileService.findByProfilePrimaryKey(existProfile,
				profile.getId());
		existGroup = groupService.findByPrimaryKey(existGroup, group.getId());

		if (group.getTitle().equalsIgnoreCase("Public")) {
			existGroup.getGroupUsersProfiles().add(existProfile);
			groupDao.update(existGroup);
		} else {
			existGroup.getGroupInvitationProfiles().add(existProfile);
			groupDao.update(existGroup);

		}

	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void denyJoinedGroupProfile(User user, Group group, Profile profile,
			String message) {
		Group existGroup = new Group();
		Profile existProfile = new Profile();
		existGroup = groupService.findByPrimaryKey(existGroup, group.getId());
		existProfile = profileService.findByProfilePrimaryKey(existProfile,
				profile.getId());
		existGroup = groupService.findByPrimaryKey(existGroup, group.getId());

		if (group.getTitle().equalsIgnoreCase("Public")) {
			existGroup.getGroupUsersProfiles().add(existProfile);
			groupDao.update(existGroup);
		} else {
			existGroup.getGroupInvitationProfiles().add(existProfile);
			groupDao.update(existGroup);

		}

	}

	/**
	 * This method is used for saving topics details.
	 */
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public long saveTopics(Group group, Profile profile, User user,
			Topics objTopics) {
		// TODO Auto-generated method stub
		long latestTopicId;
		Group existGroup = new Group();
		Profile existProfile = new Profile();
		Topics existTopics = new Topics();
		GroupTopics groupTopics = new GroupTopics();
		existGroup = groupService.findByPrimaryKey(existGroup, group.getId());
		existProfile = profileService.findByProfilePrimaryKey(existProfile,
				profile.getId());
		objTopics.setCreatedDate(new Date(System.currentTimeMillis()));
		objTopics.setGroup(existGroup);
		objTopics.setProfile(existProfile);
		topicsDao.save(objTopics);
		existTopics = topicsService.findByPrimaryKey(existTopics, objTopics
				.getId());
		groupTopics.setTopics(existTopics);
		groupTopics.setUser(user);
		groupTopicsDao.save(groupTopics);
		latestTopicId = groupMobDao.findNewTopicsId(existGroup.getId());
		System.out.println("latestTopicId" + latestTopicId);
		return latestTopicId;

	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void saveGroupDiscussions(Profile profile, Topics topic,
			String discussion) {

		Profile existProfile = new Profile();
		Topics existtopic = new Topics();
		GroupDiscussions ObjDiscussions = new GroupDiscussions();
		existProfile = profileService.findByProfilePrimaryKey(existProfile,
				profile.getId());
		existtopic = topicsService.findByPrimaryKey(existtopic, topic.getId());
		ObjDiscussions.setDiscussions(discussion);
		ObjDiscussions.setProfile(existProfile);
		ObjDiscussions.setTopics(existtopic);
		ObjDiscussions.setCreatedDate(new Date(System.currentTimeMillis()));
		groupDiscussionsDao.save(ObjDiscussions);
	}

	public List<Group> findAllMyOwnGroups(User user) {

		return groupMobDao.findGroupsAsCreator(user);
	}

	public List<Group> findGroupOwnerList(long groupId) {

		return groupMobDao.findGroupOwnerProfile(groupId);

	}

	public List<GroupMember> findAllMyJoinedGroups(User user) {
		List<GroupMember> joinedGroupMembers = new ArrayList<GroupMember>();
		List<Group> joinedGroups = groupMobDao.findGroupsAsMember(user);
		boolean checkGroupAdmin;
		for (Group group : joinedGroups) {
			Iterator<Profile> profileList = group.getGroupUsersProfiles()
					.iterator();
			while (profileList.hasNext()) {
				GroupMember groupMember = new GroupMember();
				Profile profile = profileList.next();
				groupMember.setGroup(group);
				groupMember.setProfile(profile);
				checkGroupAdmin = groupMobDao.findGroupRoleAdmin(groupMember
						.getGroup().getId(), groupMember.getProfile().getId());
				objGroupOwner = groupMobDao.findProfileGroupOwnerRole(group
						.getId(), groupMember.getProfile().getId());
				if (objGroupOwner != null) {
					groupMember.setGroupOwner(objGroupOwner);
				}
				objGroupAdmin = groupMobDao.findProfileGroupRole(group.getId(),
						user.getId());
				if (objGroupAdmin != null) {
					groupMember.setGroupAdmin(objGroupAdmin);
					//	System.out.println("HI  group admin role +++++++++++++++++"+objGroupAdmin.getRole().getId());
				}
				groupMember.setAdmin(checkGroupAdmin);
				joinedGroupMembers.add(groupMember);
			}
		}

		return joinedGroupMembers;

	}

	public List<Topics> findAllGroupTopics(long groupId) {

		List<Topics> listOfGroupTopics = new ArrayList<Topics>();
		listOfGroupTopics = groupMobDao.findAllGroupTopics(groupId);
		return listOfGroupTopics;
	}
	

	public List<GroupDiscussions> findAllGroupDiscussions(long topicId) {

		listOfGroupDiscussions = groupMobDao.findAllGroupDiscussions(topicId);
		return listOfGroupDiscussions;
	}

	
	public Topics findAllGroupTopicInfo(long topicId) {
			return groupMobDao.findAllGroupTopicInfo(topicId);
	}


	
	public List<Profile> findAllGroupUsers(long groupId) {
		List<GroupJoinUsers> listOfGroupJoinProfiles = new ArrayList<GroupJoinUsers>();
		List<Profile> listOfGroupJoinUsers = new ArrayList<Profile>();
		// List<Profile> listAllOfGroupJoinUsers=new ArrayList<Profile>();
		listOfGroupJoinProfiles = groupMobDao.findAllGroupProfiles(groupId);
		Iterator iterator = listOfGroupJoinProfiles.iterator();
		while (iterator.hasNext()) {
			GroupJoinUsers groupJoinUsers = (GroupJoinUsers) iterator.next();
			listOfGroupJoinUsers = groupMobDao.findAllGroupUsers(groupJoinUsers
					.getProfile().getId());

		}

		return listOfGroupJoinUsers;
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void acceptGroupRequest(Profile profile, long groupId) {
		// TODO Auto-generated method stub
		Group existGroup = new Group();
		Profile existProfile = new Profile();
		existGroup = groupService.findByPrimaryKey(existGroup, groupId);
		existProfile = profileService.findByProfilePrimaryKey(existProfile,
				profile.getId());
		existGroup.getGroupUsersProfiles().add(existProfile);
		groupDao.update(existGroup);
		existGroup.getGroupInvitationProfiles().remove(existProfile);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void denyGroupRequest(Profile profile, long groupId) {
		// TODO Auto-generated method stub
		Group existGroup = new Group();
		Profile existProfile = new Profile();
		existGroup = groupService.findByPrimaryKey(existGroup, groupId);
		existProfile = profileService.findByProfilePrimaryKey(existProfile,
				profile.getId());
		existGroup.getGroupInvitationProfiles().remove(existProfile);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void makeGroupAdmin(Profile profile, Role role, long groupId) {
		// TODO Auto-generated method stub
		GroupAdmin groupAdmin = new GroupAdmin();
		role = new Role();
		Group existGroup = new Group();
		Role existRole = new Role();
		role.setName(RoleNames.ROLE_GROUPADMIN.name());
		existRole = groupMobDao.findGroupAdminRole(role.getName());
		existGroup = groupService.findByPrimaryKey(existGroup, groupId);

		groupAdmin.setRole(existRole);
		groupAdmin.setProfile(profile);
		groupAdmin.setGroup(existGroup);
		groupAdminDao.save(groupAdmin);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void makeGroupOwner(Profile profile, Role role, long groupId) {
		// TODO Auto-generated method stub
		GroupAdmin groupAdmin = new GroupAdmin();
		role = new Role();
		Group existGroup = new Group();
		Role existRole = new Role();
		role.setName(RoleNames.ROLE_GROUPOWNER.name());
		existRole = groupMobDao.findGroupAdminRole(role.getName());
		existGroup = groupService.findByPrimaryKey(existGroup, groupId);

		groupAdmin.setRole(existRole);
		groupAdmin.setProfile(profile);
		groupAdmin.setGroup(existGroup);
		groupAdminDao.save(groupAdmin);

	}

	public List<GroupMember> findGroupMembersList(long groupId) {
		// TODO Auto-generated method stub
		User user = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		Group existGroupForUsers = new Group();
		GroupMember groupMember;
		groupMemberProfileList = new ArrayList();
		existGroupForUsers = groupService.findByPrimaryKey(existGroupForUsers,
				groupId);
		if (existGroupForUsers.getGroupUsersProfiles().size() != 0) {
			Iterator<Profile> it = existGroupForUsers.getGroupUsersProfiles()
					.iterator();
			while (it.hasNext()) {
				// Get element
				groupMember = new GroupMember();
				groupMember.setProfile(it.next());
				checkAdmin = groupMobDao.findGroupRoleAdmin(groupId,
						groupMember.getProfile().getId());
				groupMember.setAdmin(checkAdmin);
				objGroupAdmin = groupMobDao.findProfileGroupRole(groupId, user
						.getId());
				objGroupOwner = groupMobDao.findProfileGroupOwnerRole(groupId,
						groupMember.getProfile().getId());
				if (objGroupAdmin != null) {
					groupMember.setGroupAdmin(objGroupAdmin);
				}
				if (objGroupOwner != null) {
					groupMember.setGroupOwner(objGroupOwner);
					//groupMember.setJoinGroupMember(0);
				}
				if (objGroupOwner.getRole() == null)
					groupMember.setJoinGroupMember(1);

				groupMemberProfileList.add(groupMember);
			}
		}
		return groupMemberProfileList;
	}

	public List<GroupMember> findGroupInvitationList(long groupId) {

		User user = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		Group existGroupForInvitation = new Group();
		GroupMember groupMember;
		groupMemberInvitationList = new ArrayList();
		existGroupForInvitation = groupService.findByPrimaryKey(
				existGroupForInvitation, groupId);
		if (existGroupForInvitation.getGroupInvitationProfiles().size() != 0) {
			Iterator<Profile> it = existGroupForInvitation
					.getGroupInvitationProfiles().iterator();
			while (it.hasNext()) {
				// Get element
				groupMember = new GroupMember();
				groupMember.setProfile(it.next());
				checkAdmin = groupMobDao.findGroupRoleAdmin(groupId,
						groupMember.getProfile().getId());
				groupMember.setAdmin(checkAdmin);
				objGroupAdmin = groupMobDao.findProfileGroupRole(groupId, user
						.getId());
				objGroupOwner = groupMobDao.findProfileGroupOwnerRole(groupId,
						groupMember.getProfile().getId());
				if (objGroupAdmin != null) {
					groupMember.setGroupAdmin(objGroupAdmin);
				}
				if (objGroupOwner != null) {
					groupMember.setGroupOwner(objGroupOwner);
				}

				groupMemberInvitationList.add(groupMember);
			}
		}
		return groupMemberInvitationList;
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void removeGroupAdmin(Profile profile, long groupId) {
		// TODO Auto-generated method stub
		GroupAdmin groupAdmin = new GroupAdmin();
		Group existGroup = new Group();
		existGroup = groupService.findByPrimaryKey(existGroup, groupId);
		groupAdmin = groupMobDao.findGroupAdminRole(groupId, profile.getId());
		if (groupAdmin != null) {
			groupAdminDao.delete(groupAdmin);
		}

	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void removeGroupOwner(Profile profile, long groupId) {
		// TODO Auto-generated method stub
		GroupAdmin groupAdmin = new GroupAdmin();
		Group existGroup = new Group();
		existGroup = groupService.findByPrimaryKey(existGroup, groupId);
		groupAdmin = groupMobDao.findGroupAdminRole(groupId, profile.getId());
		if (groupAdmin != null) {
			groupAdminDao.delete(groupAdmin);
		}
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void deleteJoinGroupMembers(Profile profile, long groupId) {
		// TODO Auto-generated method stub
		Group existGroup = new Group();
		Profile existProfile = new Profile();
		existGroup = groupService.findByPrimaryKey(existGroup, groupId);
		existProfile = profileService.findByProfilePrimaryKey(existProfile,
				profile.getId());
		existGroup.getGroupUsersProfiles().remove(existProfile);

	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void deleteGroup(long groupId) {
		// TODO Auto-generated method stub
		Group existGroup = new Group();
		existGroup = groupDao.findByPrimaryKey(existGroup, groupId);
		groupDao.delete(existGroup);

	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void updateGroupDetails(Group group, String picturePath,
			String pictureName,String uploadContentType) {
		Group existGroup = new Group();
		existGroup = groupDao.findByPrimaryKey(existGroup, group.getId());
		if (existGroup != null) {
			existGroup.setName(group.getName());
			existGroup.setTitle(group.getTitle());
			existGroup.setDescription(group.getDescription());
			existGroup.setProfile(group.getProfile());
			existGroup.setCreatedDate(group.getCreatedDate());
			groupDao.update(existGroup);
		}

		if (!pictureName.equals("")) {

			updateGroupPicture(existGroup,group, picturePath, pictureName,uploadContentType);
		} else {

		}

	}

	public void updateGroupPicture(Group group, String picture,
			String uploadFileName) {
		int maxWidth = 200;
		int maxHeight = 400;
		Group existGroup = new Group();
		existGroup = groupDao.findByPrimaryKey(existGroup, group.getId());
		// TODO Auto-generated method stub
		File upload = new File(picture);

		try {
			BufferedImage image = ImageIO.read(new File(picture));
			BufferedImage resizedImage = ResizedImageUtil.resizeImage(image);
			String profileDir = ServletActionContext.getServletContext()
					.getRealPath("/profile/group/");
			File userProfileDir = new File(profileDir, "min_"
					+ new Long(group.getId()).toString());
			if (!userProfileDir.exists()) {
				userProfileDir.mkdir();
			}
			File theFile = new File(userProfileDir, uploadFileName);
			//File file = new File( theFile , ".png");
			ImageIO.write(resizedImage, "png", theFile);

			try {
			} catch (Exception e) {
				if (userProfileDir.exists()) {
					userProfileDir.delete();
				}
				throw new RuntimeException(e);

			}

			existGroup
					.setResizedPicture("/profile/group/" + "min_"
							+ new Long(group.getId()).toString() + "/"
							+ uploadFileName);

		} catch (Exception e) {
			e.printStackTrace();
		}

		String profileDir = ServletActionContext.getServletContext()
				.getRealPath("/profile/group/");
		File userProfileDir = new File(profileDir, "max_"
				+ new Long(group.getId()).toString());
		if (!userProfileDir.exists()) {
			userProfileDir.mkdir();
		}
		File theFile = new File(userProfileDir, uploadFileName);

		try {
			FileUtil.saveFile(upload, theFile.getAbsolutePath());
		} catch (Exception e) {
			if (userProfileDir.exists()) {
				userProfileDir.delete();
			}
			

		}

		existGroup.setIcon("/profile/group/" + "max_"
				+ new Long(group.getId()).toString() + "/" + uploadFileName);
		this.groupDao.update(existGroup);

	}
	
	
	
	@Transactional(propagation = Propagation.REQUIRED,
			readOnly = false)
		public void updateGroupPicture(Group existGroup,Group group, String picture,
			String uploadFileName,String uploadContentType) {
		File upload = new File(picture);
		System.out.println("profile" +group.getUpload());
		List<AmazonFile> fileList = new ArrayList<AmazonFile>();
		//List keys; = amazonService.storeFiles(fileList);
		GregorianCalendar calendar = new  GregorianCalendar();
		String strFilename = uploadFileName;
		System.out.println("file being uploaded is"+strFilename);
		int index = strFilename.lastIndexOf(".");
		String temp = strFilename.substring(0, index);
		String ext = strFilename.substring(index);

		strFilename = temp+"_"+group.getId()+ext;
		System.out.println("unique name for file"+strFilename);
		File renamedFile = new File(strFilename);
		boolean isRenamed = false;
		try {
			isRenamed = upload.renameTo(renamedFile);
		} catch (RuntimeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("e.getMessage" +e.getMessage());
		}
		LOGGER.info("content type in impl : " + uploadContentType);
		System.out.println("content type in impl : " + uploadContentType);
		//create amazon file object to upload the file
		AmazonFile awsFile = new AmazonFile();
		awsFile.setBucketName("mob_group");
		if(isRenamed){
			awsFile.setFileObject(renamedFile);
			awsFile.setFileName(strFilename);
			fileList.add(awsFile);
		}
		List keys = amazonService.updateFiles(fileList);
		System.out.println("file list size" + fileList.size());

		if (keys.size() != 0) {
			if (uploadContentType.contains("image")) {
				System.out.println("keys.get(0).toString()" +keys.get(0).toString());

				try {
					File midsizeFile = new File("mid_" + strFilename);
					BufferedImage image = ImageIO.read(renamedFile);
					BufferedImage resizedImage = ResizedImageUtil.resizeImage(image);
					ImageIO.write(resizedImage, "png", midsizeFile);

					AmazonFile awsFile1 = new AmazonFile();
					awsFile1.setBucketName("mob_group");
					awsFile1.setFileObject(midsizeFile);
					awsFile1.setFileName("mid_" + strFilename);
					fileList.add(awsFile1);
					keys=amazonService.updateFiles(fileList);

				} catch (Exception e) {
					e.printStackTrace();
				}

			/*	try {
					File minsizeFile = new File("min_" + strFilename);
					BufferedImage image = ImageIO.read(renamedFile);
					BufferedImage resizedImage = ResizedImageUtil.resizeToSamllImage(image);
					ImageIO.write(resizedImage, "png", minsizeFile);

					AmazonFile awsFile2 = new AmazonFile();
					awsFile2.setBucketName("mob_profile");
					awsFile2.setFileObject(minsizeFile);
					awsFile2.setFileName("min_" + strFilename);
					fileList.add(awsFile2);
					keys=amazonService.updateFiles(fileList);

				} catch (Exception e) {
					e.printStackTrace();
				}

*/

				//profile.setPicture(keys.get(0).toString());//right now storing image in picture column
			} 

			existGroup.setIcon(keys.get(0).toString());
			existGroup.setResizedPicture(keys.get(1).toString());
			//group.setResizedMinPicture(keys.get(2).toString());


			this.groupService.update(existGroup);
		}
	}	



	public List<GroupMember> findAllMyJoinedPrivateGroups(User user) {
		List<GroupMember> joinedGroupMembers = new ArrayList<GroupMember>();
		List<Group> joinedPrivateGroups = groupMobDao
				.findPrivateGroupsAsMember(user);
		boolean checkGroupAdmin;
		for (Group group : joinedPrivateGroups) {
			Iterator<Profile> profileList = group.getGroupInvitationProfiles()
					.iterator();
			while (profileList.hasNext()) {
				GroupMember groupMember = new GroupMember();
				Profile profile = profileList.next();
				groupMember.setGroup(group);
				groupMember.setProfile(profile);
				checkGroupAdmin = groupMobDao.findGroupRoleAdmin(groupMember
						.getGroup().getId(), groupMember.getProfile().getId());
				groupMember.setAdmin(checkGroupAdmin);
				objGroupOwner = groupMobDao.findProfileGroupOwnerRole(group
						.getId(), groupMember.getProfile().getId());
				if (objGroupOwner != null) {
					groupMember.setGroupOwner(objGroupOwner);
				}

				joinedGroupMembers.add(groupMember);
			}
		}
		return joinedGroupMembers;

	}

	public BaseDao<Group> getGroupDao() {
		return groupDao;
	}

	public void setGroupDao(BaseDao<Group> groupDao) {
		this.groupDao = groupDao;
	}

	public BaseService<Group> getGroupService() {
		return groupService;
	}

	public void setGroupService(BaseService<Group> groupService) {
		this.groupService = groupService;
	}

	public BaseDao<Topics> getTopicsDao() {
		return topicsDao;
	}

	public void setTopicsDao(BaseDao<Topics> topicsDao) {
		this.topicsDao = topicsDao;
	}

	public BaseService<Topics> getTopicsService() {
		return topicsService;
	}

	public void setTopicsService(BaseService<Topics> topicsService) {
		this.topicsService = topicsService;
	}

	public BaseDao<GroupTopics> getGroupTopicsDao() {
		return groupTopicsDao;
	}

	public void setGroupTopicsDao(BaseDao<GroupTopics> groupTopicsDao) {
		this.groupTopicsDao = groupTopicsDao;
	}

	public void checkForExistingGroup(Group group) {
		// TODO Auto-generated method stub

	}

	public ProfileService getProfileService() {
		return profileService;
	}

	public void setProfileService(ProfileService profileService) {
		this.profileService = profileService;
	}

	public GroupMobDao getGroupMobDao() {
		return groupMobDao;
	}

	public void setGroupMobDao(GroupMobDao groupMobDao) {
		this.groupMobDao = groupMobDao;
	}

	public BaseDao<GroupJoinUsers> getGroupJoinUsersDao() {
		return groupJoinUsersDao;
	}

	public void setGroupJoinUsersDao(BaseDao<GroupJoinUsers> groupJoinUsersDao) {
		this.groupJoinUsersDao = groupJoinUsersDao;
	}

	public MessagingService getMessagingService() {
		return messagingService;
	}

	public void setMessagingService(MessagingService messagingService) {
		this.messagingService = messagingService;
	}

	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}

	public BaseDao<GroupDiscussions> getGroupDiscussionsDao() {
		return groupDiscussionsDao;
	}

	public void setGroupDiscussionsDao(
			BaseDao<GroupDiscussions> groupDiscussionsDao) {
		this.groupDiscussionsDao = groupDiscussionsDao;
	}

	public BaseDao<Role> getRoleDao() {
		return roleDao;
	}

	public void setRoleDao(BaseDao<Role> roleDao) {
		this.roleDao = roleDao;
	}

	public BaseDao<GroupAdmin> getGroupAdminDao() {
		return groupAdminDao;
	}

	public void setGroupAdminDao(BaseDao<GroupAdmin> groupAdminDao) {
		this.groupAdminDao = groupAdminDao;
	}

	public List getGroupMemberProfileList() {
		return groupMemberProfileList;
	}

	public void setGroupMemberProfileList(List groupMemberProfileList) {
		this.groupMemberProfileList = groupMemberProfileList;
	}

	public boolean isCheckAdmin() {
		return checkAdmin;
	}

	public void setCheckAdmin(boolean checkAdmin) {
		this.checkAdmin = checkAdmin;
	}

	public List<Group> getListSerchGroupResults() {
		return listSerchGroupResults;
	}

	public void setListSerchGroupResults(List<Group> listSerchGroupResults) {
		this.listSerchGroupResults = listSerchGroupResults;
	}

	public List<GroupDiscussions> getListOfGroupDiscussions() {
		return listOfGroupDiscussions;
	}

	public void setListOfGroupDiscussions(
			List<GroupDiscussions> listOfGroupDiscussions) {
		this.listOfGroupDiscussions = listOfGroupDiscussions;
	}

	public GroupAdmin getObjGroupAdmin() {
		return objGroupAdmin;
	}

	public void setObjGroupAdmin(GroupAdmin objGroupAdmin) {
		this.objGroupAdmin = objGroupAdmin;
	}

	public GroupAdmin getObjGroupOwner() {
		return objGroupOwner;
	}

	public void setObjGroupOwner(GroupAdmin objGroupOwner) {
		this.objGroupOwner = objGroupOwner;
	}

	public List getGroupMemberInvitationList() {
		return groupMemberInvitationList;
	}

	public void setGroupMemberInvitationList(List groupMemberInvitationList) {
		this.groupMemberInvitationList = groupMemberInvitationList;
	}

	private static BufferedImage resize(BufferedImage image, int width,
			int height) {
		BufferedImage resizedImage = new BufferedImage(width, height,
				BufferedImage.TYPE_INT_ARGB);
		Graphics2D g = resizedImage.createGraphics();
		g.drawImage(image, 0, 0, width, height, null);
		g.dispose();
		return resizedImage;
	}

	public AmazonService getAmazonService() {
		return amazonService;
	}

	public void setAmazonService(AmazonService amazonService) {
		this.amazonService = amazonService;
	}



}
