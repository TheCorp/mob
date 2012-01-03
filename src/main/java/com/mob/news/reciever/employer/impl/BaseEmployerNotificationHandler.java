package com.mob.news.reciever.employer.impl;

import com.mob.news.EmployerNotification;
import com.mob.news.cache.NewsCacheManager;
import com.mob.news.reciever.UserNews;
import com.mob.news.reciever.employer.EmployerNotificationHandler;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: ezone
 * Date: Mar 12, 2009
 * Time: 9:44:36 AM
 * To change this template use File | Settings | File Templates.
 */
public abstract class BaseEmployerNotificationHandler implements EmployerNotificationHandler {

    public void handleEmployerNotification(EmployerNotification notification) {
        //To change body of implemented methods use File | Settings | File Templates.
        List<UserNews> userNews = handleNotification(notification);
        for (UserNews news : userNews) {
            NewsCacheManager.updateCache(news.getNewsOwner(), news.getNews());
        }
    }

    protected abstract List<UserNews> handleNotification(EmployerNotification notification);
}
