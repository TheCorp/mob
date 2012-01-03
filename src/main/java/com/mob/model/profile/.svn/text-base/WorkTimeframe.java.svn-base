package com.mob.model.profile;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name = "worktimeframe")
public class WorkTimeframe {
	
	private long id;
	private String worktimeframename;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	
	@Column(name="worktimeframename")
	public String getWorktimeframename() {
		return worktimeframename;
	}
	public void setWorktimeframename(String worktimeframename) {
		this.worktimeframename = worktimeframename;
	}
	

}
