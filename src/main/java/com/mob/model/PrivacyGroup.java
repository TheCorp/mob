package com.mob.model;

import java.util.HashSet;
import java.util.Set;
import java.sql.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.mob.model.profile.Profile;

@Entity
@Table(name="privacygroup")
public class PrivacyGroup {
	
	private long id;
	private String name;
	private Date createdDate;
	private Profile profile;
	private Set<PrivateItems> privateItems = new HashSet<PrivateItems>();
	
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
	/*@ManyToOne
	@JoinColumn(name ="user_id")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}*/
	 @ManyToMany
	 @JoinTable(name="privateitems_has_privacygroup", 
	 joinColumns={@JoinColumn(name="privacygroup_id",referencedColumnName="id")}, 
	 inverseJoinColumns={@JoinColumn(name="privateItems_id",referencedColumnName="id")})
	public Set<PrivateItems> getPrivateItems() {
		return privateItems;
	}
	public void setPrivateItems(Set<PrivateItems> privateItems) {
		this.privateItems = privateItems;
	}

    public boolean equals(Object targetGroup){
        if(this==targetGroup){
            return true;
        }
        if(targetGroup instanceof PrivacyGroup){
            PrivacyGroup targetPrivacyGroup = (PrivacyGroup) targetGroup;
            if(this.name.equalsIgnoreCase(targetPrivacyGroup.name) &&
                    this.profile.equals(targetPrivacyGroup.profile)){
                return true;
            }else{
                return false;
            }
        }
        return false;
    }
    
    @Column(name="createddate")
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	
	@ManyToOne
	@JoinColumn(name ="profile_id")
	public Profile getProfile() {
		return profile;
	}
	public void setProfile(Profile profile) {
		this.profile = profile;
	}

}
