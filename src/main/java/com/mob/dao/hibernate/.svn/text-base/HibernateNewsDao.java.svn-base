package com.mob.dao.hibernate;

import com.mob.dao.NewsDao;
import com.mob.model.User;
import com.mob.news.model.News;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: ezone
 * Date: Mar 13, 2009
 * Time: 3:10:08 AM
 * To change this template use File | Settings | File Templates.
 */
public class HibernateNewsDao extends HibernateDaoSupport
        implements NewsDao {
    public List<String> findAllNewsForToday(User newsOwner) {
        String hql = "Select news from News where newsOwner like ? and createdDate = current_date";
        return (List<String>) getHibernateTemplate().find(hql,newsOwner);
        //To change body of implemented methods use File | Settings | File Templates.
    }

    public List<String> findallNewsForDayBefore(User newsOwner) {
        Calendar cal = Calendar.getInstance();
        cal.setTimeInMillis(System.currentTimeMillis());
        cal.roll(Calendar.DATE,-1);
        Date compareDate = cal.getTime();
        String hql = "Select n.news from News n where n.newsOwner like ? and n.createdDate = ? order by n.createdDate desc";
        return (List<String>) getHibernateTemplate().find(hql,new Object[]{newsOwner,compareDate});
    }

    public List<String> findAllNewsForTheWeek(User newsOwner) {
        Calendar cal = Calendar.getInstance();
        cal.setTimeInMillis(System.currentTimeMillis());
        cal.roll(Calendar.DATE,-7);
        Date compareDate = cal.getTime();
        String hql = "Select n.news from News n where n.newsOwner like ? and n.createdDate >= ?  order by n.createdDate desc";
        return (List<String>) getHibernateTemplate().find(hql, new Object[]{newsOwner,compareDate});
    }

    public List<String> findAllNewsForMonth(User newsOwner) {
        Calendar cal = Calendar.getInstance();
        cal.setTimeInMillis(System.currentTimeMillis());
        cal.roll(Calendar.MONTH,-1);
        Date compareDate = cal.getTime();

        String hql = "Select n.news from News n where n.newsOwner like ? and n.createdDate >= ?  order by n.createdDate desc";
        return (List<String>) getHibernateTemplate().find(hql,new Object[]{newsOwner,compareDate});
    }

    public List<String> findAllNewsForYear(User newsOwner) {
        Calendar cal = Calendar.getInstance();
        cal.setTimeInMillis(System.currentTimeMillis());
        cal.roll(Calendar.YEAR,-1);
        Date compareDate = cal.getTime();

        String hql = "Select n.news from News n where n.newsOwner like ? and n.createdDate >= ?  order by n.createdDate desc";
        return (List<String>) getHibernateTemplate().find(hql,new Object[]{newsOwner,compareDate});
    }
}
