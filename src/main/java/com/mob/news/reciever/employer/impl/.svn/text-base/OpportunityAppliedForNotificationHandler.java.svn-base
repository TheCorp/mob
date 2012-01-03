package com.mob.news.reciever.employer.impl;

import com.mob.dao.BaseDao;
import com.mob.dao.OpportunityDao;
import com.mob.model.User;
import com.mob.model.employer.Employer;
import com.mob.model.employer.Opportunity;
import com.mob.model.profile.EmployerProfile;
import com.mob.model.profile.Profile;
import com.mob.news.EmployerNotification;
import com.mob.news.Messages;
import com.mob.news.model.News;
import com.mob.news.reciever.UserNews;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: ezone
 * Date: Mar 14, 2009
 * Time: 12:52:02 PM
 * To change this template use File | Settings | File Templates.
 */
public class OpportunityAppliedForNotificationHandler extends BaseEmployerNotificationHandler {


    private BaseDao<User> userDao;
    private BaseDao<Opportunity> opportunityBaseDao;
    private BaseDao<News> newsDao;
    private BaseDao<Profile> profileDao;
    private OpportunityDao opportunityDao;

    /**
     * This will be called when an opportunity created by an employer is applied for
     * notificationType will be EmployerNotificationType.OPPORTUNITY_APPLIED;
     * notifier id will be the ID of the employee who applied for opportunity;
     * ntificationEventId will be the id of the opportunity that was applied for;
     * notified array will be null as it is of no use;
     * <p/>
     * The notified id will be the employer who created the opportunity.
     *
     * @param notification
     * @return
     */
    protected List<UserNews> handleNotification(EmployerNotification notification) {

        long opportunityId = notification.getNotificationEventId();
        Opportunity opportunity = new Opportunity();
        opportunity = opportunityBaseDao.findByPrimaryKey(opportunity, opportunityId);
        News news = new News();
        User newsOwner = opportunityDao.getEmployerForOpportunity(opportunityId);

        long employeeAppliedForOpp = notification.getNotifier();
        Profile sender = profileDao.findByPrimaryKey(new Profile(), employeeAppliedForOpp);

        List<UserNews> userNewsList = new ArrayList<UserNews>();

        String displayName = "";
        if (sender instanceof EmployerProfile) {
            displayName = ((Employer) sender.getProfileOwner()).getEmplrOrgName();
        } else {
            displayName = sender.getName();
        }

        String newsMessage = sender.getName() + " " + Messages.OPPORTUNITY_APPLIED_FOR + " " + opportunity.getTitle();
        news.setNews(newsMessage);
        news.setNewsOwner(newsOwner);

        Calendar time = Calendar.getInstance();
        time.setTimeInMillis(System.currentTimeMillis());
        Date createdDate = time.getTime();
        news.setCreatedDate(createdDate);
        newsDao.save(news);
        UserNews userNews = new UserNews(newsMessage, newsOwner.getId());
        userNewsList.add(userNews);

        return userNewsList;
    }

    public BaseDao<User> getUserDao() {
        return userDao;
    }

    public void setUserDao(BaseDao<User> userDao) {
        this.userDao = userDao;
    }

    public BaseDao<News> getNewsDao() {
        return newsDao;
    }

    public void setNewsDao(BaseDao<News> newsDao) {
        this.newsDao = newsDao;
    }

    public BaseDao<Opportunity> getOpportunityBaseDao() {
        return opportunityBaseDao;
    }

    public void setOpportunityBaseDao(BaseDao<Opportunity> opportunityBaseDao) {
        this.opportunityBaseDao = opportunityBaseDao;
    }

    public OpportunityDao getOpportunityDao() {
        return opportunityDao;
    }

    public void setOpportunityDao(OpportunityDao opportunityDao) {
        this.opportunityDao = opportunityDao;
    }

    public void setProfileDao(BaseDao<Profile> profileDao) {
        this.profileDao = profileDao;
    }
}
