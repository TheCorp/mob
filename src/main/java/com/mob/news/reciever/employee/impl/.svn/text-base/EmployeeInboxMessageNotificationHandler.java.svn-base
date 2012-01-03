package com.mob.news.reciever.employee.impl;

import com.mob.dao.BaseDao;
import com.mob.model.User;
import com.mob.model.employer.Employer;
import com.mob.news.EmployeeNotification;
import com.mob.news.Messages;
import com.mob.news.model.News;
import com.mob.news.reciever.UserNews;
import com.mob.util.MOBLogger;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.ArrayList;

/**
 * Created by IntelliJ IDEA.
 * User: ezone
 * Date: Mar 13, 2009
 * Time: 1:20:45 AM
 * To change this template use File | Settings | File Templates.
 */
public class EmployeeInboxMessageNotificationHandler extends BaseEmployeeNotificationHandler{
   /**
      * Logger for logging messages.
      */
     private static final MOBLogger LOGGER =
             new MOBLogger(EmployeeInboxMessageNotificationHandler.class);


    private BaseDao<User> userDao;
    private BaseDao<News> newsDao;

    public void setNewsDao(BaseDao<News> newsDao) {
        this.newsDao = newsDao;
    }

    public void setUserDao(BaseDao<User> userDao) {
        this.userDao = userDao;
    }

    public List<UserNews> handleNotification(EmployeeNotification notification) {
        LOGGER.info("Handling inbox message notification");
        //To change body of implemented methods use File | Settings | File Templates.
        long messageId = notification.getNotificationEventId();
        long[] messageRecievers = notification.getNotified();
        long messageSender = notification.getNotifier();
        User sender = userDao.findByPrimaryKey(new User(), messageSender);

        List<UserNews> userNewsList = new ArrayList<UserNews>(messageRecievers.length);
        for(Long recieverId:messageRecievers){
            LOGGER.info("Storing reciever " + recieverId);
            User newsOwner = new User();
            newsOwner.setId(recieverId);
            String displayName = "";
             if(sender instanceof Employer){
                 displayName = ((Employer)sender).getEmplrOrgName();
             }else{
                 displayName = sender.getDisplayName();
             }

            String newsMessage = displayName + " " + Messages.MESSAGE_RECEIVED;
            News news = new News();
            news.setNews(newsMessage);
            news.setNewsOwner(newsOwner);

            Calendar time = Calendar.getInstance();
            time.setTimeInMillis(System.currentTimeMillis());
            Date createdDate = time.getTime();
            news.setCreatedDate(createdDate);
            newsDao.save(news);
            UserNews userNews = new UserNews(newsMessage,recieverId);
            userNewsList.add(userNews);
            LOGGER.info("Stored the news");
        }
        return userNewsList;
    }
}
