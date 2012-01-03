package com.mob.model.group;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.mob.model.profile.Profile;
import com.mob.service.amazon.impl.AmazonServiceImpl;

@Entity
@Table(name = "mobgroup")
public class Group {

	private long id;
	private String name;
	private String title;
	private String description;
	private String icon;
	private String resizedPicture;
	private Date createdDate;
	private boolean flagged;
	private boolean flagdelete;
	private File upload;

	// private Set<Profile> groupInvitation = new HashSet<Profile>();
	// private Set<Profile> groupUsers = new HashSet<Profile>();

	private List<Profile> groupInvitationProfiles = new ArrayList<Profile>();
	private List<Profile> groupUsersProfiles = new ArrayList<Profile>();
	private Profile profile;
	private Set<GroupAdmin> groupAdmin = new HashSet<GroupAdmin>();
	private long groupMember;
	private long groupPrivateMember;
	private List<String> urls = new ArrayList<String>();

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	@Column(name = "name")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "grouptype")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "description")
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "icon")
	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	// @ManyToOne
	// @JoinColumn(name = "profile_id")
	// public User getGroupUser() {
	// return groupUser;
	// }
	// public void setGroupUser(User groupUser) {
	// this.groupUser = groupUser;
	// }

	@Column(name = "createddate")
	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	/*
	 * @ManyToMany
	 * 
	 * @JoinTable(name = "groupinvitation", joinColumns = { @JoinColumn(name =
	 * "groupid", referencedColumnName = "id") }, inverseJoinColumns = {
	 * @JoinColumn(name = "profileid", referencedColumnName = "id") }) public
	 * Set<Profile> getGroupInvitation() { return groupInvitation; } public void
	 * setGroupInvitation(Set<Profile> groupInvitation) { this.groupInvitation =
	 * groupInvitation; }
	 * 
	 * @ManyToMany
	 * 
	 * @JoinTable(name = "groupusers", joinColumns = { @JoinColumn(name =
	 * "groupid", referencedColumnName = "id") }, inverseJoinColumns = {
	 * @JoinColumn(name = "profileid", referencedColumnName = "id") }) public
	 * Set<Profile> getGroupUsers() { return groupUsers; } public void
	 * setGroupUsers(Set<Profile> groupUsers) { this.groupUsers = groupUsers; }
	 */

	@ManyToMany
	@JoinTable(name = "groupinvitation", joinColumns = { @JoinColumn(name = "groupid", referencedColumnName = "id") }, inverseJoinColumns = { @JoinColumn(name = "profileid", referencedColumnName = "id") })
	public List<Profile> getGroupInvitationProfiles() {
		return groupInvitationProfiles;
	}

	public void setGroupInvitationProfiles(List<Profile> groupInvitationProfiles) {
		this.groupInvitationProfiles = groupInvitationProfiles;
	}

	@ManyToMany
	@JoinTable(name = "groupusers", joinColumns = { @JoinColumn(name = "groupid", referencedColumnName = "id") }, inverseJoinColumns = { @JoinColumn(name = "profileid", referencedColumnName = "id") })
	public List<Profile> getGroupUsersProfiles() {
		return groupUsersProfiles;
	}

	public void setGroupUsersProfiles(List<Profile> groupUsersProfiles) {
		this.groupUsersProfiles = groupUsersProfiles;
	}

	@ManyToOne
	@JoinColumn(name = "profile_id")
	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}

	@OneToMany
	@JoinColumn(name = "groupid")
	public Set<GroupAdmin> getGroupAdmin() {
		return groupAdmin;
	}

	public void setGroupAdmin(Set<GroupAdmin> groupAdmin) {
		this.groupAdmin = groupAdmin;
	}

	@Transient
	public long getGroupMember() {
		return groupMember;
	}

	public void setGroupMember(long groupMember) {
		this.groupMember = groupMember;
	}

	@Transient
	public long getGroupPrivateMember() {
		return groupPrivateMember;
	}

	public void setGroupPrivateMember(long groupPrivateMember) {
		this.groupPrivateMember = groupPrivateMember;
	}

	@Column(name = "resizedpicture")
	public String getResizedPicture() {
		return resizedPicture;
	}

	public void setResizedPicture(String resizedPicture) {
		this.resizedPicture = resizedPicture;
	}

	@Column(name = "flagged")
	public boolean isFlagged() {
		return flagged;
	}

	public void setFlagged(boolean flagged) {
		this.flagged = flagged;
	}

	@Column(name = "flagdelete")
	public boolean isFlagdelete() {
		return flagdelete;
	}

	public void setFlagdelete(boolean flagdelete) {
		this.flagdelete = flagdelete;
	}

	@Transient
	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	@Transient
	public List getAmazonFileURL() {
		if (icon != null) {
			urls.add(icon);
		}
		if (resizedPicture != null) {
			urls.add(resizedPicture);
		}
		return AmazonServiceImpl.getSignedUrl("mob_group", urls);
	}

	private String pictureAmazon;

	@Transient
	public String getPictureFromAmazon() {
		if (pictureAmazon != null || icon == null) {
			return icon;
		} else {
			List<String> url = new ArrayList<String>();
			url.add(icon);
			List<String> resPics = AmazonServiceImpl.getSignedUrl(
					"mob_group", url);
			if (resPics != null) {
				return resPics.get(0);
			} else {
				return null;
			}
		}
	}

	private String minPictureAmazon;

	@Transient
	public String getMinPictureFromAmazon() {
		if (minPictureAmazon != null || resizedPicture == null) {
			return minPictureAmazon;
		} else {
			List<String> url = new ArrayList<String>();
			url.add(resizedPicture);
			List<String> resMinPics = AmazonServiceImpl.getSignedUrl(
					"mob_group", url);
			if (resMinPics != null) {
				return resMinPics.get(0);
			} else {
				return null;
			}
		}
	}

}
