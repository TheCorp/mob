package com.mob.model.profile;



import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
@Entity
@Table(name="training ")
public class Training {
	
	
    private long id;
	private String name;
	
    private Profile trainingProfile;
    
    @Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}
    @Column(name="name") 
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	@ManyToOne
	@JoinColumn(name = "profile_id")
	public Profile getTrainingProfile() {
		return trainingProfile;
	}

	public void setTrainingProfile(Profile trainingProfile) {
		this.trainingProfile = trainingProfile;
	}	
    

}
