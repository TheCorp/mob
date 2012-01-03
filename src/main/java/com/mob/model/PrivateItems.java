package com.mob.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;



@Entity
@Table(name="privateitems")
public class PrivateItems {
	
	private long id;
	private String name;
	private Set<PrivacyGroup> privacyGroup = new HashSet<PrivacyGroup>();
	
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

	 @ManyToMany
	 @JoinTable(name="privateitems_has_privacygroup", 
	 joinColumns={@JoinColumn(name="privateItems_id",referencedColumnName="id")}, 
	 inverseJoinColumns={@JoinColumn(name="privacygroup_id",referencedColumnName="id")})
	public Set<PrivacyGroup> getPrivacyGroup() {
		return privacyGroup;
	}

	public void setPrivacyGroup(Set<PrivacyGroup> privacyGroup) {
		this.privacyGroup = privacyGroup;
	}

    public int hashCode() {
	        return new Long(this.id).hashCode();    //To change body of overridden methods use File | Settings | File Templates.
    }

    public boolean equals(Object obj) {
    	if(obj == this){
	        return true;
	    }
	    PrivateItems item = (PrivateItems)obj;
	    if(item.id == this.id){
	        return true;
	    }
	        return false;    //To change body of overridden methods use File | Settings | File Templates.
    }
}
