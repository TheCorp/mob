package com.mob.news.model;

import com.mob.model.User;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by IntelliJ IDEA.
 * User: ezone
 * Date: Mar 12, 2009
 * Time: 11:13:19 AM
 * To change this template use File | Settings | File Templates.
 */
@Entity
@Table(name = "news")
public class News {

    private long id;
    private String news;
    private User newsOwner;
    private Date createdDate;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public String getNews() {
        return news;
    }

    public void setNews(String news) {
        this.news = news;
    }

    @ManyToOne
    @JoinColumn(name = "news_owner_id", referencedColumnName = "id")
    public User getNewsOwner() {
        return newsOwner;
    }

    public void setNewsOwner(User newsOwner) {
        this.newsOwner = newsOwner;
    }
}
