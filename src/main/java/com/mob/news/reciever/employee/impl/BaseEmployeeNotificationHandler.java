package com.mob.news.reciever.employee.impl;

import com.mob.news.EmployeeNotification;
import com.mob.news.cache.NewsCacheManager;
import com.mob.news.reciever.UserNews;
import com.mob.news.reciever.employee.EmployeeNotificationHandler;
import com.mob.util.MOBLogger;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: ezone
 * Date: Mar 13, 2009
 * Time: 1:18:54 AM
 * To change this template use File | Settings | File Templates.
 */
public abstract class BaseEmployeeNotificationHandler implements EmployeeNotificationHandler {
    private static final MOBLogger LOGGER =
              new MOBLogger(BaseEmployeeNotificationHandler.class);

    /**
     * This will handle the employer related notifications
     * @param notification
     */
    public void handleEmployeeNotification(EmployeeNotification notification){
        LOGGER.info("Handling employee notification");
        List<UserNews> userNews = handleNotification(notification);

        for(UserNews news:userNews){
            NewsCacheManager.updateCache(news.getNewsOwner(),news.getNews());
        }
    }

    protected abstract List<UserNews> handleNotification(EmployeeNotification notification) ;
}
