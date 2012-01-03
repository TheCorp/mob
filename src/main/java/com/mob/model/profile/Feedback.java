package com.mob.model.profile;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.mob.model.User;

@Entity
@Table(name = "feedback")
public class Feedback {

	
	private long    id;
	private boolean positive;
	private String  comment;
	private String  feedbackProviderDisplayName;
	private User    feedbackProvider;
	private Profile associatedProfile;
	private User    profileOwnerId;
	private String  feedbackType;
	private String feedbackProviderName;
	
	@ManyToOne
	@JoinColumn(name="profile_id")
	public Profile getAssociatedProfile() {
		return associatedProfile;
	}
	public void setAssociatedProfile(Profile associatedProfile) {
		this.associatedProfile = associatedProfile;
	}
	@Transient
	public String getFeedbackProviderDisplayName() {
		return feedbackProviderDisplayName;
	}
	public void setFeedbackProviderDisplayName(String feedbackProviderDisplayName) {
		this.feedbackProviderDisplayName = feedbackProviderDisplayName;
	}
	@OneToOne
	@JoinColumn(name="feedbackproviderid")
	public User getFeedbackProvider() {
		return feedbackProvider;
	}
	public void setFeedbackProvider(User feedbackProvider) {
		this.feedbackProvider = feedbackProvider;
	}
	@Transient
	public boolean isPositive() {
		return positive;
	}
	public void setPositive(boolean positive) {
		this.positive = positive;
	}
	@Column(name="description")
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	@ManyToOne
	@JoinColumn(name="user_id")
	public User getProfileOwnerId() {
		return profileOwnerId;
	}
	public void setProfileOwnerId(User profileOwnerId) {
		this.profileOwnerId = profileOwnerId;
	}
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	@Column(name="feedbacktype")
	public String getFeedbackType() {
		return feedbackType;
	}
	public void setFeedbackType(String feedbackType) {
		this.feedbackType = feedbackType;
	}
	
	@Column(name="feedbackprovidername")
	public String getFeedbackProviderName() {
		return feedbackProviderName;
	}
	public void setFeedbackProviderName(String feedbackProviderName) {
		this.feedbackProviderName = feedbackProviderName;
	}
}
