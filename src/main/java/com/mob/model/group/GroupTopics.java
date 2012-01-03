package com.mob.model.group;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.mob.model.User;
 
@Entity
@Table(name="topicsusers")
public class GroupTopics {

	private User user;
	private Topics topics;
	private  long id;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	@OneToOne
	@JoinColumn(name = "userid")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}

	@OneToOne
	@JoinColumn(name = "topicsid")
	public Topics getTopics() {
		return topics;
	}

	public void setTopics(Topics topics) {
		this.topics = topics;
	}


}

