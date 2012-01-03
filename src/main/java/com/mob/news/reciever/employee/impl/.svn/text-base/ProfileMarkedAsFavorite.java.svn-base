package com.mob.news.reciever.employee.impl;

import com.mob.dao.BaseDao;
import com.mob.model.User;
import com.mob.model.employer.Employer;
import com.mob.news.model.News;
import com.mob.news.reciever.UserNews;
import com.mob.news.EmployeeNotification;
import com.mob.news.Messages;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: ezone
 * Date: Mar 14, 2009
 * Time: 12:49:27 PM
 * To change this template use File | Settings | File Templates.
 */
public class ProfileMarkedAsFavorite extends BaseEmployeeNotificationHandler {

    private BaseDao<User> userBaseDao;
    private BaseDao<News> newsBaseDao;

    /**
     * This will be called when an Employer views an employee's profile
     * notificationType will be EMPLOYER_MARKED_AS_FAVORITE;
     * notifier id will be the ID of the employer who marked the profile as favorite;
     * ntificationEventId will be -1 as it is not of use;
     * notified array will have one id, which will be the id of the user whose profile was marked as favorite;
     * <p/>
     * The notified id will be the owner of the news.
     *
     * @param notification
     * @return
     */
    protected List<UserNews> handleNotification(EmployeeNotification notification) {
        long messageSender = notification.getNotifier();
        long[] messageRecievers = notification.getNotified();

        User sender = userBaseDao.findByPrimaryKey(new User(), messageSender);
        List<UserNews> userNewsList = new ArrayList<UserNews>(messageRecievers.length);

        for (int i = 0; i < messageRecievers.length; i++) {
            User newsOwner = new User();
            String displayName = "";
            if (sender instanceof Employer) {
                displayName = ((Employer) sender).getEmplrOrgName();
            } else {
                displayName = sender.getDisplayName();
            }

            String newsMessage = displayName + " " + Messages.EMPLOYER_MARKED_AS_FAVORITE;
            newsOwner = userBaseDao.findByPrimaryKey(newsOwner, messageRecievers[i]);
            News news = new News();
            news.setNewsOwner(newsOwner);
            news.setNews(newsMessage);

            Calendar time = Calendar.getInstance();
            time.setTimeInMillis(System.currentTimeMillis());
            Date createdDate = time.getTime();
            news.setCreatedDate(createdDate);

            newsBaseDao.save(news);

            UserNews userNews = new UserNews(newsMessage, messageRecievers[i]);
            userNewsList.add(userNews);

        }
        return userNewsList;  //To change body of implemented methods use File | Settings | File Templates.
    }

    public BaseDao<User> getUserBaseDao() {
        return userBaseDao;
    }

    public void setUserBaseDao(BaseDao<User> userBaseDao) {
        this.userBaseDao = userBaseDao;
    }

    public BaseDao<News> getNewsBaseDao() {
        return newsBaseDao;
    }

    public void setNewsBaseDao(BaseDao<News> newsBaseDao) {
        this.newsBaseDao = newsBaseDao;
	}
}
