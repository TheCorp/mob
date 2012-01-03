package com.mob.model.profile;

import java.io.File;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
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
import javax.persistence.Transient;

import com.mob.service.amazon.impl.AmazonServiceImpl;

@Entity
@Table(name = "item")
public class Item {

    //private File briefcaseItem;

    private Set<BriefCase> briefCase = new HashSet<BriefCase>();
    private long id;
    private String videourl;
    private String audiourl;
    private String textFileurl;
    private String description;
    private String title;
    private String name;
    private String privacySetting;
    private String category;
    private String locationOfItem;
    private File itemFile;
    private String itemFileName;
    private List<String> urls = new ArrayList<String>();
    private Date createdDate;
    private Date modifiedDate;
    private boolean flagged;
    private String imageUrl;
    private boolean flagdelete;
    private String flagcomment;
    private String  itemURL;
    private String resizedImageURL;
    @Transient
    public List getAmazonFileURL() {
        if (audiourl != null) {
            urls.add(audiourl);
        }
        if (textFileurl != null) {
            urls.add(textFileurl);
        }
        if (imageUrl != null) {
            urls.add(imageUrl);
            urls.add(resizedImageURL);
        }
        return AmazonServiceImpl.getSignedUrl("mob_audio", urls);
    }

    @Transient
    public String getItemFileName() {
        return itemFileName;
    }
    
    public void setItemFileName(String itemFileName) {
        this.itemFileName = itemFileName;
    }

    @Transient
    public File getItemFile() {
        return this.itemFile;
    }

    public void setItemFile(File itemFile) {
        this.itemFile = itemFile;
    }

    /*@ManyToOne
    @JoinColumn(name = "profile_id")

    public File getBriefcaseItem() {
     return briefcaseItem;
    }

    public void setBriefcaseItem(File briefcaseItem) {
     this.briefcaseItem = briefcaseItem;
    }*/
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Column(name = "videourl")
    public String getVideourl() {
        return videourl;
    }

    public void setVideourl(String videourl) {
        this.videourl = videourl;
    }

    @Column(name = "audiourl")
    public String getAudiourl() {
        return audiourl;
    }

    public void setAudiourl(String audiourl) {
        this.audiourl = audiourl;
    }

    @Column(name = "textfileurl")
    public String getTextFileurl() {
        return textFileurl;
    }

    public void setTextFileurl(String textFileurl) {
        this.textFileurl = textFileurl;
    }

    @Column(name = "description")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Column(name = "title")
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column(name = "privacysetting")
    public String getPrivacySetting() {
        return privacySetting;
    }

    public void setPrivacySetting(String privacySetting) {
        this.privacySetting = privacySetting;
    }

    @Column(name = "category")
    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    @Column(name = "locationofitem")
    public String getLocationOfItem() {
        return locationOfItem;
    }

    public void setLocationOfItem(String locationOfItem) {
        this.locationOfItem = locationOfItem;
    }

    @ManyToMany
    @JoinTable(name = "briefcase_item",
            joinColumns = {@JoinColumn(name = "item_id", referencedColumnName = "id")},
            inverseJoinColumns = {@JoinColumn(name = "briefcase_id", referencedColumnName = "user_id")})
    public Set<BriefCase> getBriefCase() {
        return briefCase;
    }

    public void setBriefCase(Set<BriefCase> briefCase) {
        this.briefCase = briefCase;
    }


    @Transient
    public List<String> getUrls() {
        return urls;
    }

    public void setUrls(List<String> urls) {
        this.urls = urls;
    }

    @Column(name = "createdDate")
    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    @Column(name = "modifiedDate")
    public Date getModifiedDate() {
        return modifiedDate;
    }

    public void setModifiedDate(Date modifiedDate) {
        this.modifiedDate = modifiedDate;
    }

    @Column(name = "imageurl")
    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
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

	@Column(name = "url")
	public String getItemURL() {
		return itemURL;
	}

	public void setItemURL(String itemURL) {
		this.itemURL = itemURL;
	}

	@Column(name="resizedimageurl")
	public String getResizedImageURL() {
		return resizedImageURL;
	}
	public void setResizedImageURL(String resizedImageURL) {
		this.resizedImageURL = resizedImageURL;
	}
}