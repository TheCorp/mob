package com.mob.model.profile;

import java.sql.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@org.hibernate.annotations.GenericGenerator(name="Briefcase",strategy="foreign",
      parameters={@org.hibernate.annotations.Parameter(name="property",value="briefCaseOwner")
}) 

@Entity
@Table(name="briefcase")
@PrimaryKeyJoinColumn(name="user_id")
public class BriefCase {

private Date created;
private Date lastupdated;
private Profile briefCaseOwner;
//private User briefCaseOwner;
private long id;

private long briefcaseViewCount;

private Set<Item> briefcaseItems = new HashSet<Item>();

   @Id
   @GeneratedValue(generator="Briefcase")
   @Column(name="user_id")
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }


	 @ManyToMany
	 @JoinTable(name="briefcase_item", 
	 joinColumns={@JoinColumn(name="briefcase_id",referencedColumnName="user_id")}, 
	 inverseJoinColumns={@JoinColumn(name="item_id",referencedColumnName="id")})
	public Set<Item> getBriefcaseItems(){
	return briefcaseItems;
	}
	
	public void setBriefcaseItems(Set<Item> briefcaseItems) {
	this.briefcaseItems = briefcaseItems;
	}
	
	@Column(name="created")
	public Date getCreated() {
	return created;
	}
	
	public void setCreated(Date created) {
	this.created = created;
	}
	
	@Column(name="lastupdated")
	public Date getLastupdated() {
	return lastupdated;
	}
	
	public void setLastupdated(Date lastupdated) {
	this.lastupdated = lastupdated;
	}

	@OneToOne
	@JoinColumn(name ="user_id")
	public Profile getBriefCaseOwner() {
		return briefCaseOwner;
	}

	public void setBriefCaseOwner(Profile briefCaseOwner) {
		this.briefCaseOwner = briefCaseOwner;
	}

	    @Column(name = "viewcount")
		public long getBriefcaseViewCount() {
			return briefcaseViewCount;
		}

		public void setBriefcaseViewCount(long briefcaseViewCount) {
			this.briefcaseViewCount = briefcaseViewCount;
		}
	
	
	/*@OneToOne
	@JoinColumn(name ="user_id")
	public User getBriefCaseOwner() {
	return briefCaseOwner;
	}
	
	public void setBriefCaseOwner(User briefCaseOwner) {
	this.briefCaseOwner = briefCaseOwner;
	}
	
*/


}