package com.mob.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
@Table(name = "flagged")
public class FlagData {
	
	private long id;
	private Date flaggedDate;
    private long flaggedId;
    private String type;
    private String flagComment;
    private String selectedFlagType;
    
    @Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	@Column(name = "flaggeddate")
	public Date getFlaggedDate() {
		return flaggedDate;
	}
	
	public void setFlaggedDate(Date flaggedDate) {
		this.flaggedDate = flaggedDate;
	}
	@Column(name = "flagedid")
	public long getFlaggedId() {
		return flaggedId;
	}
	public void setFlaggedId(long flaggedId) {
		this.flaggedId = flaggedId;
	}
	@Column(name = "type")
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Column(name = "flaggedcomment")
	public String getFlagComment() {
		return flagComment;
	}
	public void setFlagComment(String flagComment) {
		this.flagComment = flagComment;
	}
	public void setFlagType(String selectedFlagType) {
		// TODO Auto-generated method stub
		
	}
	@Column(name = "flagtype")
	public String getSelectedFlagType() {
		return selectedFlagType;
	}
	public void setSelectedFlagType(String selectedFlagType) {
		this.selectedFlagType = selectedFlagType;
	}

}
