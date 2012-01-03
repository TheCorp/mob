package com.mob.dao;

import com.mob.model.User;
import com.mob.news.model.News;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: ezone
 * Date: Mar 13, 2009
 * Time: 3:05:46 AM
 * To change this template use File | Settings | File Templates.
 */
public interface NewsDao {

    List<String> findAllNewsForToday(User newsOwner);
    List<String> findallNewsForDayBefore(User newsOwner);
    List<String> findAllNewsForTheWeek(User newsOwner);
    List<String> findAllNewsForMonth(User newsOwner);
    List<String> findAllNewsForYear(User newsOwner);
}
