package com.mob.model;

import com.mob.model.profile.Profile;
import org.acegisecurity.GrantedAuthority;
import org.acegisecurity.userdetails.UserDetails;

import javax.persistence.*;

import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "user")
@Inheritance(strategy = InheritanceType.JOINED)
public class User implements UserDetails {

    private Set<Profile> profiles = new HashSet<Profile>();
    private Set<Role> roles = new HashSet<Role>();
//    private Set<Group> groups = new HashSet<Group>();
    private Set<User> subscribers = new HashSet<User>();
  //  private Set<Contact> contacts = new HashSet<Contact>();

    private Contact contactName;

   // private Set<PrivacyGroup> privacyGroup = new HashSet<PrivacyGroup>();
    private long id;
    private String firstName;
    private String lastName;
    private String email;
    private String sex;
    private Date dob;
    private String password;
    private String address;
    private String city;
    private String state;
    private int positiveFeedbackCount;
    private int negativeFeedbackCount;
    private long age;
    private String fullName;
    private String zipcode;
    private String skypeId;
    private String displayName;
    private String picture;
    private String phoneNumber;
    private boolean flagged;
    private boolean flagdelete;
    private String flagcomment;
    private String address1;
    private String address2;
    private String missionstatement;
   // private  boolean checkDOBYR;
    
    @Column(name = "zipcode")
    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }

    @Transient
    public String getFullName() {
        return firstName + " " + lastName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }


    @Transient
    public long getAge() {
        Calendar dobCal = Calendar.getInstance();
        dobCal.setTime(this.getDob());
        Calendar curTime = Calendar.getInstance();
        curTime.setTimeInMillis(System.currentTimeMillis());

        long diff = System.currentTimeMillis()-dobCal.getTimeInMillis();
        long days = diff/(24*60*60*1000);
        age = days / 365;
        return age;
    }

//    public void setAge(int age) {
//        this.age = age;
//    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Transient
    public int getPositiveFeedbackCount() {
        return positiveFeedbackCount;
    }

    public void setPositiveFeedbackCount(int positiveFeedbackCount) {
        this.positiveFeedbackCount = positiveFeedbackCount;
    }

    @Transient
    public int getNegativeFeedbackCount() {
        return negativeFeedbackCount;
    }

    public void setNegativeFeedbackCount(int negativeFeedbackCount) {
        this.negativeFeedbackCount = negativeFeedbackCount;
    }

   // @OneToMany(targetEntity = Profile.class)
    @OneToMany(targetEntity = Profile.class, mappedBy = "profileOwner")
    public Set<Profile> getProfiles() {
        return profiles;
    }

    public void setProfiles(Set<Profile> profiles) {
        this.profiles = profiles;
    }

    @ManyToMany
    @JoinTable(name = "user_role",
            joinColumns = @JoinColumn(name = "user_id",
                    referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "role_id",
                    referencedColumnName = "id"))
    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }

   /* @ManyToMany
    @JoinTable(name = "group_members",
            joinColumns = {@JoinColumn(name = "member_id", referencedColumnName = "id")},
            inverseJoinColumns = {@JoinColumn(name = "group_id", referencedColumnName = "id")})

    public Set<Group> getGroups() {
        return groups;
    }

    public void setGroups(Set<Group> groups) {
        this.groups = groups;
    }*/

    @Transient
    public Set<User> getSubscribers() {
        return subscribers;
    }

    public void setSubscribers(Set<User> subscribers) {
        this.subscribers = subscribers;
    }

    @Column(name = "firstname")
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    @Column(name = "lastname")
    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    @Column(name = "username")
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Column(name = "sex")
    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    @Column(name = "dob")
    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    @Column(name = "password")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Column(name = "address")
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Column(name = "city")
    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    @Column(name = "state")
    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    @Transient
    public GrantedAuthority[] getAuthorities() {
        // TODO Auto-generated method stub
        return (GrantedAuthority[]) this.roles.toArray(new GrantedAuthority[0]);
    }

/* @Column(name="email")
 public String getUsername() {
     // TODO Auto-generated method stub
     return this.email;
 }*/

    @Transient
    public boolean isAccountNonExpired() {
        // TODO Auto-generated method stub
        return true;
    }

    @Transient
    public boolean isAccountNonLocked() {
        // TODO Auto-generated method stub
        return true;
    }

    @Transient
    public boolean isCredentialsNonExpired() {
        // TODO Auto-generated method stub
        return true;
    }

    @Transient
    public boolean isEnabled() {
        // TODO Auto-generated method stub
        return true;
    }

    @Transient
    public String getUsername() {
        // TODO Auto-generated method stub
        return this.email;
    }

  /*  @OneToMany
    @JoinColumn(name = "friendid")
    public Set<Contact> getContacts() {
        return contacts;
    }

    public void setContacts(Set<Contact> contacts) {
        this.contacts = contacts;
    }*/

    @Column(name = "skypeid")
    public String getSkypeId() {
        return skypeId;
    }

    public void setSkypeId(String skypeId) {
        this.skypeId = skypeId;
    }

   /* @OneToMany
    @JoinColumn(name = "user_id")
    public Set<PrivacyGroup> getPrivacyGroup() {
        return privacyGroup;
    }

    public void setPrivacyGroup(Set<PrivacyGroup> privacyGroup) {
        this.privacyGroup = privacyGroup;
    }*/


    @Transient
    public String getDisplayName() {
        return firstName;
    }

    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }

    public boolean equals(Object target) {
        if (this == target) {
            return true;
        }
        if (target instanceof User) {
            User targetUser = (User) target;
            if (id == targetUser.id) {
                return true;
            } else {
                return false;
            }
        }
        return false;
    }
    @Column(name="picture")
	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}
	@Column(name = "phonenumber")
	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
    
	@Column(name = "flagged")
	public boolean isFlagged() {
		return flagged;
	}

	public void setFlagged(boolean flagged) {
		this.flagged = flagged;
	}
	@Column(name = "flagdelete")
	public boolean isFlagdelete() {
		return flagdelete;
	}
	
	public void setFlagdelete(boolean flagdelete) {
		this.flagdelete = flagdelete;
	}

	@Column(name = "flagcomment")
	public String getFlagcomment() {
		return flagcomment;
	}
    
	public void setFlagcomment(String flagcomment) {
		this.flagcomment = flagcomment;
	}

	@Column(name = "address1")
	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	@Column(name = "address2")
	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	@Column(name = "missionstatement")
	public String getMissionstatement() {
		return missionstatement;
	}

	public void setMissionstatement(String missionstatement) {
		this.missionstatement = missionstatement;
	}

	/*@Column(name = "dobCheckYr")
	public boolean isCheckDOBYR() {
		return checkDOBYR;
	}

	public void setCheckDOBYR(boolean checkDOBYR) {
		this.checkDOBYR = checkDOBYR;
	}*/

}
