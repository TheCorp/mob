package com.mob.news.cache;

import com.mob.util.MOBLogger;

import java.util.List;
import java.util.ArrayList;

/**
 * Created by IntelliJ IDEA.
 * User: ezone
 * Date: Mar 13, 2009
 * Time: 2:21:13 AM
 * To change this template use File | Settings | File Templates.
 */
public class NewsCache {
    private static final MOBLogger LOGGER =
              new MOBLogger(NewsCache.class);

    private List<String> daysNews = new ArrayList<String>();
    private List<String> dayBeforesNews = new ArrayList<String>();
    private List<String> weeksNews = new ArrayList<String>();
    private List<String> monthsNews = new ArrayList<String>();
    private List<String> yearsNews = new ArrayList<String>();

    public NewsCache(List<String> dayBeforesNews, List<String> daysNews, List<String> monthsNews,
                     List<String> weeksNews, List<String> yearsNews) {
        this.dayBeforesNews = dayBeforesNews;
        this.daysNews = daysNews;
        this.monthsNews = monthsNews;
        this.weeksNews = weeksNews;
        this.yearsNews = yearsNews;
    }

    public void addNews(String news){
        LOGGER.info("Added news for the day");
        daysNews.add(0,news);
    }

    public List<String> getDayBeforesNews() {
        return dayBeforesNews;
    }

    public List<String> getDaysNews() {
        LOGGER.info("Getting news for the day");
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
