package com.mob.services.impl;

import com.mob.dao.NewsDao;
import com.mob.model.User;
import com.mob.news.EmployeeNotificationService;
import com.mob.news.EmployerNotificationService;
import com.mob.news.cache.NewsCache;
import com.mob.services.NewsManager;
import com.mob.util.MOBLogger;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: ezone
 * Date: Mar 12, 2009
 * Time: 12:45:35 PM
 * To change this template use File | Settings | File Templates.
 */
public class NewsManagerImpl implements NewsManager {
    private static final MOBLogger LOGGER =
              new MOBLogger(NewsManagerImpl.class);

    private EmployeeNotificationService employeeNotificationService;
    private EmployerNotificationService employerNotificationService;
    private NewsDao newsDao;

    public void setNewsDao(NewsDao newsDao) {
        this.newsDao = newsDao;
    }

    public void setEmployerNotificationService(EmployerNotificationService employerNotificationService) {
        this.employerNotificationService = employerNotificationService;
    }

    public void setEmployeeNotificationService(EmployeeNotificationService notificationService){
        this.employeeNotificationService = notificationService;
    }
//    private EmployerNotificationService employerNotificationService;
    public void messageRecieved(long sender, long[] reciever, long messageId) {
        //To change body of implemented methods use File | Settings | File Templates.
        employeeNotificationService.messageRecieved(reciever,messageId, sender);
    }

    public void employerViewedEmployeeProfile(long employerId, long[] employeeIds) {
        //To change body of implemented methods use File | Settings | File Templates.
        LOGGER.info("Sending notification");
        employeeNotificationService.profileViewedByEmployer(employeeIds,employerId);
    }

    public void employerMarkedEmployeeProfile(long employerId, long[] employeeIds) {
        employeeNotificationService.profileMarkedAsFavByEmployer(employeeIds,employerId);
          //To change body of implemented methods use File | Settings | File Templates.
    }

    public void employeeAppliedForOpportunity(long employeeId, long opportunityId) {
        //To change body of implemented methods use File | Settings | File Templates.
        employerNotificationService.opportunityAppliedFor(opportunityId,employeeId);
    }

    public void employeeMarkedOpportunityAsFavorite(long employeeId, long opportunityId) {
        //To change body of implemented methods use File | Settings | File Templates.
        employerNotificationService.opportunityMarked(opportunityId,employeeId);        
    }

    public NewsCache initNewsCache(User newsOwner) {
        LOGGER.info("Initializing the news cache manager");
        List<String> daysNews = newsDao.findAllNewsForToday(newsOwner);
        List<String> dayBeforesNews =  newsDao.findallNewsForDayBefore(newsOwner);
        List<String> weeksNews = newsDao.findAllNewsForTheWeek(newsOwner);
        List<String> monthsNews = newsDao.findAllNewsForMonth(newsOwner);
        List<String> yearsNews = newsDao.findAllNewsForYear(newsOwner);
        LOGGER.info("Initialized the news cache manager");
        return new NewsCache(dayBeforesNews,daysNews,monthsNews,weeksNews,yearsNews);
        //To change body of implemented methods use File | Settings | File Templates.
    }
}
