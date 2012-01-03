package com.mob.view.action.news;

import com.mob.model.User;
import com.mob.news.cache.NewsCache;
import com.mob.news.cache.NewsCacheManager;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;
import org.acegisecurity.context.SecurityContextHolder;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: ezone
 * Date: Mar 13, 2009
 * Time: 3:51:05 AM
 * To change this template use File | Settings | File Templates.
 */
public class LoadNewsAction extends ActionSupport {
    /**
      * Logger for logging messages.
      */
     private static final MOBLogger LOGGER =
         new MOBLogger(LoadNewsAction.class);


    private List<String> daysNews;
    private List<String> dayBeforesNews;
    private List<String> weeksNews;
    private List<String> monthsNews;
    private List<String> yearsNews;

    public String load() {
        try {
            LOGGER.info("Called to load news");
            User user = (User) SecurityContextHolder.getContext()
                    .getAuthentication().getPrincipal();
            if (user == null) {
                return "error";
            }
            NewsCache cache = NewsCacheManager.obtainCacheFor(user.getId());
            if(cache != null){
                LOGGER.info("Cache loaded");
                daysNews = cache.getDaysNews();
                dayBeforesNews = cache.getDayBeforesNews();
                weeksNews = cache.getWeeksNews();
                monthsNews = cache.getMonthsNews();
                yearsNews = cache.getYearsNews();
            }else{
                LOGGER.info("No Cache");
                return "error";
            }
            LOGGER.info("News Loaded");
            return "success";
        } catch (Exception e) {
            LOGGER.error(e);
            return "error";
        }
    }

    public List<String> getDayBeforesNews() {
        return dayBeforesNews;
    }

    public List<String> getDaysNews() {
        return daysNews;
    }

    public List<String> getMonthsNews() {
        return monthsNews;
    }

    public List<String> getWeeksNews() {
        return weeksNews;
    }

    public List<String> getYearsNews() {
        return yearsNews;
    }
}
