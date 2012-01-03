package com.mob.view.action.employee;

import com.mob.model.profile.BriefCase;
import com.mob.model.profile.Item;
import com.mob.model.profile.Profile;
import com.mob.services.SW3Sevice;

public class SW3EmployeeAction {
	
	private Profile profile;
	private BriefCase briefCase;
	private Item  item;
	
	private SW3Sevice sW3Sevice;
	
	public Profile getProfile() {
		return profile;
	}
	public void setProfile(Profile profile) {
		this.profile = profile;
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
	public SW3Sevice getSW3Sevice() {
		return sW3Sevice;
	}
	public void setSW3Sevice(SW3Sevice sevice) {
		sW3Sevice = sevice;
	}
	
	

}
