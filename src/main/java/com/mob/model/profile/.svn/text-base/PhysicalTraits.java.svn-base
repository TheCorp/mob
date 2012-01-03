package com.mob.model.profile;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name="physicaltraits")
public class PhysicalTraits {
	private long id;
	private String height;
	private String measurements;
	private int weight;
	private int shoesize;
	private String build;
	private String haircolor;
	private String eyecolor;
	private String breastcupsize;
	private String ethnicity;
	private String others;
	private String additionalnotes;
	private Profile profileOwner;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="id")	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	@Column(name = "height")
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	@Column(name = "measurements")
	public String getMeasurements() {
		return measurements;
	}
	public void setMeasurements(String measurements) {
		this.measurements = measurements;
	}
	@Column(name = "weight")
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	@Column(name = "shoesize")
	public int getShoesize() {
		return shoesize;
	}
	public void setShoesize(int shoesize) {
		this.shoesize = shoesize;
	}
	@Column(name = "build")
	public String getBuild() {
		return build;
	}
	public void setBuild(String build) {
		this.build = build;
	}
	@Column(name = "haircolor")
	public String getHaircolor() {
		return haircolor;
	}
	public void setHaircolor(String haircolor) {
		this.haircolor = haircolor;
	}
	@Column(name = "eyecolor")
	public String getEyecolor() {
		return eyecolor;
	}
	public void setEyecolor(String eyecolor) {
		this.eyecolor = eyecolor;
	}
	@Column(name = "breastcupsize")
	public String getBreastcupsize() {
		return breastcupsize;
	}
	public void setBreastcupsize(String breastcupsize) {
		this.breastcupsize = breastcupsize;
	}
	@Column(name = "ethnicity")
	public String getEthnicity() {
		return ethnicity;
	}
	
	public void setEthnicity(String ethnicity) {
		this.ethnicity = ethnicity;
	}
	@Column(name = "others")
	public String getOthers() {
		return others;
	}
	public void setOthers(String others) {
		this.others = others;
	}
	@Column(name = "additionalnotes")
	public String getAdditionalnotes() {
		return additionalnotes;
	}
	public void setAdditionalnotes(String additionalnotes) {
		this.additionalnotes = additionalnotes;
	}
	
	@OneToOne
	@JoinColumn(name = "profile_id")
	public Profile getProfileOwner() {
		return profileOwner;
	}
	public void setProfileOwner(Profile profileOwner) {
		this.profileOwner = profileOwner;
	}
	
	
	
}
